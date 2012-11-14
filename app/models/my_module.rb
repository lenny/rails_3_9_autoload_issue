puts "#{__FILE__} is being loaded"

# my_module/something_optional will be loaded even though
# nothing ever referenced the :MyModuleFoo constant
autoload :MyModuleFoo, 'my_module/something_optional'

module MyModule
  # I found that if I commented the above autoload out
  # and replaced it with this, everything worked fine.
  # autoload :SomethingOptional, 'my_module/something_optional'
end


