require_relative '../../../test_helper'
require_relative '../../../../lib/vedeu/parsing/text_adaptor'

module Vedeu
  describe TextAdaptor do
    describe '.adapt' do
      it 'returns an empty collection for an empty string' do
        TextAdaptor.adapt('').must_be_empty

        TextAdaptor.adapt('').must_equal([])
      end

      it 'returns a single line' do
        text = "This is a single line of text.\n"
        TextAdaptor.adapt(text).size.must_equal(1)

        TextAdaptor.adapt(text).must_equal(
          [
            {
              streams: { text: 'This is a single line of text.' }
            }
          ]
        )
      end

      it 'returns multiple lines' do
        text = "Lorem ipm olor sit aet,\nConsctetur adipiscing.\n" \
               "Curitur aiquet, trpis id dui.\n\nCondum elemum.\n"
        TextAdaptor.adapt(text).size.must_equal(5)

        TextAdaptor.adapt(text).must_equal(
          [
            {
              streams: { text: 'Lorem ipm olor sit aet,' }
            }, {
              streams: { text: 'Consctetur adipiscing.' }
            }, {
              streams: { text: 'Curitur aiquet, trpis id dui.' }
            }, {
              streams: { text: '' }
            }, {
              streams: { text: 'Condum elemum.' }
            }
          ]
        )
      end
    end
  end
end
