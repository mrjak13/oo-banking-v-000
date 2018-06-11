class Transfer
  # your code here
  attr_accessor :sender, :reciever, :status, :amount
  def initialize(sender, reciever, status="pending", amount)
    @sender = sender
    @reciever = reciever
    @status = status
    @amount = amount    
  end
end
