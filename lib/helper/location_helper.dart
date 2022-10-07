const GOOGLE_API_KEY = 'AIzaSyBxaeFqnv6zq1BHo3hRfzoVsigK0B235-I';

class LocationHelper{
  static String generateLocationPreviewImage({double? latitude , double? longitude}){
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Hlabel:C%7C$latitude,$longitude&key=$GOOGLE_API_KEY' ;
  }
}