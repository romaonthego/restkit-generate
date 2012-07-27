module Generator
  @@config = {}
  @@properties = {}

  def self.configure(options)
    @@config = options
    if options[:prefix].nil?
      @@config[:prefix] = "Base"
    else
      if !options[:prefix]
        @@config[:prefix] = ""
      end
    end
  end

  def self.config
    @@config
  end

  def self.properties
    @@properties
  end

  def self.validate!
    type = ARGV[0]
    if type != "model"
      raise ArgumentError, "Unknown type '#{type}'.\nRun restkit-generate --help for more information.", caller
    end

    @@config[:model_name] = ARGV[1]
    if @@config[:model_name].nil?
      raise ArgumentError, "Model name can't be empty.", caller
    end

    ARGV.shift(2)
    if ARGV.nil?
      raise ArgumentError, "No input parameters defined.", caller
    end

    ARGV.each do |arg|
      original_name = arg.split(":")[0]
      a = arg.gsub(/_([a-z])/) do |word|
        word.gsub(/_/, "").capitalize
      end

      name = a.split(":")[0]
      name = @@config[:model_name].downcase+"Id" if name == "id"
      type = a.split(":")[1]

      @@properties[name] = {:type => type, :original_name => original_name}
    end
  end
end