require 'spec_helper'

describe 'Command' do

  describe '#create_bitmap' do
    context 'Given a correct expression' do
      subject = Command.new([], "I 2 4")

      it 'should return an array with values as 0' do
        expect(subject.create_bitmap).to eq [["0", "0"], ["0", "0"], ["0", "0"], ["0", "0"]]
      end
    end

  end

  describe '#change_pixel_colour' do
    context 'Given an grid with a correct expression' do
      @bitmap = [["0", "0"], ["0", "0"], ["0", "0"], ["0", "0"]]
      subject = Command.new(@bitmap, "L 1 2 A")

      it 'should be able to change the colour of one of the pixels' do
        expect(subject.change_pixel_colour).to eq [["0", "0"], ["A", "0"], ["0", "0"], ["0", "0"]]
      end
    end
  end

  describe '#add_vertical_line_color' do
    context 'Given an grid with a correct expression' do
      @bitmap = [["0", "0"], ["0", "0"], ["0", "0"], ["0", "0"]]
      subject = Command.new(@bitmap, "V 1 1 3 W")

      it 'should be able to add a vertical line of colour' do
        expect(subject.add_vertical_line_color).to eq [["W", "0"], ["W", "0"], ["W", "0"], ["0", "0"]]
      end
    end
  end

  describe '#add_horizontal_line' do
    context 'Given an grid with a correct expression' do
      @bitmap = [["0", "0"], ["0", "0"], ["0", "0"], ["0", "0"]]
      subject = Command.new(@bitmap, "H 1 2 2 Z")

      it 'should be able to add a horizontal line of colour' do
        expect(subject.add_horizontal_line).to eq [["0", "0"], ["Z", "Z"], ["0", "0"], ["0", "0"]]
      end
    end
  end



end