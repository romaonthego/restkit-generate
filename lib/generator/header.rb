module Generator
  
  module Header
    
    def self.make
      props = []
      model_name = Generator.config[:model_name]
      Generator.properties.each{|key, value| props << "@property (nonatomic, #{value[:type] == "NSString" ? "copy" : "strong"}) #{value[:type]} *#{key};" }
      
      header =
        "//\n"+ 
        "//  Base#{model_name}.h\n"+
        "//\n\n"+
        "#import <Foundation/Foundation.h>\n"+
        "#import <RestKit/RestKit.h>\n\n"+
        "@interface Base#{model_name} : NSObject <NSCoding>\n\n"+
        props.join("\n")+"\n\n"+
        "+ (RKObjectMapping *)objectMapping;\n\n"+
        "@end"
      
      if Generator.config[:verbose]
        puts header
      end
      
      File.open("Base#{model_name}.h", 'w') {|f| f.write(header) }
    end
    
  end
  
end