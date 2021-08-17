class Specialization {
  final String id;
  final String name;

  const Specialization({
    required this.id,
    required this.name,
  });
}

class Doctor {
  final String id;
  final String name;

  const Doctor({
    required this.id,
    required this.name,
  });
}

class AvailableAppointment {
  final String id;
  final DateTime startDateTime;
  final DateTime endDateTime;

  const AvailableAppointment({
    required this.id,
    required this.startDateTime,
    required this.endDateTime,
  });
}

class ButtonSend {
  final bool isActive;

  const ButtonSend({
    required this.isActive,
  });
}
