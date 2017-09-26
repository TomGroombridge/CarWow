require 'spec_helper'

describe 'Validation' do

  subject = Validation.new

  let(:number_of_columns) {20}
  let(:number_of_rows) {20}
  before do
    number_of_rows = 20
  end

  describe 'validate_size' do
    context 'Given a correct command' do
      it 'should return true' do
        expect(subject.validate_size(["I", "2", "4"])).to eq nil
      end
    end

    context 'Given an incoreect command' do
      it 'should return false due to ammount of commands' do
        expect{
          subject.validate_size(["I", "2", "4", "6"])
        }.to raise_error('Command format seems incorrect')
      end

      it 'should return false due to having too many rows or columns' do
        expect{
          subject.validate_size(["I", "2", "400"])
        }.to raise_error('Too many rows or columns')
      end
    end
  end

  # describe 'validate_change_pixel' do
  #   context 'Given a correct command' do
  #     it 'should return true' do
  #       expect(subject.validate_change_pixel(["L", "1", "2", "A"])).to eq nil
  #     end
  #   end

  #   context 'Given an incoreect command' do
  #     it 'should return false due to ammount of commands' do
  #       expect{
  #         subject.validate_change_pixel(["L", "1", "2"])
  #       }.to raise_error('Command format seems incorrect')
  #     end

  #     it 'should return false due to having too many rows or columns' do
  #       expect{
  #         subject.validate_change_pixel(["L", "1", "200", "A"])
  #       }.to raise_error("There are not enough rows or columns in the image to excute 'L'")
  #     end
  #   end
  # end

end