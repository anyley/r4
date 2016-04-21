# expression      ::= factor | expression operator expression
# factor          ::= number | identifier | assignment | '(' expression ')'
# assignment      ::= identifier '=' expression

# operator        ::= '+' | '-' | '*' | '/' | '%'

# identifier      ::= letter | '_' { identifier-char }
# identifier-char ::= '_' | letter | digit

# number          ::= { digit } [ '.' digit { digit } ]

# letter          ::= 'a' | 'b' | ... | 'y' | 'z' | 'A' | 'B' | ... | 'Y' | 'Z'
# digit           ::= '0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' | '8' | '9'

class Interpreter
  def initialize
    @rules = {
      expression: [[:factor], [:expression, :operator, :expression]],
      factor: [[:number], [:identifier], [:assignment], [:sub_expression]],
      assignment: [[:identifier, :assign, :expression]],
      sub_expression: [[:open_expr, :expression, :close_expr]]
      # operator: :keywords,
      # number: :keywords,
      # identifier: :keywords,
      # open_expr: :keywords,
      # close_expr: :keywords
    }
    @keywords = {
      identifier: /[_a-z]+[_a-z0-9]/i,
      open_expr: /\(+/,
      close_expr: /\)+/,
      assign: /=+/,
      operator: /[\+\-\*\/\%]+/,
      number: /[0-9]*\.?[0-9]+/
    }
    @vars = {}
    @functions = {}
    @tokens = []
    @counter = 0
  end  

  def find_rule token_id, root, parent=[], prev=[]
    @counter += 1
    return if @counter > 20
    puts "\t#{token_id}, #{token_id.class}, #{root}, #{parent}"
    result = nil
    if root.class == Array
      return parent if @keywords.include?(token_id) and root.include?(token_id)
      root.each do |rule|
          puts "*** #{rule}, #{rule.class}"
        if rule.class==Array
          result = find_rule token_id, rule, parent
        elsif !@keywords.include? rule
          result = find_rule token_id, @rules[rule], parent + [rule]
        end
      end
    elsif root.class == Hash
      return root[token_id] if root.has_key?(token_id)
      root.each do |key, rule|
        result = find_rule token_id, rule, parent + [key]
      end
    end
    result
  end

  def compile tokens
    tokens.select do |token|
      # puts token
      token_id = match_token token
      if token_id
        p find_rule token_id, @rules
      end
    end
  end

  def match_token token
    @keywords.each do |key, reg|
      # puts "#{key}: #{token}" if reg =~ token
      return key if reg =~ token
    end
    nil
  end


  def input expr
    # your code here - feel free to use and/or modify the provided tokenizer
    @tokens = tokenize(expr).map{|a|a[0]}
    compile @tokens
    0
  end

  private

  def tokenize program
    return [] if program == ''

    regex = /\s*([-+*\/\%=\(\)]|[A-Za-z_][A-Za-z0-9_]*|[0-9]*\.?[0-9]+)\s*/
    program.scan(regex).select { |s| !(s =~ /^\s*$/) }
  end
end


#inter = Interpreter.new
#inter.input('_abc_123=1')

require 'benchmark'

def fib n, cache={}
  return n if n < 2
  return cache[n] if cache.has_key? n
  cache[n] = fib(n-1, cache) + fib(n-2, cache)
end

def fib2 n
  Hash.new{|hash, n| hash[n] = (n>=0 && n<2) ? n : hash[n-2] + hash[n-1] }[n] if n >= 0
  Hash.new{|hash, n| hash[0]=0; hash[-1]=1; hash[-2]=0;hash[-3]=-2;hash[-4]=-3; hash[n] = (n<-4) ? hash[n] : hash[n+2] + hash[n+1] }[n]
end


Benchmark.bm do |b|
    b.report {
      p fib(100)
    }
    b.report {
      p fib2(-6)
    }
end



