```  
extension AVPlayer {

    /**
     @method			currentTime
     @abstract			Returns the current time of the current item.
     @result			A CMTime
     @discussion		Returns the current time of the current item. Not key-value observable; use -addPeriodicTimeObserverForInterval:queue:usingBlock: instead.
     */
    open func currentTime() -> CMTime

  /**
     @method			seekToTime:
     @abstract			Moves the playback cursor.
     @param				time
     @discussion		Use this method to seek to a specified time for the current player item.
    					The time seeked to may differ from the specified time for efficiency. For sample accurate seeking see seekToTime:toleranceBefore:toleranceAfter:.
     */
    open func seek(to time: CMTime)
}
```  
> use -addPeriodicTimeObserverForInterval:queue:usingBlock: instead.

>  For sample accurate seeking see seekToTime:toleranceBefore:toleranceAfter:.
