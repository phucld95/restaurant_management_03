module Encode
  ALPHABET = "A0CDEYZnopqFGHIJabcdefghijklmKLMNO01234
    PQRSBTUVWXYZnopqrstuvwxyz123456789"
  BASE = ALPHABET.length
  INIT = BASE**4

  def encode num
    num *= 9876
    num += INIT
    str = ""
    while num > 0
      str = ALPHABET[num % BASE] + str
      num /= BASE
    end
    str.reverse
  end

  private
  def generate_code
    unless self.code
      self.update_attributes code: encode(self.id)
    end
  end
end
