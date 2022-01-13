Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n7uVa-000695-0Y
	for mharc-qemu-riscv@gnu.org; Thu, 13 Jan 2022 02:26:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n7uVW-00064T-V7
 for qemu-riscv@nongnu.org; Thu, 13 Jan 2022 02:26:51 -0500
Received: from [2607:f8b0:4864:20::1036] (port=43951
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n7uVS-0005Th-G2
 for qemu-riscv@nongnu.org; Thu, 13 Jan 2022 02:26:50 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 ie23-20020a17090b401700b001b38a5318easo9833364pjb.2
 for <qemu-riscv@nongnu.org>; Wed, 12 Jan 2022 23:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3VwMFXfpwZl0srzqhx9SC1OoQDSJWZcv+Uq4GX8eRkk=;
 b=hvrRqTAJ17/cV4KugDCDERdbHsi8gyy49Xz+g89v94/x58O/ItHj9wZ9uG5atDFSjX
 aQIPAq2fzUdSQStaeittWVylRseLgfPg9ki3lxLz+jxM+sQ9SPSnGmKDCHZPJVa0MmIA
 l3nAzAPsF9PEAWYzlCXALEl/Fr34xiK+AatUjb2IO8vHDVxBsbC2L9OKEraclv0q7lFL
 C07QRRxbtUdw1BX5+wjCikT2B38+pPbVbBUl0PAurr8Q7NtVxELhk+uRDUmL7gh090R/
 tyUOinEViJoU8fP9V0T/7xTSj9L7vtDvf8AeuxUGq5J82CYdNRU7hWMuZqym/HtSrOxP
 uylQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3VwMFXfpwZl0srzqhx9SC1OoQDSJWZcv+Uq4GX8eRkk=;
 b=LgY4Xc7crLpGS+9ZirsBWYjOVdB4g8WFiTG1CJpb8FqFb+DEWNlSoNcQMe0+3OAICj
 hNK6/7hBZcnnC81iINoBgR0iwBkXlQIXxLT6L2RxyfG9FRdxRa6oGuDJvNE3ggV39Vql
 kTYVgUKxSgqHvDyUacM+nnglRXaVtAVleiq6pk41l04yqbsLz8Zrt3s9e03JFHyN2e1H
 GxUVPzvgaxdhwlpas189MXR9btGzYhyLWpRxVEa5vZF/SeR6Uv++NKLkubmpwtmi7zSv
 BsH3D6KrQT19Jn0fENhIcOwSdhypBzhO5o8StpyUE0DaABpDmyaHEnMAZ90Yy85+GSMt
 sSgw==
X-Gm-Message-State: AOAM531UzVaOFQOckGilQ7GM32guYtImTZXvBz946YuRtCqugtUYFz+6
 FOmIFkZuzTTtUVYb368gVT1dFWvz0+s2Z5UG
X-Google-Smtp-Source: ABdhPJy2tyXd0aUqr99frdnpI+7A/okFkftzO603ypM4oWVBOWoxT1X0wr9u5T5+8lJCOrpmMJtghA==
X-Received: by 2002:a17:902:6b03:b0:149:7cf7:a17f with SMTP id
 o3-20020a1709026b0300b001497cf7a17fmr3331815plk.173.1642058803290; 
 Wed, 12 Jan 2022 23:26:43 -0800 (PST)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com.
 [209.85.216.44])
 by smtp.gmail.com with ESMTPSA id c24sm1394021pgj.57.2022.01.12.23.26.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 23:26:42 -0800 (PST)
Received: by mail-pj1-f44.google.com with SMTP id
 y16-20020a17090a6c9000b001b13ffaa625so17585520pjj.2; 
 Wed, 12 Jan 2022 23:26:42 -0800 (PST)
X-Received: by 2002:a63:741a:: with SMTP id p26mr2863347pgc.181.1642058801915; 
 Wed, 12 Jan 2022 23:26:41 -0800 (PST)
MIME-Version: 1.0
References: <20211230123539.52786-1-anup@brainfault.org>
 <20211230123539.52786-21-anup@brainfault.org>
In-Reply-To: <20211230123539.52786-21-anup@brainfault.org>
From: Frank Chang <frank.chang@sifive.com>
Date: Thu, 13 Jan 2022 15:26:30 +0800
X-Gmail-Original-Message-ID: <CANzO1D3oYigRdBtYLVqsgAAhgU_JzKEB27SHx-7jg7b_qd8R1w@mail.gmail.com>
Message-ID: <CANzO1D3oYigRdBtYLVqsgAAhgU_JzKEB27SHx-7jg7b_qd8R1w@mail.gmail.com>
Subject: Re: [PATCH v6 20/23] hw/intc: Add RISC-V AIA IMSIC device emulation
To: Anup Patel <anup@brainfault.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bin Meng <bmeng.cn@gmail.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atishp@atishpatra.org>
Content-Type: multipart/alternative; boundary="00000000000096ab7705d5719b5b"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 13 Jan 2022 07:26:51 -0000

--00000000000096ab7705d5719b5b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Anup Patel <anup@brainfault.org> =E6=96=BC 2021=E5=B9=B412=E6=9C=8830=E6=97=
=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=889:00=E5=AF=AB=E9=81=93=EF=BC=9A

> From: Anup Patel <anup.patel@wdc.com>
>
> The RISC-V AIA (Advanced Interrupt Architecture) defines a new
> interrupt controller for MSIs (message signal interrupts) called
> IMSIC (Incoming Message Signal Interrupt Controller). The IMSIC
> is per-HART device and also suppport virtualizaiton of MSIs using
> dedicated VS-level guest interrupt files.
>
> This patch adds device emulation for RISC-V AIA IMSIC which
> supports M-level, S-level, and VS-level MSIs.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Signed-off-by: Anup Patel <anup@brainfault.org>
> ---
>  hw/intc/Kconfig               |   3 +
>  hw/intc/meson.build           |   1 +
>  hw/intc/riscv_imsic.c         | 447 ++++++++++++++++++++++++++++++++++
>  include/hw/intc/riscv_imsic.h |  68 ++++++
>  4 files changed, 519 insertions(+)
>  create mode 100644 hw/intc/riscv_imsic.c
>  create mode 100644 include/hw/intc/riscv_imsic.h
>
> diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
> index 528e77b4a6..ec8d4cec29 100644
> --- a/hw/intc/Kconfig
> +++ b/hw/intc/Kconfig
> @@ -73,6 +73,9 @@ config RISCV_ACLINT
>  config RISCV_APLIC
>      bool
>
> +config RISCV_IMSIC
> +    bool
> +
>  config SIFIVE_PLIC
>      bool
>
> diff --git a/hw/intc/meson.build b/hw/intc/meson.build
> index 7466024402..5caa337654 100644
> --- a/hw/intc/meson.build
> +++ b/hw/intc/meson.build
> @@ -51,6 +51,7 @@ specific_ss.add(when: 'CONFIG_S390_FLIC_KVM', if_true:
> files('s390_flic_kvm.c'))
>  specific_ss.add(when: 'CONFIG_SH_INTC', if_true: files('sh_intc.c'))
>  specific_ss.add(when: 'CONFIG_RISCV_ACLINT', if_true:
> files('riscv_aclint.c'))
>  specific_ss.add(when: 'CONFIG_RISCV_APLIC', if_true:
> files('riscv_aplic.c'))
> +specific_ss.add(when: 'CONFIG_RISCV_IMSIC', if_true:
> files('riscv_imsic.c'))
>  specific_ss.add(when: 'CONFIG_SIFIVE_PLIC', if_true:
> files('sifive_plic.c'))
>  specific_ss.add(when: 'CONFIG_XICS', if_true: files('xics.c'))
>  specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_XICS'],
> diff --git a/hw/intc/riscv_imsic.c b/hw/intc/riscv_imsic.c
> new file mode 100644
> index 0000000000..753fa11a9c
> --- /dev/null
> +++ b/hw/intc/riscv_imsic.c
> @@ -0,0 +1,447 @@
> +/*
> + * RISC-V IMSIC (Incoming Message Signaled Interrupt Controller)
> + *
> + * Copyright (c) 2021 Western Digital Corporation or its affiliates.
> + *
> + * This program is free software; you can redistribute it and/or modify =
it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOU=
T
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
> for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License
> along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "qemu/log.h"
> +#include "qemu/module.h"
> +#include "qemu/error-report.h"
> +#include "qemu/bswap.h"
> +#include "exec/address-spaces.h"
> +#include "hw/sysbus.h"
> +#include "hw/pci/msi.h"
> +#include "hw/boards.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/intc/riscv_imsic.h"
> +#include "hw/irq.h"
> +#include "target/riscv/cpu.h"
> +#include "target/riscv/cpu_bits.h"
> +#include "sysemu/sysemu.h"
> +#include "migration/vmstate.h"
> +
> +#define IMSIC_MMIO_PAGE_LE             0x00
> +#define IMSIC_MMIO_PAGE_BE             0x04
> +
> +#define IMSIC_MIN_ID                   ((IMSIC_EIPx_BITS * 2) - 1)
> +#define IMSIC_MAX_ID                   (IMSIC_TOPEI_IID_MASK)
> +
> +#define IMSIC_EISTATE_PENDING          (1U << 0)
> +#define IMSIC_EISTATE_ENABLED          (1U << 1)
> +#define IMSIC_EISTATE_ENPEND           (IMSIC_EISTATE_ENABLED | \
> +                                        IMSIC_EISTATE_PENDING)
> +
> +static uint32_t riscv_imsic_topei(RISCVIMSICState *imsic, uint32_t page)
> +{
> +    uint32_t i, max_irq, base;
> +
> +    base =3D page * imsic->num_irqs;
> +    max_irq =3D (imsic->num_irqs < imsic->eithreshold[page]) ?
> +              imsic->num_irqs : imsic->eithreshold[page];
>

Do we need to exclude the case which imsic->eithreshold[page] =3D=3D 0?
  The value of a *topei CSR (mtopei, stopei, or vstopei) indicates the
interrupt file=E2=80=99s current
  highest-priority pending-and-enabled interrupt that also exceeds the
priority threshold specified by
  its eithreshold register if eithreshold is not zero.


> +    for (i =3D 1; i < max_irq; i++) {
> +        if ((imsic->eistate[base + i] & IMSIC_EISTATE_ENPEND) =3D=3D
> +                IMSIC_EISTATE_ENPEND) {
> +            return (i << IMSIC_TOPEI_IID_SHIFT) | i;
> +        }
> +    }
> +
> +    return 0;
> +}
> +
> +static void riscv_imsic_update(RISCVIMSICState *imsic, uint32_t page)
> +{
> +    if (imsic->eidelivery[page] && riscv_imsic_topei(imsic, page)) {
> +        qemu_irq_raise(imsic->external_irqs[page]);
> +    } else {
> +        qemu_irq_lower(imsic->external_irqs[page]);
> +    }
> +}
> +
> +static int riscv_imsic_eidelivery_rmw(RISCVIMSICState *imsic, uint32_t
> page,
> +                                      target_ulong *val,
> +                                      target_ulong new_val,
> +                                      target_ulong wr_mask)
> +{
> +    target_ulong old_val =3D imsic->eidelivery[page];
> +
> +    if (val) {
> +        *val =3D old_val;
> +    }
> +
> +    wr_mask &=3D 0x1;
> +    imsic->eidelivery[page] =3D (old_val & ~wr_mask) | (new_val & wr_mas=
k);
> +
> +    riscv_imsic_update(imsic, page);
> +    return 0;
> +}
> +
> +static int riscv_imsic_eithreshold_rmw(RISCVIMSICState *imsic, uint32_t
> page,
> +                                      target_ulong *val,
> +                                      target_ulong new_val,
> +                                      target_ulong wr_mask)
> +{
> +    target_ulong old_val =3D imsic->eithreshold[page];
> +
> +    if (val) {
> +        *val =3D old_val;
> +    }
> +
> +    wr_mask &=3D IMSIC_MAX_ID;
> +    imsic->eithreshold[page] =3D (old_val & ~wr_mask) | (new_val & wr_ma=
sk);
> +
> +    riscv_imsic_update(imsic, page);
> +    return 0;
> +}
> +
> +static int riscv_imsic_topei_rmw(RISCVIMSICState *imsic, uint32_t page,
> +                                 target_ulong *val, target_ulong new_val=
,
> +                                 target_ulong wr_mask)
> +{
> +    uint32_t base, topei =3D riscv_imsic_topei(imsic, page);
> +
> +    /* Read pending and enabled interrupt with highest priority */
> +    if (val) {
> +        *val =3D topei;
> +    }
> +
> +    /* Writes ignore value and clear top pending interrupt */
> +    if (topei && wr_mask) {
> +        topei >>=3D IMSIC_TOPEI_IID_SHIFT;
> +        base =3D page * imsic->num_irqs;
> +        if (topei) {
> +            imsic->eistate[base + topei] &=3D ~IMSIC_EISTATE_PENDING;
> +        }
> +
> +        riscv_imsic_update(imsic, page);
> +    }
> +
> +    return 0;
> +}
> +
> +static int riscv_imsic_eix_rmw(RISCVIMSICState *imsic,
> +                               uint32_t xlen, uint32_t page,
> +                               uint32_t num, bool pend, target_ulong *va=
l,
> +                               target_ulong new_val, target_ulong wr_mas=
k)
> +{
> +    uint32_t i, base;
> +    target_ulong mask;
> +    uint32_t state =3D (pend) ? IMSIC_EISTATE_PENDING :
> IMSIC_EISTATE_ENABLED;
> +
> +    if (xlen !=3D 32) {
> +        if (num & 0x1) {
> +            return -EINVAL;
> +        }
> +        num >>=3D 1;
> +    }
> +    if (num >=3D (imsic->num_irqs / xlen)) {
> +        return -EINVAL;
> +    }
> +
> +    base =3D (page * imsic->num_irqs) + (num * xlen);
> +
> +    if (val) {
> +        *val =3D 0;
> +        for (i =3D 0; i < xlen; i++) {
> +            mask =3D (target_ulong)1 << i;
> +            *val |=3D (imsic->eistate[base + i] & state) ? mask : 0;
> +        }
> +    }
> +
> +    for (i =3D 0; i < xlen; i++) {
> +        /* Bit0 of eip0 and eie0 are read-only zero */
> +        if (!num && !i) {
> +            continue;
> +        }
> +
> +        mask =3D (target_ulong)1 << i;
> +        if (wr_mask & mask) {
> +            if (new_val & mask) {
> +                imsic->eistate[base + i] |=3D state;
> +            } else {
> +                imsic->eistate[base + i] &=3D ~state;
> +            }
> +        }
> +    }
> +
> +    riscv_imsic_update(imsic, page);
> +    return 0;
> +}
> +
> +static int riscv_imsic_rmw(void *arg, target_ulong reg, target_ulong *va=
l,
> +                           target_ulong new_val, target_ulong wr_mask)
> +{
> +    RISCVIMSICState *imsic =3D arg;
> +    uint32_t isel, priv, virt, vgein, xlen, page;
> +
> +    priv =3D AIA_IREG_PRIV(reg);
> +    virt =3D AIA_IREG_VIRT(reg);
> +    isel =3D AIA_IREG_ISEL(reg);
> +    vgein =3D AIA_IREG_VGEIN(reg);
> +    xlen =3D AIA_IREG_XLEN(reg);
> +
> +    if (imsic->mmode) {
> +        if (priv =3D=3D PRV_M && !virt) {
> +            page =3D 0;
> +        } else {
> +            goto err;
> +        }
> +    } else {
> +        if (priv =3D=3D PRV_S) {
> +            if (virt) {
> +                if (vgein && vgein < imsic->num_pages) {
> +                    page =3D vgein;
> +                } else {
> +                    goto err;
> +                }
> +            } else {
> +                page =3D 0;
> +            }
> +        } else {
> +            goto err;
> +        }
> +    }
> +
> +    switch (isel) {
> +    case ISELECT_IMSIC_EIDELIVERY:
> +        return riscv_imsic_eidelivery_rmw(imsic, page, val,
> +                                          new_val, wr_mask);
> +    case ISELECT_IMSIC_EITHRESHOLD:
> +        return riscv_imsic_eithreshold_rmw(imsic, page, val,
> +                                           new_val, wr_mask);
> +    case ISELECT_IMSIC_TOPEI:
> +        return riscv_imsic_topei_rmw(imsic, page, val, new_val, wr_mask)=
;
> +    case ISELECT_IMSIC_EIP0 ... ISELECT_IMSIC_EIP63:
> +        return riscv_imsic_eix_rmw(imsic, xlen, page,
> +                                   isel - ISELECT_IMSIC_EIP0,
> +                                   true, val, new_val, wr_mask);
> +    case ISELECT_IMSIC_EIE0 ... ISELECT_IMSIC_EIE63:
> +        return riscv_imsic_eix_rmw(imsic, xlen, page,
> +                                   isel - ISELECT_IMSIC_EIE0,
> +                                   false, val, new_val, wr_mask);
> +    default:
> +        break;
> +    };
> +
> +err:
> +    qemu_log_mask(LOG_GUEST_ERROR,
> +                  "%s: Invalid register priv=3D%d virt=3D%d isel=3D%d
> vgein=3D%d\n",
> +                  __func__, priv, virt, isel, vgein);
> +    return -EINVAL;
> +}
> +
> +static uint64_t riscv_imsic_read(void *opaque, hwaddr addr, unsigned siz=
e)
> +{
> +    RISCVIMSICState *imsic =3D opaque;
> +
> +    /* Reads must be 4 byte words */
> +    if ((addr & 0x3) !=3D 0) {
> +        goto err;
> +    }
> +
> +    /* Reads cannot be out of range */
> +    if (addr > IMSIC_MMIO_SIZE(imsic->num_pages)) {
> +        goto err;
> +    }
> +
> +    return 0;
> +
> +err:
> +    qemu_log_mask(LOG_GUEST_ERROR,
> +                  "%s: Invalid register read 0x%" HWADDR_PRIx "\n",
> +                  __func__, addr);
> +    return 0;
> +}
> +
> +static void riscv_imsic_write(void *opaque, hwaddr addr, uint64_t value,
> +        unsigned size)
> +{
> +    RISCVIMSICState *imsic =3D opaque;
> +    uint32_t page;
> +
> +    /* Writes must be 4 byte words */
> +    if ((addr & 0x3) !=3D 0) {
> +        goto err;
> +    }
> +
> +    /* Writes cannot be out of range */
> +    if (addr > IMSIC_MMIO_SIZE(imsic->num_pages)) {
> +        goto err;
> +    }
> +
> +    /* Writes only supported for MSI little-endian registers */
> +    page =3D addr >> IMSIC_MMIO_PAGE_SHIFT;
> +    if ((addr & (IMSIC_MMIO_PAGE_SZ - 1)) =3D=3D IMSIC_MMIO_PAGE_LE) {
> +        if (value && (value < imsic->num_irqs)) {
> +            imsic->eistate[(page * imsic->num_irqs) + value] |=3D
> +                                                    IMSIC_EISTATE_PENDIN=
G;
> +        }
> +    }
> +
> +    /* Update CPU external interrupt status */
> +    riscv_imsic_update(imsic, page);
> +
> +    return;
> +
> +err:
> +    qemu_log_mask(LOG_GUEST_ERROR,
> +                  "%s: Invalid register write 0x%" HWADDR_PRIx "\n",
> +                  __func__, addr);
> +}
> +
> +static const MemoryRegionOps riscv_imsic_ops =3D {
> +    .read =3D riscv_imsic_read,
> +    .write =3D riscv_imsic_write,
> +    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .valid =3D {
> +        .min_access_size =3D 4,
> +        .max_access_size =3D 4
> +    }
> +};
> +
> +static void riscv_imsic_realize(DeviceState *dev, Error **errp)
> +{
> +    RISCVIMSICState *imsic =3D RISCV_IMSIC(dev);
> +    RISCVCPU *rcpu =3D RISCV_CPU(qemu_get_cpu(imsic->hartid));
> +    CPUState *cpu =3D qemu_get_cpu(imsic->hartid);
> +    CPURISCVState *env =3D cpu ? cpu->env_ptr : NULL;
> +
> +    imsic->num_eistate =3D imsic->num_pages * imsic->num_irqs;
> +    imsic->eidelivery =3D g_new0(uint32_t, imsic->num_pages);
> +    imsic->eithreshold =3D g_new0(uint32_t, imsic->num_pages);
> +    imsic->eistate =3D g_new0(uint32_t, imsic->num_eistate);
> +
> +    memory_region_init_io(&imsic->mmio, OBJECT(dev), &riscv_imsic_ops,
> +                          imsic, TYPE_RISCV_IMSIC,
> +                          IMSIC_MMIO_SIZE(imsic->num_pages));
> +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &imsic->mmio);
> +
> +    /* Claim the CPU interrupt to be triggered by this IMSIC */
> +    if (riscv_cpu_claim_interrupts(rcpu,
> +            (imsic->mmode) ? MIP_MEIP : MIP_SEIP) < 0) {
> +        error_report("%s already claimed",
> +                     (imsic->mmode) ? "MEIP" : "SEIP");
> +        exit(1);
> +    }
> +
> +    /* Create output IRQ lines */
> +    imsic->external_irqs =3D g_malloc(sizeof(qemu_irq) * imsic->num_page=
s);
> +    qdev_init_gpio_out(dev, imsic->external_irqs, imsic->num_pages);
> +
> +    /* Force select AIA feature and setup CSR read-modify-write callback
> */
> +    if (env) {
> +        riscv_set_feature(env, RISCV_FEATURE_AIA);
> +        if (!imsic->mmode) {
> +            riscv_cpu_set_geilen(env, imsic->num_pages - 1);
> +        }
> +        riscv_cpu_set_aia_ireg_rmw_fn(env, (imsic->mmode) ? PRV_M : PRV_=
S,
> +                                      riscv_imsic_rmw, imsic);
> +    }
> +
> +    msi_nonbroken =3D true;
> +}
> +
> +static Property riscv_imsic_properties[] =3D {
> +    DEFINE_PROP_BOOL("mmode", RISCVIMSICState, mmode, 0),
> +    DEFINE_PROP_UINT32("hartid", RISCVIMSICState, hartid, 0),
> +    DEFINE_PROP_UINT32("num-pages", RISCVIMSICState, num_pages, 0),
> +    DEFINE_PROP_UINT32("num-irqs", RISCVIMSICState, num_irqs, 0),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static const VMStateDescription vmstate_riscv_imsic =3D {
> +    .name =3D "riscv_imsic",
> +    .version_id =3D 1,
> +    .minimum_version_id =3D 1,
> +    .fields =3D (VMStateField[]) {
> +            VMSTATE_VARRAY_UINT32(eidelivery, RISCVIMSICState,
> +                                  num_pages, 0,
> +                                  vmstate_info_uint32, uint32_t),
> +            VMSTATE_VARRAY_UINT32(eithreshold, RISCVIMSICState,
> +                                  num_pages, 0,
> +                                  vmstate_info_uint32, uint32_t),
> +            VMSTATE_VARRAY_UINT32(eistate, RISCVIMSICState,
> +                                  num_eistate, 0,
> +                                  vmstate_info_uint32, uint32_t),
> +            VMSTATE_END_OF_LIST()
> +        }
> +};
> +
> +static void riscv_imsic_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> +
> +    device_class_set_props(dc, riscv_imsic_properties);
> +    dc->realize =3D riscv_imsic_realize;
> +    dc->vmsd =3D &vmstate_riscv_imsic;
> +}
> +
> +static const TypeInfo riscv_imsic_info =3D {
> +    .name          =3D TYPE_RISCV_IMSIC,
> +    .parent        =3D TYPE_SYS_BUS_DEVICE,
> +    .instance_size =3D sizeof(RISCVIMSICState),
> +    .class_init    =3D riscv_imsic_class_init,
> +};
> +
> +static void riscv_imsic_register_types(void)
> +{
> +    type_register_static(&riscv_imsic_info);
> +}
> +
> +type_init(riscv_imsic_register_types)
> +
> +/*
> + * Create IMSIC device.
> + */
> +DeviceState *riscv_imsic_create(hwaddr addr, uint32_t hartid, bool mmode=
,
> +                                uint32_t num_pages, uint32_t num_ids)
> +{
> +    DeviceState *dev =3D qdev_new(TYPE_RISCV_IMSIC);
> +    CPUState *cpu =3D qemu_get_cpu(hartid);
> +    uint32_t i;
> +
> +    assert(!(addr & (IMSIC_MMIO_PAGE_SZ - 1)));
> +    if (mmode) {
> +        assert(num_pages =3D=3D 1);
> +    } else {
> +        assert(num_pages >=3D 1 && num_pages <=3D (IRQ_LOCAL_GUEST_MAX +=
 1));
> +    }
> +    assert(IMSIC_MIN_ID <=3D num_ids);
> +    assert(num_ids <=3D IMSIC_MAX_ID);
> +    assert((num_ids & IMSIC_MIN_ID) =3D=3D IMSIC_MIN_ID);
> +
> +    qdev_prop_set_bit(dev, "mmode", mmode);
> +    qdev_prop_set_uint32(dev, "hartid", hartid);
> +    qdev_prop_set_uint32(dev, "num-pages", num_pages);
> +    qdev_prop_set_uint32(dev, "num-irqs", num_ids + 1);
> +
> +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
> +
> +    for (i =3D 0; i < num_pages; i++) {
> +        if (!i) {
> +            qdev_connect_gpio_out_named(dev, NULL, i,
> +                                        qdev_get_gpio_in(DEVICE(cpu),
> +                                            (mmode) ? IRQ_M_EXT :
> IRQ_S_EXT));
> +        } else {
> +            qdev_connect_gpio_out_named(dev, NULL, i,
> +                                        qdev_get_gpio_in(DEVICE(cpu),
> +                                            IRQ_LOCAL_MAX + i - 1));
> +        }
> +    }
> +
> +    return dev;
> +}
> diff --git a/include/hw/intc/riscv_imsic.h b/include/hw/intc/riscv_imsic.=
h
> new file mode 100644
> index 0000000000..58c2aaa8dc
> --- /dev/null
> +++ b/include/hw/intc/riscv_imsic.h
> @@ -0,0 +1,68 @@
> +/*
> + * RISC-V IMSIC (Incoming Message Signal Interrupt Controller) interface
> + *
> + * Copyright (c) 2021 Western Digital Corporation or its affiliates.
> + *
> + * This program is free software; you can redistribute it and/or modify =
it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOU=
T
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
> for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License
> along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef HW_RISCV_IMSIC_H
> +#define HW_RISCV_IMSIC_H
> +
> +#include "hw/sysbus.h"
> +#include "qom/object.h"
> +
> +#define TYPE_RISCV_IMSIC "riscv.imsic"
> +
> +typedef struct RISCVIMSICState RISCVIMSICState;
> +DECLARE_INSTANCE_CHECKER(RISCVIMSICState, RISCV_IMSIC, TYPE_RISCV_IMSIC)
> +
> +#define IMSIC_MMIO_PAGE_SHIFT          12
> +#define IMSIC_MMIO_PAGE_SZ             (1UL << IMSIC_MMIO_PAGE_SHIFT)
> +#define IMSIC_MMIO_SIZE(__num_pages)   ((__num_pages) *
> IMSIC_MMIO_PAGE_SZ)
> +
> +#define IMSIC_MMIO_HART_GUEST_MAX_BTIS 6
> +#define IMSIC_MMIO_GROUP_MIN_SHIFT     24
> +
> +#define IMSIC_HART_NUM_GUESTS(__guest_bits)           \
> +    (1U << (__guest_bits))
> +#define IMSIC_HART_SIZE(__guest_bits)                 \
> +    (IMSIC_HART_NUM_GUESTS(__guest_bits) * IMSIC_MMIO_PAGE_SZ)
> +#define IMSIC_GROUP_NUM_HARTS(__hart_bits)            \
> +    (1U << (__hart_bits))
> +#define IMSIC_GROUP_SIZE(__hart_bits, __guest_bits)   \
> +    (IMSIC_GROUP_NUM_HARTS(__hart_bits) * IMSIC_HART_SIZE(__guest_bits))
> +
> +struct RISCVIMSICState {
> +    /*< private >*/
> +    SysBusDevice parent_obj;
> +    qemu_irq *external_irqs;
> +
> +    /*< public >*/
> +    MemoryRegion mmio;
> +    uint32_t num_eistate;
> +    uint32_t *eidelivery;
> +    uint32_t *eithreshold;
> +    uint32_t *eistate;
> +
> +    /* config */
> +    bool mmode;
> +    uint32_t hartid;
> +    uint32_t num_pages;
> +    uint32_t num_irqs;
> +};
> +
> +DeviceState *riscv_imsic_create(hwaddr addr, uint32_t hartid, bool mmode=
,
> +                                uint32_t num_pages, uint32_t num_ids);
> +
> +#endif
> --
> 2.25.1
>
>
>

--00000000000096ab7705d5719b5b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Anup Patel &lt;<a href=3D"mailto:anup@bra=
infault.org" target=3D"_blank">anup@brainfault.org</a>&gt; =E6=96=BC 2021=
=E5=B9=B412=E6=9C=8830=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=889:00=
=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><div class=3D"gmail_quote"><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">From: Anup Patel &lt;<a href=3D"mail=
to:anup.patel@wdc.com" target=3D"_blank">anup.patel@wdc.com</a>&gt;<br>
<br>
The RISC-V AIA (Advanced Interrupt Architecture) defines a new<br>
interrupt controller for MSIs (message signal interrupts) called<br>
IMSIC (Incoming Message Signal Interrupt Controller). The IMSIC<br>
is per-HART device and also suppport virtualizaiton of MSIs using<br>
dedicated VS-level guest interrupt files.<br>
<br>
This patch adds device emulation for RISC-V AIA IMSIC which<br>
supports M-level, S-level, and VS-level MSIs.<br>
<br>
Signed-off-by: Anup Patel &lt;<a href=3D"mailto:anup.patel@wdc.com" target=
=3D"_blank">anup.patel@wdc.com</a>&gt;<br>
Signed-off-by: Anup Patel &lt;<a href=3D"mailto:anup@brainfault.org" target=
=3D"_blank">anup@brainfault.org</a>&gt;<br>
---<br>
=C2=A0hw/intc/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A03 +<br>
=C2=A0hw/intc/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A01 +<br>
=C2=A0hw/intc/riscv_imsic.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 447 ++++++++=
++++++++++++++++++++++++++<br>
=C2=A0include/hw/intc/riscv_imsic.h |=C2=A0 68 ++++++<br>
=C2=A04 files changed, 519 insertions(+)<br>
=C2=A0create mode 100644 hw/intc/riscv_imsic.c<br>
=C2=A0create mode 100644 include/hw/intc/riscv_imsic.h<br>
<br>
diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig<br>
index 528e77b4a6..ec8d4cec29 100644<br>
--- a/hw/intc/Kconfig<br>
+++ b/hw/intc/Kconfig<br>
@@ -73,6 +73,9 @@ config RISCV_ACLINT<br>
=C2=A0config RISCV_APLIC<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
<br>
+config RISCV_IMSIC<br>
+=C2=A0 =C2=A0 bool<br>
+<br>
=C2=A0config SIFIVE_PLIC<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
<br>
diff --git a/hw/intc/meson.build b/hw/intc/meson.build<br>
index 7466024402..5caa337654 100644<br>
--- a/hw/intc/meson.build<br>
+++ b/hw/intc/meson.build<br>
@@ -51,6 +51,7 @@ specific_ss.add(when: &#39;CONFIG_S390_FLIC_KVM&#39;, if_=
true: files(&#39;s390_flic_kvm.c&#39;))<br>
=C2=A0specific_ss.add(when: &#39;CONFIG_SH_INTC&#39;, if_true: files(&#39;s=
h_intc.c&#39;))<br>
=C2=A0specific_ss.add(when: &#39;CONFIG_RISCV_ACLINT&#39;, if_true: files(&=
#39;riscv_aclint.c&#39;))<br>
=C2=A0specific_ss.add(when: &#39;CONFIG_RISCV_APLIC&#39;, if_true: files(&#=
39;riscv_aplic.c&#39;))<br>
+specific_ss.add(when: &#39;CONFIG_RISCV_IMSIC&#39;, if_true: files(&#39;ri=
scv_imsic.c&#39;))<br>
=C2=A0specific_ss.add(when: &#39;CONFIG_SIFIVE_PLIC&#39;, if_true: files(&#=
39;sifive_plic.c&#39;))<br>
=C2=A0specific_ss.add(when: &#39;CONFIG_XICS&#39;, if_true: files(&#39;xics=
.c&#39;))<br>
=C2=A0specific_ss.add(when: [&#39;CONFIG_KVM&#39;, &#39;CONFIG_XICS&#39;],<=
br>
diff --git a/hw/intc/riscv_imsic.c b/hw/intc/riscv_imsic.c<br>
new file mode 100644<br>
index 0000000000..753fa11a9c<br>
--- /dev/null<br>
+++ b/hw/intc/riscv_imsic.c<br>
@@ -0,0 +1,447 @@<br>
+/*<br>
+ * RISC-V IMSIC (Incoming Message Signaled Interrupt Controller)<br>
+ *<br>
+ * Copyright (c) 2021 Western Digital Corporation or its affiliates.<br>
+ *<br>
+ * This program is free software; you can redistribute it and/or modify it=
<br>
+ * under the terms and conditions of the GNU General Public License,<br>
+ * version 2 or later, as published by the Free Software Foundation.<br>
+ *<br>
+ * This program is distributed in the hope it will be useful, but WITHOUT<=
br>
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or<b=
r>
+ * FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the GNU General Public Lice=
nse for<br>
+ * more details.<br>
+ *<br>
+ * You should have received a copy of the GNU General Public License along=
 with<br>
+ * this program.=C2=A0 If not, see &lt;<a href=3D"http://www.gnu.org/licen=
ses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.org/licenses/</a>=
&gt;.<br>
+ */<br>
+<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;qapi/error.h&quot;<br>
+#include &quot;qemu/log.h&quot;<br>
+#include &quot;qemu/module.h&quot;<br>
+#include &quot;qemu/error-report.h&quot;<br>
+#include &quot;qemu/bswap.h&quot;<br>
+#include &quot;exec/address-spaces.h&quot;<br>
+#include &quot;hw/sysbus.h&quot;<br>
+#include &quot;hw/pci/msi.h&quot;<br>
+#include &quot;hw/boards.h&quot;<br>
+#include &quot;hw/qdev-properties.h&quot;<br>
+#include &quot;hw/intc/riscv_imsic.h&quot;<br>
+#include &quot;hw/irq.h&quot;<br>
+#include &quot;target/riscv/cpu.h&quot;<br>
+#include &quot;target/riscv/cpu_bits.h&quot;<br>
+#include &quot;sysemu/sysemu.h&quot;<br>
+#include &quot;migration/vmstate.h&quot;<br>
+<br>
+#define IMSIC_MMIO_PAGE_LE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
0x00<br>
+#define IMSIC_MMIO_PAGE_BE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
0x04<br>
+<br>
+#define IMSIC_MIN_ID=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0((IMSIC_EIPx_BITS * 2) - 1)<br>
+#define IMSIC_MAX_ID=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0(IMSIC_TOPEI_IID_MASK)<br>
+<br>
+#define IMSIC_EISTATE_PENDING=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1U &lt;&l=
t; 0)<br>
+#define IMSIC_EISTATE_ENABLED=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1U &lt;&l=
t; 1)<br>
+#define IMSIC_EISTATE_ENPEND=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(IMSI=
C_EISTATE_ENABLED | \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 IMSIC_EI=
STATE_PENDING)<br>
+<br>
+static uint32_t riscv_imsic_topei(RISCVIMSICState *imsic, uint32_t page)<b=
r>
+{<br>
+=C2=A0 =C2=A0 uint32_t i, max_irq, base;<br>
+<br>
+=C2=A0 =C2=A0 base =3D page * imsic-&gt;num_irqs;<br>
+=C2=A0 =C2=A0 max_irq =3D (imsic-&gt;num_irqs &lt; imsic-&gt;eithreshold[p=
age]) ?<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 imsic-&gt;num_irqs : imsi=
c-&gt;eithreshold[page];<br></blockquote><div><br></div><div>Do we need to =
exclude the case which imsic-&gt;eithreshold[page] =3D=3D 0?</div><div>=C2=
=A0 The value of a *topei CSR (mtopei, stopei, or vstopei) indicates the in=
terrupt file=E2=80=99s current</div>=C2=A0 highest-priority pending-and-ena=
bled interrupt that also exceeds the priority threshold specified by<br>=C2=
=A0 its eithreshold register if eithreshold is not zero.<div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 for (i =3D 1; i &lt; max_irq; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((imsic-&gt;eistate[base + i] &amp; IMSIC_E=
ISTATE_ENPEND) =3D=3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 IMSIC_EISTATE_ENPE=
ND) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return (i &lt;&lt; IMSIC_TOPEI_I=
ID_SHIFT) | i;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
+static void riscv_imsic_update(RISCVIMSICState *imsic, uint32_t page)<br>
+{<br>
+=C2=A0 =C2=A0 if (imsic-&gt;eidelivery[page] &amp;&amp; riscv_imsic_topei(=
imsic, page)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_irq_raise(imsic-&gt;external_irqs[page]);=
<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_irq_lower(imsic-&gt;external_irqs[page]);=
<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static int riscv_imsic_eidelivery_rmw(RISCVIMSICState *imsic, uint32_t pag=
e,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong *v=
al,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong ne=
w_val,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong wr=
_mask)<br>
+{<br>
+=C2=A0 =C2=A0 target_ulong old_val =3D imsic-&gt;eidelivery[page];<br>
+<br>
+=C2=A0 =C2=A0 if (val) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D old_val;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 wr_mask &amp;=3D 0x1;<br>
+=C2=A0 =C2=A0 imsic-&gt;eidelivery[page] =3D (old_val &amp; ~wr_mask) | (n=
ew_val &amp; wr_mask);<br>
+<br>
+=C2=A0 =C2=A0 riscv_imsic_update(imsic, page);<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
+static int riscv_imsic_eithreshold_rmw(RISCVIMSICState *imsic, uint32_t pa=
ge,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong *v=
al,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong ne=
w_val,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong wr=
_mask)<br>
+{<br>
+=C2=A0 =C2=A0 target_ulong old_val =3D imsic-&gt;eithreshold[page];<br>
+<br>
+=C2=A0 =C2=A0 if (val) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D old_val;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 wr_mask &amp;=3D IMSIC_MAX_ID;<br>
+=C2=A0 =C2=A0 imsic-&gt;eithreshold[page] =3D (old_val &amp; ~wr_mask) | (=
new_val &amp; wr_mask);<br>
+<br>
+=C2=A0 =C2=A0 riscv_imsic_update(imsic, page);<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
+static int riscv_imsic_topei_rmw(RISCVIMSICState *imsic, uint32_t page,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong *val, target_ulon=
g new_val,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong wr_mask)<br>
+{<br>
+=C2=A0 =C2=A0 uint32_t base, topei =3D riscv_imsic_topei(imsic, page);<br>
+<br>
+=C2=A0 =C2=A0 /* Read pending and enabled interrupt with highest priority =
*/<br>
+=C2=A0 =C2=A0 if (val) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D topei;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* Writes ignore value and clear top pending interrupt */<br=
>
+=C2=A0 =C2=A0 if (topei &amp;&amp; wr_mask) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 topei &gt;&gt;=3D IMSIC_TOPEI_IID_SHIFT;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 base =3D page * imsic-&gt;num_irqs;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (topei) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 imsic-&gt;eistate[base + topei] =
&amp;=3D ~IMSIC_EISTATE_PENDING;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_imsic_update(imsic, page);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
+static int riscv_imsic_eix_rmw(RISCVIMSICState *imsic,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t xlen, uint32_t page,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t num, bool pend, target_ulong=
 *val,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong new_val, target_ulong wr=
_mask)<br>
+{<br>
+=C2=A0 =C2=A0 uint32_t i, base;<br>
+=C2=A0 =C2=A0 target_ulong mask;<br>
+=C2=A0 =C2=A0 uint32_t state =3D (pend) ? IMSIC_EISTATE_PENDING : IMSIC_EI=
STATE_ENABLED;<br>
+<br>
+=C2=A0 =C2=A0 if (xlen !=3D 32) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (num &amp; 0x1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 num &gt;&gt;=3D 1;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 if (num &gt;=3D (imsic-&gt;num_irqs / xlen)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 base =3D (page * imsic-&gt;num_irqs) + (num * xlen);<br>
+<br>
+=C2=A0 =C2=A0 if (val) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; xlen; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mask =3D (target_ulong)1 &lt;&lt=
; i;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *val |=3D (imsic-&gt;eistate[bas=
e + i] &amp; state) ? mask : 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; xlen; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Bit0 of eip0 and eie0 are read-only zero */=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!num &amp;&amp; !i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mask =3D (target_ulong)1 &lt;&lt; i;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (wr_mask &amp; mask) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (new_val &amp; mask) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 imsic-&gt;eistate[=
base + i] |=3D state;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 imsic-&gt;eistate[=
base + i] &amp;=3D ~state;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 riscv_imsic_update(imsic, page);<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
+static int riscv_imsic_rmw(void *arg, target_ulong reg, target_ulong *val,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0target_ulong new_val, target_ulong wr_mask)<br>
+{<br>
+=C2=A0 =C2=A0 RISCVIMSICState *imsic =3D arg;<br>
+=C2=A0 =C2=A0 uint32_t isel, priv, virt, vgein, xlen, page;<br>
+<br>
+=C2=A0 =C2=A0 priv =3D AIA_IREG_PRIV(reg);<br>
+=C2=A0 =C2=A0 virt =3D AIA_IREG_VIRT(reg);<br>
+=C2=A0 =C2=A0 isel =3D AIA_IREG_ISEL(reg);<br>
+=C2=A0 =C2=A0 vgein =3D AIA_IREG_VGEIN(reg);<br>
+=C2=A0 =C2=A0 xlen =3D AIA_IREG_XLEN(reg);<br>
+<br>
+=C2=A0 =C2=A0 if (imsic-&gt;mmode) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (priv =3D=3D PRV_M &amp;&amp; !virt) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 page =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (priv =3D=3D PRV_S) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (virt) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (vgein &amp;&am=
p; vgein &lt; imsic-&gt;num_pages) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 page=
 =3D vgein;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto=
 err;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 page =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 switch (isel) {<br>
+=C2=A0 =C2=A0 case ISELECT_IMSIC_EIDELIVERY:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return riscv_imsic_eidelivery_rmw(imsic, page,=
 val,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 n=
ew_val, wr_mask);<br>
+=C2=A0 =C2=A0 case ISELECT_IMSIC_EITHRESHOLD:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return riscv_imsic_eithreshold_rmw(imsic, page=
, val,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0new_val, wr_mask);<br>
+=C2=A0 =C2=A0 case ISELECT_IMSIC_TOPEI:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return riscv_imsic_topei_rmw(imsic, page, val,=
 new_val, wr_mask);<br>
+=C2=A0 =C2=A0 case ISELECT_IMSIC_EIP0 ... ISELECT_IMSIC_EIP63:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return riscv_imsic_eix_rmw(imsic, xlen, page,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0isel - ISELECT_IMSIC_EI=
P0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0true, val, new_val, wr_=
mask);<br>
+=C2=A0 =C2=A0 case ISELECT_IMSIC_EIE0 ... ISELECT_IMSIC_EIE63:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return riscv_imsic_eix_rmw(imsic, xlen, page,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0isel - ISELECT_IMSIC_EI=
E0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0false, val, new_val, wr=
_mask);<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 };<br>
+<br>
+err:<br>
+=C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;%s: I=
nvalid register priv=3D%d virt=3D%d isel=3D%d vgein=3D%d\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __func__, p=
riv, virt, isel, vgein);<br>
+=C2=A0 =C2=A0 return -EINVAL;<br>
+}<br>
+<br>
+static uint64_t riscv_imsic_read(void *opaque, hwaddr addr, unsigned size)=
<br>
+{<br>
+=C2=A0 =C2=A0 RISCVIMSICState *imsic =3D opaque;<br>
+<br>
+=C2=A0 =C2=A0 /* Reads must be 4 byte words */<br>
+=C2=A0 =C2=A0 if ((addr &amp; 0x3) !=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* Reads cannot be out of range */<br>
+=C2=A0 =C2=A0 if (addr &gt; IMSIC_MMIO_SIZE(imsic-&gt;num_pages)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return 0;<br>
+<br>
+err:<br>
+=C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;%s: I=
nvalid register read 0x%&quot; HWADDR_PRIx &quot;\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __func__, a=
ddr);<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
+static void riscv_imsic_write(void *opaque, hwaddr addr, uint64_t value,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned size)<br>
+{<br>
+=C2=A0 =C2=A0 RISCVIMSICState *imsic =3D opaque;<br>
+=C2=A0 =C2=A0 uint32_t page;<br>
+<br>
+=C2=A0 =C2=A0 /* Writes must be 4 byte words */<br>
+=C2=A0 =C2=A0 if ((addr &amp; 0x3) !=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* Writes cannot be out of range */<br>
+=C2=A0 =C2=A0 if (addr &gt; IMSIC_MMIO_SIZE(imsic-&gt;num_pages)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* Writes only supported for MSI little-endian registers */<=
br>
+=C2=A0 =C2=A0 page =3D addr &gt;&gt; IMSIC_MMIO_PAGE_SHIFT;<br>
+=C2=A0 =C2=A0 if ((addr &amp; (IMSIC_MMIO_PAGE_SZ - 1)) =3D=3D IMSIC_MMIO_=
PAGE_LE) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (value &amp;&amp; (value &lt; imsic-&gt;num=
_irqs)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 imsic-&gt;eistate[(page * imsic-=
&gt;num_irqs) + value] |=3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 IMSIC_EISTATE_PENDING;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* Update CPU external interrupt status */<br>
+=C2=A0 =C2=A0 riscv_imsic_update(imsic, page);<br>
+<br>
+=C2=A0 =C2=A0 return;<br>
+<br>
+err:<br>
+=C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;%s: I=
nvalid register write 0x%&quot; HWADDR_PRIx &quot;\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __func__, a=
ddr);<br>
+}<br>
+<br>
+static const MemoryRegionOps riscv_imsic_ops =3D {<br>
+=C2=A0 =C2=A0 .read =3D riscv_imsic_read,<br>
+=C2=A0 =C2=A0 .write =3D riscv_imsic_write,<br>
+=C2=A0 =C2=A0 .endianness =3D DEVICE_LITTLE_ENDIAN,<br>
+=C2=A0 =C2=A0 .valid =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .min_access_size =3D 4,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .max_access_size =3D 4<br>
+=C2=A0 =C2=A0 }<br>
+};<br>
+<br>
+static void riscv_imsic_realize(DeviceState *dev, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 RISCVIMSICState *imsic =3D RISCV_IMSIC(dev);<br>
+=C2=A0 =C2=A0 RISCVCPU *rcpu =3D RISCV_CPU(qemu_get_cpu(imsic-&gt;hartid))=
;<br>
+=C2=A0 =C2=A0 CPUState *cpu =3D qemu_get_cpu(imsic-&gt;hartid);<br>
+=C2=A0 =C2=A0 CPURISCVState *env =3D cpu ? cpu-&gt;env_ptr : NULL;<br>
+<br>
+=C2=A0 =C2=A0 imsic-&gt;num_eistate =3D imsic-&gt;num_pages * imsic-&gt;nu=
m_irqs;<br>
+=C2=A0 =C2=A0 imsic-&gt;eidelivery =3D g_new0(uint32_t, imsic-&gt;num_page=
s);<br>
+=C2=A0 =C2=A0 imsic-&gt;eithreshold =3D g_new0(uint32_t, imsic-&gt;num_pag=
es);<br>
+=C2=A0 =C2=A0 imsic-&gt;eistate =3D g_new0(uint32_t, imsic-&gt;num_eistate=
);<br>
+<br>
+=C2=A0 =C2=A0 memory_region_init_io(&amp;imsic-&gt;mmio, OBJECT(dev), &amp=
;riscv_imsic_ops,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 imsic, TYPE_RISCV_IMSIC,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 IMSIC_MMIO_SIZE(imsic-&gt;num_pages));<br>
+=C2=A0 =C2=A0 sysbus_init_mmio(SYS_BUS_DEVICE(dev), &amp;imsic-&gt;mmio);<=
br>
+<br>
+=C2=A0 =C2=A0 /* Claim the CPU interrupt to be triggered by this IMSIC */<=
br>
+=C2=A0 =C2=A0 if (riscv_cpu_claim_interrupts(rcpu,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (imsic-&gt;mmode) ? MIP_MEIP : M=
IP_SEIP) &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;%s already claimed&quot;,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0(imsic-&gt;mmode) ? &quot;MEIP&quot; : &quot;SEIP&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(1);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* Create output IRQ lines */<br>
+=C2=A0 =C2=A0 imsic-&gt;external_irqs =3D g_malloc(sizeof(qemu_irq) * imsi=
c-&gt;num_pages);<br>
+=C2=A0 =C2=A0 qdev_init_gpio_out(dev, imsic-&gt;external_irqs, imsic-&gt;n=
um_pages);<br>
+<br>
+=C2=A0 =C2=A0 /* Force select AIA feature and setup CSR read-modify-write =
callback */<br>
+=C2=A0 =C2=A0 if (env) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_set_feature(env, RISCV_FEATURE_AIA);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!imsic-&gt;mmode) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_cpu_set_geilen(env, imsic-=
&gt;num_pages - 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_cpu_set_aia_ireg_rmw_fn(env, (imsic-&gt;=
mmode) ? PRV_M : PRV_S,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_imsic_rmw=
, imsic);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 msi_nonbroken =3D true;<br>
+}<br>
+<br>
+static Property riscv_imsic_properties[] =3D {<br>
+=C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;mmode&quot;, RISCVIMSICState, mmode, =
0),<br>
+=C2=A0 =C2=A0 DEFINE_PROP_UINT32(&quot;hartid&quot;, RISCVIMSICState, hart=
id, 0),<br>
+=C2=A0 =C2=A0 DEFINE_PROP_UINT32(&quot;num-pages&quot;, RISCVIMSICState, n=
um_pages, 0),<br>
+=C2=A0 =C2=A0 DEFINE_PROP_UINT32(&quot;num-irqs&quot;, RISCVIMSICState, nu=
m_irqs, 0),<br>
+=C2=A0 =C2=A0 DEFINE_PROP_END_OF_LIST(),<br>
+};<br>
+<br>
+static const VMStateDescription vmstate_riscv_imsic =3D {<br>
+=C2=A0 =C2=A0 .name =3D &quot;riscv_imsic&quot;,<br>
+=C2=A0 =C2=A0 .version_id =3D 1,<br>
+=C2=A0 =C2=A0 .minimum_version_id =3D 1,<br>
+=C2=A0 =C2=A0 .fields =3D (VMStateField[]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_VARRAY_UINT32(eidelivery=
, RISCVIMSICState,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 num_pages, 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmstate_info_uint32, uint32_t=
),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_VARRAY_UINT32(eithreshol=
d, RISCVIMSICState,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 num_pages, 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmstate_info_uint32, uint32_t=
),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_VARRAY_UINT32(eistate, R=
ISCVIMSICState,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 num_eistate, 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmstate_info_uint32, uint32_t=
),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_END_OF_LIST()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+};<br>
+<br>
+static void riscv_imsic_class_init(ObjectClass *klass, void *data)<br>
+{<br>
+=C2=A0 =C2=A0 DeviceClass *dc =3D DEVICE_CLASS(klass);<br>
+<br>
+=C2=A0 =C2=A0 device_class_set_props(dc, riscv_imsic_properties);<br>
+=C2=A0 =C2=A0 dc-&gt;realize =3D riscv_imsic_realize;<br>
+=C2=A0 =C2=A0 dc-&gt;vmsd =3D &amp;vmstate_riscv_imsic;<br>
+}<br>
+<br>
+static const TypeInfo riscv_imsic_info =3D {<br>
+=C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_RISCV_IMSIC=
,<br>
+=C2=A0 =C2=A0 .parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_SYS_BUS_DEVICE,<=
br>
+=C2=A0 =C2=A0 .instance_size =3D sizeof(RISCVIMSICState),<br>
+=C2=A0 =C2=A0 .class_init=C2=A0 =C2=A0 =3D riscv_imsic_class_init,<br>
+};<br>
+<br>
+static void riscv_imsic_register_types(void)<br>
+{<br>
+=C2=A0 =C2=A0 type_register_static(&amp;riscv_imsic_info);<br>
+}<br>
+<br>
+type_init(riscv_imsic_register_types)<br>
+<br>
+/*<br>
+ * Create IMSIC device.<br>
+ */<br>
+DeviceState *riscv_imsic_create(hwaddr addr, uint32_t hartid, bool mmode,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t num_pages, uint32_t num_ids=
)<br>
+{<br>
+=C2=A0 =C2=A0 DeviceState *dev =3D qdev_new(TYPE_RISCV_IMSIC);<br>
+=C2=A0 =C2=A0 CPUState *cpu =3D qemu_get_cpu(hartid);<br>
+=C2=A0 =C2=A0 uint32_t i;<br>
+<br>
+=C2=A0 =C2=A0 assert(!(addr &amp; (IMSIC_MMIO_PAGE_SZ - 1)));<br>
+=C2=A0 =C2=A0 if (mmode) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(num_pages =3D=3D 1);<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(num_pages &gt;=3D 1 &amp;&amp; num_page=
s &lt;=3D (IRQ_LOCAL_GUEST_MAX + 1));<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 assert(IMSIC_MIN_ID &lt;=3D num_ids);<br>
+=C2=A0 =C2=A0 assert(num_ids &lt;=3D IMSIC_MAX_ID);<br>
+=C2=A0 =C2=A0 assert((num_ids &amp; IMSIC_MIN_ID) =3D=3D IMSIC_MIN_ID);<br=
>
+<br>
+=C2=A0 =C2=A0 qdev_prop_set_bit(dev, &quot;mmode&quot;, mmode);<br>
+=C2=A0 =C2=A0 qdev_prop_set_uint32(dev, &quot;hartid&quot;, hartid);<br>
+=C2=A0 =C2=A0 qdev_prop_set_uint32(dev, &quot;num-pages&quot;, num_pages);=
<br>
+=C2=A0 =C2=A0 qdev_prop_set_uint32(dev, &quot;num-irqs&quot;, num_ids + 1)=
;<br>
+<br>
+=C2=A0 =C2=A0 sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &amp;error_fat=
al);<br>
+=C2=A0 =C2=A0 sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);<br>
+<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; num_pages; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_connect_gpio_out_named(dev,=
 NULL, i,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_get=
_gpio_in(DEVICE(cpu),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 (mmode) ? IRQ_M_EXT : IRQ_S_EXT));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_connect_gpio_out_named(dev,=
 NULL, i,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_get=
_gpio_in(DEVICE(cpu),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 IRQ_LOCAL_MAX + i - 1));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return dev;<br>
+}<br>
diff --git a/include/hw/intc/riscv_imsic.h b/include/hw/intc/riscv_imsic.h<=
br>
new file mode 100644<br>
index 0000000000..58c2aaa8dc<br>
--- /dev/null<br>
+++ b/include/hw/intc/riscv_imsic.h<br>
@@ -0,0 +1,68 @@<br>
+/*<br>
+ * RISC-V IMSIC (Incoming Message Signal Interrupt Controller) interface<b=
r>
+ *<br>
+ * Copyright (c) 2021 Western Digital Corporation or its affiliates.<br>
+ *<br>
+ * This program is free software; you can redistribute it and/or modify it=
<br>
+ * under the terms and conditions of the GNU General Public License,<br>
+ * version 2 or later, as published by the Free Software Foundation.<br>
+ *<br>
+ * This program is distributed in the hope it will be useful, but WITHOUT<=
br>
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or<b=
r>
+ * FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the GNU General Public Lice=
nse for<br>
+ * more details.<br>
+ *<br>
+ * You should have received a copy of the GNU General Public License along=
 with<br>
+ * this program.=C2=A0 If not, see &lt;<a href=3D"http://www.gnu.org/licen=
ses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.org/licenses/</a>=
&gt;.<br>
+ */<br>
+<br>
+#ifndef HW_RISCV_IMSIC_H<br>
+#define HW_RISCV_IMSIC_H<br>
+<br>
+#include &quot;hw/sysbus.h&quot;<br>
+#include &quot;qom/object.h&quot;<br>
+<br>
+#define TYPE_RISCV_IMSIC &quot;riscv.imsic&quot;<br>
+<br>
+typedef struct RISCVIMSICState RISCVIMSICState;<br>
+DECLARE_INSTANCE_CHECKER(RISCVIMSICState, RISCV_IMSIC, TYPE_RISCV_IMSIC)<b=
r>
+<br>
+#define IMSIC_MMIO_PAGE_SHIFT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 12<br>
+#define IMSIC_MMIO_PAGE_SZ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
(1UL &lt;&lt; IMSIC_MMIO_PAGE_SHIFT)<br>
+#define IMSIC_MMIO_SIZE(__num_pages)=C2=A0 =C2=A0((__num_pages) * IMSIC_MM=
IO_PAGE_SZ)<br>
+<br>
+#define IMSIC_MMIO_HART_GUEST_MAX_BTIS 6<br>
+#define IMSIC_MMIO_GROUP_MIN_SHIFT=C2=A0 =C2=A0 =C2=A024<br>
+<br>
+#define IMSIC_HART_NUM_GUESTS(__guest_bits)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 (1U &lt;&lt; (__guest_bits))<br>
+#define IMSIC_HART_SIZE(__guest_bits)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 (IMSIC_HART_NUM_GUESTS(__guest_bits) * IMSIC_MMIO_PAGE_SZ)<b=
r>
+#define IMSIC_GROUP_NUM_HARTS(__hart_bits)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 (1U &lt;&lt; (__hart_bits))<br>
+#define IMSIC_GROUP_SIZE(__hart_bits, __guest_bits)=C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 (IMSIC_GROUP_NUM_HARTS(__hart_bits) * IMSIC_HART_SIZE(__gues=
t_bits))<br>
+<br>
+struct RISCVIMSICState {<br>
+=C2=A0 =C2=A0 /*&lt; private &gt;*/<br>
+=C2=A0 =C2=A0 SysBusDevice parent_obj;<br>
+=C2=A0 =C2=A0 qemu_irq *external_irqs;<br>
+<br>
+=C2=A0 =C2=A0 /*&lt; public &gt;*/<br>
+=C2=A0 =C2=A0 MemoryRegion mmio;<br>
+=C2=A0 =C2=A0 uint32_t num_eistate;<br>
+=C2=A0 =C2=A0 uint32_t *eidelivery;<br>
+=C2=A0 =C2=A0 uint32_t *eithreshold;<br>
+=C2=A0 =C2=A0 uint32_t *eistate;<br>
+<br>
+=C2=A0 =C2=A0 /* config */<br>
+=C2=A0 =C2=A0 bool mmode;<br>
+=C2=A0 =C2=A0 uint32_t hartid;<br>
+=C2=A0 =C2=A0 uint32_t num_pages;<br>
+=C2=A0 =C2=A0 uint32_t num_irqs;<br>
+};<br>
+<br>
+DeviceState *riscv_imsic_create(hwaddr addr, uint32_t hartid, bool mmode,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t num_pages, uint32_t num_ids=
);<br>
+<br>
+#endif<br>
-- <br>
2.25.1<br>
<br>
<br>
</blockquote></div></div>

--00000000000096ab7705d5719b5b--

