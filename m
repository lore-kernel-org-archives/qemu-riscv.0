Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j9dxy-00025n-R1
	for mharc-qemu-riscv@gnu.org; Wed, 04 Mar 2020 19:02:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55512)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1j9dxw-00023N-AZ
 for qemu-riscv@nongnu.org; Wed, 04 Mar 2020 19:02:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1j9dxu-0002fA-Vd
 for qemu-riscv@nongnu.org; Wed, 04 Mar 2020 19:02:16 -0500
Received: from mail-vs1-xe42.google.com ([2607:f8b0:4864:20::e42]:44635)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1j9dxs-0002bc-4Z; Wed, 04 Mar 2020 19:02:12 -0500
Received: by mail-vs1-xe42.google.com with SMTP id u24so2414537vso.11;
 Wed, 04 Mar 2020 16:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lgKn0m21RATykAjfa8cP+IEC/G3g6jyw/uYKrhhAzY4=;
 b=LiRCwgKCgzk4OmUu5U/drOMRXT6uivxjH5+fYMKQIyNSh4WKiYxQQSJH65ML3a51MP
 2uaW/liFFK0//CiG+qFG5KSE0nxsMX5wEA3jGx2KVVlU8ot4bl8XtNFt0OtwmgkjInph
 7RBE1Rn7pstYyCDRyqkLWOkHJkJprXZ93ouYO4jaGeMrqXU/h8BFzUkSqoSmDcE0BCS8
 L1BuxkrtO7bjb7pMHL6ki1Ln0TfKMCTuot7+RI19ShlQuCHaj8f+5L6rEOOE37ASOGnM
 K+tQf0AJJ+NSUsYINCV3ZvTrQeCTjml52z/AnpBx5ZV93a6o+6kP7+SsPJ3VXvyxgtZl
 tqFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lgKn0m21RATykAjfa8cP+IEC/G3g6jyw/uYKrhhAzY4=;
 b=GkJFn9YzgqS7eXhWjmpD8WNcc9IvD1E698dKOLDuRzcC7ge1yrXYBcgIxvrnj1I1bN
 nkYZLMXtN1PsF/W1rR09znGdHPUHI1qK+U50ZEl4OUU738NRsX8cVHUbCMOZ57wVaarB
 7wS65NY3v7SORFeqRQ84wKY/LPwdV0HjZCarBbl5xE1oNQ5aAJhYH5Atzl5U4Xj02wGV
 tilpOo2fUGe1UMMMluaeNlcGtvymnJLoMPrDvc/H78SkZlWlyes6FEVMQsBvglNCuz9s
 vNGw4WERXG/GMPk9vnmPDW1C9u8h9v8i5HcrXAvfzl5oM3LKJooWOPSfWylUY8UXoPpD
 eHSw==
X-Gm-Message-State: ANhLgQ0n5LTta4iNy3oeZx5M4LrPi/rx6GY33WQZzsOaU/mIGAhn8j/p
 KtOgZ/hcVcfsMixxIL09huIVAcsRJzbJ59dJwbw=
X-Google-Smtp-Source: ADFU+vvhmPJPZyxkPJMGGHMvQ/KT6lQCwX97k23GqaXqWqGxeIRJgWA0HYk0r8mbjc7qcsXJiz/+xFZL2Fs2qeiRvtY=
X-Received: by 2002:a67:fa43:: with SMTP id j3mr2767865vsq.70.1583366530912;
 Wed, 04 Mar 2020 16:02:10 -0800 (PST)
MIME-Version: 1.0
References: <cover.1583285287.git.alistair.francis@wdc.com>
 <3f5f5106d357f6ff911e4b81973840d414920b78.1583285287.git.alistair.francis@wdc.com>
 <CAEUhbmW=T50FcppnLFAzdQNwQEwofX9U-Zyo2oJikSiS8ti4QQ@mail.gmail.com>
In-Reply-To: <CAEUhbmW=T50FcppnLFAzdQNwQEwofX9U-Zyo2oJikSiS8ti4QQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 4 Mar 2020 15:54:29 -0800
Message-ID: <CAKmqyKOuHG4ACEf4y3gyUZijduXvN703qTtkSz4vBT1srLwE5g@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] riscv/sifive_u: Fix up file ordering
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::e42
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
X-List-Received-Date: Thu, 05 Mar 2020 00:02:18 -0000

On Wed, Mar 4, 2020 at 6:10 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Wed, Mar 4, 2020 at 9:37 AM Alistair Francis
> <alistair.francis@wdc.com> wrote:
> >
> > Split the file into clear machine and SoC sections.
> >
>
> Yep, I found functions in this file are a little bit confusing as well ..
>
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  hw/riscv/sifive_u.c | 107 ++++++++++++++++++++++----------------------
> >  1 file changed, 54 insertions(+), 53 deletions(-)
> >
> > diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> > index 156a003642..9a0145b5b4 100644
> > --- a/hw/riscv/sifive_u.c
> > +++ b/hw/riscv/sifive_u.c
> > @@ -399,6 +399,60 @@ static void riscv_sifive_u_init(MachineState *machine)
>
> So while we are here, could we rename this to something like:
> sifive_u_machine_init()? ie: drop the riscv_ prefix.
>
> >                            &address_space_memory);
> >  }
> >
> > +static bool sifive_u_get_start_in_flash(Object *obj, Error **errp)
>
> and sifive_u_machine_get_start_in_flash()? and other functions too?
>
> > +{
> > +    SiFiveUState *s = RISCV_U_MACHINE(obj);
> > +
> > +    return s->start_in_flash;
> > +}
> > +
> > +static void sifive_u_set_start_in_flash(Object *obj, bool value, Error **errp)
> > +{
> > +    SiFiveUState *s = RISCV_U_MACHINE(obj);
> > +
> > +    s->start_in_flash = value;
> > +}
> > +
> > +static void riscv_sifive_u_machine_instance_init(Object *obj)
> > +{
> > +    SiFiveUState *s = RISCV_U_MACHINE(obj);
> > +
> > +    s->start_in_flash = false;
> > +    object_property_add_bool(obj, "start-in-flash", sifive_u_get_start_in_flash,
> > +                             sifive_u_set_start_in_flash, NULL);
> > +    object_property_set_description(obj, "start-in-flash",
> > +                                    "Set on to tell QEMU's ROM to jump to " \
> > +                                    "flash. Otherwise QEMU will jump to DRAM",
> > +                                    NULL);
> > +}
> > +
> > +
> > +static void riscv_sifive_u_machine_class_init(ObjectClass *oc, void *data)
> > +{
> > +    MachineClass *mc = MACHINE_CLASS(oc);
> > +
> > +    mc->desc = "RISC-V Board compatible with SiFive U SDK";
> > +    mc->init = riscv_sifive_u_init;
> > +    mc->max_cpus = SIFIVE_U_MANAGEMENT_CPU_COUNT + SIFIVE_U_COMPUTE_CPU_COUNT;
> > +    mc->min_cpus = SIFIVE_U_MANAGEMENT_CPU_COUNT + 1;
> > +    mc->default_cpus = mc->min_cpus;
> > +}
> > +
> > +static const TypeInfo riscv_sifive_u_machine_typeinfo = {
> > +    .name       = MACHINE_TYPE_NAME("sifive_u"),
> > +    .parent     = TYPE_MACHINE,
> > +    .class_init = riscv_sifive_u_machine_class_init,
> > +    .instance_init = riscv_sifive_u_machine_instance_init,
> > +    .instance_size = sizeof(SiFiveUState),
> > +};
> > +
> > +static void riscv_sifive_u_machine_init_register_types(void)
> > +{
> > +    type_register_static(&riscv_sifive_u_machine_typeinfo);
> > +}
> > +
> > +type_init(riscv_sifive_u_machine_init_register_types)
> > +
> >  static void riscv_sifive_u_soc_init(Object *obj)
>
> Similarly this can be renamed to: sifive_u_soc_init(), and other soc functions.

I missed this in v2, fixed in the next version.

Alistair

>
> >  {
> >      MachineState *ms = MACHINE(qdev_get_machine());
> > @@ -439,33 +493,6 @@ static void riscv_sifive_u_soc_init(Object *obj)
> >                            TYPE_CADENCE_GEM);
> >  }
> >
> > -static bool sifive_u_get_start_in_flash(Object *obj, Error **errp)
> > -{
> > -    SiFiveUState *s = RISCV_U_MACHINE(obj);
> > -
> > -    return s->start_in_flash;
> > -}
> > -
> > -static void sifive_u_set_start_in_flash(Object *obj, bool value, Error **errp)
> > -{
> > -    SiFiveUState *s = RISCV_U_MACHINE(obj);
> > -
> > -    s->start_in_flash = value;
> > -}
> > -
> > -static void riscv_sifive_u_machine_instance_init(Object *obj)
> > -{
> > -    SiFiveUState *s = RISCV_U_MACHINE(obj);
> > -
> > -    s->start_in_flash = false;
> > -    object_property_add_bool(obj, "start-in-flash", sifive_u_get_start_in_flash,
> > -                             sifive_u_set_start_in_flash, NULL);
> > -    object_property_set_description(obj, "start-in-flash",
> > -                                    "Set on to tell QEMU's ROM to jump to " \
> > -                                    "flash. Otherwise QEMU will jump to DRAM",
> > -                                    NULL);
> > -}
> > -
> >  static void riscv_sifive_u_soc_realize(DeviceState *dev, Error **errp)
> >  {
> >      MachineState *ms = MACHINE(qdev_get_machine());
> > @@ -603,29 +630,3 @@ static void riscv_sifive_u_soc_register_types(void)
> >  }
> >
> >  type_init(riscv_sifive_u_soc_register_types)
> > -
> > -static void riscv_sifive_u_machine_class_init(ObjectClass *oc, void *data)
> > -{
> > -    MachineClass *mc = MACHINE_CLASS(oc);
> > -
> > -    mc->desc = "RISC-V Board compatible with SiFive U SDK";
> > -    mc->init = riscv_sifive_u_init;
> > -    mc->max_cpus = SIFIVE_U_MANAGEMENT_CPU_COUNT + SIFIVE_U_COMPUTE_CPU_COUNT;
> > -    mc->min_cpus = SIFIVE_U_MANAGEMENT_CPU_COUNT + 1;
> > -    mc->default_cpus = mc->min_cpus;
> > -}
> > -
> > -static const TypeInfo riscv_sifive_u_machine_typeinfo = {
> > -    .name       = MACHINE_TYPE_NAME("sifive_u"),
> > -    .parent     = TYPE_MACHINE,
> > -    .class_init = riscv_sifive_u_machine_class_init,
> > -    .instance_init = riscv_sifive_u_machine_instance_init,
> > -    .instance_size = sizeof(SiFiveUState),
> > -};
> > -
> > -static void riscv_sifive_u_machine_init_register_types(void)
> > -{
> > -    type_register_static(&riscv_sifive_u_machine_typeinfo);
> > -}
> > -
> > -type_init(riscv_sifive_u_machine_init_register_types)
> > --
>
> Regards,
> Bin

