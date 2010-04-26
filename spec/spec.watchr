#! /bin/ruby

puts "\n--- watchr initialized ---\n\n"

def cmd() 'bacon '; end

def run_all_specs
  system(cmd + Dir['spec/**/*_spec.rb'].join(' '))
end

def run_spec(spec)
  puts "Running #{spec}"
  system(cmd + spec)
  puts
end

watch('^spec/.*_spec\.rb') {|md| run_spec(md[0]) }
watch('^lib/(.*)\.rb') {|md| run_spec("spec/#{md[1]}_spec.rb") }
watch('^app/(.*)\.rb') {|md| run_spec("spec/#{md[1]}_spec.rb") }
watch('^app/(.*\.haml)') {|md| run_spec("spec/#{md[1]}_spec.rb") }
watch('spec/spec_helper.rb') {|md| run_all_specs }

# Ctrl-\
Signal.trap('QUIT') do
  puts "\n--- Running all tests ---\n"
  run_all_specs
  puts
end
 
# Ctrl-C
Signal.trap('INT') { abort("\n") }
