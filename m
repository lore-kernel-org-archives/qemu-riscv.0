Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 464F3EE14D3
	for <qemu-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 03:18:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qe5WX-0008N4-VQ; Wed, 06 Sep 2023 23:17:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qe5WU-0008LL-OJ; Wed, 06 Sep 2023 23:17:39 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qe5WS-0001dU-0I; Wed, 06 Sep 2023 23:17:38 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-52e297c7c39so501547a12.2; 
 Wed, 06 Sep 2023 20:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694056653; x=1694661453; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UHfeFMGTFg/hgxDchx79Q0fAyOOSOOfhkwpVATWZPdo=;
 b=WGp8QcDRevYOoywWkU3oBI3dCVI9u6HsrucfhVH78JTdtGrdcic4ievLIy5jWqO3fm
 hSTsJ8S0weMcAp9Cep2oN+Nv/fBsEUhxAz7UvO02x8WO9EpWlYwwgO7gjVEQrXd5oc4Y
 gjljhkzdEi5Fu2/wc40KUIqIk25Ikl+V+11ghfFI/mkMnQKeqeWEmNofQyJY9Glo615b
 zhKpfwNNIxgYyHxlVXU200eijoKqVi40ejoVZnFER5f6HAOlhlbGey7yGjmy/zmi2X7x
 fw54Ukzuzo5A7+sM+pOayIAWlAdG2VFB2gIFgEBLuXlF/Bh5lPAl2KzvE6X35s/MiOoy
 cnGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694056653; x=1694661453;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UHfeFMGTFg/hgxDchx79Q0fAyOOSOOfhkwpVATWZPdo=;
 b=NDm+Dmu1WP1fn9HevrDmMuY9/9gyFQfuZUMPSGOaY5mntje4la7tMwaKtoIKj6CAOv
 ECoQ/PSCrLhBIbcZLE8RbxdETgUxdcZyI8K2irvMOeN6ATLfmMLdiN1FQfCEXIjLqMoY
 FObNmkpgExdki5kEFoEiRtklWeIQdGHS/CV+1YC8nSn5de4vFTZHlDOteKGZgZePQ7rC
 vpcntcVGXPKCkdahlEQXLGQ6/ZdvHXb2jTJ/qcZYFl1vOahRrwTXLdD0RnC9G6ZqU/KB
 HnAg5oSW4Pn/bWo/LJ0od4oqvi7Dlp2JpYcozpB29NISN9BLrQi6UQZSLDnum4S/dxlP
 oKtQ==
X-Gm-Message-State: AOJu0YwA9r7AQW5tkfm4skqCH/8nJimHmgE84oSDpvIWe3hgM5jT8vra
 EDCpUiv6Z4LN0qMmtMlx8y16kx9eF6qiXyhRAKU=
X-Google-Smtp-Source: AGHT+IEN7FTcXdMzTcE2pWWCWLsMGh/1hXQV88SK9pf1RlmjjStN/aVf4uY2fshEEbC859n24tBsCOgIFJPsnrKC6GU=
X-Received: by 2002:aa7:d714:0:b0:522:27f1:3c06 with SMTP id
 t20-20020aa7d714000000b0052227f13c06mr3371477edq.21.1694056653412; Wed, 06
 Sep 2023 20:17:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230731015317.1026996-1-fei2.wu@intel.com>
 <ea7d2188-97ad-9563-1b92-cf998f4b1747@ventanamicro.com>
 <49bbec5d-d0da-55e2-875b-3a8874bc3322@intel.com>
In-Reply-To: <49bbec5d-d0da-55e2-875b-3a8874bc3322@intel.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 7 Sep 2023 13:17:05 +1000
Message-ID: <CAKmqyKMtAzt5saCUMd4vXYfgAQibpzQJAhtTSuSb+yeKhcYpfw@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: split RAM into low and high memory
To: "Wu, Fei" <fei2.wu@intel.com>, Anup Patel <apatel@ventanamicro.com>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, palmer@dabbelt.com,
 alistair.francis@wdc.com, 
 bin.meng@windriver.com, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Andrei Warkentin <andrei.warkentin@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x52c.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Thu, Aug 3, 2023 at 10:47=E2=80=AFAM Wu, Fei <fei2.wu@intel.com> wrote:
>
> On 8/1/2023 6:46 AM, Daniel Henrique Barboza wrote:
> >
> >
> > On 7/30/23 22:53, Fei Wu wrote:
> >> riscv virt platform's memory started at 0x80000000 and
> >> straddled the 4GiB boundary. Curiously enough, this choice
> >> of a memory layout will prevent from launching a VM with
> >> a bit more than 2000MiB and PCIe pass-thru on an x86 host, due
> >> to identity mapping requirements for the MSI doorbell on x86,
> >> and these (APIC/IOAPIC) live right below 4GiB.
> >>
> >> So just split the RAM range into two portions:
> >> - 1 GiB range from 0x80000000 to 0xc0000000.
> >> - The remainder at 0x100000000
> >>
> >> ...leaving a hole between the ranges.
> >
> > I am afraid this breaks some existing distro setups, like Ubuntu. After
> > this patch
> > this emulation stopped working:
> >
> > ~/work/qemu/build/qemu-system-riscv64 \
> >     -machine virt -nographic -m 8G -smp 8 \
> >     -kernel ./uboot-ubuntu/usr/lib/u-boot/qemu-riscv64_smode/uboot.elf =
\
> >     -drive file=3Dsnapshot.img,format=3Dqcow2,if=3Dvirtio \
> >     -netdev bridge,id=3Dbridge1,br=3Dvirbr0 -device
> > virtio-net-pci,netdev=3Dbridge1
> >
> >
> > This is basically a guest created via the official Canonical tutorial:
> >
> > https://wiki.ubuntu.com/RISC-V/QEMU
> >
> > The error being thrown:
> >
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > Boot HART ID              : 4
> > Boot HART Domain          : root
> > Boot HART Priv Version    : v1.12
> > Boot HART Base ISA        : rv64imafdch
> > Boot HART ISA Extensions  : time,sstc
> > Boot HART PMP Count       : 16
> > Boot HART PMP Granularity : 4
> > Boot HART PMP Address Bits: 54
> > Boot HART MHPM Count      : 16
> > Boot HART MIDELEG         : 0x0000000000001666
> > Boot HART MEDELEG         : 0x0000000000f0b509
> >
> >
> > U-Boot 2022.07+dfsg-1ubuntu4.2 (Nov 24 2022 - 18:47:41 +0000)
> >
> > CPU:
> > rv64imafdch_zicbom_zicboz_zicsr_zifencei_zihintpause_zawrs_zfa_zca_zcd_=
zba_zbb_zbc_zbs_sstc_svadu
> > Model: riscv-virtio,qemu
> > DRAM:  Unhandled exception: Store/AMO access fault
> > EPC: 00000000802018b8 RA: 00000000802126a0 TVAL: 00000000ff733f90
> >
> > Code: b823 06b2 bc23 06b2 b023 08b2 b423 08b2 (b823 08b2)
> >
> >
> > resetting ...
> > System reset not supported on this platform
> > ### ERROR ### Please RESET the board ###
> > QEMU 8.0.90 monitor - type 'help' for more infor
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> >
> > Based on the change made I can make an educated guess on what is going
> > wrong.
> > We have another board with a similar memory topology you're making here=
,
> > the
> > Microchip Polarfire (microchip_pfsoc.c). We were having some problems
> > with this
> > board while trying to consolidate the boot process between all boards i=
n
> > hw/riscv/boot.c because of its non-continuous RAM bank. The full story
> > can be
> > read in the commit message of 4b402886ac89 ("hw/riscv: change
> > riscv_compute_fdt_addr()
> > semantics") but the short version can be seen in riscv_compute_fdt_addr=
()
> > from boot.c:
> >
> >  - if ram_start is less than 3072MiB, the FDT will be  put at the lowes=
t
> > value
> > between 3072 MiB and the end of that RAM bank;
> >
> > - if ram_start is higher than 3072 MiB the FDT will be put at the end o=
f
> > the
> > RAM bank.
> >
> > So, after this patch, since riscv_compute_fdt_addr() is being used with
> > the now
> > lower RAM bank, the fdt is being put in LOW_MEM - fdt_size for any setu=
p
> > that has
> > more than 1Gb RAM, and this breaks assumptions made by uboot and Ubuntu
> > and possibly
> > others that are trying to retrieve the FDT from the gap that you create=
d
> > between
> > low and hi mem in this patch.
> >
> > In fact, this same Ubuntu guest I mentioned above will boot if I put
> > only 1 Gb of RAM
> > (-m 1Gb). If I try with -m 1.1Gb I reproduce this error. This can be a
> > validation of
> > the guess I'm making here: Ubuntu is trying to fetch stuff (probably th=
e
> > fdt) from
> > the gap between the memory areas.
> >
> > This change on top of this patch doesn't work either:
> >
> > $ git diff
> > diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> > index 8fbdc7220c..dfff48d849 100644
> > --- a/hw/riscv/virt.c
> > +++ b/hw/riscv/virt.c
> > @@ -1335,9 +1335,16 @@ static void virt_machine_done(Notifier *notifier=
,
> > void *data)
> >                                           kernel_start_addr, true, NULL=
);
> >      }
> >
> > -    fdt_load_addr =3D riscv_compute_fdt_addr(memmap[VIRT_DRAM].base,
> > +    if (machine->ram_size < memmap[VIRT_DRAM].size) {
> > +        fdt_load_addr =3D riscv_compute_fdt_addr(memmap[VIRT_DRAM].bas=
e,
> >                                             memmap[VIRT_DRAM].size,
> >                                             machine);
> > +    } else {
> > +        fdt_load_addr =3D
> > riscv_compute_fdt_addr(memmap[VIRT_DRAM_HIGH].base,
> > +                                           memmap[VIRT_DRAM_HIGH].size=
,
> > +                                           machine);
> > +    }
> > +
> >
> > This would put the fdt at the end of the HI RAM for guests with more
> > than 1Gb of RAM.
> > This change in fact makes the situation even worse, breaking setups tha=
t
> > were working
> > before with this patch.
> >
> > There's a chance that reducing the gap between the RAM banks can make
> > Ubuntu work
> > reliably again but now I'm a little cold feet with this change.
> >
> >
> > I think we'll need some kernel/Opensbi folks to weight in here to see i=
f
> > there's a
> > failsafe memory setup that won't break distros out there and allow your
> > passthrough
> > to work.
> >
> Hi Daniel,
>
> Do you know who we should talk to? I think it's not uncommon to have
> seperated multi-range memory, the stack should support this configuration=
.

@Palmer Dabbelt @Anup Patel any ideas?

Alistair

