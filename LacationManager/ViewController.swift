
import UIKit
import CoreLocation
import AVFoundation
import AVKit


class ViewController: UIViewController, CLLocationManagerDelegate {

    var locationManager = CLLocationManager()
    
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
    }


    @IBAction func lacationButton(_ sender: UIButton) {
        locationManager.startUpdatingLocation()
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation] ){
        let location: CLLocationCoordinate2D = manager.location!.coordinate
        print("location - \(location.latitude)\(location.longitude)")
    }
    
//    func playSound() {
//            guard let url = Bundle.main.url(forResource: "pepas", withExtension: "mp3") else { return }
//
//            do {
//                try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
//                try AVAudioSession.sharedInstance().setActive(true)
//
//                player = try AVAudioPlayer(contentsOf: url)
//                if let player = player {
//                    player.play()
//                }
//            } catch let error {
//                print(error.localizedDescription)
//            }
//        }
    
    
    func videoTwo(){
        guard let url = Bundle.main.url(forResource: "onz", withExtension: "mp4") else { return }
//        let videoURL = URL(string: "http://techslides.com/demos/sample-videos/small.mp4")
        let player = AVPlayer(url: url)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.bounds
        self.view.layer.addSublayer(playerLayer)
        player.play()
    }
    
    func video (){
        let videoURL = URL(string: "http://techslides.com/demos/sample-videos/small.mp4")
        let player = AVPlayer(url: videoURL!)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        self.present(playerViewController, animated: true) {
            playerViewController.player!.play()
    }
    }
    
    
    @IBAction func musikButton(_ sender: UIButton) {
        
            video()
    }
    
    @IBAction func videoButton(_ sender: UIButton) {
            videoTwo()
      
    }

}

