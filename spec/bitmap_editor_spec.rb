require 'spec_helper'

describe 'BitmapEditor' do

  context 'test' do
    before do
      file = File.open("./examples/show.txt")
      @subject = BitmapEditor.new.run file
    end

    it 'should work' do
      expect(@subject).to eq ["00000", "00ZZZ", "AW000", "0W000", "0W000", "0W000"]
    end

  end
end