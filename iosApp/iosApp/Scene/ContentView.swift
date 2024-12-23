import SwiftUI
import CoreLocation
import shared

struct ContentView: View {
    let mainCoordinator:MainCoordinator
    @State private var reset: Bool = false
    @State private var location: CLLocationCoordinate2D?
    @StateObject var locationManager:MyLocationManager = MyLocationManager()
    @StateObject var viewModel : IosViewModel


    init(mainCoordinator: MainCoordinator) {
        self.mainCoordinator = mainCoordinator
        self._viewModel = StateObject(wrappedValue: IosViewModel(sharedViewModel: get()))

    }
	var body: some View {

        ZStack(alignment: .bottom){
            if(locationManager.currentUserLocation != nil){
                GoogleMapView(currentStep: $viewModel.currentStep, pickLocation: $viewModel.pickLocation,dropLocation : $viewModel.dropLocation,directions:$viewModel.directions,location: $locationManager.currentUserLocation,reset:$reset, onMapIdle :{location in
                    viewModel.fetchLocation(latitude: location.latitude, longitude: location.longitude)
                })
                .environmentObject(locationManager)
                .onAppear {
                    locationManager.locationManager.startUpdatingLocation()
                }
                .overlay(
                    ZStack {
                        if(viewModel.currentStep == TripStep.pick){
                            Image(ImageResource.markerSvgrepoCom)
                                .foregroundColor(ColorResource.appPrimary.color())
                                .font(.largeTitle)
                                .padding(.bottom, 25)
                        }
                        if(viewModel.currentStep == TripStep.drop){
                            Image(ImageResource.markerSvgrepoCom)
                                .foregroundColor(ColorResource.gradientSecond.color())
                                .font(.largeTitle)
                                .padding(.bottom, 25)
                        }
                    }
                        .frame(maxWidth: .infinity, alignment: .center)
                )
            }

            VStack {
                VStack {
                    VStack(spacing: 20) {
                        Text(viewModel.pickGeoLocation)
                            .modifier(Medium(size: 14,color: Color.black))

                        Text(viewModel.dropGeoLocation)
                            .modifier(Medium(size: 14,color: Color.black))

                        HStack(spacing: 10) {
                            Button(action: {
                                viewModel.incrementTripStep()
                            }) {
                                Text(viewModel.currentStep == .started ? "FINISH" : "NEXT")
                                    .modifier(Bold(size: 16, color: Color.white))
                                    .frame(maxWidth: .infinity, minHeight:40, maxHeight: 40)
                                    .background(ColorResource.appPrimary.color())
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            }
                            .frame(maxWidth: .infinity, minHeight:40, maxHeight: 40)

                            Button(action: {
                                viewModel.resetTrip()
                                reset.toggle()
                            }) {
                                Image(ImageResource.icReset)
                                    .resizable()
                                    .tint(.white)
                                    .frame(width: 30, height: 30)

                            }
                            .frame(width: 40, height: 40)
                            .background(ColorResource.appPrimary.color())
                            .cornerRadius(8)
                        }
                    }
                    .padding(.vertical, 20)
                    .padding(.horizontal, 20)
                }

                .background(Color.white)
                .cornerRadius(20)
                }
            .padding(.bottom, 20)
            .padding(.horizontal, 20)
        }
        .navigationTitle(Text("screen_label"))
        .ignoresSafeArea()
     


	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
        ContentView(mainCoordinator: .Example)
	}
}
