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

    ref_balance = Transfer.find_by_user_id(@order.user.id)

    if (params["ik_inv_st"] =="success") #and (params["ik_ps_price"]||0)==(@order$
      if @order.which == 'Рабочий баланс'
        current_user.balance += @order.total
        current_user.save
      elsif @order.which == 'Свободный баланс'
        ref_balance.summa += @order.total
        ref_balance.save
      end
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
   @order = Order.find(params[:ik_pm_no])

    if (params["ik_inv_st"] =="canceled")
      flash[:balance] = 'Оплата не прошла :('
    end
      redirect_to profiles_path
  end

  private 

  def order_params
    params.require(:order).permit(:description, :currency, :total, :which, :user_id)
  end 
end

# /?ik_co_id=5923fdb33d1eaf86458b456e&
# ik_inv_id=73141437&ik_inv_st=canceled&ik_pm_no=72