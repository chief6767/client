package ChargeurTransformice_fla
{
   import flash.display.MovieClip;
   import flash.utils.*;
   
   public dynamic class Dict extends MovieClip
   {
      
      public static var theDict:Dictionary = new Dictionary();
      
      public static var currentEvent:String = "Christmas";
      
      public static var _roomInformation:String = "<R>Map code: <J>%1</J>, mice: <J>%2";
      
      public function Dict()
      {
         super();
      }
   }
}

