
class AudioPlayer
  attr_accessor :state

  def initialize
    @state = Stopped.new(self)
  end

  def play
    @state.play
  end

  def stop
    @state.stop
  end

  def set_state (state)
    @state = state
  end
end

class State
  def play
    raise NotImplementedError
  end

  def stop
    raise NotImplementedError
  end
end

class Stopped < State
  def initialize (player)
    @player = player
  end

  def play
    print "current state is Stopped, but switched to Playing | "

    @player.set_state (Playing.new(@player))
    @player.play
  end

  def stop
    puts "audio is stopped"
  end
end

class Playing < State
  def initialize(player)
    @player = player
  end

  def play
    puts "audio is playing"
  end

  def stop
    print "current state is Playing, but switched to Stopped | "

    @player.set_state(Stopped.new(@player))
    @player.stop
  end
end



puts

player = AudioPlayer.new
player.play
player.stop
player.stop

puts