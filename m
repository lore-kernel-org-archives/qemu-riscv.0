Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D010AC48BF6
	for <qemu-riscv@archiver.kernel.org>; Mon,  4 Mar 2024 10:55:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rh5yy-0005TH-3J; Mon, 04 Mar 2024 05:55:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1rh5yr-0005O2-Co
 for qemu-riscv@nongnu.org; Mon, 04 Mar 2024 05:55:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1rh5yn-0006EO-D1
 for qemu-riscv@nongnu.org; Mon, 04 Mar 2024 05:55:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709549731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ytujTh/PPHecvP3+zR8peLZ8E+O9kjpIya7NwGG3GUk=;
 b=cUVC9Jz/weBB6xOJy9v7CBZqoxBQ04kv2LYCOfk/uj6/An4ZhT+zT3Hv39MdCA6F9hEBmy
 0PCmqFT9jBnOW5zc21Uh2sa840aaz01c/gsOwIzUgBS942dhBcWlQXo1Js6+N6kdmuNiVN
 U8UMArkEnDlV8aT1BYxPFVUTc6SV8fY=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-680-4r3FafguPjODWzsiAveWTg-1; Mon, 04 Mar 2024 05:55:29 -0500
X-MC-Unique: 4r3FafguPjODWzsiAveWTg-1
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-6e5a170abaeso4338015b3a.2
 for <qemu-riscv@nongnu.org>; Mon, 04 Mar 2024 02:55:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709549728; x=1710154528;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PxEBVfRc6Q7X2NA8AZW3zFdtKpllbYMamSVGIjqbZZs=;
 b=khz/hMn73qDPOeHOn00EhkeUr6clvJzTy9HvxumBPTzevuqb20qsZV3Ux9pIaeQ+UY
 FzhcEns9yq03+Mxi2X19ohTtdOjGDV60RqyT+le5RaNiTGH5EQp5DEdukowlYOCPI8mu
 DQoIV6m55bE8w9NtZXQjstAB31Bagb78r6qShzmZ1rnqt6TNgvk9dfPbIHGGZtZU0avY
 aTAJv7zYTc6YKDOrrxTv8AbOfcnXzLX55Z/cVuDX6WndgKvQ4nQm/6Bg5cGtp8OI1lNH
 XfaQ5vAudqrWeCwq/Adyw/BDKc2LuGh2gfP9P6sRPVtpoxOnFBlKV4rQleHGYP/KpMro
 YUEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsBg4w01M1kWUx/MuLwpUqD2/ij55TxvERDn6piejQ7dBcr/mrKzFgo0Muv7yvOSCK7m/zSRigqe34P4o+YNr3ksdKksw=
X-Gm-Message-State: AOJu0Yy/+oAl8h7PVVZPKbNALOIEukMEwVUvbiYY60mi3xRld+PrdQrC
 5nUS6ezUKg9XaP2zfdzC4mRkfWgBESYHhUy022GguI57pbCR23/tGaBJZiu9JpVboJHG9FiAorT
 0cSnzAiUB6OPAAQGomOqGGlVpjrx/hpxOD8xBm2rhoQBn1/JNn3OE
X-Received: by 2002:a05:6a00:23d6:b0:6e6:2781:1945 with SMTP id
 g22-20020a056a0023d600b006e627811945mr1805697pfc.20.1709549727601; 
 Mon, 04 Mar 2024 02:55:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFCaILNF5wYk5/Lak5gZT8aM3x+h4ZNTye6JEf4eGe00B5b3LXDZzN4jK8TJOJpDcpL9fhDLw==
X-Received: by 2002:a05:6a00:23d6:b0:6e6:2781:1945 with SMTP id
 g22-20020a056a0023d600b006e627811945mr1805681pfc.20.1709549727058; 
 Mon, 04 Mar 2024 02:55:27 -0800 (PST)
Received: from smtpclient.apple ([115.96.159.226])
 by smtp.gmail.com with ESMTPSA id
 s62-20020a625e41000000b006e612df4627sm2240061pfb.39.2024.03.04.02.55.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 04 Mar 2024 02:55:26 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Subject: Re: [PATCH 09/19] smbios: build legacy mode code only for 'pc' machine
From: Ani Sinha <anisinha@redhat.com>
In-Reply-To: <20240227154749.1818189-10-imammedo@redhat.com>
Date: Mon, 4 Mar 2024 16:25:03 +0530
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Song Gao <gaosong@loongson.cn>,
 Alistair Francis <alistair.francis@wdc.com>, palmer@dabbelt.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, philmd@linaro.org, wangyanan55@huawei.com,
 eblake@redhat.com, armbru@redhat.com, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, f.ebner@proxmox.com
Message-Id: <BB495028-FC8F-4E80-A58F-B3AC81732DFF@redhat.com>
References: <20240227154749.1818189-1-imammedo@redhat.com>
 <20240227154749.1818189-10-imammedo@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
X-Mailer: Apple Mail (2.3774.400.31)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.589,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org



> On 27-Feb-2024, at 21:17, Igor Mammedov <imammedo@redhat.com> wrote:
>=20
> basically moving code around without functional change.
> And exposing some symbols so that they could be shared
> between smbbios.c and new smbios_legacy.c
>=20
> plus some meson magic to build smbios_legacy.c only
> for 'pc' machine and otherwise replace it with stub
> if not selected.
>=20
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
> include/hw/firmware/smbios.h   |  22 +++
> hw/i386/Kconfig                |   1 +
> hw/smbios/Kconfig              |   2 +
> hw/smbios/meson.build          |   4 +
> hw/smbios/smbios.c             | 251 ++++++---------------------------
> hw/smbios/smbios_legacy.c      | 179 +++++++++++++++++++++++
> hw/smbios/smbios_legacy_stub.c |  16 +++
> 7 files changed, 270 insertions(+), 205 deletions(-)
> create mode 100644 hw/smbios/smbios_legacy.c
> create mode 100644 hw/smbios/smbios_legacy_stub.c
>=20
> diff --git a/include/hw/firmware/smbios.h b/include/hw/firmware/smbios.h
> index 1fbff3c55f..a6d8fd6591 100644
> --- a/include/hw/firmware/smbios.h
> +++ b/include/hw/firmware/smbios.h
> @@ -2,6 +2,7 @@
> #define QEMU_SMBIOS_H
>=20
> #include "qapi/qapi-types-machine.h"
> +#include "qemu/bitmap.h"
>=20
> /*
>  * SMBIOS Support
> @@ -16,8 +17,27 @@
>  *
>  */
>=20
> +extern uint8_t *usr_blobs;
> +extern GArray *usr_blobs_sizes;
> +
> +typedef struct {
> +    const char *vendor, *version, *date;
> +    bool have_major_minor, uefi;
> +    uint8_t major, minor;
> +} smbios_type0_t;
> +extern smbios_type0_t smbios_type0;
> +
> +typedef struct {
> +    const char *manufacturer, *product, *version, *serial, *sku, *family=
;
> +    /* uuid is in qemu_uuid */
> +} smbios_type1_t;
> +extern smbios_type1_t smbios_type1;
> +
>=20
> #define SMBIOS_MAX_TYPE 127
> +extern DECLARE_BITMAP(smbios_have_binfile_bitmap, SMBIOS_MAX_TYPE + 1);
> +extern DECLARE_BITMAP(smbios_have_fields_bitmap, SMBIOS_MAX_TYPE + 1);
> +
> #define offsetofend(TYPE, MEMBER) \
>        (offsetof(TYPE, MEMBER) + sizeof_field(TYPE, MEMBER))
>=20
> @@ -290,6 +310,8 @@ struct smbios_type_127 {
>     struct smbios_structure_header header;
> } QEMU_PACKED;
>=20
> +void smbios_validate_table(void);
> +void smbios_add_usr_blob_size(size_t size);
> void smbios_entry_add(QemuOpts *opts, Error **errp);
> void smbios_set_cpuid(uint32_t version, uint32_t features);
> void smbios_set_defaults(const char *manufacturer, const char *product,
> diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
> index a1846be6f7..a6ee052f9a 100644
> --- a/hw/i386/Kconfig
> +++ b/hw/i386/Kconfig
> @@ -76,6 +76,7 @@ config I440FX
>     select PIIX
>     select DIMM
>     select SMBIOS
> +    select SMBIOS_LEGACY
>     select FW_CFG_DMA
>=20
> config ISAPC
> diff --git a/hw/smbios/Kconfig b/hw/smbios/Kconfig
> index 553adf4bfc..8d989a2f1b 100644
> --- a/hw/smbios/Kconfig
> +++ b/hw/smbios/Kconfig
> @@ -1,2 +1,4 @@
> config SMBIOS
>     bool
> +config SMBIOS_LEGACY
> +    bool
> diff --git a/hw/smbios/meson.build b/hw/smbios/meson.build
> index 7046967462..a59039f669 100644
> --- a/hw/smbios/meson.build
> +++ b/hw/smbios/meson.build
> @@ -4,5 +4,9 @@ smbios_ss.add(when: 'CONFIG_IPMI',
>               if_true: files('smbios_type_38.c'),
>               if_false: files('smbios_type_38-stub.c'))
>=20
> +smbios_ss.add(when: 'CONFIG_SMBIOS_LEGACY',
> +              if_true: files('smbios_legacy.c'),
> +              if_false: files('smbios_legacy_stub.c'))
> +
> system_ss.add_all(when: 'CONFIG_SMBIOS', if_true: smbios_ss)
> system_ss.add(when: 'CONFIG_SMBIOS', if_false: files('smbios-stub.c'))
> diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
> index 97cf762228..fb1f05fcde 100644
> --- a/hw/smbios/smbios.c
> +++ b/hw/smbios/smbios.c
> @@ -31,38 +31,12 @@
> #include "hw/pci/pci_device.h"
> #include "smbios_build.h"
>=20
> -/* legacy structures and constants for <=3D 2.0 machines */
> -struct smbios_header {
> -    uint16_t length;
> -    uint8_t type;
> -} QEMU_PACKED;
> -
> -struct smbios_field {
> -    struct smbios_header header;
> -    uint8_t type;
> -    uint16_t offset;
> -    uint8_t data[];
> -} QEMU_PACKED;
> -
> -struct smbios_table {
> -    struct smbios_header header;
> -    uint8_t data[];
> -} QEMU_PACKED;
> -
> -#define SMBIOS_FIELD_ENTRY 0
> -#define SMBIOS_TABLE_ENTRY 1
> -
> -static uint8_t *smbios_entries;
> -static size_t smbios_entries_len;
> static bool smbios_uuid_encoded =3D true;
> -/* end: legacy structures & constants for <=3D 2.0 machines */
> -
> /*
>  * SMBIOS tables provided by user with '-smbios file=3D<foo>' option
>  */
> uint8_t *usr_blobs;
> size_t usr_blobs_len;
> -static GArray *usr_blobs_sizes;
> static unsigned usr_table_max;
> static unsigned usr_table_cnt;
>=20
> @@ -78,19 +52,11 @@ static int smbios_type4_count =3D 0;
> static bool smbios_have_defaults;
> static uint32_t smbios_cpuid_version, smbios_cpuid_features;
>=20
> -static DECLARE_BITMAP(have_binfile_bitmap, SMBIOS_MAX_TYPE+1);
> -static DECLARE_BITMAP(have_fields_bitmap, SMBIOS_MAX_TYPE+1);
> -
> -static struct {
> -    const char *vendor, *version, *date;
> -    bool have_major_minor, uefi;
> -    uint8_t major, minor;
> -} type0;
> +DECLARE_BITMAP(smbios_have_binfile_bitmap, SMBIOS_MAX_TYPE + 1);
> +DECLARE_BITMAP(smbios_have_fields_bitmap, SMBIOS_MAX_TYPE + 1);
>=20
> -static struct {
> -    const char *manufacturer, *product, *version, *serial, *sku, *family=
;
> -    /* uuid is in qemu_uuid */
> -} type1;
> +smbios_type0_t smbios_type0;
> +smbios_type1_t smbios_type1;
>=20
> static struct {
>     const char *manufacturer, *product, *version, *serial, *asset, *locat=
ion;
> @@ -491,7 +457,7 @@ static void smbios_check_type4_count(uint32_t expecte=
d_t4_count)
>     }
> }
>=20
> -static void smbios_validate_table(void)
> +void smbios_validate_table(void)
> {
>     if (smbios_ep_type =3D=3D SMBIOS_ENTRY_POINT_TYPE_32 &&
>         smbios_tables_len > SMBIOS_21_MAX_TABLES_LEN) {
> @@ -501,140 +467,12 @@ static void smbios_validate_table(void)
>     }
> }
>=20
> -
> -/* legacy setup functions for <=3D 2.0 machines */
> -static void smbios_add_field(int type, int offset, const void *data, siz=
e_t len)
> -{
> -    struct smbios_field *field;
> -
> -    if (!smbios_entries) {
> -        smbios_entries_len =3D sizeof(uint16_t);
> -        smbios_entries =3D g_malloc0(smbios_entries_len);
> -    }
> -    smbios_entries =3D g_realloc(smbios_entries, smbios_entries_len +
> -                                                  sizeof(*field) + len);
> -    field =3D (struct smbios_field *)(smbios_entries + smbios_entries_le=
n);
> -    field->header.type =3D SMBIOS_FIELD_ENTRY;
> -    field->header.length =3D cpu_to_le16(sizeof(*field) + len);
> -
> -    field->type =3D type;
> -    field->offset =3D cpu_to_le16(offset);
> -    memcpy(field->data, data, len);
> -
> -    smbios_entries_len +=3D sizeof(*field) + len;
> -    (*(uint16_t *)smbios_entries) =3D
> -            cpu_to_le16(le16_to_cpu(*(uint16_t *)smbios_entries) + 1);
> -}
> -
> -static void smbios_maybe_add_str(int type, int offset, const char *data)
> -{
> -    if (data) {
> -        smbios_add_field(type, offset, data, strlen(data) + 1);
> -    }
> -}
> -
> -static void smbios_build_type_0_fields(void)
> -{
> -    smbios_maybe_add_str(0, offsetof(struct smbios_type_0, vendor_str),
> -                         type0.vendor);
> -    smbios_maybe_add_str(0, offsetof(struct smbios_type_0, bios_version_=
str),
> -                         type0.version);
> -    smbios_maybe_add_str(0, offsetof(struct smbios_type_0,
> -                                     bios_release_date_str),
> -                         type0.date);
> -    if (type0.have_major_minor) {
> -        smbios_add_field(0, offsetof(struct smbios_type_0,
> -                                     system_bios_major_release),
> -                         &type0.major, 1);
> -        smbios_add_field(0, offsetof(struct smbios_type_0,
> -                                     system_bios_minor_release),
> -                         &type0.minor, 1);
> -    }
> -}
> -
> -static void smbios_build_type_1_fields(void)
> -{
> -    smbios_maybe_add_str(1, offsetof(struct smbios_type_1, manufacturer_=
str),
> -                         type1.manufacturer);
> -    smbios_maybe_add_str(1, offsetof(struct smbios_type_1, product_name_=
str),
> -                         type1.product);
> -    smbios_maybe_add_str(1, offsetof(struct smbios_type_1, version_str),
> -                         type1.version);
> -    smbios_maybe_add_str(1, offsetof(struct smbios_type_1, serial_number=
_str),
> -                         type1.serial);
> -    smbios_maybe_add_str(1, offsetof(struct smbios_type_1, sku_number_st=
r),
> -                         type1.sku);
> -    smbios_maybe_add_str(1, offsetof(struct smbios_type_1, family_str),
> -                         type1.family);
> -    if (qemu_uuid_set) {
> -        /* We don't encode the UUID in the "wire format" here because th=
is
> -         * function is for legacy mode and needs to keep the guest ABI, =
and
> -         * because we don't know what's the SMBIOS version advertised by=
 the
> -         * BIOS.
> -         */
> -        smbios_add_field(1, offsetof(struct smbios_type_1, uuid),
> -                         &qemu_uuid, 16);
> -    }
> -}
> -
> -uint8_t *smbios_get_table_legacy(size_t *length)
> -{
> -    int i;
> -    size_t usr_offset;
> -
> -    /* also complain if fields were given for types > 1 */
> -    if (find_next_bit(have_fields_bitmap,
> -                      SMBIOS_MAX_TYPE + 1, 2) < SMBIOS_MAX_TYPE + 1) {
> -        error_report("can't process fields for smbios "
> -                     "types > 1 on machine versions < 2.1!");
> -        exit(1);
> -    }
> -
> -    if (test_bit(4, have_binfile_bitmap)) {
> -        error_report("can't process table for smbios "
> -                     "type 4 on machine versions < 2.1!");
> -        exit(1);
> -    }
> -
> -    g_free(smbios_entries);
> -    smbios_entries_len =3D sizeof(uint16_t);
> -    smbios_entries =3D g_malloc0(smbios_entries_len);
> -
> -    for (i =3D 0, usr_offset =3D 0; usr_blobs_sizes && i < usr_blobs_siz=
es->len;
> -         i++)
> -    {
> -        struct smbios_table *table;
> -        struct smbios_structure_header *header;
> -        size_t size =3D g_array_index(usr_blobs_sizes, size_t, i);
> -
> -        header =3D (struct smbios_structure_header *)(usr_blobs + usr_of=
fset);
> -        smbios_entries =3D g_realloc(smbios_entries, smbios_entries_len =
+
> -                                                   size + sizeof(*table)=
);
> -        table =3D (struct smbios_table *)(smbios_entries + smbios_entrie=
s_len);
> -        table->header.type =3D SMBIOS_TABLE_ENTRY;
> -        table->header.length =3D cpu_to_le16(sizeof(*table) + size);
> -        memcpy(table->data, header, size);
> -        smbios_entries_len +=3D sizeof(*table) + size;
> -        (*(uint16_t *)smbios_entries) =3D
> -            cpu_to_le16(le16_to_cpu(*(uint16_t *)smbios_entries) + 1);
> -        usr_offset +=3D size;
> -    }
> -
> -    smbios_build_type_0_fields();
> -    smbios_build_type_1_fields();
> -    smbios_validate_table();
> -    *length =3D smbios_entries_len;
> -    return smbios_entries;
> -}
> -/* end: legacy setup functions for <=3D 2.0 machines */
> -
> -
> bool smbios_skip_table(uint8_t type, bool required_table)
> {
> -    if (test_bit(type, have_binfile_bitmap)) {
> +    if (test_bit(type, smbios_have_binfile_bitmap)) {
>         return true; /* user provided their own binary blob(s) */
>     }
> -    if (test_bit(type, have_fields_bitmap)) {
> +    if (test_bit(type, smbios_have_fields_bitmap)) {
>         return false; /* user provided fields via command line */
>     }
>     if (smbios_have_defaults && required_table) {
> @@ -661,25 +499,25 @@ static void smbios_build_type_0_table(void)
> {
>     SMBIOS_BUILD_TABLE_PRE(0, T0_BASE, false); /* optional, leave up to B=
IOS */
>=20
> -    SMBIOS_TABLE_SET_STR(0, vendor_str, type0.vendor);
> -    SMBIOS_TABLE_SET_STR(0, bios_version_str, type0.version);
> +    SMBIOS_TABLE_SET_STR(0, vendor_str, smbios_type0.vendor);
> +    SMBIOS_TABLE_SET_STR(0, bios_version_str, smbios_type0.version);
>=20
>     t->bios_starting_address_segment =3D cpu_to_le16(0xE800); /* from Sea=
BIOS */
>=20
> -    SMBIOS_TABLE_SET_STR(0, bios_release_date_str, type0.date);
> +    SMBIOS_TABLE_SET_STR(0, bios_release_date_str, smbios_type0.date);
>=20
>     t->bios_rom_size =3D 0; /* hardcoded in SeaBIOS with FIXME comment */
>=20
>     t->bios_characteristics =3D cpu_to_le64(0x08); /* Not supported */
>     t->bios_characteristics_extension_bytes[0] =3D 0;
>     t->bios_characteristics_extension_bytes[1] =3D 0x14; /* TCD/SVVP | VM=
 */
> -    if (type0.uefi) {
> +    if (smbios_type0.uefi) {
>         t->bios_characteristics_extension_bytes[1] |=3D 0x08; /* |=3D UEF=
I */
>     }
>=20
> -    if (type0.have_major_minor) {
> -        t->system_bios_major_release =3D type0.major;
> -        t->system_bios_minor_release =3D type0.minor;
> +    if (smbios_type0.have_major_minor) {
> +        t->system_bios_major_release =3D smbios_type0.major;
> +        t->system_bios_minor_release =3D smbios_type0.minor;
>     } else {
>         t->system_bios_major_release =3D 0;
>         t->system_bios_minor_release =3D 0;
> @@ -709,18 +547,18 @@ static void smbios_build_type_1_table(void)
> {
>     SMBIOS_BUILD_TABLE_PRE(1, T1_BASE, true); /* required */
>=20
> -    SMBIOS_TABLE_SET_STR(1, manufacturer_str, type1.manufacturer);
> -    SMBIOS_TABLE_SET_STR(1, product_name_str, type1.product);
> -    SMBIOS_TABLE_SET_STR(1, version_str, type1.version);
> -    SMBIOS_TABLE_SET_STR(1, serial_number_str, type1.serial);
> +    SMBIOS_TABLE_SET_STR(1, manufacturer_str, smbios_type1.manufacturer)=
;
> +    SMBIOS_TABLE_SET_STR(1, product_name_str, smbios_type1.product);
> +    SMBIOS_TABLE_SET_STR(1, version_str, smbios_type1.version);
> +    SMBIOS_TABLE_SET_STR(1, serial_number_str, smbios_type1.serial);
>     if (qemu_uuid_set) {
>         smbios_encode_uuid(&t->uuid, &qemu_uuid);
>     } else {
>         memset(&t->uuid, 0, 16);
>     }
>     t->wake_up_type =3D 0x06; /* power switch */
> -    SMBIOS_TABLE_SET_STR(1, sku_number_str, type1.sku);
> -    SMBIOS_TABLE_SET_STR(1, family_str, type1.family);
> +    SMBIOS_TABLE_SET_STR(1, sku_number_str, smbios_type1.sku);
> +    SMBIOS_TABLE_SET_STR(1, family_str, smbios_type1.family);
>=20
>     SMBIOS_BUILD_TABLE_POST;
> }
> @@ -1055,9 +893,9 @@ void smbios_set_defaults(const char *manufacturer, c=
onst char *product,
>     smbios_uuid_encoded =3D uuid_encoded;
>     smbios_ep_type =3D ep_type;
>=20
> -    SMBIOS_SET_DEFAULT(type1.manufacturer, manufacturer);
> -    SMBIOS_SET_DEFAULT(type1.product, product);
> -    SMBIOS_SET_DEFAULT(type1.version, version);
> +    SMBIOS_SET_DEFAULT(smbios_type1.manufacturer, manufacturer);
> +    SMBIOS_SET_DEFAULT(smbios_type1.product, product);
> +    SMBIOS_SET_DEFAULT(smbios_type1.version, version);
>     SMBIOS_SET_DEFAULT(type2.manufacturer, manufacturer);
>     SMBIOS_SET_DEFAULT(type2.product, product);
>     SMBIOS_SET_DEFAULT(type2.version, version);
> @@ -1321,23 +1159,25 @@ void smbios_entry_add(QemuOpts *opts, Error **err=
p)
>         }
>=20
>         if (header->type <=3D SMBIOS_MAX_TYPE) {
> -            if (test_bit(header->type, have_fields_bitmap)) {
> +            if (test_bit(header->type, smbios_have_fields_bitmap)) {
>                 error_setg(errp,
>                            "can't load type %d struct, fields already spe=
cified!",
>                            header->type);
>                 return;
>             }
> -            set_bit(header->type, have_binfile_bitmap);
> +            set_bit(header->type, smbios_have_binfile_bitmap);
>         }
>=20
>         if (header->type =3D=3D 4) {
>             smbios_type4_count++;
>         }
>=20
> -        if (!usr_blobs_sizes) {
> -            usr_blobs_sizes =3D g_array_new(false, false, sizeof(size_t)=
);
> -        }
> -        g_array_append_val(usr_blobs_sizes, size);
> +        /*
> +         * preserve blob size for legacy mode so it could build its
> +         * blobs flavor from 'usr_blobs'
> +         */
> +        smbios_add_usr_blob_size(size);
> +

Could this have been made as a part of a separate patch? It is extremely ha=
rd to understand why you are doing this when it=E2=80=99s a part of a large=
r code refactoring/modularisation.


>         usr_blobs_len +=3D size;
>         if (size > usr_table_max) {
>             usr_table_max =3D size;
> @@ -1356,41 +1196,42 @@ void smbios_entry_add(QemuOpts *opts, Error **err=
p)
>             return;
>         }
>=20
> -        if (test_bit(type, have_binfile_bitmap)) {
> +        if (test_bit(type, smbios_have_binfile_bitmap)) {
>             error_setg(errp, "can't add fields, binary file already loade=
d!");
>             return;
>         }
> -        set_bit(type, have_fields_bitmap);
> +        set_bit(type, smbios_have_fields_bitmap);
>=20
>         switch (type) {
>         case 0:
>             if (!qemu_opts_validate(opts, qemu_smbios_type0_opts, errp)) =
{
>                 return;
>             }
> -            save_opt(&type0.vendor, opts, "vendor");
> -            save_opt(&type0.version, opts, "version");
> -            save_opt(&type0.date, opts, "date");
> -            type0.uefi =3D qemu_opt_get_bool(opts, "uefi", false);
> +            save_opt(&smbios_type0.vendor, opts, "vendor");
> +            save_opt(&smbios_type0.version, opts, "version");
> +            save_opt(&smbios_type0.date, opts, "date");
> +            smbios_type0.uefi =3D qemu_opt_get_bool(opts, "uefi", false)=
;
>=20
>             val =3D qemu_opt_get(opts, "release");
>             if (val) {
> -                if (sscanf(val, "%hhu.%hhu", &type0.major, &type0.minor)=
 !=3D 2) {
> +                if (sscanf(val, "%hhu.%hhu", &smbios_type0.major,
> +                           &smbios_type0.minor) !=3D 2) {
>                     error_setg(errp, "Invalid release");
>                     return;
>                 }
> -                type0.have_major_minor =3D true;
> +                smbios_type0.have_major_minor =3D true;
>             }
>             return;
>         case 1:
>             if (!qemu_opts_validate(opts, qemu_smbios_type1_opts, errp)) =
{
>                 return;
>             }
> -            save_opt(&type1.manufacturer, opts, "manufacturer");
> -            save_opt(&type1.product, opts, "product");
> -            save_opt(&type1.version, opts, "version");
> -            save_opt(&type1.serial, opts, "serial");
> -            save_opt(&type1.sku, opts, "sku");
> -            save_opt(&type1.family, opts, "family");
> +            save_opt(&smbios_type1.manufacturer, opts, "manufacturer");
> +            save_opt(&smbios_type1.product, opts, "product");
> +            save_opt(&smbios_type1.version, opts, "version");
> +            save_opt(&smbios_type1.serial, opts, "serial");
> +            save_opt(&smbios_type1.sku, opts, "sku");
> +            save_opt(&smbios_type1.family, opts, "family");
>=20
>             val =3D qemu_opt_get(opts, "uuid");
>             if (val) {
> diff --git a/hw/smbios/smbios_legacy.c b/hw/smbios/smbios_legacy.c
> new file mode 100644
> index 0000000000..21f143e738
> --- /dev/null
> +++ b/hw/smbios/smbios_legacy.c
> @@ -0,0 +1,179 @@
> +/*
> + * SMBIOS legacy support
> + *
> + * Copyright (C) 2009 Hewlett-Packard Development Company, L.P.
> + * Copyright (C) 2013 Red Hat, Inc.
> + *
> + * Authors:
> + *  Alex Williamson <alex.williamson@hp.com>
> + *  Markus Armbruster <armbru@redhat.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + *
> + * Contributions after 2012-01-13 are licensed under the terms of the
> + * GNU GPL, version 2 or (at your option) any later version.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/bswap.h"
> +#include "hw/firmware/smbios.h"
> +#include "sysemu/sysemu.h"
> +#include "qemu/error-report.h"
> +
> +struct smbios_header {
> +    uint16_t length;
> +    uint8_t type;
> +} QEMU_PACKED;
> +
> +struct smbios_field {
> +    struct smbios_header header;
> +    uint8_t type;
> +    uint16_t offset;
> +    uint8_t data[];
> +} QEMU_PACKED;
> +
> +struct smbios_table {
> +    struct smbios_header header;
> +    uint8_t data[];
> +} QEMU_PACKED;
> +
> +#define SMBIOS_FIELD_ENTRY 0
> +#define SMBIOS_TABLE_ENTRY 1
> +
> +static uint8_t *smbios_entries;
> +static size_t smbios_entries_len;
> +GArray *usr_blobs_sizes;
> +
> +void smbios_add_usr_blob_size(size_t size)
> +{
> +    if (!usr_blobs_sizes) {
> +        usr_blobs_sizes =3D g_array_new(false, false, sizeof(size_t));
> +    }
> +    g_array_append_val(usr_blobs_sizes, size);
> +}
> +
> +static void smbios_add_field(int type, int offset, const void *data, siz=
e_t len)
> +{
> +    struct smbios_field *field;
> +
> +    if (!smbios_entries) {
> +        smbios_entries_len =3D sizeof(uint16_t);
> +        smbios_entries =3D g_malloc0(smbios_entries_len);
> +    }
> +    smbios_entries =3D g_realloc(smbios_entries, smbios_entries_len +
> +                                                  sizeof(*field) + len);
> +    field =3D (struct smbios_field *)(smbios_entries + smbios_entries_le=
n);
> +    field->header.type =3D SMBIOS_FIELD_ENTRY;
> +    field->header.length =3D cpu_to_le16(sizeof(*field) + len);
> +
> +    field->type =3D type;
> +    field->offset =3D cpu_to_le16(offset);
> +    memcpy(field->data, data, len);
> +
> +    smbios_entries_len +=3D sizeof(*field) + len;
> +    (*(uint16_t *)smbios_entries) =3D
> +            cpu_to_le16(le16_to_cpu(*(uint16_t *)smbios_entries) + 1);
> +}
> +
> +static void smbios_maybe_add_str(int type, int offset, const char *data)
> +{
> +    if (data) {
> +        smbios_add_field(type, offset, data, strlen(data) + 1);
> +    }
> +}
> +
> +static void smbios_build_type_0_fields(void)
> +{
> +    smbios_maybe_add_str(0, offsetof(struct smbios_type_0, vendor_str),
> +                         smbios_type0.vendor);
> +    smbios_maybe_add_str(0, offsetof(struct smbios_type_0, bios_version_=
str),
> +                         smbios_type0.version);
> +    smbios_maybe_add_str(0, offsetof(struct smbios_type_0,
> +                                     bios_release_date_str),
> +                         smbios_type0.date);
> +    if (smbios_type0.have_major_minor) {
> +        smbios_add_field(0, offsetof(struct smbios_type_0,
> +                                     system_bios_major_release),
> +                         &smbios_type0.major, 1);
> +        smbios_add_field(0, offsetof(struct smbios_type_0,
> +                                     system_bios_minor_release),
> +                         &smbios_type0.minor, 1);
> +    }
> +}
> +
> +static void smbios_build_type_1_fields(void)
> +{
> +    smbios_maybe_add_str(1, offsetof(struct smbios_type_1, manufacturer_=
str),
> +                         smbios_type1.manufacturer);
> +    smbios_maybe_add_str(1, offsetof(struct smbios_type_1, product_name_=
str),
> +                         smbios_type1.product);
> +    smbios_maybe_add_str(1, offsetof(struct smbios_type_1, version_str),
> +                         smbios_type1.version);
> +    smbios_maybe_add_str(1, offsetof(struct smbios_type_1, serial_number=
_str),
> +                         smbios_type1.serial);
> +    smbios_maybe_add_str(1, offsetof(struct smbios_type_1, sku_number_st=
r),
> +                         smbios_type1.sku);
> +    smbios_maybe_add_str(1, offsetof(struct smbios_type_1, family_str),
> +                         smbios_type1.family);
> +    if (qemu_uuid_set) {
> +        /*
> +         * We don't encode the UUID in the "wire format" here because th=
is
> +         * function is for legacy mode and needs to keep the guest ABI, =
and
> +         * because we don't know what's the SMBIOS version advertised by=
 the
> +         * BIOS.
> +         */
> +        smbios_add_field(1, offsetof(struct smbios_type_1, uuid),
> +                         &qemu_uuid, 16);
> +    }
> +}
> +
> +uint8_t *smbios_get_table_legacy(size_t *length)
> +{
> +    int i;
> +    size_t usr_offset;
> +
> +    /* complain if fields were given for types > 1 */
> +    if (find_next_bit(smbios_have_fields_bitmap,
> +                      SMBIOS_MAX_TYPE + 1, 2) < SMBIOS_MAX_TYPE + 1) {
> +        error_report("can't process fields for smbios "
> +                     "types > 1 on machine versions < 2.1!");
> +        exit(1);
> +    }
> +
> +    if (test_bit(4, smbios_have_binfile_bitmap)) {
> +        error_report("can't process table for smbios "
> +                     "type 4 on machine versions < 2.1!");
> +        exit(1);
> +    }
> +
> +    g_free(smbios_entries);
> +    smbios_entries_len =3D sizeof(uint16_t);
> +    smbios_entries =3D g_malloc0(smbios_entries_len);
> +
> +    for (i =3D 0, usr_offset =3D 0; usr_blobs_sizes && i < usr_blobs_siz=
es->len;
> +         i++)
> +    {
> +        struct smbios_table *table;
> +        struct smbios_structure_header *header;
> +        size_t size =3D g_array_index(usr_blobs_sizes, size_t, i);
> +
> +        header =3D (struct smbios_structure_header *)(usr_blobs + usr_of=
fset);
> +        smbios_entries =3D g_realloc(smbios_entries, smbios_entries_len =
+
> +                                                   size + sizeof(*table)=
);
> +        table =3D (struct smbios_table *)(smbios_entries + smbios_entrie=
s_len);
> +        table->header.type =3D SMBIOS_TABLE_ENTRY;
> +        table->header.length =3D cpu_to_le16(sizeof(*table) + size);
> +        memcpy(table->data, header, size);
> +        smbios_entries_len +=3D sizeof(*table) + size;
> +        (*(uint16_t *)smbios_entries) =3D
> +            cpu_to_le16(le16_to_cpu(*(uint16_t *)smbios_entries) + 1);
> +        usr_offset +=3D size;
> +    }
> +
> +    smbios_build_type_0_fields();
> +    smbios_build_type_1_fields();
> +    smbios_validate_table();
> +    *length =3D smbios_entries_len;
> +    return smbios_entries;
> +}
> diff --git a/hw/smbios/smbios_legacy_stub.c b/hw/smbios/smbios_legacy_stu=
b.c
> new file mode 100644
> index 0000000000..91e6c75029
> --- /dev/null
> +++ b/hw/smbios/smbios_legacy_stub.c
> @@ -0,0 +1,16 @@
> +/*
> + * IPMI SMBIOS firmware handling
> + *
> + * Copyright (c) 2024 Igor Mammedov, Red Hat, Inc.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/firmware/smbios.h"
> +
> +void smbios_add_usr_blob_size(size_t size)
> +{
> +}
> +
> --=20
> 2.39.3
>=20


