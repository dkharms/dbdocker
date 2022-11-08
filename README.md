### Порохнин Даниил Алексеевич

Сделал в `docker compose` три сервиса, в каждый из них запрос
проксируется с портов `5432 + k`, для `k = 0...2`.

Нужные скриншоты лежат в директории `images/`.


### Как подключиться

В конфиге для баз я прописал опцию `listen_addresses = '*'`, так что можно подключаться извне контейнеров.

Подключиться к базе, в которой спроектирована библиотека:
```bash
psql postgresql://POROKHNIN_204:POROKHNIN_204@localhost:5432/POROKHNIN_204
```

Подключиться к базе, в которой спроектированы ЖД станции:
```bash
psql postgresql://POROKHNIN_204:POROKHNIN_204@localhost:5433/POROKHNIN_204
```

Подключиться к базе, в которой спроектирована больница:
```bash
psql postgresql://POROKHNIN_204:POROKHNIN_204@localhost:5434/POROKHNIN_204
```
