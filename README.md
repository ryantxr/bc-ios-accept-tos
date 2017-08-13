# legendary-fiesta
iOS sample app shows how to do a terms of service screen that user must accept.

The point of this mini app is to illustrate how to determine the initial app screen programatically.

See AppDelegate.swift and AcceptViewController.swift.

AppDelegate.swift:

Add 2 variables to keep track of the 2 view controllers we are interested in.

    var mainViewController: ViewController?
    var acceptViewController: AcceptViewController?

Then, inside this function:

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

Load the storyboard:

        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)

Load and store the view controllers:

        mainViewController = mainStoryboard.instantiateViewController(withIdentifier: "MainView") as? ViewController
        acceptViewController = mainStoryboard.instantiateViewController(withIdentifier: "AcceptView") as? AcceptViewController

Check to see if the user had previously accepted the terms of service.

        let isAccepted = UserDefaults.standard.bool(forKey: "isAccepted")
Then decide which view controller to show.

        if isAccepted == false {
            switchToAcceptViewController()
        } else {
            switchToMainViewController()
        }
        
2 helper functions in AppDelegate to switch between view controllers.

    func switchToMainViewController() {
        //mainViewController?.selectedIndex = 0 // only needed if the main view controller is a tab view
        self.window?.rootViewController = mainViewController
        self.window?.makeKeyAndVisible()
    }
    func switchToAcceptViewController() {
        //mainViewController?.selectedIndex = 0 // only needed if the main view controller is a tab view
        self.window?.rootViewController = acceptViewController
        self.window?.makeKeyAndVisible()
    }

In AcceptViewController.swift

If the user presses the accept button, remember that choice and switch to the main view controller.

        @IBAction func acceptAction(_ sender: Any) {
            UserDefaults.standard.set(true, forKey: "isAccepted")
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.switchToMainViewController()
        }
