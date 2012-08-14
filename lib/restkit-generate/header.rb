module RestKitGenerate
  module Header
    def self.make
      props = []
      model_name = RestKitGenerate.config[:model_name]
      prefix = RestKitGenerate.config[:prefix]
      RestKitGenerate.properties.each{|key, value| props << "@property (nonatomic, #{value[:type] == "NSString" ? "copy" : "strong"}) #{value[:type]} *#{key};" }

      header =
        "//\n"+
        "//  #{prefix}#{model_name}.h\n"+
        "//  Command: #{$0} model #{model_name} #{ARGV.join( ' ' )}\n"+
        "//\n\n"+
        "#import <Foundation/Foundation.h>\n"+
        "#import <RestKit/RestKit.h>\n\n"+
        "@interface #{prefix}#{model_name} : NSObject <NSCoding>\n\n"+
        props.join("\n")+"\n\n"+
        "+ (RKObjectMapping *)objectMapping;\n\n"+
        "@end"

      if RestKitGenerate.config[:verbose]
        puts header
      end

      File.open("#{prefix}#{model_name}.h", 'w') {|f| f.write(header) }
    end
  end
end