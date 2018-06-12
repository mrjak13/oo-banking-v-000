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
    if status != "complete" && self.sender.valid? == true
      sender.balance = sender.balance - amount
      receiver.balance = receiver.balance + amount
      self.status = "complete"
    elsif status == "complete" || self.sender.valid? == false
      "Transaction rejected. Please check your account balance."
      self.status == "rejected"
    end
  end

  def reverse_transfer

  end
end
