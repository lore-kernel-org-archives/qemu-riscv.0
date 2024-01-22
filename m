Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0386FC47DD3
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 04:54:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rRmK9-0003q0-2A; Sun, 21 Jan 2024 23:54:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRmK7-0003pS-73; Sun, 21 Jan 2024 23:54:15 -0500
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRmK5-0002k0-BB; Sun, 21 Jan 2024 23:54:14 -0500
Received: by mail-vs1-xe2e.google.com with SMTP id
 ada2fe7eead31-46781bd40f8so439029137.1; 
 Sun, 21 Jan 2024 20:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705899252; x=1706504052; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zy52xBxUNeT52zGNu+hDdYIiAmR4ghaKaTzP6obNHEk=;
 b=WCVzQGnF7dau1qpUw30a5kLHdGVgM1Z1Q4im0qdAEuknqUzwV7+L5gkUnM8KggOXl4
 OhWyCcAOTy0O3D+b7B5oBcgvZxwyo03SiP1Du9fqFE1zLFmZItqOPOEovSHGRvzxd9n4
 Ct5ITd0x0fnmT0lqcWwcAMxQ0OoXtcywwbkIO5oS0l0anDwjQjjsAm0nR8IPtd73HlGk
 JkA1wlHPysonMAT5a1DrdNhbHfXJtkNu0UxLZFirPh2M/ioj/ovml9TsuiBaC3xrQzEY
 xXuA2XFUWSNOWDV7pBg70sxGrHqpsZaf17jExnnfyRHcjftQv6NKmhUjtYi4ATLQwIjB
 W6Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705899252; x=1706504052;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zy52xBxUNeT52zGNu+hDdYIiAmR4ghaKaTzP6obNHEk=;
 b=E6AOapzH8+wSHrFebFt72s8WbeRSwDWNW5F3wjy3GOtZ91BtHrjhJOo59nAb8ZLRRz
 j7dOn+DW6RB3wLTda+OrvVyUCKay5pvX3DKXwrdbKe25rhQL7xKHYH/T9BpT+G5o9l7A
 BLVZ6B6dKOrbdCWH0v8t7n/RmjIRf38bdFK/cjjTkA5kEaZg8z5169HJKtaeojGP+bBC
 pqdiQPZRHdIszSgxPKYr6vj9s0+puKG62cFRSUC2CasE4DjTOyw19ZgcSyS3PM5KlEf/
 t2w19iZrNieaIIcv69eVZe4xPmpa+j0QJKEPUoBkuloL1bm0SIt+g4rRngFEVwliPPk5
 x41g==
X-Gm-Message-State: AOJu0YwMC7gLuT5hpIvo4k8mRzvSLoO3R1l2e7rkwmNaER8GfAmUgyLS
 1x4p+tdJZ7ZrZz3CrVjpL292g07z+ue8F6ab+zfgpLkCbVIyBd571DtwccMhV5nW2VE5iawlkiZ
 Sfrc5gfSphdhPkdTXHrDYmIjEdI4=
X-Google-Smtp-Source: AGHT+IG3FBIBLMN4XV1VGcPvQe9gp7Y3qLwVr95xU2CSgtAlW5f4ESTyoyRC47gV3eTiOUdvC2UrBaeZFrhji26jxpo=
X-Received: by 2002:a67:c905:0:b0:469:8c51:c625 with SMTP id
 w5-20020a67c905000000b004698c51c625mr909093vsk.29.1705899251831; Sun, 21 Jan
 2024 20:54:11 -0800 (PST)
MIME-Version: 1.0
References: <20231229120724.41383-1-heinrich.schuchardt@canonical.com>
 <20231229120724.41383-2-heinrich.schuchardt@canonical.com>
 <CAKmqyKNmyMKMDuUwrgi4RQnAAWAJ7uSzMztDnHW+HRaM1zPNDA@mail.gmail.com>
 <cf9b3023-d6d4-4da9-ab1e-da440f98bf3e@canonical.com>
In-Reply-To: <cf9b3023-d6d4-4da9-ab1e-da440f98bf3e@canonical.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Jan 2024 14:53:45 +1000
Message-ID: <CAKmqyKNcwkscRz8FAiCQTWhcZCeCbAozciyOBSUpSsEuBMKK5w@mail.gmail.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2e;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2e.google.com
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

On Fri, Jan 5, 2024 at 3:44=E2=80=AFPM Heinrich Schuchardt
<heinrich.schuchardt@canonical.com> wrote:
>
> On 1/5/24 06:24, Alistair Francis wrote:
> > On Fri, Dec 29, 2023 at 10:48=E2=80=AFPM Heinrich Schuchardt
> > <heinrich.schuchardt@canonical.com> wrote:
> >>
> >> For RISC-V the SMBIOS standard requires specific values of the process=
or
> >> family value depending on the bitness of the CPU.
> >
> > Can you provide some details of where this is described? I can't seem t=
o find it
> >
> > Alistair
>
> System Management BIOS (SMBIOS) Reference Specification 3.7.0 (DSP0134)
> https://www.dmtf.org/sites/default/files/standards/documents/DSP0134_3.7.=
0.pdf
> 7.5.2 Processor Information =E2=80=94 Processor Family
> Table 23 =E2=80=93 Processor Information: Processor Family field
>
> 200h 512 RISC-V RV32
> 201h 513 RISC-V RV64
> 202h 514 RISC-V RV128
>
> While for other architectures values for different CPU generations have
> been defined the values for RISC-V only depend on the bitness.

Ah, I first read the commit message as saying this is RISC-V specific,
which I couldn't find in the spec.

I now realise you just mean it's important for RISC-V

Alistair

>
> Best regards
>
> Heinrich
>
> >
> >>
> >> Add a processor-family option for SMBIOS table 4.
> >>
> >> The value of processor-family may exceed 255 and therefore must be pro=
vided
> >> in the Processor Family 2 field. Set the Processor Family field to 0xF=
E
> >> which signals that the Processor Family 2 is used.
> >>
> >> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> >> ---
> >> v2:
> >>          new patch
> >> ---
> >>   hw/smbios/smbios.c | 13 +++++++++++--
> >>   qemu-options.hx    |  4 ++--
> >>   2 files changed, 13 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
> >> index 2a90601ac5..647bc6d603 100644
> >> --- a/hw/smbios/smbios.c
> >> +++ b/hw/smbios/smbios.c
> >> @@ -102,6 +102,7 @@ static struct {
> >>   #define DEFAULT_CPU_SPEED 2000
> >>
> >>   static struct {
> >> +    uint16_t processor_family;
> >>       const char *sock_pfx, *manufacturer, *version, *serial, *asset, =
*part;
> >>       uint64_t max_speed;
> >>       uint64_t current_speed;
> >> @@ -110,6 +111,7 @@ static struct {
> >>       .max_speed =3D DEFAULT_CPU_SPEED,
> >>       .current_speed =3D DEFAULT_CPU_SPEED,
> >>       .processor_id =3D 0,
> >> +    .processor_family =3D 0x01, /* Other */
> >>   };
> >>
> >>   struct type8_instance {
> >> @@ -337,6 +339,10 @@ static const QemuOptDesc qemu_smbios_type4_opts[]=
 =3D {
> >>           .name =3D "part",
> >>           .type =3D QEMU_OPT_STRING,
> >>           .help =3D "part number",
> >> +    }, {
> >> +        .name =3D "processor-family",
> >> +        .type =3D QEMU_OPT_NUMBER,
> >> +        .help =3D "processor family",
> >>       }, {
> >>           .name =3D "processor-id",
> >>           .type =3D QEMU_OPT_NUMBER,
> >> @@ -726,7 +732,7 @@ static void smbios_build_type_4_table(MachineState=
 *ms, unsigned instance)
> >>       snprintf(sock_str, sizeof(sock_str), "%s%2x", type4.sock_pfx, in=
stance);
> >>       SMBIOS_TABLE_SET_STR(4, socket_designation_str, sock_str);
> >>       t->processor_type =3D 0x03; /* CPU */
> >> -    t->processor_family =3D 0x01; /* Other */
> >> +    t->processor_family =3D 0xfe; /* use Processor Family 2 field */
> >>       SMBIOS_TABLE_SET_STR(4, processor_manufacturer_str, type4.manufa=
cturer);
> >>       if (type4.processor_id =3D=3D 0) {
> >>           t->processor_id[0] =3D cpu_to_le32(smbios_cpuid_version);
> >> @@ -758,7 +764,7 @@ static void smbios_build_type_4_table(MachineState=
 *ms, unsigned instance)
> >>       t->thread_count =3D (threads_per_socket > 255) ? 0xFF : threads_=
per_socket;
> >>
> >>       t->processor_characteristics =3D cpu_to_le16(0x02); /* Unknown *=
/
> >> -    t->processor_family2 =3D cpu_to_le16(0x01); /* Other */
> >> +    t->processor_family2 =3D cpu_to_le16(type4.processor_family);
> >>
> >>       if (tbl_len =3D=3D SMBIOS_TYPE_4_LEN_V30) {
> >>           t->core_count2 =3D t->core_enabled2 =3D cpu_to_le16(cores_pe=
r_socket);
> >> @@ -1402,6 +1408,9 @@ void smbios_entry_add(QemuOpts *opts, Error **er=
rp)
> >>                   return;
> >>               }
> >>               save_opt(&type4.sock_pfx, opts, "sock_pfx");
> >> +            type4.processor_family =3D qemu_opt_get_number(opts,
> >> +                                                         "processor-f=
amily",
> >> +                                                         0x01 /* Othe=
r */);
> >>               save_opt(&type4.manufacturer, opts, "manufacturer");
> >>               save_opt(&type4.version, opts, "version");
> >>               save_opt(&type4.serial, opts, "serial");
> >> diff --git a/qemu-options.hx b/qemu-options.hx
> >> index b66570ae00..7bdb414345 100644
> >> --- a/qemu-options.hx
> >> +++ b/qemu-options.hx
> >> @@ -2694,7 +2694,7 @@ DEF("smbios", HAS_ARG, QEMU_OPTION_smbios,
> >>       "                specify SMBIOS type 3 fields\n"
> >>       "-smbios type=3D4[,sock_pfx=3Dstr][,manufacturer=3Dstr][,version=
=3Dstr][,serial=3Dstr]\n"
> >>       "              [,asset=3Dstr][,part=3Dstr][,max-speed=3D%d][,cur=
rent-speed=3D%d]\n"
> >> -    "              [,processor-id=3D%d]\n"
> >> +    "              [,processor-family=3D%d,processor-id=3D%d]\n"
> >>       "                specify SMBIOS type 4 fields\n"
> >>       "-smbios type=3D8[,external_reference=3Dstr][,internal_reference=
=3Dstr][,connector_type=3D%d][,port_type=3D%d]\n"
> >>       "                specify SMBIOS type 8 fields\n"
> >> @@ -2722,7 +2722,7 @@ SRST
> >>   ``-smbios type=3D3[,manufacturer=3Dstr][,version=3Dstr][,serial=3Dst=
r][,asset=3Dstr][,sku=3Dstr]``
> >>       Specify SMBIOS type 3 fields
> >>
> >> -``-smbios type=3D4[,sock_pfx=3Dstr][,manufacturer=3Dstr][,version=3Ds=
tr][,serial=3Dstr][,asset=3Dstr][,part=3Dstr][,processor-id=3D%d]``
> >> +``-smbios type=3D4[,sock_pfx=3Dstr][,manufacturer=3Dstr][,version=3Ds=
tr][,serial=3Dstr][,asset=3Dstr][,part=3Dstr][,processor-family=3D%d][,proc=
essor-id=3D%d]``
> >>       Specify SMBIOS type 4 fields
> >>
> >>   ``-smbios type=3D11[,value=3Dstr][,path=3Dfilename]``
> >> --
> >> 2.43.0
> >>
> >>
>

