class Triangle

  attr_accessor :a, :b, :c

  def initialize(a, b, c)
    @a = a.to_f
    @b = b.to_f
    @c = c.to_f
  end

  def judgment
    if is_triangle?
      case edge_type
        when 1 then
          '正三角形ですね！'
        when 2 then
          '二等辺三角形ですね！'
        else
          is_right_triangle? ? '直角三角形ですね！' : '不等辺三角形ですね！'
      end
    else
      '三角形じゃないです＞＜'
    end
  end

  private
  def is_triangle?
    (@a < @b + @c) and (@b < @a + @c) and (@c < @a + @b)
  end

  def edge_type
    [@a, @b, @c].uniq.size
  end

  def is_right_triangle?
    a2 = @a**2
    b2 = @b**2
    c2 = @c**2
    (a2 == b2+c2 or b2 == a2+c2 or c2 == a2+b2)
  end

  def inspect
    "a=#{@a}, b=#{@b}, c=#{@c} #{judgment}"
  end
end

if __FILE__ == $0
  if ARGV.length != 3
    puts '引数が間違っています'
    puts 'usage: ruby triangle.rb 1, 2, 3'
    exit(1)
  end
  a, b, c=ARGV.map { |arg| arg.to_f }
  triangle = Triangle.new(a, b, c)
  puts triangle.judgment
end