require 'spec_helper'

describe 'Image' do

  subject = Image.new

  describe '#build' do
    context 'Given a correct expression' do

      it 'should return an array with values as 0' do
        subject.build(["I", "2", "4"])
        expect(subject.pixels).to eq [["0", "0"], ["0", "0"], ["0", "0"], ["0", "0"]]
      end
    end

    context 'Given an expression that has too many rows or collums' do

      it 'should raise an error' do
        expect{
          subject.build(["I", "251", "4"])
        }.to raise_error('Too many rows or collums')
      end

    end

    context 'Given an expression that has the wrong number of commands per line' do

      it 'should raise an error' do
        expect{
          subject.build(["I", "251", "4", "4"])
        }.to raise_error('Command format seems incorrect')
      end

    end

  end

  describe '#change_pixel_colour' do
    context 'Given an grid with a correct expression' do

      before do
        subject.pixels = [["0", "0"], ["0", "0"], ["0", "0"], ["0", "0"]]
      end

      it 'should be able to change the colour of one of the pixels' do
        subject.change_pixel(["L", "1", "2", "A"])
        expect(subject.pixels).to eq [["0", "0"], ["A", "0"], ["0", "0"], ["0", "0"]]
      end

      it 'should raise an error if the command format is not correct' do
        expect{
          subject.change_pixel(["L", "1", "2", "A", "4"])
        }.to raise_error('Command format seems incorrect')
      end

      it 'should raise an error if the number of rows or collumns is invalid' do
        expect{
          subject.change_pixel(["L", "1", "12", "A",])
        }.to raise_error("There are not enough rows or collums in the image to excute 'L'")
      end
    end
  end

  describe '#add_vertical_line_color' do
    context 'Given an grid with a correct expression' do
      before do
        subject.pixels = [["0", "0"], ["0", "0"], ["0", "0"], ["0", "0"]]
      end

      it 'should be able to add a vertical line of colour' do
        subject.add_vertical_line(["V", "1", "1", "3", "W"])
        expect(subject.pixels).to eq [["W", "0"], ["W", "0"], ["W", "0"], ["0", "0"]]
      end

      it 'should raise an error if the command format is not correct' do
        expect{
          subject.add_vertical_line(["V", "1", "B", "4"])
        }.to raise_error('Command format seems incorrect')
      end

      it 'should raise an error if the line is longer than the image' do
        expect{
          subject.add_vertical_line(["V", "1", "1", "12", "W"])
        }.to raise_error("There are not enough rows or collums in the image to excute 'V'")
      end

    end
  end

  describe '#add_horizontal_line' do
    context 'Given an grid with a correct expression' do
      before do
        subject.pixels = [["0", "0"], ["0", "0"], ["0", "0"], ["0", "0"]]
      end

      it 'should be able to add a horizontal line of colour' do
        subject.add_horizontal_line(["H", "1", "2", "2", "Z"])
        expect(subject.pixels).to eq [["0", "0"], ["Z", "Z"], ["0", "0"], ["0", "0"]]
      end

      it 'should raise an error if the command format is not correct' do
        expect{
          subject.add_vertical_line(["H", "1", "2", "Z"])
        }.to raise_error('Command format seems incorrect')
      end

      it 'should raise an error if the line is longer than the image' do
        expect{
          subject.add_vertical_line(["V", "12", "12", "12", "W"])
        }.to raise_error("There are not enough rows or collums in the image to excute 'V'")
      end
    end
  end



end