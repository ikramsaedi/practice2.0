# block demo
# they are anonymous functions 

# each is an example of blocks
arr1 = [0, 1, 2].each do |num|
     num + 1
end
# each returns the original array
puts "each: #{arr1}"

# alternative to each that returns a copy of og array (like map in js)
arr = [0,1,2].collect do |num|
    num + 1
end
puts "collect: #{arr}"

## --- YIELD --- ##

def yield_demo
    puts "before yield"
    yield
    puts "after yield"
end
# yield acts as placeholder
# you pass the method a block of some sort and then yield will return whatever the output of that block is

yield_demo {puts "yield"}
# before yield
# yield
# after yield

def yield_demo2(param)
    puts "before yield1"
    yield("idk")
    puts " before yield 2"
    yield(param)
    puts "end"
end

yield_demo2("hi")
# This blows up -> needs a block

yield_demo2("hi") {puts "cool"}
# doesn't work since we are passing params to yield. just prints "yield".

yield_demo2("param") { |n| puts "string: #{n}."}
# "string: idk"
# "string: param"


## -- PROCS & LAMBDAS -- ##
def proc_demo 
    p = Proc.new {return "hey"}
    # alternatively
    p2 = proc {return "hey"}
    p.call
    return "im never called :("
end

puts proc_demo
# never reaches the last statement.
# a return from a proc means anything after that is not called.
# it exits the whole method

def lambda_demo
    l = lambda {return "im a lambda"}
    # alternatively
    l2 = -> {return "im lambda 2.0"}
    l.call
    return "im the only one printed bc im special"
end
puts lambda_demo
# only the last statement is printed -- this is because when the lambda is called
# it doesn't entirely break out of the function (returns to whatever called it instead of returning immediately)


l_params = lambda { |x| puts "#{x} params"}
[0, 1, 2].each(&l_params) # the '&' turns the block, lambda or whatever into a proc and names it. This is not passed in as a parameter, but as a named proc


## --- DIFFERENCES --- ##
# procs don't care about how many arguments they receive (would silently fail)
# lambdas do care and will throw an error

# procs return from the current method while lambdas return from the lambda itself

# lambdas are a special type of proc

# lambdas are generally the preferred of the two because of the strictness of a lambda (checks its params etc)
# procs are good if you want to immediately exit a function after its call

