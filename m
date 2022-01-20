Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nAXRc-00052Y-Jp
	for mharc-qemu-riscv@gnu.org; Thu, 20 Jan 2022 08:25:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nAXRN-0004yC-Hk
 for qemu-riscv@nongnu.org; Thu, 20 Jan 2022 08:25:27 -0500
Received: from [2a00:1450:4864:20::536] (port=45591
 helo=mail-ed1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nAXRD-0001z6-VG
 for qemu-riscv@nongnu.org; Thu, 20 Jan 2022 08:25:23 -0500
Received: by mail-ed1-x536.google.com with SMTP id z22so28514585edd.12
 for <qemu-riscv@nongnu.org>; Thu, 20 Jan 2022 05:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7LeUiPudLQuE9NTgABbbsjYpxBIhQcSTsMThjll3emQ=;
 b=dpgzMEXmY2keMdPVqK3NyR5xuXtlLU2DfM//UptQvfUVSab5mNV3tNLd8rPIHEqrvt
 RnPnxO+yTuXP2P+lQBEKkJ6iF1VikzvkH/8FA2cuUCqWdkNCI5q0xBue/vtgkPtBQoUO
 FneT6n16V5LqHjKJRSMnfuQKStN4hm6uMGQroZH9Zv0LC6swI/+zrVNqKcOhu4o7CNla
 LH8Pj4w035uFWBx0h6cazJJ5G24xaWy70YNUY7lf9FdPkhFDbJ2lehrREN85J7HbNgO1
 8nUwsJBMglhbm/jyewYN/28clnq7cXxWClJ3XlLq4MQllm33PQdGPjg8sy7EALcVdTRM
 b0sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7LeUiPudLQuE9NTgABbbsjYpxBIhQcSTsMThjll3emQ=;
 b=bqpLJmswNicnDTjuIWeAOFZH0d/PJDuqx4W0YtwVeW1ZeqP3WxfgjGbdilmFmcPJxm
 +d8RVn+0IBSZ3eS91chYjJJlrP69yf11BFXn3xjqFTS/iMUbxADTNmOMzn2YsrhSoSRe
 bRxpOS7z7mxTYPiic0XuS196IkIeKmvGzAV7PjjwBd+itNh3S7zNps+gcqj9y251dVSp
 SwIZjCCK637iCidceC2Ae2ayLUfzOEB0fpCdO29CzTK0i/K9gH1jGI6umUTle8a8Qgph
 owG58B7Jk883F9DbNQfVKnWjBvICFOIGWx0V2pWM3YCjig3cP7pzG3JIHLzz15fk3KKU
 Llwg==
X-Gm-Message-State: AOAM531SFhbJxDrHTP+rugTfGbh0Yr/BJxoRK4Dr71XmcbT7TX5xmXci
 IS+y+wbKYmuEKpzaM04E/Cj4y8Sp3u5F8EwQfY3AqQ==
X-Google-Smtp-Source: ABdhPJy4YKppkcapSgsTKp0HHpwnlg+EGWXzzC20Efh46Hx9fj5G/Tu0Mnw+FLrUqgTgQtJNWVjWNodfODKmVcG1tqc=
X-Received: by 2002:a17:906:7254:: with SMTP id
 n20mr21988890ejk.551.1642685114137; 
 Thu, 20 Jan 2022 05:25:14 -0800 (PST)
MIME-Version: 1.0
References: <20220119152614.27548-1-anup@brainfault.org>
 <20220119152614.27548-19-anup@brainfault.org>
 <CAE_xrPhFzt5Ynd455kfziXrfpOYK2ZUxm8qGFMwyQjxwkR=mEA@mail.gmail.com>
 <CAAhSdy0Tb+LQ1tGKj2GuvME_AcZcTrLqkuZdyZ4Q6WsvSX3zkg@mail.gmail.com>
 <CAE_xrPjANvtsne07nVK_0ezTBH8ckqDU5DektqtMdM7cDuryjw@mail.gmail.com>
 <CAAhSdy3OOy3RPk1CPjr3758tQ9xOTfqms5eM_XTCWQTse0=-Jw@mail.gmail.com>
In-Reply-To: <CAAhSdy3OOy3RPk1CPjr3758tQ9xOTfqms5eM_XTCWQTse0=-Jw@mail.gmail.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Thu, 20 Jan 2022 21:25:02 +0800
Message-ID: <CAE_xrPhWO7iHOEKHFNLAHdAEDq1rdWuWh=yeLmYmNh8BNipJRA@mail.gmail.com>
Subject: Re: [PATCH v8 18/23] hw/intc: Add RISC-V AIA APLIC device emulation
To: Anup Patel <anup@brainfault.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atishp@atishpatra.org>, Bin Meng <bmeng.cn@gmail.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000b4db9205d6036ec9"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::536
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=frank.chang@sifive.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 20 Jan 2022 13:25:31 -0000

--000000000000b4db9205d6036ec9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 20, 2022 at 8:05 PM Anup Patel <anup@brainfault.org> wrote:

> On Thu, Jan 20, 2022 at 1:49 PM Frank Chang <frank.chang@sifive.com>
> wrote:
> >
> > On Thu, Jan 20, 2022 at 12:20 AM Anup Patel <anup@brainfault.org> wrote=
:
> >>
> >> Hi Frank,
> >>
> >> On Wed, Jan 19, 2022 at 9:07 PM Frank Chang <frank.chang@sifive.com>
> wrote:
> >> >
> >> > On Wed, Jan 19, 2022 at 11:27 PM Anup Patel <anup@brainfault.org>
> wrote:
> >> >>
> >> >> From: Anup Patel <anup.patel@wdc.com>
> >> >>
> >> >> The RISC-V AIA (Advanced Interrupt Architecture) defines a new
> >> >> interrupt controller for wired interrupts called APLIC (Advanced
> >> >> Platform Level Interrupt Controller). The APLIC is capabable of
> >> >> forwarding wired interupts to RISC-V HARTs directly or as MSIs
> >> >> (Message Signaled Interupts).
> >> >>
> >> >> This patch adds device emulation for RISC-V AIA APLIC.
> >> >>
> >> >> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> >> >> Signed-off-by: Anup Patel <anup@brainfault.org>
> >> >> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> >> >> ---
> >> >>  hw/intc/Kconfig               |   3 +
> >> >>  hw/intc/meson.build           |   1 +
> >> >>  hw/intc/riscv_aplic.c         | 975
> ++++++++++++++++++++++++++++++++++
> >> >>  include/hw/intc/riscv_aplic.h |  79 +++
> >> >>  4 files changed, 1058 insertions(+)
> >> >>  create mode 100644 hw/intc/riscv_aplic.c
> >> >>  create mode 100644 include/hw/intc/riscv_aplic.h
> >> >>
> >> >> diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
> >> >> index 010ded7eae..528e77b4a6 100644
> >> >> --- a/hw/intc/Kconfig
> >> >> +++ b/hw/intc/Kconfig
> >> >> @@ -70,6 +70,9 @@ config LOONGSON_LIOINTC
> >> >>  config RISCV_ACLINT
> >> >>      bool
> >> >>
> >> >> +config RISCV_APLIC
> >> >> +    bool
> >> >> +
> >> >>  config SIFIVE_PLIC
> >> >>      bool
> >> >>
> >> >> diff --git a/hw/intc/meson.build b/hw/intc/meson.build
> >> >> index 70080bc161..7466024402 100644
> >> >> --- a/hw/intc/meson.build
> >> >> +++ b/hw/intc/meson.build
> >> >> @@ -50,6 +50,7 @@ specific_ss.add(when: 'CONFIG_S390_FLIC', if_true=
:
> files('s390_flic.c'))
> >> >>  specific_ss.add(when: 'CONFIG_S390_FLIC_KVM', if_true:
> files('s390_flic_kvm.c'))
> >> >>  specific_ss.add(when: 'CONFIG_SH_INTC', if_true: files('sh_intc.c'=
))
> >> >>  specific_ss.add(when: 'CONFIG_RISCV_ACLINT', if_true:
> files('riscv_aclint.c'))
> >> >> +specific_ss.add(when: 'CONFIG_RISCV_APLIC', if_true:
> files('riscv_aplic.c'))
> >> >>  specific_ss.add(when: 'CONFIG_SIFIVE_PLIC', if_true:
> files('sifive_plic.c'))
> >> >>  specific_ss.add(when: 'CONFIG_XICS', if_true: files('xics.c'))
> >> >>  specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_XICS'],
> >> >> diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
> >> >> new file mode 100644
> >> >> index 0000000000..885c1de2af
> >> >> --- /dev/null
> >> >> +++ b/hw/intc/riscv_aplic.c
> >> >> @@ -0,0 +1,975 @@
> >> >> +/*
> >> >> + * RISC-V APLIC (Advanced Platform Level Interrupt Controller)
> >> >> + *
> >> >> + * Copyright (c) 2021 Western Digital Corporation or its affiliate=
s.
> >> >> + *
> >> >> + * This program is free software; you can redistribute it and/or
> modify it
> >> >> + * under the terms and conditions of the GNU General Public Licens=
e,
> >> >> + * version 2 or later, as published by the Free Software Foundatio=
n.
> >> >> + *
> >> >> + * This program is distributed in the hope it will be useful, but
> WITHOUT
> >> >> + * ANY WARRANTY; without even the implied warranty of
> MERCHANTABILITY or
> >> >> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public
> License for
> >> >> + * more details.
> >> >> + *
> >> >> + * You should have received a copy of the GNU General Public
> License along with
> >> >> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> >> >> + */
> >> >> +
> >> >> +#include "qemu/osdep.h"
> >> >> +#include "qapi/error.h"
> >> >> +#include "qemu/log.h"
> >> >> +#include "qemu/module.h"
> >> >> +#include "qemu/error-report.h"
> >> >> +#include "qemu/bswap.h"
> >> >> +#include "exec/address-spaces.h"
> >> >> +#include "hw/sysbus.h"
> >> >> +#include "hw/pci/msi.h"
> >> >> +#include "hw/boards.h"
> >> >> +#include "hw/qdev-properties.h"
> >> >> +#include "hw/intc/riscv_aplic.h"
> >> >> +#include "hw/irq.h"
> >> >> +#include "target/riscv/cpu.h"
> >> >> +#include "sysemu/sysemu.h"
> >> >> +#include "migration/vmstate.h"
> >> >> +
> >> >> +#define APLIC_MAX_IDC                  (1UL << 14)
> >> >> +#define APLIC_MAX_SOURCE               1024
> >> >> +#define APLIC_MIN_IPRIO_BITS           1
> >> >> +#define APLIC_MAX_IPRIO_BITS           8
> >> >> +#define APLIC_MAX_CHILDREN             1024
> >> >> +
> >> >> +#define APLIC_DOMAINCFG                0x0000
> >> >> +#define APLIC_DOMAINCFG_RDONLY         0x80000000
> >> >> +#define APLIC_DOMAINCFG_IE             (1 << 8)
> >> >> +#define APLIC_DOMAINCFG_DM             (1 << 2)
> >> >> +#define APLIC_DOMAINCFG_BE             (1 << 0)
> >> >> +
> >> >> +#define APLIC_SOURCECFG_BASE           0x0004
> >> >> +#define APLIC_SOURCECFG_D              (1 << 10)
> >> >> +#define APLIC_SOURCECFG_CHILDIDX_MASK  0x000003ff
> >> >> +#define APLIC_SOURCECFG_SM_MASK        0x00000007
> >> >> +#define APLIC_SOURCECFG_SM_INACTIVE    0x0
> >> >> +#define APLIC_SOURCECFG_SM_DETACH      0x1
> >> >> +#define APLIC_SOURCECFG_SM_EDGE_RISE   0x4
> >> >> +#define APLIC_SOURCECFG_SM_EDGE_FALL   0x5
> >> >> +#define APLIC_SOURCECFG_SM_LEVEL_HIGH  0x6
> >> >> +#define APLIC_SOURCECFG_SM_LEVEL_LOW   0x7
> >> >> +
> >> >> +#define APLIC_MMSICFGADDR              0x1bc0
> >> >> +#define APLIC_MMSICFGADDRH             0x1bc4
> >> >> +#define APLIC_SMSICFGADDR              0x1bc8
> >> >> +#define APLIC_SMSICFGADDRH             0x1bcc
> >> >> +
> >> >> +#define APLIC_xMSICFGADDRH_L           (1UL << 31)
> >> >> +#define APLIC_xMSICFGADDRH_HHXS_MASK   0x1f
> >> >> +#define APLIC_xMSICFGADDRH_HHXS_SHIFT  24
> >> >> +#define APLIC_xMSICFGADDRH_LHXS_MASK   0x7
> >> >> +#define APLIC_xMSICFGADDRH_LHXS_SHIFT  20
> >> >> +#define APLIC_xMSICFGADDRH_HHXW_MASK   0x7
> >> >> +#define APLIC_xMSICFGADDRH_HHXW_SHIFT  16
> >> >> +#define APLIC_xMSICFGADDRH_LHXW_MASK   0xf
> >> >> +#define APLIC_xMSICFGADDRH_LHXW_SHIFT  12
> >> >> +#define APLIC_xMSICFGADDRH_BAPPN_MASK  0xfff
> >> >> +
> >> >> +#define APLIC_xMSICFGADDR_PPN_SHIFT    12
> >> >> +
> >> >> +#define APLIC_xMSICFGADDR_PPN_HART(__lhxs) \
> >> >> +    ((1UL << (__lhxs)) - 1)
> >> >> +
> >> >> +#define APLIC_xMSICFGADDR_PPN_LHX_MASK(__lhxw) \
> >> >> +    ((1UL << (__lhxw)) - 1)
> >> >> +#define APLIC_xMSICFGADDR_PPN_LHX_SHIFT(__lhxs) \
> >> >> +    ((__lhxs))
> >> >> +#define APLIC_xMSICFGADDR_PPN_LHX(__lhxw, __lhxs) \
> >> >> +    (APLIC_xMSICFGADDR_PPN_LHX_MASK(__lhxw) << \
> >> >> +     APLIC_xMSICFGADDR_PPN_LHX_SHIFT(__lhxs))
> >> >> +
> >> >> +#define APLIC_xMSICFGADDR_PPN_HHX_MASK(__hhxw) \
> >> >> +    ((1UL << (__hhxw)) - 1)
> >> >> +#define APLIC_xMSICFGADDR_PPN_HHX_SHIFT(__hhxs) \
> >> >> +    ((__hhxs) + APLIC_xMSICFGADDR_PPN_SHIFT)
> >> >> +#define APLIC_xMSICFGADDR_PPN_HHX(__hhxw, __hhxs) \
> >> >> +    (APLIC_xMSICFGADDR_PPN_HHX_MASK(__hhxw) << \
> >> >> +     APLIC_xMSICFGADDR_PPN_HHX_SHIFT(__hhxs))
> >> >> +
> >> >> +#define APLIC_xMSICFGADDRH_VALID_MASK   \
> >> >> +    (APLIC_xMSICFGADDRH_L | \
> >> >> +     (APLIC_xMSICFGADDRH_HHXS_MASK <<
> APLIC_xMSICFGADDRH_HHXS_SHIFT) | \
> >> >> +     (APLIC_xMSICFGADDRH_LHXS_MASK <<
> APLIC_xMSICFGADDRH_LHXS_SHIFT) | \
> >> >> +     (APLIC_xMSICFGADDRH_HHXW_MASK <<
> APLIC_xMSICFGADDRH_HHXW_SHIFT) | \
> >> >> +     (APLIC_xMSICFGADDRH_LHXW_MASK <<
> APLIC_xMSICFGADDRH_LHXW_SHIFT) | \
> >> >> +     APLIC_xMSICFGADDRH_BAPPN_MASK)
> >> >> +
> >> >> +#define APLIC_SETIP_BASE               0x1c00
> >> >> +#define APLIC_SETIPNUM                 0x1cdc
> >> >> +
> >> >> +#define APLIC_CLRIP_BASE               0x1d00
> >> >> +#define APLIC_CLRIPNUM                 0x1ddc
> >> >> +
> >> >> +#define APLIC_SETIE_BASE               0x1e00
> >> >> +#define APLIC_SETIENUM                 0x1edc
> >> >> +
> >> >> +#define APLIC_CLRIE_BASE               0x1f00
> >> >> +#define APLIC_CLRIENUM                 0x1fdc
> >> >> +
> >> >> +#define APLIC_SETIPNUM_LE              0x2000
> >> >> +#define APLIC_SETIPNUM_BE              0x2004
> >> >> +
> >> >> +#define APLIC_ISTATE_PENDING           (1U << 0)
> >> >> +#define APLIC_ISTATE_ENABLED           (1U << 1)
> >> >> +#define APLIC_ISTATE_ENPEND            (APLIC_ISTATE_ENABLED | \
> >> >> +                                        APLIC_ISTATE_PENDING)
> >> >> +#define APLIC_ISTATE_INPUT             (1U << 8)
> >> >> +
> >> >> +#define APLIC_GENMSI                   0x3000
> >> >> +
> >> >> +#define APLIC_TARGET_BASE              0x3004
> >> >> +#define APLIC_TARGET_HART_IDX_SHIFT    18
> >> >> +#define APLIC_TARGET_HART_IDX_MASK     0x3fff
> >> >> +#define APLIC_TARGET_GUEST_IDX_SHIFT   12
> >> >> +#define APLIC_TARGET_GUEST_IDX_MASK    0x3f
> >> >> +#define APLIC_TARGET_IPRIO_MASK        0xff
> >> >> +#define APLIC_TARGET_EIID_MASK         0x7ff
> >> >> +
> >> >> +#define APLIC_IDC_BASE                 0x4000
> >> >> +#define APLIC_IDC_SIZE                 32
> >> >> +
> >> >> +#define APLIC_IDC_IDELIVERY            0x00
> >> >> +
> >> >> +#define APLIC_IDC_IFORCE               0x04
> >> >> +
> >> >> +#define APLIC_IDC_ITHRESHOLD           0x08
> >> >> +
> >> >> +#define APLIC_IDC_TOPI                 0x18
> >> >> +#define APLIC_IDC_TOPI_ID_SHIFT        16
> >> >> +#define APLIC_IDC_TOPI_ID_MASK         0x3ff
> >> >> +#define APLIC_IDC_TOPI_PRIO_MASK       0xff
> >> >> +
> >> >> +#define APLIC_IDC_CLAIMI               0x1c
> >> >> +
> >> >> +static uint32_t riscv_aplic_read_input_word(RISCVAPLICState *aplic=
,
> >> >> +                                            uint32_t word)
> >> >> +{
> >> >> +    uint32_t i, irq, ret =3D 0;
> >> >> +
> >> >> +    for (i =3D 0; i < 32; i++) {
> >> >> +        irq =3D word * 32 + i;
> >> >> +        if (!irq || aplic->num_irqs <=3D irq) {
> >> >> +            continue;
> >> >> +        }
> >> >> +
> >> >> +        ret |=3D ((aplic->state[irq] & APLIC_ISTATE_INPUT) ? 1 : 0=
)
> << i;
> >> >> +    }
> >> >> +
> >> >> +    return ret;
> >> >> +}
> >> >> +
> >> >> +static uint32_t riscv_aplic_read_pending_word(RISCVAPLICState
> *aplic,
> >> >> +                                              uint32_t word)
> >> >> +{
> >> >> +    uint32_t i, irq, ret =3D 0;
> >> >> +
> >> >> +    for (i =3D 0; i < 32; i++) {
> >> >> +        irq =3D word * 32 + i;
> >> >> +        if (!irq || aplic->num_irqs <=3D irq) {
> >> >> +            continue;
> >> >> +        }
> >> >> +
> >> >> +        ret |=3D ((aplic->state[irq] & APLIC_ISTATE_PENDING) ? 1 :=
 0)
> << i;
> >> >> +    }
> >> >> +
> >> >> +    return ret;
> >> >> +}
> >> >> +
> >> >> +static void riscv_aplic_set_pending_raw(RISCVAPLICState *aplic,
> >> >> +                                        uint32_t irq, bool pending=
)
> >> >> +{
> >> >> +    if (pending) {
> >> >> +        aplic->state[irq] |=3D APLIC_ISTATE_PENDING;
> >> >> +    } else {
> >> >> +        aplic->state[irq] &=3D ~APLIC_ISTATE_PENDING;
> >> >> +    }
> >> >> +}
> >> >> +
> >> >> +static void riscv_aplic_set_pending(RISCVAPLICState *aplic,
> >> >> +                                    uint32_t irq, bool pending)
> >> >> +{
> >> >> +    uint32_t sourcecfg, sm;
> >> >> +
> >> >> +    if ((irq <=3D 0) || (aplic->num_irqs <=3D irq)) {
> >> >> +        return;
> >> >> +    }
> >> >> +
> >> >> +    sourcecfg =3D aplic->sourcecfg[irq];
> >> >> +    if (sourcecfg & APLIC_SOURCECFG_D) {
> >> >> +        return;
> >> >> +    }
> >> >> +
> >> >> +    sm =3D sourcecfg & APLIC_SOURCECFG_SM_MASK;
> >> >> +    if ((sm =3D=3D APLIC_SOURCECFG_SM_INACTIVE) ||
> >> >> +        ((!aplic->msimode || (aplic->msimode && !pending)) &&
> >> >> +         ((sm =3D=3D APLIC_SOURCECFG_SM_LEVEL_HIGH) ||
> >> >> +          (sm =3D=3D APLIC_SOURCECFG_SM_LEVEL_LOW)))) {
> >> >> +        return;
> >> >> +    }
> >> >> +
> >> >> +    riscv_aplic_set_pending_raw(aplic, irq, pending);
> >> >> +}
> >> >> +
> >> >> +static void riscv_aplic_set_pending_word(RISCVAPLICState *aplic,
> >> >> +                                         uint32_t word, uint32_t
> value,
> >> >> +                                         bool pending)
> >> >> +{
> >> >> +    uint32_t i, irq;
> >> >> +
> >> >> +    for (i =3D 0; i < 32; i++) {
> >> >> +        irq =3D word * 32 + i;
> >> >> +        if (!irq || aplic->num_irqs <=3D irq) {
> >> >> +            continue;
> >> >> +        }
> >> >> +
> >> >> +        if (value & (1U << i)) {
> >> >> +            riscv_aplic_set_pending(aplic, irq, pending);
> >> >> +        }
> >> >> +    }
> >> >> +}
> >> >> +
> >> >> +static uint32_t riscv_aplic_read_enabled_word(RISCVAPLICState
> *aplic,
> >> >> +                                              int word)
> >> >> +{
> >> >> +    uint32_t i, irq, ret =3D 0;
> >> >> +
> >> >> +    for (i =3D 0; i < 32; i++) {
> >> >> +        irq =3D word * 32 + i;
> >> >> +        if (!irq || aplic->num_irqs <=3D irq) {
> >> >> +            continue;
> >> >> +        }
> >> >> +
> >> >> +        ret |=3D ((aplic->state[irq] & APLIC_ISTATE_ENABLED) ? 1 :=
 0)
> << i;
> >> >> +    }
> >> >> +
> >> >> +    return ret;
> >> >> +}
> >> >> +
> >> >> +static void riscv_aplic_set_enabled_raw(RISCVAPLICState *aplic,
> >> >> +                                        uint32_t irq, bool enabled=
)
> >> >> +{
> >> >> +    if (enabled) {
> >> >> +        aplic->state[irq] |=3D APLIC_ISTATE_ENABLED;
> >> >> +    } else {
> >> >> +        aplic->state[irq] &=3D ~APLIC_ISTATE_ENABLED;
> >> >> +    }
> >> >> +}
> >> >> +
> >> >> +static void riscv_aplic_set_enabled(RISCVAPLICState *aplic,
> >> >> +                                    uint32_t irq, bool enabled)
> >> >> +{
> >> >> +    uint32_t sourcecfg, sm;
> >> >> +
> >> >> +    if ((irq <=3D 0) || (aplic->num_irqs <=3D irq)) {
> >> >> +        return;
> >> >> +    }
> >> >> +
> >> >> +    sourcecfg =3D aplic->sourcecfg[irq];
> >> >> +    if (sourcecfg & APLIC_SOURCECFG_D) {
> >> >> +        return;
> >> >> +    }
> >> >> +
> >> >> +    sm =3D sourcecfg & APLIC_SOURCECFG_SM_MASK;
> >> >> +    if (sm =3D=3D APLIC_SOURCECFG_SM_INACTIVE) {
> >> >> +        return;
> >> >> +    }
> >> >> +
> >> >> +    riscv_aplic_set_enabled_raw(aplic, irq, enabled);
> >> >> +}
> >> >> +
> >> >> +static void riscv_aplic_set_enabled_word(RISCVAPLICState *aplic,
> >> >> +                                         uint32_t word, uint32_t
> value,
> >> >> +                                         bool enabled)
> >> >> +{
> >> >> +    uint32_t i, irq;
> >> >> +
> >> >> +    for (i =3D 0; i < 32; i++) {
> >> >> +        irq =3D word * 32 + i;
> >> >> +        if (!irq || aplic->num_irqs <=3D irq) {
> >> >> +            continue;
> >> >> +        }
> >> >> +
> >> >> +        if (value & (1U << i)) {
> >> >> +            riscv_aplic_set_enabled(aplic, irq, enabled);
> >> >> +        }
> >> >> +    }
> >> >> +}
> >> >> +
> >> >> +static void riscv_aplic_msi_send(RISCVAPLICState *aplic,
> >> >> +                                 uint32_t hart_idx, uint32_t
> guest_idx,
> >> >> +                                 uint32_t eiid)
> >> >> +{
> >> >> +    uint64_t addr;
> >> >> +    MemTxResult result;
> >> >> +    RISCVAPLICState *aplic_m;
> >> >> +    uint32_t lhxs, lhxw, hhxs, hhxw, group_idx, msicfgaddr,
> msicfgaddrH;
> >> >> +
> >> >> +    aplic_m =3D aplic;
> >> >> +    while (aplic_m && !aplic_m->mmode) {
> >> >> +        aplic_m =3D aplic_m->parent;
> >> >> +    }
> >> >> +    if (!aplic_m) {
> >> >> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: m-level APLIC not
> found\n",
> >> >> +                      __func__);
> >> >> +        return;
> >> >> +    }
> >> >> +
> >> >> +    if (aplic->mmode) {
> >> >> +        msicfgaddr =3D aplic_m->mmsicfgaddr;
> >> >> +        msicfgaddrH =3D aplic_m->mmsicfgaddrH;
> >> >> +    } else {
> >> >> +        msicfgaddr =3D aplic_m->smsicfgaddr;
> >> >> +        msicfgaddrH =3D aplic_m->smsicfgaddrH;
> >> >> +    }
> >> >> +
> >> >> +    lhxs =3D (msicfgaddrH >> APLIC_xMSICFGADDRH_LHXS_SHIFT) &
> >> >> +            APLIC_xMSICFGADDRH_LHXS_MASK;
> >> >> +    lhxw =3D (msicfgaddrH >> APLIC_xMSICFGADDRH_LHXW_SHIFT) &
> >> >> +            APLIC_xMSICFGADDRH_LHXW_MASK;
> >> >> +    hhxs =3D (msicfgaddrH >> APLIC_xMSICFGADDRH_HHXS_SHIFT) &
> >> >> +            APLIC_xMSICFGADDRH_HHXS_MASK;
> >> >> +    hhxw =3D (msicfgaddrH >> APLIC_xMSICFGADDRH_HHXW_SHIFT) &
> >> >> +            APLIC_xMSICFGADDRH_HHXW_MASK;
> >> >> +
> >> >> +    group_idx =3D hart_idx >> lhxw;
> >> >> +    hart_idx &=3D APLIC_xMSICFGADDR_PPN_LHX_MASK(lhxw);
> >> >> +
> >> >> +    addr =3D msicfgaddr;
> >> >> +    addr |=3D ((uint64_t)(msicfgaddrH &
> APLIC_xMSICFGADDRH_BAPPN_MASK)) << 32;
> >> >> +    addr |=3D ((uint64_t)(group_idx &
> APLIC_xMSICFGADDR_PPN_HHX_MASK(hhxw))) <<
> >> >> +             APLIC_xMSICFGADDR_PPN_HHX_SHIFT(hhxs);
> >> >> +    addr |=3D ((uint64_t)(hart_idx &
> APLIC_xMSICFGADDR_PPN_LHX_MASK(lhxw))) <<
> >> >> +             APLIC_xMSICFGADDR_PPN_LHX_SHIFT(lhxs);
> >> >> +    addr |=3D (uint64_t)(guest_idx &
> APLIC_xMSICFGADDR_PPN_HART(lhxs));
> >> >> +    addr <<=3D APLIC_xMSICFGADDR_PPN_SHIFT;
> >> >> +
> >> >> +    address_space_stl_le(&address_space_memory, addr,
> >> >> +                         eiid, MEMTXATTRS_UNSPECIFIED, &result);
> >> >> +    if (result !=3D MEMTX_OK) {
> >> >> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: MSI write failed for "
> >> >> +                      "hart_index=3D%d guest_index=3D%d eiid=3D%d\=
n",
> >> >> +                      __func__, hart_idx, guest_idx, eiid);
> >> >> +    }
> >> >> +}
> >> >> +
> >> >> +static void riscv_aplic_msi_irq_update(RISCVAPLICState *aplic,
> uint32_t irq)
> >> >> +{
> >> >> +    uint32_t hart_idx, guest_idx, eiid;
> >> >> +
> >> >> +    if (!aplic->msimode || (aplic->num_irqs <=3D irq) ||
> >> >> +        !(aplic->domaincfg & APLIC_DOMAINCFG_IE)) {
> >> >> +        return;
> >> >> +    }
> >> >> +
> >> >> +    if ((aplic->state[irq] & APLIC_ISTATE_ENPEND) !=3D
> APLIC_ISTATE_ENPEND) {
> >> >> +        return;
> >> >> +    }
> >> >> +
> >> >> +    riscv_aplic_set_pending_raw(aplic, irq, false);
> >> >> +
> >> >> +    hart_idx =3D aplic->target[irq] >> APLIC_TARGET_HART_IDX_SHIFT=
;
> >> >> +    hart_idx &=3D APLIC_TARGET_HART_IDX_MASK;
> >> >
> >> >
> >> > Hi Anup,
> >> >
> >> > I'm wondering does the hart_idx here has to use Machine-level hart
> index
> >> > for Supervisor-level interrupt domain?
> >> >
> >> > According to AIA spec for supervisor-level domin (Section 4.8.1):
> >> >   For a supervisor-level domain, "if" MSI target addresses are
> determined by the parent domain=E2=80=99s
> >> >   smsiaddrcfg and smsiaddrcfgh registers, then to construct the
> address for an outgoing MSI for
> >> >   interrupt source i, the Hart Index from register target[i] must
> first be converted into the index
> >> >   that the machine-level parent domain uses for the same hart.
> (Typically, these numbers are the
> >> >   same, but they may not be.) The address for the MSI is then
> computed using this "machine-level"
> >> >   hart index, the parent domain=E2=80=99s smsiaddrcfg and smsiaddrcf=
gh, and
> the Guest Index value from
> >> >   target[i].
> >> >
> >> > The description of converting target[i] hart Index to machine-level
> hart index in the spec
> >> > is quite vague to me.
> >>
> >> The "Section 4.3 Hart index numbers" states the following:
> >>
> >>     The index number a domain associates with a hart may or may not
> >> have any relationship
> >>     to the unique hart identifier (=E2=80=9Chart ID=E2=80=9D) that the=
 RISC-V
> >> Privileged Architecture assigns to
> >>     the hart.
> >>
> >> For APLIC direct mode, if N harts are associated with a given domain
> >> then APLIC associates
> >> hart index from 0 to N-1 which are basically APLIC IDC numbers. In
> >> this case, the APLIC
> >> hart index is not related to "machine-level" hart index so software
> >> has to discover it from the
> >> "interrupt-extended" DT property (or similar for ACPI).
> >>
> >> For APLIC msi mode, the APLIC can basically target any HART using
> information in
> >> [m|s]msiaddrcfg registers and interrupt target registers. In this
> >> case, the APLIC hart
> >> index in the APLIC target register is a combination of IMSIC group
> >> index (g) and IMSIC
> >> hart index (h) and the APLIC target register also provides IMSIC guest
> >> index. In other
> >> words, the APLIC hart index for msi mode is also not related to the
> >> "machine-level" hart
> >> index. The APLIC driver will figure-out/extract the IMSIC group index
> >> (g), IMSIC hart
> >> index (h), and IMSIC guest index from target MSI address when Linux
> >> tries to write
> >> target MSI address for a particular APLIC interrupt.
> >>
> >> Regards,
> >> Anup
> >
> >
> > Hi Anup,
> >
> > Thanks for the detailed explanation.
> >
> > I think it's the formula in the AIA spec which confused me:
> >   g =3D (machine-level hart index >> LHXW) & (2^HHXW =E2=88=92 1)
> >   h =3D machine-level hart index & (2^LHXW =E2=88=92 1)
> >   MSI address =3D  (Base PPN | (g << (HHXS + 12)) | (h << LHXS) | Guest
> Index) << 12
> >
> > The term "machine-level hart index" makes me thought that
> > we should use the hart index from parent machine-level interrupt domain=
.
>
> Yes, the term "machine-level hart index" is confusing. In reality, it is
> the
> "hart index" in the APLIC interrupt target registers.
>
> >
> > So it's driver's responsibility to figure out the correct IMSIC hart
> index, guest index
> > it wants to forward the MSI to and configure them to the target[i]
> register?
>
> Yes, that's correct.
>
> >
> > From hardware (QEMU)'s perspective, it just needs to extract
> > the Hart index, Guest index out from target[irq] register in IRQ's
> interrupt domain
> > and calculate the MSI address with the PPN from parent interrupt domain=
's
> > m/smsiaddrcfg and m/smsiaddrcfgh?
>
> Yes, that's correct.
>
> The [m|s]msiaddrcfg registers are only available in the root APLIC domain
> and M-mode runtime firmware (OpenSBI) has to initialize it correctly.
>
> The APLIC Linux/OS driver has to ensure that APLIC interrupt target
> registers
> are programmed properly so that APLIC can generate the correct output MSI
> address.
>
> Regards,
> Anup
>

Thanks Anup,

That's really helpful :)

Regards,
Frank Chang

>
> >
> > Regards,
> > Frank Chang
> >
> >>
> >>
> >> >
> >> > Regards,
> >> > Frank Chang
> >> >
> >> >>
> >> >> +    if (aplic->mmode) {
> >> >> +        /* M-level APLIC ignores guest_index */
> >> >> +        guest_idx =3D 0;
> >> >> +    } else {
> >> >> +        guest_idx =3D aplic->target[irq] >>
> APLIC_TARGET_GUEST_IDX_SHIFT;
> >> >> +        guest_idx &=3D APLIC_TARGET_GUEST_IDX_MASK;
> >> >> +    }
> >> >> +    eiid =3D aplic->target[irq] & APLIC_TARGET_EIID_MASK;
> >> >> +    riscv_aplic_msi_send(aplic, hart_idx, guest_idx, eiid);
> >> >> +}
> >> >> +
> >> >> +static uint32_t riscv_aplic_idc_topi(RISCVAPLICState *aplic,
> uint32_t idc)
> >> >> +{
> >> >> +    uint32_t best_irq, best_iprio;
> >> >> +    uint32_t irq, iprio, ihartidx, ithres;
> >> >> +
> >> >> +    if (aplic->num_harts <=3D idc) {
> >> >> +        return 0;
> >> >> +    }
> >> >> +
> >> >> +    ithres =3D aplic->ithreshold[idc];
> >> >> +    best_irq =3D best_iprio =3D UINT32_MAX;
> >> >> +    for (irq =3D 1; irq < aplic->num_irqs; irq++) {
> >> >> +        if ((aplic->state[irq] & APLIC_ISTATE_ENPEND) !=3D
> >> >> +            APLIC_ISTATE_ENPEND) {
> >> >> +            continue;
> >> >> +        }
> >> >> +
> >> >> +        ihartidx =3D aplic->target[irq] >>
> APLIC_TARGET_HART_IDX_SHIFT;
> >> >> +        ihartidx &=3D APLIC_TARGET_HART_IDX_MASK;
> >> >> +        if (ihartidx !=3D idc) {
> >> >> +            continue;
> >> >> +        }
> >> >> +
> >> >> +        iprio =3D aplic->target[irq] & aplic->iprio_mask;
> >> >> +        if (ithres && iprio >=3D ithres) {
> >> >> +            continue;
> >> >> +        }
> >> >> +
> >> >> +        if (iprio < best_iprio) {
> >> >> +            best_irq =3D irq;
> >> >> +            best_iprio =3D iprio;
> >> >> +        }
> >> >> +    }
> >> >> +
> >> >> +    if (best_irq < aplic->num_irqs && best_iprio <=3D
> aplic->iprio_mask) {
> >> >> +        return (best_irq << APLIC_IDC_TOPI_ID_SHIFT) | best_iprio;
> >> >> +    }
> >> >> +
> >> >> +    return 0;
> >> >> +}
> >> >> +
> >> >> +static void riscv_aplic_idc_update(RISCVAPLICState *aplic, uint32_=
t
> idc)
> >> >> +{
> >> >> +    uint32_t topi;
> >> >> +
> >> >> +    if (aplic->msimode || aplic->num_harts <=3D idc) {
> >> >> +        return;
> >> >> +    }
> >> >> +
> >> >> +    topi =3D riscv_aplic_idc_topi(aplic, idc);
> >> >> +    if ((aplic->domaincfg & APLIC_DOMAINCFG_IE) &&
> >> >> +        aplic->idelivery[idc] &&
> >> >> +        (aplic->iforce[idc] || topi)) {
> >> >> +        qemu_irq_raise(aplic->external_irqs[idc]);
> >> >> +    } else {
> >> >> +        qemu_irq_lower(aplic->external_irqs[idc]);
> >> >> +    }
> >> >> +}
> >> >> +
> >> >> +static uint32_t riscv_aplic_idc_claimi(RISCVAPLICState *aplic,
> uint32_t idc)
> >> >> +{
> >> >> +    uint32_t irq, state, sm, topi =3D riscv_aplic_idc_topi(aplic,
> idc);
> >> >> +
> >> >> +    if (!topi) {
> >> >> +        aplic->iforce[idc] =3D 0;
> >> >> +        return 0;
> >> >> +    }
> >> >> +
> >> >> +    irq =3D (topi >> APLIC_IDC_TOPI_ID_SHIFT) &
> APLIC_IDC_TOPI_ID_MASK;
> >> >> +    sm =3D aplic->sourcecfg[irq] & APLIC_SOURCECFG_SM_MASK;
> >> >> +    state =3D aplic->state[irq];
> >> >> +    riscv_aplic_set_pending_raw(aplic, irq, false);
> >> >> +    if ((sm =3D=3D APLIC_SOURCECFG_SM_LEVEL_HIGH) &&
> >> >> +        (state & APLIC_ISTATE_INPUT)) {
> >> >> +        riscv_aplic_set_pending_raw(aplic, irq, true);
> >> >> +    } else if ((sm =3D=3D APLIC_SOURCECFG_SM_LEVEL_LOW) &&
> >> >> +               !(state & APLIC_ISTATE_INPUT)) {
> >> >> +        riscv_aplic_set_pending_raw(aplic, irq, true);
> >> >> +    }
> >> >> +    riscv_aplic_idc_update(aplic, idc);
> >> >> +
> >> >> +    return topi;
> >> >> +}
> >> >> +
> >> >> +static void riscv_aplic_request(void *opaque, int irq, int level)
> >> >> +{
> >> >> +    bool update =3D false;
> >> >> +    RISCVAPLICState *aplic =3D opaque;
> >> >> +    uint32_t sourcecfg, childidx, state, idc;
> >> >> +
> >> >> +    assert((0 < irq) && (irq < aplic->num_irqs));
> >> >> +
> >> >> +    sourcecfg =3D aplic->sourcecfg[irq];
> >> >> +    if (sourcecfg & APLIC_SOURCECFG_D) {
> >> >> +        childidx =3D sourcecfg & APLIC_SOURCECFG_CHILDIDX_MASK;
> >> >> +        if (childidx < aplic->num_children) {
> >> >> +            riscv_aplic_request(aplic->children[childidx], irq,
> level);
> >> >> +        }
> >> >> +        return;
> >> >> +    }
> >> >> +
> >> >> +    state =3D aplic->state[irq];
> >> >> +    switch (sourcecfg & APLIC_SOURCECFG_SM_MASK) {
> >> >> +    case APLIC_SOURCECFG_SM_EDGE_RISE:
> >> >> +        if ((level > 0) && !(state & APLIC_ISTATE_INPUT) &&
> >> >> +            !(state & APLIC_ISTATE_PENDING)) {
> >> >> +            riscv_aplic_set_pending_raw(aplic, irq, true);
> >> >> +            update =3D true;
> >> >> +        }
> >> >> +        break;
> >> >> +    case APLIC_SOURCECFG_SM_EDGE_FALL:
> >> >> +        if ((level <=3D 0) && (state & APLIC_ISTATE_INPUT) &&
> >> >> +            !(state & APLIC_ISTATE_PENDING)) {
> >> >> +            riscv_aplic_set_pending_raw(aplic, irq, true);
> >> >> +            update =3D true;
> >> >> +        }
> >> >> +        break;
> >> >> +    case APLIC_SOURCECFG_SM_LEVEL_HIGH:
> >> >> +        if ((level > 0) && !(state & APLIC_ISTATE_PENDING)) {
> >> >> +            riscv_aplic_set_pending_raw(aplic, irq, true);
> >> >> +            update =3D true;
> >> >> +        }
> >> >> +        break;
> >> >> +    case APLIC_SOURCECFG_SM_LEVEL_LOW:
> >> >> +        if ((level <=3D 0) && !(state & APLIC_ISTATE_PENDING)) {
> >> >> +            riscv_aplic_set_pending_raw(aplic, irq, true);
> >> >> +            update =3D true;
> >> >> +        }
> >> >> +        break;
> >> >> +    default:
> >> >> +        break;
> >> >> +    }
> >> >> +
> >> >> +    if (level <=3D 0) {
> >> >> +        aplic->state[irq] &=3D ~APLIC_ISTATE_INPUT;
> >> >> +    } else {
> >> >> +        aplic->state[irq] |=3D APLIC_ISTATE_INPUT;
> >> >> +    }
> >> >> +
> >> >> +    if (update) {
> >> >> +        if (aplic->msimode) {
> >> >> +            riscv_aplic_msi_irq_update(aplic, irq);
> >> >> +        } else {
> >> >> +            idc =3D aplic->target[irq] >> APLIC_TARGET_HART_IDX_SH=
IFT;
> >> >> +            idc &=3D APLIC_TARGET_HART_IDX_MASK;
> >> >> +            riscv_aplic_idc_update(aplic, idc);
> >> >> +        }
> >> >> +    }
> >> >> +}
> >> >> +
> >> >> +static uint64_t riscv_aplic_read(void *opaque, hwaddr addr,
> unsigned size)
> >> >> +{
> >> >> +    uint32_t irq, word, idc;
> >> >> +    RISCVAPLICState *aplic =3D opaque;
> >> >> +
> >> >> +    /* Reads must be 4 byte words */
> >> >> +    if ((addr & 0x3) !=3D 0) {
> >> >> +        goto err;
> >> >> +    }
> >> >> +
> >> >> +    if (addr =3D=3D APLIC_DOMAINCFG) {
> >> >> +        return APLIC_DOMAINCFG_RDONLY | aplic->domaincfg |
> >> >> +               (aplic->msimode ? APLIC_DOMAINCFG_DM : 0);
> >> >> +    } else if ((APLIC_SOURCECFG_BASE <=3D addr) &&
> >> >> +            (addr < (APLIC_SOURCECFG_BASE + (aplic->num_irqs - 1) =
*
> 4))) {
> >> >> +        irq  =3D ((addr - APLIC_SOURCECFG_BASE) >> 2) + 1;
> >> >> +        return aplic->sourcecfg[irq];
> >> >> +    } else if (aplic->mmode && aplic->msimode &&
> >> >> +               (addr =3D=3D APLIC_MMSICFGADDR)) {
> >> >> +        return aplic->mmsicfgaddr;
> >> >> +    } else if (aplic->mmode && aplic->msimode &&
> >> >> +               (addr =3D=3D APLIC_MMSICFGADDRH)) {
> >> >> +        return aplic->mmsicfgaddrH;
> >> >> +    } else if (aplic->mmode && aplic->msimode &&
> >> >> +               (addr =3D=3D APLIC_SMSICFGADDR)) {
> >> >> +        /* Registers SMSICFGADDR and SMSICFGADDRH are implemented
> only if:
> >> >> +         * (a) the interrupt domain is at machine level
> >> >> +         * (b) the domain=E2=80=99s harts implement supervisor mod=
e
> >> >> +         * (c) the domain has one or more child supervisor-level
> domains
> >> >> +         *     that support MSI delivery mode (domaincfg.DM is not
> read-
> >> >> +         *     only zero in at least one of the supervisor-level
> child
> >> >> +         * domains).
> >> >> +         */
> >> >> +        return (aplic->num_children) ? aplic->smsicfgaddr : 0;
> >> >> +    } else if (aplic->mmode && aplic->msimode &&
> >> >> +               (addr =3D=3D APLIC_SMSICFGADDRH)) {
> >> >> +        return (aplic->num_children) ? aplic->smsicfgaddrH : 0;
> >> >> +    } else if ((APLIC_SETIP_BASE <=3D addr) &&
> >> >> +            (addr < (APLIC_SETIP_BASE + aplic->bitfield_words *
> 4))) {
> >> >> +        word =3D (addr - APLIC_SETIP_BASE) >> 2;
> >> >> +        return riscv_aplic_read_pending_word(aplic, word);
> >> >> +    } else if (addr =3D=3D APLIC_SETIPNUM) {
> >> >> +        return 0;
> >> >> +    } else if ((APLIC_CLRIP_BASE <=3D addr) &&
> >> >> +            (addr < (APLIC_CLRIP_BASE + aplic->bitfield_words *
> 4))) {
> >> >> +        word =3D (addr - APLIC_CLRIP_BASE) >> 2;
> >> >> +        return riscv_aplic_read_input_word(aplic, word);
> >> >> +    } else if (addr =3D=3D APLIC_CLRIPNUM) {
> >> >> +        return 0;
> >> >> +    } else if ((APLIC_SETIE_BASE <=3D addr) &&
> >> >> +            (addr < (APLIC_SETIE_BASE + aplic->bitfield_words *
> 4))) {
> >> >> +        word =3D (addr - APLIC_SETIE_BASE) >> 2;
> >> >> +        return riscv_aplic_read_enabled_word(aplic, word);
> >> >> +    } else if (addr =3D=3D APLIC_SETIENUM) {
> >> >> +        return 0;
> >> >> +    } else if ((APLIC_CLRIE_BASE <=3D addr) &&
> >> >> +            (addr < (APLIC_CLRIE_BASE + aplic->bitfield_words *
> 4))) {
> >> >> +        return 0;
> >> >> +    } else if (addr =3D=3D APLIC_CLRIENUM) {
> >> >> +        return 0;
> >> >> +    } else if (addr =3D=3D APLIC_SETIPNUM_LE) {
> >> >> +        return 0;
> >> >> +    } else if (addr =3D=3D APLIC_SETIPNUM_BE) {
> >> >> +        return 0;
> >> >> +    } else if (addr =3D=3D APLIC_GENMSI) {
> >> >> +        return (aplic->msimode) ? aplic->genmsi : 0;
> >> >> +    } else if ((APLIC_TARGET_BASE <=3D addr) &&
> >> >> +            (addr < (APLIC_TARGET_BASE + (aplic->num_irqs - 1) *
> 4))) {
> >> >> +        irq =3D ((addr - APLIC_TARGET_BASE) >> 2) + 1;
> >> >> +        return aplic->target[irq];
> >> >> +    } else if (!aplic->msimode && (APLIC_IDC_BASE <=3D addr) &&
> >> >> +            (addr < (APLIC_IDC_BASE + aplic->num_harts *
> APLIC_IDC_SIZE))) {
> >> >> +        idc =3D (addr - APLIC_IDC_BASE) / APLIC_IDC_SIZE;
> >> >> +        switch (addr - (APLIC_IDC_BASE + idc * APLIC_IDC_SIZE)) {
> >> >> +        case APLIC_IDC_IDELIVERY:
> >> >> +            return aplic->idelivery[idc];
> >> >> +        case APLIC_IDC_IFORCE:
> >> >> +            return aplic->iforce[idc];
> >> >> +        case APLIC_IDC_ITHRESHOLD:
> >> >> +            return aplic->ithreshold[idc];
> >> >> +        case APLIC_IDC_TOPI:
> >> >> +            return riscv_aplic_idc_topi(aplic, idc);
> >> >> +        case APLIC_IDC_CLAIMI:
> >> >> +            return riscv_aplic_idc_claimi(aplic, idc);
> >> >> +        default:
> >> >> +            goto err;
> >> >> +        };
> >> >> +    }
> >> >> +
> >> >> +err:
> >> >> +    qemu_log_mask(LOG_GUEST_ERROR,
> >> >> +                  "%s: Invalid register read 0x%" HWADDR_PRIx "\n"=
,
> >> >> +                  __func__, addr);
> >> >> +    return 0;
> >> >> +}
> >> >> +
> >> >> +static void riscv_aplic_write(void *opaque, hwaddr addr, uint64_t
> value,
> >> >> +        unsigned size)
> >> >> +{
> >> >> +    RISCVAPLICState *aplic =3D opaque;
> >> >> +    uint32_t irq, word, idc =3D UINT32_MAX;
> >> >> +
> >> >> +    /* Writes must be 4 byte words */
> >> >> +    if ((addr & 0x3) !=3D 0) {
> >> >> +        goto err;
> >> >> +    }
> >> >> +
> >> >> +    if (addr =3D=3D APLIC_DOMAINCFG) {
> >> >> +        /* Only IE bit writeable at the moment */
> >> >> +        value &=3D APLIC_DOMAINCFG_IE;
> >> >> +        aplic->domaincfg =3D value;
> >> >> +    } else if ((APLIC_SOURCECFG_BASE <=3D addr) &&
> >> >> +            (addr < (APLIC_SOURCECFG_BASE + (aplic->num_irqs - 1) =
*
> 4))) {
> >> >> +        irq  =3D ((addr - APLIC_SOURCECFG_BASE) >> 2) + 1;
> >> >> +        if (!aplic->num_children && (value & APLIC_SOURCECFG_D)) {
> >> >> +            value =3D 0;
> >> >> +        }
> >> >> +        if (value & APLIC_SOURCECFG_D) {
> >> >> +            value &=3D (APLIC_SOURCECFG_D |
> APLIC_SOURCECFG_CHILDIDX_MASK);
> >> >> +        } else {
> >> >> +            value &=3D (APLIC_SOURCECFG_D | APLIC_SOURCECFG_SM_MAS=
K);
> >> >> +        }
> >> >> +        aplic->sourcecfg[irq] =3D value;
> >> >> +        if ((aplic->sourcecfg[irq] & APLIC_SOURCECFG_D) ||
> >> >> +            (aplic->sourcecfg[irq] =3D=3D 0)) {
> >> >> +            riscv_aplic_set_pending_raw(aplic, irq, false);
> >> >> +            riscv_aplic_set_enabled_raw(aplic, irq, false);
> >> >> +        }
> >> >> +    } else if (aplic->mmode && aplic->msimode &&
> >> >> +               (addr =3D=3D APLIC_MMSICFGADDR)) {
> >> >> +        if (!(aplic->mmsicfgaddrH & APLIC_xMSICFGADDRH_L)) {
> >> >> +            aplic->mmsicfgaddr =3D value;
> >> >> +        }
> >> >> +    } else if (aplic->mmode && aplic->msimode &&
> >> >> +               (addr =3D=3D APLIC_MMSICFGADDRH)) {
> >> >> +        if (!(aplic->mmsicfgaddrH & APLIC_xMSICFGADDRH_L)) {
> >> >> +            aplic->mmsicfgaddrH =3D value &
> APLIC_xMSICFGADDRH_VALID_MASK;
> >> >> +        }
> >> >> +    } else if (aplic->mmode && aplic->msimode &&
> >> >> +               (addr =3D=3D APLIC_SMSICFGADDR)) {
> >> >> +        /* Registers SMSICFGADDR and SMSICFGADDRH are implemented
> only if:
> >> >> +         * (a) the interrupt domain is at machine level
> >> >> +         * (b) the domain=E2=80=99s harts implement supervisor mod=
e
> >> >> +         * (c) the domain has one or more child supervisor-level
> domains
> >> >> +         *     that support MSI delivery mode (domaincfg.DM is not
> read-
> >> >> +         *     only zero in at least one of the supervisor-level
> child
> >> >> +         * domains).
> >> >> +         */
> >> >> +        if (aplic->num_children &&
> >> >> +            !(aplic->smsicfgaddrH & APLIC_xMSICFGADDRH_L)) {
> >> >> +            aplic->smsicfgaddr =3D value;
> >> >> +        }
> >> >> +    } else if (aplic->mmode && aplic->msimode &&
> >> >> +               (addr =3D=3D APLIC_SMSICFGADDRH)) {
> >> >> +        if (aplic->num_children &&
> >> >> +            !(aplic->smsicfgaddrH & APLIC_xMSICFGADDRH_L)) {
> >> >> +            aplic->smsicfgaddrH =3D value &
> APLIC_xMSICFGADDRH_VALID_MASK;
> >> >> +        }
> >> >> +    } else if ((APLIC_SETIP_BASE <=3D addr) &&
> >> >> +            (addr < (APLIC_SETIP_BASE + aplic->bitfield_words *
> 4))) {
> >> >> +        word =3D (addr - APLIC_SETIP_BASE) >> 2;
> >> >> +        riscv_aplic_set_pending_word(aplic, word, value, true);
> >> >> +    } else if (addr =3D=3D APLIC_SETIPNUM) {
> >> >> +        riscv_aplic_set_pending(aplic, value, true);
> >> >> +    } else if ((APLIC_CLRIP_BASE <=3D addr) &&
> >> >> +            (addr < (APLIC_CLRIP_BASE + aplic->bitfield_words *
> 4))) {
> >> >> +        word =3D (addr - APLIC_CLRIP_BASE) >> 2;
> >> >> +        riscv_aplic_set_pending_word(aplic, word, value, false);
> >> >> +    } else if (addr =3D=3D APLIC_CLRIPNUM) {
> >> >> +        riscv_aplic_set_pending(aplic, value, false);
> >> >> +    } else if ((APLIC_SETIE_BASE <=3D addr) &&
> >> >> +            (addr < (APLIC_SETIE_BASE + aplic->bitfield_words *
> 4))) {
> >> >> +        word =3D (addr - APLIC_SETIE_BASE) >> 2;
> >> >> +        riscv_aplic_set_enabled_word(aplic, word, value, true);
> >> >> +    } else if (addr =3D=3D APLIC_SETIENUM) {
> >> >> +        riscv_aplic_set_enabled(aplic, value, true);
> >> >> +    } else if ((APLIC_CLRIE_BASE <=3D addr) &&
> >> >> +            (addr < (APLIC_CLRIE_BASE + aplic->bitfield_words *
> 4))) {
> >> >> +        word =3D (addr - APLIC_CLRIE_BASE) >> 2;
> >> >> +        riscv_aplic_set_enabled_word(aplic, word, value, false);
> >> >> +    } else if (addr =3D=3D APLIC_CLRIENUM) {
> >> >> +        riscv_aplic_set_enabled(aplic, value, false);
> >> >> +    } else if (addr =3D=3D APLIC_SETIPNUM_LE) {
> >> >> +        riscv_aplic_set_pending(aplic, value, true);
> >> >> +    } else if (addr =3D=3D APLIC_SETIPNUM_BE) {
> >> >> +        riscv_aplic_set_pending(aplic, bswap32(value), true);
> >> >> +    } else if (addr =3D=3D APLIC_GENMSI) {
> >> >> +        if (aplic->msimode) {
> >> >> +            aplic->genmsi =3D value & ~(APLIC_TARGET_GUEST_IDX_MAS=
K <<
> >> >> +                                      APLIC_TARGET_GUEST_IDX_SHIFT=
);
> >> >> +            riscv_aplic_msi_send(aplic,
> >> >> +                                 value >>
> APLIC_TARGET_HART_IDX_SHIFT,
> >> >> +                                 0,
> >> >> +                                 value & APLIC_TARGET_EIID_MASK);
> >> >> +        }
> >> >> +    } else if ((APLIC_TARGET_BASE <=3D addr) &&
> >> >> +            (addr < (APLIC_TARGET_BASE + (aplic->num_irqs - 1) *
> 4))) {
> >> >> +        irq =3D ((addr - APLIC_TARGET_BASE) >> 2) + 1;
> >> >> +        if (aplic->msimode) {
> >> >> +            aplic->target[irq] =3D value;
> >> >> +        } else {
> >> >> +            aplic->target[irq] =3D (value & ~APLIC_TARGET_IPRIO_MA=
SK)
> |
> >> >> +                                 ((value & aplic->iprio_mask) ?
> >> >> +                                  (value & aplic->iprio_mask) : 1)=
;
> >> >> +        }
> >> >> +    } else if (!aplic->msimode && (APLIC_IDC_BASE <=3D addr) &&
> >> >> +            (addr < (APLIC_IDC_BASE + aplic->num_harts *
> APLIC_IDC_SIZE))) {
> >> >> +        idc =3D (addr - APLIC_IDC_BASE) / APLIC_IDC_SIZE;
> >> >> +        switch (addr - (APLIC_IDC_BASE + idc * APLIC_IDC_SIZE)) {
> >> >> +        case APLIC_IDC_IDELIVERY:
> >> >> +            aplic->idelivery[idc] =3D value & 0x1;
> >> >> +            break;
> >> >> +        case APLIC_IDC_IFORCE:
> >> >> +            aplic->iforce[idc] =3D value & 0x1;
> >> >> +            break;
> >> >> +        case APLIC_IDC_ITHRESHOLD:
> >> >> +            aplic->ithreshold[idc] =3D value & aplic->iprio_mask;
> >> >> +            break;
> >> >> +        default:
> >> >> +            goto err;
> >> >> +        };
> >> >> +    } else {
> >> >> +        goto err;
> >> >> +    }
> >> >> +
> >> >> +    if (aplic->msimode) {
> >> >> +        for (irq =3D 1; irq < aplic->num_irqs; irq++) {
> >> >> +            riscv_aplic_msi_irq_update(aplic, irq);
> >> >> +        }
> >> >> +    } else {
> >> >> +        if (idc =3D=3D UINT32_MAX) {
> >> >> +            for (idc =3D 0; idc < aplic->num_harts; idc++) {
> >> >> +                riscv_aplic_idc_update(aplic, idc);
> >> >> +            }
> >> >> +        } else {
> >> >> +            riscv_aplic_idc_update(aplic, idc);
> >> >> +        }
> >> >> +    }
> >> >> +
> >> >> +    return;
> >> >> +
> >> >> +err:
> >> >> +    qemu_log_mask(LOG_GUEST_ERROR,
> >> >> +                  "%s: Invalid register write 0x%" HWADDR_PRIx "\n=
",
> >> >> +                  __func__, addr);
> >> >> +}
> >> >> +
> >> >> +static const MemoryRegionOps riscv_aplic_ops =3D {
> >> >> +    .read =3D riscv_aplic_read,
> >> >> +    .write =3D riscv_aplic_write,
> >> >> +    .endianness =3D DEVICE_LITTLE_ENDIAN,
> >> >> +    .valid =3D {
> >> >> +        .min_access_size =3D 4,
> >> >> +        .max_access_size =3D 4
> >> >> +    }
> >> >> +};
> >> >> +
> >> >> +static void riscv_aplic_realize(DeviceState *dev, Error **errp)
> >> >> +{
> >> >> +    uint32_t i;
> >> >> +    RISCVAPLICState *aplic =3D RISCV_APLIC(dev);
> >> >> +
> >> >> +    aplic->bitfield_words =3D (aplic->num_irqs + 31) >> 5;
> >> >> +    aplic->sourcecfg =3D g_new0(uint32_t, aplic->num_irqs);
> >> >> +    aplic->state =3D g_new(uint32_t, aplic->num_irqs);
> >> >> +    aplic->target =3D g_new0(uint32_t, aplic->num_irqs);
> >> >> +    if (!aplic->msimode) {
> >> >> +        for (i =3D 0; i < aplic->num_irqs; i++) {
> >> >> +            aplic->target[i] =3D 1;
> >> >> +        }
> >> >> +    }
> >> >> +    aplic->idelivery =3D g_new0(uint32_t, aplic->num_harts);
> >> >> +    aplic->iforce =3D g_new0(uint32_t, aplic->num_harts);
> >> >> +    aplic->ithreshold =3D g_new0(uint32_t, aplic->num_harts);
> >> >> +
> >> >> +    memory_region_init_io(&aplic->mmio, OBJECT(dev),
> &riscv_aplic_ops, aplic,
> >> >> +                          TYPE_RISCV_APLIC, aplic->aperture_size);
> >> >> +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &aplic->mmio);
> >> >> +
> >> >> +    /* Only root APLICs have hardware IRQ lines. All non-root APLI=
Cs
> >> >> +     * have IRQ lines delegated by their parent APLIC.
> >> >> +     */
> >> >> +    if (!aplic->parent) {
> >> >> +        qdev_init_gpio_in(dev, riscv_aplic_request,
> aplic->num_irqs);
> >> >> +    }
> >> >> +
> >> >> +    /* Create output IRQ lines for non-MSI mode */
> >> >> +    if (!aplic->msimode) {
> >> >> +        aplic->external_irqs =3D g_malloc(sizeof(qemu_irq) *
> aplic->num_harts);
> >> >> +        qdev_init_gpio_out(dev, aplic->external_irqs,
> aplic->num_harts);
> >> >> +
> >> >> +        /* Claim the CPU interrupt to be triggered by this APLIC *=
/
> >> >> +        for (i =3D 0; i < aplic->num_harts; i++) {
> >> >> +            RISCVCPU *cpu =3D
> RISCV_CPU(qemu_get_cpu(aplic->hartid_base + i));
> >> >> +            if (riscv_cpu_claim_interrupts(cpu,
> >> >> +                (aplic->mmode) ? MIP_MEIP : MIP_SEIP) < 0) {
> >> >> +                error_report("%s already claimed",
> >> >> +                             (aplic->mmode) ? "MEIP" : "SEIP");
> >> >> +                exit(1);
> >> >> +            }
> >> >> +        }
> >> >> +    }
> >> >> +
> >> >> +    msi_nonbroken =3D true;
> >> >> +}
> >> >> +
> >> >> +static Property riscv_aplic_properties[] =3D {
> >> >> +    DEFINE_PROP_UINT32("aperture-size", RISCVAPLICState,
> aperture_size, 0),
> >> >> +    DEFINE_PROP_UINT32("hartid-base", RISCVAPLICState, hartid_base=
,
> 0),
> >> >> +    DEFINE_PROP_UINT32("num-harts", RISCVAPLICState, num_harts, 0)=
,
> >> >> +    DEFINE_PROP_UINT32("iprio-mask", RISCVAPLICState, iprio_mask,
> 0),
> >> >> +    DEFINE_PROP_UINT32("num-irqs", RISCVAPLICState, num_irqs, 0),
> >> >> +    DEFINE_PROP_BOOL("msimode", RISCVAPLICState, msimode, 0),
> >> >> +    DEFINE_PROP_BOOL("mmode", RISCVAPLICState, mmode, 0),
> >> >> +    DEFINE_PROP_END_OF_LIST(),
> >> >> +};
> >> >> +
> >> >> +static const VMStateDescription vmstate_riscv_aplic =3D {
> >> >> +    .name =3D "riscv_aplic",
> >> >> +    .version_id =3D 1,
> >> >> +    .minimum_version_id =3D 1,
> >> >> +    .fields =3D (VMStateField[]) {
> >> >> +            VMSTATE_UINT32(domaincfg, RISCVAPLICState),
> >> >> +            VMSTATE_UINT32(mmsicfgaddr, RISCVAPLICState),
> >> >> +            VMSTATE_UINT32(mmsicfgaddrH, RISCVAPLICState),
> >> >> +            VMSTATE_UINT32(smsicfgaddr, RISCVAPLICState),
> >> >> +            VMSTATE_UINT32(smsicfgaddrH, RISCVAPLICState),
> >> >> +            VMSTATE_UINT32(genmsi, RISCVAPLICState),
> >> >> +            VMSTATE_VARRAY_UINT32(sourcecfg, RISCVAPLICState,
> >> >> +                                  num_irqs, 0,
> >> >> +                                  vmstate_info_uint32, uint32_t),
> >> >> +            VMSTATE_VARRAY_UINT32(state, RISCVAPLICState,
> >> >> +                                  num_irqs, 0,
> >> >> +                                  vmstate_info_uint32, uint32_t),
> >> >> +            VMSTATE_VARRAY_UINT32(target, RISCVAPLICState,
> >> >> +                                  num_irqs, 0,
> >> >> +                                  vmstate_info_uint32, uint32_t),
> >> >> +            VMSTATE_VARRAY_UINT32(idelivery, RISCVAPLICState,
> >> >> +                                  num_harts, 0,
> >> >> +                                  vmstate_info_uint32, uint32_t),
> >> >> +            VMSTATE_VARRAY_UINT32(iforce, RISCVAPLICState,
> >> >> +                                  num_harts, 0,
> >> >> +                                  vmstate_info_uint32, uint32_t),
> >> >> +            VMSTATE_VARRAY_UINT32(ithreshold, RISCVAPLICState,
> >> >> +                                  num_harts, 0,
> >> >> +                                  vmstate_info_uint32, uint32_t),
> >> >> +            VMSTATE_END_OF_LIST()
> >> >> +        }
> >> >> +};
> >> >> +
> >> >> +static void riscv_aplic_class_init(ObjectClass *klass, void *data)
> >> >> +{
> >> >> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> >> >> +
> >> >> +    device_class_set_props(dc, riscv_aplic_properties);
> >> >> +    dc->realize =3D riscv_aplic_realize;
> >> >> +    dc->vmsd =3D &vmstate_riscv_aplic;
> >> >> +}
> >> >> +
> >> >> +static const TypeInfo riscv_aplic_info =3D {
> >> >> +    .name          =3D TYPE_RISCV_APLIC,
> >> >> +    .parent        =3D TYPE_SYS_BUS_DEVICE,
> >> >> +    .instance_size =3D sizeof(RISCVAPLICState),
> >> >> +    .class_init    =3D riscv_aplic_class_init,
> >> >> +};
> >> >> +
> >> >> +static void riscv_aplic_register_types(void)
> >> >> +{
> >> >> +    type_register_static(&riscv_aplic_info);
> >> >> +}
> >> >> +
> >> >> +type_init(riscv_aplic_register_types)
> >> >> +
> >> >> +/*
> >> >> + * Add a APLIC device to another APLIC device as child for
> >> >> + * interrupt delegation.
> >> >> + */
> >> >> +void riscv_aplic_add_child(DeviceState *parent, DeviceState *child=
)
> >> >> +{
> >> >> +    RISCVAPLICState *caplic, *paplic;
> >> >> +
> >> >> +    assert(parent && child);
> >> >> +    caplic =3D RISCV_APLIC(child);
> >> >> +    paplic =3D RISCV_APLIC(parent);
> >> >> +
> >> >> +    assert(paplic->num_irqs =3D=3D caplic->num_irqs);
> >> >> +    assert(paplic->num_children <=3D QEMU_APLIC_MAX_CHILDREN);
> >> >> +
> >> >> +    caplic->parent =3D paplic;
> >> >> +    paplic->children[paplic->num_children] =3D caplic;
> >> >> +    paplic->num_children++;
> >> >> +}
> >> >> +
> >> >> +/*
> >> >> + * Create APLIC device.
> >> >> + */
> >> >> +DeviceState *riscv_aplic_create(hwaddr addr, hwaddr size,
> >> >> +    uint32_t hartid_base, uint32_t num_harts, uint32_t num_sources=
,
> >> >> +    uint32_t iprio_bits, bool msimode, bool mmode, DeviceState
> *parent)
> >> >> +{
> >> >> +    DeviceState *dev =3D qdev_new(TYPE_RISCV_APLIC);
> >> >> +    uint32_t i;
> >> >> +
> >> >> +    assert(num_harts < APLIC_MAX_IDC);
> >> >> +    assert((APLIC_IDC_BASE + (num_harts * APLIC_IDC_SIZE)) <=3D si=
ze);
> >> >> +    assert(num_sources < APLIC_MAX_SOURCE);
> >> >> +    assert(APLIC_MIN_IPRIO_BITS <=3D iprio_bits);
> >> >> +    assert(iprio_bits <=3D APLIC_MAX_IPRIO_BITS);
> >> >> +
> >> >> +    qdev_prop_set_uint32(dev, "aperture-size", size);
> >> >> +    qdev_prop_set_uint32(dev, "hartid-base", hartid_base);
> >> >> +    qdev_prop_set_uint32(dev, "num-harts", num_harts);
> >> >> +    qdev_prop_set_uint32(dev, "iprio-mask", ((1U << iprio_bits) -
> 1));
> >> >> +    qdev_prop_set_uint32(dev, "num-irqs", num_sources + 1);
> >> >> +    qdev_prop_set_bit(dev, "msimode", msimode);
> >> >> +    qdev_prop_set_bit(dev, "mmode", mmode);
> >> >> +
> >> >> +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> >> >> +    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
> >> >> +
> >> >> +    if (parent) {
> >> >> +        riscv_aplic_add_child(parent, dev);
> >> >> +    }
> >> >> +
> >> >> +    if (!msimode) {
> >> >> +        for (i =3D 0; i < num_harts; i++) {
> >> >> +            CPUState *cpu =3D qemu_get_cpu(hartid_base + i);
> >> >> +
> >> >> +            qdev_connect_gpio_out_named(dev, NULL, i,
> >> >> +
> qdev_get_gpio_in(DEVICE(cpu),
> >> >> +                                            (mmode) ? IRQ_M_EXT :
> IRQ_S_EXT));
> >> >> +        }
> >> >> +    }
> >> >> +
> >> >> +    return dev;
> >> >> +}
> >> >> diff --git a/include/hw/intc/riscv_aplic.h
> b/include/hw/intc/riscv_aplic.h
> >> >> new file mode 100644
> >> >> index 0000000000..de8532fbc3
> >> >> --- /dev/null
> >> >> +++ b/include/hw/intc/riscv_aplic.h
> >> >> @@ -0,0 +1,79 @@
> >> >> +/*
> >> >> + * RISC-V APLIC (Advanced Platform Level Interrupt Controller)
> interface
> >> >> + *
> >> >> + * Copyright (c) 2021 Western Digital Corporation or its affiliate=
s.
> >> >> + *
> >> >> + * This program is free software; you can redistribute it and/or
> modify it
> >> >> + * under the terms and conditions of the GNU General Public Licens=
e,
> >> >> + * version 2 or later, as published by the Free Software Foundatio=
n.
> >> >> + *
> >> >> + * This program is distributed in the hope it will be useful, but
> WITHOUT
> >> >> + * ANY WARRANTY; without even the implied warranty of
> MERCHANTABILITY or
> >> >> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public
> License for
> >> >> + * more details.
> >> >> + *
> >> >> + * You should have received a copy of the GNU General Public
> License along with
> >> >> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> >> >> + */
> >> >> +
> >> >> +#ifndef HW_RISCV_APLIC_H
> >> >> +#define HW_RISCV_APLIC_H
> >> >> +
> >> >> +#include "hw/sysbus.h"
> >> >> +#include "qom/object.h"
> >> >> +
> >> >> +#define TYPE_RISCV_APLIC "riscv.aplic"
> >> >> +
> >> >> +typedef struct RISCVAPLICState RISCVAPLICState;
> >> >> +DECLARE_INSTANCE_CHECKER(RISCVAPLICState, RISCV_APLIC,
> TYPE_RISCV_APLIC)
> >> >> +
> >> >> +#define APLIC_MIN_SIZE            0x4000
> >> >> +#define APLIC_SIZE_ALIGN(__x)     (((__x) + (APLIC_MIN_SIZE - 1)) =
&
> \
> >> >> +                                   ~(APLIC_MIN_SIZE - 1))
> >> >> +#define APLIC_SIZE(__num_harts)   (APLIC_MIN_SIZE + \
> >> >> +                                   APLIC_SIZE_ALIGN(32 *
> (__num_harts)))
> >> >> +
> >> >> +struct RISCVAPLICState {
> >> >> +    /*< private >*/
> >> >> +    SysBusDevice parent_obj;
> >> >> +    qemu_irq *external_irqs;
> >> >> +
> >> >> +    /*< public >*/
> >> >> +    MemoryRegion mmio;
> >> >> +    uint32_t bitfield_words;
> >> >> +    uint32_t domaincfg;
> >> >> +    uint32_t mmsicfgaddr;
> >> >> +    uint32_t mmsicfgaddrH;
> >> >> +    uint32_t smsicfgaddr;
> >> >> +    uint32_t smsicfgaddrH;
> >> >> +    uint32_t genmsi;
> >> >> +    uint32_t *sourcecfg;
> >> >> +    uint32_t *state;
> >> >> +    uint32_t *target;
> >> >> +    uint32_t *idelivery;
> >> >> +    uint32_t *iforce;
> >> >> +    uint32_t *ithreshold;
> >> >> +
> >> >> +    /* topology */
> >> >> +#define QEMU_APLIC_MAX_CHILDREN        16
> >> >> +    struct RISCVAPLICState *parent;
> >> >> +    struct RISCVAPLICState *children[QEMU_APLIC_MAX_CHILDREN];
> >> >> +    uint16_t num_children;
> >> >> +
> >> >> +    /* config */
> >> >> +    uint32_t aperture_size;
> >> >> +    uint32_t hartid_base;
> >> >> +    uint32_t num_harts;
> >> >> +    uint32_t iprio_mask;
> >> >> +    uint32_t num_irqs;
> >> >> +    bool msimode;
> >> >> +    bool mmode;
> >> >> +};
> >> >> +
> >> >> +void riscv_aplic_add_child(DeviceState *parent, DeviceState *child=
);
> >> >> +
> >> >> +DeviceState *riscv_aplic_create(hwaddr addr, hwaddr size,
> >> >> +    uint32_t hartid_base, uint32_t num_harts, uint32_t num_sources=
,
> >> >> +    uint32_t iprio_bits, bool msimode, bool mmode, DeviceState
> *parent);
> >> >> +
> >> >> +#endif
> >> >> --
> >> >> 2.25.1
> >> >>
>

--000000000000b4db9205d6036ec9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Jan 20, 2022 at 8:05 PM Anup Pate=
l &lt;<a href=3D"mailto:anup@brainfault.org">anup@brainfault.org</a>&gt; wr=
ote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">On Thu, Jan 20, 2022 at 1:49 PM Frank Chang &lt;<a href=3D"=
mailto:frank.chang@sifive.com" target=3D"_blank">frank.chang@sifive.com</a>=
&gt; wrote:<br>
&gt;<br>
&gt; On Thu, Jan 20, 2022 at 12:20 AM Anup Patel &lt;<a href=3D"mailto:anup=
@brainfault.org" target=3D"_blank">anup@brainfault.org</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Hi Frank,<br>
&gt;&gt;<br>
&gt;&gt; On Wed, Jan 19, 2022 at 9:07 PM Frank Chang &lt;<a href=3D"mailto:=
frank.chang@sifive.com" target=3D"_blank">frank.chang@sifive.com</a>&gt; wr=
ote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Wed, Jan 19, 2022 at 11:27 PM Anup Patel &lt;<a href=3D"ma=
ilto:anup@brainfault.org" target=3D"_blank">anup@brainfault.org</a>&gt; wro=
te:<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; From: Anup Patel &lt;<a href=3D"mailto:anup.patel@wdc.com=
" target=3D"_blank">anup.patel@wdc.com</a>&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; The RISC-V AIA (Advanced Interrupt Architecture) defines =
a new<br>
&gt;&gt; &gt;&gt; interrupt controller for wired interrupts called APLIC (A=
dvanced<br>
&gt;&gt; &gt;&gt; Platform Level Interrupt Controller). The APLIC is capaba=
ble of<br>
&gt;&gt; &gt;&gt; forwarding wired interupts to RISC-V HARTs directly or as=
 MSIs<br>
&gt;&gt; &gt;&gt; (Message Signaled Interupts).<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; This patch adds device emulation for RISC-V AIA APLIC.<br=
>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Signed-off-by: Anup Patel &lt;<a href=3D"mailto:anup.pate=
l@wdc.com" target=3D"_blank">anup.patel@wdc.com</a>&gt;<br>
&gt;&gt; &gt;&gt; Signed-off-by: Anup Patel &lt;<a href=3D"mailto:anup@brai=
nfault.org" target=3D"_blank">anup@brainfault.org</a>&gt;<br>
&gt;&gt; &gt;&gt; Reviewed-by: Frank Chang &lt;<a href=3D"mailto:frank.chan=
g@sifive.com" target=3D"_blank">frank.chang@sifive.com</a>&gt;<br>
&gt;&gt; &gt;&gt; ---<br>
&gt;&gt; &gt;&gt;=C2=A0 hw/intc/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +<br>
&gt;&gt; &gt;&gt;=C2=A0 hw/intc/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt;&gt; &gt;&gt;=C2=A0 hw/intc/riscv_aplic.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 975 ++++++++++++++++++++++++++++++++++<br>
&gt;&gt; &gt;&gt;=C2=A0 include/hw/intc/riscv_aplic.h |=C2=A0 79 +++<br>
&gt;&gt; &gt;&gt;=C2=A0 4 files changed, 1058 insertions(+)<br>
&gt;&gt; &gt;&gt;=C2=A0 create mode 100644 hw/intc/riscv_aplic.c<br>
&gt;&gt; &gt;&gt;=C2=A0 create mode 100644 include/hw/intc/riscv_aplic.h<br=
>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig<br>
&gt;&gt; &gt;&gt; index 010ded7eae..528e77b4a6 100644<br>
&gt;&gt; &gt;&gt; --- a/hw/intc/Kconfig<br>
&gt;&gt; &gt;&gt; +++ b/hw/intc/Kconfig<br>
&gt;&gt; &gt;&gt; @@ -70,6 +70,9 @@ config LOONGSON_LIOINTC<br>
&gt;&gt; &gt;&gt;=C2=A0 config RISCV_ACLINT<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 bool<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; +config RISCV_APLIC<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 bool<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt;=C2=A0 config SIFIVE_PLIC<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 bool<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; diff --git a/hw/intc/meson.build b/hw/intc/meson.build<br=
>
&gt;&gt; &gt;&gt; index 70080bc161..7466024402 100644<br>
&gt;&gt; &gt;&gt; --- a/hw/intc/meson.build<br>
&gt;&gt; &gt;&gt; +++ b/hw/intc/meson.build<br>
&gt;&gt; &gt;&gt; @@ -50,6 +50,7 @@ specific_ss.add(when: &#39;CONFIG_S390_=
FLIC&#39;, if_true: files(&#39;s390_flic.c&#39;))<br>
&gt;&gt; &gt;&gt;=C2=A0 specific_ss.add(when: &#39;CONFIG_S390_FLIC_KVM&#39=
;, if_true: files(&#39;s390_flic_kvm.c&#39;))<br>
&gt;&gt; &gt;&gt;=C2=A0 specific_ss.add(when: &#39;CONFIG_SH_INTC&#39;, if_=
true: files(&#39;sh_intc.c&#39;))<br>
&gt;&gt; &gt;&gt;=C2=A0 specific_ss.add(when: &#39;CONFIG_RISCV_ACLINT&#39;=
, if_true: files(&#39;riscv_aclint.c&#39;))<br>
&gt;&gt; &gt;&gt; +specific_ss.add(when: &#39;CONFIG_RISCV_APLIC&#39;, if_t=
rue: files(&#39;riscv_aplic.c&#39;))<br>
&gt;&gt; &gt;&gt;=C2=A0 specific_ss.add(when: &#39;CONFIG_SIFIVE_PLIC&#39;,=
 if_true: files(&#39;sifive_plic.c&#39;))<br>
&gt;&gt; &gt;&gt;=C2=A0 specific_ss.add(when: &#39;CONFIG_XICS&#39;, if_tru=
e: files(&#39;xics.c&#39;))<br>
&gt;&gt; &gt;&gt;=C2=A0 specific_ss.add(when: [&#39;CONFIG_KVM&#39;, &#39;C=
ONFIG_XICS&#39;],<br>
&gt;&gt; &gt;&gt; diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.=
c<br>
&gt;&gt; &gt;&gt; new file mode 100644<br>
&gt;&gt; &gt;&gt; index 0000000000..885c1de2af<br>
&gt;&gt; &gt;&gt; --- /dev/null<br>
&gt;&gt; &gt;&gt; +++ b/hw/intc/riscv_aplic.c<br>
&gt;&gt; &gt;&gt; @@ -0,0 +1,975 @@<br>
&gt;&gt; &gt;&gt; +/*<br>
&gt;&gt; &gt;&gt; + * RISC-V APLIC (Advanced Platform Level Interrupt Contr=
oller)<br>
&gt;&gt; &gt;&gt; + *<br>
&gt;&gt; &gt;&gt; + * Copyright (c) 2021 Western Digital Corporation or its=
 affiliates.<br>
&gt;&gt; &gt;&gt; + *<br>
&gt;&gt; &gt;&gt; + * This program is free software; you can redistribute i=
t and/or modify it<br>
&gt;&gt; &gt;&gt; + * under the terms and conditions of the GNU General Pub=
lic License,<br>
&gt;&gt; &gt;&gt; + * version 2 or later, as published by the Free Software=
 Foundation.<br>
&gt;&gt; &gt;&gt; + *<br>
&gt;&gt; &gt;&gt; + * This program is distributed in the hope it will be us=
eful, but WITHOUT<br>
&gt;&gt; &gt;&gt; + * ANY WARRANTY; without even the implied warranty of ME=
RCHANTABILITY or<br>
&gt;&gt; &gt;&gt; + * FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the GNU G=
eneral Public License for<br>
&gt;&gt; &gt;&gt; + * more details.<br>
&gt;&gt; &gt;&gt; + *<br>
&gt;&gt; &gt;&gt; + * You should have received a copy of the GNU General Pu=
blic License along with<br>
&gt;&gt; &gt;&gt; + * this program.=C2=A0 If not, see &lt;<a href=3D"http:/=
/www.gnu.org/licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu=
.org/licenses/</a>&gt;.<br>
&gt;&gt; &gt;&gt; + */<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +#include &quot;qemu/osdep.h&quot;<br>
&gt;&gt; &gt;&gt; +#include &quot;qapi/error.h&quot;<br>
&gt;&gt; &gt;&gt; +#include &quot;qemu/log.h&quot;<br>
&gt;&gt; &gt;&gt; +#include &quot;qemu/module.h&quot;<br>
&gt;&gt; &gt;&gt; +#include &quot;qemu/error-report.h&quot;<br>
&gt;&gt; &gt;&gt; +#include &quot;qemu/bswap.h&quot;<br>
&gt;&gt; &gt;&gt; +#include &quot;exec/address-spaces.h&quot;<br>
&gt;&gt; &gt;&gt; +#include &quot;hw/sysbus.h&quot;<br>
&gt;&gt; &gt;&gt; +#include &quot;hw/pci/msi.h&quot;<br>
&gt;&gt; &gt;&gt; +#include &quot;hw/boards.h&quot;<br>
&gt;&gt; &gt;&gt; +#include &quot;hw/qdev-properties.h&quot;<br>
&gt;&gt; &gt;&gt; +#include &quot;hw/intc/riscv_aplic.h&quot;<br>
&gt;&gt; &gt;&gt; +#include &quot;hw/irq.h&quot;<br>
&gt;&gt; &gt;&gt; +#include &quot;target/riscv/cpu.h&quot;<br>
&gt;&gt; &gt;&gt; +#include &quot;sysemu/sysemu.h&quot;<br>
&gt;&gt; &gt;&gt; +#include &quot;migration/vmstate.h&quot;<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +#define APLIC_MAX_IDC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 (1UL &lt;&lt; 14)<br>
&gt;&gt; &gt;&gt; +#define APLIC_MAX_SOURCE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A01024<br>
&gt;&gt; &gt;&gt; +#define APLIC_MIN_IPRIO_BITS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A01<br>
&gt;&gt; &gt;&gt; +#define APLIC_MAX_IPRIO_BITS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A08<br>
&gt;&gt; &gt;&gt; +#define APLIC_MAX_CHILDREN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A01024<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +#define APLIC_DOMAINCFG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 0x0000<br>
&gt;&gt; &gt;&gt; +#define APLIC_DOMAINCFG_RDONLY=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00x80000000<br>
&gt;&gt; &gt;&gt; +#define APLIC_DOMAINCFG_IE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 8)<br>
&gt;&gt; &gt;&gt; +#define APLIC_DOMAINCFG_DM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 2)<br>
&gt;&gt; &gt;&gt; +#define APLIC_DOMAINCFG_BE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 0)<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +#define APLIC_SOURCECFG_BASE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A00x0004<br>
&gt;&gt; &gt;&gt; +#define APLIC_SOURCECFG_D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 (1 &lt;&lt; 10)<br>
&gt;&gt; &gt;&gt; +#define APLIC_SOURCECFG_CHILDIDX_MASK=C2=A0 0x000003ff<b=
r>
&gt;&gt; &gt;&gt; +#define APLIC_SOURCECFG_SM_MASK=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 0x00000007<br>
&gt;&gt; &gt;&gt; +#define APLIC_SOURCECFG_SM_INACTIVE=C2=A0 =C2=A0 0x0<br>
&gt;&gt; &gt;&gt; +#define APLIC_SOURCECFG_SM_DETACH=C2=A0 =C2=A0 =C2=A0 0x=
1<br>
&gt;&gt; &gt;&gt; +#define APLIC_SOURCECFG_SM_EDGE_RISE=C2=A0 =C2=A00x4<br>
&gt;&gt; &gt;&gt; +#define APLIC_SOURCECFG_SM_EDGE_FALL=C2=A0 =C2=A00x5<br>
&gt;&gt; &gt;&gt; +#define APLIC_SOURCECFG_SM_LEVEL_HIGH=C2=A0 0x6<br>
&gt;&gt; &gt;&gt; +#define APLIC_SOURCECFG_SM_LEVEL_LOW=C2=A0 =C2=A00x7<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +#define APLIC_MMSICFGADDR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0x1bc0<br>
&gt;&gt; &gt;&gt; +#define APLIC_MMSICFGADDRH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A00x1bc4<br>
&gt;&gt; &gt;&gt; +#define APLIC_SMSICFGADDR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0x1bc8<br>
&gt;&gt; &gt;&gt; +#define APLIC_SMSICFGADDRH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A00x1bcc<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +#define APLIC_xMSICFGADDRH_L=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0(1UL &lt;&lt; 31)<br>
&gt;&gt; &gt;&gt; +#define APLIC_xMSICFGADDRH_HHXS_MASK=C2=A0 =C2=A00x1f<br=
>
&gt;&gt; &gt;&gt; +#define APLIC_xMSICFGADDRH_HHXS_SHIFT=C2=A0 24<br>
&gt;&gt; &gt;&gt; +#define APLIC_xMSICFGADDRH_LHXS_MASK=C2=A0 =C2=A00x7<br>
&gt;&gt; &gt;&gt; +#define APLIC_xMSICFGADDRH_LHXS_SHIFT=C2=A0 20<br>
&gt;&gt; &gt;&gt; +#define APLIC_xMSICFGADDRH_HHXW_MASK=C2=A0 =C2=A00x7<br>
&gt;&gt; &gt;&gt; +#define APLIC_xMSICFGADDRH_HHXW_SHIFT=C2=A0 16<br>
&gt;&gt; &gt;&gt; +#define APLIC_xMSICFGADDRH_LHXW_MASK=C2=A0 =C2=A00xf<br>
&gt;&gt; &gt;&gt; +#define APLIC_xMSICFGADDRH_LHXW_SHIFT=C2=A0 12<br>
&gt;&gt; &gt;&gt; +#define APLIC_xMSICFGADDRH_BAPPN_MASK=C2=A0 0xfff<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +#define APLIC_xMSICFGADDR_PPN_SHIFT=C2=A0 =C2=A0 12<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +#define APLIC_xMSICFGADDR_PPN_HART(__lhxs) \<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 ((1UL &lt;&lt; (__lhxs)) - 1)<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +#define APLIC_xMSICFGADDR_PPN_LHX_MASK(__lhxw) \<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 ((1UL &lt;&lt; (__lhxw)) - 1)<br>
&gt;&gt; &gt;&gt; +#define APLIC_xMSICFGADDR_PPN_LHX_SHIFT(__lhxs) \<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 ((__lhxs))<br>
&gt;&gt; &gt;&gt; +#define APLIC_xMSICFGADDR_PPN_LHX(__lhxw, __lhxs) \<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 (APLIC_xMSICFGADDR_PPN_LHX_MASK(__lhxw) &l=
t;&lt; \<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0APLIC_xMSICFGADDR_PPN_LHX_SHIFT(__lh=
xs))<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +#define APLIC_xMSICFGADDR_PPN_HHX_MASK(__hhxw) \<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 ((1UL &lt;&lt; (__hhxw)) - 1)<br>
&gt;&gt; &gt;&gt; +#define APLIC_xMSICFGADDR_PPN_HHX_SHIFT(__hhxs) \<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 ((__hhxs) + APLIC_xMSICFGADDR_PPN_SHIFT)<b=
r>
&gt;&gt; &gt;&gt; +#define APLIC_xMSICFGADDR_PPN_HHX(__hhxw, __hhxs) \<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 (APLIC_xMSICFGADDR_PPN_HHX_MASK(__hhxw) &l=
t;&lt; \<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0APLIC_xMSICFGADDR_PPN_HHX_SHIFT(__hh=
xs))<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +#define APLIC_xMSICFGADDRH_VALID_MASK=C2=A0 =C2=A0\<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 (APLIC_xMSICFGADDRH_L | \<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0(APLIC_xMSICFGADDRH_HHXS_MASK &lt;&l=
t; APLIC_xMSICFGADDRH_HHXS_SHIFT) | \<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0(APLIC_xMSICFGADDRH_LHXS_MASK &lt;&l=
t; APLIC_xMSICFGADDRH_LHXS_SHIFT) | \<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0(APLIC_xMSICFGADDRH_HHXW_MASK &lt;&l=
t; APLIC_xMSICFGADDRH_HHXW_SHIFT) | \<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0(APLIC_xMSICFGADDRH_LHXW_MASK &lt;&l=
t; APLIC_xMSICFGADDRH_LHXW_SHIFT) | \<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0APLIC_xMSICFGADDRH_BAPPN_MASK)<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +#define APLIC_SETIP_BASE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A00x1c00<br>
&gt;&gt; &gt;&gt; +#define APLIC_SETIPNUM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A00x1cdc<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +#define APLIC_CLRIP_BASE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A00x1d00<br>
&gt;&gt; &gt;&gt; +#define APLIC_CLRIPNUM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A00x1ddc<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +#define APLIC_SETIE_BASE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A00x1e00<br>
&gt;&gt; &gt;&gt; +#define APLIC_SETIENUM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A00x1edc<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +#define APLIC_CLRIE_BASE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A00x1f00<br>
&gt;&gt; &gt;&gt; +#define APLIC_CLRIENUM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A00x1fdc<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +#define APLIC_SETIPNUM_LE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0x2000<br>
&gt;&gt; &gt;&gt; +#define APLIC_SETIPNUM_BE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0x2004<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +#define APLIC_ISTATE_PENDING=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0(1U &lt;&lt; 0)<br>
&gt;&gt; &gt;&gt; +#define APLIC_ISTATE_ENABLED=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0(1U &lt;&lt; 1)<br>
&gt;&gt; &gt;&gt; +#define APLIC_ISTATE_ENPEND=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 (APLIC_ISTATE_ENABLED | \<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 APLIC_ISTATE_PENDING)<br>
&gt;&gt; &gt;&gt; +#define APLIC_ISTATE_INPUT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0(1U &lt;&lt; 8)<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +#define APLIC_GENMSI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x3000<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +#define APLIC_TARGET_BASE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0x3004<br>
&gt;&gt; &gt;&gt; +#define APLIC_TARGET_HART_IDX_SHIFT=C2=A0 =C2=A0 18<br>
&gt;&gt; &gt;&gt; +#define APLIC_TARGET_HART_IDX_MASK=C2=A0 =C2=A0 =C2=A00x=
3fff<br>
&gt;&gt; &gt;&gt; +#define APLIC_TARGET_GUEST_IDX_SHIFT=C2=A0 =C2=A012<br>
&gt;&gt; &gt;&gt; +#define APLIC_TARGET_GUEST_IDX_MASK=C2=A0 =C2=A0 0x3f<br=
>
&gt;&gt; &gt;&gt; +#define APLIC_TARGET_IPRIO_MASK=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 0xff<br>
&gt;&gt; &gt;&gt; +#define APLIC_TARGET_EIID_MASK=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00x7ff<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +#define APLIC_IDC_BASE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A00x4000<br>
&gt;&gt; &gt;&gt; +#define APLIC_IDC_SIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A032<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +#define APLIC_IDC_IDELIVERY=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 0x00<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +#define APLIC_IDC_IFORCE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A00x04<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +#define APLIC_IDC_ITHRESHOLD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A00x08<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +#define APLIC_IDC_TOPI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A00x18<br>
&gt;&gt; &gt;&gt; +#define APLIC_IDC_TOPI_ID_SHIFT=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 16<br>
&gt;&gt; &gt;&gt; +#define APLIC_IDC_TOPI_ID_MASK=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00x3ff<br>
&gt;&gt; &gt;&gt; +#define APLIC_IDC_TOPI_PRIO_MASK=C2=A0 =C2=A0 =C2=A0 =C2=
=A00xff<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +#define APLIC_IDC_CLAIMI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A00x1c<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +static uint32_t riscv_aplic_read_input_word(RISCVAPLICSt=
ate *aplic,<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t word)<br>
&gt;&gt; &gt;&gt; +{<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 uint32_t i, irq, ret =3D 0;<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 for (i =3D 0; i &lt; 32; i++) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 irq =3D word * 32 + i;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!irq || aplic-&gt;num_ir=
qs &lt;=3D irq) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret |=3D ((aplic-&gt;state[i=
rq] &amp; APLIC_ISTATE_INPUT) ? 1 : 0) &lt;&lt; i;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 return ret;<br>
&gt;&gt; &gt;&gt; +}<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +static uint32_t riscv_aplic_read_pending_word(RISCVAPLIC=
State *aplic,<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t word)<br>
&gt;&gt; &gt;&gt; +{<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 uint32_t i, irq, ret =3D 0;<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 for (i =3D 0; i &lt; 32; i++) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 irq =3D word * 32 + i;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!irq || aplic-&gt;num_ir=
qs &lt;=3D irq) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret |=3D ((aplic-&gt;state[i=
rq] &amp; APLIC_ISTATE_PENDING) ? 1 : 0) &lt;&lt; i;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 return ret;<br>
&gt;&gt; &gt;&gt; +}<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +static void riscv_aplic_set_pending_raw(RISCVAPLICState =
*aplic,<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 uint32_t irq, bool pending)<br>
&gt;&gt; &gt;&gt; +{<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 if (pending) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 aplic-&gt;state[irq] |=3D AP=
LIC_ISTATE_PENDING;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 } else {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 aplic-&gt;state[irq] &amp;=
=3D ~APLIC_ISTATE_PENDING;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +}<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +static void riscv_aplic_set_pending(RISCVAPLICState *apl=
ic,<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint3=
2_t irq, bool pending)<br>
&gt;&gt; &gt;&gt; +{<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 uint32_t sourcecfg, sm;<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 if ((irq &lt;=3D 0) || (aplic-&gt;num_irqs=
 &lt;=3D irq)) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 sourcecfg =3D aplic-&gt;sourcecfg[irq];<br=
>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 if (sourcecfg &amp; APLIC_SOURCECFG_D) {<b=
r>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 sm =3D sourcecfg &amp; APLIC_SOURCECFG_SM_=
MASK;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 if ((sm =3D=3D APLIC_SOURCECFG_SM_INACTIVE=
) ||<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ((!aplic-&gt;msimode || (apl=
ic-&gt;msimode &amp;&amp; !pending)) &amp;&amp;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((sm =3D=3D APLIC_SOUR=
CECFG_SM_LEVEL_HIGH) ||<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (sm =3D=3D APLIC_SOUR=
CECFG_SM_LEVEL_LOW)))) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 riscv_aplic_set_pending_raw(aplic, irq, pe=
nding);<br>
&gt;&gt; &gt;&gt; +}<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +static void riscv_aplic_set_pending_word(RISCVAPLICState=
 *aplic,<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0uint32_t word, uint32_t value,<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0bool pending)<br>
&gt;&gt; &gt;&gt; +{<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 uint32_t i, irq;<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 for (i =3D 0; i &lt; 32; i++) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 irq =3D word * 32 + i;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!irq || aplic-&gt;num_ir=
qs &lt;=3D irq) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (value &amp; (1U &lt;&lt;=
 i)) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_aplic_se=
t_pending(aplic, irq, pending);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +}<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +static uint32_t riscv_aplic_read_enabled_word(RISCVAPLIC=
State *aplic,<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int word)<br>
&gt;&gt; &gt;&gt; +{<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 uint32_t i, irq, ret =3D 0;<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 for (i =3D 0; i &lt; 32; i++) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 irq =3D word * 32 + i;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!irq || aplic-&gt;num_ir=
qs &lt;=3D irq) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret |=3D ((aplic-&gt;state[i=
rq] &amp; APLIC_ISTATE_ENABLED) ? 1 : 0) &lt;&lt; i;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 return ret;<br>
&gt;&gt; &gt;&gt; +}<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +static void riscv_aplic_set_enabled_raw(RISCVAPLICState =
*aplic,<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 uint32_t irq, bool enabled)<br>
&gt;&gt; &gt;&gt; +{<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 if (enabled) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 aplic-&gt;state[irq] |=3D AP=
LIC_ISTATE_ENABLED;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 } else {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 aplic-&gt;state[irq] &amp;=
=3D ~APLIC_ISTATE_ENABLED;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +}<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +static void riscv_aplic_set_enabled(RISCVAPLICState *apl=
ic,<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint3=
2_t irq, bool enabled)<br>
&gt;&gt; &gt;&gt; +{<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 uint32_t sourcecfg, sm;<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 if ((irq &lt;=3D 0) || (aplic-&gt;num_irqs=
 &lt;=3D irq)) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 sourcecfg =3D aplic-&gt;sourcecfg[irq];<br=
>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 if (sourcecfg &amp; APLIC_SOURCECFG_D) {<b=
r>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 sm =3D sourcecfg &amp; APLIC_SOURCECFG_SM_=
MASK;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 if (sm =3D=3D APLIC_SOURCECFG_SM_INACTIVE)=
 {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 riscv_aplic_set_enabled_raw(aplic, irq, en=
abled);<br>
&gt;&gt; &gt;&gt; +}<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +static void riscv_aplic_set_enabled_word(RISCVAPLICState=
 *aplic,<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0uint32_t word, uint32_t value,<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0bool enabled)<br>
&gt;&gt; &gt;&gt; +{<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 uint32_t i, irq;<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 for (i =3D 0; i &lt; 32; i++) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 irq =3D word * 32 + i;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!irq || aplic-&gt;num_ir=
qs &lt;=3D irq) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (value &amp; (1U &lt;&lt;=
 i)) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_aplic_se=
t_enabled(aplic, irq, enabled);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +}<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +static void riscv_aplic_msi_send(RISCVAPLICState *aplic,=
<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t hart=
_idx, uint32_t guest_idx,<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t eiid=
)<br>
&gt;&gt; &gt;&gt; +{<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 uint64_t addr;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 MemTxResult result;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 RISCVAPLICState *aplic_m;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 uint32_t lhxs, lhxw, hhxs, hhxw, group_idx=
, msicfgaddr, msicfgaddrH;<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 aplic_m =3D aplic;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 while (aplic_m &amp;&amp; !aplic_m-&gt;mmo=
de) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 aplic_m =3D aplic_m-&gt;pare=
nt;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 if (!aplic_m) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERRO=
R, &quot;%s: m-level APLIC not found\n&quot;,<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 __func__);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 if (aplic-&gt;mmode) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 msicfgaddr =3D aplic_m-&gt;m=
msicfgaddr;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 msicfgaddrH =3D aplic_m-&gt;=
mmsicfgaddrH;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 } else {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 msicfgaddr =3D aplic_m-&gt;s=
msicfgaddr;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 msicfgaddrH =3D aplic_m-&gt;=
smsicfgaddrH;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 lhxs =3D (msicfgaddrH &gt;&gt; APLIC_xMSIC=
FGADDRH_LHXS_SHIFT) &amp;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 APLIC_xMSICFGA=
DDRH_LHXS_MASK;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 lhxw =3D (msicfgaddrH &gt;&gt; APLIC_xMSIC=
FGADDRH_LHXW_SHIFT) &amp;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 APLIC_xMSICFGA=
DDRH_LHXW_MASK;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 hhxs =3D (msicfgaddrH &gt;&gt; APLIC_xMSIC=
FGADDRH_HHXS_SHIFT) &amp;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 APLIC_xMSICFGA=
DDRH_HHXS_MASK;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 hhxw =3D (msicfgaddrH &gt;&gt; APLIC_xMSIC=
FGADDRH_HHXW_SHIFT) &amp;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 APLIC_xMSICFGA=
DDRH_HHXW_MASK;<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 group_idx =3D hart_idx &gt;&gt; lhxw;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 hart_idx &amp;=3D APLIC_xMSICFGADDR_PPN_LH=
X_MASK(lhxw);<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 addr =3D msicfgaddr;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 addr |=3D ((uint64_t)(msicfgaddrH &amp; AP=
LIC_xMSICFGADDRH_BAPPN_MASK)) &lt;&lt; 32;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 addr |=3D ((uint64_t)(group_idx &amp; APLI=
C_xMSICFGADDR_PPN_HHX_MASK(hhxw))) &lt;&lt;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0APLIC_xM=
SICFGADDR_PPN_HHX_SHIFT(hhxs);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 addr |=3D ((uint64_t)(hart_idx &amp; APLIC=
_xMSICFGADDR_PPN_LHX_MASK(lhxw))) &lt;&lt;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0APLIC_xM=
SICFGADDR_PPN_LHX_SHIFT(lhxs);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 addr |=3D (uint64_t)(guest_idx &amp; APLIC=
_xMSICFGADDR_PPN_HART(lhxs));<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 addr &lt;&lt;=3D APLIC_xMSICFGADDR_PPN_SHI=
FT;<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 address_space_stl_le(&amp;address_space_me=
mory, addr,<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0eiid, MEMTXATTRS_UNSPECIFIED, &amp;result=
);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 if (result !=3D MEMTX_OK) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERRO=
R, &quot;%s: MSI write failed for &quot;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &quot;hart_index=3D%d guest_index=3D%d eiid=3D%d\n&quo=
t;,<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 __func__, hart_idx, guest_idx, eiid);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +}<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +static void riscv_aplic_msi_irq_update(RISCVAPLICState *=
aplic, uint32_t irq)<br>
&gt;&gt; &gt;&gt; +{<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 uint32_t hart_idx, guest_idx, eiid;<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 if (!aplic-&gt;msimode || (aplic-&gt;num_i=
rqs &lt;=3D irq) ||<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 !(aplic-&gt;domaincfg &amp; =
APLIC_DOMAINCFG_IE)) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 if ((aplic-&gt;state[irq] &amp; APLIC_ISTA=
TE_ENPEND) !=3D APLIC_ISTATE_ENPEND) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 riscv_aplic_set_pending_raw(aplic, irq, fa=
lse);<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 hart_idx =3D aplic-&gt;target[irq] &gt;&gt=
; APLIC_TARGET_HART_IDX_SHIFT;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 hart_idx &amp;=3D APLIC_TARGET_HART_IDX_MA=
SK;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Hi Anup,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I&#39;m wondering does the hart_idx here has to use Machine-l=
evel hart index<br>
&gt;&gt; &gt; for Supervisor-level interrupt domain?<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; According to AIA spec for supervisor-level domin (Section 4.8=
.1):<br>
&gt;&gt; &gt;=C2=A0 =C2=A0For a supervisor-level domain, &quot;if&quot; MSI=
 target addresses are determined by the parent domain=E2=80=99s<br>
&gt;&gt; &gt;=C2=A0 =C2=A0smsiaddrcfg and smsiaddrcfgh registers, then to c=
onstruct the address for an outgoing MSI for<br>
&gt;&gt; &gt;=C2=A0 =C2=A0interrupt source i, the Hart Index from register =
target[i] must first be converted into the index<br>
&gt;&gt; &gt;=C2=A0 =C2=A0that the machine-level parent domain uses for the=
 same hart. (Typically, these numbers are the<br>
&gt;&gt; &gt;=C2=A0 =C2=A0same, but they may not be.) The address for the M=
SI is then computed using this &quot;machine-level&quot;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0hart index, the parent domain=E2=80=99s smsiaddrc=
fg and smsiaddrcfgh, and the Guest Index value from<br>
&gt;&gt; &gt;=C2=A0 =C2=A0target[i].<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; The description of converting target[i] hart Index to machine=
-level hart index in the spec<br>
&gt;&gt; &gt; is quite vague to me.<br>
&gt;&gt;<br>
&gt;&gt; The &quot;Section 4.3 Hart index numbers&quot; states the followin=
g:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0The index number a domain associates with a har=
t may or may not<br>
&gt;&gt; have any relationship<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0to the unique hart identifier (=E2=80=9Chart ID=
=E2=80=9D) that the RISC-V<br>
&gt;&gt; Privileged Architecture assigns to<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0the hart.<br>
&gt;&gt;<br>
&gt;&gt; For APLIC direct mode, if N harts are associated with a given doma=
in<br>
&gt;&gt; then APLIC associates<br>
&gt;&gt; hart index from 0 to N-1 which are basically APLIC IDC numbers. In=
<br>
&gt;&gt; this case, the APLIC<br>
&gt;&gt; hart index is not related to &quot;machine-level&quot; hart index =
so software<br>
&gt;&gt; has to discover it from the<br>
&gt;&gt; &quot;interrupt-extended&quot; DT property (or similar for ACPI).<=
br>
&gt;&gt;<br>
&gt;&gt; For APLIC msi mode, the APLIC can basically target any HART using =
information in<br>
&gt;&gt; [m|s]msiaddrcfg registers and interrupt target registers. In this<=
br>
&gt;&gt; case, the APLIC hart<br>
&gt;&gt; index in the APLIC target register is a combination of IMSIC group=
<br>
&gt;&gt; index (g) and IMSIC<br>
&gt;&gt; hart index (h) and the APLIC target register also provides IMSIC g=
uest<br>
&gt;&gt; index. In other<br>
&gt;&gt; words, the APLIC hart index for msi mode is also not related to th=
e<br>
&gt;&gt; &quot;machine-level&quot; hart<br>
&gt;&gt; index. The APLIC driver will figure-out/extract the IMSIC group in=
dex<br>
&gt;&gt; (g), IMSIC hart<br>
&gt;&gt; index (h), and IMSIC guest index from target MSI address when Linu=
x<br>
&gt;&gt; tries to write<br>
&gt;&gt; target MSI address for a particular APLIC interrupt.<br>
&gt;&gt;<br>
&gt;&gt; Regards,<br>
&gt;&gt; Anup<br>
&gt;<br>
&gt;<br>
&gt; Hi Anup,<br>
&gt;<br>
&gt; Thanks for the detailed explanation.<br>
&gt;<br>
&gt; I think it&#39;s the formula in the AIA spec which confused me:<br>
&gt;=C2=A0 =C2=A0g =3D (machine-level hart index &gt;&gt; LHXW) &amp; (2^HH=
XW =E2=88=92 1)<br>
&gt;=C2=A0 =C2=A0h =3D machine-level hart index &amp; (2^LHXW =E2=88=92 1)<=
br>
&gt;=C2=A0 =C2=A0MSI address =3D=C2=A0 (Base PPN | (g &lt;&lt; (HHXS + 12))=
 | (h &lt;&lt; LHXS) | Guest Index) &lt;&lt; 12<br>
&gt;<br>
&gt; The term &quot;machine-level hart index&quot; makes me thought that<br=
>
&gt; we should use the hart index from parent machine-level interrupt domai=
n.<br>
<br>
Yes, the term &quot;machine-level hart index&quot; is confusing. In reality=
, it is the<br>
&quot;hart index&quot; in the APLIC interrupt target registers.<br>
<br>
&gt;<br>
&gt; So it&#39;s driver&#39;s responsibility to figure out the correct IMSI=
C hart index, guest index<br>
&gt; it wants to forward the MSI to and configure them to the target[i] reg=
ister?<br>
<br>
Yes, that&#39;s correct.<br>
<br>
&gt;<br>
&gt; From hardware (QEMU)&#39;s perspective, it just needs to extract<br>
&gt; the Hart index, Guest index out from target[irq] register in IRQ&#39;s=
 interrupt domain<br>
&gt; and calculate the MSI address with the PPN from parent interrupt domai=
n&#39;s<br>
&gt; m/smsiaddrcfg and m/smsiaddrcfgh?<br>
<br>
Yes, that&#39;s correct.<br>
<br>
The [m|s]msiaddrcfg registers are only available in the root APLIC domain<b=
r>
and M-mode runtime firmware (OpenSBI) has to initialize it correctly.<br>
<br>
The APLIC Linux/OS driver has to ensure that APLIC interrupt target registe=
rs<br>
are programmed properly so that APLIC can generate the correct output MSI<b=
r>
address.<br>
<br>
Regards,<br>
Anup<br></blockquote><div><br></div><div>Thanks Anup,</div><div><br></div><=
div>That&#39;s really helpful :)</div><div><br></div><div>Regards,</div><di=
v>Frank Chang=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;<br>
&gt; Regards,<br>
&gt; Frank Chang<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Regards,<br>
&gt;&gt; &gt; Frank Chang<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 if (aplic-&gt;mmode) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* M-level APLIC ignores gue=
st_index */<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 guest_idx =3D 0;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 } else {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 guest_idx =3D aplic-&gt;targ=
et[irq] &gt;&gt; APLIC_TARGET_GUEST_IDX_SHIFT;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 guest_idx &amp;=3D APLIC_TAR=
GET_GUEST_IDX_MASK;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 eiid =3D aplic-&gt;target[irq] &amp; APLIC=
_TARGET_EIID_MASK;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 riscv_aplic_msi_send(aplic, hart_idx, gues=
t_idx, eiid);<br>
&gt;&gt; &gt;&gt; +}<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +static uint32_t riscv_aplic_idc_topi(RISCVAPLICState *ap=
lic, uint32_t idc)<br>
&gt;&gt; &gt;&gt; +{<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 uint32_t best_irq, best_iprio;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 uint32_t irq, iprio, ihartidx, ithres;<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 if (aplic-&gt;num_harts &lt;=3D idc) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 ithres =3D aplic-&gt;ithreshold[idc];<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 best_irq =3D best_iprio =3D UINT32_MAX;<br=
>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 for (irq =3D 1; irq &lt; aplic-&gt;num_irq=
s; irq++) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((aplic-&gt;state[irq] &a=
mp; APLIC_ISTATE_ENPEND) !=3D<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 APLIC_ISTATE_E=
NPEND) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ihartidx =3D aplic-&gt;targe=
t[irq] &gt;&gt; APLIC_TARGET_HART_IDX_SHIFT;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ihartidx &amp;=3D APLIC_TARG=
ET_HART_IDX_MASK;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ihartidx !=3D idc) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 iprio =3D aplic-&gt;target[i=
rq] &amp; aplic-&gt;iprio_mask;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ithres &amp;&amp; iprio =
&gt;=3D ithres) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (iprio &lt; best_iprio) {=
<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 best_irq =3D i=
rq;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 best_iprio =3D=
 iprio;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 if (best_irq &lt; aplic-&gt;num_irqs &amp;=
&amp; best_iprio &lt;=3D aplic-&gt;iprio_mask) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return (best_irq &lt;&lt; AP=
LIC_IDC_TOPI_ID_SHIFT) | best_iprio;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 return 0;<br>
&gt;&gt; &gt;&gt; +}<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +static void riscv_aplic_idc_update(RISCVAPLICState *apli=
c, uint32_t idc)<br>
&gt;&gt; &gt;&gt; +{<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 uint32_t topi;<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 if (aplic-&gt;msimode || aplic-&gt;num_har=
ts &lt;=3D idc) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 topi =3D riscv_aplic_idc_topi(aplic, idc);=
<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 if ((aplic-&gt;domaincfg &amp; APLIC_DOMAI=
NCFG_IE) &amp;&amp;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 aplic-&gt;idelivery[idc] &am=
p;&amp;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 (aplic-&gt;iforce[idc] || to=
pi)) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_irq_raise(aplic-&gt;ext=
ernal_irqs[idc]);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 } else {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_irq_lower(aplic-&gt;ext=
ernal_irqs[idc]);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +}<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +static uint32_t riscv_aplic_idc_claimi(RISCVAPLICState *=
aplic, uint32_t idc)<br>
&gt;&gt; &gt;&gt; +{<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 uint32_t irq, state, sm, topi =3D riscv_ap=
lic_idc_topi(aplic, idc);<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 if (!topi) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 aplic-&gt;iforce[idc] =3D 0;=
<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 irq =3D (topi &gt;&gt; APLIC_IDC_TOPI_ID_S=
HIFT) &amp; APLIC_IDC_TOPI_ID_MASK;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 sm =3D aplic-&gt;sourcecfg[irq] &amp; APLI=
C_SOURCECFG_SM_MASK;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 state =3D aplic-&gt;state[irq];<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 riscv_aplic_set_pending_raw(aplic, irq, fa=
lse);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 if ((sm =3D=3D APLIC_SOURCECFG_SM_LEVEL_HI=
GH) &amp;&amp;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 (state &amp; APLIC_ISTATE_IN=
PUT)) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_aplic_set_pending_raw(=
aplic, irq, true);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 } else if ((sm =3D=3D APLIC_SOURCECFG_SM_L=
EVEL_LOW) &amp;&amp;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!=
(state &amp; APLIC_ISTATE_INPUT)) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_aplic_set_pending_raw(=
aplic, irq, true);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 riscv_aplic_idc_update(aplic, idc);<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 return topi;<br>
&gt;&gt; &gt;&gt; +}<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +static void riscv_aplic_request(void *opaque, int irq, i=
nt level)<br>
&gt;&gt; &gt;&gt; +{<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 bool update =3D false;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 RISCVAPLICState *aplic =3D opaque;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 uint32_t sourcecfg, childidx, state, idc;<=
br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 assert((0 &lt; irq) &amp;&amp; (irq &lt; a=
plic-&gt;num_irqs));<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 sourcecfg =3D aplic-&gt;sourcecfg[irq];<br=
>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 if (sourcecfg &amp; APLIC_SOURCECFG_D) {<b=
r>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 childidx =3D sourcecfg &amp;=
 APLIC_SOURCECFG_CHILDIDX_MASK;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (childidx &lt; aplic-&gt;=
num_children) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_aplic_re=
quest(aplic-&gt;children[childidx], irq, level);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 state =3D aplic-&gt;state[irq];<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 switch (sourcecfg &amp; APLIC_SOURCECFG_SM=
_MASK) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 case APLIC_SOURCECFG_SM_EDGE_RISE:<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((level &gt; 0) &amp;&amp=
; !(state &amp; APLIC_ISTATE_INPUT) &amp;&amp;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !(state &amp; =
APLIC_ISTATE_PENDING)) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_aplic_se=
t_pending_raw(aplic, irq, true);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 update =3D tru=
e;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 case APLIC_SOURCECFG_SM_EDGE_FALL:<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((level &lt;=3D 0) &amp;&=
amp; (state &amp; APLIC_ISTATE_INPUT) &amp;&amp;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !(state &amp; =
APLIC_ISTATE_PENDING)) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_aplic_se=
t_pending_raw(aplic, irq, true);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 update =3D tru=
e;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 case APLIC_SOURCECFG_SM_LEVEL_HIGH:<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((level &gt; 0) &amp;&amp=
; !(state &amp; APLIC_ISTATE_PENDING)) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_aplic_se=
t_pending_raw(aplic, irq, true);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 update =3D tru=
e;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 case APLIC_SOURCECFG_SM_LEVEL_LOW:<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((level &lt;=3D 0) &amp;&=
amp; !(state &amp; APLIC_ISTATE_PENDING)) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_aplic_se=
t_pending_raw(aplic, irq, true);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 update =3D tru=
e;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 default:<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 if (level &lt;=3D 0) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 aplic-&gt;state[irq] &amp;=
=3D ~APLIC_ISTATE_INPUT;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 } else {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 aplic-&gt;state[irq] |=3D AP=
LIC_ISTATE_INPUT;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 if (update) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (aplic-&gt;msimode) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_aplic_ms=
i_irq_update(aplic, irq);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 idc =3D aplic-=
&gt;target[irq] &gt;&gt; APLIC_TARGET_HART_IDX_SHIFT;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 idc &amp;=3D A=
PLIC_TARGET_HART_IDX_MASK;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_aplic_id=
c_update(aplic, idc);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +}<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +static uint64_t riscv_aplic_read(void *opaque, hwaddr ad=
dr, unsigned size)<br>
&gt;&gt; &gt;&gt; +{<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 uint32_t irq, word, idc;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 RISCVAPLICState *aplic =3D opaque;<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 /* Reads must be 4 byte words */<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 if ((addr &amp; 0x3) !=3D 0) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 if (addr =3D=3D APLIC_DOMAINCFG) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return APLIC_DOMAINCFG_RDONL=
Y | aplic-&gt;domaincfg |<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(=
aplic-&gt;msimode ? APLIC_DOMAINCFG_DM : 0);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 } else if ((APLIC_SOURCECFG_BASE &lt;=3D a=
ddr) &amp;&amp;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (addr &lt; (AP=
LIC_SOURCECFG_BASE + (aplic-&gt;num_irqs - 1) * 4))) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 irq=C2=A0 =3D ((addr - APLIC=
_SOURCECFG_BASE) &gt;&gt; 2) + 1;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return aplic-&gt;sourcecfg[i=
rq];<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 } else if (aplic-&gt;mmode &amp;&amp; apli=
c-&gt;msimode &amp;&amp;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(=
addr =3D=3D APLIC_MMSICFGADDR)) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return aplic-&gt;mmsicfgaddr=
;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 } else if (aplic-&gt;mmode &amp;&amp; apli=
c-&gt;msimode &amp;&amp;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(=
addr =3D=3D APLIC_MMSICFGADDRH)) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return aplic-&gt;mmsicfgaddr=
H;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 } else if (aplic-&gt;mmode &amp;&amp; apli=
c-&gt;msimode &amp;&amp;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(=
addr =3D=3D APLIC_SMSICFGADDR)) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Registers SMSICFGADDR and=
 SMSICFGADDRH are implemented only if:<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* (a) the interrupt do=
main is at machine level<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* (b) the domain=E2=80=
=99s harts implement supervisor mode<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* (c) the domain has o=
ne or more child supervisor-level domains<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0t=
hat support MSI delivery mode (domaincfg.DM is not read-<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0o=
nly zero in at least one of the supervisor-level child<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* domains).<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return (aplic-&gt;num_childr=
en) ? aplic-&gt;smsicfgaddr : 0;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 } else if (aplic-&gt;mmode &amp;&amp; apli=
c-&gt;msimode &amp;&amp;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(=
addr =3D=3D APLIC_SMSICFGADDRH)) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return (aplic-&gt;num_childr=
en) ? aplic-&gt;smsicfgaddrH : 0;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 } else if ((APLIC_SETIP_BASE &lt;=3D addr)=
 &amp;&amp;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (addr &lt; (AP=
LIC_SETIP_BASE + aplic-&gt;bitfield_words * 4))) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 word =3D (addr - APLIC_SETIP=
_BASE) &gt;&gt; 2;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return riscv_aplic_read_pend=
ing_word(aplic, word);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 } else if (addr =3D=3D APLIC_SETIPNUM) {<b=
r>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 } else if ((APLIC_CLRIP_BASE &lt;=3D addr)=
 &amp;&amp;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (addr &lt; (AP=
LIC_CLRIP_BASE + aplic-&gt;bitfield_words * 4))) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 word =3D (addr - APLIC_CLRIP=
_BASE) &gt;&gt; 2;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return riscv_aplic_read_inpu=
t_word(aplic, word);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 } else if (addr =3D=3D APLIC_CLRIPNUM) {<b=
r>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 } else if ((APLIC_SETIE_BASE &lt;=3D addr)=
 &amp;&amp;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (addr &lt; (AP=
LIC_SETIE_BASE + aplic-&gt;bitfield_words * 4))) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 word =3D (addr - APLIC_SETIE=
_BASE) &gt;&gt; 2;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return riscv_aplic_read_enab=
led_word(aplic, word);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 } else if (addr =3D=3D APLIC_SETIENUM) {<b=
r>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 } else if ((APLIC_CLRIE_BASE &lt;=3D addr)=
 &amp;&amp;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (addr &lt; (AP=
LIC_CLRIE_BASE + aplic-&gt;bitfield_words * 4))) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 } else if (addr =3D=3D APLIC_CLRIENUM) {<b=
r>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 } else if (addr =3D=3D APLIC_SETIPNUM_LE) =
{<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 } else if (addr =3D=3D APLIC_SETIPNUM_BE) =
{<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 } else if (addr =3D=3D APLIC_GENMSI) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return (aplic-&gt;msimode) ?=
 aplic-&gt;genmsi : 0;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 } else if ((APLIC_TARGET_BASE &lt;=3D addr=
) &amp;&amp;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (addr &lt; (AP=
LIC_TARGET_BASE + (aplic-&gt;num_irqs - 1) * 4))) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 irq =3D ((addr - APLIC_TARGE=
T_BASE) &gt;&gt; 2) + 1;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return aplic-&gt;target[irq]=
;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 } else if (!aplic-&gt;msimode &amp;&amp; (=
APLIC_IDC_BASE &lt;=3D addr) &amp;&amp;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (addr &lt; (AP=
LIC_IDC_BASE + aplic-&gt;num_harts * APLIC_IDC_SIZE))) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 idc =3D (addr - APLIC_IDC_BA=
SE) / APLIC_IDC_SIZE;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (addr - (APLIC_IDC_BA=
SE + idc * APLIC_IDC_SIZE)) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case APLIC_IDC_IDELIVERY:<br=
>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return aplic-&=
gt;idelivery[idc];<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case APLIC_IDC_IFORCE:<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return aplic-&=
gt;iforce[idc];<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case APLIC_IDC_ITHRESHOLD:<b=
r>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return aplic-&=
gt;ithreshold[idc];<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case APLIC_IDC_TOPI:<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return riscv_a=
plic_idc_topi(aplic, idc);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case APLIC_IDC_CLAIMI:<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return riscv_a=
plic_idc_claimi(aplic, idc);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +err:<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &quot;%s: Invalid register read 0x%&quot; HWADDR_PRIx &quot;\n&quot;=
,<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 __func__, addr);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 return 0;<br>
&gt;&gt; &gt;&gt; +}<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +static void riscv_aplic_write(void *opaque, hwaddr addr,=
 uint64_t value,<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned size)<br>
&gt;&gt; &gt;&gt; +{<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 RISCVAPLICState *aplic =3D opaque;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 uint32_t irq, word, idc =3D UINT32_MAX;<br=
>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 /* Writes must be 4 byte words */<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 if ((addr &amp; 0x3) !=3D 0) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 if (addr =3D=3D APLIC_DOMAINCFG) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Only IE bit writeable at =
the moment */<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 value &amp;=3D APLIC_DOMAINC=
FG_IE;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 aplic-&gt;domaincfg =3D valu=
e;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 } else if ((APLIC_SOURCECFG_BASE &lt;=3D a=
ddr) &amp;&amp;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (addr &lt; (AP=
LIC_SOURCECFG_BASE + (aplic-&gt;num_irqs - 1) * 4))) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 irq=C2=A0 =3D ((addr - APLIC=
_SOURCECFG_BASE) &gt;&gt; 2) + 1;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!aplic-&gt;num_children =
&amp;&amp; (value &amp; APLIC_SOURCECFG_D)) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D 0;<b=
r>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (value &amp; APLIC_SOURCE=
CFG_D) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value &amp;=3D=
 (APLIC_SOURCECFG_D | APLIC_SOURCECFG_CHILDIDX_MASK);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value &amp;=3D=
 (APLIC_SOURCECFG_D | APLIC_SOURCECFG_SM_MASK);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 aplic-&gt;sourcecfg[irq] =3D=
 value;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((aplic-&gt;sourcecfg[irq=
] &amp; APLIC_SOURCECFG_D) ||<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (aplic-&gt;sou=
rcecfg[irq] =3D=3D 0)) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_aplic_se=
t_pending_raw(aplic, irq, false);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_aplic_se=
t_enabled_raw(aplic, irq, false);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 } else if (aplic-&gt;mmode &amp;&amp; apli=
c-&gt;msimode &amp;&amp;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(=
addr =3D=3D APLIC_MMSICFGADDR)) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(aplic-&gt;mmsicfgaddrH=
 &amp; APLIC_xMSICFGADDRH_L)) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 aplic-&gt;mmsi=
cfgaddr =3D value;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 } else if (aplic-&gt;mmode &amp;&amp; apli=
c-&gt;msimode &amp;&amp;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(=
addr =3D=3D APLIC_MMSICFGADDRH)) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(aplic-&gt;mmsicfgaddrH=
 &amp; APLIC_xMSICFGADDRH_L)) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 aplic-&gt;mmsi=
cfgaddrH =3D value &amp; APLIC_xMSICFGADDRH_VALID_MASK;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 } else if (aplic-&gt;mmode &amp;&amp; apli=
c-&gt;msimode &amp;&amp;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(=
addr =3D=3D APLIC_SMSICFGADDR)) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Registers SMSICFGADDR and=
 SMSICFGADDRH are implemented only if:<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* (a) the interrupt do=
main is at machine level<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* (b) the domain=E2=80=
=99s harts implement supervisor mode<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* (c) the domain has o=
ne or more child supervisor-level domains<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0t=
hat support MSI delivery mode (domaincfg.DM is not read-<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0o=
nly zero in at least one of the supervisor-level child<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* domains).<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (aplic-&gt;num_children &=
amp;&amp;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !(aplic-&gt;sm=
sicfgaddrH &amp; APLIC_xMSICFGADDRH_L)) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 aplic-&gt;smsi=
cfgaddr =3D value;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 } else if (aplic-&gt;mmode &amp;&amp; apli=
c-&gt;msimode &amp;&amp;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(=
addr =3D=3D APLIC_SMSICFGADDRH)) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (aplic-&gt;num_children &=
amp;&amp;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !(aplic-&gt;sm=
sicfgaddrH &amp; APLIC_xMSICFGADDRH_L)) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 aplic-&gt;smsi=
cfgaddrH =3D value &amp; APLIC_xMSICFGADDRH_VALID_MASK;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 } else if ((APLIC_SETIP_BASE &lt;=3D addr)=
 &amp;&amp;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (addr &lt; (AP=
LIC_SETIP_BASE + aplic-&gt;bitfield_words * 4))) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 word =3D (addr - APLIC_SETIP=
_BASE) &gt;&gt; 2;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_aplic_set_pending_word=
(aplic, word, value, true);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 } else if (addr =3D=3D APLIC_SETIPNUM) {<b=
r>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_aplic_set_pending(apli=
c, value, true);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 } else if ((APLIC_CLRIP_BASE &lt;=3D addr)=
 &amp;&amp;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (addr &lt; (AP=
LIC_CLRIP_BASE + aplic-&gt;bitfield_words * 4))) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 word =3D (addr - APLIC_CLRIP=
_BASE) &gt;&gt; 2;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_aplic_set_pending_word=
(aplic, word, value, false);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 } else if (addr =3D=3D APLIC_CLRIPNUM) {<b=
r>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_aplic_set_pending(apli=
c, value, false);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 } else if ((APLIC_SETIE_BASE &lt;=3D addr)=
 &amp;&amp;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (addr &lt; (AP=
LIC_SETIE_BASE + aplic-&gt;bitfield_words * 4))) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 word =3D (addr - APLIC_SETIE=
_BASE) &gt;&gt; 2;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_aplic_set_enabled_word=
(aplic, word, value, true);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 } else if (addr =3D=3D APLIC_SETIENUM) {<b=
r>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_aplic_set_enabled(apli=
c, value, true);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 } else if ((APLIC_CLRIE_BASE &lt;=3D addr)=
 &amp;&amp;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (addr &lt; (AP=
LIC_CLRIE_BASE + aplic-&gt;bitfield_words * 4))) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 word =3D (addr - APLIC_CLRIE=
_BASE) &gt;&gt; 2;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_aplic_set_enabled_word=
(aplic, word, value, false);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 } else if (addr =3D=3D APLIC_CLRIENUM) {<b=
r>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_aplic_set_enabled(apli=
c, value, false);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 } else if (addr =3D=3D APLIC_SETIPNUM_LE) =
{<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_aplic_set_pending(apli=
c, value, true);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 } else if (addr =3D=3D APLIC_SETIPNUM_BE) =
{<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_aplic_set_pending(apli=
c, bswap32(value), true);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 } else if (addr =3D=3D APLIC_GENMSI) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (aplic-&gt;msimode) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 aplic-&gt;genm=
si =3D value &amp; ~(APLIC_TARGET_GUEST_IDX_MASK &lt;&lt;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 APLIC_TARGET_GUEST_IDX_SHIFT);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_aplic_ms=
i_send(aplic,<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0value &gt;&gt=
; APLIC_TARGET_HART_IDX_SHIFT,<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0value &amp; A=
PLIC_TARGET_EIID_MASK);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 } else if ((APLIC_TARGET_BASE &lt;=3D addr=
) &amp;&amp;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (addr &lt; (AP=
LIC_TARGET_BASE + (aplic-&gt;num_irqs - 1) * 4))) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 irq =3D ((addr - APLIC_TARGE=
T_BASE) &gt;&gt; 2) + 1;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (aplic-&gt;msimode) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 aplic-&gt;targ=
et[irq] =3D value;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 aplic-&gt;targ=
et[irq] =3D (value &amp; ~APLIC_TARGET_IPRIO_MASK) |<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((value &amp;=
 aplic-&gt;iprio_mask) ?<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (value &amp;=
 aplic-&gt;iprio_mask) : 1);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 } else if (!aplic-&gt;msimode &amp;&amp; (=
APLIC_IDC_BASE &lt;=3D addr) &amp;&amp;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (addr &lt; (AP=
LIC_IDC_BASE + aplic-&gt;num_harts * APLIC_IDC_SIZE))) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 idc =3D (addr - APLIC_IDC_BA=
SE) / APLIC_IDC_SIZE;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (addr - (APLIC_IDC_BA=
SE + idc * APLIC_IDC_SIZE)) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case APLIC_IDC_IDELIVERY:<br=
>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 aplic-&gt;idel=
ivery[idc] =3D value &amp; 0x1;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case APLIC_IDC_IFORCE:<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 aplic-&gt;ifor=
ce[idc] =3D value &amp; 0x1;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case APLIC_IDC_ITHRESHOLD:<b=
r>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 aplic-&gt;ithr=
eshold[idc] =3D value &amp; aplic-&gt;iprio_mask;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 } else {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 if (aplic-&gt;msimode) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (irq =3D 1; irq &lt; apl=
ic-&gt;num_irqs; irq++) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_aplic_ms=
i_irq_update(aplic, irq);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 } else {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (idc =3D=3D UINT32_MAX) {=
<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (idc =3D 0=
; idc &lt; aplic-&gt;num_harts; idc++) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
riscv_aplic_idc_update(aplic, idc);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_aplic_id=
c_update(aplic, idc);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 return;<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +err:<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &quot;%s: Invalid register write 0x%&quot; HWADDR_PRIx &quot;\n&quot=
;,<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 __func__, addr);<br>
&gt;&gt; &gt;&gt; +}<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +static const MemoryRegionOps riscv_aplic_ops =3D {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 .read =3D riscv_aplic_read,<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 .write =3D riscv_aplic_write,<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 .endianness =3D DEVICE_LITTLE_ENDIAN,<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 .valid =3D {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .min_access_size =3D 4,<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .max_access_size =3D 4<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +};<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +static void riscv_aplic_realize(DeviceState *dev, Error =
**errp)<br>
&gt;&gt; &gt;&gt; +{<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 uint32_t i;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 RISCVAPLICState *aplic =3D RISCV_APLIC(dev=
);<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 aplic-&gt;bitfield_words =3D (aplic-&gt;nu=
m_irqs + 31) &gt;&gt; 5;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 aplic-&gt;sourcecfg =3D g_new0(uint32_t, a=
plic-&gt;num_irqs);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 aplic-&gt;state =3D g_new(uint32_t, aplic-=
&gt;num_irqs);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 aplic-&gt;target =3D g_new0(uint32_t, apli=
c-&gt;num_irqs);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 if (!aplic-&gt;msimode) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; aplic-&=
gt;num_irqs; i++) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 aplic-&gt;targ=
et[i] =3D 1;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 aplic-&gt;idelivery =3D g_new0(uint32_t, a=
plic-&gt;num_harts);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 aplic-&gt;iforce =3D g_new0(uint32_t, apli=
c-&gt;num_harts);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 aplic-&gt;ithreshold =3D g_new0(uint32_t, =
aplic-&gt;num_harts);<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 memory_region_init_io(&amp;aplic-&gt;mmio,=
 OBJECT(dev), &amp;riscv_aplic_ops, aplic,<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TYPE_RISCV_APLIC, aplic-&gt;aperture_siz=
e);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 sysbus_init_mmio(SYS_BUS_DEVICE(dev), &amp=
;aplic-&gt;mmio);<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 /* Only root APLICs have hardware IRQ line=
s. All non-root APLICs<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0* have IRQ lines delegated by their =
parent APLIC.<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 if (!aplic-&gt;parent) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_init_gpio_in(dev, riscv=
_aplic_request, aplic-&gt;num_irqs);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 /* Create output IRQ lines for non-MSI mod=
e */<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 if (!aplic-&gt;msimode) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 aplic-&gt;external_irqs =3D =
g_malloc(sizeof(qemu_irq) * aplic-&gt;num_harts);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_init_gpio_out(dev, apli=
c-&gt;external_irqs, aplic-&gt;num_harts);<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Claim the CPU interrupt t=
o be triggered by this APLIC */<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; aplic-&=
gt;num_harts; i++) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RISCVCPU *cpu =
=3D RISCV_CPU(qemu_get_cpu(aplic-&gt;hartid_base + i));<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (riscv_cpu_=
claim_interrupts(cpu,<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
(aplic-&gt;mmode) ? MIP_MEIP : MIP_SEIP) &lt; 0) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
error_report(&quot;%s already claimed&quot;,<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(aplic-&gt;mmode) ? &quot;M=
EIP&quot; : &quot;SEIP&quot;);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
exit(1);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 msi_nonbroken =3D true;<br>
&gt;&gt; &gt;&gt; +}<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +static Property riscv_aplic_properties[] =3D {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 DEFINE_PROP_UINT32(&quot;aperture-size&quo=
t;, RISCVAPLICState, aperture_size, 0),<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 DEFINE_PROP_UINT32(&quot;hartid-base&quot;=
, RISCVAPLICState, hartid_base, 0),<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 DEFINE_PROP_UINT32(&quot;num-harts&quot;, =
RISCVAPLICState, num_harts, 0),<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 DEFINE_PROP_UINT32(&quot;iprio-mask&quot;,=
 RISCVAPLICState, iprio_mask, 0),<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 DEFINE_PROP_UINT32(&quot;num-irqs&quot;, R=
ISCVAPLICState, num_irqs, 0),<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;msimode&quot;, RISC=
VAPLICState, msimode, 0),<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;mmode&quot;, RISCVA=
PLICState, mmode, 0),<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 DEFINE_PROP_END_OF_LIST(),<br>
&gt;&gt; &gt;&gt; +};<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +static const VMStateDescription vmstate_riscv_aplic =3D =
{<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 .name =3D &quot;riscv_aplic&quot;,<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 .version_id =3D 1,<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 .minimum_version_id =3D 1,<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 .fields =3D (VMStateField[]) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32=
(domaincfg, RISCVAPLICState),<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32=
(mmsicfgaddr, RISCVAPLICState),<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32=
(mmsicfgaddrH, RISCVAPLICState),<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32=
(smsicfgaddr, RISCVAPLICState),<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32=
(smsicfgaddrH, RISCVAPLICState),<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32=
(genmsi, RISCVAPLICState),<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_VARRAY=
_UINT32(sourcecfg, RISCVAPLICState,<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 num_irqs, 0,=
<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmstate_info=
_uint32, uint32_t),<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_VARRAY=
_UINT32(state, RISCVAPLICState,<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 num_irqs, 0,=
<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmstate_info=
_uint32, uint32_t),<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_VARRAY=
_UINT32(target, RISCVAPLICState,<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 num_irqs, 0,=
<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmstate_info=
_uint32, uint32_t),<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_VARRAY=
_UINT32(idelivery, RISCVAPLICState,<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 num_harts, 0=
,<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmstate_info=
_uint32, uint32_t),<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_VARRAY=
_UINT32(iforce, RISCVAPLICState,<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 num_harts, 0=
,<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmstate_info=
_uint32, uint32_t),<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_VARRAY=
_UINT32(ithreshold, RISCVAPLICState,<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 num_harts, 0=
,<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmstate_info=
_uint32, uint32_t),<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_END_OF=
_LIST()<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +};<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +static void riscv_aplic_class_init(ObjectClass *klass, v=
oid *data)<br>
&gt;&gt; &gt;&gt; +{<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 DeviceClass *dc =3D DEVICE_CLASS(klass);<b=
r>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 device_class_set_props(dc, riscv_aplic_pro=
perties);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 dc-&gt;realize =3D riscv_aplic_realize;<br=
>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 dc-&gt;vmsd =3D &amp;vmstate_riscv_aplic;<=
br>
&gt;&gt; &gt;&gt; +}<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +static const TypeInfo riscv_aplic_info =3D {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D TYPE_RISCV_APLIC,<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 .parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYP=
E_SYS_BUS_DEVICE,<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 .instance_size =3D sizeof(RISCVAPLICState)=
,<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 .class_init=C2=A0 =C2=A0 =3D riscv_aplic_c=
lass_init,<br>
&gt;&gt; &gt;&gt; +};<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +static void riscv_aplic_register_types(void)<br>
&gt;&gt; &gt;&gt; +{<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 type_register_static(&amp;riscv_aplic_info=
);<br>
&gt;&gt; &gt;&gt; +}<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +type_init(riscv_aplic_register_types)<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +/*<br>
&gt;&gt; &gt;&gt; + * Add a APLIC device to another APLIC device as child f=
or<br>
&gt;&gt; &gt;&gt; + * interrupt delegation.<br>
&gt;&gt; &gt;&gt; + */<br>
&gt;&gt; &gt;&gt; +void riscv_aplic_add_child(DeviceState *parent, DeviceSt=
ate *child)<br>
&gt;&gt; &gt;&gt; +{<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 RISCVAPLICState *caplic, *paplic;<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 assert(parent &amp;&amp; child);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 caplic =3D RISCV_APLIC(child);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 paplic =3D RISCV_APLIC(parent);<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 assert(paplic-&gt;num_irqs =3D=3D caplic-&=
gt;num_irqs);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 assert(paplic-&gt;num_children &lt;=3D QEM=
U_APLIC_MAX_CHILDREN);<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 caplic-&gt;parent =3D paplic;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 paplic-&gt;children[paplic-&gt;num_childre=
n] =3D caplic;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 paplic-&gt;num_children++;<br>
&gt;&gt; &gt;&gt; +}<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +/*<br>
&gt;&gt; &gt;&gt; + * Create APLIC device.<br>
&gt;&gt; &gt;&gt; + */<br>
&gt;&gt; &gt;&gt; +DeviceState *riscv_aplic_create(hwaddr addr, hwaddr size=
,<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 uint32_t hartid_base, uint32_t num_harts, =
uint32_t num_sources,<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 uint32_t iprio_bits, bool msimode, bool mm=
ode, DeviceState *parent)<br>
&gt;&gt; &gt;&gt; +{<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 DeviceState *dev =3D qdev_new(TYPE_RISCV_A=
PLIC);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 uint32_t i;<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 assert(num_harts &lt; APLIC_MAX_IDC);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 assert((APLIC_IDC_BASE + (num_harts * APLI=
C_IDC_SIZE)) &lt;=3D size);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 assert(num_sources &lt; APLIC_MAX_SOURCE);=
<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 assert(APLIC_MIN_IPRIO_BITS &lt;=3D iprio_=
bits);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 assert(iprio_bits &lt;=3D APLIC_MAX_IPRIO_=
BITS);<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 qdev_prop_set_uint32(dev, &quot;aperture-s=
ize&quot;, size);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 qdev_prop_set_uint32(dev, &quot;hartid-bas=
e&quot;, hartid_base);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 qdev_prop_set_uint32(dev, &quot;num-harts&=
quot;, num_harts);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 qdev_prop_set_uint32(dev, &quot;iprio-mask=
&quot;, ((1U &lt;&lt; iprio_bits) - 1));<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 qdev_prop_set_uint32(dev, &quot;num-irqs&q=
uot;, num_sources + 1);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 qdev_prop_set_bit(dev, &quot;msimode&quot;=
, msimode);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 qdev_prop_set_bit(dev, &quot;mmode&quot;, =
mmode);<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 sysbus_realize_and_unref(SYS_BUS_DEVICE(de=
v), &amp;error_fatal);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, ad=
dr);<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 if (parent) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_aplic_add_child(parent=
, dev);<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 if (!msimode) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; num_har=
ts; i++) {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CPUState *cpu =
=3D qemu_get_cpu(hartid_base + i);<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_connect_g=
pio_out_named(dev, NULL, i,<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 qdev_get_gpio_in(DEVICE(cpu),<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 (mmode) ? IRQ_M_EXT : IRQ_S_EXT));<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 return dev;<br>
&gt;&gt; &gt;&gt; +}<br>
&gt;&gt; &gt;&gt; diff --git a/include/hw/intc/riscv_aplic.h b/include/hw/i=
ntc/riscv_aplic.h<br>
&gt;&gt; &gt;&gt; new file mode 100644<br>
&gt;&gt; &gt;&gt; index 0000000000..de8532fbc3<br>
&gt;&gt; &gt;&gt; --- /dev/null<br>
&gt;&gt; &gt;&gt; +++ b/include/hw/intc/riscv_aplic.h<br>
&gt;&gt; &gt;&gt; @@ -0,0 +1,79 @@<br>
&gt;&gt; &gt;&gt; +/*<br>
&gt;&gt; &gt;&gt; + * RISC-V APLIC (Advanced Platform Level Interrupt Contr=
oller) interface<br>
&gt;&gt; &gt;&gt; + *<br>
&gt;&gt; &gt;&gt; + * Copyright (c) 2021 Western Digital Corporation or its=
 affiliates.<br>
&gt;&gt; &gt;&gt; + *<br>
&gt;&gt; &gt;&gt; + * This program is free software; you can redistribute i=
t and/or modify it<br>
&gt;&gt; &gt;&gt; + * under the terms and conditions of the GNU General Pub=
lic License,<br>
&gt;&gt; &gt;&gt; + * version 2 or later, as published by the Free Software=
 Foundation.<br>
&gt;&gt; &gt;&gt; + *<br>
&gt;&gt; &gt;&gt; + * This program is distributed in the hope it will be us=
eful, but WITHOUT<br>
&gt;&gt; &gt;&gt; + * ANY WARRANTY; without even the implied warranty of ME=
RCHANTABILITY or<br>
&gt;&gt; &gt;&gt; + * FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the GNU G=
eneral Public License for<br>
&gt;&gt; &gt;&gt; + * more details.<br>
&gt;&gt; &gt;&gt; + *<br>
&gt;&gt; &gt;&gt; + * You should have received a copy of the GNU General Pu=
blic License along with<br>
&gt;&gt; &gt;&gt; + * this program.=C2=A0 If not, see &lt;<a href=3D"http:/=
/www.gnu.org/licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu=
.org/licenses/</a>&gt;.<br>
&gt;&gt; &gt;&gt; + */<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +#ifndef HW_RISCV_APLIC_H<br>
&gt;&gt; &gt;&gt; +#define HW_RISCV_APLIC_H<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +#include &quot;hw/sysbus.h&quot;<br>
&gt;&gt; &gt;&gt; +#include &quot;qom/object.h&quot;<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +#define TYPE_RISCV_APLIC &quot;riscv.aplic&quot;<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +typedef struct RISCVAPLICState RISCVAPLICState;<br>
&gt;&gt; &gt;&gt; +DECLARE_INSTANCE_CHECKER(RISCVAPLICState, RISCV_APLIC, T=
YPE_RISCV_APLIC)<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +#define APLIC_MIN_SIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 0x4000<br>
&gt;&gt; &gt;&gt; +#define APLIC_SIZE_ALIGN(__x)=C2=A0 =C2=A0 =C2=A0(((__x)=
 + (APLIC_MIN_SIZE - 1)) &amp; \<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0~(APLI=
C_MIN_SIZE - 1))<br>
&gt;&gt; &gt;&gt; +#define APLIC_SIZE(__num_harts)=C2=A0 =C2=A0(APLIC_MIN_S=
IZE + \<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0APLIC_=
SIZE_ALIGN(32 * (__num_harts)))<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +struct RISCVAPLICState {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 /*&lt; private &gt;*/<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 SysBusDevice parent_obj;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 qemu_irq *external_irqs;<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 /*&lt; public &gt;*/<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 MemoryRegion mmio;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 uint32_t bitfield_words;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 uint32_t domaincfg;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 uint32_t mmsicfgaddr;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 uint32_t mmsicfgaddrH;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 uint32_t smsicfgaddr;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 uint32_t smsicfgaddrH;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 uint32_t genmsi;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 uint32_t *sourcecfg;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 uint32_t *state;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 uint32_t *target;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 uint32_t *idelivery;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 uint32_t *iforce;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 uint32_t *ithreshold;<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 /* topology */<br>
&gt;&gt; &gt;&gt; +#define QEMU_APLIC_MAX_CHILDREN=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 16<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 struct RISCVAPLICState *parent;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 struct RISCVAPLICState *children[QEMU_APLI=
C_MAX_CHILDREN];<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 uint16_t num_children;<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 /* config */<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 uint32_t aperture_size;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 uint32_t hartid_base;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 uint32_t num_harts;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 uint32_t iprio_mask;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 uint32_t num_irqs;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 bool msimode;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 bool mmode;<br>
&gt;&gt; &gt;&gt; +};<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +void riscv_aplic_add_child(DeviceState *parent, DeviceSt=
ate *child);<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +DeviceState *riscv_aplic_create(hwaddr addr, hwaddr size=
,<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 uint32_t hartid_base, uint32_t num_harts, =
uint32_t num_sources,<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 uint32_t iprio_bits, bool msimode, bool mm=
ode, DeviceState *parent);<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +#endif<br>
&gt;&gt; &gt;&gt; --<br>
&gt;&gt; &gt;&gt; 2.25.1<br>
&gt;&gt; &gt;&gt;<br>
</blockquote></div></div>

--000000000000b4db9205d6036ec9--

