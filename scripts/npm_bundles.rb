#!/usr/bin/env ruby

puts "Running Node version: #{`node --version`}"
npms = {
  # module name => module command
  # leave command blank if they are the same
  "bower" => "",
  "browser-sync" => "",
  "casperjs" => "",
  "coffee-script" => "coffee",
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
  "protractor" => "",
  "sails" => "",
  "strongloop" => "slc",
  "yo" => "",
}

npms.each do |mod, command|
  cmd = (command == "" ? mod : command)
  if `which #{cmd}` == ""
    puts "Installing #{mod}"
    `npm install #{mod} -g`
  end
end
