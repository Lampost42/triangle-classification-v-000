class Triangle
  attr_accessor :side1, :side2, :side3
  
  @sides = []
  
  def initialize(side1, side2, side3)
    @side3 = side3
    @side2 = side2
    @side1 = side1
    @sides << side1
    @sides << side2
    @sides << side3
  end
  
  def kind
    if @sides.any?{|side| side <= 0} || (@side1 + @side2) < @side3 || (@side1 + @side3) < @side2 || (@side3 + @side2) < @side1
      begin
        raise TriangleError
      rescue TriangleError => error
          puts error.message
      end
    elsif @side1 == @side2 && @side1 == @side3
      :equilateral
    elsif @side1 == @side2 || @side1 == @side3 || @side2 == @side3
      :isosceles
    else
      :scalene
    end
  end
  
  class TriangleError < StandardError
    def message
      "Not a triangle"
    end
  end
  
end
