//+------------------------------------------------------------------+
//|                                                                  |
//|                        Copyright 2021, Mitchell Perry          . |
//|                                                                  |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, Mitchell Perry"
#property version   "1.00"
#property strict
#property script_show_inputs
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
   extern int TakeProfit = 1000;
   extern int StopLoss = 1000;
   extern int Slippage = 100;
   extern double Lots = 0.1;

void OnStart()
 {
  
   double MyPoint=Point;
   if(Digits==3 || Digits==5) MyPoint=Point*10;
   double TakeProfitLevel;
   double StopLossLevel;
 
   TakeProfitLevel = Ask + TakeProfit*MyPoint;
   StopLossLevel = Ask - StopLoss*MyPoint;
   
   Alert("Buy Order REQUEST");
// Open Buy Order  
   int ticket = OrderSend(Symbol(), OP_BUY, Lots, Ask, Slippage, StopLossLevel, TakeProfitLevel, "Buy Order");
   
// Checks Buy Order  
   if (ticket > 0) 
   {
   Alert("Buy Order OPEN, Ticket Number: " +string(ticket));
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

