class Email {
  String recipient;
  String sender;
  String subject;
  String message;

  Email(this.recipient, this.sender, this.subject, this.message);

  Email.clean();

  factory Email.fromJson(Map<String, dynamic> json) {
    return Email(
        json["recipient"], json["sender"], json["subject"], json["message"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "recipient": recipient,
      "sender": sender,
      "subject": subject,
      "message": message
    };
  }
}
