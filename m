Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5566EC8738
	for <qemu-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 15:57:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qeHNo-0002cn-HP; Thu, 07 Sep 2023 11:57:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1qeHNn-0002cX-G1
 for qemu-riscv@nongnu.org; Thu, 07 Sep 2023 11:57:27 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1qeHNj-0007VU-F2
 for qemu-riscv@nongnu.org; Thu, 07 Sep 2023 11:57:26 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-52e5900cf77so1527844a12.2
 for <qemu-riscv@nongnu.org>; Thu, 07 Sep 2023 08:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1694102241; x=1694707041;
 darn=nongnu.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LwqJZOjA2zwYyn/9QZIn7b06gJ8iGI9lKt51LKFWVDA=;
 b=yFeQZqS9JWKzUkuG7SMGKp7wQXJw21Qe9uesJ8IKx95aPP3ZGv0jfPh1fpZbU2rkR2
 rgbqfDC4vqofrs9/RW1K5U2wVjxB09pHpyEDawdMzmGmNHsX57/R40HvTyZO0PgyywwH
 NqfzgzLoannkD5VX9NXZzY3DiWGU4/afbRn3nMqrRQ6rQXB7BMn3esCHBvtr896WEjiX
 A/vsojJmf9kbDCjR+Gocq6HbBAtu9aGsTfAl2/Uu4PspPI6bT6BAnSYcqflrs/CBjTgf
 0c0on5QEU0e5lfa8hQpgtfWu0fSe+LUPCglQO52FveY4dxFE68Ymix3YwStXk7iJU2hk
 1vEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694102241; x=1694707041;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LwqJZOjA2zwYyn/9QZIn7b06gJ8iGI9lKt51LKFWVDA=;
 b=E4qNE7DMYmn3gycy61NzKCoMBI0/I36pIR7awYOzNx81ufCuBdxTmJB+vW6ylZyAd5
 TNd+39z7esdYhX7pvHvQOD2MlswwTM4frdI/A62x0Nt5J4dXRhLLgBwlkKVjqR2Hozd+
 c/ZX9yBwIeGAynPPcEZfPed7q47em74jqB9njqMdNoZuS2uwNiyfMkszEE8Za0FDSr+b
 z8oRzTYDNTplCGY/pvxUTuK0F7KAGBR5v67E6MC4qiAtvXNsJGWFzyHvp+St9ysKXgb3
 5GpNN5ACprMV+Md5dNYuNeEnJBlUMub0Xhm3S/lOFreRkDiTfc0VTl0VafY3WpLfpk0O
 JcAw==
X-Gm-Message-State: AOJu0Yz2YV8KZXRU5IyKEA6Ok59Ne8A96Rsv+Z0sScFPb5EJ6LRUoqbu
 dVrdyHGcBrzlKPy1DofqBuK8bW1PJJ5xy/rT6l9c+A==
X-Google-Smtp-Source: AGHT+IEy6EVe0vrTe1YrNG0sq7nRZQ28L915a9/I3Ym8aQXYsvsU5nlz3+8JmQlVdBxtU3qypugs2edxsheUNMqzN8M=
X-Received: by 2002:a17:906:1db2:b0:9a6:4fe0:4552 with SMTP id
 u18-20020a1709061db200b009a64fe04552mr5214910ejh.46.1694102241143; Thu, 07
 Sep 2023 08:57:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230731015317.1026996-1-fei2.wu@intel.com>
 <ea7d2188-97ad-9563-1b92-cf998f4b1747@ventanamicro.com>
 <49bbec5d-d0da-55e2-875b-3a8874bc3322@intel.com>
 <CAKmqyKMtAzt5saCUMd4vXYfgAQibpzQJAhtTSuSb+yeKhcYpfw@mail.gmail.com>
In-Reply-To: <CAKmqyKMtAzt5saCUMd4vXYfgAQibpzQJAhtTSuSb+yeKhcYpfw@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 7 Sep 2023 21:27:10 +0530
Message-ID: <CAAhSdy3nvdG04Fuv49fxKgwpDH4r9CZ-Xgg19s8FeVw_HC-y_g@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: split RAM into low and high memory
To: Alistair Francis <alistair23@gmail.com>
Cc: "Wu, Fei" <fei2.wu@intel.com>, Anup Patel <apatel@ventanamicro.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, palmer@dabbelt.com,
 alistair.francis@wdc.com, 
 bin.meng@windriver.com, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Andrei Warkentin <andrei.warkentin@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2a00:1450:4864:20::52a;
 envelope-from=anup@brainfault.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On Thu, Sep 7, 2023 at 8:48=E2=80=AFAM Alistair Francis <alistair23@gmail.c=
om> wrote:
>
> On Thu, Aug 3, 2023 at 10:47=E2=80=AFAM Wu, Fei <fei2.wu@intel.com> wrote=
:
> >
> > On 8/1/2023 6:46 AM, Daniel Henrique Barboza wrote:
> > >
> > >
> > > On 7/30/23 22:53, Fei Wu wrote:
> > >> riscv virt platform's memory started at 0x80000000 and
> > >> straddled the 4GiB boundary. Curiously enough, this choice
> > >> of a memory layout will prevent from launching a VM with
> > >> a bit more than 2000MiB and PCIe pass-thru on an x86 host, due
> > >> to identity mapping requirements for the MSI doorbell on x86,
> > >> and these (APIC/IOAPIC) live right below 4GiB.
> > >>
> > >> So just split the RAM range into two portions:
> > >> - 1 GiB range from 0x80000000 to 0xc0000000.
> > >> - The remainder at 0x100000000
> > >>
> > >> ...leaving a hole between the ranges.
> > >
> > > I am afraid this breaks some existing distro setups, like Ubuntu. Aft=
er
> > > this patch
> > > this emulation stopped working:
> > >
> > > ~/work/qemu/build/qemu-system-riscv64 \
> > >     -machine virt -nographic -m 8G -smp 8 \
> > >     -kernel ./uboot-ubuntu/usr/lib/u-boot/qemu-riscv64_smode/uboot.el=
f \
> > >     -drive file=3Dsnapshot.img,format=3Dqcow2,if=3Dvirtio \
> > >     -netdev bridge,id=3Dbridge1,br=3Dvirbr0 -device
> > > virtio-net-pci,netdev=3Dbridge1
> > >
> > >
> > > This is basically a guest created via the official Canonical tutorial=
:
> > >
> > > https://wiki.ubuntu.com/RISC-V/QEMU
> > >
> > > The error being thrown:
> > >
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >
> > > Boot HART ID              : 4
> > > Boot HART Domain          : root
> > > Boot HART Priv Version    : v1.12
> > > Boot HART Base ISA        : rv64imafdch
> > > Boot HART ISA Extensions  : time,sstc
> > > Boot HART PMP Count       : 16
> > > Boot HART PMP Granularity : 4
> > > Boot HART PMP Address Bits: 54
> > > Boot HART MHPM Count      : 16
> > > Boot HART MIDELEG         : 0x0000000000001666
> > > Boot HART MEDELEG         : 0x0000000000f0b509
> > >
> > >
> > > U-Boot 2022.07+dfsg-1ubuntu4.2 (Nov 24 2022 - 18:47:41 +0000)
> > >
> > > CPU:
> > > rv64imafdch_zicbom_zicboz_zicsr_zifencei_zihintpause_zawrs_zfa_zca_zc=
d_zba_zbb_zbc_zbs_sstc_svadu
> > > Model: riscv-virtio,qemu
> > > DRAM:  Unhandled exception: Store/AMO access fault
> > > EPC: 00000000802018b8 RA: 00000000802126a0 TVAL: 00000000ff733f90
> > >
> > > Code: b823 06b2 bc23 06b2 b023 08b2 b423 08b2 (b823 08b2)
> > >
> > >
> > > resetting ...
> > > System reset not supported on this platform
> > > ### ERROR ### Please RESET the board ###
> > > QEMU 8.0.90 monitor - type 'help' for more infor
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >
> > >
> > > Based on the change made I can make an educated guess on what is goin=
g
> > > wrong.
> > > We have another board with a similar memory topology you're making he=
re,
> > > the
> > > Microchip Polarfire (microchip_pfsoc.c). We were having some problems
> > > with this
> > > board while trying to consolidate the boot process between all boards=
 in
> > > hw/riscv/boot.c because of its non-continuous RAM bank. The full stor=
y
> > > can be
> > > read in the commit message of 4b402886ac89 ("hw/riscv: change
> > > riscv_compute_fdt_addr()
> > > semantics") but the short version can be seen in riscv_compute_fdt_ad=
dr()
> > > from boot.c:
> > >
> > >  - if ram_start is less than 3072MiB, the FDT will be  put at the low=
est
> > > value
> > > between 3072 MiB and the end of that RAM bank;
> > >
> > > - if ram_start is higher than 3072 MiB the FDT will be put at the end=
 of
> > > the
> > > RAM bank.
> > >
> > > So, after this patch, since riscv_compute_fdt_addr() is being used wi=
th
> > > the now
> > > lower RAM bank, the fdt is being put in LOW_MEM - fdt_size for any se=
tup
> > > that has
> > > more than 1Gb RAM, and this breaks assumptions made by uboot and Ubun=
tu
> > > and possibly
> > > others that are trying to retrieve the FDT from the gap that you crea=
ted
> > > between
> > > low and hi mem in this patch.
> > >
> > > In fact, this same Ubuntu guest I mentioned above will boot if I put
> > > only 1 Gb of RAM
> > > (-m 1Gb). If I try with -m 1.1Gb I reproduce this error. This can be =
a
> > > validation of
> > > the guess I'm making here: Ubuntu is trying to fetch stuff (probably =
the
> > > fdt) from
> > > the gap between the memory areas.
> > >
> > > This change on top of this patch doesn't work either:
> > >
> > > $ git diff
> > > diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> > > index 8fbdc7220c..dfff48d849 100644
> > > --- a/hw/riscv/virt.c
> > > +++ b/hw/riscv/virt.c
> > > @@ -1335,9 +1335,16 @@ static void virt_machine_done(Notifier *notifi=
er,
> > > void *data)
> > >                                           kernel_start_addr, true, NU=
LL);
> > >      }
> > >
> > > -    fdt_load_addr =3D riscv_compute_fdt_addr(memmap[VIRT_DRAM].base,
> > > +    if (machine->ram_size < memmap[VIRT_DRAM].size) {
> > > +        fdt_load_addr =3D riscv_compute_fdt_addr(memmap[VIRT_DRAM].b=
ase,
> > >                                             memmap[VIRT_DRAM].size,
> > >                                             machine);
> > > +    } else {
> > > +        fdt_load_addr =3D
> > > riscv_compute_fdt_addr(memmap[VIRT_DRAM_HIGH].base,
> > > +                                           memmap[VIRT_DRAM_HIGH].si=
ze,
> > > +                                           machine);
> > > +    }
> > > +
> > >
> > > This would put the fdt at the end of the HI RAM for guests with more
> > > than 1Gb of RAM.
> > > This change in fact makes the situation even worse, breaking setups t=
hat
> > > were working
> > > before with this patch.
> > >
> > > There's a chance that reducing the gap between the RAM banks can make
> > > Ubuntu work
> > > reliably again but now I'm a little cold feet with this change.
> > >
> > >
> > > I think we'll need some kernel/Opensbi folks to weight in here to see=
 if
> > > there's a
> > > failsafe memory setup that won't break distros out there and allow yo=
ur
> > > passthrough
> > > to work.
> > >
> > Hi Daniel,
> >
> > Do you know who we should talk to? I think it's not uncommon to have
> > seperated multi-range memory, the stack should support this configurati=
on.
>
> @Palmer Dabbelt @Anup Patel any ideas?
>

Sparse memory and multiple memory banks are a reality and seen
on many platforms.

Based on my experience:
* Linux RISC-V already supports SPARSEMEM and multiple
  RAM banks.
* OpenSBI also handles multiple RAM banks nicely.
* U-Boot requires some kconfig option setting otherwise
   even U-Boot handles it fine.

Regards,
Anup

