### Установка Балансировщика доступа на RDG сервер с использованием Terraform и Ansible

#### Требования
- Операционная система Ubuntu 22.04 LTS
- Terraform
- Ansible

#### Этапы установки

1. **Установка Terraform:**
   - Предварительно настройте все переменные в соответствии с вашим облаком в файлах `Oreol\terraform\network\terraform.tfvars` и `Oreol\terraform\vm\terraform.tfvars`.
   - Перейдите в директорию `Oreol\terraform\network` и выполните команды:
     ```bash
     terraform init
     terraform apply --auto-approve
     ```
   - Затем перейдите в директорию `Oreol\terraform\vm` и выполните аналогичные команды:
     ```bash
     terraform init
     terraform apply --auto-approve
     ```

2. **Актуализация файла `Oreol\ansible\inventory.ini`:**
   - Убедитесь, что файл `Oreol\ansible\inventory.ini` содержит актуальные данные о вашей виртуальной машине.

3. **Запуск Ansible для установки и настройки:**
   - Запустите следующую команду для установки или обновления пакетов:
     ```bash
     ansible-playbook -i ./inventory.ini ./site.yml --tags upgrade
     ```

4. **Размещение сертификата в /etc/cert/:**
   - Поместите необходимый сертификат в директорию `/etc/cert/` на виртуальной машине.

5. **Запуск Ansible для установки и настройки HAProxy:**
   - Запустите следующую команду для установки или обновления HAProxy и/или конфигурации:
     ```bash
     ansible-playbook -i ./inventory.ini ./site.yml --tags haproxy
     ```

Теперь у вас должен быть настроенный балансировщик доступа на RDG сервер.