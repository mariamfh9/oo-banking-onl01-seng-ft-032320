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
    if self.sender.balance > self.amount && self.status == "pending"
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = "complete"
   else if !self.sender.valid? 
      #@status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if @status == "complete"
      @sender.deposit( @amount ) 
      @receiver.deposit( @amount * -1)
      @status = "reversed"
    end
  end 
  
end
