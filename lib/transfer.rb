require 'pry'

class Transfer
  # your code here

  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
    
  end

  def execute_transaction
    # binding.pry
    if sender.balance >= self.amount && self.status == "pending" && receiver.status == "open"
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
      # binding.pry
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
      # binding.pry
    end
  end

  def reverse_transfer
    if self.status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      self.status = "reversed"
    end
    
    
  end
end
