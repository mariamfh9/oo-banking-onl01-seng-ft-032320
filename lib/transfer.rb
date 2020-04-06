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
    if self.sender.balance < self.amount
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    elseif status == "complete"
       break
    else 
      self.sender.deposit( self.amount * -1 ) 
      self.receiver.deposit( self.amount )
      self.status = "complete"
    end 
  end 
end
