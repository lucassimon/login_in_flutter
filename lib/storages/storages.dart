abstract class AdapterInterface {
  save(String key, dynamic value);
  fetch(String key);
  clear();
}

class Storage {
  AdapterInterface _source;

  Storage (AdapterInterface source) {
    this._source = source;
  }

  get storage => this._source;

  save(String key, dynamic value) async => await this.storage.save(key, value);

  fetch(String key) async => await this.storage.fetch(key);

  delete(String key) async => await this.storage.delete(key);

  clear() async => await this.storage.clear();
}