# ---- HASHES -----

# My favourite way of writing hashes as someone who learned JS before ruby
# It's just so nice and succinct

loaf = {colour: "orange", fluff_level: "mega floof", age: "baby", actual_age: 4}

# To access Loaf's colour with this way
p loaf[:colour]
# Other ways of writing hashes

# I don't like this one. Very extra and too many strings.
loaf = {"colour" => "orange", "fluff_level" => "mega floof", "age" => "baby", "actual_age" => 4 }
p loaf["fluff_level"]

# This one is nicer. You get proper syntax highlighting so its acceptable and you have lovely symbols. Still extra.
loaf = {:colour => "orange", :fluff_level => "mega floof", :age => "baby", :actual_age => 4}
p loaf[:age]

# note: symbols are cool. only one copy of a symbol exists (therefore, in fancy language they are immutable)
# this saves memory and means they are faster at allowing you to access values than strings as keys in hashes


# --- FLATTENING ARRAY ----
cool_coordinates = [[0, [0, 3, ["cool", "beans"]]], [3 , 5], [7,8]]
# You can use Ruby's very convenient flatten method to do this for you. 
# However, that seems way too easy so i will attempt to flatten the array in ruby myself manually

$new_array = []
def cool_flatten(array)
        array.map { |element|
            if element.is_a?(Array)
                cool_flatten(element)
            else 
                $new_array.push(element)
            end
        }
        return $new_array
end

p cool_flatten(cool_coordinates)