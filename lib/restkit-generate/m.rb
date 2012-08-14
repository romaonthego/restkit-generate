module RestKitGenerate
  class M
    def initialize
      model_name = RestKitGenerate.config[:model_name]
      prefix = RestKitGenerate.config[:prefix]
      mapping = []
      decoders = []
      encoders = []
      tab = "    "
      RestKitGenerate.properties.each{|key, value| mapping << "#{tab}@\"#{value[:original_name]}\", @\"#{key}\"" }
      RestKitGenerate.properties.each{|key, value| decoders << "#{tab}[coder encodeObject:self.#{key} forKey:@\"#{key}\"];" }
      RestKitGenerate.properties.each{|key, value| encoders << "#{tab}#{tab}self.#{key} = [coder decodeObjectForKey:@\"#{key}\"];" }

      erb = ERB.new(File.read(File.join('..', 'lib', 'restkit-generate', 'nsobject.m.erb')))
      result = erb.result(binding)

      if RestKitGenerate.config[:verbose]
        puts result
      end

      File.open("#{prefix}#{model_name}.m", 'w') {|f| f.write(result) }
    end
  end
end
