require_relative '../classes/decorator_base'

describe DecoratorBase do
  context "When testing DecoratorBase Class" do
    it "should create a DecoratorBase object" do
      decorator_base = DecoratorBase.new('kevin')
      expect(decorator_base).to be_instance_of(DecoratorBase)
      expect(decorator_base.nameable).to eq 'kevin'
    end
  end

  context "When testing correct_name method" do
    it "should create a DecoratorBase object" do
      decorator_base = DecoratorBase.new('kevin')
      expect(decorator_base).to be_instance_of(DecoratorBase)
      expect(decorator_base.nameable).to eq 'kevin'
    end
  end

  let(:mock_nameable) { double('nameable') }
  subject(:decorator_base) { described_class.new(mock_nameable) }

  context 'when the nameable object returns a correct name' do
    it 'returns the correct name' do
      allow(mock_nameable).to receive(:correct_name).and_return('John Doe')

      expect(decorator_base.correct_name).to eq('John Doe')
    end
  end
end