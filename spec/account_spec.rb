require 'account'

describe Account do

  it 'initializes with a bank balance of 0' do
    account = Account.new
    expect(account.balance).to eq(0)
  end

  context 'user makes a deposit' do
    account = Account.new

    it 'responds to the deposit method' do
      expect(account).to respond_to(:deposit)
    end

    it 'tops up the balance by the given amount' do
      account.deposit(50, "29/11/2016")
      expect(account.balance).to eq(50)
    end
  end

  context 'user makes a withdrawal' do
    account = Account.new

    it 'reponds to the withdraw method' do
      expect(account). to respond_to(:withdraw)
    end

    it 'decreases the balance by the given amount' do
      account.deposit(50, "29/11/2016")
      account.withdraw(25, "30/11/2016")
      expect(account.balance).to eq(25)
    end
  end

  context 'transaction is stored' do

    it 'stores a date, deposit and new total balance' do
      account = Account.new
      account.deposit(50, "29/11/2016")
      expect(account.transactions).to include({"date" => "29/11/2016", "deposit" => 50, "withdrawal" => 0, "balance" => 50})
    end

    it 'stores a date, withdrawal and new total balance' do
      account = Account.new
      account.deposit(50, "29/11/2016")
      account.withdraw(25, "30/11/2016")
      expect(account.transactions).to include({"date" => "30/11/2016", "deposit" => 0, "withdrawal" => 25, "balance" => 25})
    end
  end

  context 'prints bank statement' do

    it 'prints the statement when called' do
      account = Account.new
      account.deposit(50, "29/11/2016")
      account.print_balance
      expect(account.print_balance).to eq("Date: 29/11/2016, Credit: £50, Debit: , Balance: £50")
    end
  end
end
