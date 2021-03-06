//+------------------------------------------------------------------+
//|                                                                  |
//|                                                  Mitchell Perry. |
//|                                                                  |
//+------------------------------------------------------------------+
#property version   "1.00"
#property strict
#property script_show_inputs
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
   extern int TakeProfit = 100;
   extern int StopLoss = 100;
   extern int Slippage = 5;
   extern double Lots = 0.1;

void OnStart()
 {
  
   double MyPoint=Point;
   if(Digits==3 || Digits==5) MyPoint=Point*10;  
   double TakeProfitLevel;
   double StopLossLevel;
 
   TakeProfitLevel = Bid - TakeProfit*MyPoint;
   StopLossLevel = Bid + StopLoss*MyPoint;
   
   Alert("Sell Order REQUEST");
// Open Sell Order  
   int ticket = OrderSend(Symbol(), OP_SELL, Lots, Bid, Slippage, StopLossLevel, TakeProfitLevel, "Sell Order");
   
// Checks Sell Order  
   if (ticket > 0) 
   {
   Alert("Sell Order OPEN, Ticket Number: " +string(ticket));
   }
   
   else
   {
   Alert("Order NOT Confirmed");
   }    
   
// Confirm Order  
   bool os_result = OrderSelect(ticket, SELECT_BY_TICKET);
   
   if(os_result == false)
    {
      Alert("Error Selecting Order");  
    }
   else 
   {
     

      Alert ("Asset ", OrderSymbol());
      Alert ("Opened ", OrderOpenTime());
      Alert("Open Price ", OrderOpenPrice());
      Alert("TakeProfit = ", TakeProfitLevel);
      Alert("StopLoss = ", StopLossLevel);
   }
  }        
//+------------------------------------------------------------------+

