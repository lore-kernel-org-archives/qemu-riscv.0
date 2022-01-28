Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nDIHX-0005hQ-OV
	for mharc-qemu-riscv@gnu.org; Thu, 27 Jan 2022 22:50:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nDIHT-0005fN-N6
 for qemu-riscv@nongnu.org; Thu, 27 Jan 2022 22:50:36 -0500
Received: from [2a00:1450:4864:20::331] (port=41964
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nDIHP-0003Hg-Pk
 for qemu-riscv@nongnu.org; Thu, 27 Jan 2022 22:50:34 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 q141-20020a1ca793000000b00347b48dfb53so3177346wme.0
 for <qemu-riscv@nongnu.org>; Thu, 27 Jan 2022 19:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AT7r9hHDJ6gET3KtK77QgtXS+v8XwAlZzUG3iMEkPcQ=;
 b=dwheHKefGL27KDt1jEDFojxkFx/X/276HLb9n52tCI9s+4jCnETsholk3FHbQEOxsx
 tMY9ryeV1dapiv4/jPTnbizbDz3kzhEXpiAkvx5xL131HA/1t10euioU5VV1Cz/biMV2
 3hLW9mnvuhMgVf5AJoCCPZCOONbAdv0QDB5Z1NhbDxkKVWfWsYxV+aEc2Nn/juDkgluO
 U+h6Iat9OTixLf7p34/grlnd4XyX9kywyZ7btJJBNDPEeLRETynEXztv+wTuYOAHGI5m
 R7aUvuzyr9SRyTBJSa9CCvPzOkVq+bEhuZkokF716lXwUNr30w+rQBnBz7CiGWJxoiUM
 Avig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AT7r9hHDJ6gET3KtK77QgtXS+v8XwAlZzUG3iMEkPcQ=;
 b=1i6bQR+VQjq3AFJy6DaLUlbxWOwSs0iGY6jUMfexCzkW7zmBMLYYnPE/vNP9kONwdv
 d3k8Glfp9vBejdZ7bka4DZWikxFTMND02BFoH3mtT2mH9ThasEBhN9SbPB3PIAFUVm4Z
 pbe3oFqUjwDTdIa00N5MAnaPZwk199P8zWivaJyJz+48M85Kw2l2tRSQzEY38ebw7HtI
 Wv65GlzDYid0XeqLeY4X5nIz96xOOHwXbNyv88n6nurxKnxw0ESR5YcfQq/llYbntfBr
 oxIin5mrFlSy02VAWMf5x+l9BCYM9Nkl50yt4fAiwQTfSPH9jyf32GchLWigRZ6418s1
 Umtw==
X-Gm-Message-State: AOAM530ymeai+pBWXA3eEkTXvMxJA7HL+HJcFrdz8I8nQdIdR9E39vcf
 Ffg9/qffjgq4PpYrDpsZ/PTnGce9FxDx2q6q7rCydQ==
X-Google-Smtp-Source: ABdhPJy05PN2rBWHkKSQN2TLX7jFSsEKRqvYKkuKSU1JwzVuyB0+eHg2px/GPFPe9r6ha6xhzHheJzByDbdnUYDFkU4=
X-Received: by 2002:a7b:c929:: with SMTP id h9mr13862862wml.176.1643341829198; 
 Thu, 27 Jan 2022 19:50:29 -0800 (PST)
MIME-Version: 1.0
References: <20220119152614.27548-1-anup@brainfault.org>
 <20220119152614.27548-21-anup@brainfault.org>
 <CAKmqyKNn+GzUDX-ZL3KeonbmKU9w4hgHUByYKiME5u1QV0bdrw@mail.gmail.com>
In-Reply-To: <CAKmqyKNn+GzUDX-ZL3KeonbmKU9w4hgHUByYKiME5u1QV0bdrw@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 28 Jan 2022 09:20:17 +0530
Message-ID: <CAAhSdy08EKjkv-v+X3vk1dJUue5ELKC6QZWVh5vFMghE5108sQ@mail.gmail.com>
Subject: Re: [PATCH v8 20/23] hw/intc: Add RISC-V AIA IMSIC device emulation
To: Alistair Francis <alistair23@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Frank Chang <frank.chang@sifive.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atishp@atishpatra.org>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::331;
 envelope-from=anup@brainfault.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 28 Jan 2022 03:50:36 -0000

On Fri, Jan 28, 2022 at 7:24 AM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Thu, Jan 20, 2022 at 1:55 AM Anup Patel <anup@brainfault.org> wrote:
> >
> > From: Anup Patel <anup.patel@wdc.com>
> >
> > The RISC-V AIA (Advanced Interrupt Architecture) defines a new
> > interrupt controller for MSIs (message signal interrupts) called
> > IMSIC (Incoming Message Signal Interrupt Controller). The IMSIC
> > is per-HART device and also suppport virtualizaiton of MSIs using
> > dedicated VS-level guest interrupt files.
> >
> > This patch adds device emulation for RISC-V AIA IMSIC which
> > supports M-level, S-level, and VS-level MSIs.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > Signed-off-by: Anup Patel <anup@brainfault.org>
> > Reviewed-by: Frank Chang <frank.chang@sifive.com>
> > ---
> >  hw/intc/Kconfig               |   3 +
> >  hw/intc/meson.build           |   1 +
> >  hw/intc/riscv_imsic.c         | 448 ++++++++++++++++++++++++++++++++++
> >  include/hw/intc/riscv_imsic.h |  68 ++++++
> >  4 files changed, 520 insertions(+)
> >  create mode 100644 hw/intc/riscv_imsic.c
> >  create mode 100644 include/hw/intc/riscv_imsic.h
> >
> > diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
> > index 528e77b4a6..ec8d4cec29 100644
> > --- a/hw/intc/Kconfig
> > +++ b/hw/intc/Kconfig
> > @@ -73,6 +73,9 @@ config RISCV_ACLINT
> >  config RISCV_APLIC
> >      bool
> >
> > +config RISCV_IMSIC
> > +    bool
> > +
> >  config SIFIVE_PLIC
> >      bool
> >
> > diff --git a/hw/intc/meson.build b/hw/intc/meson.build
> > index 7466024402..5caa337654 100644
> > --- a/hw/intc/meson.build
> > +++ b/hw/intc/meson.build
> > @@ -51,6 +51,7 @@ specific_ss.add(when: 'CONFIG_S390_FLIC_KVM', if_true: files('s390_flic_kvm.c'))
> >  specific_ss.add(when: 'CONFIG_SH_INTC', if_true: files('sh_intc.c'))
> >  specific_ss.add(when: 'CONFIG_RISCV_ACLINT', if_true: files('riscv_aclint.c'))
> >  specific_ss.add(when: 'CONFIG_RISCV_APLIC', if_true: files('riscv_aplic.c'))
> > +specific_ss.add(when: 'CONFIG_RISCV_IMSIC', if_true: files('riscv_imsic.c'))
> >  specific_ss.add(when: 'CONFIG_SIFIVE_PLIC', if_true: files('sifive_plic.c'))
> >  specific_ss.add(when: 'CONFIG_XICS', if_true: files('xics.c'))
> >  specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_XICS'],
> > diff --git a/hw/intc/riscv_imsic.c b/hw/intc/riscv_imsic.c
> > new file mode 100644
> > index 0000000000..18d2877832
> > --- /dev/null
> > +++ b/hw/intc/riscv_imsic.c
> > @@ -0,0 +1,448 @@
> > +/*
> > + * RISC-V IMSIC (Incoming Message Signaled Interrupt Controller)
> > + *
> > + * Copyright (c) 2021 Western Digital Corporation or its affiliates.
> > + *
> > + * This program is free software; you can redistribute it and/or modify it
> > + * under the terms and conditions of the GNU General Public License,
> > + * version 2 or later, as published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope it will be useful, but WITHOUT
> > + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> > + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> > + * more details.
> > + *
> > + * You should have received a copy of the GNU General Public License along with
> > + * this program.  If not, see <http://www.gnu.org/licenses/>.
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "qapi/error.h"
> > +#include "qemu/log.h"
> > +#include "qemu/module.h"
> > +#include "qemu/error-report.h"
> > +#include "qemu/bswap.h"
> > +#include "exec/address-spaces.h"
> > +#include "hw/sysbus.h"
> > +#include "hw/pci/msi.h"
> > +#include "hw/boards.h"
> > +#include "hw/qdev-properties.h"
> > +#include "hw/intc/riscv_imsic.h"
> > +#include "hw/irq.h"
> > +#include "target/riscv/cpu.h"
> > +#include "target/riscv/cpu_bits.h"
> > +#include "sysemu/sysemu.h"
> > +#include "migration/vmstate.h"
> > +
> > +#define IMSIC_MMIO_PAGE_LE             0x00
> > +#define IMSIC_MMIO_PAGE_BE             0x04
> > +
> > +#define IMSIC_MIN_ID                   ((IMSIC_EIPx_BITS * 2) - 1)
> > +#define IMSIC_MAX_ID                   (IMSIC_TOPEI_IID_MASK)
> > +
> > +#define IMSIC_EISTATE_PENDING          (1U << 0)
> > +#define IMSIC_EISTATE_ENABLED          (1U << 1)
> > +#define IMSIC_EISTATE_ENPEND           (IMSIC_EISTATE_ENABLED | \
> > +                                        IMSIC_EISTATE_PENDING)
> > +
> > +static uint32_t riscv_imsic_topei(RISCVIMSICState *imsic, uint32_t page)
> > +{
> > +    uint32_t i, max_irq, base;
> > +
> > +    base = page * imsic->num_irqs;
> > +    max_irq = (imsic->eithreshold[page] &&
> > +               (imsic->eithreshold[page] <= imsic->num_irqs)) ?
> > +               imsic->eithreshold[page] : imsic->num_irqs;
> > +    for (i = 1; i < max_irq; i++) {
> > +        if ((imsic->eistate[base + i] & IMSIC_EISTATE_ENPEND) ==
> > +                IMSIC_EISTATE_ENPEND) {
> > +            return (i << IMSIC_TOPEI_IID_SHIFT) | i;
> > +        }
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +static void riscv_imsic_update(RISCVIMSICState *imsic, uint32_t page)
> > +{
> > +    if (imsic->eidelivery[page] && riscv_imsic_topei(imsic, page)) {
> > +        qemu_irq_raise(imsic->external_irqs[page]);
> > +    } else {
> > +        qemu_irq_lower(imsic->external_irqs[page]);
> > +    }
> > +}
> > +
> > +static int riscv_imsic_eidelivery_rmw(RISCVIMSICState *imsic, uint32_t page,
> > +                                      target_ulong *val,
> > +                                      target_ulong new_val,
> > +                                      target_ulong wr_mask)
> > +{
> > +    target_ulong old_val = imsic->eidelivery[page];
> > +
> > +    if (val) {
> > +        *val = old_val;
> > +    }
> > +
> > +    wr_mask &= 0x1;
> > +    imsic->eidelivery[page] = (old_val & ~wr_mask) | (new_val & wr_mask);
> > +
> > +    riscv_imsic_update(imsic, page);
> > +    return 0;
> > +}
> > +
> > +static int riscv_imsic_eithreshold_rmw(RISCVIMSICState *imsic, uint32_t page,
> > +                                      target_ulong *val,
> > +                                      target_ulong new_val,
> > +                                      target_ulong wr_mask)
> > +{
> > +    target_ulong old_val = imsic->eithreshold[page];
> > +
> > +    if (val) {
> > +        *val = old_val;
> > +    }
> > +
> > +    wr_mask &= IMSIC_MAX_ID;
> > +    imsic->eithreshold[page] = (old_val & ~wr_mask) | (new_val & wr_mask);
> > +
> > +    riscv_imsic_update(imsic, page);
> > +    return 0;
> > +}
> > +
> > +static int riscv_imsic_topei_rmw(RISCVIMSICState *imsic, uint32_t page,
> > +                                 target_ulong *val, target_ulong new_val,
> > +                                 target_ulong wr_mask)
> > +{
> > +    uint32_t base, topei = riscv_imsic_topei(imsic, page);
> > +
> > +    /* Read pending and enabled interrupt with highest priority */
> > +    if (val) {
> > +        *val = topei;
> > +    }
> > +
> > +    /* Writes ignore value and clear top pending interrupt */
> > +    if (topei && wr_mask) {
> > +        topei >>= IMSIC_TOPEI_IID_SHIFT;
> > +        base = page * imsic->num_irqs;
> > +        if (topei) {
> > +            imsic->eistate[base + topei] &= ~IMSIC_EISTATE_PENDING;
> > +        }
> > +
> > +        riscv_imsic_update(imsic, page);
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +static int riscv_imsic_eix_rmw(RISCVIMSICState *imsic,
> > +                               uint32_t xlen, uint32_t page,
> > +                               uint32_t num, bool pend, target_ulong *val,
> > +                               target_ulong new_val, target_ulong wr_mask)
> > +{
> > +    uint32_t i, base;
> > +    target_ulong mask;
> > +    uint32_t state = (pend) ? IMSIC_EISTATE_PENDING : IMSIC_EISTATE_ENABLED;
> > +
> > +    if (xlen != 32) {
> > +        if (num & 0x1) {
> > +            return -EINVAL;
> > +        }
> > +        num >>= 1;
> > +    }
> > +    if (num >= (imsic->num_irqs / xlen)) {
> > +        return -EINVAL;
> > +    }
> > +
> > +    base = (page * imsic->num_irqs) + (num * xlen);
> > +
> > +    if (val) {
> > +        *val = 0;
> > +        for (i = 0; i < xlen; i++) {
> > +            mask = (target_ulong)1 << i;
> > +            *val |= (imsic->eistate[base + i] & state) ? mask : 0;
> > +        }
> > +    }
> > +
> > +    for (i = 0; i < xlen; i++) {
> > +        /* Bit0 of eip0 and eie0 are read-only zero */
> > +        if (!num && !i) {
> > +            continue;
> > +        }
> > +
> > +        mask = (target_ulong)1 << i;
> > +        if (wr_mask & mask) {
> > +            if (new_val & mask) {
> > +                imsic->eistate[base + i] |= state;
> > +            } else {
> > +                imsic->eistate[base + i] &= ~state;
> > +            }
> > +        }
> > +    }
> > +
> > +    riscv_imsic_update(imsic, page);
> > +    return 0;
> > +}
> > +
> > +static int riscv_imsic_rmw(void *arg, target_ulong reg, target_ulong *val,
> > +                           target_ulong new_val, target_ulong wr_mask)
> > +{
> > +    RISCVIMSICState *imsic = arg;
> > +    uint32_t isel, priv, virt, vgein, xlen, page;
> > +
> > +    priv = AIA_IREG_PRIV(reg);
> > +    virt = AIA_IREG_VIRT(reg);
> > +    isel = AIA_IREG_ISEL(reg);
> > +    vgein = AIA_IREG_VGEIN(reg);
> > +    xlen = AIA_IREG_XLEN(reg);
> > +
> > +    if (imsic->mmode) {
> > +        if (priv == PRV_M && !virt) {
> > +            page = 0;
> > +        } else {
> > +            goto err;
> > +        }
> > +    } else {
> > +        if (priv == PRV_S) {
> > +            if (virt) {
> > +                if (vgein && vgein < imsic->num_pages) {
> > +                    page = vgein;
> > +                } else {
> > +                    goto err;
> > +                }
> > +            } else {
> > +                page = 0;
> > +            }
> > +        } else {
> > +            goto err;
> > +        }
> > +    }
> > +
> > +    switch (isel) {
> > +    case ISELECT_IMSIC_EIDELIVERY:
> > +        return riscv_imsic_eidelivery_rmw(imsic, page, val,
> > +                                          new_val, wr_mask);
> > +    case ISELECT_IMSIC_EITHRESHOLD:
> > +        return riscv_imsic_eithreshold_rmw(imsic, page, val,
> > +                                           new_val, wr_mask);
> > +    case ISELECT_IMSIC_TOPEI:
> > +        return riscv_imsic_topei_rmw(imsic, page, val, new_val, wr_mask);
> > +    case ISELECT_IMSIC_EIP0 ... ISELECT_IMSIC_EIP63:
> > +        return riscv_imsic_eix_rmw(imsic, xlen, page,
> > +                                   isel - ISELECT_IMSIC_EIP0,
> > +                                   true, val, new_val, wr_mask);
> > +    case ISELECT_IMSIC_EIE0 ... ISELECT_IMSIC_EIE63:
> > +        return riscv_imsic_eix_rmw(imsic, xlen, page,
> > +                                   isel - ISELECT_IMSIC_EIE0,
> > +                                   false, val, new_val, wr_mask);
> > +    default:
> > +        break;
> > +    };
> > +
> > +err:
> > +    qemu_log_mask(LOG_GUEST_ERROR,
> > +                  "%s: Invalid register priv=%d virt=%d isel=%d vgein=%d\n",
> > +                  __func__, priv, virt, isel, vgein);
> > +    return -EINVAL;
> > +}
> > +
> > +static uint64_t riscv_imsic_read(void *opaque, hwaddr addr, unsigned size)
> > +{
> > +    RISCVIMSICState *imsic = opaque;
> > +
> > +    /* Reads must be 4 byte words */
> > +    if ((addr & 0x3) != 0) {
> > +        goto err;
> > +    }
> > +
> > +    /* Reads cannot be out of range */
> > +    if (addr > IMSIC_MMIO_SIZE(imsic->num_pages)) {
> > +        goto err;
> > +    }
> > +
> > +    return 0;
> > +
> > +err:
> > +    qemu_log_mask(LOG_GUEST_ERROR,
> > +                  "%s: Invalid register read 0x%" HWADDR_PRIx "\n",
> > +                  __func__, addr);
> > +    return 0;
> > +}
> > +
> > +static void riscv_imsic_write(void *opaque, hwaddr addr, uint64_t value,
> > +        unsigned size)
> > +{
> > +    RISCVIMSICState *imsic = opaque;
> > +    uint32_t page;
> > +
> > +    /* Writes must be 4 byte words */
> > +    if ((addr & 0x3) != 0) {
> > +        goto err;
> > +    }
> > +
> > +    /* Writes cannot be out of range */
> > +    if (addr > IMSIC_MMIO_SIZE(imsic->num_pages)) {
> > +        goto err;
> > +    }
> > +
> > +    /* Writes only supported for MSI little-endian registers */
> > +    page = addr >> IMSIC_MMIO_PAGE_SHIFT;
> > +    if ((addr & (IMSIC_MMIO_PAGE_SZ - 1)) == IMSIC_MMIO_PAGE_LE) {
> > +        if (value && (value < imsic->num_irqs)) {
> > +            imsic->eistate[(page * imsic->num_irqs) + value] |=
> > +                                                    IMSIC_EISTATE_PENDING;
> > +        }
> > +    }
> > +
> > +    /* Update CPU external interrupt status */
> > +    riscv_imsic_update(imsic, page);
> > +
> > +    return;
> > +
> > +err:
> > +    qemu_log_mask(LOG_GUEST_ERROR,
> > +                  "%s: Invalid register write 0x%" HWADDR_PRIx "\n",
> > +                  __func__, addr);
> > +}
> > +
> > +static const MemoryRegionOps riscv_imsic_ops = {
> > +    .read = riscv_imsic_read,
> > +    .write = riscv_imsic_write,
> > +    .endianness = DEVICE_LITTLE_ENDIAN,
> > +    .valid = {
> > +        .min_access_size = 4,
> > +        .max_access_size = 4
> > +    }
> > +};
> > +
> > +static void riscv_imsic_realize(DeviceState *dev, Error **errp)
> > +{
> > +    RISCVIMSICState *imsic = RISCV_IMSIC(dev);
> > +    RISCVCPU *rcpu = RISCV_CPU(qemu_get_cpu(imsic->hartid));
> > +    CPUState *cpu = qemu_get_cpu(imsic->hartid);
> > +    CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
> > +
> > +    imsic->num_eistate = imsic->num_pages * imsic->num_irqs;
> > +    imsic->eidelivery = g_new0(uint32_t, imsic->num_pages);
> > +    imsic->eithreshold = g_new0(uint32_t, imsic->num_pages);
> > +    imsic->eistate = g_new0(uint32_t, imsic->num_eistate);
> > +
> > +    memory_region_init_io(&imsic->mmio, OBJECT(dev), &riscv_imsic_ops,
> > +                          imsic, TYPE_RISCV_IMSIC,
> > +                          IMSIC_MMIO_SIZE(imsic->num_pages));
> > +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &imsic->mmio);
> > +
> > +    /* Claim the CPU interrupt to be triggered by this IMSIC */
> > +    if (riscv_cpu_claim_interrupts(rcpu,
> > +            (imsic->mmode) ? MIP_MEIP : MIP_SEIP) < 0) {
> > +        error_report("%s already claimed",
> > +                     (imsic->mmode) ? "MEIP" : "SEIP");
> > +        exit(1);
>
> You should use error_setg() here instead

Okay, I will update.

Regards,
Anup

>
> Alistair
>
> > +    }
> > +
> > +    /* Create output IRQ lines */
> > +    imsic->external_irqs = g_malloc(sizeof(qemu_irq) * imsic->num_pages);
> > +    qdev_init_gpio_out(dev, imsic->external_irqs, imsic->num_pages);
> > +
> > +    /* Force select AIA feature and setup CSR read-modify-write callback */
> > +    if (env) {
> > +        riscv_set_feature(env, RISCV_FEATURE_AIA);
> > +        if (!imsic->mmode) {
> > +            riscv_cpu_set_geilen(env, imsic->num_pages - 1);
> > +        }
> > +        riscv_cpu_set_aia_ireg_rmw_fn(env, (imsic->mmode) ? PRV_M : PRV_S,
> > +                                      riscv_imsic_rmw, imsic);
> > +    }
> > +
> > +    msi_nonbroken = true;
> > +}
> > +
> > +static Property riscv_imsic_properties[] = {
> > +    DEFINE_PROP_BOOL("mmode", RISCVIMSICState, mmode, 0),
> > +    DEFINE_PROP_UINT32("hartid", RISCVIMSICState, hartid, 0),
> > +    DEFINE_PROP_UINT32("num-pages", RISCVIMSICState, num_pages, 0),
> > +    DEFINE_PROP_UINT32("num-irqs", RISCVIMSICState, num_irqs, 0),
> > +    DEFINE_PROP_END_OF_LIST(),
> > +};
> > +
> > +static const VMStateDescription vmstate_riscv_imsic = {
> > +    .name = "riscv_imsic",
> > +    .version_id = 1,
> > +    .minimum_version_id = 1,
> > +    .fields = (VMStateField[]) {
> > +            VMSTATE_VARRAY_UINT32(eidelivery, RISCVIMSICState,
> > +                                  num_pages, 0,
> > +                                  vmstate_info_uint32, uint32_t),
> > +            VMSTATE_VARRAY_UINT32(eithreshold, RISCVIMSICState,
> > +                                  num_pages, 0,
> > +                                  vmstate_info_uint32, uint32_t),
> > +            VMSTATE_VARRAY_UINT32(eistate, RISCVIMSICState,
> > +                                  num_eistate, 0,
> > +                                  vmstate_info_uint32, uint32_t),
> > +            VMSTATE_END_OF_LIST()
> > +        }
> > +};
> > +
> > +static void riscv_imsic_class_init(ObjectClass *klass, void *data)
> > +{
> > +    DeviceClass *dc = DEVICE_CLASS(klass);
> > +
> > +    device_class_set_props(dc, riscv_imsic_properties);
> > +    dc->realize = riscv_imsic_realize;
> > +    dc->vmsd = &vmstate_riscv_imsic;
> > +}
> > +
> > +static const TypeInfo riscv_imsic_info = {
> > +    .name          = TYPE_RISCV_IMSIC,
> > +    .parent        = TYPE_SYS_BUS_DEVICE,
> > +    .instance_size = sizeof(RISCVIMSICState),
> > +    .class_init    = riscv_imsic_class_init,
> > +};
> > +
> > +static void riscv_imsic_register_types(void)
> > +{
> > +    type_register_static(&riscv_imsic_info);
> > +}
> > +
> > +type_init(riscv_imsic_register_types)
> > +
> > +/*
> > + * Create IMSIC device.
> > + */
> > +DeviceState *riscv_imsic_create(hwaddr addr, uint32_t hartid, bool mmode,
> > +                                uint32_t num_pages, uint32_t num_ids)
> > +{
> > +    DeviceState *dev = qdev_new(TYPE_RISCV_IMSIC);
> > +    CPUState *cpu = qemu_get_cpu(hartid);
> > +    uint32_t i;
> > +
> > +    assert(!(addr & (IMSIC_MMIO_PAGE_SZ - 1)));
> > +    if (mmode) {
> > +        assert(num_pages == 1);
> > +    } else {
> > +        assert(num_pages >= 1 && num_pages <= (IRQ_LOCAL_GUEST_MAX + 1));
> > +    }
> > +    assert(IMSIC_MIN_ID <= num_ids);
> > +    assert(num_ids <= IMSIC_MAX_ID);
> > +    assert((num_ids & IMSIC_MIN_ID) == IMSIC_MIN_ID);
> > +
> > +    qdev_prop_set_bit(dev, "mmode", mmode);
> > +    qdev_prop_set_uint32(dev, "hartid", hartid);
> > +    qdev_prop_set_uint32(dev, "num-pages", num_pages);
> > +    qdev_prop_set_uint32(dev, "num-irqs", num_ids + 1);
> > +
> > +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> > +    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
> > +
> > +    for (i = 0; i < num_pages; i++) {
> > +        if (!i) {
> > +            qdev_connect_gpio_out_named(dev, NULL, i,
> > +                                        qdev_get_gpio_in(DEVICE(cpu),
> > +                                            (mmode) ? IRQ_M_EXT : IRQ_S_EXT));
> > +        } else {
> > +            qdev_connect_gpio_out_named(dev, NULL, i,
> > +                                        qdev_get_gpio_in(DEVICE(cpu),
> > +                                            IRQ_LOCAL_MAX + i - 1));
> > +        }
> > +    }
> > +
> > +    return dev;
> > +}
> > diff --git a/include/hw/intc/riscv_imsic.h b/include/hw/intc/riscv_imsic.h
> > new file mode 100644
> > index 0000000000..58c2aaa8dc
> > --- /dev/null
> > +++ b/include/hw/intc/riscv_imsic.h
> > @@ -0,0 +1,68 @@
> > +/*
> > + * RISC-V IMSIC (Incoming Message Signal Interrupt Controller) interface
> > + *
> > + * Copyright (c) 2021 Western Digital Corporation or its affiliates.
> > + *
> > + * This program is free software; you can redistribute it and/or modify it
> > + * under the terms and conditions of the GNU General Public License,
> > + * version 2 or later, as published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope it will be useful, but WITHOUT
> > + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> > + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> > + * more details.
> > + *
> > + * You should have received a copy of the GNU General Public License along with
> > + * this program.  If not, see <http://www.gnu.org/licenses/>.
> > + */
> > +
> > +#ifndef HW_RISCV_IMSIC_H
> > +#define HW_RISCV_IMSIC_H
> > +
> > +#include "hw/sysbus.h"
> > +#include "qom/object.h"
> > +
> > +#define TYPE_RISCV_IMSIC "riscv.imsic"
> > +
> > +typedef struct RISCVIMSICState RISCVIMSICState;
> > +DECLARE_INSTANCE_CHECKER(RISCVIMSICState, RISCV_IMSIC, TYPE_RISCV_IMSIC)
> > +
> > +#define IMSIC_MMIO_PAGE_SHIFT          12
> > +#define IMSIC_MMIO_PAGE_SZ             (1UL << IMSIC_MMIO_PAGE_SHIFT)
> > +#define IMSIC_MMIO_SIZE(__num_pages)   ((__num_pages) * IMSIC_MMIO_PAGE_SZ)
> > +
> > +#define IMSIC_MMIO_HART_GUEST_MAX_BTIS 6
> > +#define IMSIC_MMIO_GROUP_MIN_SHIFT     24
> > +
> > +#define IMSIC_HART_NUM_GUESTS(__guest_bits)           \
> > +    (1U << (__guest_bits))
> > +#define IMSIC_HART_SIZE(__guest_bits)                 \
> > +    (IMSIC_HART_NUM_GUESTS(__guest_bits) * IMSIC_MMIO_PAGE_SZ)
> > +#define IMSIC_GROUP_NUM_HARTS(__hart_bits)            \
> > +    (1U << (__hart_bits))
> > +#define IMSIC_GROUP_SIZE(__hart_bits, __guest_bits)   \
> > +    (IMSIC_GROUP_NUM_HARTS(__hart_bits) * IMSIC_HART_SIZE(__guest_bits))
> > +
> > +struct RISCVIMSICState {
> > +    /*< private >*/
> > +    SysBusDevice parent_obj;
> > +    qemu_irq *external_irqs;
> > +
> > +    /*< public >*/
> > +    MemoryRegion mmio;
> > +    uint32_t num_eistate;
> > +    uint32_t *eidelivery;
> > +    uint32_t *eithreshold;
> > +    uint32_t *eistate;
> > +
> > +    /* config */
> > +    bool mmode;
> > +    uint32_t hartid;
> > +    uint32_t num_pages;
> > +    uint32_t num_irqs;
> > +};
> > +
> > +DeviceState *riscv_imsic_create(hwaddr addr, uint32_t hartid, bool mmode,
> > +                                uint32_t num_pages, uint32_t num_ids);
> > +
> > +#endif
> > --
> > 2.25.1
> >
> >

