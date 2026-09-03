Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D297CC624A4
	for <qemu-riscv@archiver.kernel.org>; Thu,  3 Sep 2026 17:11:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x2Aya-0005lo-1D; Thu, 03 Sep 2026 13:11:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <asrinivasan@tenstorrent.com>)
 id 1x2AyM-0005dG-A6
 for qemu-riscv@nongnu.org; Thu, 03 Sep 2026 13:11:34 -0400
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <asrinivasan@tenstorrent.com>)
 id 1x2AxN-00025b-Le
 for qemu-riscv@nongnu.org; Thu, 03 Sep 2026 13:11:31 -0400
Received: by mail-yx1-xb135.google.com with SMTP id
 956f58d0204a3-66f79f58123so54645d50.1
 for <qemu-riscv@nongnu.org>; Thu, 03 Sep 2026 10:10:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788455431; cv=none;
 d=google.com; s=arc-20260327;
 b=dXln8usN0l/nFDKXMFcS6C68Rs+teLlbmuNC0v1JKEnaBNoxDXsbkqAe15GOuaZ13R
 MVDyACmeg47z0vKc0wylbAqEqN8/PsPMe/RXt9wtmbZhxJD2zAjrmWBPu0zgE+cTQ2tF
 b3aO/NID9iJjlSFEFlVnP3gRI5J1mFv5Y4Is/kQeDMt1EnnYiSHLXIya/0GLCZ7Dukqm
 C6DlyzZN9TD0JyKieUyLL3eDaBfy3fi+XbZUggGcMEDeFCgFfvxvtdlinUfE8SLmV/KZ
 LCAWOgpmIIWi3Afiap3vmJDTmqARZWmJkRlSMflGSkL2TUKtgY1VK6og6KFux1vxXS7A
 pbPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=rMQ5PEE9csDsLkzMcktQnzQ0G1E36vkXdJ16Clec62c=;
 fh=yEpDwYZNQN/vwszvqRuhYismtb/tFrhcp9y9yLci5W0=;
 b=cWEFbcCF0hjLpnZ/RsWuwcptrwr3PB+IZNq0ouuGRrPGTzzoio2pdFY0rvM7EoqqdV
 GQne+FcJyPkyvjgOJb3+84Km8EESj17UEgm47JistC9mXQjgVDRK2EPc2qsyh7qTXcTu
 Ef9/sBiLvtX3ydhmKN4baQ85M41fNqh4GMBdBOKmif/aOMP9k/alo7RkZcMW4QsiIH3G
 5GYEnsVHJ66iRzN9jYOWTzNmw+TIDdQm6va2GJKzdB05TZyNKeKiAiBkw0BEbtkJEqeE
 5MhjN1D8I9SI73Ve5Ec+u3pea3ohiUvBGU2cYJsBZTurMOOHsgSyFL9suszeFmHaYfxB
 BUOg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1788455431; x=1789060231; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=rMQ5PEE9csDsLkzMcktQnzQ0G1E36vkXdJ16Clec62c=;
 b=XEnLI+4b16NKzEOT0MdRm5o2QWyVio9wWiQ5ewVgA+04/Il0oe5eqx6ZKHjvM5V2TZ
 LysLNASF2xn7HsGrtlcfL0I9oMPpvYo7gyZ4RvOfMNBHQMwiITwD8up+CDK19YWZzmCj
 qRd/s1ANwhZLayIvvChUvt0ZrdqBOlfoaZbG4qL17VGKDLstXaRIGOYRn7sUAT8e7U5W
 IlcWK/Szko7Le73ofJ2u7Ukb2h9SG593Q7oR7nduzpNtXTtrl9SWjOKf09FOFUzThgF7
 Pqw9gkT3hC2g5NwveGwMpuPsDTBKl63BytoeIKTbNHUVbKYyoOEHFgSmny8inQrvlMln
 m9MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788455431; x=1789060231;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=rMQ5PEE9csDsLkzMcktQnzQ0G1E36vkXdJ16Clec62c=;
 b=lMtnaHPNabOv8jaxs2xIO9OoF9BYdJZdIZCGcrlf1th8JydrZfr0lURpAoa41aKes0
 FBkX2r6BoznuKxrnPt4RBqlz7vSyOanecd8wN2j8lrGyBXxqGpsqciKNb7S5HomBLbOP
 bpigHRGziePDPqGDmn+bMvImzf2Y9SApe8Spf31uO6cgZA6DGTYPcC07OgTeiOfDBBWH
 gTFpxNnh3KwLUQxdUNYLtjvonFX93eBTjYcAnwT3RHeunNL4hJBbQMxoIuypQYTMVd99
 uhOj6aQDT18uTo2F716mg/F4v/r8HRpuAMnr1tDjKyVejcCWjdPGfjsxRLPHhzLrXNNC
 lD4g==
X-Forwarded-Encrypted: i=1;
 AKwUvByFXjkpYSBmh7IjLNMyPyLXceVF7FzLn4z2baX1q+wDMqivS3yIIftlU2NeiCaUrlPmWmKXlbqyfJ6C@nongnu.org
X-Gm-Message-State: AFuF++ndtqokPN3y5zEnf8+q57mgBemoa0JDNOFAKJlaoWoCVt08AbGv
 mO1qLqQn1y/+G33LDg4PEw0R3LZNk/3VsxWYc0nXSbrIislAwxTxvWEyBxpeYyIRkAMm5RYQbK1
 hgpgMs3I8hrtU6N7IyZiQu+dgOWeIQLpUkjFRHCfCgQ==
X-Gm-Gg: AYBFou0wSme9EK0NguVwvHCEZfKeaEyUkLlqcW82LcI8V4N+AfHTwp03G0d1+SaHL3p
 9cC4zU6UUQNd7LU4VqT8TsePxZlATV9DUrUPvKyQh0qu83kkx0U7v5ygbDfu+U9A4+qz9e26zcv
 /XXTrORtwDHL88QgvSA42kcNHZSoJkyukuDMsOnmNgsK+7Rw9PukOhjnSnFzP5HjPZFkrq6ohUC
 6j3L+zBcLRguKTOAEIu35iwRU3S36Md+UnqpprAFBN3LmenmoFk012tpWjyLCfPFHta7hNRX9DV
 F5Fr6NyBlSjbKn9LB7FeqtpYekyoG5QLHxqYB9ilmc8Ly0OlRi3gW37fnHG1Rlg/rDhnsOdDpYI
 =
X-Received: by 2002:a05:690e:4419:b0:66f:a87e:4f2 with SMTP id
 956f58d0204a3-66fb59d6d77mr39317d50.17.1788455430714; Thu, 03 Sep 2026
 10:10:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260817-atlantis_prcm-v2-0-ffba0b944419@oss.tenstorrent.com>
 <20260817-atlantis_prcm-v2-2-ffba0b944419@oss.tenstorrent.com>
 <CACPK8XcEk4xXDYnY_FSZ7Wud0RQqyLzX_VVA3vXT2q27Z2dn8g@mail.gmail.com>
In-Reply-To: <CACPK8XcEk4xXDYnY_FSZ7Wud0RQqyLzX_VVA3vXT2q27Z2dn8g@mail.gmail.com>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Thu, 3 Sep 2026 12:10:19 -0500
X-Gm-Features: AcwNN1VWLJrd-s74tSaQuZa15t3crwU3mtJDEzqfe41cP9u42YzFgbeB4KENq_U
Message-ID: <CAEev2e9i0evP3MLr_+QjJD9849DRs4M911VeCPxywkrL-z73qg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hw/riscv/tt-atlantis: Add PRCMs to tt-atlantis
 model
To: Joel Stanley <joel@jms.id.au>
Cc: qemu-devel@nongnu.org, Nicholas Piggin <npiggin@gmail.com>, 
 Michael Ellerman <mpe@kernel.org>,
 Portia Stephens <portias@oss.tenstorrent.com>, qemu-riscv@nongnu.org, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu@processmission.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b135;
 envelope-from=asrinivasan@tenstorrent.com; helo=mail-yx1-xb135.google.com
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

Hi,

On Mon, Aug 31, 2026 at 2:06=E2=80=AFAM Joel Stanley <joel@jms.id.au> wrote=
:
>
> On Tue, 18 Aug 2026 at 00:13, Anirudh Srinivasan
> <asrinivasan@oss.tenstorrent.com> wrote:
> >
> > Atlantis has 4 PRCMs that are visible from S mode by the Ascalon Core
> > (RCPU, HSIO, PCIe and MM). This commit adds these 4 PRCM blocks to the
> > tt-atlantis model, along with necessary device tree nodes for them.
> >
> > Reviewed-by: Chao Liu <chao.liu@processmission.com>
> > Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> > ---
> >  docs/system/riscv/tt_atlantis.rst |  1 +
> >  hw/riscv/tt_atlantis.c            | 94 +++++++++++++++++++++++++++++++=
++++++++
> >  include/hw/riscv/tt_atlantis.h    | 19 ++++++++
> >  3 files changed, 114 insertions(+)
> >
> > diff --git a/docs/system/riscv/tt_atlantis.rst b/docs/system/riscv/tt_a=
tlantis.rst
> > index 1f2880d617..539c22354f 100644
> > --- a/docs/system/riscv/tt_atlantis.rst
> > +++ b/docs/system/riscv/tt_atlantis.rst
> > @@ -14,6 +14,7 @@ tt-atlantis QEMU model features
> >  * 8-core Ascalon-X CPU Cluster
> >  * RISC-V compliant Advanced Interrupt Architecture
> >  * 16550A compatible UART
> > +* 4 PRCMs (Clock and Reset Controllers)
> >
> >  Known limitations
> >  -----------------
> > diff --git a/hw/riscv/tt_atlantis.c b/hw/riscv/tt_atlantis.c
> > index d808bcc11c..9ebba07703 100644
> > --- a/hw/riscv/tt_atlantis.c
> > +++ b/hw/riscv/tt_atlantis.c
> > @@ -26,6 +26,7 @@
> >  #include "hw/char/serial-mm.h"
> >  #include "hw/intc/riscv_aclint.h"
> >  #include "hw/misc/unimp.h"
> > +#include "hw/misc/tt_atlantis_prcm.h"
> >
> >  #include "system/system.h"
> >  #include "system/device_tree.h"
> > @@ -59,6 +60,10 @@ static const MemMapEntry tt_atlantis_memmap[] =3D {
> >      [TT_ATL_I2C3] =3D             { 0xd4070000,       0x10000 },
> >      [TT_ATL_I2C4] =3D             { 0xd4080000,       0x10000 },
> >      [TT_ATL_UART1] =3D            { 0xd4110000,       0x10000 },
> > +    [TT_ATL_PRCM_RCPU] =3D        { 0xd0000000,       0x10000 },
> > +    [TT_ATL_PRCM_PCIE] =3D        { 0xd8000000,         0x100 },
> > +    [TT_ATL_PRCM_MM] =3D          { 0xdc000000,        0x1000 },
> > +    [TT_ATL_PRCM_HSIO] =3D        { 0xe00c0000,         0x510 },
> >      [TT_ATL_SAPLIC] =3D           { 0xe8000000,     0x4000000 },
> >      [TT_ATL_DDR_HI] =3D          { 0x100000000,  0x1000000000 },
> >  };
> > @@ -328,11 +333,35 @@ static void create_fdt_i2c_device(TTAtlantisState=
 *s, int bus,
> >      qemu_fdt_setprop_cell(fdt, name, "reg", addr);
> >  }
> >
> > +static char *create_fdt_prcm(void *fdt, const MemMapEntry *mem,
> > +                             const char *prcm_name)
> > +{
> > +    hwaddr base =3D mem->base;
> > +    hwaddr size =3D mem->size;
> > +    char *name =3D g_strdup_printf("/soc/prcm_%s@%" PRIx64,
> > +                                 prcm_name, mem->base);
>
> Use the locals, or drop them and use mem->base both times.
>
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
> > +    qemu_fdt_setprop_cell(fdt, name, "phandle", next_phandle());
>
> If a phandle falls in the woods and nobody...
>
> If you're not saving this value anywhere, is there any need to set one?

Doesn't seem to work if I remove next_phandle(). I get an error at the
qemu_fdt_get_phandle call below like this

qemu-system-riscv64: qemu_fdt_get_phandle: Couldn't get phandle for
/soc/prcm_rcpu@d0000000: <no error>

I think the correct solution would be to use qemu_fdt_alloc_phandle
instead here. That seems to work.

>
> > +
> > +    return name;
> > +}
> > +
> >  static void finalize_fdt(TTAtlantisState *s)
> >  {
> >      uint32_t aplic_s_phandle =3D next_phandle();
> >      uint32_t imsic_s_phandle =3D next_phandle();
> >      uint32_t periph_clk_phandle =3D next_phandle();
> > +    uint32_t osc_24m_phandle =3D next_phandle();
> > +    uint32_t prcm_rcpu_phandle;
> >      void *fdt =3D MACHINE(s)->fdt;
> >
> >      create_fdt_cpu(s, s->memmap, aplic_s_phandle, imsic_s_phandle);
> > @@ -348,6 +377,34 @@ static void finalize_fdt(TTAtlantisState *s)
> >                      aplic_s_phandle);
> >
> >      create_fdt_clk(fdt, "periph-clk", 100000000, periph_clk_phandle);
> > +    create_fdt_clk(fdt, "osc_24m", 24000000, osc_24m_phandle);
>
> With the PRCM enabled the UART and I2C can get a real clock? So we can
> drop the periph-clk node and modify create_fdt_i2c as well as
> create_fdt_uart to use the real PRCM phandles. This will shake out any
> issues with how you're wiring up the device tree too.

Updated.

>
> > +
> > +    g_autofree char *rcpu_name =3D create_fdt_prcm(fdt,
> > +        &s->memmap[TT_ATL_PRCM_RCPU], "rcpu");
> > +    prcm_rcpu_phandle =3D qemu_fdt_get_phandle(fdt, rcpu_name);
>
> This is a great function that I didn't know of when I wrote
> next_phandle(). I'm all for using it, but lets swap the entire file
> over at once.

I would like to keep this series limited to adding the PRCM, this
cleanup can be done in a subsequent series.

>
> > +    qemu_fdt_setprop_cells(fdt, rcpu_name, "clocks", osc_24m_phandle);
> > +    qemu_fdt_setprop_cells(fdt, rcpu_name, "assigned-clocks",
> > +                           prcm_rcpu_phandle, TT_ATL_CLK_RCPU_ROOT,
> > +                           prcm_rcpu_phandle, TT_ATL_CLK_NOCC_CLK);
> > +    qemu_fdt_setprop_cells(fdt, rcpu_name, "assigned-clock-parents",
> > +                           prcm_rcpu_phandle, TT_ATL_CLK_RCPU_PLL,
> > +                           prcm_rcpu_phandle, TT_ATL_CLK_NOC_PLL);
>
> > @@ -545,6 +602,43 @@ static void tt_atlantis_machine_init(MachineState =
*machine)
> >      serial_mm_init(system_memory, s->memmap[TT_ATL_UART1].base, 2,
> >                     qdev_get_gpio_in(s->irqchip, TT_ATL_UART1_IRQ),
> >                     115200, serial_hd(0), DEVICE_LITTLE_ENDIAN);
> > +
> > +    /* Add rcpu prcm block */
> > +    object_initialize_child(OBJECT(s), "prcm-rcpu", &s->prcm[0],
> > +                            TYPE_TT_ATLANTIS_PRCM_RCPU);
> > +    sysbus_realize(SYS_BUS_DEVICE(&s->prcm[0]), &error_fatal);
> > +    memory_region_add_subregion(system_memory,
>
> Since you're already sending a v3, can you rebase it on this series pleas=
e:
>
>  https://lore.kernel.org/qemu-riscv/20260831021500.82565-1-joel@jms.id.au=
/
>
> Aside from code shuffling, you will pass s->memory to
> memory_region_add_subregion, the _realize calls go in
> tt_atlantis_soc_realize, and the initalise calls go in
> tt_atlantis_soc_init.

Will do.

>
> > +                                s->memmap[TT_ATL_PRCM_RCPU].base,
> > +                                sysbus_mmio_get_region(
> > +                                    SYS_BUS_DEVICE(&s->prcm[0]), 0));
> > +
>
> > diff --git a/include/hw/riscv/tt_atlantis.h b/include/hw/riscv/tt_atlan=
tis.h
> > index 7f7d4a5a59..20bcdfeb52 100644
> > --- a/include/hw/riscv/tt_atlantis.h
> > +++ b/include/hw/riscv/tt_atlantis.h
>
> > @@ -59,6 +62,22 @@ enum {
> >      TT_ATL_SAPLIC,
> >      TT_ATL_SIMSIC,
> >      TT_ATL_UART1,
> > +    TT_ATL_PRCM_RCPU,
> > +    TT_ATL_PRCM_HSIO,
> > +    TT_ATL_PRCM_PCIE,
> > +    TT_ATL_PRCM_MM,
> > +};
> > +
> > +/* RCPU PRCM Clock IDs */
>
> Do these come from
> include/dt-bindings/clock/tenstorrent,atlantis-prcm-rcpu.h in linux?
> Add a comment.

Yes.



>
> > +enum {
> > +    TT_ATL_CLK_RCPU_PLL =3D 0,
> > +    TT_ATL_CLK_RCPU_ROOT =3D 1,
> > +    TT_ATL_CLK_NOC_PLL =3D 25,
> > +    TT_ATL_CLK_NOCC_CLK =3D 26,
> > +    TT_ATL_CLK_HSIO_PLL =3D 54,
> > +    TT_ATL_CLK_PCIE_PLL =3D 55,
> > +    TT_ATL_CLK_MM_PLL0 =3D 56,
> > +    TT_ATL_CLK_MM_PLL1 =3D 57,
> >  };
> >
> >  #endif
> >
> > --
> > 2.43.0
> >

