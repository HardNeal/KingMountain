class GetmoneysController < ApplicationController
  def new 
    @getmoney = Getmoney.new
  end

  def create
        @getmoney = Getmoney.new(getmoney_params)
        @getmoney.save

        user = Transfer.find_by_user_id(current_user.id)
        user.summa = user.summa - @getmoney.total
        user.save
        flash[:balance] = 'Ваш запрос на вывод средств скоро будет обработан!'
    redirect_to profiles_path
  end

  private 

  def getmoney_params
    params.require(:getmoney).permit(:desc, :status, :total, :wallet, :walletfirm, :user_id)
  end 
end
