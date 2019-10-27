class SecretHandshake

  BINARY_TO_EVENT = {
    1 => 'wink',
    2 => 'double blink',
    4 => 'close your eyes',
    8 => 'jump'
  }

  def initialize(code)
    @code =  code.to_i
  end

  attr_reader :code

  def commands
    handshake = BINARY_TO_EVENT.select { |bin| BINARY_TO_EVENT[bin & code] }.values
    code & 16 == 16 ? handshake.reverse : handshake
  end

end