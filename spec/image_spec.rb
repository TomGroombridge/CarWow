require 'spec_helper'

describe Image do

  subject = described_class.new

  describe '#build' do
    context 'Given a correct expression' do
      it 'should return an array with values as O' do
        subject.build(["I", "2", "4"])
        expect(subject.pixels).to eq [["O", "O"], ["O", "O"], ["O", "O"], ["O", "O"]]
      end
    end

    context 'Given an expression that is incorrect' do
      it 'should raise an error if it has too many rows or columns' do
        expect{
          subject.build(["I", "251", "4"])
        }.to raise_error('Too many rows or columns')
      end

      it 'should raise an error if it has the wrong number of commands per line' do
        expect{
          subject.build(["I", "251", "4", "4"])
        }.to raise_error('Command format seems incorrect')
      end

      it 'should raise an error if you are trying to plot negative numbers' do
        expect{
          subject.build(["I", "-1", "-4"])
        }.to raise_error("Can't plot numbers that are negative or zero")
      end

      it 'should raise an error if you are trying to plot O' do
        expect{
          subject.build(["I", "0", "4"])
        }.to raise_error("Can't plot numbers that are negative or zero")
      end
    end
  end

  describe '#change_pixel_colour' do
    context 'Given an grid' do

      before do
        subject.pixels = [["O", "O"], ["O", "O"], ["O", "O"], ["O", "O"]]
      end

      it 'should be able to change the colour of one of the pixels' do
        subject.change_pixel(["L", "1", "2", "A"])
        expect(subject.pixels).to eq [["O", "O"], ["A", "O"], ["O", "O"], ["O", "O"]]
      end

      it 'should raise an error if the command format is not correct' do
        expect{
          subject.change_pixel(["L", "1", "2", "A", "4"])
        }.to raise_error('Command format seems incorrect')
      end

      it 'should raise an error if the number of rows or collumns is invalid' do
        expect{
          subject.change_pixel(["L", "1", "12", "A"])
        }.to raise_error("There are not enough rows or columns in the image to excute 'L'")
      end

      it 'should raise an error if it is given a zero number' do
        expect{
          subject.change_pixel(["L", "0", "12", "A"])
        }.to raise_error("Can't plot numbers that are negative or zero")
      end
    end
  end

  describe '#add_vertical_line_color' do
    context 'Given an grid' do
      before do
        subject.pixels = [["O", "O"], ["O", "O"], ["O", "O"], ["O", "O"]]
      end

      it 'should be able to add a vertical line of colour' do
        subject.add_vertical_line(["V", "1", "1", "3", "W"])
        expect(subject.pixels).to eq [["W", "O"], ["W", "O"], ["W", "O"], ["O", "O"]]
      end

      it 'should raise an error if the command format is not correct' do
        expect{
          subject.add_vertical_line(["V", "1", "B", "4"])
        }.to raise_error('Command format seems incorrect')
      end

      it 'should raise an error if the line is longer than the image' do
        expect{
          subject.add_vertical_line(["V", "1", "1", "12", "W"])
        }.to raise_error("There are not enough rows or columns in the image to excute 'V'")
      end

      it 'should raise an error if it is given a zero number' do
        expect{
          subject.add_vertical_line(["V", "1", "0", "12", "W"])
        }.to raise_error("Can't plot numbers that are negative or zero")
      end

      xit 'should still be able to plot the line if the numbers are the wrong way round' do
      end

    end
  end

  describe '#add_horizontal_line' do
    context 'Given an grid with a correct expression' do
      before do
        subject.pixels = [["O", "O"], ["O", "O"], ["O", "O"], ["O", "O"]]
      end

      it 'should be able to add a horizontal line of colour' do
        subject.add_horizontal_line(["H", "1", "2", "2", "Z"])
        expect(subject.pixels).to eq [["O", "O"], ["Z", "Z"], ["O", "O"], ["O", "O"]]
      end

      it 'should raise an error if the command format is not correct' do
        expect{
          subject.add_horizontal_line(["H", "1", "2", "Z"])
        }.to raise_error('Command format seems incorrect')
      end

      it 'should raise an error if the line is longer than the image' do
        expect{
          subject.add_horizontal_line(["H", "12", "12", "12", "W"])
        }.to raise_error("There are not enough rows or columns in the image to excute 'H'")
      end

      it 'should raise an error if it is given a zero number' do
        expect{
          subject.add_vertical_line(["H", "1", "2", "0", "Z"])
        }.to raise_error("Can't plot numbers that are negative or zero")
      end

      xit 'should still be able to plot the line if the numbers are the wrong way round' do
      end
    end
  end

  describe '#clear' do
    context 'Given a grid with a correct expression' do
      before do
        subject.pixels = [["O", "X"], ["Y", "Z"], ["P", "Q"], ["S", "T"]]
      end

      it 'should be able to clear the grid and convert every value to O' do
        subject.clear
        expect(subject.pixels).to eq [["O", "O"], ["O", "O"], ["O", "O"], ["O", "O"]]
      end

    end

  end



end