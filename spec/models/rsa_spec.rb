
require 'rails_helper'
require 'spec_helper'

RSpec.describe RSA do

  let(:msg) { "The quick brown fox jumped over the lazy dog!" }
  let(:rsa) { RSA.new(217, 59, 119) }
  let(:new_keys) { rsa.new_key }
  let(:rsa_rand) { RSA.new(new_keys[0], new_keys[1], new_keys[2]) }

  it "Tries if return n works" do
    expect(rsa.n).to eq(217)
  end

  it "Tries if return e works" do
    expect(rsa.e).to eq(59)
  end

  it "Tries if return d works" do
    expect(rsa.d).to eq(119)
  end

  it "Tries if crypt changes message to right numbers" do
    expect(rsa.encrypt("abc")).to eq "132.56.57"
  end

  it "Tries if crypt/decrypt works" do
    expect(rsa.decrypt(rsa.encrypt(msg))).to eq(msg)
  end

  it "Tries if crypt/decrypt works with random keys" do
    expect(rsa_rand.decrypt(rsa_rand.encrypt(msg))).to eq(msg)
  end

  it "Tries if crypt/decrypt works with long message" do
    msg = "@#(SD(J!NC(@asdfomg.;51483lo lel {}:\" :))))2412561sdf"
    expect(rsa_rand.decrypt(rsa_rand.encrypt(msg))).to eq(msg)
  end

end
