local ls = require 'luasnip'
local fmt = require('luasnip.extras.fmt').fmt
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local d = ls.dynamic_node
local f = ls.function_node
local sn = ls.snippet_node

-- Helper to generate parameter docs from function signature
local function get_params_from_signature(args)
  local params = args[1][1] or ''
  local param_list = {}
  for param in string.gmatch(params, '[%w_]+') do
    table.insert(param_list, ' * @param ' .. param .. ' - Description')
  end
  return param_list
end

ls.add_snippets('lua', {
  s('var', {
    t 'local ',
    i(1, 'var'),
    t ' = ',
    i(2, 'value'),
  }),
})

ls.add_snippets('javascript', {
  s('jsdoc', {
    t { '/**', ' * ' },
    t { 'Function: ' },
    i(1, 'functionName'),
    t { '', ' * ' },
    t { 'Description: ' },
    i(2, 'Describe the function here'),
    t { '', ' *' },
    t { ' * @param ' },
    i(3, 'paramType'),
    t { ' ' },
    i(4, 'paramName'),
    t { ' - ' },
    i(5, 'Description'),
    t { '', ' *' },
    t { ' * @returns ' },
    i(6, 'returnType'),
    t { ' - ' },
    i(7, 'Return description'),
    t { '', ' */' },
  }),
})

-- New function snippet
ls.add_snippets('javascript', {
  s('newfunc', {
    -- JSDoc Block
    t { '/**', ' * ' },
    d(1, function(_, snip)
      return sn(1, {
        t 'Function: ',
        i(1, 'functionName'),
      })
    end, {}),
    t { '', ' *' },
    d(2, function(_, snip)
      return sn(1, {
        t { ' Description: ' },
        i(1, 'Describe the function here'),
      })
    end, {}),
    t { '', ' *' },
    d(3, function(_, snip)
      local params = snip.captures[1] or ''
      return sn(nil, {
        f(get_params_from_signature, { 1 }),
      })
    end, { 1 }),
    t { ' *', ' * @returns ' },
    i(4, 'returnType'),
    t { ' - ' },
    i(5, 'Return description'),
    t { '', ' */' },
    -- Function definition
    t { '', 'function ' },
    i(1, 'functionName'),
    t '(',
    i(2, 'params'),
    t { ') {', '\t' },
    i(3, '// Function body'),
    t { '', '}' },
  }),
})
