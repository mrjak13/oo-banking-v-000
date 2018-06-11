class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount, :bankaccount
  def initialize(sender, receiver, status="pending", amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def valid?
    binding.pry
  end
end
