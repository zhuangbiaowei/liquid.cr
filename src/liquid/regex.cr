module Liquid
  OPERATOR = /==|!=|<=|>=|<|>/
  GVAR     = /[a-z_][a-z_0-9]*(\.[a-z_][a-z_0-9]*)*/
  VAR      = /[a-z_][a-z_0-9]*(?:\.[a-z_][a-z_0-9]*)*/

  STRING      = /[^"]*/
  INT         = /-?[1-9][0-9]*/
  FLOAT       = /#{INT}\.[0-9]+/
  TYPE        = /(?:#{STRING})|(?:#{FLOAT})|(?:#{INT})/
  TYPE_OR_VAR = /(?:#{TYPE})|(?:#{VAR})/
  CMP         = /(?:#{TYPE_OR_VAR}) ?(?:#{OPERATOR}) ?(?:#{TYPE_OR_VAR})/
  GCMP        = /(?<left>#{TYPE_OR_VAR}) ?(?<op>#{OPERATOR}) ?(?<right>#{TYPE_OR_VAR})/

  GSTRING = /^"(?<str>[^"]*)"$/
  GINT    = /(?<intval>#{INT})/
  GFLOAT  = /(?<floatval>#{FLOAT})/

  FILTER    = /#{VAR}(?:: ?#{TYPE_OR_VAR}(?:, ?#{TYPE_OR_VAR})*)?/
  GFILTER   = /(?<filter>#{VAR})(?:: ?(?<args>#{TYPE_OR_VAR}(?:, ?#{TYPE_OR_VAR})*))?/
  FILTERED  = /#{TYPE_OR_VAR}(?:\s?\|\s?#{FILTER})+/
  GFILTERED = /(?<first>#{TYPE_OR_VAR})(\s?\|\s?(#{FILTER}))+/

  EXPR = /\s*(?<left>#{VAR}) ?(?<op>#{OPERATOR}) ?(?<right>#{TYPE})\s*/

  MULTIPLE_EXPR = /(?: (?<op>or|and) )?(?<expr>#{CMP})/
end
