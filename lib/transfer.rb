class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end 
  
  def valid?
    if self.sender.valid? && self.receiver.valid?
      true
    else 
      false
    end 
  end 
  
  def execute_transaction
   if @sender.balance > @amount && @status == "pending"
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else if @sender.balance < @amount
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end 
  
  
end
