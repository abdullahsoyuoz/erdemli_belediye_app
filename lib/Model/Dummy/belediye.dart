class Belediye {
  String address;
  String phone;
  String fax;
  String email;
  Belediye({
    this.address,
    this.email,
    this.fax,
    this.phone,
  });
}

Belediye belediye = Belediye(
  address: "Merkez Mahallesi, Hal Caddesi, No. 18, Pk. 33730 Mersin / Erdemli",
  email: "bilgi@erdemli.bel.tr",
  fax: "0 (324) 515-4128",
  phone: "444 5 609"
);
