require 'account'

describe Account do

  context 'initializes with' do
    it 'a bank balance of 0' do
      expect(subject.balance).to eq(0)
    end

    it 'an empty transactions array' do
      expect(subject.transactions).to be_empty
    end
  end

  context 'allows user to make a deposit' do
    it 'responds to the deposit method' do
      expect(subject).to respond_to(:deposit)
    end

    it 'allows balance to be topped up by the given amount' do
      subject.deposit(50, "29/11/2016")
      expect(subject.balance).to eq(50)
    end
  end

  context 'allows user to make a withdrawal' do
    it 'reponds to the withdraw method' do
      expect(subject).to respond_to(:withdraw)
    end

    it 'allows balance to be decreased by the given amount' do
      subject.deposit(50, "29/11/2016")
      subject.withdraw(25, "30/11/2016")
      expect(subject.balance).to eq(25)
    end
  end

  context 'allows transaction to be stored in array' do
    it 'stores a date, deposit and new total balance' do
      subject.deposit(50, "29/11/2016")
      expect(subject.transactions).to include({"date" => "29/11/2016", "deposit" => 50, "withdrawal" => 0, "balance" => 50})
    end

    it 'stores a date, withdrawal and new total balance' do
      subject.deposit(50, "29/11/2016")
      subject.withdraw(25, "30/11/2016")
      expect(subject.transactions).to include({"date" => "30/11/2016", "deposit" => 0, "withdrawal" => 25, "balance" => 25})
    end
  end

  context 'prints bank statement' do
    xit 'prints the statement when called' do
      account.deposit(50, "29/11/2016")
      expect(account.print_balance).to eq(
      "date: 29/11/2016
      deposit: 50
      withdrawal: 0
      balance: 50")
    end
  end
end
