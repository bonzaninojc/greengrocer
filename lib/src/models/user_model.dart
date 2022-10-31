class UserModel {
  String nome;
  String email;
  String celular;
  String cpf;
  String senha;

  UserModel(
      {required this.nome,
      required this.celular,
      required this.email,
      required this.cpf,
      required this.senha});
}
