require_relative '../../../test_helper'

module Vedeu
  describe Queue do
    let(:described_class) { Queue }

    before { described_class.clear }

    describe '.dequeue' do
      let(:subject) { described_class.dequeue }

      context 'when the queue is empty' do
        it 'returns a NilClass' do
          subject.must_be_instance_of(NilClass)
        end
      end

      context 'when the queue is not empty' do
        before { described_class.enqueue(:result) }

        it 'returns the first entry added' do
          subject.must_be_instance_of(Symbol)
        end
      end
    end

    describe '.enqueue' do
      let(:subject) { described_class.enqueue(result) }
      let(:result)  { :result }

      it 'returns an Array' do
        subject.must_be_instance_of(Array)
      end

      it 'contains the enqueued item' do
        subject.size.must_equal(1)
      end
    end

    describe '.size' do
      let(:subject) { described_class.size }

      it 'returns a Fixnum' do
        subject.must_be_instance_of(Fixnum)
      end

      it 'returns the size of the queue' do
        subject.must_equal(0)
      end
    end

    describe '.clear' do
      let(:subject) { described_class.clear }

      it 'returns an Array' do
        subject.must_be_instance_of(Array)
      end

      it 'returns an empty array' do
        subject.must_be_empty
      end
    end

    describe '.view' do
      let(:subject) { described_class.view }

      it 'returns a String' do
        subject.must_be_instance_of(String)
      end

      it 'returns the queue as a String' do
        subject.must_equal("[]")
      end
    end
  end
end
