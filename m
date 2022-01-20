Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nAWCY-0000aj-OR
	for mharc-qemu-riscv@gnu.org; Thu, 20 Jan 2022 07:06:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nAWCU-0000VE-UJ
 for qemu-riscv@nongnu.org; Thu, 20 Jan 2022 07:05:59 -0500
Received: from [2a00:1450:4864:20::333] (port=51716
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nAWCQ-0008Cq-LF
 for qemu-riscv@nongnu.org; Thu, 20 Jan 2022 07:05:58 -0500
Received: by mail-wm1-x333.google.com with SMTP id c2so11642708wml.1
 for <qemu-riscv@nongnu.org>; Thu, 20 Jan 2022 04:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WTlpJYK6uTatryxA2RFkc+1aldcdOQfzvsrnB3qFfsA=;
 b=ylkfnsqxk+KtumjgQ5pVY5VhKd8ly+tbRGS3mqDS8TxLAVCjxRNbE32iNk3j7TvT+p
 8n9OCq/Bz/t83UR36gXZKKkb3mpdWqdAtj3+3ci8J29e0cYZQzGhqGS91Du19pvsYriH
 D6EilDlpJ+W2axvoq7gtAZXrqV1/yt5aNqssgOHQ95y4+4/lBf/42akyk76Lukc+4L//
 aiwn/gbbd6R7HNTZtkiqF+OBKsZpGPeLi9n2RlgZV2UkLtyiLj+626gkqvNdwcglKZGp
 7kTa+9PV6xFG/5EVqBfgs1G2NIq155Fl+1S18mLnO762mYr4qLqU2eIvVFVcb6zR/eRj
 FCrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WTlpJYK6uTatryxA2RFkc+1aldcdOQfzvsrnB3qFfsA=;
 b=VB1iRec5Biberl/Gkdr3pF1iO3oWqzLjfaXtlfUcsSvE2YL+Kg5kYmKzS2lqKxp6eC
 dajMNeHe+NiyxJbzopewpq30kFZ4SiQiihUyK5jE9a2X+6gOvN55g4SKECnARXXhellb
 /2BaC9hJ7fDxgAxaj6mPl4PFltSEW/Tl9F4nPW11uZViB+s248d+T3JtumPtwSTDtnGS
 9GZIqJXQU7L1iNSp0HsUtlL46Vq6aEwhzJ1ilhFVMMJx6bvSSu9Uz70d7qieaWl/lZqA
 j2NkvcfNxjs8hv1oxMVyQhsxoo1Ur6d7zLgYXvG+MjPO3pGnjEikhmD0nWaTdOsP52fg
 S/bA==
X-Gm-Message-State: AOAM530kekmaAN5aHYSmM1d+yVy5Jc4xfWLHzfGCAfpxOU8NuPw6ecto
 m53nl2TXVoUev3g9ZPHx3OdwpMOhyRV8n+kQ0j6uHX0DgbA=
X-Google-Smtp-Source: ABdhPJyaCdCvgD8i2F8iFs5MLNbfZ/jdP1My1k93fkcgqPycU38DtFg5Y+mw8fKiQPosH9RqaMFKVsmXHySq9ftS8jU=
X-Received: by 2002:a5d:584e:: with SMTP id i14mr19281306wrf.690.1642680352093; 
 Thu, 20 Jan 2022 04:05:52 -0800 (PST)
MIME-Version: 1.0
References: <20220119152614.27548-1-anup@brainfault.org>
 <20220119152614.27548-19-anup@brainfault.org>
 <CAE_xrPhFzt5Ynd455kfziXrfpOYK2ZUxm8qGFMwyQjxwkR=mEA@mail.gmail.com>
 <CAAhSdy0Tb+LQ1tGKj2GuvME_AcZcTrLqkuZdyZ4Q6WsvSX3zkg@mail.gmail.com>
 <CAE_xrPjANvtsne07nVK_0ezTBH8ckqDU5DektqtMdM7cDuryjw@mail.gmail.com>
In-Reply-To: <CAE_xrPjANvtsne07nVK_0ezTBH8ckqDU5DektqtMdM7cDuryjw@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 20 Jan 2022 17:35:37 +0530
Message-ID: <CAAhSdy3OOy3RPk1CPjr3758tQ9xOTfqms5eM_XTCWQTse0=-Jw@mail.gmail.com>
Subject: Re: [PATCH v8 18/23] hw/intc: Add RISC-V AIA APLIC device emulation
To: Frank Chang <frank.chang@sifive.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atishp@atishpatra.org>, Bin Meng <bmeng.cn@gmail.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::333;
 envelope-from=anup@brainfault.org; helo=mail-wm1-x333.google.com
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
X-List-Received-Date: Thu, 20 Jan 2022 12:05:59 -0000

On Thu, Jan 20, 2022 at 1:49 PM Frank Chang <frank.chang@sifive.com> wrote:
>
> On Thu, Jan 20, 2022 at 12:20 AM Anup Patel <anup@brainfault.org> wrote:
>>
>> Hi Frank,
>>
>> On Wed, Jan 19, 2022 at 9:07 PM Frank Chang <frank.chang@sifive.com> wro=
te:
>> >
>> > On Wed, Jan 19, 2022 at 11:27 PM Anup Patel <anup@brainfault.org> wrot=
e:
>> >>
>> >> From: Anup Patel <anup.patel@wdc.com>
>> >>
>> >> The RISC-V AIA (Advanced Interrupt Architecture) defines a new
>> >> interrupt controller for wired interrupts called APLIC (Advanced
>> >> Platform Level Interrupt Controller). The APLIC is capabable of
>> >> forwarding wired interupts to RISC-V HARTs directly or as MSIs
>> >> (Message Signaled Interupts).
>> >>
>> >> This patch adds device emulation for RISC-V AIA APLIC.
>> >>
>> >> Signed-off-by: Anup Patel <anup.patel@wdc.com>
>> >> Signed-off-by: Anup Patel <anup@brainfault.org>
>> >> Reviewed-by: Frank Chang <frank.chang@sifive.com>
>> >> ---
>> >>  hw/intc/Kconfig               |   3 +
>> >>  hw/intc/meson.build           |   1 +
>> >>  hw/intc/riscv_aplic.c         | 975 ++++++++++++++++++++++++++++++++=
++
>> >>  include/hw/intc/riscv_aplic.h |  79 +++
>> >>  4 files changed, 1058 insertions(+)
>> >>  create mode 100644 hw/intc/riscv_aplic.c
>> >>  create mode 100644 include/hw/intc/riscv_aplic.h
>> >>
>> >> diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
>> >> index 010ded7eae..528e77b4a6 100644
>> >> --- a/hw/intc/Kconfig
>> >> +++ b/hw/intc/Kconfig
>> >> @@ -70,6 +70,9 @@ config LOONGSON_LIOINTC
>> >>  config RISCV_ACLINT
>> >>      bool
>> >>
>> >> +config RISCV_APLIC
>> >> +    bool
>> >> +
>> >>  config SIFIVE_PLIC
>> >>      bool
>> >>
>> >> diff --git a/hw/intc/meson.build b/hw/intc/meson.build
>> >> index 70080bc161..7466024402 100644
>> >> --- a/hw/intc/meson.build
>> >> +++ b/hw/intc/meson.build
>> >> @@ -50,6 +50,7 @@ specific_ss.add(when: 'CONFIG_S390_FLIC', if_true: =
files('s390_flic.c'))
>> >>  specific_ss.add(when: 'CONFIG_S390_FLIC_KVM', if_true: files('s390_f=
lic_kvm.c'))
>> >>  specific_ss.add(when: 'CONFIG_SH_INTC', if_true: files('sh_intc.c'))
>> >>  specific_ss.add(when: 'CONFIG_RISCV_ACLINT', if_true: files('riscv_a=
clint.c'))
>> >> +specific_ss.add(when: 'CONFIG_RISCV_APLIC', if_true: files('riscv_ap=
lic.c'))
>> >>  specific_ss.add(when: 'CONFIG_SIFIVE_PLIC', if_true: files('sifive_p=
lic.c'))
>> >>  specific_ss.add(when: 'CONFIG_XICS', if_true: files('xics.c'))
>> >>  specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_XICS'],
>> >> diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
>> >> new file mode 100644
>> >> index 0000000000..885c1de2af
>> >> --- /dev/null
>> >> +++ b/hw/intc/riscv_aplic.c
>> >> @@ -0,0 +1,975 @@
>> >> +/*
>> >> + * RISC-V APLIC (Advanced Platform Level Interrupt Controller)
>> >> + *
>> >> + * Copyright (c) 2021 Western Digital Corporation or its affiliates.
>> >> + *
>> >> + * This program is free software; you can redistribute it and/or mod=
ify it
>> >> + * under the terms and conditions of the GNU General Public License,
>> >> + * version 2 or later, as published by the Free Software Foundation.
>> >> + *
>> >> + * This program is distributed in the hope it will be useful, but WI=
THOUT
>> >> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILIT=
Y or
>> >> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public Lic=
ense for
>> >> + * more details.
>> >> + *
>> >> + * You should have received a copy of the GNU General Public License=
 along with
>> >> + * this program.  If not, see <http://www.gnu.org/licenses/>.
>> >> + */
>> >> +
>> >> +#include "qemu/osdep.h"
>> >> +#include "qapi/error.h"
>> >> +#include "qemu/log.h"
>> >> +#include "qemu/module.h"
>> >> +#include "qemu/error-report.h"
>> >> +#include "qemu/bswap.h"
>> >> +#include "exec/address-spaces.h"
>> >> +#include "hw/sysbus.h"
>> >> +#include "hw/pci/msi.h"
>> >> +#include "hw/boards.h"
>> >> +#include "hw/qdev-properties.h"
>> >> +#include "hw/intc/riscv_aplic.h"
>> >> +#include "hw/irq.h"
>> >> +#include "target/riscv/cpu.h"
>> >> +#include "sysemu/sysemu.h"
>> >> +#include "migration/vmstate.h"
>> >> +
>> >> +#define APLIC_MAX_IDC                  (1UL << 14)
>> >> +#define APLIC_MAX_SOURCE               1024
>> >> +#define APLIC_MIN_IPRIO_BITS           1
>> >> +#define APLIC_MAX_IPRIO_BITS           8
>> >> +#define APLIC_MAX_CHILDREN             1024
>> >> +
>> >> +#define APLIC_DOMAINCFG                0x0000
>> >> +#define APLIC_DOMAINCFG_RDONLY         0x80000000
>> >> +#define APLIC_DOMAINCFG_IE             (1 << 8)
>> >> +#define APLIC_DOMAINCFG_DM             (1 << 2)
>> >> +#define APLIC_DOMAINCFG_BE             (1 << 0)
>> >> +
>> >> +#define APLIC_SOURCECFG_BASE           0x0004
>> >> +#define APLIC_SOURCECFG_D              (1 << 10)
>> >> +#define APLIC_SOURCECFG_CHILDIDX_MASK  0x000003ff
>> >> +#define APLIC_SOURCECFG_SM_MASK        0x00000007
>> >> +#define APLIC_SOURCECFG_SM_INACTIVE    0x0
>> >> +#define APLIC_SOURCECFG_SM_DETACH      0x1
>> >> +#define APLIC_SOURCECFG_SM_EDGE_RISE   0x4
>> >> +#define APLIC_SOURCECFG_SM_EDGE_FALL   0x5
>> >> +#define APLIC_SOURCECFG_SM_LEVEL_HIGH  0x6
>> >> +#define APLIC_SOURCECFG_SM_LEVEL_LOW   0x7
>> >> +
>> >> +#define APLIC_MMSICFGADDR              0x1bc0
>> >> +#define APLIC_MMSICFGADDRH             0x1bc4
>> >> +#define APLIC_SMSICFGADDR              0x1bc8
>> >> +#define APLIC_SMSICFGADDRH             0x1bcc
>> >> +
>> >> +#define APLIC_xMSICFGADDRH_L           (1UL << 31)
>> >> +#define APLIC_xMSICFGADDRH_HHXS_MASK   0x1f
>> >> +#define APLIC_xMSICFGADDRH_HHXS_SHIFT  24
>> >> +#define APLIC_xMSICFGADDRH_LHXS_MASK   0x7
>> >> +#define APLIC_xMSICFGADDRH_LHXS_SHIFT  20
>> >> +#define APLIC_xMSICFGADDRH_HHXW_MASK   0x7
>> >> +#define APLIC_xMSICFGADDRH_HHXW_SHIFT  16
>> >> +#define APLIC_xMSICFGADDRH_LHXW_MASK   0xf
>> >> +#define APLIC_xMSICFGADDRH_LHXW_SHIFT  12
>> >> +#define APLIC_xMSICFGADDRH_BAPPN_MASK  0xfff
>> >> +
>> >> +#define APLIC_xMSICFGADDR_PPN_SHIFT    12
>> >> +
>> >> +#define APLIC_xMSICFGADDR_PPN_HART(__lhxs) \
>> >> +    ((1UL << (__lhxs)) - 1)
>> >> +
>> >> +#define APLIC_xMSICFGADDR_PPN_LHX_MASK(__lhxw) \
>> >> +    ((1UL << (__lhxw)) - 1)
>> >> +#define APLIC_xMSICFGADDR_PPN_LHX_SHIFT(__lhxs) \
>> >> +    ((__lhxs))
>> >> +#define APLIC_xMSICFGADDR_PPN_LHX(__lhxw, __lhxs) \
>> >> +    (APLIC_xMSICFGADDR_PPN_LHX_MASK(__lhxw) << \
>> >> +     APLIC_xMSICFGADDR_PPN_LHX_SHIFT(__lhxs))
>> >> +
>> >> +#define APLIC_xMSICFGADDR_PPN_HHX_MASK(__hhxw) \
>> >> +    ((1UL << (__hhxw)) - 1)
>> >> +#define APLIC_xMSICFGADDR_PPN_HHX_SHIFT(__hhxs) \
>> >> +    ((__hhxs) + APLIC_xMSICFGADDR_PPN_SHIFT)
>> >> +#define APLIC_xMSICFGADDR_PPN_HHX(__hhxw, __hhxs) \
>> >> +    (APLIC_xMSICFGADDR_PPN_HHX_MASK(__hhxw) << \
>> >> +     APLIC_xMSICFGADDR_PPN_HHX_SHIFT(__hhxs))
>> >> +
>> >> +#define APLIC_xMSICFGADDRH_VALID_MASK   \
>> >> +    (APLIC_xMSICFGADDRH_L | \
>> >> +     (APLIC_xMSICFGADDRH_HHXS_MASK << APLIC_xMSICFGADDRH_HHXS_SHIFT)=
 | \
>> >> +     (APLIC_xMSICFGADDRH_LHXS_MASK << APLIC_xMSICFGADDRH_LHXS_SHIFT)=
 | \
>> >> +     (APLIC_xMSICFGADDRH_HHXW_MASK << APLIC_xMSICFGADDRH_HHXW_SHIFT)=
 | \
>> >> +     (APLIC_xMSICFGADDRH_LHXW_MASK << APLIC_xMSICFGADDRH_LHXW_SHIFT)=
 | \
>> >> +     APLIC_xMSICFGADDRH_BAPPN_MASK)
>> >> +
>> >> +#define APLIC_SETIP_BASE               0x1c00
>> >> +#define APLIC_SETIPNUM                 0x1cdc
>> >> +
>> >> +#define APLIC_CLRIP_BASE               0x1d00
>> >> +#define APLIC_CLRIPNUM                 0x1ddc
>> >> +
>> >> +#define APLIC_SETIE_BASE               0x1e00
>> >> +#define APLIC_SETIENUM                 0x1edc
>> >> +
>> >> +#define APLIC_CLRIE_BASE               0x1f00
>> >> +#define APLIC_CLRIENUM                 0x1fdc
>> >> +
>> >> +#define APLIC_SETIPNUM_LE              0x2000
>> >> +#define APLIC_SETIPNUM_BE              0x2004
>> >> +
>> >> +#define APLIC_ISTATE_PENDING           (1U << 0)
>> >> +#define APLIC_ISTATE_ENABLED           (1U << 1)
>> >> +#define APLIC_ISTATE_ENPEND            (APLIC_ISTATE_ENABLED | \
>> >> +                                        APLIC_ISTATE_PENDING)
>> >> +#define APLIC_ISTATE_INPUT             (1U << 8)
>> >> +
>> >> +#define APLIC_GENMSI                   0x3000
>> >> +
>> >> +#define APLIC_TARGET_BASE              0x3004
>> >> +#define APLIC_TARGET_HART_IDX_SHIFT    18
>> >> +#define APLIC_TARGET_HART_IDX_MASK     0x3fff
>> >> +#define APLIC_TARGET_GUEST_IDX_SHIFT   12
>> >> +#define APLIC_TARGET_GUEST_IDX_MASK    0x3f
>> >> +#define APLIC_TARGET_IPRIO_MASK        0xff
>> >> +#define APLIC_TARGET_EIID_MASK         0x7ff
>> >> +
>> >> +#define APLIC_IDC_BASE                 0x4000
>> >> +#define APLIC_IDC_SIZE                 32
>> >> +
>> >> +#define APLIC_IDC_IDELIVERY            0x00
>> >> +
>> >> +#define APLIC_IDC_IFORCE               0x04
>> >> +
>> >> +#define APLIC_IDC_ITHRESHOLD           0x08
>> >> +
>> >> +#define APLIC_IDC_TOPI                 0x18
>> >> +#define APLIC_IDC_TOPI_ID_SHIFT        16
>> >> +#define APLIC_IDC_TOPI_ID_MASK         0x3ff
>> >> +#define APLIC_IDC_TOPI_PRIO_MASK       0xff
>> >> +
>> >> +#define APLIC_IDC_CLAIMI               0x1c
>> >> +
>> >> +static uint32_t riscv_aplic_read_input_word(RISCVAPLICState *aplic,
>> >> +                                            uint32_t word)
>> >> +{
>> >> +    uint32_t i, irq, ret =3D 0;
>> >> +
>> >> +    for (i =3D 0; i < 32; i++) {
>> >> +        irq =3D word * 32 + i;
>> >> +        if (!irq || aplic->num_irqs <=3D irq) {
>> >> +            continue;
>> >> +        }
>> >> +
>> >> +        ret |=3D ((aplic->state[irq] & APLIC_ISTATE_INPUT) ? 1 : 0) =
<< i;
>> >> +    }
>> >> +
>> >> +    return ret;
>> >> +}
>> >> +
>> >> +static uint32_t riscv_aplic_read_pending_word(RISCVAPLICState *aplic=
,
>> >> +                                              uint32_t word)
>> >> +{
>> >> +    uint32_t i, irq, ret =3D 0;
>> >> +
>> >> +    for (i =3D 0; i < 32; i++) {
>> >> +        irq =3D word * 32 + i;
>> >> +        if (!irq || aplic->num_irqs <=3D irq) {
>> >> +            continue;
>> >> +        }
>> >> +
>> >> +        ret |=3D ((aplic->state[irq] & APLIC_ISTATE_PENDING) ? 1 : 0=
) << i;
>> >> +    }
>> >> +
>> >> +    return ret;
>> >> +}
>> >> +
>> >> +static void riscv_aplic_set_pending_raw(RISCVAPLICState *aplic,
>> >> +                                        uint32_t irq, bool pending)
>> >> +{
>> >> +    if (pending) {
>> >> +        aplic->state[irq] |=3D APLIC_ISTATE_PENDING;
>> >> +    } else {
>> >> +        aplic->state[irq] &=3D ~APLIC_ISTATE_PENDING;
>> >> +    }
>> >> +}
>> >> +
>> >> +static void riscv_aplic_set_pending(RISCVAPLICState *aplic,
>> >> +                                    uint32_t irq, bool pending)
>> >> +{
>> >> +    uint32_t sourcecfg, sm;
>> >> +
>> >> +    if ((irq <=3D 0) || (aplic->num_irqs <=3D irq)) {
>> >> +        return;
>> >> +    }
>> >> +
>> >> +    sourcecfg =3D aplic->sourcecfg[irq];
>> >> +    if (sourcecfg & APLIC_SOURCECFG_D) {
>> >> +        return;
>> >> +    }
>> >> +
>> >> +    sm =3D sourcecfg & APLIC_SOURCECFG_SM_MASK;
>> >> +    if ((sm =3D=3D APLIC_SOURCECFG_SM_INACTIVE) ||
>> >> +        ((!aplic->msimode || (aplic->msimode && !pending)) &&
>> >> +         ((sm =3D=3D APLIC_SOURCECFG_SM_LEVEL_HIGH) ||
>> >> +          (sm =3D=3D APLIC_SOURCECFG_SM_LEVEL_LOW)))) {
>> >> +        return;
>> >> +    }
>> >> +
>> >> +    riscv_aplic_set_pending_raw(aplic, irq, pending);
>> >> +}
>> >> +
>> >> +static void riscv_aplic_set_pending_word(RISCVAPLICState *aplic,
>> >> +                                         uint32_t word, uint32_t val=
ue,
>> >> +                                         bool pending)
>> >> +{
>> >> +    uint32_t i, irq;
>> >> +
>> >> +    for (i =3D 0; i < 32; i++) {
>> >> +        irq =3D word * 32 + i;
>> >> +        if (!irq || aplic->num_irqs <=3D irq) {
>> >> +            continue;
>> >> +        }
>> >> +
>> >> +        if (value & (1U << i)) {
>> >> +            riscv_aplic_set_pending(aplic, irq, pending);
>> >> +        }
>> >> +    }
>> >> +}
>> >> +
>> >> +static uint32_t riscv_aplic_read_enabled_word(RISCVAPLICState *aplic=
,
>> >> +                                              int word)
>> >> +{
>> >> +    uint32_t i, irq, ret =3D 0;
>> >> +
>> >> +    for (i =3D 0; i < 32; i++) {
>> >> +        irq =3D word * 32 + i;
>> >> +        if (!irq || aplic->num_irqs <=3D irq) {
>> >> +            continue;
>> >> +        }
>> >> +
>> >> +        ret |=3D ((aplic->state[irq] & APLIC_ISTATE_ENABLED) ? 1 : 0=
) << i;
>> >> +    }
>> >> +
>> >> +    return ret;
>> >> +}
>> >> +
>> >> +static void riscv_aplic_set_enabled_raw(RISCVAPLICState *aplic,
>> >> +                                        uint32_t irq, bool enabled)
>> >> +{
>> >> +    if (enabled) {
>> >> +        aplic->state[irq] |=3D APLIC_ISTATE_ENABLED;
>> >> +    } else {
>> >> +        aplic->state[irq] &=3D ~APLIC_ISTATE_ENABLED;
>> >> +    }
>> >> +}
>> >> +
>> >> +static void riscv_aplic_set_enabled(RISCVAPLICState *aplic,
>> >> +                                    uint32_t irq, bool enabled)
>> >> +{
>> >> +    uint32_t sourcecfg, sm;
>> >> +
>> >> +    if ((irq <=3D 0) || (aplic->num_irqs <=3D irq)) {
>> >> +        return;
>> >> +    }
>> >> +
>> >> +    sourcecfg =3D aplic->sourcecfg[irq];
>> >> +    if (sourcecfg & APLIC_SOURCECFG_D) {
>> >> +        return;
>> >> +    }
>> >> +
>> >> +    sm =3D sourcecfg & APLIC_SOURCECFG_SM_MASK;
>> >> +    if (sm =3D=3D APLIC_SOURCECFG_SM_INACTIVE) {
>> >> +        return;
>> >> +    }
>> >> +
>> >> +    riscv_aplic_set_enabled_raw(aplic, irq, enabled);
>> >> +}
>> >> +
>> >> +static void riscv_aplic_set_enabled_word(RISCVAPLICState *aplic,
>> >> +                                         uint32_t word, uint32_t val=
ue,
>> >> +                                         bool enabled)
>> >> +{
>> >> +    uint32_t i, irq;
>> >> +
>> >> +    for (i =3D 0; i < 32; i++) {
>> >> +        irq =3D word * 32 + i;
>> >> +        if (!irq || aplic->num_irqs <=3D irq) {
>> >> +            continue;
>> >> +        }
>> >> +
>> >> +        if (value & (1U << i)) {
>> >> +            riscv_aplic_set_enabled(aplic, irq, enabled);
>> >> +        }
>> >> +    }
>> >> +}
>> >> +
>> >> +static void riscv_aplic_msi_send(RISCVAPLICState *aplic,
>> >> +                                 uint32_t hart_idx, uint32_t guest_i=
dx,
>> >> +                                 uint32_t eiid)
>> >> +{
>> >> +    uint64_t addr;
>> >> +    MemTxResult result;
>> >> +    RISCVAPLICState *aplic_m;
>> >> +    uint32_t lhxs, lhxw, hhxs, hhxw, group_idx, msicfgaddr, msicfgad=
drH;
>> >> +
>> >> +    aplic_m =3D aplic;
>> >> +    while (aplic_m && !aplic_m->mmode) {
>> >> +        aplic_m =3D aplic_m->parent;
>> >> +    }
>> >> +    if (!aplic_m) {
>> >> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: m-level APLIC not found\=
n",
>> >> +                      __func__);
>> >> +        return;
>> >> +    }
>> >> +
>> >> +    if (aplic->mmode) {
>> >> +        msicfgaddr =3D aplic_m->mmsicfgaddr;
>> >> +        msicfgaddrH =3D aplic_m->mmsicfgaddrH;
>> >> +    } else {
>> >> +        msicfgaddr =3D aplic_m->smsicfgaddr;
>> >> +        msicfgaddrH =3D aplic_m->smsicfgaddrH;
>> >> +    }
>> >> +
>> >> +    lhxs =3D (msicfgaddrH >> APLIC_xMSICFGADDRH_LHXS_SHIFT) &
>> >> +            APLIC_xMSICFGADDRH_LHXS_MASK;
>> >> +    lhxw =3D (msicfgaddrH >> APLIC_xMSICFGADDRH_LHXW_SHIFT) &
>> >> +            APLIC_xMSICFGADDRH_LHXW_MASK;
>> >> +    hhxs =3D (msicfgaddrH >> APLIC_xMSICFGADDRH_HHXS_SHIFT) &
>> >> +            APLIC_xMSICFGADDRH_HHXS_MASK;
>> >> +    hhxw =3D (msicfgaddrH >> APLIC_xMSICFGADDRH_HHXW_SHIFT) &
>> >> +            APLIC_xMSICFGADDRH_HHXW_MASK;
>> >> +
>> >> +    group_idx =3D hart_idx >> lhxw;
>> >> +    hart_idx &=3D APLIC_xMSICFGADDR_PPN_LHX_MASK(lhxw);
>> >> +
>> >> +    addr =3D msicfgaddr;
>> >> +    addr |=3D ((uint64_t)(msicfgaddrH & APLIC_xMSICFGADDRH_BAPPN_MAS=
K)) << 32;
>> >> +    addr |=3D ((uint64_t)(group_idx & APLIC_xMSICFGADDR_PPN_HHX_MASK=
(hhxw))) <<
>> >> +             APLIC_xMSICFGADDR_PPN_HHX_SHIFT(hhxs);
>> >> +    addr |=3D ((uint64_t)(hart_idx & APLIC_xMSICFGADDR_PPN_LHX_MASK(=
lhxw))) <<
>> >> +             APLIC_xMSICFGADDR_PPN_LHX_SHIFT(lhxs);
>> >> +    addr |=3D (uint64_t)(guest_idx & APLIC_xMSICFGADDR_PPN_HART(lhxs=
));
>> >> +    addr <<=3D APLIC_xMSICFGADDR_PPN_SHIFT;
>> >> +
>> >> +    address_space_stl_le(&address_space_memory, addr,
>> >> +                         eiid, MEMTXATTRS_UNSPECIFIED, &result);
>> >> +    if (result !=3D MEMTX_OK) {
>> >> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: MSI write failed for "
>> >> +                      "hart_index=3D%d guest_index=3D%d eiid=3D%d\n"=
,
>> >> +                      __func__, hart_idx, guest_idx, eiid);
>> >> +    }
>> >> +}
>> >> +
>> >> +static void riscv_aplic_msi_irq_update(RISCVAPLICState *aplic, uint3=
2_t irq)
>> >> +{
>> >> +    uint32_t hart_idx, guest_idx, eiid;
>> >> +
>> >> +    if (!aplic->msimode || (aplic->num_irqs <=3D irq) ||
>> >> +        !(aplic->domaincfg & APLIC_DOMAINCFG_IE)) {
>> >> +        return;
>> >> +    }
>> >> +
>> >> +    if ((aplic->state[irq] & APLIC_ISTATE_ENPEND) !=3D APLIC_ISTATE_=
ENPEND) {
>> >> +        return;
>> >> +    }
>> >> +
>> >> +    riscv_aplic_set_pending_raw(aplic, irq, false);
>> >> +
>> >> +    hart_idx =3D aplic->target[irq] >> APLIC_TARGET_HART_IDX_SHIFT;
>> >> +    hart_idx &=3D APLIC_TARGET_HART_IDX_MASK;
>> >
>> >
>> > Hi Anup,
>> >
>> > I'm wondering does the hart_idx here has to use Machine-level hart ind=
ex
>> > for Supervisor-level interrupt domain?
>> >
>> > According to AIA spec for supervisor-level domin (Section 4.8.1):
>> >   For a supervisor-level domain, "if" MSI target addresses are determi=
ned by the parent domain=E2=80=99s
>> >   smsiaddrcfg and smsiaddrcfgh registers, then to construct the addres=
s for an outgoing MSI for
>> >   interrupt source i, the Hart Index from register target[i] must firs=
t be converted into the index
>> >   that the machine-level parent domain uses for the same hart. (Typica=
lly, these numbers are the
>> >   same, but they may not be.) The address for the MSI is then computed=
 using this "machine-level"
>> >   hart index, the parent domain=E2=80=99s smsiaddrcfg and smsiaddrcfgh=
, and the Guest Index value from
>> >   target[i].
>> >
>> > The description of converting target[i] hart Index to machine-level ha=
rt index in the spec
>> > is quite vague to me.
>>
>> The "Section 4.3 Hart index numbers" states the following:
>>
>>     The index number a domain associates with a hart may or may not
>> have any relationship
>>     to the unique hart identifier (=E2=80=9Chart ID=E2=80=9D) that the R=
ISC-V
>> Privileged Architecture assigns to
>>     the hart.
>>
>> For APLIC direct mode, if N harts are associated with a given domain
>> then APLIC associates
>> hart index from 0 to N-1 which are basically APLIC IDC numbers. In
>> this case, the APLIC
>> hart index is not related to "machine-level" hart index so software
>> has to discover it from the
>> "interrupt-extended" DT property (or similar for ACPI).
>>
>> For APLIC msi mode, the APLIC can basically target any HART using inform=
ation in
>> [m|s]msiaddrcfg registers and interrupt target registers. In this
>> case, the APLIC hart
>> index in the APLIC target register is a combination of IMSIC group
>> index (g) and IMSIC
>> hart index (h) and the APLIC target register also provides IMSIC guest
>> index. In other
>> words, the APLIC hart index for msi mode is also not related to the
>> "machine-level" hart
>> index. The APLIC driver will figure-out/extract the IMSIC group index
>> (g), IMSIC hart
>> index (h), and IMSIC guest index from target MSI address when Linux
>> tries to write
>> target MSI address for a particular APLIC interrupt.
>>
>> Regards,
>> Anup
>
>
> Hi Anup,
>
> Thanks for the detailed explanation.
>
> I think it's the formula in the AIA spec which confused me:
>   g =3D (machine-level hart index >> LHXW) & (2^HHXW =E2=88=92 1)
>   h =3D machine-level hart index & (2^LHXW =E2=88=92 1)
>   MSI address =3D  (Base PPN | (g << (HHXS + 12)) | (h << LHXS) | Guest I=
ndex) << 12
>
> The term "machine-level hart index" makes me thought that
> we should use the hart index from parent machine-level interrupt domain.

Yes, the term "machine-level hart index" is confusing. In reality, it is th=
e
"hart index" in the APLIC interrupt target registers.

>
> So it's driver's responsibility to figure out the correct IMSIC hart inde=
x, guest index
> it wants to forward the MSI to and configure them to the target[i] regist=
er?

Yes, that's correct.

>
> From hardware (QEMU)'s perspective, it just needs to extract
> the Hart index, Guest index out from target[irq] register in IRQ's interr=
upt domain
> and calculate the MSI address with the PPN from parent interrupt domain's
> m/smsiaddrcfg and m/smsiaddrcfgh?

Yes, that's correct.

The [m|s]msiaddrcfg registers are only available in the root APLIC domain
and M-mode runtime firmware (OpenSBI) has to initialize it correctly.

The APLIC Linux/OS driver has to ensure that APLIC interrupt target registe=
rs
are programmed properly so that APLIC can generate the correct output MSI
address.

Regards,
Anup

>
> Regards,
> Frank Chang
>
>>
>>
>> >
>> > Regards,
>> > Frank Chang
>> >
>> >>
>> >> +    if (aplic->mmode) {
>> >> +        /* M-level APLIC ignores guest_index */
>> >> +        guest_idx =3D 0;
>> >> +    } else {
>> >> +        guest_idx =3D aplic->target[irq] >> APLIC_TARGET_GUEST_IDX_S=
HIFT;
>> >> +        guest_idx &=3D APLIC_TARGET_GUEST_IDX_MASK;
>> >> +    }
>> >> +    eiid =3D aplic->target[irq] & APLIC_TARGET_EIID_MASK;
>> >> +    riscv_aplic_msi_send(aplic, hart_idx, guest_idx, eiid);
>> >> +}
>> >> +
>> >> +static uint32_t riscv_aplic_idc_topi(RISCVAPLICState *aplic, uint32_=
t idc)
>> >> +{
>> >> +    uint32_t best_irq, best_iprio;
>> >> +    uint32_t irq, iprio, ihartidx, ithres;
>> >> +
>> >> +    if (aplic->num_harts <=3D idc) {
>> >> +        return 0;
>> >> +    }
>> >> +
>> >> +    ithres =3D aplic->ithreshold[idc];
>> >> +    best_irq =3D best_iprio =3D UINT32_MAX;
>> >> +    for (irq =3D 1; irq < aplic->num_irqs; irq++) {
>> >> +        if ((aplic->state[irq] & APLIC_ISTATE_ENPEND) !=3D
>> >> +            APLIC_ISTATE_ENPEND) {
>> >> +            continue;
>> >> +        }
>> >> +
>> >> +        ihartidx =3D aplic->target[irq] >> APLIC_TARGET_HART_IDX_SHI=
FT;
>> >> +        ihartidx &=3D APLIC_TARGET_HART_IDX_MASK;
>> >> +        if (ihartidx !=3D idc) {
>> >> +            continue;
>> >> +        }
>> >> +
>> >> +        iprio =3D aplic->target[irq] & aplic->iprio_mask;
>> >> +        if (ithres && iprio >=3D ithres) {
>> >> +            continue;
>> >> +        }
>> >> +
>> >> +        if (iprio < best_iprio) {
>> >> +            best_irq =3D irq;
>> >> +            best_iprio =3D iprio;
>> >> +        }
>> >> +    }
>> >> +
>> >> +    if (best_irq < aplic->num_irqs && best_iprio <=3D aplic->iprio_m=
ask) {
>> >> +        return (best_irq << APLIC_IDC_TOPI_ID_SHIFT) | best_iprio;
>> >> +    }
>> >> +
>> >> +    return 0;
>> >> +}
>> >> +
>> >> +static void riscv_aplic_idc_update(RISCVAPLICState *aplic, uint32_t =
idc)
>> >> +{
>> >> +    uint32_t topi;
>> >> +
>> >> +    if (aplic->msimode || aplic->num_harts <=3D idc) {
>> >> +        return;
>> >> +    }
>> >> +
>> >> +    topi =3D riscv_aplic_idc_topi(aplic, idc);
>> >> +    if ((aplic->domaincfg & APLIC_DOMAINCFG_IE) &&
>> >> +        aplic->idelivery[idc] &&
>> >> +        (aplic->iforce[idc] || topi)) {
>> >> +        qemu_irq_raise(aplic->external_irqs[idc]);
>> >> +    } else {
>> >> +        qemu_irq_lower(aplic->external_irqs[idc]);
>> >> +    }
>> >> +}
>> >> +
>> >> +static uint32_t riscv_aplic_idc_claimi(RISCVAPLICState *aplic, uint3=
2_t idc)
>> >> +{
>> >> +    uint32_t irq, state, sm, topi =3D riscv_aplic_idc_topi(aplic, id=
c);
>> >> +
>> >> +    if (!topi) {
>> >> +        aplic->iforce[idc] =3D 0;
>> >> +        return 0;
>> >> +    }
>> >> +
>> >> +    irq =3D (topi >> APLIC_IDC_TOPI_ID_SHIFT) & APLIC_IDC_TOPI_ID_MA=
SK;
>> >> +    sm =3D aplic->sourcecfg[irq] & APLIC_SOURCECFG_SM_MASK;
>> >> +    state =3D aplic->state[irq];
>> >> +    riscv_aplic_set_pending_raw(aplic, irq, false);
>> >> +    if ((sm =3D=3D APLIC_SOURCECFG_SM_LEVEL_HIGH) &&
>> >> +        (state & APLIC_ISTATE_INPUT)) {
>> >> +        riscv_aplic_set_pending_raw(aplic, irq, true);
>> >> +    } else if ((sm =3D=3D APLIC_SOURCECFG_SM_LEVEL_LOW) &&
>> >> +               !(state & APLIC_ISTATE_INPUT)) {
>> >> +        riscv_aplic_set_pending_raw(aplic, irq, true);
>> >> +    }
>> >> +    riscv_aplic_idc_update(aplic, idc);
>> >> +
>> >> +    return topi;
>> >> +}
>> >> +
>> >> +static void riscv_aplic_request(void *opaque, int irq, int level)
>> >> +{
>> >> +    bool update =3D false;
>> >> +    RISCVAPLICState *aplic =3D opaque;
>> >> +    uint32_t sourcecfg, childidx, state, idc;
>> >> +
>> >> +    assert((0 < irq) && (irq < aplic->num_irqs));
>> >> +
>> >> +    sourcecfg =3D aplic->sourcecfg[irq];
>> >> +    if (sourcecfg & APLIC_SOURCECFG_D) {
>> >> +        childidx =3D sourcecfg & APLIC_SOURCECFG_CHILDIDX_MASK;
>> >> +        if (childidx < aplic->num_children) {
>> >> +            riscv_aplic_request(aplic->children[childidx], irq, leve=
l);
>> >> +        }
>> >> +        return;
>> >> +    }
>> >> +
>> >> +    state =3D aplic->state[irq];
>> >> +    switch (sourcecfg & APLIC_SOURCECFG_SM_MASK) {
>> >> +    case APLIC_SOURCECFG_SM_EDGE_RISE:
>> >> +        if ((level > 0) && !(state & APLIC_ISTATE_INPUT) &&
>> >> +            !(state & APLIC_ISTATE_PENDING)) {
>> >> +            riscv_aplic_set_pending_raw(aplic, irq, true);
>> >> +            update =3D true;
>> >> +        }
>> >> +        break;
>> >> +    case APLIC_SOURCECFG_SM_EDGE_FALL:
>> >> +        if ((level <=3D 0) && (state & APLIC_ISTATE_INPUT) &&
>> >> +            !(state & APLIC_ISTATE_PENDING)) {
>> >> +            riscv_aplic_set_pending_raw(aplic, irq, true);
>> >> +            update =3D true;
>> >> +        }
>> >> +        break;
>> >> +    case APLIC_SOURCECFG_SM_LEVEL_HIGH:
>> >> +        if ((level > 0) && !(state & APLIC_ISTATE_PENDING)) {
>> >> +            riscv_aplic_set_pending_raw(aplic, irq, true);
>> >> +            update =3D true;
>> >> +        }
>> >> +        break;
>> >> +    case APLIC_SOURCECFG_SM_LEVEL_LOW:
>> >> +        if ((level <=3D 0) && !(state & APLIC_ISTATE_PENDING)) {
>> >> +            riscv_aplic_set_pending_raw(aplic, irq, true);
>> >> +            update =3D true;
>> >> +        }
>> >> +        break;
>> >> +    default:
>> >> +        break;
>> >> +    }
>> >> +
>> >> +    if (level <=3D 0) {
>> >> +        aplic->state[irq] &=3D ~APLIC_ISTATE_INPUT;
>> >> +    } else {
>> >> +        aplic->state[irq] |=3D APLIC_ISTATE_INPUT;
>> >> +    }
>> >> +
>> >> +    if (update) {
>> >> +        if (aplic->msimode) {
>> >> +            riscv_aplic_msi_irq_update(aplic, irq);
>> >> +        } else {
>> >> +            idc =3D aplic->target[irq] >> APLIC_TARGET_HART_IDX_SHIF=
T;
>> >> +            idc &=3D APLIC_TARGET_HART_IDX_MASK;
>> >> +            riscv_aplic_idc_update(aplic, idc);
>> >> +        }
>> >> +    }
>> >> +}
>> >> +
>> >> +static uint64_t riscv_aplic_read(void *opaque, hwaddr addr, unsigned=
 size)
>> >> +{
>> >> +    uint32_t irq, word, idc;
>> >> +    RISCVAPLICState *aplic =3D opaque;
>> >> +
>> >> +    /* Reads must be 4 byte words */
>> >> +    if ((addr & 0x3) !=3D 0) {
>> >> +        goto err;
>> >> +    }
>> >> +
>> >> +    if (addr =3D=3D APLIC_DOMAINCFG) {
>> >> +        return APLIC_DOMAINCFG_RDONLY | aplic->domaincfg |
>> >> +               (aplic->msimode ? APLIC_DOMAINCFG_DM : 0);
>> >> +    } else if ((APLIC_SOURCECFG_BASE <=3D addr) &&
>> >> +            (addr < (APLIC_SOURCECFG_BASE + (aplic->num_irqs - 1) * =
4))) {
>> >> +        irq  =3D ((addr - APLIC_SOURCECFG_BASE) >> 2) + 1;
>> >> +        return aplic->sourcecfg[irq];
>> >> +    } else if (aplic->mmode && aplic->msimode &&
>> >> +               (addr =3D=3D APLIC_MMSICFGADDR)) {
>> >> +        return aplic->mmsicfgaddr;
>> >> +    } else if (aplic->mmode && aplic->msimode &&
>> >> +               (addr =3D=3D APLIC_MMSICFGADDRH)) {
>> >> +        return aplic->mmsicfgaddrH;
>> >> +    } else if (aplic->mmode && aplic->msimode &&
>> >> +               (addr =3D=3D APLIC_SMSICFGADDR)) {
>> >> +        /* Registers SMSICFGADDR and SMSICFGADDRH are implemented on=
ly if:
>> >> +         * (a) the interrupt domain is at machine level
>> >> +         * (b) the domain=E2=80=99s harts implement supervisor mode
>> >> +         * (c) the domain has one or more child supervisor-level dom=
ains
>> >> +         *     that support MSI delivery mode (domaincfg.DM is not r=
ead-
>> >> +         *     only zero in at least one of the supervisor-level chi=
ld
>> >> +         * domains).
>> >> +         */
>> >> +        return (aplic->num_children) ? aplic->smsicfgaddr : 0;
>> >> +    } else if (aplic->mmode && aplic->msimode &&
>> >> +               (addr =3D=3D APLIC_SMSICFGADDRH)) {
>> >> +        return (aplic->num_children) ? aplic->smsicfgaddrH : 0;
>> >> +    } else if ((APLIC_SETIP_BASE <=3D addr) &&
>> >> +            (addr < (APLIC_SETIP_BASE + aplic->bitfield_words * 4)))=
 {
>> >> +        word =3D (addr - APLIC_SETIP_BASE) >> 2;
>> >> +        return riscv_aplic_read_pending_word(aplic, word);
>> >> +    } else if (addr =3D=3D APLIC_SETIPNUM) {
>> >> +        return 0;
>> >> +    } else if ((APLIC_CLRIP_BASE <=3D addr) &&
>> >> +            (addr < (APLIC_CLRIP_BASE + aplic->bitfield_words * 4)))=
 {
>> >> +        word =3D (addr - APLIC_CLRIP_BASE) >> 2;
>> >> +        return riscv_aplic_read_input_word(aplic, word);
>> >> +    } else if (addr =3D=3D APLIC_CLRIPNUM) {
>> >> +        return 0;
>> >> +    } else if ((APLIC_SETIE_BASE <=3D addr) &&
>> >> +            (addr < (APLIC_SETIE_BASE + aplic->bitfield_words * 4)))=
 {
>> >> +        word =3D (addr - APLIC_SETIE_BASE) >> 2;
>> >> +        return riscv_aplic_read_enabled_word(aplic, word);
>> >> +    } else if (addr =3D=3D APLIC_SETIENUM) {
>> >> +        return 0;
>> >> +    } else if ((APLIC_CLRIE_BASE <=3D addr) &&
>> >> +            (addr < (APLIC_CLRIE_BASE + aplic->bitfield_words * 4)))=
 {
>> >> +        return 0;
>> >> +    } else if (addr =3D=3D APLIC_CLRIENUM) {
>> >> +        return 0;
>> >> +    } else if (addr =3D=3D APLIC_SETIPNUM_LE) {
>> >> +        return 0;
>> >> +    } else if (addr =3D=3D APLIC_SETIPNUM_BE) {
>> >> +        return 0;
>> >> +    } else if (addr =3D=3D APLIC_GENMSI) {
>> >> +        return (aplic->msimode) ? aplic->genmsi : 0;
>> >> +    } else if ((APLIC_TARGET_BASE <=3D addr) &&
>> >> +            (addr < (APLIC_TARGET_BASE + (aplic->num_irqs - 1) * 4))=
) {
>> >> +        irq =3D ((addr - APLIC_TARGET_BASE) >> 2) + 1;
>> >> +        return aplic->target[irq];
>> >> +    } else if (!aplic->msimode && (APLIC_IDC_BASE <=3D addr) &&
>> >> +            (addr < (APLIC_IDC_BASE + aplic->num_harts * APLIC_IDC_S=
IZE))) {
>> >> +        idc =3D (addr - APLIC_IDC_BASE) / APLIC_IDC_SIZE;
>> >> +        switch (addr - (APLIC_IDC_BASE + idc * APLIC_IDC_SIZE)) {
>> >> +        case APLIC_IDC_IDELIVERY:
>> >> +            return aplic->idelivery[idc];
>> >> +        case APLIC_IDC_IFORCE:
>> >> +            return aplic->iforce[idc];
>> >> +        case APLIC_IDC_ITHRESHOLD:
>> >> +            return aplic->ithreshold[idc];
>> >> +        case APLIC_IDC_TOPI:
>> >> +            return riscv_aplic_idc_topi(aplic, idc);
>> >> +        case APLIC_IDC_CLAIMI:
>> >> +            return riscv_aplic_idc_claimi(aplic, idc);
>> >> +        default:
>> >> +            goto err;
>> >> +        };
>> >> +    }
>> >> +
>> >> +err:
>> >> +    qemu_log_mask(LOG_GUEST_ERROR,
>> >> +                  "%s: Invalid register read 0x%" HWADDR_PRIx "\n",
>> >> +                  __func__, addr);
>> >> +    return 0;
>> >> +}
>> >> +
>> >> +static void riscv_aplic_write(void *opaque, hwaddr addr, uint64_t va=
lue,
>> >> +        unsigned size)
>> >> +{
>> >> +    RISCVAPLICState *aplic =3D opaque;
>> >> +    uint32_t irq, word, idc =3D UINT32_MAX;
>> >> +
>> >> +    /* Writes must be 4 byte words */
>> >> +    if ((addr & 0x3) !=3D 0) {
>> >> +        goto err;
>> >> +    }
>> >> +
>> >> +    if (addr =3D=3D APLIC_DOMAINCFG) {
>> >> +        /* Only IE bit writeable at the moment */
>> >> +        value &=3D APLIC_DOMAINCFG_IE;
>> >> +        aplic->domaincfg =3D value;
>> >> +    } else if ((APLIC_SOURCECFG_BASE <=3D addr) &&
>> >> +            (addr < (APLIC_SOURCECFG_BASE + (aplic->num_irqs - 1) * =
4))) {
>> >> +        irq  =3D ((addr - APLIC_SOURCECFG_BASE) >> 2) + 1;
>> >> +        if (!aplic->num_children && (value & APLIC_SOURCECFG_D)) {
>> >> +            value =3D 0;
>> >> +        }
>> >> +        if (value & APLIC_SOURCECFG_D) {
>> >> +            value &=3D (APLIC_SOURCECFG_D | APLIC_SOURCECFG_CHILDIDX=
_MASK);
>> >> +        } else {
>> >> +            value &=3D (APLIC_SOURCECFG_D | APLIC_SOURCECFG_SM_MASK)=
;
>> >> +        }
>> >> +        aplic->sourcecfg[irq] =3D value;
>> >> +        if ((aplic->sourcecfg[irq] & APLIC_SOURCECFG_D) ||
>> >> +            (aplic->sourcecfg[irq] =3D=3D 0)) {
>> >> +            riscv_aplic_set_pending_raw(aplic, irq, false);
>> >> +            riscv_aplic_set_enabled_raw(aplic, irq, false);
>> >> +        }
>> >> +    } else if (aplic->mmode && aplic->msimode &&
>> >> +               (addr =3D=3D APLIC_MMSICFGADDR)) {
>> >> +        if (!(aplic->mmsicfgaddrH & APLIC_xMSICFGADDRH_L)) {
>> >> +            aplic->mmsicfgaddr =3D value;
>> >> +        }
>> >> +    } else if (aplic->mmode && aplic->msimode &&
>> >> +               (addr =3D=3D APLIC_MMSICFGADDRH)) {
>> >> +        if (!(aplic->mmsicfgaddrH & APLIC_xMSICFGADDRH_L)) {
>> >> +            aplic->mmsicfgaddrH =3D value & APLIC_xMSICFGADDRH_VALID=
_MASK;
>> >> +        }
>> >> +    } else if (aplic->mmode && aplic->msimode &&
>> >> +               (addr =3D=3D APLIC_SMSICFGADDR)) {
>> >> +        /* Registers SMSICFGADDR and SMSICFGADDRH are implemented on=
ly if:
>> >> +         * (a) the interrupt domain is at machine level
>> >> +         * (b) the domain=E2=80=99s harts implement supervisor mode
>> >> +         * (c) the domain has one or more child supervisor-level dom=
ains
>> >> +         *     that support MSI delivery mode (domaincfg.DM is not r=
ead-
>> >> +         *     only zero in at least one of the supervisor-level chi=
ld
>> >> +         * domains).
>> >> +         */
>> >> +        if (aplic->num_children &&
>> >> +            !(aplic->smsicfgaddrH & APLIC_xMSICFGADDRH_L)) {
>> >> +            aplic->smsicfgaddr =3D value;
>> >> +        }
>> >> +    } else if (aplic->mmode && aplic->msimode &&
>> >> +               (addr =3D=3D APLIC_SMSICFGADDRH)) {
>> >> +        if (aplic->num_children &&
>> >> +            !(aplic->smsicfgaddrH & APLIC_xMSICFGADDRH_L)) {
>> >> +            aplic->smsicfgaddrH =3D value & APLIC_xMSICFGADDRH_VALID=
_MASK;
>> >> +        }
>> >> +    } else if ((APLIC_SETIP_BASE <=3D addr) &&
>> >> +            (addr < (APLIC_SETIP_BASE + aplic->bitfield_words * 4)))=
 {
>> >> +        word =3D (addr - APLIC_SETIP_BASE) >> 2;
>> >> +        riscv_aplic_set_pending_word(aplic, word, value, true);
>> >> +    } else if (addr =3D=3D APLIC_SETIPNUM) {
>> >> +        riscv_aplic_set_pending(aplic, value, true);
>> >> +    } else if ((APLIC_CLRIP_BASE <=3D addr) &&
>> >> +            (addr < (APLIC_CLRIP_BASE + aplic->bitfield_words * 4)))=
 {
>> >> +        word =3D (addr - APLIC_CLRIP_BASE) >> 2;
>> >> +        riscv_aplic_set_pending_word(aplic, word, value, false);
>> >> +    } else if (addr =3D=3D APLIC_CLRIPNUM) {
>> >> +        riscv_aplic_set_pending(aplic, value, false);
>> >> +    } else if ((APLIC_SETIE_BASE <=3D addr) &&
>> >> +            (addr < (APLIC_SETIE_BASE + aplic->bitfield_words * 4)))=
 {
>> >> +        word =3D (addr - APLIC_SETIE_BASE) >> 2;
>> >> +        riscv_aplic_set_enabled_word(aplic, word, value, true);
>> >> +    } else if (addr =3D=3D APLIC_SETIENUM) {
>> >> +        riscv_aplic_set_enabled(aplic, value, true);
>> >> +    } else if ((APLIC_CLRIE_BASE <=3D addr) &&
>> >> +            (addr < (APLIC_CLRIE_BASE + aplic->bitfield_words * 4)))=
 {
>> >> +        word =3D (addr - APLIC_CLRIE_BASE) >> 2;
>> >> +        riscv_aplic_set_enabled_word(aplic, word, value, false);
>> >> +    } else if (addr =3D=3D APLIC_CLRIENUM) {
>> >> +        riscv_aplic_set_enabled(aplic, value, false);
>> >> +    } else if (addr =3D=3D APLIC_SETIPNUM_LE) {
>> >> +        riscv_aplic_set_pending(aplic, value, true);
>> >> +    } else if (addr =3D=3D APLIC_SETIPNUM_BE) {
>> >> +        riscv_aplic_set_pending(aplic, bswap32(value), true);
>> >> +    } else if (addr =3D=3D APLIC_GENMSI) {
>> >> +        if (aplic->msimode) {
>> >> +            aplic->genmsi =3D value & ~(APLIC_TARGET_GUEST_IDX_MASK =
<<
>> >> +                                      APLIC_TARGET_GUEST_IDX_SHIFT);
>> >> +            riscv_aplic_msi_send(aplic,
>> >> +                                 value >> APLIC_TARGET_HART_IDX_SHIF=
T,
>> >> +                                 0,
>> >> +                                 value & APLIC_TARGET_EIID_MASK);
>> >> +        }
>> >> +    } else if ((APLIC_TARGET_BASE <=3D addr) &&
>> >> +            (addr < (APLIC_TARGET_BASE + (aplic->num_irqs - 1) * 4))=
) {
>> >> +        irq =3D ((addr - APLIC_TARGET_BASE) >> 2) + 1;
>> >> +        if (aplic->msimode) {
>> >> +            aplic->target[irq] =3D value;
>> >> +        } else {
>> >> +            aplic->target[irq] =3D (value & ~APLIC_TARGET_IPRIO_MASK=
) |
>> >> +                                 ((value & aplic->iprio_mask) ?
>> >> +                                  (value & aplic->iprio_mask) : 1);
>> >> +        }
>> >> +    } else if (!aplic->msimode && (APLIC_IDC_BASE <=3D addr) &&
>> >> +            (addr < (APLIC_IDC_BASE + aplic->num_harts * APLIC_IDC_S=
IZE))) {
>> >> +        idc =3D (addr - APLIC_IDC_BASE) / APLIC_IDC_SIZE;
>> >> +        switch (addr - (APLIC_IDC_BASE + idc * APLIC_IDC_SIZE)) {
>> >> +        case APLIC_IDC_IDELIVERY:
>> >> +            aplic->idelivery[idc] =3D value & 0x1;
>> >> +            break;
>> >> +        case APLIC_IDC_IFORCE:
>> >> +            aplic->iforce[idc] =3D value & 0x1;
>> >> +            break;
>> >> +        case APLIC_IDC_ITHRESHOLD:
>> >> +            aplic->ithreshold[idc] =3D value & aplic->iprio_mask;
>> >> +            break;
>> >> +        default:
>> >> +            goto err;
>> >> +        };
>> >> +    } else {
>> >> +        goto err;
>> >> +    }
>> >> +
>> >> +    if (aplic->msimode) {
>> >> +        for (irq =3D 1; irq < aplic->num_irqs; irq++) {
>> >> +            riscv_aplic_msi_irq_update(aplic, irq);
>> >> +        }
>> >> +    } else {
>> >> +        if (idc =3D=3D UINT32_MAX) {
>> >> +            for (idc =3D 0; idc < aplic->num_harts; idc++) {
>> >> +                riscv_aplic_idc_update(aplic, idc);
>> >> +            }
>> >> +        } else {
>> >> +            riscv_aplic_idc_update(aplic, idc);
>> >> +        }
>> >> +    }
>> >> +
>> >> +    return;
>> >> +
>> >> +err:
>> >> +    qemu_log_mask(LOG_GUEST_ERROR,
>> >> +                  "%s: Invalid register write 0x%" HWADDR_PRIx "\n",
>> >> +                  __func__, addr);
>> >> +}
>> >> +
>> >> +static const MemoryRegionOps riscv_aplic_ops =3D {
>> >> +    .read =3D riscv_aplic_read,
>> >> +    .write =3D riscv_aplic_write,
>> >> +    .endianness =3D DEVICE_LITTLE_ENDIAN,
>> >> +    .valid =3D {
>> >> +        .min_access_size =3D 4,
>> >> +        .max_access_size =3D 4
>> >> +    }
>> >> +};
>> >> +
>> >> +static void riscv_aplic_realize(DeviceState *dev, Error **errp)
>> >> +{
>> >> +    uint32_t i;
>> >> +    RISCVAPLICState *aplic =3D RISCV_APLIC(dev);
>> >> +
>> >> +    aplic->bitfield_words =3D (aplic->num_irqs + 31) >> 5;
>> >> +    aplic->sourcecfg =3D g_new0(uint32_t, aplic->num_irqs);
>> >> +    aplic->state =3D g_new(uint32_t, aplic->num_irqs);
>> >> +    aplic->target =3D g_new0(uint32_t, aplic->num_irqs);
>> >> +    if (!aplic->msimode) {
>> >> +        for (i =3D 0; i < aplic->num_irqs; i++) {
>> >> +            aplic->target[i] =3D 1;
>> >> +        }
>> >> +    }
>> >> +    aplic->idelivery =3D g_new0(uint32_t, aplic->num_harts);
>> >> +    aplic->iforce =3D g_new0(uint32_t, aplic->num_harts);
>> >> +    aplic->ithreshold =3D g_new0(uint32_t, aplic->num_harts);
>> >> +
>> >> +    memory_region_init_io(&aplic->mmio, OBJECT(dev), &riscv_aplic_op=
s, aplic,
>> >> +                          TYPE_RISCV_APLIC, aplic->aperture_size);
>> >> +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &aplic->mmio);
>> >> +
>> >> +    /* Only root APLICs have hardware IRQ lines. All non-root APLICs
>> >> +     * have IRQ lines delegated by their parent APLIC.
>> >> +     */
>> >> +    if (!aplic->parent) {
>> >> +        qdev_init_gpio_in(dev, riscv_aplic_request, aplic->num_irqs)=
;
>> >> +    }
>> >> +
>> >> +    /* Create output IRQ lines for non-MSI mode */
>> >> +    if (!aplic->msimode) {
>> >> +        aplic->external_irqs =3D g_malloc(sizeof(qemu_irq) * aplic->=
num_harts);
>> >> +        qdev_init_gpio_out(dev, aplic->external_irqs, aplic->num_har=
ts);
>> >> +
>> >> +        /* Claim the CPU interrupt to be triggered by this APLIC */
>> >> +        for (i =3D 0; i < aplic->num_harts; i++) {
>> >> +            RISCVCPU *cpu =3D RISCV_CPU(qemu_get_cpu(aplic->hartid_b=
ase + i));
>> >> +            if (riscv_cpu_claim_interrupts(cpu,
>> >> +                (aplic->mmode) ? MIP_MEIP : MIP_SEIP) < 0) {
>> >> +                error_report("%s already claimed",
>> >> +                             (aplic->mmode) ? "MEIP" : "SEIP");
>> >> +                exit(1);
>> >> +            }
>> >> +        }
>> >> +    }
>> >> +
>> >> +    msi_nonbroken =3D true;
>> >> +}
>> >> +
>> >> +static Property riscv_aplic_properties[] =3D {
>> >> +    DEFINE_PROP_UINT32("aperture-size", RISCVAPLICState, aperture_si=
ze, 0),
>> >> +    DEFINE_PROP_UINT32("hartid-base", RISCVAPLICState, hartid_base, =
0),
>> >> +    DEFINE_PROP_UINT32("num-harts", RISCVAPLICState, num_harts, 0),
>> >> +    DEFINE_PROP_UINT32("iprio-mask", RISCVAPLICState, iprio_mask, 0)=
,
>> >> +    DEFINE_PROP_UINT32("num-irqs", RISCVAPLICState, num_irqs, 0),
>> >> +    DEFINE_PROP_BOOL("msimode", RISCVAPLICState, msimode, 0),
>> >> +    DEFINE_PROP_BOOL("mmode", RISCVAPLICState, mmode, 0),
>> >> +    DEFINE_PROP_END_OF_LIST(),
>> >> +};
>> >> +
>> >> +static const VMStateDescription vmstate_riscv_aplic =3D {
>> >> +    .name =3D "riscv_aplic",
>> >> +    .version_id =3D 1,
>> >> +    .minimum_version_id =3D 1,
>> >> +    .fields =3D (VMStateField[]) {
>> >> +            VMSTATE_UINT32(domaincfg, RISCVAPLICState),
>> >> +            VMSTATE_UINT32(mmsicfgaddr, RISCVAPLICState),
>> >> +            VMSTATE_UINT32(mmsicfgaddrH, RISCVAPLICState),
>> >> +            VMSTATE_UINT32(smsicfgaddr, RISCVAPLICState),
>> >> +            VMSTATE_UINT32(smsicfgaddrH, RISCVAPLICState),
>> >> +            VMSTATE_UINT32(genmsi, RISCVAPLICState),
>> >> +            VMSTATE_VARRAY_UINT32(sourcecfg, RISCVAPLICState,
>> >> +                                  num_irqs, 0,
>> >> +                                  vmstate_info_uint32, uint32_t),
>> >> +            VMSTATE_VARRAY_UINT32(state, RISCVAPLICState,
>> >> +                                  num_irqs, 0,
>> >> +                                  vmstate_info_uint32, uint32_t),
>> >> +            VMSTATE_VARRAY_UINT32(target, RISCVAPLICState,
>> >> +                                  num_irqs, 0,
>> >> +                                  vmstate_info_uint32, uint32_t),
>> >> +            VMSTATE_VARRAY_UINT32(idelivery, RISCVAPLICState,
>> >> +                                  num_harts, 0,
>> >> +                                  vmstate_info_uint32, uint32_t),
>> >> +            VMSTATE_VARRAY_UINT32(iforce, RISCVAPLICState,
>> >> +                                  num_harts, 0,
>> >> +                                  vmstate_info_uint32, uint32_t),
>> >> +            VMSTATE_VARRAY_UINT32(ithreshold, RISCVAPLICState,
>> >> +                                  num_harts, 0,
>> >> +                                  vmstate_info_uint32, uint32_t),
>> >> +            VMSTATE_END_OF_LIST()
>> >> +        }
>> >> +};
>> >> +
>> >> +static void riscv_aplic_class_init(ObjectClass *klass, void *data)
>> >> +{
>> >> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
>> >> +
>> >> +    device_class_set_props(dc, riscv_aplic_properties);
>> >> +    dc->realize =3D riscv_aplic_realize;
>> >> +    dc->vmsd =3D &vmstate_riscv_aplic;
>> >> +}
>> >> +
>> >> +static const TypeInfo riscv_aplic_info =3D {
>> >> +    .name          =3D TYPE_RISCV_APLIC,
>> >> +    .parent        =3D TYPE_SYS_BUS_DEVICE,
>> >> +    .instance_size =3D sizeof(RISCVAPLICState),
>> >> +    .class_init    =3D riscv_aplic_class_init,
>> >> +};
>> >> +
>> >> +static void riscv_aplic_register_types(void)
>> >> +{
>> >> +    type_register_static(&riscv_aplic_info);
>> >> +}
>> >> +
>> >> +type_init(riscv_aplic_register_types)
>> >> +
>> >> +/*
>> >> + * Add a APLIC device to another APLIC device as child for
>> >> + * interrupt delegation.
>> >> + */
>> >> +void riscv_aplic_add_child(DeviceState *parent, DeviceState *child)
>> >> +{
>> >> +    RISCVAPLICState *caplic, *paplic;
>> >> +
>> >> +    assert(parent && child);
>> >> +    caplic =3D RISCV_APLIC(child);
>> >> +    paplic =3D RISCV_APLIC(parent);
>> >> +
>> >> +    assert(paplic->num_irqs =3D=3D caplic->num_irqs);
>> >> +    assert(paplic->num_children <=3D QEMU_APLIC_MAX_CHILDREN);
>> >> +
>> >> +    caplic->parent =3D paplic;
>> >> +    paplic->children[paplic->num_children] =3D caplic;
>> >> +    paplic->num_children++;
>> >> +}
>> >> +
>> >> +/*
>> >> + * Create APLIC device.
>> >> + */
>> >> +DeviceState *riscv_aplic_create(hwaddr addr, hwaddr size,
>> >> +    uint32_t hartid_base, uint32_t num_harts, uint32_t num_sources,
>> >> +    uint32_t iprio_bits, bool msimode, bool mmode, DeviceState *pare=
nt)
>> >> +{
>> >> +    DeviceState *dev =3D qdev_new(TYPE_RISCV_APLIC);
>> >> +    uint32_t i;
>> >> +
>> >> +    assert(num_harts < APLIC_MAX_IDC);
>> >> +    assert((APLIC_IDC_BASE + (num_harts * APLIC_IDC_SIZE)) <=3D size=
);
>> >> +    assert(num_sources < APLIC_MAX_SOURCE);
>> >> +    assert(APLIC_MIN_IPRIO_BITS <=3D iprio_bits);
>> >> +    assert(iprio_bits <=3D APLIC_MAX_IPRIO_BITS);
>> >> +
>> >> +    qdev_prop_set_uint32(dev, "aperture-size", size);
>> >> +    qdev_prop_set_uint32(dev, "hartid-base", hartid_base);
>> >> +    qdev_prop_set_uint32(dev, "num-harts", num_harts);
>> >> +    qdev_prop_set_uint32(dev, "iprio-mask", ((1U << iprio_bits) - 1)=
);
>> >> +    qdev_prop_set_uint32(dev, "num-irqs", num_sources + 1);
>> >> +    qdev_prop_set_bit(dev, "msimode", msimode);
>> >> +    qdev_prop_set_bit(dev, "mmode", mmode);
>> >> +
>> >> +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>> >> +    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
>> >> +
>> >> +    if (parent) {
>> >> +        riscv_aplic_add_child(parent, dev);
>> >> +    }
>> >> +
>> >> +    if (!msimode) {
>> >> +        for (i =3D 0; i < num_harts; i++) {
>> >> +            CPUState *cpu =3D qemu_get_cpu(hartid_base + i);
>> >> +
>> >> +            qdev_connect_gpio_out_named(dev, NULL, i,
>> >> +                                        qdev_get_gpio_in(DEVICE(cpu)=
,
>> >> +                                            (mmode) ? IRQ_M_EXT : IR=
Q_S_EXT));
>> >> +        }
>> >> +    }
>> >> +
>> >> +    return dev;
>> >> +}
>> >> diff --git a/include/hw/intc/riscv_aplic.h b/include/hw/intc/riscv_ap=
lic.h
>> >> new file mode 100644
>> >> index 0000000000..de8532fbc3
>> >> --- /dev/null
>> >> +++ b/include/hw/intc/riscv_aplic.h
>> >> @@ -0,0 +1,79 @@
>> >> +/*
>> >> + * RISC-V APLIC (Advanced Platform Level Interrupt Controller) inter=
face
>> >> + *
>> >> + * Copyright (c) 2021 Western Digital Corporation or its affiliates.
>> >> + *
>> >> + * This program is free software; you can redistribute it and/or mod=
ify it
>> >> + * under the terms and conditions of the GNU General Public License,
>> >> + * version 2 or later, as published by the Free Software Foundation.
>> >> + *
>> >> + * This program is distributed in the hope it will be useful, but WI=
THOUT
>> >> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILIT=
Y or
>> >> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public Lic=
ense for
>> >> + * more details.
>> >> + *
>> >> + * You should have received a copy of the GNU General Public License=
 along with
>> >> + * this program.  If not, see <http://www.gnu.org/licenses/>.
>> >> + */
>> >> +
>> >> +#ifndef HW_RISCV_APLIC_H
>> >> +#define HW_RISCV_APLIC_H
>> >> +
>> >> +#include "hw/sysbus.h"
>> >> +#include "qom/object.h"
>> >> +
>> >> +#define TYPE_RISCV_APLIC "riscv.aplic"
>> >> +
>> >> +typedef struct RISCVAPLICState RISCVAPLICState;
>> >> +DECLARE_INSTANCE_CHECKER(RISCVAPLICState, RISCV_APLIC, TYPE_RISCV_AP=
LIC)
>> >> +
>> >> +#define APLIC_MIN_SIZE            0x4000
>> >> +#define APLIC_SIZE_ALIGN(__x)     (((__x) + (APLIC_MIN_SIZE - 1)) & =
\
>> >> +                                   ~(APLIC_MIN_SIZE - 1))
>> >> +#define APLIC_SIZE(__num_harts)   (APLIC_MIN_SIZE + \
>> >> +                                   APLIC_SIZE_ALIGN(32 * (__num_hart=
s)))
>> >> +
>> >> +struct RISCVAPLICState {
>> >> +    /*< private >*/
>> >> +    SysBusDevice parent_obj;
>> >> +    qemu_irq *external_irqs;
>> >> +
>> >> +    /*< public >*/
>> >> +    MemoryRegion mmio;
>> >> +    uint32_t bitfield_words;
>> >> +    uint32_t domaincfg;
>> >> +    uint32_t mmsicfgaddr;
>> >> +    uint32_t mmsicfgaddrH;
>> >> +    uint32_t smsicfgaddr;
>> >> +    uint32_t smsicfgaddrH;
>> >> +    uint32_t genmsi;
>> >> +    uint32_t *sourcecfg;
>> >> +    uint32_t *state;
>> >> +    uint32_t *target;
>> >> +    uint32_t *idelivery;
>> >> +    uint32_t *iforce;
>> >> +    uint32_t *ithreshold;
>> >> +
>> >> +    /* topology */
>> >> +#define QEMU_APLIC_MAX_CHILDREN        16
>> >> +    struct RISCVAPLICState *parent;
>> >> +    struct RISCVAPLICState *children[QEMU_APLIC_MAX_CHILDREN];
>> >> +    uint16_t num_children;
>> >> +
>> >> +    /* config */
>> >> +    uint32_t aperture_size;
>> >> +    uint32_t hartid_base;
>> >> +    uint32_t num_harts;
>> >> +    uint32_t iprio_mask;
>> >> +    uint32_t num_irqs;
>> >> +    bool msimode;
>> >> +    bool mmode;
>> >> +};
>> >> +
>> >> +void riscv_aplic_add_child(DeviceState *parent, DeviceState *child);
>> >> +
>> >> +DeviceState *riscv_aplic_create(hwaddr addr, hwaddr size,
>> >> +    uint32_t hartid_base, uint32_t num_harts, uint32_t num_sources,
>> >> +    uint32_t iprio_bits, bool msimode, bool mmode, DeviceState *pare=
nt);
>> >> +
>> >> +#endif
>> >> --
>> >> 2.25.1
>> >>

