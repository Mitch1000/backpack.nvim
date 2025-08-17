; extends
([
  "import"
] @backpack.import
(#set! priority 125))


([
  "from"
  "as"
] @backpack.from
(#set! priority 125))

([
  "export"
] @backpack.exp
(#set! priority 125))

([
  "default"
] @backpack.default
(#set! priority 125))

(pair
  key: (property_identifier) @backpack.function.arrow.arrow.method
  value: (arrow_function)(#set! priority 125))

(assignment_expression
  left: (member_expression
    property: (property_identifier) @backpack.function.arrow.method)
  right: (arrow_function)(#set! priority 125))

(variable_declarator
  name: (identifier) @backpack.function.arrow
  value: (arrow_function)(#set! priority 125))

(assignment_expression
  left: (identifier) @backpack.function.arrow
  right: (arrow_function)(#set! priority 125))


