class Node
  def initialize(x, y, c)
    @x = x
    @y = y
    @cost = c
    @parent = nil
  end

  def s_parent(p)
    @parent = p
  end

  def total_cost
    if @parent != nil
      return @parent.total_cost + cost_from_parent
    else
      return 0
    end
  end

  def value(goal)
    return total_cost + heur(goal)
  end

  def heur(goal)
    return ((@x - goal.g_x).abs + (@y - goal.g_y).abs) * @cost
  end

  def cost_from_parent
    if @parent != nil
      diff_x = (@parent.g_x - @x).abs
      diff_y = (@parent.g_y - @y).abs

      if diff_x != 0 and diff_y != 0
        return (2 * (@cost ** 2)) ** 0.5
      else
        return @cost
      end
    else
      return @cost
    end
  end

  # Gets

  def g_x
    return @x
  end

  def g_y
    return @y
  end

  def g_parent
    return @parent
  end

  def g_cost
    return @cost
  end

  def to_s
    return "(%d, %d)" % [@x, @y]
  end
end
