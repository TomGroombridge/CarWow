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
      end.to output("OOOOO\nOOZZZ\nAWOOO\nOWOOO\nOWOOO\nOWOOO\n").to_stdout
    end

  end

  context 'Given a file with incorrect commands in it' do
    before do
      @file = File.open("./spec/examples/incorrect_data.txt")
      @subject = BitmapEditor.new.run @file
    end

    it 'should give you an error message' do
      expect do
        BitmapEditor.new.run @file
      end.to output("Sorry we can't run this command due to: There are not enough rows or columns in the image to excute 'L'\n").to_stdout
    end

  end

  xit "should not be able to run the file if the first command is not 'I'" do
  end

  xit "should not be able to run the file if the last command is not 'S' " do
  end

  xit 'should not be able to accept lowercase letters into the command' do
  end

  xit 'should not be able to accept commands that begin with the correct letter'

end

