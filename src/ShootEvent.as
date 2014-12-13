package
{
import flash.display.MovieClip;
import flash.events.Event;
/**
* ...
* @author Joey Koedijk
*/
public class ShootEvent extends Event
{
public var shooter:BaseTank;
public function ShootEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
{
super(type, bubbles, cancelable);
}
}
}