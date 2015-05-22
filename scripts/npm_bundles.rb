#!/usr/bin/env ruby

puts "Running Node version: #{`node --version`}"
npms = {
  # module name => module command
  # leave command blank if they are the same
  "bower" => "",
  "casperjs" => "",
  "coffee-script" => "coffee",
  "dalek-cli" => "dalek",
  "express" => "",
  "gh" => "",
  "grunt-cli" => "grunt",
  "gulp" => "",
  "html2jade" => "",
  "hubot" => "",
  "jscs" => "",
  "jshint" => "",
  "keybase" => "",
  "mocha" => "",
  "nodemon" => "",
  "phantomjs" => "",
  "protractor" => "",
  "sails" => "",
  "yo" => "",
}

npms.each do |mod, command|
  cmd = (command == "" ? mod : command)
  if `which #{cmd}` == ""
    puts "Installing #{mod}"
    `npm install #{mod} -g --silent`
  end
end

# always run the very latest npm, not just the one that was bundled into Node
`npm install npm -g --silent`
