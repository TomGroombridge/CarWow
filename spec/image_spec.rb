require 'spec_helper'

describe 'Image' do

  subject = Image.new

  describe '#create_bitmap' do
    context 'Given a correct expression' do

      it 'should return an array with values as 0' do
        subject.build(["I", "2", "4"])
        expect(subject.pixels).to eq [["0", "0"], ["0", "0"], ["0", "0"], ["0", "0"]]
      end
    end

    context 'Given an expression that has too many rows or collums' do

      it 'should raise an error' do

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
    end
  end



end