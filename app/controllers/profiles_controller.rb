class ProfilesController < ApplicationController
	
  def index

  end

  def update 
 	randombot = rand(1...1000000000)
 
    if current_user.balance > 50
      a = current_user  
      a.refferences.new(name: "Donate#{randombot}", email: "Donate#{randombot}@m.r", password: 'yk,Y@&7v`-8n-C3c', reffered_by: current_user.id)
      a.balance = a.balance - 50
      a.save

      redirect_to :back
    else
      flash[:balance] = 'Не достаточно баланса'
      redirect_to :back
    end   
  end
  
end
