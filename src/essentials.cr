require "num"

macro for(definition, condition, incrimentation, &block)
  {{definition}}
  while {{condition}}
    {{block.body}}
    {{incrimentation}}
  end
end

macro for(expr)
  ({{expr.args.first.args.first}}).each do |{{expr.name.id}}|
    {{expr.args.first.block.body}}
  end
end

macro func(expression)
  def {{ expression.name }}({{ expression.args.first.args.first }}{% for arg in expression.args.first.args[1, expression.args.first.args.size - 1] %}, {{arg}} = {{expression.args.first.args.first}}{% end %})
    {{expression.args.first.block.body}}
  end
end

macro evaluate(expression)
  Tensor.new nrows: {{ expression.args.first.args.first }}.size, ncols: {{ expression.args.first.args.last }}.size do |%x, %y|
    {{ expression.name }} x: {{ expression.args.first.args.first }}[%x].value, y: {{ expression.args.first.args.last }}[%y].value
  end
end

macro method_alias(expression)
  def {{ expression.target }}(*args)
    {{ expression.value }}(*args)
  end
end



