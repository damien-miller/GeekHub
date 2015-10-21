require 'colorize'
require 'yaml'

class Ball
  def answers
    YAML.load_file(File.join(__dir__, './answers.yml'))
  end

  def colors
    %w(red green yellow blue)
  end

  def shake
    random_answer = answers[Random.rand(answers.size)]
    color = answers.index(random_answer) / 5
    puts random_answer.colorize(colors.values_at(color)[0].to_sym)
  end
end

Ball.new.shake
