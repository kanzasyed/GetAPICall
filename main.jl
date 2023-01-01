using HTTP
using JSON3
function GetCall(url)
    try
        response = HTTP.get(url)
        return String(response.body)
    catch e
        return "Error occurred : $e"
    end
end
print("Enter pokemon name ? \n\n")
pokemonName=readline()
url="https://pokeapi.co/api/v2/pokemon/"*lowercase(pokemonName)
response = GetCall(url)
jobj = JSON3.read(response)
types=jobj.types
resultArray=[];
for i in types
  push!(resultArray, i.type.name)
end
# println(resultArray)
#=using a loop and calling show on the elements one by one, you can avoid allocating a bunch of strings just to print them as in the code above, but as this the code isn’t performance critical I wouldn’t worry about it.=#

println('[', join(repr.(resultArray),", "), ']')
