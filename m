Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50174E7716A
	for <qemu-riscv@archiver.kernel.org>; Tue, 17 Dec 2024 04:11:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tNOvT-0004nP-Ne; Mon, 16 Dec 2024 23:11:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1tNOvP-0004mY-VB
 for qemu-riscv@nongnu.org; Mon, 16 Dec 2024 23:11:12 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1tNOvI-00064R-BQ
 for qemu-riscv@nongnu.org; Mon, 16 Dec 2024 23:11:11 -0500
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-aa6aad76beeso678278766b.2
 for <qemu-riscv@nongnu.org>; Mon, 16 Dec 2024 20:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1734408661; x=1735013461; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s5noHVT9zsBMCAMZp0If0Q8kGGuliCMIkpw2iQqCAis=;
 b=gUwci+2dOE1E7MjPH9GW5Xr3/Ne+XrKpzfvdEnudCSui6UW8VywaBarDlkOpCypsmk
 6RhH1Ewk2Kj782k9ZAPYNe8pSam6GcSEKy3TjWRgk/AhrB3WiwstyQzhupCqcLmVwG3H
 nM1ecb8jtYPa9QezccnmnIjm1Hjy1Ub3RSf9vN4hktRw4UUzno94Chsu1ndU6pgETbtv
 4xw1Bgr1FO7g4U5TyRvn71J12p6wuel1EKs3M5WVEmoFE9zCM+24VhXzxxFyTvd6JIMV
 P4L4L6lHmTJzLmvqcBP+KJggt/C8e2r/5oY+4Lqd4gke0qX5jOD1DJjU6xAzOyZIAK+Q
 83IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734408661; x=1735013461;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s5noHVT9zsBMCAMZp0If0Q8kGGuliCMIkpw2iQqCAis=;
 b=p/48fMxks/TPMA8vSMYGoMrk7jCfCd8ttOaV3LBWKoae+o+cmzmi1zo8G5g8yoMG+S
 yiCbK0AK9fS+ld4ZvpAU4XG9DxNKdplRRwW4I2vlhO3TlRjQ2B9+W8bg9CkZ3RkxzNWW
 7jRKsNPXx4b2VFqYI4GckfBQpvv3wV7S+yZgcFWfa4a/Wm7LNgZTsBo0BOYg7OyL7cCv
 UStyLbTscPgDCsVuo3ZTbTCJTbBS/m6gsMHKbdn2gUVYy6n4JYUrY5689bBmktdDJyAr
 OGhkCtCzz2c9o5Khxorgdwo1nFxtxmn2ofwu/X7e4TDAlsWlkXbtqN8LI4WQp37+jiRJ
 a3HQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLHufCMvetDiEjgBVjjvuKu4FD0GH3eWtlSj0bchh8ppdhSLzv5UPGZE8aUXFVthh/WHwH4c+HS3a8@nongnu.org
X-Gm-Message-State: AOJu0YybD0ysujxEU7sA/0wQxBuMoR1zv8XXRS6Qx50mEV1sF8I7xWVO
 WtSwu2uj4X+G8hXftj9Vm7BJWSOLE0qwIasXCkTiMiLAC/I393p+y4pSLmGAGPxjMFokjQYLOZ2
 TWJDzp5GvSYVBNMoTNQWWmfutEBHABSBpiCBWPA==
X-Gm-Gg: ASbGnctN3+1uHg02wJD4TePPcN8QBVDIWBlKq3EBMfbE+jibZGfio7O3nCXHzeMmUK0
 5Sf25V8Ccio8d0Qfc39UTo9CIHOiqnumuImRZjYRs
X-Google-Smtp-Source: AGHT+IFIrcAaMWAm7N9fqMXUvRJfLGFCWf834FB+yoX9SKugYqAmG21js/p7JPzOCwXJv4prPQB7EyiHgQjUoJldwOk=
X-Received: by 2002:a17:906:f5a7:b0:aa6:7cf3:c6ef with SMTP id
 a640c23a62f3a-aab77959d62mr1758403166b.15.1734408661519; Mon, 16 Dec 2024
 20:11:01 -0800 (PST)
MIME-Version: 1.0
References: <20241120153935.24706-1-jim.shu@sifive.com>
 <20241120153935.24706-2-jim.shu@sifive.com>
 <CAKmqyKOTBkNpwvuGonW80T6LQtMu4sBWA_cu58S4+pMMkZAvcw@mail.gmail.com>
In-Reply-To: <CAKmqyKOTBkNpwvuGonW80T6LQtMu4sBWA_cu58S4+pMMkZAvcw@mail.gmail.com>
From: Jim Shu <jim.shu@sifive.com>
Date: Tue, 17 Dec 2024 12:10:50 +0800
Message-ID: <CALw707p3S8PNeoLM9aFnwCvF9AZeUWSTSdF6kqk7zuARhSWZ1Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] hw/riscv: Support to load DTB after 3GB memory on
 64-bit system.
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bmeng.cn@gmail.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=jim.shu@sifive.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

This is the correct fix, thanks!


On Tue, Dec 17, 2024 at 11:39=E2=80=AFAM Alistair Francis <alistair23@gmail=
.com> wrote:
>
> On Thu, Nov 21, 2024 at 1:41=E2=80=AFAM Jim Shu <jim.shu@sifive.com> wrot=
e:
> >
> > Larger initrd image will overlap the DTB at 3GB address. Since 64-bit
> > system doesn't have 32-bit addressable issue, we just load DTB to the e=
nd
> > of dram in 64-bit system.
> >
> > Signed-off-by: Jim Shu <jim.shu@sifive.com>
> > ---
> >  hw/riscv/boot.c            | 14 +++++++++-----
> >  hw/riscv/microchip_pfsoc.c |  4 ++--
> >  hw/riscv/sifive_u.c        |  4 ++--
> >  hw/riscv/spike.c           |  4 ++--
> >  hw/riscv/virt.c            |  2 +-
> >  include/hw/riscv/boot.h    |  2 +-
> >  6 files changed, 17 insertions(+), 13 deletions(-)
> >
> > diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> > index 2e319168db..d36d3a7104 100644
> > --- a/hw/riscv/boot.c
> > +++ b/hw/riscv/boot.c
> > @@ -293,7 +293,7 @@ out:
> >   * The FDT is fdt_packed() during the calculation.
> >   */
> >  uint64_t riscv_compute_fdt_addr(hwaddr dram_base, hwaddr dram_size,
> > -                                MachineState *ms)
> > +                                MachineState *ms, RISCVHartArrayState =
*harts)
> >  {
> >      int ret =3D fdt_pack(ms->fdt);
> >      hwaddr dram_end, temp;
> > @@ -317,11 +317,15 @@ uint64_t riscv_compute_fdt_addr(hwaddr dram_base,=
 hwaddr dram_size,
> >
> >      /*
> >       * We should put fdt as far as possible to avoid kernel/initrd ove=
rwriting
> > -     * its content. But it should be addressable by 32 bit system as w=
ell.
> > -     * Thus, put it at an 2MB aligned address that less than fdt size =
from the
> > -     * end of dram or 3GB whichever is lesser.
> > +     * its content. But it should be addressable by 32 bit system as w=
ell in RV32.
> > +     * Thus, put it near to the end of dram in RV64, and put it near t=
o the end
> > +     * of dram or 3GB whichever is lesser in RV32.
> >       */
> > -    temp =3D (dram_base < 3072 * MiB) ? MIN(dram_end, 3072 * MiB) : dr=
am_end;
> > +    if (!riscv_is_32bit(harts)) {
> > +        temp =3D dram_end;
> > +    } else {
> > +        temp =3D (dram_base < 3072 * MiB) ? MIN(dram_end, 3072 * MiB) =
: dram_end;
> > +    }
> >
> >      return QEMU_ALIGN_DOWN(temp - fdtsize, 2 * MiB);
> >  }
> > diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
> > index f9a3b43d2e..ba8b0a2c26 100644
> > --- a/hw/riscv/microchip_pfsoc.c
> > +++ b/hw/riscv/microchip_pfsoc.c
> > @@ -519,7 +519,7 @@ static void microchip_icicle_kit_machine_init(Machi=
neState *machine)
> >      bool kernel_as_payload =3D false;
> >      target_ulong firmware_end_addr, kernel_start_addr;
> >      uint64_t kernel_entry;
> > -    uint32_t fdt_load_addr;
> > +    uint64_t fdt_load_addr;
> >      DriveInfo *dinfo =3D drive_get(IF_SD, 0, 0);
> >
> >      /* Sanity check on RAM size */
> > @@ -625,7 +625,7 @@ static void microchip_icicle_kit_machine_init(Machi=
neState *machine)
> >          /* Compute the fdt load address in dram */
> >          fdt_load_addr =3D riscv_compute_fdt_addr(memmap[MICROCHIP_PFSO=
C_DRAM_LO].base,
> >                                                 memmap[MICROCHIP_PFSOC_=
DRAM_LO].size,
> > -                                               machine);
> > +                                               machine, &s->soc.u_cpus=
);
> >          riscv_load_fdt(fdt_load_addr, machine->fdt);
> >
> >          /* Load the reset vector */
> > diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> > index c5e74126b1..05467e833a 100644
> > --- a/hw/riscv/sifive_u.c
> > +++ b/hw/riscv/sifive_u.c
> > @@ -519,7 +519,7 @@ static void sifive_u_machine_init(MachineState *mac=
hine)
> >      const char *firmware_name;
> >      uint32_t start_addr_hi32 =3D 0x00000000;
> >      int i;
> > -    uint32_t fdt_load_addr;
> > +    uint64_t fdt_load_addr;
> >      uint64_t kernel_entry;
> >      DriveInfo *dinfo;
> >      BlockBackend *blk;
> > @@ -606,7 +606,7 @@ static void sifive_u_machine_init(MachineState *mac=
hine)
> >
> >      fdt_load_addr =3D riscv_compute_fdt_addr(memmap[SIFIVE_U_DEV_DRAM]=
.base,
> >                                             memmap[SIFIVE_U_DEV_DRAM].s=
ize,
> > -                                           machine);
> > +                                           machine, &s->soc.u_cpus);
>
> This patch breaks boots with the sifive_u board.
>
> This diff fixes it, I'm going to squash the diff into this patch
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index ff6e26dec8..fd59124500 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -518,6 +518,7 @@ static void sifive_u_machine_init(MachineState *machi=
ne)
>     target_ulong firmware_end_addr, kernel_start_addr;
>     const char *firmware_name;
>     uint32_t start_addr_hi32 =3D 0x00000000;
> +    uint32_t fdt_load_addr_hi32 =3D 0x00000000;
>     int i;
>     uint64_t fdt_load_addr;
>     uint64_t kernel_entry;
> @@ -611,6 +612,7 @@ static void sifive_u_machine_init(MachineState *machi=
ne)
>
>     if (!riscv_is_32bit(&s->soc.u_cpus)) {
>         start_addr_hi32 =3D (uint64_t)start_addr >> 32;
> +        fdt_load_addr_hi32 =3D fdt_load_addr >> 32;
>     }
>
>     /* reset vector */
> @@ -625,7 +627,7 @@ static void sifive_u_machine_init(MachineState *machi=
ne)
>         start_addr,                    /* start: .dword */
>         start_addr_hi32,
>         fdt_load_addr,                 /* fdt_laddr: .dword */
> -        0x00000000,
> +        fdt_load_addr_hi32,
>         0x00000000,
>                                        /* fw_dyn: */
>     };

