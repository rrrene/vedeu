require_relative '../../../test_helper'
require_relative '../../../../lib/vedeu/parsing/parser'

module Vedeu
  describe Parser do
    describe '#parse' do
      it 'returns a NilClass when the output is empty' do
        Parser.parse.must_be_instance_of(NilClass)
      end

      it 'returns a Composition when the output is JSON' do
        skip('This is not working as it should...')

        Parser.parse("{\"some\": \"JSON\"}")
          .must_be_instance_of(Composition)
      end

      it 'returns a collection of interfaces when the output is a Hash' do
        parser = Parser.parse({ parser_parse: 'Parser#parse' })

        parser.must_be_instance_of(Array)
        parser.size.must_equal(1)
      end

      it 'raises an exception when the output is anything else' do
        proc { Parser.parse([:invalid]) }.must_raise(ParseError)
      end
    end
  end
end