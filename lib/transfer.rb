class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount
  def initialize(sender, receiver, status="pending", amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def valid?
    self.receiver.valid? && self.sender.valid?
  end

  def execute_transaction
    # binding.pry
    if status == "pending"
      sender.balance = sender.balance - amount
      receiver.balance = receiver.balance + amount
      self.status = "complete"
    elsif status == "complete"
      self.status == "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer

  end
end
