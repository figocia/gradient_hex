class GradientGenerator
  def self.gradient(from_hex, to_hex, step_count)
    max_step_count = 64
    
    return 'From and to color need to be 6 digit hex value' if from_hex.length!=6 || to_hex.length!=6
    return 'Invalid hex string' if from_hex[/\H/] || to_hex[/\H/]
    return [from_hex, to_hex] if step_count < 3

    from_rgb = from_hex.scan(/../).map{|hex| hex.to_i(16)}
    to_rgb = to_hex.scan(/../).map{|hex| hex.to_i(16)}

    result = [from_hex]
    count = [max_step_count, step_count].min - 2

    avg_diffs = []
    3.times do |index|
      avg_diffs[index] = (to_rgb[index] - from_rgb[index]) / (count+1).to_f
    end

    count.times do |step|
      rgb_gradient = []
      3.times do |index|
        rgb_gradient << (from_rgb[index] + avg_diffs[index] * (step + 1)).round.to_s(16).upcase
      end      
      result << rgb_gradient.join
    end    
    result << to_hex
  end
end
