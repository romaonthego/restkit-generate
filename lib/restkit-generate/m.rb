module RestKitGenerate
  class M
    def initialize
      model_name = RestKitGenerate.config[:model_name]
      prefix = RestKitGenerate.config[:prefix]
      mapping = []
      decoders = []
      encoders = []
      RestKitGenerate.properties.each{|key, value| mapping << "\t@\"#{value[:original_name]}\", @\"#{key}\"" }
      RestKitGenerate.properties.each{|key, value| decoders << "\t[coder encodeObject:self.#{key} forKey:@\"#{key}\"];" }
      RestKitGenerate.properties.each{|key, value| encoders << "\t\tself.#{key} = [coder decodeObjectForKey:@\"#{key}\"];" }

      erb = ERB.new(File.read(File.join('..', 'lib', 'restkit-generate', 'nsobject.m.erb')))
      result = erb.result(binding)

      if RestKitGenerate.config[:verbose]
        puts result
      end

      File.open("#{prefix}#{model_name}.m", 'w') {|f| f.write(result) }
    end
  end
end
