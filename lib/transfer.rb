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
    if self.status == "pending" && sender.valid? == true
      # binding.pry
      sender.balance = sender.balance - amount
      receiver.balance = receiver.balance + amount
      self.status = "complete"
    elsif self.status == "complete" || sender.valid? == false
      self.status = "rejected"
      if self.status == "rejected"
        puts "Transaction rejected. Please check your account balance."
      end
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
