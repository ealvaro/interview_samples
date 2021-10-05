def foo(bar)
  bar = 'reference'
end
baz = 'value'
foo(baz)
puts "Ruby is pass-by-#{baz}"

def arr_foo_ref(bar)
  bar[0] = 999
end
baz = [0,1,2,3,4,5]
arr_foo_ref baz
puts "Ruby is pass-by-#{baz[0]}"

def arr_foo_val(bar)
  bar = [999,2,3,4,5]
end
baz = [0,1,2,3,4,5]
arr_foo_val baz
puts "Ruby is pass-by-#{baz}"