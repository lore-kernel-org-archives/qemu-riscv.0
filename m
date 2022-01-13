Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n7z7n-0005SJ-Gn
	for mharc-qemu-riscv@gnu.org; Thu, 13 Jan 2022 07:22:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n7z7i-0005P7-6e
 for qemu-riscv@nongnu.org; Thu, 13 Jan 2022 07:22:35 -0500
Received: from [2a00:1450:4864:20::429] (port=43565
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n7z7d-0001p7-Tl
 for qemu-riscv@nongnu.org; Thu, 13 Jan 2022 07:22:32 -0500
Received: by mail-wr1-x429.google.com with SMTP id o3so9729896wrh.10
 for <qemu-riscv@nongnu.org>; Thu, 13 Jan 2022 04:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3WS7/AyQo3xgrzW9FYN936jurhJklvPkxzyAGd+LO3k=;
 b=iDkIOOBmBIFesvL1sbdd8bM7jlo2vD9TRRTOi0R7sCkxRl8JlaD6q3DlzalzrrdJWl
 eyeocLTidx0wxStd6fmbuTHzSOtqaHEiu87XIQNLrO72EmSQWEJqQ9TIv/eWKLrwMIlG
 RP6ToRlB/0gqOo/+GBLr/wpaMel5FKgEgRdtZuLVb8ejQtqxLgBav/NMvVAKTVpxewNs
 hrFDoc75QWoqQspaf3fPGSelbz/8sB/kH5GyWwJeCv1SedNeRuc+kxkDHobof44WHnc6
 O4WZqGljd4lQQBf8VEpgWPxKc4WL+ZKO2sxp1yG5RWq2TBVQWLfxjATd9XX2OiGUhlL4
 4oyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3WS7/AyQo3xgrzW9FYN936jurhJklvPkxzyAGd+LO3k=;
 b=U+NzYkyOPwpPTkIpZJJapHRKbwdwldPOfe6DOLMqQ6Ya5gCkIurTkD63bOA8hGUtFP
 M8mLE4jl7rRhM7duqpyBUtwP9ECIh2LpEDtWBzGF/tpYTGfkAqRZM0DVSVee1mDby21g
 Pcg+nA1nbmMzZaBtfcgIINONp4sOfVifkIUXvKPiqjSFV9eRduYO8YupmjUede0OZdiP
 rTn7yNDvcqyUDH8e7iURLzWosJeE9XC1PBF4b16RNBzmEqWPDmsAo4EHH+nisokqHdVU
 +33nlWje+54uNVdJoAq8IQJkXJXiVovqM+q8Bb0s70LxtGx8Nv1SZM5yI/TEqmo4Dt6h
 Gf1w==
X-Gm-Message-State: AOAM530plCgFJV47I9vqNOl2LseAiU3gAibhh3pbB4OS/iYpk9FSFNf0
 i+y0sZ6PUIpyntNLA4BPVNYFgSTphNC7Qde3DGggIA==
X-Google-Smtp-Source: ABdhPJycfOx074UQkP5+PLry3wNVmYuYA9k+TuuGdsVnx0NsfsyGuW8uL5t5C8jaM0svg9K9Vky/41zJ8QM0lC2uhdk=
X-Received: by 2002:adf:eac3:: with SMTP id o3mr3939196wrn.86.1642076547715;
 Thu, 13 Jan 2022 04:22:27 -0800 (PST)
MIME-Version: 1.0
References: <20211230123539.52786-1-anup@brainfault.org>
 <20211230123539.52786-21-anup@brainfault.org>
 <CANzO1D3oYigRdBtYLVqsgAAhgU_JzKEB27SHx-7jg7b_qd8R1w@mail.gmail.com>
In-Reply-To: <CANzO1D3oYigRdBtYLVqsgAAhgU_JzKEB27SHx-7jg7b_qd8R1w@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 13 Jan 2022 17:52:14 +0530
Message-ID: <CAAhSdy3Tu3YiOk4do44UNXHqPA_LxG1U1mswDqCwDwd6en+5=g@mail.gmail.com>
Subject: Re: [PATCH v6 20/23] hw/intc: Add RISC-V AIA IMSIC device emulation
To: Frank Chang <frank.chang@sifive.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bin Meng <bmeng.cn@gmail.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atishp@atishpatra.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::429;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 13 Jan 2022 12:22:36 -0000

On Thu, Jan 13, 2022 at 12:56 PM Frank Chang <frank.chang@sifive.com> wrote=
:
>
> Anup Patel <anup@brainfault.org> =E6=96=BC 2021=E5=B9=B412=E6=9C=8830=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=889:00=E5=AF=AB=E9=81=93=EF=BC=9A
>>
>> From: Anup Patel <anup.patel@wdc.com>
>>
>> The RISC-V AIA (Advanced Interrupt Architecture) defines a new
>> interrupt controller for MSIs (message signal interrupts) called
>> IMSIC (Incoming Message Signal Interrupt Controller). The IMSIC
>> is per-HART device and also suppport virtualizaiton of MSIs using
>> dedicated VS-level guest interrupt files.
>>
>> This patch adds device emulation for RISC-V AIA IMSIC which
>> supports M-level, S-level, and VS-level MSIs.
>>
>> Signed-off-by: Anup Patel <anup.patel@wdc.com>
>> Signed-off-by: Anup Patel <anup@brainfault.org>
>> ---
>>  hw/intc/Kconfig               |   3 +
>>  hw/intc/meson.build           |   1 +
>>  hw/intc/riscv_imsic.c         | 447 ++++++++++++++++++++++++++++++++++
>>  include/hw/intc/riscv_imsic.h |  68 ++++++
>>  4 files changed, 519 insertions(+)
>>  create mode 100644 hw/intc/riscv_imsic.c
>>  create mode 100644 include/hw/intc/riscv_imsic.h
>>
>> diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
>> index 528e77b4a6..ec8d4cec29 100644
>> --- a/hw/intc/Kconfig
>> +++ b/hw/intc/Kconfig
>> @@ -73,6 +73,9 @@ config RISCV_ACLINT
>>  config RISCV_APLIC
>>      bool
>>
>> +config RISCV_IMSIC
>> +    bool
>> +
>>  config SIFIVE_PLIC
>>      bool
>>
>> diff --git a/hw/intc/meson.build b/hw/intc/meson.build
>> index 7466024402..5caa337654 100644
>> --- a/hw/intc/meson.build
>> +++ b/hw/intc/meson.build
>> @@ -51,6 +51,7 @@ specific_ss.add(when: 'CONFIG_S390_FLIC_KVM', if_true:=
 files('s390_flic_kvm.c'))
>>  specific_ss.add(when: 'CONFIG_SH_INTC', if_true: files('sh_intc.c'))
>>  specific_ss.add(when: 'CONFIG_RISCV_ACLINT', if_true: files('riscv_acli=
nt.c'))
>>  specific_ss.add(when: 'CONFIG_RISCV_APLIC', if_true: files('riscv_aplic=
.c'))
>> +specific_ss.add(when: 'CONFIG_RISCV_IMSIC', if_true: files('riscv_imsic=
.c'))
>>  specific_ss.add(when: 'CONFIG_SIFIVE_PLIC', if_true: files('sifive_plic=
.c'))
>>  specific_ss.add(when: 'CONFIG_XICS', if_true: files('xics.c'))
>>  specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_XICS'],
>> diff --git a/hw/intc/riscv_imsic.c b/hw/intc/riscv_imsic.c
>> new file mode 100644
>> index 0000000000..753fa11a9c
>> --- /dev/null
>> +++ b/hw/intc/riscv_imsic.c
>> @@ -0,0 +1,447 @@
>> +/*
>> + * RISC-V IMSIC (Incoming Message Signaled Interrupt Controller)
>> + *
>> + * Copyright (c) 2021 Western Digital Corporation or its affiliates.
>> + *
>> + * This program is free software; you can redistribute it and/or modify=
 it
>> + * under the terms and conditions of the GNU General Public License,
>> + * version 2 or later, as published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope it will be useful, but WITHO=
UT
>> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY o=
r
>> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public Licens=
e for
>> + * more details.
>> + *
>> + * You should have received a copy of the GNU General Public License al=
ong with
>> + * this program.  If not, see <http://www.gnu.org/licenses/>.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "qapi/error.h"
>> +#include "qemu/log.h"
>> +#include "qemu/module.h"
>> +#include "qemu/error-report.h"
>> +#include "qemu/bswap.h"
>> +#include "exec/address-spaces.h"
>> +#include "hw/sysbus.h"
>> +#include "hw/pci/msi.h"
>> +#include "hw/boards.h"
>> +#include "hw/qdev-properties.h"
>> +#include "hw/intc/riscv_imsic.h"
>> +#include "hw/irq.h"
>> +#include "target/riscv/cpu.h"
>> +#include "target/riscv/cpu_bits.h"
>> +#include "sysemu/sysemu.h"
>> +#include "migration/vmstate.h"
>> +
>> +#define IMSIC_MMIO_PAGE_LE             0x00
>> +#define IMSIC_MMIO_PAGE_BE             0x04
>> +
>> +#define IMSIC_MIN_ID                   ((IMSIC_EIPx_BITS * 2) - 1)
>> +#define IMSIC_MAX_ID                   (IMSIC_TOPEI_IID_MASK)
>> +
>> +#define IMSIC_EISTATE_PENDING          (1U << 0)
>> +#define IMSIC_EISTATE_ENABLED          (1U << 1)
>> +#define IMSIC_EISTATE_ENPEND           (IMSIC_EISTATE_ENABLED | \
>> +                                        IMSIC_EISTATE_PENDING)
>> +
>> +static uint32_t riscv_imsic_topei(RISCVIMSICState *imsic, uint32_t page=
)
>> +{
>> +    uint32_t i, max_irq, base;
>> +
>> +    base =3D page * imsic->num_irqs;
>> +    max_irq =3D (imsic->num_irqs < imsic->eithreshold[page]) ?
>> +              imsic->num_irqs : imsic->eithreshold[page];
>
>
> Do we need to exclude the case which imsic->eithreshold[page] =3D=3D 0?
>   The value of a *topei CSR (mtopei, stopei, or vstopei) indicates the in=
terrupt file=E2=80=99s current
>   highest-priority pending-and-enabled interrupt that also exceeds the pr=
iority threshold specified by
>   its eithreshold register if eithreshold is not zero.

This is similar to the mistake I did with APLIC IDC. Thanks for catching.

I will fix this in next revision.

Regards,
Anup

>
>>
>> +    for (i =3D 1; i < max_irq; i++) {
>> +        if ((imsic->eistate[base + i] & IMSIC_EISTATE_ENPEND) =3D=3D
>> +                IMSIC_EISTATE_ENPEND) {
>> +            return (i << IMSIC_TOPEI_IID_SHIFT) | i;
>> +        }
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static void riscv_imsic_update(RISCVIMSICState *imsic, uint32_t page)
>> +{
>> +    if (imsic->eidelivery[page] && riscv_imsic_topei(imsic, page)) {
>> +        qemu_irq_raise(imsic->external_irqs[page]);
>> +    } else {
>> +        qemu_irq_lower(imsic->external_irqs[page]);
>> +    }
>> +}
>> +
>> +static int riscv_imsic_eidelivery_rmw(RISCVIMSICState *imsic, uint32_t =
page,
>> +                                      target_ulong *val,
>> +                                      target_ulong new_val,
>> +                                      target_ulong wr_mask)
>> +{
>> +    target_ulong old_val =3D imsic->eidelivery[page];
>> +
>> +    if (val) {
>> +        *val =3D old_val;
>> +    }
>> +
>> +    wr_mask &=3D 0x1;
>> +    imsic->eidelivery[page] =3D (old_val & ~wr_mask) | (new_val & wr_ma=
sk);
>> +
>> +    riscv_imsic_update(imsic, page);
>> +    return 0;
>> +}
>> +
>> +static int riscv_imsic_eithreshold_rmw(RISCVIMSICState *imsic, uint32_t=
 page,
>> +                                      target_ulong *val,
>> +                                      target_ulong new_val,
>> +                                      target_ulong wr_mask)
>> +{
>> +    target_ulong old_val =3D imsic->eithreshold[page];
>> +
>> +    if (val) {
>> +        *val =3D old_val;
>> +    }
>> +
>> +    wr_mask &=3D IMSIC_MAX_ID;
>> +    imsic->eithreshold[page] =3D (old_val & ~wr_mask) | (new_val & wr_m=
ask);
>> +
>> +    riscv_imsic_update(imsic, page);
>> +    return 0;
>> +}
>> +
>> +static int riscv_imsic_topei_rmw(RISCVIMSICState *imsic, uint32_t page,
>> +                                 target_ulong *val, target_ulong new_va=
l,
>> +                                 target_ulong wr_mask)
>> +{
>> +    uint32_t base, topei =3D riscv_imsic_topei(imsic, page);
>> +
>> +    /* Read pending and enabled interrupt with highest priority */
>> +    if (val) {
>> +        *val =3D topei;
>> +    }
>> +
>> +    /* Writes ignore value and clear top pending interrupt */
>> +    if (topei && wr_mask) {
>> +        topei >>=3D IMSIC_TOPEI_IID_SHIFT;
>> +        base =3D page * imsic->num_irqs;
>> +        if (topei) {
>> +            imsic->eistate[base + topei] &=3D ~IMSIC_EISTATE_PENDING;
>> +        }
>> +
>> +        riscv_imsic_update(imsic, page);
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int riscv_imsic_eix_rmw(RISCVIMSICState *imsic,
>> +                               uint32_t xlen, uint32_t page,
>> +                               uint32_t num, bool pend, target_ulong *v=
al,
>> +                               target_ulong new_val, target_ulong wr_ma=
sk)
>> +{
>> +    uint32_t i, base;
>> +    target_ulong mask;
>> +    uint32_t state =3D (pend) ? IMSIC_EISTATE_PENDING : IMSIC_EISTATE_E=
NABLED;
>> +
>> +    if (xlen !=3D 32) {
>> +        if (num & 0x1) {
>> +            return -EINVAL;
>> +        }
>> +        num >>=3D 1;
>> +    }
>> +    if (num >=3D (imsic->num_irqs / xlen)) {
>> +        return -EINVAL;
>> +    }
>> +
>> +    base =3D (page * imsic->num_irqs) + (num * xlen);
>> +
>> +    if (val) {
>> +        *val =3D 0;
>> +        for (i =3D 0; i < xlen; i++) {
>> +            mask =3D (target_ulong)1 << i;
>> +            *val |=3D (imsic->eistate[base + i] & state) ? mask : 0;
>> +        }
>> +    }
>> +
>> +    for (i =3D 0; i < xlen; i++) {
>> +        /* Bit0 of eip0 and eie0 are read-only zero */
>> +        if (!num && !i) {
>> +            continue;
>> +        }
>> +
>> +        mask =3D (target_ulong)1 << i;
>> +        if (wr_mask & mask) {
>> +            if (new_val & mask) {
>> +                imsic->eistate[base + i] |=3D state;
>> +            } else {
>> +                imsic->eistate[base + i] &=3D ~state;
>> +            }
>> +        }
>> +    }
>> +
>> +    riscv_imsic_update(imsic, page);
>> +    return 0;
>> +}
>> +
>> +static int riscv_imsic_rmw(void *arg, target_ulong reg, target_ulong *v=
al,
>> +                           target_ulong new_val, target_ulong wr_mask)
>> +{
>> +    RISCVIMSICState *imsic =3D arg;
>> +    uint32_t isel, priv, virt, vgein, xlen, page;
>> +
>> +    priv =3D AIA_IREG_PRIV(reg);
>> +    virt =3D AIA_IREG_VIRT(reg);
>> +    isel =3D AIA_IREG_ISEL(reg);
>> +    vgein =3D AIA_IREG_VGEIN(reg);
>> +    xlen =3D AIA_IREG_XLEN(reg);
>> +
>> +    if (imsic->mmode) {
>> +        if (priv =3D=3D PRV_M && !virt) {
>> +            page =3D 0;
>> +        } else {
>> +            goto err;
>> +        }
>> +    } else {
>> +        if (priv =3D=3D PRV_S) {
>> +            if (virt) {
>> +                if (vgein && vgein < imsic->num_pages) {
>> +                    page =3D vgein;
>> +                } else {
>> +                    goto err;
>> +                }
>> +            } else {
>> +                page =3D 0;
>> +            }
>> +        } else {
>> +            goto err;
>> +        }
>> +    }
>> +
>> +    switch (isel) {
>> +    case ISELECT_IMSIC_EIDELIVERY:
>> +        return riscv_imsic_eidelivery_rmw(imsic, page, val,
>> +                                          new_val, wr_mask);
>> +    case ISELECT_IMSIC_EITHRESHOLD:
>> +        return riscv_imsic_eithreshold_rmw(imsic, page, val,
>> +                                           new_val, wr_mask);
>> +    case ISELECT_IMSIC_TOPEI:
>> +        return riscv_imsic_topei_rmw(imsic, page, val, new_val, wr_mask=
);
>> +    case ISELECT_IMSIC_EIP0 ... ISELECT_IMSIC_EIP63:
>> +        return riscv_imsic_eix_rmw(imsic, xlen, page,
>> +                                   isel - ISELECT_IMSIC_EIP0,
>> +                                   true, val, new_val, wr_mask);
>> +    case ISELECT_IMSIC_EIE0 ... ISELECT_IMSIC_EIE63:
>> +        return riscv_imsic_eix_rmw(imsic, xlen, page,
>> +                                   isel - ISELECT_IMSIC_EIE0,
>> +                                   false, val, new_val, wr_mask);
>> +    default:
>> +        break;
>> +    };
>> +
>> +err:
>> +    qemu_log_mask(LOG_GUEST_ERROR,
>> +                  "%s: Invalid register priv=3D%d virt=3D%d isel=3D%d v=
gein=3D%d\n",
>> +                  __func__, priv, virt, isel, vgein);
>> +    return -EINVAL;
>> +}
>> +
>> +static uint64_t riscv_imsic_read(void *opaque, hwaddr addr, unsigned si=
ze)
>> +{
>> +    RISCVIMSICState *imsic =3D opaque;
>> +
>> +    /* Reads must be 4 byte words */
>> +    if ((addr & 0x3) !=3D 0) {
>> +        goto err;
>> +    }
>> +
>> +    /* Reads cannot be out of range */
>> +    if (addr > IMSIC_MMIO_SIZE(imsic->num_pages)) {
>> +        goto err;
>> +    }
>> +
>> +    return 0;
>> +
>> +err:
>> +    qemu_log_mask(LOG_GUEST_ERROR,
>> +                  "%s: Invalid register read 0x%" HWADDR_PRIx "\n",
>> +                  __func__, addr);
>> +    return 0;
>> +}
>> +
>> +static void riscv_imsic_write(void *opaque, hwaddr addr, uint64_t value=
,
>> +        unsigned size)
>> +{
>> +    RISCVIMSICState *imsic =3D opaque;
>> +    uint32_t page;
>> +
>> +    /* Writes must be 4 byte words */
>> +    if ((addr & 0x3) !=3D 0) {
>> +        goto err;
>> +    }
>> +
>> +    /* Writes cannot be out of range */
>> +    if (addr > IMSIC_MMIO_SIZE(imsic->num_pages)) {
>> +        goto err;
>> +    }
>> +
>> +    /* Writes only supported for MSI little-endian registers */
>> +    page =3D addr >> IMSIC_MMIO_PAGE_SHIFT;
>> +    if ((addr & (IMSIC_MMIO_PAGE_SZ - 1)) =3D=3D IMSIC_MMIO_PAGE_LE) {
>> +        if (value && (value < imsic->num_irqs)) {
>> +            imsic->eistate[(page * imsic->num_irqs) + value] |=3D
>> +                                                    IMSIC_EISTATE_PENDI=
NG;
>> +        }
>> +    }
>> +
>> +    /* Update CPU external interrupt status */
>> +    riscv_imsic_update(imsic, page);
>> +
>> +    return;
>> +
>> +err:
>> +    qemu_log_mask(LOG_GUEST_ERROR,
>> +                  "%s: Invalid register write 0x%" HWADDR_PRIx "\n",
>> +                  __func__, addr);
>> +}
>> +
>> +static const MemoryRegionOps riscv_imsic_ops =3D {
>> +    .read =3D riscv_imsic_read,
>> +    .write =3D riscv_imsic_write,
>> +    .endianness =3D DEVICE_LITTLE_ENDIAN,
>> +    .valid =3D {
>> +        .min_access_size =3D 4,
>> +        .max_access_size =3D 4
>> +    }
>> +};
>> +
>> +static void riscv_imsic_realize(DeviceState *dev, Error **errp)
>> +{
>> +    RISCVIMSICState *imsic =3D RISCV_IMSIC(dev);
>> +    RISCVCPU *rcpu =3D RISCV_CPU(qemu_get_cpu(imsic->hartid));
>> +    CPUState *cpu =3D qemu_get_cpu(imsic->hartid);
>> +    CPURISCVState *env =3D cpu ? cpu->env_ptr : NULL;
>> +
>> +    imsic->num_eistate =3D imsic->num_pages * imsic->num_irqs;
>> +    imsic->eidelivery =3D g_new0(uint32_t, imsic->num_pages);
>> +    imsic->eithreshold =3D g_new0(uint32_t, imsic->num_pages);
>> +    imsic->eistate =3D g_new0(uint32_t, imsic->num_eistate);
>> +
>> +    memory_region_init_io(&imsic->mmio, OBJECT(dev), &riscv_imsic_ops,
>> +                          imsic, TYPE_RISCV_IMSIC,
>> +                          IMSIC_MMIO_SIZE(imsic->num_pages));
>> +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &imsic->mmio);
>> +
>> +    /* Claim the CPU interrupt to be triggered by this IMSIC */
>> +    if (riscv_cpu_claim_interrupts(rcpu,
>> +            (imsic->mmode) ? MIP_MEIP : MIP_SEIP) < 0) {
>> +        error_report("%s already claimed",
>> +                     (imsic->mmode) ? "MEIP" : "SEIP");
>> +        exit(1);
>> +    }
>> +
>> +    /* Create output IRQ lines */
>> +    imsic->external_irqs =3D g_malloc(sizeof(qemu_irq) * imsic->num_pag=
es);
>> +    qdev_init_gpio_out(dev, imsic->external_irqs, imsic->num_pages);
>> +
>> +    /* Force select AIA feature and setup CSR read-modify-write callbac=
k */
>> +    if (env) {
>> +        riscv_set_feature(env, RISCV_FEATURE_AIA);
>> +        if (!imsic->mmode) {
>> +            riscv_cpu_set_geilen(env, imsic->num_pages - 1);
>> +        }
>> +        riscv_cpu_set_aia_ireg_rmw_fn(env, (imsic->mmode) ? PRV_M : PRV=
_S,
>> +                                      riscv_imsic_rmw, imsic);
>> +    }
>> +
>> +    msi_nonbroken =3D true;
>> +}
>> +
>> +static Property riscv_imsic_properties[] =3D {
>> +    DEFINE_PROP_BOOL("mmode", RISCVIMSICState, mmode, 0),
>> +    DEFINE_PROP_UINT32("hartid", RISCVIMSICState, hartid, 0),
>> +    DEFINE_PROP_UINT32("num-pages", RISCVIMSICState, num_pages, 0),
>> +    DEFINE_PROP_UINT32("num-irqs", RISCVIMSICState, num_irqs, 0),
>> +    DEFINE_PROP_END_OF_LIST(),
>> +};
>> +
>> +static const VMStateDescription vmstate_riscv_imsic =3D {
>> +    .name =3D "riscv_imsic",
>> +    .version_id =3D 1,
>> +    .minimum_version_id =3D 1,
>> +    .fields =3D (VMStateField[]) {
>> +            VMSTATE_VARRAY_UINT32(eidelivery, RISCVIMSICState,
>> +                                  num_pages, 0,
>> +                                  vmstate_info_uint32, uint32_t),
>> +            VMSTATE_VARRAY_UINT32(eithreshold, RISCVIMSICState,
>> +                                  num_pages, 0,
>> +                                  vmstate_info_uint32, uint32_t),
>> +            VMSTATE_VARRAY_UINT32(eistate, RISCVIMSICState,
>> +                                  num_eistate, 0,
>> +                                  vmstate_info_uint32, uint32_t),
>> +            VMSTATE_END_OF_LIST()
>> +        }
>> +};
>> +
>> +static void riscv_imsic_class_init(ObjectClass *klass, void *data)
>> +{
>> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
>> +
>> +    device_class_set_props(dc, riscv_imsic_properties);
>> +    dc->realize =3D riscv_imsic_realize;
>> +    dc->vmsd =3D &vmstate_riscv_imsic;
>> +}
>> +
>> +static const TypeInfo riscv_imsic_info =3D {
>> +    .name          =3D TYPE_RISCV_IMSIC,
>> +    .parent        =3D TYPE_SYS_BUS_DEVICE,
>> +    .instance_size =3D sizeof(RISCVIMSICState),
>> +    .class_init    =3D riscv_imsic_class_init,
>> +};
>> +
>> +static void riscv_imsic_register_types(void)
>> +{
>> +    type_register_static(&riscv_imsic_info);
>> +}
>> +
>> +type_init(riscv_imsic_register_types)
>> +
>> +/*
>> + * Create IMSIC device.
>> + */
>> +DeviceState *riscv_imsic_create(hwaddr addr, uint32_t hartid, bool mmod=
e,
>> +                                uint32_t num_pages, uint32_t num_ids)
>> +{
>> +    DeviceState *dev =3D qdev_new(TYPE_RISCV_IMSIC);
>> +    CPUState *cpu =3D qemu_get_cpu(hartid);
>> +    uint32_t i;
>> +
>> +    assert(!(addr & (IMSIC_MMIO_PAGE_SZ - 1)));
>> +    if (mmode) {
>> +        assert(num_pages =3D=3D 1);
>> +    } else {
>> +        assert(num_pages >=3D 1 && num_pages <=3D (IRQ_LOCAL_GUEST_MAX =
+ 1));
>> +    }
>> +    assert(IMSIC_MIN_ID <=3D num_ids);
>> +    assert(num_ids <=3D IMSIC_MAX_ID);
>> +    assert((num_ids & IMSIC_MIN_ID) =3D=3D IMSIC_MIN_ID);
>> +
>> +    qdev_prop_set_bit(dev, "mmode", mmode);
>> +    qdev_prop_set_uint32(dev, "hartid", hartid);
>> +    qdev_prop_set_uint32(dev, "num-pages", num_pages);
>> +    qdev_prop_set_uint32(dev, "num-irqs", num_ids + 1);
>> +
>> +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>> +    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
>> +
>> +    for (i =3D 0; i < num_pages; i++) {
>> +        if (!i) {
>> +            qdev_connect_gpio_out_named(dev, NULL, i,
>> +                                        qdev_get_gpio_in(DEVICE(cpu),
>> +                                            (mmode) ? IRQ_M_EXT : IRQ_S=
_EXT));
>> +        } else {
>> +            qdev_connect_gpio_out_named(dev, NULL, i,
>> +                                        qdev_get_gpio_in(DEVICE(cpu),
>> +                                            IRQ_LOCAL_MAX + i - 1));
>> +        }
>> +    }
>> +
>> +    return dev;
>> +}
>> diff --git a/include/hw/intc/riscv_imsic.h b/include/hw/intc/riscv_imsic=
.h
>> new file mode 100644
>> index 0000000000..58c2aaa8dc
>> --- /dev/null
>> +++ b/include/hw/intc/riscv_imsic.h
>> @@ -0,0 +1,68 @@
>> +/*
>> + * RISC-V IMSIC (Incoming Message Signal Interrupt Controller) interfac=
e
>> + *
>> + * Copyright (c) 2021 Western Digital Corporation or its affiliates.
>> + *
>> + * This program is free software; you can redistribute it and/or modify=
 it
>> + * under the terms and conditions of the GNU General Public License,
>> + * version 2 or later, as published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope it will be useful, but WITHO=
UT
>> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY o=
r
>> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public Licens=
e for
>> + * more details.
>> + *
>> + * You should have received a copy of the GNU General Public License al=
ong with
>> + * this program.  If not, see <http://www.gnu.org/licenses/>.
>> + */
>> +
>> +#ifndef HW_RISCV_IMSIC_H
>> +#define HW_RISCV_IMSIC_H
>> +
>> +#include "hw/sysbus.h"
>> +#include "qom/object.h"
>> +
>> +#define TYPE_RISCV_IMSIC "riscv.imsic"
>> +
>> +typedef struct RISCVIMSICState RISCVIMSICState;
>> +DECLARE_INSTANCE_CHECKER(RISCVIMSICState, RISCV_IMSIC, TYPE_RISCV_IMSIC=
)
>> +
>> +#define IMSIC_MMIO_PAGE_SHIFT          12
>> +#define IMSIC_MMIO_PAGE_SZ             (1UL << IMSIC_MMIO_PAGE_SHIFT)
>> +#define IMSIC_MMIO_SIZE(__num_pages)   ((__num_pages) * IMSIC_MMIO_PAGE=
_SZ)
>> +
>> +#define IMSIC_MMIO_HART_GUEST_MAX_BTIS 6
>> +#define IMSIC_MMIO_GROUP_MIN_SHIFT     24
>> +
>> +#define IMSIC_HART_NUM_GUESTS(__guest_bits)           \
>> +    (1U << (__guest_bits))
>> +#define IMSIC_HART_SIZE(__guest_bits)                 \
>> +    (IMSIC_HART_NUM_GUESTS(__guest_bits) * IMSIC_MMIO_PAGE_SZ)
>> +#define IMSIC_GROUP_NUM_HARTS(__hart_bits)            \
>> +    (1U << (__hart_bits))
>> +#define IMSIC_GROUP_SIZE(__hart_bits, __guest_bits)   \
>> +    (IMSIC_GROUP_NUM_HARTS(__hart_bits) * IMSIC_HART_SIZE(__guest_bits)=
)
>> +
>> +struct RISCVIMSICState {
>> +    /*< private >*/
>> +    SysBusDevice parent_obj;
>> +    qemu_irq *external_irqs;
>> +
>> +    /*< public >*/
>> +    MemoryRegion mmio;
>> +    uint32_t num_eistate;
>> +    uint32_t *eidelivery;
>> +    uint32_t *eithreshold;
>> +    uint32_t *eistate;
>> +
>> +    /* config */
>> +    bool mmode;
>> +    uint32_t hartid;
>> +    uint32_t num_pages;
>> +    uint32_t num_irqs;
>> +};
>> +
>> +DeviceState *riscv_imsic_create(hwaddr addr, uint32_t hartid, bool mmod=
e,
>> +                                uint32_t num_pages, uint32_t num_ids);
>> +
>> +#endif
>> --
>> 2.25.1
>>
>>

