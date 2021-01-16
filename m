Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l0uDo-0003y6-RS
	for mharc-qemu-riscv@gnu.org; Sat, 16 Jan 2021 17:39:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l0uDm-0003x8-Lr; Sat, 16 Jan 2021 17:39:02 -0500
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:35963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l0uDl-0007mv-3H; Sat, 16 Jan 2021 17:39:02 -0500
Received: by mail-io1-xd32.google.com with SMTP id d81so10373380iof.3;
 Sat, 16 Jan 2021 14:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Lq2JW80kWwlpDQ58U2GuQKSW7uHMdd0VJQroswgWs2E=;
 b=raondZ25QIJLFW5y8VaLTQk2YADocSFlwYFGe8idD8/vfA6Q+cAh7ufaaeHoriIn4Y
 Aw10qfdphnmbExV1gJFrVH9yRpzASmygupdP5R0Z0Ec1lcq3lSXLYllvnn5a1pOTJI9S
 K863rr8MLk4AMMIdgEF+uX7nQIHT47+9wt/VIBcy7fNFSrNxVlD3Fl7zjq3EHuEmHfzq
 Wk0XHhS9itaHxHum60wKsfTW07XxVoH/s/JFf4Wzw3SFT907ajLHIPaDQHe/lTEWknL7
 tw0Q6h0q0/d37jDobVDHHdkksN/2h8e8mLnUA8X+pftLK2IlNrNVnmd6lmYxjus6D95H
 aAiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Lq2JW80kWwlpDQ58U2GuQKSW7uHMdd0VJQroswgWs2E=;
 b=dIIcqKRIpRq5ekpnoowbPM9hdsf7qIddaH4Q1rhZqOWbP6wpFLboolmw/rBrhVkw+Y
 PuwkHcIOekEyPcSd0U04qxrFBP0g3J4c4Qym2FEiYiySJPUNACDDgzoBMgqlPYbJ9hPN
 jHfjOxjj+661+qf8WpP+pa6MRrNaQm2iikIodnHCrQB0tZGjO5evL0a3gVXyfSQbI3rb
 B87ncrZWxfNKs9XvzoxPmq2RsSDRcDYMgJOs6n3KMf3hoGyZZZTAIU3baP5liuscOg0J
 n4u4LW0xZEZjz/jzUBZBSC1OamBtPZlIsCw3IsFPY2lNkaRG3vtbYcePopCCiOJjLeDx
 7c6A==
X-Gm-Message-State: AOAM533DSI87Sy1Lxkk/PEMdWE3brLJhqx4HZ6Dt0iAI3VkYqRQ/WC+j
 8nmrR46nfQeKfIKjqkAHeesEKr3ynzu7y00jTkc=
X-Google-Smtp-Source: ABdhPJwjoflQ0jdWiSc8Ebx3oJu77IjbW2JkmAGdhcgQXSivJSD+NsVesx/jiy0obfMjHBjoDXOqOm2CcWQSfSrf3m8=
X-Received: by 2002:a92:c942:: with SMTP id i2mr15790835ilq.227.1610836739142; 
 Sat, 16 Jan 2021 14:38:59 -0800 (PST)
MIME-Version: 1.0
References: <f3e04424723e0e222769991896cc82308fd23f76.1610751609.git.alistair.francis@wdc.com>
 <a566580a-ef30-0d2f-116e-1e3666f1187d@amsat.org>
In-Reply-To: <a566580a-ef30-0d2f-116e-1e3666f1187d@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Sat, 16 Jan 2021 14:38:32 -0800
Message-ID: <CAKmqyKNvtuY2eaQHiM4YMKyy_bWAiHFrMan_R+7M_fw7=ioW=A@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] riscv: Pass RISCVHartArrayState by pointer
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bmeng.cn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d32;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd32.google.com
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
X-List-Received-Date: Sat, 16 Jan 2021 22:39:03 -0000

On Sat, Jan 16, 2021 at 2:32 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> On 1/16/21 12:00 AM, Alistair Francis wrote:
> > We were accidently passing RISCVHartArrayState by value instead of
> > pointer. The type is 824 bytes long so let's correct that and pass it b=
y
> > pointer instead.
> >
> > Fixes: Coverity CID 1438099
> > Fixes: Coverity CID 1438100
> > Fixes: Coverity CID 1438101
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  include/hw/riscv/boot.h |  6 +++---
> >  hw/riscv/boot.c         |  8 ++++----
> >  hw/riscv/sifive_u.c     | 10 +++++-----
> >  hw/riscv/spike.c        |  8 ++++----
> >  hw/riscv/virt.c         |  8 ++++----
> >  5 files changed, 20 insertions(+), 20 deletions(-)
> >
> > diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
> > index 20ff5fe5e5..11a21dd584 100644
> > --- a/include/hw/riscv/boot.h
> > +++ b/include/hw/riscv/boot.h
> > @@ -24,9 +24,9 @@
> >  #include "hw/loader.h"
> >  #include "hw/riscv/riscv_hart.h"
> >
> > -bool riscv_is_32bit(RISCVHartArrayState harts);
> > +bool riscv_is_32bit(RISCVHartArrayState *harts);
> >
> > -target_ulong riscv_calc_kernel_start_addr(RISCVHartArrayState harts,
> > +target_ulong riscv_calc_kernel_start_addr(RISCVHartArrayState *harts,
> >                                            target_ulong firmware_end_ad=
dr);
> >  target_ulong riscv_find_and_load_firmware(MachineState *machine,
> >                                            const char *default_machine_=
firmware,
> > @@ -42,7 +42,7 @@ target_ulong riscv_load_kernel(const char *kernel_fil=
ename,
> >  hwaddr riscv_load_initrd(const char *filename, uint64_t mem_size,
> >                           uint64_t kernel_entry, hwaddr *start);
> >  uint32_t riscv_load_fdt(hwaddr dram_start, uint64_t dram_size, void *f=
dt);
> > -void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArraySt=
ate harts,
> > +void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArraySt=
ate *harts,
> >                                 hwaddr saddr,
> >                                 hwaddr rom_base, hwaddr rom_size,
> >                                 uint64_t kernel_entry,
> > diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> > index 83586aef41..acf77675b2 100644
> > --- a/hw/riscv/boot.c
> > +++ b/hw/riscv/boot.c
> > @@ -33,14 +33,14 @@
> >
> >  #include <libfdt.h>
> >
> > -bool riscv_is_32bit(RISCVHartArrayState harts)
> > +bool riscv_is_32bit(RISCVHartArrayState *harts)
> >  {
> > -    RISCVCPU hart =3D harts.harts[0];
> > +    RISCVCPU hart =3D harts->harts[0];
>
> This doesn't look improved. Maybe you want:
>
>        return riscv_cpu_is_32bit(&harts->harts[0].env);

I suspect this ends up generating the same code.

Either way, good point I have just squashed this change into the patch.

Alistair

>
> >
> >      return riscv_cpu_is_32bit(&hart.env);
> >  }

