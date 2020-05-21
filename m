Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jbtWU-00020g-2x
	for mharc-qemu-riscv@gnu.org; Thu, 21 May 2020 18:18:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jbtWR-00020K-W3; Thu, 21 May 2020 18:18:40 -0400
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141]:42112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jbtWQ-00011C-Vs; Thu, 21 May 2020 18:18:39 -0400
Received: by mail-il1-x141.google.com with SMTP id 18so8862841iln.9;
 Thu, 21 May 2020 15:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tnT6/bezgmoSKNRFgPtR/obPQBE8mHp/3IQx4yme7+E=;
 b=ukIUO8xcKdyMBav3mRXSg/wlk8UKe2krtjWw9xd3TskhyFAt2MYDEsMNVy/zzZmFYt
 cIPojjgSNFh4hiO5uTfu3n+1o9FbhZmmjWMTzrNAyEBqEOpO0u5EtfSMEEL9a+ehyxoI
 iH50ZVYNxeHQBU0YmcIwn0KxWGsNu9o9PGsH5iSwLD3umYgLWe8eippoTTGv6eI/vnQP
 vYptRr7ndUH1FZZj8FMfVPqyQCMed+7NjPVNgfwu9H6LM2bW8tCr6AkNmapoFjUG/gqb
 IPehKm5CJtRxMy91R8JbYRnezQDzcwYoN5k570YfU4HEtAdI21up37yrqCZ3RrK3PO7n
 WlPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tnT6/bezgmoSKNRFgPtR/obPQBE8mHp/3IQx4yme7+E=;
 b=Fd7vUSKiUCdbhV1i3AzLdk2MSANFQYzSYnwWtO7cesBBrAOmfKoM4+JEuw4x5QHLkO
 buHyJYfXP/QlmyFKiXaGrAFL2nBVzF0/lLxZyrmf/vnBfLvE2l3QM3+P4LCjS3hdJ3gY
 dbCILxFRFES0W+w7r1zl4qh3Kxq0BEl7UxmwCcKbPjY5BV6IHZFgAmhw5NYqc7QeUCjW
 Xe4UvbUCXmoND0NbKtuGUZlE1b4eTLL+eKKlhA960onB32Ouc5BB8L5W7B0c88SAAGfm
 TaF28Pai2cAJLrxNkj7zHa4HXjUYQOxylKJODOBmmJeft8BHj8s8IyqbO03BViSUHX+S
 CSBQ==
X-Gm-Message-State: AOAM5319ouKOZIT1aMQ+m1zum/x38M6p+BYFzSZZp0e8arPbKv0KD3TO
 6+VW+mWfEoRqusvjtR5hRQJPYCQ6wE2JtwuxTe8=
X-Google-Smtp-Source: ABdhPJwHQa0vivvd4FpB8reQIE0tE+YtZc/hkTZZaKFEAaRQNVDn6IJ89NNYM9ci1BIexpkUVAA9ZpbZq6vK0gD0igw=
X-Received: by 2002:a92:d087:: with SMTP id h7mr11311887ilh.227.1590099517375; 
 Thu, 21 May 2020 15:18:37 -0700 (PDT)
MIME-Version: 1.0
References: <1590072147-13035-1-git-send-email-bmeng.cn@gmail.com>
 <c6fba5b7-1191-29bf-a4b7-4707efecb973@amsat.org>
In-Reply-To: <c6fba5b7-1191-29bf-a4b7-4707efecb973@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 21 May 2020 15:09:41 -0700
Message-ID: <CAKmqyKOLYwy3U=Wye9K1NuDuOoUNi8M1EKj+EeLoHEZQsLCdtQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/riscv: sifive_u: Remove the riscv_ prefix of the
 soc* functions
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::141;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x141.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
X-List-Received-Date: Thu, 21 May 2020 22:18:40 -0000

On Thu, May 21, 2020 at 7:48 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> On 5/21/20 4:42 PM, Bin Meng wrote:
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > To keep consistency with the machine* functions, remove the riscv_
> > prefix of the soc* functions.
> >
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> > ---
> >
> >   hw/riscv/sifive_u.c | 24 ++++++++++++------------
> >   1 file changed, 12 insertions(+), 12 deletions(-)
> >
> > diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> > index 4299bdf..f9fef2b 100644
> > --- a/hw/riscv/sifive_u.c
> > +++ b/hw/riscv/sifive_u.c
> > @@ -481,7 +481,7 @@ static void sifive_u_machine_init_register_types(vo=
id)
> >
> >   type_init(sifive_u_machine_init_register_types)
> >
> > -static void riscv_sifive_u_soc_init(Object *obj)
> > +static void sifive_u_soc_instance_init(Object *obj)
> >   {
> >       MachineState *ms =3D MACHINE(qdev_get_machine());
> >       SiFiveUSoCState *s =3D RISCV_U_SOC(obj);
> > @@ -520,7 +520,7 @@ static void riscv_sifive_u_soc_init(Object *obj)
> >                             TYPE_CADENCE_GEM);
> >   }
> >
> > -static void riscv_sifive_u_soc_realize(DeviceState *dev, Error **errp)
> > +static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
> >   {
> >       MachineState *ms =3D MACHINE(qdev_get_machine());
> >       SiFiveUSoCState *s =3D RISCV_U_SOC(dev);
> > @@ -635,32 +635,32 @@ static void riscv_sifive_u_soc_realize(DeviceStat=
e *dev, Error **errp)
> >           memmap[SIFIVE_U_GEM_MGMT].base, memmap[SIFIVE_U_GEM_MGMT].siz=
e);
> >   }
> >
> > -static Property riscv_sifive_u_soc_props[] =3D {
> > +static Property sifive_u_soc_props[] =3D {
> >       DEFINE_PROP_UINT32("serial", SiFiveUSoCState, serial, OTP_SERIAL)=
,
> >       DEFINE_PROP_END_OF_LIST()
> >   };
> >
> > -static void riscv_sifive_u_soc_class_init(ObjectClass *oc, void *data)
> > +static void sifive_u_soc_class_init(ObjectClass *oc, void *data)
> >   {
> >       DeviceClass *dc =3D DEVICE_CLASS(oc);
> >
> > -    device_class_set_props(dc, riscv_sifive_u_soc_props);
> > -    dc->realize =3D riscv_sifive_u_soc_realize;
> > +    device_class_set_props(dc, sifive_u_soc_props);
> > +    dc->realize =3D sifive_u_soc_realize;
> >       /* Reason: Uses serial_hds in realize function, thus can't be use=
d twice */
> >       dc->user_creatable =3D false;
> >   }
> >
> > -static const TypeInfo riscv_sifive_u_soc_type_info =3D {
> > +static const TypeInfo sifive_u_soc_type_info =3D {
> >       .name =3D TYPE_RISCV_U_SOC,
> >       .parent =3D TYPE_DEVICE,
> >       .instance_size =3D sizeof(SiFiveUSoCState),
> > -    .instance_init =3D riscv_sifive_u_soc_init,
> > -    .class_init =3D riscv_sifive_u_soc_class_init,
> > +    .instance_init =3D sifive_u_soc_instance_init,
> > +    .class_init =3D sifive_u_soc_class_init,
> >   };
> >
> > -static void riscv_sifive_u_soc_register_types(void)
> > +static void sifive_u_soc_register_types(void)
> >   {
> > -    type_register_static(&riscv_sifive_u_soc_type_info);
> > +    type_register_static(&sifive_u_soc_type_info);
> >   }
> >
> > -type_init(riscv_sifive_u_soc_register_types)
> > +type_init(sifive_u_soc_register_types)
> >
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
>

