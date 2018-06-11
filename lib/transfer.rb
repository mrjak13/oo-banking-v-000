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
    if self.status != "complete"
      sender.balance = sender.balance - amount
      receiver.balance = receiver.balance + amount
      self.status = "complete"
    else self.status == "complete"
      "Transfer rejected. Please check your account balance."
    end
    binding.pry
  end
end
