Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F90FC5AD7B
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 18:17:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wtUYd-0006UV-4m; Mon, 10 Aug 2026 14:17:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <asrinivasan@tenstorrent.com>)
 id 1wtUYb-0006U5-4V
 for qemu-riscv@nongnu.org; Mon, 10 Aug 2026 14:17:05 -0400
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <asrinivasan@tenstorrent.com>)
 id 1wtUYY-00037j-KN
 for qemu-riscv@nongnu.org; Mon, 10 Aug 2026 14:17:04 -0400
Received: by mail-yx1-xb130.google.com with SMTP id
 956f58d0204a3-6688dfaed31so3405053d50.3
 for <qemu-riscv@nongnu.org>; Mon, 10 Aug 2026 11:17:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786385820; cv=none;
 d=google.com; s=arc-20260327;
 b=IJv5nf+p5HpmhXYuvLf+JfciaVgRIW01Pd5c87jStSiO39wMJecKdCrMr7W+DsPg3s
 9Yqp2z4fH+JnvyW5O5EjCr0Ri91iiUbatkmpx9E0V9kWCu3zCxWwbIFFdomJwgzw98tl
 iEi6+IfAARfuppw1nSBHreHjzszq1hqDBpYDVl5vYNTu78b63tExNEAPuMPlAhiWwzUW
 XxL64PmhLs61NVAPR+Uubd3V2/GUI9ykPt/CHrp77Tj6ZvZfP0txb5s4loUF3dQ31neu
 09WK4jtR8Am3OrPYjbqEIihfflZPyTAdHM5W8I6d0Tw5sRp+O/wps4gsDfmYyfyfwHXC
 t7Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=YMTcI5HtiXNa4wwhPuD/MDiUPqpqpM2B3v/yxtfJH1Q=;
 fh=qfemhjYriPkK0PUVvfNMuQ0WVh2U8P1VvO0r+TOgLvk=;
 b=hUt/pA8LhPqenriI/VVjFk5tOO8vWIRilJOZ9gKoYnukgbL1JL8hn5oIl9l3GGh0K5
 luYB7fdgh9fNUBbLtWbxUgghnMH+oHqCR/h13Bbwx/d9a63IQ2xMCpwjFrh8vEVUfDZr
 5doFdmaAfz6AihRGXrRA1p6JawY909XSHZPfbG7wLr0hmCZ3DtWi4pMZ9gX2KF3B4vzJ
 V9xHLsZ65A7yRdCac/uybrHOGPmoZ5eP2Q0BPbjdlYd/+Sy+yogYLrYMWRjZydiZKleH
 N86839bwufZpIeDTNq7nIRJyDujuOgMrgW7Cw3fNfxjc44YUES0R5BSDZowSpo8+9uKb
 5FIA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1786385820; x=1786990620; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=YMTcI5HtiXNa4wwhPuD/MDiUPqpqpM2B3v/yxtfJH1Q=;
 b=ZUeJdXLFqB4PMkoc1KQ1+WXSQ5YmO9H/xAt1Ao66kHtQG319gKWv6QcvEA8GeqO7Ai
 AmsswcjTxFpbhFjCp/DGmk4eXFcP7quEZR9f407FeYogHU/8M+5yqFtbYk+xuARrab1E
 BU89CyCs8BYVQGVN2Xa++xLXIpfvw+kGY9D3jWlKe4BOox4IQqtuTYCa/vj4k2wAMw+0
 vBf+2FsbsulIjBgJrjPq7uDQxW90LrPbdizXGRf5+2NnJMlPkvZ1U68wlyWOFB2ANWxf
 3CfqZVSifg77F0XWdAPxbPJ5bExkE9lVdhp0kW8KpP/Axhky3hTcyNleZK+tBOpw0DgT
 VgEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786385820; x=1786990620;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=YMTcI5HtiXNa4wwhPuD/MDiUPqpqpM2B3v/yxtfJH1Q=;
 b=V8eRigoB1tlaOXi06Vwse1aI9pcbEPIq3XNbigdEjfXXHsIHHJUfkugD+wpriTIhdM
 jUEhNuIprwWDUx510iEaGcKILrEGWyqKUjLH1ABL4msOBUcd/1vs6Dajzb/0R1rH/b8y
 TrnsppIgJ24sUVv07yD1U4yTAOgC3ALiw3hfmsDS51a2kn47P6W9VjekvTHqkYb1R6A4
 A94XYg3oa15RAgCNnjC+lDj8fXGl/wv0ApXwxdDq4JKWfxHFqxZYMaX4dPbPEC/6hRWT
 3jtp0ByKPukXp7yqOb/BZJ1Ph1RjsUnjW/ULYqEb5nde3DXxGSD484UOvP9pDGxTbMba
 DTog==
X-Forwarded-Encrypted: i=1;
 AHgh+RruEEn8qQ0lwDn9ZcthRa9R4R/gdtDJV8w/3zJYbuYb+ILdCZNY/vz2a1BJHMD91s+Z2G1rQcLKYsdT@nongnu.org
X-Gm-Message-State: AOJu0YwBQ79FHhyWdj+8QmMKqjX4yzUrG4yaCzdqJFSzmgWZ+46VfhUD
 oRTxoukCDOJ4Kaw8Uh1w+pC33v8jQKhYbMp9rYGNztFMaOcu7bu9mvUiISlTZ6HSNmNSuyOJy02
 SXCxMLUrw+APNPIcNvTNZsU9Yp3lxaFtyxj+d99k0yQ==
X-Gm-Gg: AR+sD13hVpFvI5M/Z86QpIlfUoXYVUkWMl2oH7efUaILDYAFSXTHYHmoO+T1pHOm+sR
 xEzNrZlK59b3pa5yn4bj3eYDuOXTMtIx09Ysdv+aEfDgYB0qm6ePasF8Rp6pLlO3m+zqpmFoGHB
 0TSlTzI3NmtGISWgVpqq4dTd5H6/NfnvP1uHWQaH58WYHt6KZO4BylWiVwR0YmmnxpvC9S/gdog
 tUwaDP4YGyQ5heOH7t/NOF2bH87O2PXwPG5U4fVomnYhCbadDyfBf0fV1O14F9LmBpXzpACXHTB
 ccXoyiATUGNwhWd2kTEGgRNaAV3jY66mdzb1Xa8e9eyoTJ0K8Hx4XZ+X51IiBm8oXsqTe/4O+GM
 =
X-Received: by 2002:a05:690e:445a:b0:668:713d:893 with SMTP id
 956f58d0204a3-6699a91a8efmr20399324d50.4.1786385820525; Mon, 10 Aug 2026
 11:17:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260729-atlantis_prcm-v1-0-502882933e51@oss.tenstorrent.com>
 <20260729-atlantis_prcm-v1-2-502882933e51@oss.tenstorrent.com>
 <542bbd82-b2c9-4d6e-b4d4-e26ea360d2b3@oss.qualcomm.com>
In-Reply-To: <542bbd82-b2c9-4d6e-b4d4-e26ea360d2b3@oss.qualcomm.com>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Mon, 10 Aug 2026 13:16:49 -0500
X-Gm-Features: AUfX_mx_hdsyLHsRW_4ZYv-S_fp2VnnMUeLBTSv3Ned1qkC9WRVWqKjMyMBhqsM
Message-ID: <CAEev2e_z7zuXVWt7_pOzQaWienmqGMWC=bARo+U=3rs4HLO8eQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] hw/riscv/tt-atlantis: Add PRCMs to tt-atlantis model
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@kernel.org>, 
 Portia Stephens <portias@oss.tenstorrent.com>, qemu-riscv@nongnu.org, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li <liwei1518@gmail.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b130;
 envelope-from=asrinivasan@tenstorrent.com; helo=mail-yx1-xb130.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi Daniel,

On Fri, Aug 7, 2026 at 8:36=E2=80=AFAM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> Hello,
>
> On 7/29/2026 12:21 PM, Anirudh Srinivasan wrote:
> > Atlantis has 4 PRCMs that are visible from S mode by the Ascalon Core
> > (RCPU, HSIO, PCIe and MM). This commit adds these 4 PRCM blocks to the
> > tt-atlantis model, along with necessary device tree nodes for them.
> >
> > Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> > ---
> >   docs/system/riscv/tt_atlantis.rst |  1 +
> >   hw/riscv/tt_atlantis.c            | 92 ++++++++++++++++++++++++++++++=
+++++++++
> >   include/hw/riscv/tt_atlantis.h    | 19 ++++++++
> >   3 files changed, 112 insertions(+)
> >
> > diff --git a/docs/system/riscv/tt_atlantis.rst b/docs/system/riscv/tt_a=
tlantis.rst
> > index 1f2880d617..539c22354f 100644
> > --- a/docs/system/riscv/tt_atlantis.rst
> > +++ b/docs/system/riscv/tt_atlantis.rst
> > @@ -14,6 +14,7 @@ tt-atlantis QEMU model features
> >   * 8-core Ascalon-X CPU Cluster
> >   * RISC-V compliant Advanced Interrupt Architecture
> >   * 16550A compatible UART
> > +* 4 PRCMs (Clock and Reset Controllers)
> >
> >   Known limitations
> >   -----------------
> > diff --git a/hw/riscv/tt_atlantis.c b/hw/riscv/tt_atlantis.c
> > index d808bcc11c..17cc5318b3 100644
> > --- a/hw/riscv/tt_atlantis.c
> > +++ b/hw/riscv/tt_atlantis.c
> > @@ -26,6 +26,7 @@
> >   #include "hw/char/serial-mm.h"
> >   #include "hw/intc/riscv_aclint.h"
> >   #include "hw/misc/unimp.h"
> > +#include "hw/misc/tt_atlantis_prcm.h"
> >
> >   #include "system/system.h"
> >   #include "system/device_tree.h"
> > @@ -59,6 +60,10 @@ static const MemMapEntry tt_atlantis_memmap[] =3D {
> >       [TT_ATL_I2C3] =3D             { 0xd4070000,       0x10000 },
> >       [TT_ATL_I2C4] =3D             { 0xd4080000,       0x10000 },
> >       [TT_ATL_UART1] =3D            { 0xd4110000,       0x10000 },
> > +    [TT_ATL_PRCM_RCPU] =3D        { 0xd0000000,       0x10000 },
> > +    [TT_ATL_PRCM_PCIE] =3D        { 0xd8000000,         0x100 },
> > +    [TT_ATL_PRCM_MM] =3D          { 0xdc000000,        0x1000 },
> > +    [TT_ATL_PRCM_HSIO] =3D        { 0xe00c0000,         0x510 },
> >       [TT_ATL_SAPLIC] =3D           { 0xe8000000,     0x4000000 },
> >       [TT_ATL_DDR_HI] =3D          { 0x100000000,  0x1000000000 },
> >   };
> > @@ -328,11 +333,38 @@ static void create_fdt_i2c_device(TTAtlantisState=
 *s, int bus,
> >       qemu_fdt_setprop_cell(fdt, name, "reg", addr);
> >   }
> >
> > +static char *create_fdt_prcm(void *fdt, const MemMapEntry *mem,
> > +                             const char *prcm_name, uint32_t prcm_phan=
dle)
> > +{
> > +    hwaddr base =3D mem->base;
> > +    hwaddr size =3D mem->size;
> > +    char *name =3D g_strdup_printf("/soc/prcm_%s@%" PRIx64,
> > +                                 prcm_name, mem->base);
> > +    g_autofree char *compatible =3D
> > +        g_strdup_printf("tenstorrent,atlantis-prcm-%s", prcm_name);
> > +
> > +    qemu_fdt_add_subnode(fdt, name);
> > +    qemu_fdt_setprop_string(fdt, name, "compatible", compatible);
> > +    qemu_fdt_setprop_sized_cells(fdt, name, "reg", 2, base, 2, size);
> > +    qemu_fdt_setprop_cell(fdt, name, "#address-cells", 1);
> > +    qemu_fdt_setprop_cell(fdt, name, "#size-cells", 0);
> > +    qemu_fdt_setprop_cell(fdt, name, "#clock-cells", 1);
> > +    qemu_fdt_setprop_cell(fdt, name, "#reset-cells", 1);
> > +    qemu_fdt_setprop_cell(fdt, name, "phandle", prcm_phandle);
> > +
> > +    return name;
> > +}
> > +
> >   static void finalize_fdt(TTAtlantisState *s)
> >   {
> >       uint32_t aplic_s_phandle =3D next_phandle();
> >       uint32_t imsic_s_phandle =3D next_phandle();
> >       uint32_t periph_clk_phandle =3D next_phandle();
> > +    uint32_t osc_24m_phandle =3D next_phandle();
> > +    uint32_t prcm_rcpu_phandle =3D next_phandle();
> > +    uint32_t prcm_hsio_phandle =3D next_phandle();
> > +    uint32_t prcm_pcie_phandle =3D next_phandle();
> > +    uint32_t prcm_mm_phandle =3D next_phandle();
>
> Hmmm seems like you're not really using all of these ... 'osc_24m_phandle=
'
> is indeed needed since you're giving it to create_fdt_clk() and using it
> to set "clocks" for all create_fdt_prcm() FDTs.  'prcm_rcpu_phandle' is
> also used in other FDTs so it's fine.
>
> But the other 3 phandles aren't used by nothing else aside from supplying
> a phandle to create_fdt_prcm().
>
> I think we can make things a little easier by:
>
> - remove the 'uint32_t prcm_phandle' argument from create_fdt_prcm().  Wh=
en
>    creating the phandle do instead:
>
>  > +    qemu_fdt_setprop_cell(fdt, name, "phandle", next_phandle());
>
>
> -  remove all phandles that you created just to comply with the old creat=
e_fdt_prcm().
>     Keep osc_24m_phandle as is and just declare  prcm_rcpu_phandle:
>
>  > +    uint32_t osc_24m_phandle =3D next_phandle();
>  > +    uint32_t prcm_rcpu_phandle;
>
>
> After creating the FDT of rcpu, retrieve the phandle used to create the
> rcpu subnode:
>
>  > +    g_autofree char *rcpu_name =3D create_fdt_prcm(fdt,
>  > +        &s->memmap[TT_ATL_PRCM_RCPU], "rcpu");
>
>         prcm_rcpu_phandle =3D qemu_fdt_get_phandle(fdt, rcpu_name);
>
>
> And now you have access to the phandles you need for everything, without
> bothering storing phandles you don't care about.

Thanks for the feedback, will incorporate this in V2.

>
>
>
> Thanks,
> Daniel
>
>
> >       void *fdt =3D MACHINE(s)->fdt;
> >
> >       create_fdt_cpu(s, s->memmap, aplic_s_phandle, imsic_s_phandle);
> > @@ -348,6 +380,33 @@ static void finalize_fdt(TTAtlantisState *s)
> >                       aplic_s_phandle);
> >
> >       create_fdt_clk(fdt, "periph-clk", 100000000, periph_clk_phandle);
> > +    create_fdt_clk(fdt, "osc_24m", 24000000, osc_24m_phandle);
> > +
> > +    g_autofree char *rcpu_name =3D create_fdt_prcm(fdt,
> > +        &s->memmap[TT_ATL_PRCM_RCPU], "rcpu", prcm_rcpu_phandle);
> > +    qemu_fdt_setprop_cells(fdt, rcpu_name, "clocks", osc_24m_phandle);
> > +    qemu_fdt_setprop_cells(fdt, rcpu_name, "assigned-clocks",
> > +                           prcm_rcpu_phandle, TT_ATL_CLK_RCPU_ROOT,
> > +                           prcm_rcpu_phandle, TT_ATL_CLK_NOCC_CLK);
> > +    qemu_fdt_setprop_cells(fdt, rcpu_name, "assigned-clock-parents",
> > +                           prcm_rcpu_phandle, TT_ATL_CLK_RCPU_PLL,
> > +                           prcm_rcpu_phandle, TT_ATL_CLK_NOC_PLL);
> > +
> > +    g_autofree char *hsio_name =3D create_fdt_prcm(fdt,
> > +        &s->memmap[TT_ATL_PRCM_HSIO], "hsio", prcm_hsio_phandle);
> > +    qemu_fdt_setprop_cells(fdt, hsio_name, "clocks", osc_24m_phandle,
> > +                           prcm_rcpu_phandle, TT_ATL_CLK_HSIO_PLL);
> > +
> > +    g_autofree char *pcie_name =3D create_fdt_prcm(fdt,
> > +        &s->memmap[TT_ATL_PRCM_PCIE], "pcie", prcm_pcie_phandle);
> > +    qemu_fdt_setprop_cells(fdt, pcie_name, "clocks", osc_24m_phandle,
> > +                           prcm_rcpu_phandle, TT_ATL_CLK_PCIE_PLL);
> > +
> > +    g_autofree char *mm_name =3D create_fdt_prcm(fdt,
> > +        &s->memmap[TT_ATL_PRCM_MM], "mm", prcm_mm_phandle);
> > +    qemu_fdt_setprop_cells(fdt, mm_name, "clocks", osc_24m_phandle,
> > +                           prcm_rcpu_phandle, TT_ATL_CLK_MM_PLL0,
> > +                           prcm_rcpu_phandle, TT_ATL_CLK_MM_PLL1);
> >
> >       for (int i =3D 0; i < TT_ATL_NUM_I2C; i++) {
> >           create_fdt_i2c(fdt,
> > @@ -545,6 +604,39 @@ static void tt_atlantis_machine_init(MachineState =
*machine)
> >       serial_mm_init(system_memory, s->memmap[TT_ATL_UART1].base, 2,
> >                      qdev_get_gpio_in(s->irqchip, TT_ATL_UART1_IRQ),
> >                      115200, serial_hd(0), DEVICE_LITTLE_ENDIAN);
> > +
> > +    /* Add rcpu prcm block */
> > +    object_initialize_child(OBJECT(s), "prcm-rcpu", &s->prcm[0],
> > +                            TYPE_TT_ATLANTIS_PRCM_RCPU);
> > +    sysbus_realize(SYS_BUS_DEVICE(&s->prcm[0]), &error_fatal);
> > +    memory_region_add_subregion(system_memory,
> > +            s->memmap[TT_ATL_PRCM_RCPU].base,
> > +            sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->prcm[0]), 0));
> > +
> > +    /* Add hsio prcm block */
> > +    object_initialize_child(OBJECT(s), "prcm-hsio", &s->prcm[1],
> > +                            TYPE_TT_ATLANTIS_PRCM_HSIO);
> > +    sysbus_realize(SYS_BUS_DEVICE(&s->prcm[1]), &error_fatal);
> > +    memory_region_add_subregion(system_memory,
> > +            s->memmap[TT_ATL_PRCM_HSIO].base,
> > +            sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->prcm[1]), 0));
> > +
> > +    /* Add pcie prcm block */
> > +    object_initialize_child(OBJECT(s), "prcm-pcie", &s->prcm[2],
> > +                            TYPE_TT_ATLANTIS_PRCM_PCIE);
> > +    sysbus_realize(SYS_BUS_DEVICE(&s->prcm[2]), &error_fatal);
> > +    memory_region_add_subregion(system_memory,
> > +            s->memmap[TT_ATL_PRCM_PCIE].base,
> > +            sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->prcm[2]), 0));
> > +
> > +    /* Add mm prcm block */
> > +    object_initialize_child(OBJECT(s), "prcm-mm", &s->prcm[3],
> > +                            TYPE_TT_ATLANTIS_PRCM_MM);
> > +    sysbus_realize(SYS_BUS_DEVICE(&s->prcm[3]), &error_fatal);
> > +    memory_region_add_subregion(system_memory,
> > +            s->memmap[TT_ATL_PRCM_MM].base,
> > +            sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->prcm[3]), 0));
> > +
> >       /*
> >        * Atlantis contains a DesignWare uart while the QEMU machine
> >        * uses the serial_mm model with the base ns16550 register set.
> > diff --git a/include/hw/riscv/tt_atlantis.h b/include/hw/riscv/tt_atlan=
tis.h
> > index 7f7d4a5a59..20bcdfeb52 100644
> > --- a/include/hw/riscv/tt_atlantis.h
> > +++ b/include/hw/riscv/tt_atlantis.h
> > @@ -13,12 +13,14 @@
> >   #include "hw/core/sysbus.h"
> >   #include "hw/i2c/designware_i2c.h"
> >   #include "hw/intc/riscv_imsic.h"
> > +#include "hw/misc/tt_atlantis_prcm.h"
> >   #include "hw/riscv/riscv_hart.h"
> >
> >   #define TYPE_TT_ATLANTIS_MACHINE MACHINE_TYPE_NAME("tt-atlantis")
> >   OBJECT_DECLARE_SIMPLE_TYPE(TTAtlantisState, TT_ATLANTIS_MACHINE)
> >
> >   #define TT_ATL_NUM_I2C 5
> > +#define TT_ATL_NUM_PRCM 4
> >
> >   struct TTAtlantisState {
> >       /*< private >*/
> > @@ -31,6 +33,7 @@ struct TTAtlantisState {
> >       RISCVHartArrayState soc;
> >       DeviceState *irqchip;
> >       DesignWareI2CState i2c[TT_ATL_NUM_I2C];
> > +    TTAtlantisPRCMState prcm[TT_ATL_NUM_PRCM];
> >
> >       int fdt_size;
> >   };
> > @@ -59,6 +62,22 @@ enum {
> >       TT_ATL_SAPLIC,
> >       TT_ATL_SIMSIC,
> >       TT_ATL_UART1,
> > +    TT_ATL_PRCM_RCPU,
> > +    TT_ATL_PRCM_HSIO,
> > +    TT_ATL_PRCM_PCIE,
> > +    TT_ATL_PRCM_MM,
> > +};
> > +
> > +/* RCPU PRCM Clock IDs */
> > +enum {
> > +    TT_ATL_CLK_RCPU_PLL =3D 0,
> > +    TT_ATL_CLK_RCPU_ROOT =3D 1,
> > +    TT_ATL_CLK_NOC_PLL =3D 25,
> > +    TT_ATL_CLK_NOCC_CLK =3D 26,
> > +    TT_ATL_CLK_HSIO_PLL =3D 54,
> > +    TT_ATL_CLK_PCIE_PLL =3D 55,
> > +    TT_ATL_CLK_MM_PLL0 =3D 56,
> > +    TT_ATL_CLK_MM_PLL1 =3D 57,
> >   };
> >
> >   #endif
> >
>

