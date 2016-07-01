require File.expand_path(File.dirname(__FILE__) + '/../triangle')

describe Triangle do

  describe 'judgment' do
    context '正常系' do
      it '正三角形であること' do
        expect(Triangle.new(3, 3, 3).judgment).to eq '正三角形ですね！'
      end

      it '二等辺三角形であること' do
        [3, 3, 4].permutation.each do |a, b, c|
          expect(Triangle.new(a, b, c).judgment).to eq '二等辺三角形ですね！'
        end
      end

      it '直角三角形であること' do
        [3, 4, 5].permutation.each do |a, b, c|
          expect(Triangle.new(a, b, c).judgment).to eq '直角三角形ですね！'
        end

      end
      it '不等辺三角形であること' do
        [4, 5, 6].permutation.each do |a, b, c|
          expect(Triangle.new(a, b, c).judgment).to eq '不等辺三角形ですね！'
        end
      end


    end

    context '三角形ではないパターン' do
      it '正三角形ではない' do
        expect(Triangle.new(0, 0, 0).judgment).to eq '三角形じゃないです＞＜'
      end

      it '二等辺三角形ではない' do
        [0, 0, 4].permutation.each do |a, b, c|
          expect(Triangle.new(a, b, c).judgment).to eq '三角形じゃないです＞＜'
        end
      end

      it '辺が成り立たない場合' do
        [-4, 5, 6].permutation.each do |a, b, c|
          expect(Triangle.new(a, b, c).judgment).to eq '三角形じゃないです＞＜'
        end

        [1, 2, 3].permutation.each do |a, b, c|
          expect(Triangle.new(a, b, c).judgment).to eq '三角形じゃないです＞＜'
        end

        [0, 5, 6].permutation.each do |a, b, c|
          expect(Triangle.new(a, b, c).judgment).to eq '三角形じゃないです＞＜'
        end
      end
    end
  end
end