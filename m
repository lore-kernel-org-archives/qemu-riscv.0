Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C63BDC3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 05:24:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLchG-0004V9-On; Fri, 05 Jan 2024 00:24:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLchE-0004UR-Ma; Fri, 05 Jan 2024 00:24:40 -0500
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLchD-0005FX-1P; Fri, 05 Jan 2024 00:24:40 -0500
Received: by mail-ua1-x934.google.com with SMTP id
 a1e0cc1a2514c-7cc0f5bcb4fso440323241.1; 
 Thu, 04 Jan 2024 21:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704432277; x=1705037077; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FwdA6WdijysZ9q+QKAOZuqXxvlqY+Vu5vFFYgL7ZxWM=;
 b=mdyDODMDQYgvpItvtLHCCgvFKTZtEQMD5qYNj+6C9rEP4CLYimAkgT/l3aXaWzJ/M+
 IpnuplwijXYU6IMXWxEjY58AP8NmADbMsBZIKbusq/VL2QkRcAn6OwYVTDJOfJPVzm3Y
 ETeEbSvleLRN9WQNJBUD1zaAM23PIg+ZspPggvrKPoiuEUmuxL4oKRliOiDWA6YyXkZk
 I9y+fZ7DAdarIhRKrGzmgyVNqN6H9Az93KD6vI4rT8YGn19DEDY5roXN8GvV0GLGz+sR
 mUJnLLLECPfeY7JVy44F6wLP19Dj1xN9tuqsqsJ9j5I55KMuqAsm66/G6+53AVXXZ5A4
 cXtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704432277; x=1705037077;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FwdA6WdijysZ9q+QKAOZuqXxvlqY+Vu5vFFYgL7ZxWM=;
 b=RBWt1cVUwaF6qnXWeluJ9+Tre9496TefWXgtW600hCUGwthwZnCxlDPH+410KcySzX
 aCTa6gEgCsWW4+9UlGaAfcahy8P5lX6Fuxzq0hIZCEDcGO7uQeVgxdkz5XUAuFI9kZfx
 2A0KbFDD3cXfb2Ij+6/Pl7F7gA1cTBsltyAkVaiZrCOh/0xBugHuj4USQb49KKU4QRU8
 9+K707WvcyowQkyKBK9Vs+08EQWzw0ekDAXh0JVS8cdL5HEswZjUnNo6ZiReU9HNsW7+
 D15jrtL/XuL0tVGY0NVi1M3f3OosSfbO8PPj/7JZ55FMOZMYm9r1IeroPnF6ACmRyqJe
 UMiQ==
X-Gm-Message-State: AOJu0Yyo+oPhuiO+0m7F6hIDhueIf439SsExphPdJwg1LyLFuqddTiu5
 7ay2+RT3q8lQlk7C5Rv+vQ719TW5x8+12f70mwI=
X-Google-Smtp-Source: AGHT+IFzbKI7tFM9CMH30I3s0J8O20lbGNGRr0+A79fZkdByXgrC+mmU8gqhsiWWOGHBOL0qvAOrmM7mqP1nOuLcGOw=
X-Received: by 2002:a05:6102:3713:b0:467:759f:b00b with SMTP id
 s19-20020a056102371300b00467759fb00bmr1739369vst.5.1704432277596; Thu, 04 Jan
 2024 21:24:37 -0800 (PST)
MIME-Version: 1.0
References: <20231229120724.41383-1-heinrich.schuchardt@canonical.com>
 <20231229120724.41383-2-heinrich.schuchardt@canonical.com>
In-Reply-To: <20231229120724.41383-2-heinrich.schuchardt@canonical.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 5 Jan 2024 15:24:11 +1000
Message-ID: <CAKmqyKNmyMKMDuUwrgi4RQnAAWAJ7uSzMztDnHW+HRaM1zPNDA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] smbios: add processor-family option
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Bin Meng <bin.meng@windriver.com>, 
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::934;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x934.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Fri, Dec 29, 2023 at 10:48=E2=80=AFPM Heinrich Schuchardt
<heinrich.schuchardt@canonical.com> wrote:
>
> For RISC-V the SMBIOS standard requires specific values of the processor
> family value depending on the bitness of the CPU.

Can you provide some details of where this is described? I can't seem to fi=
nd it

Alistair

>
> Add a processor-family option for SMBIOS table 4.
>
> The value of processor-family may exceed 255 and therefore must be provid=
ed
> in the Processor Family 2 field. Set the Processor Family field to 0xFE
> which signals that the Processor Family 2 is used.
>
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> ---
> v2:
>         new patch
> ---
>  hw/smbios/smbios.c | 13 +++++++++++--
>  qemu-options.hx    |  4 ++--
>  2 files changed, 13 insertions(+), 4 deletions(-)
>
> diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
> index 2a90601ac5..647bc6d603 100644
> --- a/hw/smbios/smbios.c
> +++ b/hw/smbios/smbios.c
> @@ -102,6 +102,7 @@ static struct {
>  #define DEFAULT_CPU_SPEED 2000
>
>  static struct {
> +    uint16_t processor_family;
>      const char *sock_pfx, *manufacturer, *version, *serial, *asset, *par=
t;
>      uint64_t max_speed;
>      uint64_t current_speed;
> @@ -110,6 +111,7 @@ static struct {
>      .max_speed =3D DEFAULT_CPU_SPEED,
>      .current_speed =3D DEFAULT_CPU_SPEED,
>      .processor_id =3D 0,
> +    .processor_family =3D 0x01, /* Other */
>  };
>
>  struct type8_instance {
> @@ -337,6 +339,10 @@ static const QemuOptDesc qemu_smbios_type4_opts[] =
=3D {
>          .name =3D "part",
>          .type =3D QEMU_OPT_STRING,
>          .help =3D "part number",
> +    }, {
> +        .name =3D "processor-family",
> +        .type =3D QEMU_OPT_NUMBER,
> +        .help =3D "processor family",
>      }, {
>          .name =3D "processor-id",
>          .type =3D QEMU_OPT_NUMBER,
> @@ -726,7 +732,7 @@ static void smbios_build_type_4_table(MachineState *m=
s, unsigned instance)
>      snprintf(sock_str, sizeof(sock_str), "%s%2x", type4.sock_pfx, instan=
ce);
>      SMBIOS_TABLE_SET_STR(4, socket_designation_str, sock_str);
>      t->processor_type =3D 0x03; /* CPU */
> -    t->processor_family =3D 0x01; /* Other */
> +    t->processor_family =3D 0xfe; /* use Processor Family 2 field */
>      SMBIOS_TABLE_SET_STR(4, processor_manufacturer_str, type4.manufactur=
er);
>      if (type4.processor_id =3D=3D 0) {
>          t->processor_id[0] =3D cpu_to_le32(smbios_cpuid_version);
> @@ -758,7 +764,7 @@ static void smbios_build_type_4_table(MachineState *m=
s, unsigned instance)
>      t->thread_count =3D (threads_per_socket > 255) ? 0xFF : threads_per_=
socket;
>
>      t->processor_characteristics =3D cpu_to_le16(0x02); /* Unknown */
> -    t->processor_family2 =3D cpu_to_le16(0x01); /* Other */
> +    t->processor_family2 =3D cpu_to_le16(type4.processor_family);
>
>      if (tbl_len =3D=3D SMBIOS_TYPE_4_LEN_V30) {
>          t->core_count2 =3D t->core_enabled2 =3D cpu_to_le16(cores_per_so=
cket);
> @@ -1402,6 +1408,9 @@ void smbios_entry_add(QemuOpts *opts, Error **errp)
>                  return;
>              }
>              save_opt(&type4.sock_pfx, opts, "sock_pfx");
> +            type4.processor_family =3D qemu_opt_get_number(opts,
> +                                                         "processor-fami=
ly",
> +                                                         0x01 /* Other *=
/);
>              save_opt(&type4.manufacturer, opts, "manufacturer");
>              save_opt(&type4.version, opts, "version");
>              save_opt(&type4.serial, opts, "serial");
> diff --git a/qemu-options.hx b/qemu-options.hx
> index b66570ae00..7bdb414345 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -2694,7 +2694,7 @@ DEF("smbios", HAS_ARG, QEMU_OPTION_smbios,
>      "                specify SMBIOS type 3 fields\n"
>      "-smbios type=3D4[,sock_pfx=3Dstr][,manufacturer=3Dstr][,version=3Ds=
tr][,serial=3Dstr]\n"
>      "              [,asset=3Dstr][,part=3Dstr][,max-speed=3D%d][,current=
-speed=3D%d]\n"
> -    "              [,processor-id=3D%d]\n"
> +    "              [,processor-family=3D%d,processor-id=3D%d]\n"
>      "                specify SMBIOS type 4 fields\n"
>      "-smbios type=3D8[,external_reference=3Dstr][,internal_reference=3Ds=
tr][,connector_type=3D%d][,port_type=3D%d]\n"
>      "                specify SMBIOS type 8 fields\n"
> @@ -2722,7 +2722,7 @@ SRST
>  ``-smbios type=3D3[,manufacturer=3Dstr][,version=3Dstr][,serial=3Dstr][,=
asset=3Dstr][,sku=3Dstr]``
>      Specify SMBIOS type 3 fields
>
> -``-smbios type=3D4[,sock_pfx=3Dstr][,manufacturer=3Dstr][,version=3Dstr]=
[,serial=3Dstr][,asset=3Dstr][,part=3Dstr][,processor-id=3D%d]``
> +``-smbios type=3D4[,sock_pfx=3Dstr][,manufacturer=3Dstr][,version=3Dstr]=
[,serial=3Dstr][,asset=3Dstr][,part=3Dstr][,processor-family=3D%d][,process=
or-id=3D%d]``
>      Specify SMBIOS type 4 fields
>
>  ``-smbios type=3D11[,value=3Dstr][,path=3Dfilename]``
> --
> 2.43.0
>
>

