import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/product.dart';
import 'package:shop/models/product_list.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _priceFocus = FocusNode();
  final _descriptionFocus = FocusNode();
  final _imageUrlFocus = FocusNode();
  final _imageUrlController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final Map<String, Object> _formContent = {};

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_formContent.isEmpty) {
      final argument = ModalRoute.of(context)?.settings.arguments;
      if (argument != null) {
        final product = argument as Product;
        _formContent['id'] = product.id;
        _formContent['name'] = product.name;
        _formContent['price'] = product.price;
        _formContent['description'] = product.description;
        _formContent['imageUrl'] = product.imageUrl;
        _imageUrlController.text = product.imageUrl;
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _priceFocus.dispose();
    _descriptionFocus.dispose();
    _imageUrlFocus.removeListener(_updateImage);
    _imageUrlFocus.dispose();
  }

  @override
  void initState() {
    super.initState();
    _imageUrlFocus.addListener(_updateImage);
  }

  void _updateImage() => setState(() {});

  bool isValidImageUrl(final String url) {
    final isValidUrl = Uri.tryParse(url)?.hasAbsolutePath ?? false;
    final endsWithFile = url.toLowerCase().endsWith('.png') ||
        url.toLowerCase().endsWith('.jpg') ||
        url.toLowerCase().endsWith('.jpeg');
    return isValidUrl && endsWithFile;
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      Provider.of<ProductList>(
        context,
        listen: false,
      ).saveProductFromData(_formContent);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(final BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.primary,
        iconTheme: IconThemeData(color: colorScheme.secondary),
        title: Text(
          'Formulário de Produto',
          style: TextStyle(color: colorScheme.secondary),
        ),
        actions: [
          IconButton(
            onPressed: _submitForm,
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Container(
        color: colorScheme.background,
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                initialValue: _formContent['name']?.toString(),
                decoration: const InputDecoration(labelText: 'Nome'),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_priceFocus);
                },
                onSaved: (name) => _formContent['name'] = name ?? '',
                validator: (optionalName) {
                  final name = optionalName ?? '';
                  if (name.trim().isEmpty) {
                    return 'Nome é obrigatório';
                  } else if (name.trim().length < 3) {
                    return 'Nome precisa de no mínimo de 3 letras';
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                initialValue: _formContent['price']?.toString(),
                decoration: const InputDecoration(labelText: 'Preço'),
                textInputAction: TextInputAction.next,
                focusNode: _priceFocus,
                keyboardType: const TextInputType.numberWithOptions(
                  signed: false,
                  decimal: true,
                ),
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_descriptionFocus);
                },
                onSaved: (price) =>
                    _formContent['price'] = double.parse(price ?? '0'),
                validator: (optionalPrice) {
                  final priceString = optionalPrice ?? '';
                  final price = double.tryParse(priceString) ?? -1;
                  return price <= 0 ? 'Informe um preço válido' : null;
                },
              ),
              TextFormField(
                initialValue: _formContent['description']?.toString(),
                decoration: const InputDecoration(labelText: 'Descrição'),
                focusNode: _descriptionFocus,
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                onSaved: (description) =>
                    _formContent['description'] = description ?? '',
                validator: (optionalDescription) {
                  final description = optionalDescription ?? '';
                  if (description.trim().isEmpty) {
                    return 'Descrição é obrigatória';
                  } else if (description.trim().length < 3) {
                    return 'Descrição precisa de no mínimo de 3 letras';
                  } else {
                    return null;
                  }
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Url da Imagem',
                      ),
                      focusNode: _imageUrlFocus,
                      keyboardType: TextInputType.url,
                      textInputAction: TextInputAction.done,
                      controller: _imageUrlController,
                      onFieldSubmitted: (_) => _submitForm(),
                      onSaved: (imageUrl) =>
                          _formContent['imageUrl'] = imageUrl ?? '',
                      validator: (optionalImageUrl) {
                        final imageUrl = optionalImageUrl ?? '';
                        return !isValidImageUrl(imageUrl)
                            ? 'Informe uma URL válida'
                            : null;
                      },
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    margin: const EdgeInsets.only(top: 10, left: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: _imageUrlController.text.isEmpty
                        ? const Text(
                            'Informe a URL',
                            textAlign: TextAlign.center,
                          )
                        : Image.network(
                            _imageUrlController.text,
                            fit: BoxFit.cover,
                          ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
