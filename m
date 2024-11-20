Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DDB4D711B1
	for <qemu-riscv@archiver.kernel.org>; Wed, 20 Nov 2024 15:25:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tDma1-0000Cd-T0; Wed, 20 Nov 2024 10:25:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1tDmZz-0000C0-Nv
 for qemu-riscv@nongnu.org; Wed, 20 Nov 2024 10:25:20 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1tDmZx-0001Cm-Rh
 for qemu-riscv@nongnu.org; Wed, 20 Nov 2024 10:25:19 -0500
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5cfe5da1251so2487283a12.1
 for <qemu-riscv@nongnu.org>; Wed, 20 Nov 2024 07:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1732116315; x=1732721115; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qFmRIVRufQumXPKKytekzl5QVls5Ebz1hdgidH3BWwE=;
 b=fvbn6XEeQyQDi2ptG4Sr76Ae7pcaCmYwniX7cv8445SP6E41qoN6txe0PtihGas/Xh
 7SR+KOQGSgKD/ZXF8Y4/2cUgtCFq5giFuzVf4kHHe9oSnUQGsYj9MxrWpNt+P18CnG6u
 5DQFEbp+xzHBt5iYPW4HNcg3x/RPQqnkZoJ8Y070BQaBJlTYdV3WgbYX7fVsLuhd4w/a
 SodZm/K+HRWW6T1Neqb3XHAK/d8ZzPaK/zWY15sd/qobNhs5G2zPRfZY4npJNn8RZ501
 iwW639vZfsyC4YMeI+/Xzd5avnsxdoNJfECwDry0VtzWsMUBFEyh2SOynTcBW3CJj00g
 fzjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732116315; x=1732721115;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qFmRIVRufQumXPKKytekzl5QVls5Ebz1hdgidH3BWwE=;
 b=PCJRlDrja14WI8QXnJAmTBV0AYuvtwW302A6U0JFkgLDo8ZS0o0YEA91Asm7JoQiqj
 EptGsXOIR3JP7OeVMDzrM4u0lVINFSf3bww0ZjEujUoRMf4vQoTe6C5qGrR6cMprSZGs
 m3h3JT+/0IXiVmqYryJCuePED3riYTTRsNgll7MHNTk3ECPvNaYjIcq+cp4FMNOANdCh
 GjeSfU66oFy0B5JMwYeju6UNY3y8Gg6lwHUqWplBuqSKi0ukLvDODykROZcn89A95VP6
 N2nv+d8nNlrrWhZpLnPJKHsjnlGVUWs9xEDnQv500DWoqCY8qPAtYunE5kswf+kjkeu1
 OJdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2+I6RckGPzgofkWwyg1K6FKN+OaWfXjhekiJhHpiOzHmgHBIGwdEIbcKFhTt8X/CROKY191xpJzTH@nongnu.org
X-Gm-Message-State: AOJu0Yz9YPbQdniPZYdfDgvho9EWxbJgOisiulZQaunbuPtxViI9CPO7
 qO7HGsxsLbquAsaXf2K7WiB4kUAyMfdRsrVtkCuS6f555nzB6qp1pDg0cgFZ/DIB1bBYuPnWa82
 WLzwQcI6nzPAysUOQQaEprggnaOwiJAR6pKiyLQ==
X-Google-Smtp-Source: AGHT+IFmwSiYGwqbSbiQOL5Pm0KwmQIxqKDgL8kQSuzNjLKRROi9L7NfVQUf8coeCH3agz8e/Ku5rCUyrsuO4HXnWg0=
X-Received: by 2002:a05:6402:270e:b0:5cf:d3b0:c498 with SMTP id
 4fb4d7f45d1cf-5cff4d27252mr2124665a12.26.1732116315498; Wed, 20 Nov 2024
 07:25:15 -0800 (PST)
MIME-Version: 1.0
References: <20241108070454.12699-1-jim.shu@sifive.com>
 <20241108070454.12699-2-jim.shu@sifive.com>
 <484d7570-7425-4bb1-adcd-c59c233c6893@ventanamicro.com>
In-Reply-To: <484d7570-7425-4bb1-adcd-c59c233c6893@ventanamicro.com>
From: Jim Shu <jim.shu@sifive.com>
Date: Wed, 20 Nov 2024 23:25:00 +0800
Message-ID: <CALw707pNV4AcrXTz3OnbZgm2f_sfP4ztV0dUG0b2i_VNEkHsPg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] hw/riscv: Support to load DTB after 3GB memory on
 64-bit system.
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bmeng.cn@gmail.com>, Weiwei Li <liwei1518@gmail.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=jim.shu@sifive.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Tue, Nov 12, 2024 at 5:53=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
>
>
> On 11/8/24 4:04 AM, Jim Shu wrote:
> > Larger initrd image will overlap the DTB at 3GB address. Since 64-bit
> > system doesn't have 32-bit addressable issue, we just load DTB to the e=
nd
> > of dram in 64-bit system.
> >
> > Signed-off-by: Jim Shu <jim.shu@sifive.com>
> > ---
> >   hw/riscv/boot.c            | 8 ++++++--
> >   hw/riscv/microchip_pfsoc.c | 4 ++--
> >   hw/riscv/sifive_u.c        | 4 ++--
> >   hw/riscv/spike.c           | 4 ++--
> >   hw/riscv/virt.c            | 2 +-
> >   include/hw/riscv/boot.h    | 2 +-
> >   6 files changed, 14 insertions(+), 10 deletions(-)
> >
> > diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> > index 2e319168db..4e4e106a2b 100644
> > --- a/hw/riscv/boot.c
> > +++ b/hw/riscv/boot.c
> > @@ -293,7 +293,7 @@ out:
> >    * The FDT is fdt_packed() during the calculation.
> >    */
> >   uint64_t riscv_compute_fdt_addr(hwaddr dram_base, hwaddr dram_size,
> > -                                MachineState *ms)
> > +                                MachineState *ms, RISCVHartArrayState =
*harts)
> >   {
> >       int ret =3D fdt_pack(ms->fdt);
> >       hwaddr dram_end, temp;
> > @@ -321,7 +321,11 @@ uint64_t riscv_compute_fdt_addr(hwaddr dram_base, =
hwaddr dram_size,
> >        * Thus, put it at an 2MB aligned address that less than fdt size=
 from the
> >        * end of dram or 3GB whichever is lesser.
> >        */
> > -    temp =3D (dram_base < 3072 * MiB) ? MIN(dram_end, 3072 * MiB) : dr=
am_end;
> > +    if (!riscv_is_32bit(harts)) {
> > +        temp =3D dram_end;
> > +    } else {
> > +        temp =3D (dram_base < 3072 * MiB) ? MIN(dram_end, 3072 * MiB) =
: dram_end;
> > +    }
>
> We'll need to update the comment right before this code given that we're
> changing the logic for 64 bit CPUs. Thanks,

OK, I will add it to the comments in the next version, thanks!


Jim Shu



>
>
> Daniel
>
> >
> >       return QEMU_ALIGN_DOWN(temp - fdtsize, 2 * MiB);
> >   }
> > diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
> > index f9a3b43d2e..ba8b0a2c26 100644
> > --- a/hw/riscv/microchip_pfsoc.c
> > +++ b/hw/riscv/microchip_pfsoc.c
> > @@ -519,7 +519,7 @@ static void microchip_icicle_kit_machine_init(Machi=
neState *machine)
> >       bool kernel_as_payload =3D false;
> >       target_ulong firmware_end_addr, kernel_start_addr;
> >       uint64_t kernel_entry;
> > -    uint32_t fdt_load_addr;
> > +    uint64_t fdt_load_addr;
> >       DriveInfo *dinfo =3D drive_get(IF_SD, 0, 0);
> >
> >       /* Sanity check on RAM size */
> > @@ -625,7 +625,7 @@ static void microchip_icicle_kit_machine_init(Machi=
neState *machine)
> >           /* Compute the fdt load address in dram */
> >           fdt_load_addr =3D riscv_compute_fdt_addr(memmap[MICROCHIP_PFS=
OC_DRAM_LO].base,
> >                                                  memmap[MICROCHIP_PFSOC=
_DRAM_LO].size,
> > -                                               machine);
> > +                                               machine, &s->soc.u_cpus=
);
> >           riscv_load_fdt(fdt_load_addr, machine->fdt);
> >
> >           /* Load the reset vector */
> > diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> > index c5e74126b1..05467e833a 100644
> > --- a/hw/riscv/sifive_u.c
> > +++ b/hw/riscv/sifive_u.c
> > @@ -519,7 +519,7 @@ static void sifive_u_machine_init(MachineState *mac=
hine)
> >       const char *firmware_name;
> >       uint32_t start_addr_hi32 =3D 0x00000000;
> >       int i;
> > -    uint32_t fdt_load_addr;
> > +    uint64_t fdt_load_addr;
> >       uint64_t kernel_entry;
> >       DriveInfo *dinfo;
> >       BlockBackend *blk;
> > @@ -606,7 +606,7 @@ static void sifive_u_machine_init(MachineState *mac=
hine)
> >
> >       fdt_load_addr =3D riscv_compute_fdt_addr(memmap[SIFIVE_U_DEV_DRAM=
].base,
> >                                              memmap[SIFIVE_U_DEV_DRAM].=
size,
> > -                                           machine);
> > +                                           machine, &s->soc.u_cpus);
> >       riscv_load_fdt(fdt_load_addr, machine->fdt);
> >
> >       if (!riscv_is_32bit(&s->soc.u_cpus)) {
> > diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> > index fceb91d946..acd7ab1ae1 100644
> > --- a/hw/riscv/spike.c
> > +++ b/hw/riscv/spike.c
> > @@ -201,7 +201,7 @@ static void spike_board_init(MachineState *machine)
> >       hwaddr firmware_load_addr =3D memmap[SPIKE_DRAM].base;
> >       target_ulong kernel_start_addr;
> >       char *firmware_name;
> > -    uint32_t fdt_load_addr;
> > +    uint64_t fdt_load_addr;
> >       uint64_t kernel_entry;
> >       char *soc_name;
> >       int i, base_hartid, hart_count;
> > @@ -317,7 +317,7 @@ static void spike_board_init(MachineState *machine)
> >
> >       fdt_load_addr =3D riscv_compute_fdt_addr(memmap[SPIKE_DRAM].base,
> >                                              memmap[SPIKE_DRAM].size,
> > -                                           machine);
> > +                                           machine, &s->soc[0]);
> >       riscv_load_fdt(fdt_load_addr, machine->fdt);
> >
> >       /* load the reset vector */
> > diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> > index 45a8c4f819..761bce3304 100644
> > --- a/hw/riscv/virt.c
> > +++ b/hw/riscv/virt.c
> > @@ -1424,7 +1424,7 @@ static void virt_machine_done(Notifier *notifier,=
 void *data)
> >
> >       fdt_load_addr =3D riscv_compute_fdt_addr(memmap[VIRT_DRAM].base,
> >                                              memmap[VIRT_DRAM].size,
> > -                                           machine);
> > +                                           machine, &s->soc[0]);
> >       riscv_load_fdt(fdt_load_addr, machine->fdt);
> >
> >       /* load the reset vector */
> > diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
> > index f778b560de..34a80c5ff4 100644
> > --- a/include/hw/riscv/boot.h
> > +++ b/include/hw/riscv/boot.h
> > @@ -49,7 +49,7 @@ target_ulong riscv_load_kernel(MachineState *machine,
> >                                  bool load_initrd,
> >                                  symbol_fn_t sym_cb);
> >   uint64_t riscv_compute_fdt_addr(hwaddr dram_start, uint64_t dram_size=
,
> > -                                MachineState *ms);
> > +                                MachineState *ms, RISCVHartArrayState =
*harts);
> >   void riscv_load_fdt(hwaddr fdt_addr, void *fdt);
> >   void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayS=
tate *harts,
> >                                  hwaddr saddr,

