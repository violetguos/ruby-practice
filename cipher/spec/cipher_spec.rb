require './main'  #=> add this

describe "caesar_cipher" do
      it "returns the caesar cipher" do
        expect(caesar_cipher("What a string!", 5)).to eql("Bmfy f xywnsl!")
      
    end
  end