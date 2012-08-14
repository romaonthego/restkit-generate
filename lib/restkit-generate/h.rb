module RestKitGenerate
  class H
    def initialize
      props = []
      model_name = RestKitGenerate.config[:model_name]
      prefix = RestKitGenerate.config[:prefix]
      RestKitGenerate.properties.each{|key, value| props << "@property (nonatomic, #{value[:type] == "NSString" ? "copy" : "strong"}) #{value[:type]} *#{key};" }

      erb = ERB.new(File.read(File.join('..', 'lib', 'restkit-generate', 'nsobject.h.erb')))
      result = erb.result(binding)

      if RestKitGenerate.config[:verbose]
        puts result
      end
      File.open("#{prefix}#{model_name}.h", 'w') {|f| f.write(result) }
    end
  end
end