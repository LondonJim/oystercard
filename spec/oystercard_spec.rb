require 'oystercard'

describe Oystercard do

  it 'on initialization has a balance by default' do
    expect(subject.balance).to eq 0
  end

  describe '#top_up' do

    it { is_expected.to respond_to(:top_up).with(1).argument }

    it "can top up the balance" do
      expect{ subject.top_up 10 }.to change{ subject.balance }.by 10
    end

    it "raises an error when the balance limit is exceeded" do
      expect{ subject.top_up(91) }.to raise_error "Balance limit of £#{Oystercard::BALANCE_LIMIT} exceeded"
    end

  end

  describe '#deduct' do
    it { is_expected.to respond_to(:deduct).with(1).argument }

    it "can deduct the balance" do
      expect{ subject.deduct 10 }.to change{ subject.balance }.by -10
    end

    # it "raises an error when the balance limit is exceeded" do
    #   expect{ subject.top_up(91) }.to raise_error "Balance limit of £#{Oystercard::BALANCE_LIMIT} exceeded"
    # end

  end

  describe '#in_journey?' do

    it 'returns a boolean' do
    expect(subject.in_journey?).to be(true).or be(false)
    end

  end

  describe '#touch_in' do
    it { is_expected.to respond_to(:touch_in) }
  end

end
