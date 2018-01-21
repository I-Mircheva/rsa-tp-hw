
require 'prime'
require 'rsa'

class RsaFull < ApplicationRecord

  # after_initialize do |rsafull|
  #  @n = self[:n]
  #  @e = self[:e]
  #  @d = self[:d]
  # end

  def self.new_key
    rsa = RSA.new
    rsa.new_key
  end

  def encrypt message
    rsa = RSA.new(n, e, d)
    rsa.encrypt(message)
  end

  def decrypt message
    rsa = RSA.new(n, e, d)
    rsa.decrypt(message)
  end

end

