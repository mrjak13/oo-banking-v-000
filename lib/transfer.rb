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
    receiver.valid? && sender.valid?
  end

  def execute_transaction
    # binding.pry
    if status == "pending" && sender.valid? == true
      sender.balance = sender.balance - amount
      receiver.balance = receiver.balance + amount
      self.status = "complete"
    else
      "Transaction rejected. Please check your account balance."
      self.status = "rejected"
    end
    # binding.pry
  end

  def reverse_transfer
    if self.status == "complete"
      sender.balance = sender.balance + amount
      receiver.balance = receiver.balance - amount
      self.status = "reversed"
    end
    self.status
  end
end
