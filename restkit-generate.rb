#!/usr/bin/env ruby

type = ARGV[0]
if type != "model"
	$stderr.puts "Unknown type '#{type}'."
	exit(1)
end

model_name = ARGV[1]
if model_name.nil?
	$stderr.puts "Model name can't be empty."
	exit(1)
end

ARGV.shift(2)
if ARGV.nil?
	$stderr.puts "No input parameters defined."
	exit(1)
end

header =
"//
//  #{model_name}.h

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>
					 
@interface #{model_name} : NSObject\n\n"
	
source =
"//
//  #{model_name}.m

#import \"#{model_name}.h\"

@implementation #{model_name}"

source_content = Array.new
synthesize = Array.new

ARGV.each do |arg|
	original_name = arg.split(":")[0]
	a = arg.gsub(/_([a-z])/) do |word|
		word.gsub(/_/, "").capitalize
	end
	name = a.split(":")[0]
	if name == "id"
		name = model_name.downcase+"Id"
	end
	type = a.split(":")[1]
	header += "@property (nonatomic, strong) #{type} *#{name};\n"
	
	source_content << "	 @\"#{original_name}\", @\"#{name}\""
	synthesize << name
end

source += "\n\n@synthesize #{synthesize.join(", ")};"

source += "\n\n+ (RKObjectMapping *)getMapping 
{
	RKObjectMapping* mapping = [RKObjectMapping mappingForClass:[#{model_name} class]];
	[mapping mapKeyPathsToAttributes:\n"

source += source_content.join(",\n")
source += ", nil];
	return mapping;
}\n"

header += "\n@end"
source += "\n@end"

File.open("#{model_name}.h", 'w') {|f| f.write(header) }
File.open("#{model_name}.m", 'w') {|f| f.write(source) }