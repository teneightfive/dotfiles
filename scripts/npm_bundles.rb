#!/usr/bin/env ruby

puts "Running Node version: #{`node --version`}"
npms = {
  # module name => module command
  # leave command blank if they are the same
  "apiconnect" => "apic",
  "azure-cli" => "azure",
  "casperjs" => "",
  "dalek-cli" => "dalek",
  "express" => "",
  "gh" => "",
  "grunt-cli" => "grunt",
  "gulp" => "",
  "handlebars" => "",
  "html2jade" => "",
  "hubot" => "",
  "jscs" => "",
  "jshint" => "",
  "mocha" => "",
  "nodemon" => "",
  "phantomjs" => "",
  "sails" => "",
  "yo" => "",
}

npms.each do |mod, command|
  cmd = (command == "" ? mod : command)
  if `which #{cmd}` == ""
    puts "Installing #{mod}"
    `npm install #{mod} -g`
  end
end
