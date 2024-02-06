extends Control

func update_time(time):
	$TimeControl/TimeLabel.text = "%03d" % time

func  update_request(request):
	$RequestControl/RequestLabel.text = "%03d" % request

func update_deliver(deliver):
	$DeliverControl/DeliverLabel.text = "%03d" % deliver

func update_cow_feed(feed):
	$FeedControl/FeedLabel.text = str(feed)
