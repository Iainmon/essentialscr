# Crystal Lang Essential Macros

## Installation

```
dependencies:
  essentials:
    github: iainmon/essentialscr
    branch: master
```

## for loops

```crystal
require "essentials"
```

```crystal
array = [1, 2, 3, 4, 5]

for a in array do
  puts a
end
```

```crystal
for i = 0, i < array.size, i += 1 do
    puts array[i]
end
```

## method_alias

```crystal
method_alias domain = Num.arange
method_alias sin = Math.sin
method_alias read_file = File.read
```

## func

```crystal
func f of x, y do
  Math.sqrt x**2 + y**2
end

z = f 1, 1

# z = sqrt 2
```

