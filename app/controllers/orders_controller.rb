class OrdersController < ApplicationController
  def index
  end

  def show
    # @order = Order.find(params[:id])
  end

  def new 
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.save
  end

  def success
    @order = Order.find(params[:ik_pm_no])
    @user = current_user

    if (params["ik_inv_st"] =="success") #and (params["ik_ps_price"]||0)==(@order$
      @order.user.balance += @order.total
      @order.user.save
      flash[:balance] = "Вы пополнили счет на сумму #{@order.total}"
      
      redirect_to profiles_path
    else
      flash[:balance] = 'Оплата не прошла :('
      redirect_to profiles_path
    end
  end
  
  def pending
  end

  def fail
    flash[:balance] = 'Оплата не прошла :( Повторите попытку.'
    redirect_to profiles_path
  end

  private 

  def order_params
    params.require(:order).permit(:description, :currency, :total, :user_id)
  end 
end
