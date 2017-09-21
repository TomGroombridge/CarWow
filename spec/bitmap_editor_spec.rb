require 'spec_helper'

describe 'BitmapEditor' do

  context 'Given a file with correct commands in it' do

    before do
      @file = File.open("./spec/examples/correct_data.txt")
      @subject = BitmapEditor.new.run @file
    end

    it 'should give you a result' do
      expect do
        BitmapEditor.new.run @file
      end.to output("00000\n00ZZZ\nAW000\n0W000\n0W000\n0W000\n").to_stdout
    end

  end

  context 'Given a file with incorrect commands in it' do
    before do
      @file = File.open("./spec/examples/incorrect_data.txt")
      @subject = BitmapEditor.new.run @file
    end

    it 'should give you a result' do
      expect do
        BitmapEditor.new.run @file
      end.to output("Sorry we can't run this command due to: There are not enough rows or collums in the image to excute 'L'\n").to_stdout
    end

  end
end

