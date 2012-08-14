module RestKitGenerate
  module MakeFile
    def self.make
      model_name = RestKitGenerate.config[:model_name]
      prefix = RestKitGenerate.config[:prefix]
      mapping = []
      decoders = []
      encoders = []
      RestKitGenerate.properties.each{|key, value| mapping << "	@\"#{value[:original_name]}\", @\"#{key}\"" }
      RestKitGenerate.properties.each{|key, value| decoders << "	[coder encodeObject:self.#{key} forKey:@\"#{key}\"];" }
      RestKitGenerate.properties.each{|key, value| encoders << "		self.#{key} = [coder decodeObjectForKey:@\"#{key}\"];" }

      source =
        "//\n"+
        "//  #{prefix}#{model_name}.m\n"+
        "//\n\n"+

        "#import \"#{prefix}#{model_name}.h\"\n\n"+
        "@implementation #{prefix}#{model_name}\n\n"+
        "+ (RKObjectMapping *)objectMapping\n"+
        "{\n"+
        "	RKObjectMapping* mapping = [RKObjectMapping mappingForClass:[self class]];\n"+
        "	[mapping mapKeyPathsToAttributes:\n"+
        mapping.join(",\n")+", nil];\n"+
        "	return mapping;\n"+
        "}\n\n"+

        "- (id)initWithCoder:(NSCoder *)coder\n"+
        "{\n"+
        "	self = [[[self class] alloc] init];\n"+
        "	if (self) {\n"+
        encoders.join("\n")+"\n"+
        "	}\n"+
        "	return self;\n"+
        "}\n\n"+

        "- (void)encodeWithCoder:(NSCoder *)coder\n"+
        "{\n"+
        decoders.join("\n")+"\n"+
        "}\n\n"+

        "@end"

      if RestKitGenerate.config[:verbose]
        puts source
      end

      File.open("#{prefix}#{model_name}.m", 'w') {|f| f.write(source) }
    end
  end
end
