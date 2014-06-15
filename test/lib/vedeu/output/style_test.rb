require_relative '../../../test_helper'

module Vedeu
  describe Style do
    let(:described_class) { Style }

    describe '.set' do
      let(:subject) { described_class.set(style) }
      let(:style) {}

      it 'returns a String' do
        subject.must_be_instance_of(String)
      end

      it 'returns an empty string' do
        subject.must_equal('')
      end

      context 'when the style is bold' do
        let(:style) { :bold }

        it 'returns an escape sequence' do
          subject.must_equal("\e[1m")
        end
      end

      context 'when the style is clear' do
        let(:style) { :clear }

        it 'returns an escape sequence' do
          subject.must_equal("\e[2J")
        end
      end

      context 'when the style is hide_cursor' do
        let(:style) { :hide_cursor }

        it 'returns an escape sequence' do
          subject.must_equal("\e[?25l")
        end
      end

      context 'when the style is inverse' do
        let(:style) { :inverse }

        it 'returns an escape sequence' do
          subject.must_equal("\e[7m")
        end
      end

      context 'when the style is reset' do
        let(:style) { :reset }

        it 'returns an escape sequence' do
          subject.must_equal("\e[0m")
        end
      end

      context 'when the style is normal' do
        let(:style) { :normal }

        it 'returns an escape sequence' do
          subject.must_equal("\e[0m")
        end
      end

      context 'when the style is show_cursor' do
        let(:style) { :show_cursor }

        it 'returns an escape sequence' do
          subject.must_equal("\e[?25h")
        end
      end

      context 'when the style is underline' do
        let(:style) { :underline }

        it 'returns an escape sequence' do
          subject.must_equal("\e[4m")
        end
      end
    end
  end
end
