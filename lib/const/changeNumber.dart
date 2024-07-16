import 'dart:convert';
import 'package:crypto/crypto.dart';

String uuidToNumeric(String uuid) {
  var bytes = utf8.encode(uuid); // Convert the UUID string to bytes
  var hash = sha256.convert(bytes); // Hash the bytes using SHA-256 (for example)
  return hash.toString(); // Convert the hash to a string (numeric representation)
}

String shortenHashToFiveDigits(String hash) {
  // Convert hexadecimal string to integer
  int numericValue = int.parse(hash.substring(0, 5), radix: 16);
  
  // Ensure the number is within the range of 5 digits
  numericValue = numericValue % 100000; // This ensures it is a 5-digit number
  
  // Format the number to ensure it has 5 digits
  String formattedNumber = numericValue.toString().padLeft(5, '0');
  
  return formattedNumber;
}