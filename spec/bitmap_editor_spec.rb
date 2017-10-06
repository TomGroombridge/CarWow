require 'spec_helper'

RSpec.describe BitmapEditor do

  path = "./spec/examples"
  subject = described_class.new

  context 'Given a file with correct commands in it' do
    let(:file) { File.open("#{path}/correct_data.txt") }

    it 'should give you a result' do
      expect do
        subject.run file
      end.to output("OOOOO\nOOZZZ\nAWOOO\nOWOOO\nOWOOO\nOWOOO\n").to_stdout
    end

  end

  context 'Given a file with incorrect commands in it' do
    let(:file) { File.open("#{path}/incorrect_data.txt") }

    it 'should give you an error message' do
      expect do
        subject.run file
      end.to output("Sorry we can't run this command due to: There are not enough rows or columns in the image to excute 'L'\n").to_stdout
    end

  end

  context 'Given a file with incorrect first command' do
    let(:file) { File.open("#{path}/incorrect_start.txt") }

    it "it should give the user a good error response" do
      expect do
        subject.run file
      end.to output("Sorry but the first command in the file must start with 'I'\n").to_stdout
    end
  end

  context 'Given a file a lowercase command' do
    let(:file) { File.open("#{path}/lowercase_command.txt") }

    it "should tell the user that letters can't be lowercase" do
      expect do
        subject.run file
      end.to output("Sorry but commands must be uppercase\n").to_stdout
    end
  end

  context 'Given a file with a incorrect letter in the command' do
    let(:file) { File.open("#{path}/incorrect_command.txt") }

    it 'should not be able to accept commands that begin with the an incorrect letter' do
      expect do
        subject.run file
      end.to output("Sorry we can't run this command due to: command not recognised [\"P\", \"1\", \"3\", \"A\"]\n").to_stdout
    end
  end

end

