Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F38D6CA5FEC
	for <qemu-riscv@archiver.kernel.org>; Sat,  3 Oct 2026 15:11:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xD1Np-0006sV-7r; Sat, 03 Oct 2026 11:10:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xD1Nl-0006s2-0I
 for qemu-riscv@nongnu.org; Sat, 03 Oct 2026 11:10:37 -0400
Received: from mail-yx2-x2a.google.com ([2607:f8b0:4864:41::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xD1Ni-0002MR-MG
 for qemu-riscv@nongnu.org; Sat, 03 Oct 2026 11:10:36 -0400
Received: by mail-yx2-x2a.google.com with SMTP id
 956f58d0204a3-675617094f5so253293d50.1
 for <qemu-riscv@nongnu.org>; Sat, 03 Oct 2026 08:10:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791040231; cv=none;
 d=google.com; s=arc-20260327;
 b=r6BufG5LjSq7YnAOeOnnV4yDVBkDyy1s73ZF8oTx/TWxUEIX6CyxLGzY2BSFcWoMm+
 GGZUJBveZaL/9PyYnojNc6ZsCt77IgjQZY7KnQVhwvXcyAZRzrd6wnKM91dd8IeZegHy
 6ZMVp4PAjyqhM9w5rUFfsQbl8tGReqdYsQdf3ZtrGRSWSkMuYDGzqpdSc9POgXUXNHTz
 FDcdrZ/ucpBPS/U9ZSwyApob3qnp+RIgb+EH2FhCx1zeKoRI3U5eMrVy+11pmR/4WVs/
 Tt4ItsbJk/cPRb/L7GoUHqcD3x+UT2n+A8UAD73sbDrKBETyvf4mWwq9QbpDE2F+wWeh
 qjXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=EO5aEciYOyrHFKhcf4X7PqIecTAJNlpISx/y6e6e8sI=;
 fh=4urVOz6TGGmua7nGRF2lT/AOHWTGdZNDHshZgmYJXwE=;
 b=F7AW3b6waTDxT2AiyzeIFKS/4euCGwgB3yPkyJFL8d0yu+rfHY4wy1C8mzJl2/PMLZ
 piKQLC+zhepewDTbKR5qH9siAqChaKa2t2BWND/i2SSDj2TPO9FurnMzKDekB+EroUaO
 LwPNU4tFiZEhYxhU/JuNkgDnkuIDh8rOC8cgrOTkT5yuOaUaaUPgR0dv6aYCSzkVqQnG
 IjRgK6ZLu3E1o/j1X613l1PvX8kTJpaNK2G9SxXvbo0XYTvkFUFGdy2h3Yt/EKDXGuoL
 rXtjLoMDijI/zgPg8uDB4TIpWVrDXasRf+dQJBZdWYmUPzvO0HLDtrTeJ8NWO05Ar4UZ
 uaUw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791040231; x=1791645031; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=EO5aEciYOyrHFKhcf4X7PqIecTAJNlpISx/y6e6e8sI=;
 b=Q06CEtlCQWvv07Z+I2Cpv72bZlOoIsVYrCvQJ4sr2q94S78BDuntjMA2THjPHvFVn9
 coLGJwjNZJH3KtpLJpvdJVPDZe0vS4kyB4rqXoNe18haiHYlN15BeCt79XerSDlQXh3M
 n3aTLAujdaPphY6ijYuggKJpMkei+BQJLLN6RU8GI5lzQztspt/HBi6SE2TemO4MqMwE
 79aAyDLNVnXlrwaIZdGKJ6uT/vjcC1m5ekj1c+dTbEsszw3xasDIoCefhdHeQE1BJp+9
 h5MGuZn3YI5pJSuYgfCGyrKhKqDoxQWPS6WVK5cKlfTN7/DvCXtmDJ2+rWuJlMdSHV6g
 jFyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791040231; x=1791645031;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=EO5aEciYOyrHFKhcf4X7PqIecTAJNlpISx/y6e6e8sI=;
 b=zsccYVb8z7avTtllS95XgeKOuPOxtFaQZR2b3cx9hmB+LSO04uozBKXEtiYcbXeVvx
 MHJyKWN+W6GFq0Gg8lUYhGJqgnxgJd7zCabKqtBRTr+66UjxKzIfmhiL79R8OCG1qeG+
 rQ3CNsK7p7C7LCXAswmT/cLiuNEbft+OmyVTZ96/u0v9V2AQkp+XPcFcsm0d1jsGEPrs
 NvmRyssN+ze52Oqtjo9YoLg7VH3YdLDlCh3t4Gh7cCFKbYs54jW3MuoBTjgwpJFCFE9U
 3pcqqyA0aQOEMObfB0pLv7usrSKVXrgAqhYphiRaBs1hjuT1ILa3ERbdv8GJVwct+gds
 PZfA==
X-Forwarded-Encrypted: i=1;
 AKwUvByzgF3CvF/8wtVPO983ZwNP5FiivHrlxJzN3w7LZxWi/If6rkb23tFznoikfdC//PyKpQ51Zn81grmm@nongnu.org
X-Gm-Message-State: AFq9FYJ12nr9zuiqg9HDnFfNS8ragPqrwSrOfcZ/GHO6wTlkQ/aYwcRi
 RaGsV/u1xQMtN8CS38alDJjWTYk/kFEf3sBoA9U+ZHp/9fldKzFkNMXWc/6CgPY8YsIApAIseXC
 Ko+88bvEh28AcFB5ifouC4KDwyCj822s=
X-Gm-Gg: AYBFou2sXMGyCXYpg+9c4dr1ky0USg3rO/85Zt0usG1l5MlmjSgNSYIu4OGQlp0eiA8
 1gr5vSji13dzSTd/XEyvccqEWoy7BAsav/xCQps8quY4P6Qmc1PiLAySE4BWyOmCGO8fX+NKGDX
 OswHiw4J4iYtEO7+KtZiZ+d5x2fapDCw9zMuFYbbntlo97Ktuir35XWUxEPVZTgTd5Xtb1UpFYD
 24RWkxEYf0A7W5maj/Yev5FIKSGMhPcnIeVdb85BmdQ3pBPD6TA2gHhlcX16s6qS5Lmvdcu9723
 zO3LUA8lWuk94qlDfJ1GY5mK8ZdM71YPKlCdZNfblVTg67/yQRi2ev+QThIPFzLIEKIzFf3gdQ7
 xW2NzT1cXzAU9DA==
X-Received: by 2002:a05:690e:43d9:b0:675:35bc:d67f with SMTP id
 956f58d0204a3-677abde2e2amr2189610d50.2.1791040231336; Sat, 03 Oct 2026
 08:10:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260904155758.3833179-1-bin.meng@processmission.com>
 <20260904155758.3833179-6-bin.meng@processmission.com>
 <64d47ae0-98ab-4570-8711-e2f2f2601b2a@oss.qualcomm.com>
In-Reply-To: <64d47ae0-98ab-4570-8711-e2f2f2601b2a@oss.qualcomm.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 3 Oct 2026 23:10:19 +0800
X-Gm-Features: AclHuK_7u2p2GqYnyFaaOaApJF11EKHe_2Wd3zVx9clyAvcYSV3OZWYuR3n4k1Y
Message-ID: <CAEUhbmV6=oxxhR1Vohdi_LMzf_3gbOj9FX9LZXYjHOfXDjqdLA@mail.gmail.com>
Subject: Re: [PATCH v2 05/24] hw/riscv: pfsoc: Couple L2CC to L2-LIM
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: Bin Meng <bin.meng@processmission.com>, QEMU <qemu-devel@nongnu.org>, 
 Chao Liu <chao.liu@processmission.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Conor Dooley <conor@kernel.org>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Sebastian Huber <sebastian.huber@embedded-brains.de>,
 Weiwei Li <liwei1518@gmail.com>, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:41::2a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yx2-x2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hi Philippe,

On Wed, Sep 30, 2026 at 5:39=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> Hi,
>
> On 4/9/26 17:57, Bin Meng wrote:
> > Instantiate the L2CC in the PolarFire SoC machine and connect its
> > WayEnable register to the L2-LIM MemoryRegion. Back the complete 2 MiB
> > aperture and shrink it by 128 KiB for each cache way enabled.
> >
> > Keep L2 Zero at its fixed aperture because it represents a cache
> > allocation window rather than the remaining L2-LIM capacity.
> >
> > Signed-off-by: Bin Meng <bin.meng@processmission.com>
> > Reviewed-by: Chao Liu <chao.liu@processmission.com>
> > ---
> >
> > (no changes since v1)
> >
> >   include/hw/misc/mchp_pfsoc_l2cc.h  |  1 +
> >   include/hw/riscv/microchip_pfsoc.h |  2 ++
> >   hw/misc/mchp_pfsoc_l2cc.c          | 51 +++++++++++++++++++++++++++++=
+
> >   hw/riscv/microchip_pfsoc.c         | 23 +++++++-------
> >   hw/riscv/Kconfig                   |  1 +
> >   5 files changed, 67 insertions(+), 11 deletions(-)
> >
> > diff --git a/include/hw/misc/mchp_pfsoc_l2cc.h b/include/hw/misc/mchp_p=
fsoc_l2cc.h
> > index 1b5b3888d5..3a175a6340 100644
> > --- a/include/hw/misc/mchp_pfsoc_l2cc.h
> > +++ b/include/hw/misc/mchp_pfsoc_l2cc.h
> > @@ -22,6 +22,7 @@ typedef struct MchpPfSoCL2ccState {
> >       SysBusDevice parent;
> >       uint64_t regs[MCHP_PFSOC_L2CC_REG_NUM];
> >       RegisterInfo regs_info[MCHP_PFSOC_L2CC_REG_NUM];
> > +    MemoryRegion *l2lim;
> >   } MchpPfSoCL2ccState;
> >
> >   #define TYPE_MCHP_PFSOC_L2CC "mchp.pfsoc.l2cc"
> > diff --git a/include/hw/riscv/microchip_pfsoc.h b/include/hw/riscv/micr=
ochip_pfsoc.h
> > index 612fd2b69c..0aeccedf77 100644
> > --- a/include/hw/riscv/microchip_pfsoc.h
> > +++ b/include/hw/riscv/microchip_pfsoc.h
> > @@ -27,6 +27,7 @@
> >   #include "hw/cpu/cluster.h"
> >   #include "hw/dma/sifive_pdma.h"
> >   #include "hw/misc/mchp_pfsoc_dmc.h"
> > +#include "hw/misc/mchp_pfsoc_l2cc.h"
> >   #include "hw/misc/mchp_pfsoc_ioscb.h"
> >   #include "hw/misc/mchp_pfsoc_sysreg.h"
> >   #include "hw/net/cadence_gem.h"
> > @@ -43,6 +44,7 @@ typedef struct MicrochipPFSoCState {
> >       RISCVHartArrayState e_cpus;
> >       RISCVHartArrayState u_cpus;
> >       DeviceState *plic;
> > +    MchpPfSoCL2ccState l2cc;
> >       MchpPfSoCDdrSgmiiPhyState ddr_sgmii_phy;
> >       MchpPfSoCDdrCfgState ddr_cfg;
> >       MchpPfSoCIoscbState ioscb;
> > diff --git a/hw/misc/mchp_pfsoc_l2cc.c b/hw/misc/mchp_pfsoc_l2cc.c
> > index 979d904676..4b87c963fc 100644
> > --- a/hw/misc/mchp_pfsoc_l2cc.c
> > +++ b/hw/misc/mchp_pfsoc_l2cc.c
> > @@ -11,6 +11,9 @@
> >
> >   #include "qemu/osdep.h"
> >   #include "qemu/log.h"
> > +#include "qemu/units.h"
> > +#include "qapi/error.h"
> > +#include "hw/core/qdev-properties.h"
> >   #include "hw/core/register.h"
> >   #include "hw/core/registerfields.h"
> >   #include "hw/misc/mchp_pfsoc_l2cc.h"
> > @@ -39,6 +42,25 @@ REG64(L2_WAY_MASK_HART4_DCACHE, 0x868)
> >   REG64(L2_WAY_MASK_HART4_ICACHE, 0x870)
> >
> >   #define L2_CONFIG_RESET         0x06091004
> > +#define L2_LIM_WAY_COUNT        15
> > +#define L2_WAY_SIZE             (128 * KiB)
> > +
> > +static void mchp_pfsoc_l2cc_update_l2lim(MchpPfSoCL2ccState *s,
> > +                                         uint64_t way_enable)
> > +{
> > +    uint64_t l2lim_size;
> > +
> > +    if (way_enable >=3D L2_LIM_WAY_COUNT) {
> > +        l2lim_size =3D 0;
> > +    } else {
> > +        l2lim_size =3D (L2_LIM_WAY_COUNT - way_enable) * L2_WAY_SIZE;
> > +    }
> > +
> > +    memory_region_transaction_begin();
> > +    memory_region_set_size(s->l2lim, l2lim_size);
> > +    memory_region_set_enabled(s->l2lim, l2lim_size !=3D 0);
> > +    memory_region_transaction_commit();
> > +}
> >
> >   static uint64_t mchp_pfsoc_l2cc_way_enable_pre_write(RegisterInfo *re=
g,
> >                                                        uint64_t value)
> > @@ -48,6 +70,14 @@ static uint64_t mchp_pfsoc_l2cc_way_enable_pre_write=
(RegisterInfo *reg,
> >       return MAX(current, value);
> >   }
> >
> > +static void mchp_pfsoc_l2cc_way_enable_post_write(RegisterInfo *reg,
> > +                                                  uint64_t value)
> > +{
> > +    MchpPfSoCL2ccState *s =3D MCHP_PFSOC_L2CC(reg->opaque);
> > +
> > +    mchp_pfsoc_l2cc_update_l2lim(s, value);
> > +}
> > +
> >   #define WAY_MASK_REGISTER(_name)                \
> >       {                                           \
> >           .name =3D "WAY_MASK_" #_name,             \
> > @@ -66,6 +96,7 @@ static const RegisterAccessInfo mchp_pfsoc_l2cc_regs_=
info[] =3D {
> >           .addr =3D A_L2_WAY_ENABLE,
> >           .rsvd =3D ~R_L2_WAY_ENABLE_VALUE_MASK,
> >           .pre_write =3D mchp_pfsoc_l2cc_way_enable_pre_write,
> > +        .post_write =3D mchp_pfsoc_l2cc_way_enable_post_write,
> >       },
> >       WAY_MASK_REGISTER(DMA),
> >       WAY_MASK_REGISTER(AXI4_PORT_0),
> > @@ -157,11 +188,31 @@ static void mchp_pfsoc_l2cc_init(Object *obj)
> >       sysbus_init_mmio(SYS_BUS_DEVICE(obj), &reg_array->mem);
> >   }
> >
> > +static void mchp_pfsoc_l2cc_realize(DeviceState *dev, Error **errp)
> > +{
> > +    MchpPfSoCL2ccState *s =3D MCHP_PFSOC_L2CC(dev);
> > +
> > +    if (!s->l2lim) {
> > +        error_setg(errp, TYPE_MCHP_PFSOC_L2CC ": 'l2-lim' link not set=
");
> > +        return;
> > +    }
> > +
> > +    mchp_pfsoc_l2cc_update_l2lim(s, s->regs[R_L2_WAY_ENABLE]);
> > +}
> > +
> > +static const Property mchp_pfsoc_l2cc_properties[] =3D {
> > +    DEFINE_PROP_LINK("l2-lim", MchpPfSoCL2ccState, l2lim,
> > +                     TYPE_MEMORY_REGION, MemoryRegion *),
> > +};
> > +
> >   static void mchp_pfsoc_l2cc_class_init(ObjectClass *klass, const void=
 *data)
> >   {
> > +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> >       ResettableClass *rc =3D RESETTABLE_CLASS(klass);
> >
> >       rc->phases.hold =3D mchp_pfsoc_l2cc_reset_hold;
> > +    device_class_set_props(dc, mchp_pfsoc_l2cc_properties);
> > +    dc->realize =3D mchp_pfsoc_l2cc_realize;
> >   }
> >
> >   static const TypeInfo mchp_pfsoc_l2cc_info =3D {
> > diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
> > index 8106dbb3ad..114567867b 100644
> > --- a/hw/riscv/microchip_pfsoc.c
> > +++ b/hw/riscv/microchip_pfsoc.c
> > @@ -174,6 +174,9 @@ static void microchip_pfsoc_soc_instance_init(Objec=
t *obj)
> >       object_initialize_child(obj, "dma-controller", &s->dma,
> >                               TYPE_SIFIVE_PDMA);
> >
> > +    object_initialize_child(obj, "l2-cache-controller", &s->l2cc,
> > +                            TYPE_MCHP_PFSOC_L2CC);
>
> Is this the same model used by hw/riscv/sifive_u.c?

From technical reference manual they seem to use the same IP (the IP
should be from SiFive). The Linux kernel dts file compatible string of
both machines also supports this. Current QEMU `sifive_u` machine does
not integrate the L2CC block yet.

>
> >       object_initialize_child(obj, "sysreg", &s->sysreg,
> >                               TYPE_MCHP_PFSOC_SYSREG);
> >
> > @@ -260,18 +263,9 @@ static void microchip_pfsoc_soc_realize(DeviceStat=
e *dev, Error **errp)
> >           RISCV_ACLINT_DEFAULT_MTIMECMP, RISCV_ACLINT_DEFAULT_MTIME,
> >           iks->clint_timebase_freq, false);
> >
> > -    /* L2 cache controller */
> > -    create_unimplemented_device("microchip.pfsoc.l2cc",
> > -        memmap[MICROCHIP_PFSOC_L2CC].base, memmap[MICROCHIP_PFSOC_L2CC=
].size);
> > -
> >       /*
> > -     * Add L2-LIM at reset size.
> > -     * This should be reduced in size as the L2 Cache Controller WayEn=
able
> > -     * register is incremented. Unfortunately I don't see a nice (or a=
ny) way
> > -     * to handle reducing or blocking out the L2 LIM while still allow=
ing it
> > -     * be re returned to all enabled after a reset. For the time being=
, just
> > -     * leave it enabled all the time. This won't break anything, but w=
ill be
> > -     * too generous to misbehaving guests.
> > +     * Back the complete L2-LIM aperture. The L2 cache controller resi=
zes
> > +     * this MemoryRegion to 128 KiB for every way assigned to L2-LIM.
> >        */
> >       memory_region_init_ram(l2lim_mem, NULL, "microchip.pfsoc.l2lim",
> >                              memmap[MICROCHIP_PFSOC_L2LIM].size, &error=
_fatal);
> > @@ -279,6 +273,13 @@ static void microchip_pfsoc_soc_realize(DeviceStat=
e *dev, Error **errp)
> >                                   memmap[MICROCHIP_PFSOC_L2LIM].base,
> >                                   l2lim_mem);
> >
> > +    /* L2 cache controller */
> > +    object_property_set_link(OBJECT(&s->l2cc), "l2-lim",
> > +                             OBJECT(l2lim_mem), &error_abort);
>
> Modelling question (I have no clue with this particular SoC): does
> 'l2-lim' belong to the SoC layer, consumed by the L2CC or is it
> internal to the L2CC and exposed to the SoC?

I understand your point. Yeah it's better to model 'l2-lim' and
'l2-zero' devices under L2CC. Will do it in v3.

>
> > +    sysbus_realize(SYS_BUS_DEVICE(&s->l2cc), errp);
> > +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->l2cc), 0,
> > +                    memmap[MICROCHIP_PFSOC_L2CC].base);
> > +
> >       /*
> >        * HSS decompresses into the L2 zero-device window and executes t=
here.
> >        * Model it as RAM because QEMU does not model the backing L2 cac=
he.
> > diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
> > index d06ac26648..85b535c7cb 100644
> > --- a/hw/riscv/Kconfig
> > +++ b/hw/riscv/Kconfig
> > @@ -18,6 +18,7 @@ config MICROCHIP_PFSOC
> >       select DEVICE_TREE
> >       select MCHP_PFSOC_DMC
> >       select MCHP_PFSOC_IOSCB
> > +    select MCHP_PFSOC_L2CC
> >       select MCHP_PFSOC_MMUART
> >       select MCHP_PFSOC_SYSREG
> >       select RISCV_ACLINT
>
>

Regards,
Bin

