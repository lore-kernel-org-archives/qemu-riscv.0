Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j9Uiz-0003P1-Sh
	for mharc-qemu-riscv@gnu.org; Wed, 04 Mar 2020 09:10:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51748)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1j9Uis-00038m-Se
 for qemu-riscv@nongnu.org; Wed, 04 Mar 2020 09:10:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1j9Uir-0008Jf-Gu
 for qemu-riscv@nongnu.org; Wed, 04 Mar 2020 09:10:06 -0500
Received: from mail-yw1-xc43.google.com ([2607:f8b0:4864:20::c43]:40010)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1j9Uim-0008BA-J3; Wed, 04 Mar 2020 09:10:00 -0500
Received: by mail-yw1-xc43.google.com with SMTP id t192so2016194ywe.7;
 Wed, 04 Mar 2020 06:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xf5QouyH3BndECmQgUr5Xdc/HOWK5p0EBH0h1gW1ZZk=;
 b=lDPlT+laNVYbEi7wwtiyEQlfoKCQ5X3lyYHislnFTnO49X096sVq9UbZHm4OWd/y/W
 T2VzxBzymTZfxuRGS5HBHra1tK18YPWW6hZzS1dbb9di+GjtW9UUBmYhxMUWDvSB8yAS
 jMrYf4MUzin/6eKDXhBWmqEk90uY4qikndgTfnRH/ZeiBkHwN++uL2uFqiEqFQgd/ZFv
 7dz07Ym1vMGf2nj2CvyAvAFoDexL8rEFGsPEEVJBbGr13JegaRnVGAkFbqsqJCdHL+lf
 2ZzpJIWFKNdw5NAA0F4OA6KWPqU9/cKlWJq++4ivHVvrq2aYXhbXDLx2hdK4tn0w5B5k
 eOFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xf5QouyH3BndECmQgUr5Xdc/HOWK5p0EBH0h1gW1ZZk=;
 b=LXepUIpj4uERbunDqc2bcLNY9sZgpQW6nsikGhq6WD+9ycjdMiQGDsURaw+wZOmokC
 qVFt2kY9+S90sK0t0qMiTU7KlIro163f5CBsDsUK+Ua9xXnUmfwGKxJJ8DaE5hg2+nJy
 Yy0p8RjmC6uEX3WTmvSPHl0c1Pv3m/zf2164SVY/H1WGPAc6HCh7q1Lxn+8U0PfeOJbC
 469LdGWv0B8CEPdv5ldpm5GE5rfMXg9Bui3FDTY0EulAgspTIE+fo0emxYFpOy9EStte
 KNMZS/smiwrobzSP5sc9UM+ELsIr62qc6Rhm6aikKk1Rj4I+c5INwPJHHbILc+YjQTFc
 0BDw==
X-Gm-Message-State: ANhLgQ1C6uGU8pnn6BdGUqfiDeeqc4oisnajaj7U9nCUEY7sJUQEGn6B
 bOOFLjt6pKllBuQueDYA4bdsJ7jGPiirJ03LapE=
X-Google-Smtp-Source: ADFU+vvCYfhesrABeS8X3Ycy4dpOm+u1J6yhoGVLIJghJtMI91/s69nbfmNEFp01XzTGkWuHcMYyQY2Qu/iuezsRaJM=
X-Received: by 2002:a25:bd87:: with SMTP id f7mr2810668ybh.11.1583330999681;
 Wed, 04 Mar 2020 06:09:59 -0800 (PST)
MIME-Version: 1.0
References: <cover.1583285287.git.alistair.francis@wdc.com>
 <3f5f5106d357f6ff911e4b81973840d414920b78.1583285287.git.alistair.francis@wdc.com>
In-Reply-To: <3f5f5106d357f6ff911e4b81973840d414920b78.1583285287.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 4 Mar 2020 22:09:49 +0800
Message-ID: <CAEUhbmW=T50FcppnLFAzdQNwQEwofX9U-Zyo2oJikSiS8ti4QQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] riscv/sifive_u: Fix up file ordering
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c43
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Mar 2020 14:10:12 -0000

On Wed, Mar 4, 2020 at 9:37 AM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Split the file into clear machine and SoC sections.
>

Yep, I found functions in this file are a little bit confusing as well ..

> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/riscv/sifive_u.c | 107 ++++++++++++++++++++++----------------------
>  1 file changed, 54 insertions(+), 53 deletions(-)
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 156a003642..9a0145b5b4 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -399,6 +399,60 @@ static void riscv_sifive_u_init(MachineState *machine)

So while we are here, could we rename this to something like:
sifive_u_machine_init()? ie: drop the riscv_ prefix.

>                            &address_space_memory);
>  }
>
> +static bool sifive_u_get_start_in_flash(Object *obj, Error **errp)

and sifive_u_machine_get_start_in_flash()? and other functions too?

> +{
> +    SiFiveUState *s = RISCV_U_MACHINE(obj);
> +
> +    return s->start_in_flash;
> +}
> +
> +static void sifive_u_set_start_in_flash(Object *obj, bool value, Error **errp)
> +{
> +    SiFiveUState *s = RISCV_U_MACHINE(obj);
> +
> +    s->start_in_flash = value;
> +}
> +
> +static void riscv_sifive_u_machine_instance_init(Object *obj)
> +{
> +    SiFiveUState *s = RISCV_U_MACHINE(obj);
> +
> +    s->start_in_flash = false;
> +    object_property_add_bool(obj, "start-in-flash", sifive_u_get_start_in_flash,
> +                             sifive_u_set_start_in_flash, NULL);
> +    object_property_set_description(obj, "start-in-flash",
> +                                    "Set on to tell QEMU's ROM to jump to " \
> +                                    "flash. Otherwise QEMU will jump to DRAM",
> +                                    NULL);
> +}
> +
> +
> +static void riscv_sifive_u_machine_class_init(ObjectClass *oc, void *data)
> +{
> +    MachineClass *mc = MACHINE_CLASS(oc);
> +
> +    mc->desc = "RISC-V Board compatible with SiFive U SDK";
> +    mc->init = riscv_sifive_u_init;
> +    mc->max_cpus = SIFIVE_U_MANAGEMENT_CPU_COUNT + SIFIVE_U_COMPUTE_CPU_COUNT;
> +    mc->min_cpus = SIFIVE_U_MANAGEMENT_CPU_COUNT + 1;
> +    mc->default_cpus = mc->min_cpus;
> +}
> +
> +static const TypeInfo riscv_sifive_u_machine_typeinfo = {
> +    .name       = MACHINE_TYPE_NAME("sifive_u"),
> +    .parent     = TYPE_MACHINE,
> +    .class_init = riscv_sifive_u_machine_class_init,
> +    .instance_init = riscv_sifive_u_machine_instance_init,
> +    .instance_size = sizeof(SiFiveUState),
> +};
> +
> +static void riscv_sifive_u_machine_init_register_types(void)
> +{
> +    type_register_static(&riscv_sifive_u_machine_typeinfo);
> +}
> +
> +type_init(riscv_sifive_u_machine_init_register_types)
> +
>  static void riscv_sifive_u_soc_init(Object *obj)

Similarly this can be renamed to: sifive_u_soc_init(), and other soc functions.

>  {
>      MachineState *ms = MACHINE(qdev_get_machine());
> @@ -439,33 +493,6 @@ static void riscv_sifive_u_soc_init(Object *obj)
>                            TYPE_CADENCE_GEM);
>  }
>
> -static bool sifive_u_get_start_in_flash(Object *obj, Error **errp)
> -{
> -    SiFiveUState *s = RISCV_U_MACHINE(obj);
> -
> -    return s->start_in_flash;
> -}
> -
> -static void sifive_u_set_start_in_flash(Object *obj, bool value, Error **errp)
> -{
> -    SiFiveUState *s = RISCV_U_MACHINE(obj);
> -
> -    s->start_in_flash = value;
> -}
> -
> -static void riscv_sifive_u_machine_instance_init(Object *obj)
> -{
> -    SiFiveUState *s = RISCV_U_MACHINE(obj);
> -
> -    s->start_in_flash = false;
> -    object_property_add_bool(obj, "start-in-flash", sifive_u_get_start_in_flash,
> -                             sifive_u_set_start_in_flash, NULL);
> -    object_property_set_description(obj, "start-in-flash",
> -                                    "Set on to tell QEMU's ROM to jump to " \
> -                                    "flash. Otherwise QEMU will jump to DRAM",
> -                                    NULL);
> -}
> -
>  static void riscv_sifive_u_soc_realize(DeviceState *dev, Error **errp)
>  {
>      MachineState *ms = MACHINE(qdev_get_machine());
> @@ -603,29 +630,3 @@ static void riscv_sifive_u_soc_register_types(void)
>  }
>
>  type_init(riscv_sifive_u_soc_register_types)
> -
> -static void riscv_sifive_u_machine_class_init(ObjectClass *oc, void *data)
> -{
> -    MachineClass *mc = MACHINE_CLASS(oc);
> -
> -    mc->desc = "RISC-V Board compatible with SiFive U SDK";
> -    mc->init = riscv_sifive_u_init;
> -    mc->max_cpus = SIFIVE_U_MANAGEMENT_CPU_COUNT + SIFIVE_U_COMPUTE_CPU_COUNT;
> -    mc->min_cpus = SIFIVE_U_MANAGEMENT_CPU_COUNT + 1;
> -    mc->default_cpus = mc->min_cpus;
> -}
> -
> -static const TypeInfo riscv_sifive_u_machine_typeinfo = {
> -    .name       = MACHINE_TYPE_NAME("sifive_u"),
> -    .parent     = TYPE_MACHINE,
> -    .class_init = riscv_sifive_u_machine_class_init,
> -    .instance_init = riscv_sifive_u_machine_instance_init,
> -    .instance_size = sizeof(SiFiveUState),
> -};
> -
> -static void riscv_sifive_u_machine_init_register_types(void)
> -{
> -    type_register_static(&riscv_sifive_u_machine_typeinfo);
> -}
> -
> -type_init(riscv_sifive_u_machine_init_register_types)
> --

Regards,
Bin

