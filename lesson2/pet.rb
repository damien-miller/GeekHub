require 'colorize'

class Pet

  def initialize name
    @name = name
    @stage_counter = 0
    @mood_counter = 3
    @locked_in_cage = true
    @evolving = false
    @people_left = 10

    puts '----------------------------------------------------------------------'
    puts "\n\n#{@name} is just an egg inside laboratory cage now.".colorize(:green)
    puts 'Push some human to come a little closer to it :3'
  end

  def push_some_human_to_a_cage
    puts "\nPushing a human to the cage..."
    if @locked_in_cage == true && @evolving == false
      attack_a_human
    elsif @locked_in_cage == true && @evolving == true
      puts @name + " is too busy now ( "
    else
      puts "There is no aliens in cage now ("
    end
    some_time_passed
  end

  def open_a_door_to_cage
    puts "\nSome idiot accidently opens a door to laboratory cage"
    if @locked_in_cage == true && @evolving == false
      @locked_in_cage = false
      puts "#{@name} IS FREE NOW!!! O_O".colorize(:green)
    elsif @locked_in_cage == false
      puts "There is no aliens in cage now ("
    end
    some_time_passed
  end

  def meet_some_human_in_lab
    if @locked_in_cage == false && @evolving == false && @people_left > 0
      puts "\n#{@name} hangin around in the lab and sees a human"
      attack_a_human
    end
    some_time_passed
  end

  def try_to_shot_alien
    if @people_left > 0
      puts "\nSome guy tries to shoot this God damn creature!!!"
      shot = Random.rand(9)
      if shot == 1
        puts "Oh.. no (( He shot alien to dead ((".colorize(:red)
        puts "\n\n THE END \n\n"
        exit
      else
        puts "Miss!".colorize(:yellow)
        if @evolving == false && stage != 'egg'
          attack_a_human
        end
      end
    else
      puts "No humans left to shoot!"
    end
  end


  private

  def stages
    %w(egg facehugger chestburster young mature)
  end

  def moods
    %w(depressed sad bored calm energetic happy excited ecstatic)
  end

  def stage
    stages.fetch(@stage_counter)
  end

  def mood
    moods.fetch(@mood_counter)
  end

  def stage_up
    @stage_counter += 1 if @stage_counter < 4
    puts "#{@name} stages up to a #{stage}.".colorize(:green)
  end

  def mood_up
    @mood_counter += 1 if @mood_counter < 7
    puts "#{@name} is #{mood}.".colorize(:blue)
  end

  def attack_a_human
    if stage == 'egg' && @evolving == false
      stage_up
      @evolving = true
      puts 'It jumps out from his cocoon ' + "and attacks human.".colorize(:red)
      puts "It gripping its legs around the victim\'s head and wrapping its tail around the host\'s neck\n"
    elsif stage == 'chestburster'
      puts @name + ' can\'t attack because it is too small yet.'
    elsif @evolving == true
      puts @name + ' can\'t attack because it\'s evolving now.'
    else
      kill_human
    end
    some_time_passed
  end

  def kill_human
    @people_left -= 1
    puts "#{@name} kills a human."
    puts "Humans left: #{@people_left.to_s}".colorize(:red)
    mood_up
  end

  def some_time_passed
    puts "\nSome time passed..."
    if stage == 'young'
      stage_up
      puts "#{@name} became a #{stage} because xenomorphes are growing fast :3".colorize(:green)
    end
    if stage == 'chestburster'
      stage_up
      puts "#{@name} became a #{stage} one and is ready to kill now :3".colorize(:green)
    end
    if @evolving == true && stage == 'facehugger'
      @evolving = false
      stage_up
      kill_human
      puts "(It bursted out from man\'s breast and now hides inside the lab)"
    end
    if @people_left < 4 && @people_left !=0
      @mood_counter = 1
      puts 'There is a lack of humans in laboratory.'
      puts "#{@name} is #{mood}.".colorize(:blue)
    elsif @people_left == 0
      @mood_counter = 0
      puts 'No more humans left..'
      puts "#{@name} is #{mood}.".colorize(:blue) + ' It is cryin with acid..'
      puts "\n\n SAD END \n\n"
      exit
    else
      puts '... and nothing happened'
    end

  end

end


xenomorph = Pet.new 'Bob'
xenomorph.meet_some_human_in_lab
xenomorph.try_to_shot_alien
xenomorph.push_some_human_to_a_cage
xenomorph.try_to_shot_alien
xenomorph.push_some_human_to_a_cage
xenomorph.open_a_door_to_cage
xenomorph.try_to_shot_alien
xenomorph.open_a_door_to_cage
xenomorph.push_some_human_to_a_cage
xenomorph.meet_some_human_in_lab
xenomorph.try_to_shot_alien
xenomorph.meet_some_human_in_lab
xenomorph.try_to_shot_alien
xenomorph.try_to_shot_alien
xenomorph.meet_some_human_in_lab
xenomorph.meet_some_human_in_lab
xenomorph.meet_some_human_in_lab
xenomorph.try_to_shot_alien
xenomorph.meet_some_human_in_lab
xenomorph.meet_some_human_in_lab
xenomorph.push_some_human_to_a_cage
xenomorph.meet_some_human_in_lab
xenomorph.try_to_shot_alien
xenomorph.meet_some_human_in_lab
xenomorph.meet_some_human_in_lab
xenomorph.try_to_shot_alien
