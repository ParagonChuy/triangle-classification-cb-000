class Triangle

  attr_reader :a, :b, :c

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def kind
    validate_triangle
    if a == b && b == c
      :equilateral
    elsif (a == b) || (b == c) || (a == c)
      :isosceles
    else
      :scalene
    end
  end

  def validate_triangle
    # No one side is greater than the sum of its two adjacent legs
    triangle_cases = [(a + b > c), (a + c > b), (b + c > a)]
    [a, b, c].each {|side| triangle_cases << false if side <= 0}
    raise TriangleError if triangle_cases.include?(false)
  end

end

class TriangleError < StandardError
end
