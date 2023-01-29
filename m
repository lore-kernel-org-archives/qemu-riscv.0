Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pMGWW-000461-AY
	for mharc-qemu-riscv@gnu.org; Sun, 29 Jan 2023 17:51:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pMGWG-00045B-6x; Sun, 29 Jan 2023 17:51:31 -0500
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pMGWE-0001g5-8h; Sun, 29 Jan 2023 17:51:27 -0500
Received: by mail-vs1-xe35.google.com with SMTP id i185so10758609vsc.6;
 Sun, 29 Jan 2023 14:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NlAGN8yc5gDGgu9f/88EGyDV5hZRAa54oGqx6U59crU=;
 b=SaJxDbWOMfRIRdnjvrQ+tMSw5qYEtOKJeDmmuCrr4nENAobM/knrM0yYAtwsaw6REV
 epAh1ARlojqs+jXrUGZgJjOAKvxWMQmRANio3BU+fMTsiSE7aoNYzsHCG3ZV7/rtD65g
 QHfrokZipEF3gcDONUT30pz0exbgFxar7KeO39VjkSXEHiqpQ4IifblSuB8wAcqfnkSy
 U8pPN4y7iEirBxu+sO2e4bNrDvuSw/vthR8LwtpJY9P7T5EoWazQ/ijSEOKHJOveK3qc
 LTlFAhbS+IwCogH0YZAHXv9sNJY1+VrMstu3B+BdvnlTfux0hgTAGXH9fnT0mtDDW3T3
 /d2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NlAGN8yc5gDGgu9f/88EGyDV5hZRAa54oGqx6U59crU=;
 b=gskNaPmo9ySgwRzpI2Ck3M3oWjG2k/8O6pAXDv/azzkt7J2J5k2D/KIpebVUOR/No9
 rdDoU9ZcKRxGOTNm1TPOFhawQweWAYKoN3IOxf9cS2+/I+lC3zcl5TXNVjnkajSrFj2A
 PSdljgZbebbnYSNkehENISyi5W3RtQWCfl9E7AuaFrtp7o2cvnLNJBsTBhhCzfZFvutz
 h3Z1gIRN0GSUVy3PRSZsgKeasQyD/xppYIKo/kf6WOjQDM4gPfO06Y4nY85i09CnO4VR
 rBHIp7FxnHDmDxjhRpDgbiLjIw6w7f+nERzi75FuBEWxrQSeODq0qCU01pkQREfhQJok
 dzaA==
X-Gm-Message-State: AO0yUKXj9uRdw72n79OkrGwHoJ4uFpDrQ1LtU/PgoCKJQlL75FHFIU25
 NbHm+AZh69msby8u4YzwxiJ+9frA4aCl7Xi8+0LKt/MXN3I=
X-Google-Smtp-Source: AK7set/NJl3cpVbUztJNzm7NhgPzf2OR3eVanxy5a8EKpgAp1FxqpHFMjbNSSnVhtMDpgOPEDRHu3Gde6rmxTZzZzdI=
X-Received: by 2002:a67:e184:0:b0:3eb:f205:2c08 with SMTP id
 e4-20020a67e184000000b003ebf2052c08mr1591684vsl.10.1675032683354; Sun, 29 Jan
 2023 14:51:23 -0800 (PST)
MIME-Version: 1.0
References: <20230113171805.470252-1-dbarboza@ventanamicro.com>
 <20230113171805.470252-4-dbarboza@ventanamicro.com>
 <CAEUhbmUKEHX5bQ2=7GfgjPY1YVFs-5MqzkbwEy_SgG43WdeAfg@mail.gmail.com>
 <CAKmqyKOGrdcoVWBzhuUpdDVwHdK6PREsLO1MypMQyggWdcHjJA@mail.gmail.com>
 <CAEUhbmUhF_vd1yj0O=Kap__yjh9a4eFzWgsPA2k4a4sHZ9TbLA@mail.gmail.com>
In-Reply-To: <CAEUhbmUhF_vd1yj0O=Kap__yjh9a4eFzWgsPA2k4a4sHZ9TbLA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 30 Jan 2023 08:50:57 +1000
Message-ID: <CAKmqyKMe+d_nfObvUUKvez0Mf1-YZz5KQfWvRkwUy-f3DJZU1w@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] hw/riscv: clear kernel_entry higher bits in
 load_elf_ram_sym()
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e35;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe35.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sun, 29 Jan 2023 22:51:40 -0000

On Thu, Jan 26, 2023 at 10:07 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi Alistair,
>
> On Mon, Jan 16, 2023 at 12:28 PM Alistair Francis <alistair23@gmail.com> wrote:
> >
> > On Sat, Jan 14, 2023 at 11:41 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > On Sat, Jan 14, 2023 at 1:18 AM Daniel Henrique Barboza
> > > <dbarboza@ventanamicro.com> wrote:
> > > >
> > > > Recent hw/risc/boot.c changes caused a regression in an use case with
> > > > the Xvisor hypervisor. Running a 32 bit QEMU guest with '-kernel'
> > > > stopped working. The reason seems to be that Xvisor is using 64 bit to
> > > > encode the 32 bit addresses from the guest, and load_elf_ram_sym() is
> > > > sign-extending the result with '1's [1].
> > >
> > > I would say it's not a regression of QEMU but something weird happened
> > > to Alistair's 32-bit Xvisor image.
> >
> > I don't think it's a Xvisor issue.
> >
> > >
> > > I just built a 32-bit Xvisor image from the latest Xvisor head
> > > following the instructions provided in its source tree. With the
> > > mainline QEMU only BIN file boots, but ELF does not. My 32-bit Xvisor
> > > image has an address of 0x10000000. Apparently this address is not
> > > correct, and the issue I saw is different from Alistair's. Alistair,
> > > could you investigate why your 32-bit Xvisor ELF image has an address
> > > of 0xffffffff80000000 set to kernel_load_base?
> >
> > Looking in load_elf() in include/hw/elf_ops.h at this line:
> >
> >     if (lowaddr)
> >         *lowaddr = (uint64_t)(elf_sword)low;
> >
> > I can see that `low` is 0x80000000 but lowaddr is set to
> > 0xffffffff80000000. So the address is being sign extended with 1s.
> >
>
> I don't understand the sign extension here. This seems intentional as
> the codes does the signed extension then casted to unsigned 64-bit.
>
> Do you know why?

No idea!

Alistair

>
> > This patch seems to be the correct fix.
> >
>
> Regards,
> Bin

