
abstract class RegisEvent {}

class RegisButtonPressed extends RegisEvent {
  final String username;
  final String password;
  final String phonenumber;
  final String address;
  final String email;

  RegisButtonPressed(this.phonenumber, this.address, this.email, {required this.username, required this.password});
}