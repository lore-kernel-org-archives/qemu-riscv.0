Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n8LJT-0001E8-O3
	for mharc-qemu-riscv@gnu.org; Fri, 14 Jan 2022 07:04:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n8LIk-00016f-UV
 for qemu-riscv@nongnu.org; Fri, 14 Jan 2022 07:03:27 -0500
Received: from [2607:f8b0:4864:20::102b] (port=39565
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n8LIe-0005BC-Cb
 for qemu-riscv@nongnu.org; Fri, 14 Jan 2022 07:03:26 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 c14-20020a17090a674e00b001b31e16749cso21731085pjm.4
 for <qemu-riscv@nongnu.org>; Fri, 14 Jan 2022 04:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XDo6aCbOeUOWXfGyJPew/MuNTh0DEeKHYB+Jehz9y7A=;
 b=EFqvGDBwn93F8wXp9y2p5iLsfFyLSsTGO7B9d5Rk9e5wsNsrG23JYNUeaYGaevshjc
 8BiXJUzuGdJfBQbGnxGxzRhvDiROOc5Mj8ZSMQPgQhEg8vD50es5AVeacFp+VWdL3HiP
 FPWaG/s7Qv4Sw8ckkVkPQt+QXT/jywFX8kmjWllktGnOfoWiAZzOwgbm4W5KE/vXPQi9
 Itk53e/W9bBlIoqccPhDUE5x5eAs0/5JNED6dQ507Z+2L3xduANeJcf+B6AYN2lb4kF7
 STy5gHKFHPsJ7QBuRXERUoQykzKgdHf0XdqbX93Tx7SiT4jT6TkaFPgZpdB+w+CTkjZ8
 L7KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XDo6aCbOeUOWXfGyJPew/MuNTh0DEeKHYB+Jehz9y7A=;
 b=QQ3NrZIxErIkX9cLcFZ0PD2sYxPwpBd4rwSGG+wAauTfoPGiToNXgpGLxVJOfuYkbx
 uWTaz+HhUmntPd24HXuW7RnaoxYz9zvTXzx0xNnydYAtKzwq8KmGxM7VxvcjzdQ8LBRX
 WyuwbC+X4MBv+hNJLcj9BM/JUDdaPFWzrClphis/0oAL0IEkUkiwFkF0ZIvlePCFvBgH
 VgwO6i68GtqIrvU5LRIyCMF/wtg3kWnGd9+VEzPlNrSBzhEFCbPXCUpalzS2gH5LdQUJ
 /aN5pESci8vnhBid/S/C+w5Xy6BZsrAXkLki/n63XpnfCCPSbRuuN63c1oaCyDCOu3o2
 gxiQ==
X-Gm-Message-State: AOAM532DHY4/7zLzgESVVz1miuiAEjMElpLnK4EAHRYAsKl//gXDO8sH
 v9T1OoUmb2QNpBCX85q3yNgLr0LWeKbpEVVq
X-Google-Smtp-Source: ABdhPJyWrhwvSSpbdlvZi6NGBjWSlLq+HhcbYm2FfXFU1Tu7nrtGCupa3mNlQRq0QeTkF0uf9+Ji1w==
X-Received: by 2002:a17:902:8c92:b0:149:848e:e337 with SMTP id
 t18-20020a1709028c9200b00149848ee337mr9222419plo.139.1642161790226; 
 Fri, 14 Jan 2022 04:03:10 -0800 (PST)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com.
 [209.85.215.172])
 by smtp.gmail.com with ESMTPSA id y13sm266921pfa.132.2022.01.14.04.03.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 04:03:09 -0800 (PST)
Received: by mail-pg1-f172.google.com with SMTP id v25so2597863pge.2;
 Fri, 14 Jan 2022 04:03:09 -0800 (PST)
X-Received: by 2002:a63:385e:: with SMTP id h30mr7710503pgn.554.1642161788163; 
 Fri, 14 Jan 2022 04:03:08 -0800 (PST)
MIME-Version: 1.0
References: <20211230123539.52786-1-anup@brainfault.org>
 <20211230123539.52786-19-anup@brainfault.org>
In-Reply-To: <20211230123539.52786-19-anup@brainfault.org>
From: Frank Chang <frank.chang@sifive.com>
Date: Fri, 14 Jan 2022 20:02:56 +0800
X-Gmail-Original-Message-ID: <CANzO1D2Hxgpc73OayBo_HpgXYTvVPsxQn8rSG==k86L0UC8m+g@mail.gmail.com>
Message-ID: <CANzO1D2Hxgpc73OayBo_HpgXYTvVPsxQn8rSG==k86L0UC8m+g@mail.gmail.com>
Subject: Re: [PATCH v6 18/23] hw/intc: Add RISC-V AIA APLIC device emulation
To: Anup Patel <anup@brainfault.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bin Meng <bmeng.cn@gmail.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atishp@atishpatra.org>
Content-Type: multipart/alternative; boundary="0000000000000c1b9105d589966f"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102b.google.com
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
X-List-Received-Date: Fri, 14 Jan 2022 12:03:27 -0000

--0000000000000c1b9105d589966f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Anup Patel <anup@brainfault.org> =E6=96=BC 2021=E5=B9=B412=E6=9C=8830=E6=97=
=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=888:55=E5=AF=AB=E9=81=93=EF=BC=9A

> From: Anup Patel <anup.patel@wdc.com>
>
> The RISC-V AIA (Advanced Interrupt Architecture) defines a new
> interrupt controller for wired interrupts called APLIC (Advanced
> Platform Level Interrupt Controller). The APLIC is capabable of
> forwarding wired interupts to RISC-V HARTs directly or as MSIs
> (Message Signaled Interupts).
>
> This patch adds device emulation for RISC-V AIA APLIC.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Signed-off-by: Anup Patel <anup@brainfault.org>
> ---
>  hw/intc/Kconfig               |   3 +
>  hw/intc/meson.build           |   1 +
>  hw/intc/riscv_aplic.c         | 970 ++++++++++++++++++++++++++++++++++
>  include/hw/intc/riscv_aplic.h |  79 +++
>  4 files changed, 1053 insertions(+)
>  create mode 100644 hw/intc/riscv_aplic.c
>  create mode 100644 include/hw/intc/riscv_aplic.h
>
> diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
> index 010ded7eae..528e77b4a6 100644
> --- a/hw/intc/Kconfig
> +++ b/hw/intc/Kconfig
> @@ -70,6 +70,9 @@ config LOONGSON_LIOINTC
>  config RISCV_ACLINT
>      bool
>
> +config RISCV_APLIC
> +    bool
> +
>  config SIFIVE_PLIC
>      bool
>
> diff --git a/hw/intc/meson.build b/hw/intc/meson.build
> index 70080bc161..7466024402 100644
> --- a/hw/intc/meson.build
> +++ b/hw/intc/meson.build
> @@ -50,6 +50,7 @@ specific_ss.add(when: 'CONFIG_S390_FLIC', if_true:
> files('s390_flic.c'))
>  specific_ss.add(when: 'CONFIG_S390_FLIC_KVM', if_true:
> files('s390_flic_kvm.c'))
>  specific_ss.add(when: 'CONFIG_SH_INTC', if_true: files('sh_intc.c'))
>  specific_ss.add(when: 'CONFIG_RISCV_ACLINT', if_true:
> files('riscv_aclint.c'))
> +specific_ss.add(when: 'CONFIG_RISCV_APLIC', if_true:
> files('riscv_aplic.c'))
>  specific_ss.add(when: 'CONFIG_SIFIVE_PLIC', if_true:
> files('sifive_plic.c'))
>  specific_ss.add(when: 'CONFIG_XICS', if_true: files('xics.c'))
>  specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_XICS'],
> diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
> new file mode 100644
> index 0000000000..f4b8828dac
> --- /dev/null
> +++ b/hw/intc/riscv_aplic.c
> @@ -0,0 +1,970 @@
> +/*
> + * RISC-V APLIC (Advanced Platform Level Interrupt Controller)
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
> +#include "hw/intc/riscv_aplic.h"
> +#include "hw/irq.h"
> +#include "target/riscv/cpu.h"
> +#include "sysemu/sysemu.h"
> +#include "migration/vmstate.h"
> +
> +#define APLIC_MAX_IDC                  (1UL << 14)
> +#define APLIC_MAX_SOURCE               1024
> +#define APLIC_MIN_IPRIO_BITS           1
> +#define APLIC_MAX_IPRIO_BITS           8
> +#define APLIC_MAX_CHILDREN             1024
> +
> +#define APLIC_DOMAINCFG                0x0000
> +#define APLIC_DOMAINCFG_IE             (1 << 8)
> +#define APLIC_DOMAINCFG_DM             (1 << 2)
> +#define APLIC_DOMAINCFG_BE             (1 << 0)
> +
> +#define APLIC_SOURCECFG_BASE           0x0004
> +#define APLIC_SOURCECFG_D              (1 << 10)
> +#define APLIC_SOURCECFG_CHILDIDX_MASK  0x000003ff
> +#define APLIC_SOURCECFG_SM_MASK        0x00000007
> +#define APLIC_SOURCECFG_SM_INACTIVE    0x0
> +#define APLIC_SOURCECFG_SM_DETACH      0x1
> +#define APLIC_SOURCECFG_SM_EDGE_RISE   0x4
> +#define APLIC_SOURCECFG_SM_EDGE_FALL   0x5
> +#define APLIC_SOURCECFG_SM_LEVEL_HIGH  0x6
> +#define APLIC_SOURCECFG_SM_LEVEL_LOW   0x7
> +
> +#define APLIC_MMSICFGADDR              0x1bc0
> +#define APLIC_MMSICFGADDRH             0x1bc4
> +#define APLIC_SMSICFGADDR              0x1bc8
> +#define APLIC_SMSICFGADDRH             0x1bcc
> +
> +#define APLIC_xMSICFGADDRH_L           (1UL << 31)
> +#define APLIC_xMSICFGADDRH_HHXS_MASK   0x1f
> +#define APLIC_xMSICFGADDRH_HHXS_SHIFT  24
> +#define APLIC_xMSICFGADDRH_LHXS_MASK   0x7
> +#define APLIC_xMSICFGADDRH_LHXS_SHIFT  20
> +#define APLIC_xMSICFGADDRH_HHXW_MASK   0x7
> +#define APLIC_xMSICFGADDRH_HHXW_SHIFT  16
> +#define APLIC_xMSICFGADDRH_LHXW_MASK   0xf
> +#define APLIC_xMSICFGADDRH_LHXW_SHIFT  12
> +#define APLIC_xMSICFGADDRH_BAPPN_MASK  0xfff
> +
> +#define APLIC_xMSICFGADDR_PPN_SHIFT    12
> +
> +#define APLIC_xMSICFGADDR_PPN_HART(__lhxs) \
> +    ((1UL << (__lhxs)) - 1)
> +
> +#define APLIC_xMSICFGADDR_PPN_LHX_MASK(__lhxw) \
> +    ((1UL << (__lhxw)) - 1)
> +#define APLIC_xMSICFGADDR_PPN_LHX_SHIFT(__lhxs) \
> +    ((__lhxs))
> +#define APLIC_xMSICFGADDR_PPN_LHX(__lhxw, __lhxs) \
> +    (APLIC_xMSICFGADDR_PPN_LHX_MASK(__lhxw) << \
> +     APLIC_xMSICFGADDR_PPN_LHX_SHIFT(__lhxs))
> +
> +#define APLIC_xMSICFGADDR_PPN_HHX_MASK(__hhxw) \
> +    ((1UL << (__hhxw)) - 1)
> +#define APLIC_xMSICFGADDR_PPN_HHX_SHIFT(__hhxs) \
> +    ((__hhxs) + APLIC_xMSICFGADDR_PPN_SHIFT)
> +#define APLIC_xMSICFGADDR_PPN_HHX(__hhxw, __hhxs) \
> +    (APLIC_xMSICFGADDR_PPN_HHX_MASK(__hhxw) << \
> +     APLIC_xMSICFGADDR_PPN_HHX_SHIFT(__hhxs))
> +
> +#define APLIC_xMSICFGADDRH_VALID_MASK   \
> +    (APLIC_xMSICFGADDRH_L | \
> +     (APLIC_xMSICFGADDRH_HHXS_MASK << APLIC_xMSICFGADDRH_HHXS_SHIFT) | \
> +     (APLIC_xMSICFGADDRH_LHXS_MASK << APLIC_xMSICFGADDRH_LHXS_SHIFT) | \
> +     (APLIC_xMSICFGADDRH_HHXW_MASK << APLIC_xMSICFGADDRH_HHXW_SHIFT) | \
> +     (APLIC_xMSICFGADDRH_LHXW_MASK << APLIC_xMSICFGADDRH_LHXW_SHIFT) | \
> +     APLIC_xMSICFGADDRH_BAPPN_MASK)
> +
> +#define APLIC_SETIP_BASE               0x1c00
> +#define APLIC_SETIPNUM                 0x1cdc
> +
> +#define APLIC_CLRIP_BASE               0x1d00
> +#define APLIC_CLRIPNUM                 0x1ddc
> +
> +#define APLIC_SETIE_BASE               0x1e00
> +#define APLIC_SETIENUM                 0x1edc
> +
> +#define APLIC_CLRIE_BASE               0x1f00
> +#define APLIC_CLRIENUM                 0x1fdc
> +
> +#define APLIC_SETIPNUM_LE              0x2000
> +#define APLIC_SETIPNUM_BE              0x2004
> +
> +#define APLIC_ISTATE_PENDING           (1U << 0)
> +#define APLIC_ISTATE_ENABLED           (1U << 1)
> +#define APLIC_ISTATE_ENPEND            (APLIC_ISTATE_ENABLED | \
> +                                        APLIC_ISTATE_PENDING)
> +#define APLIC_ISTATE_INPUT             (1U << 8)
> +
> +#define APLIC_GENMSI                   0x3000
> +
> +#define APLIC_TARGET_BASE              0x3004
> +#define APLIC_TARGET_HART_IDX_SHIFT    18
> +#define APLIC_TARGET_HART_IDX_MASK     0x3fff
> +#define APLIC_TARGET_GUEST_IDX_SHIFT   12
> +#define APLIC_TARGET_GUEST_IDX_MASK    0x3f
> +#define APLIC_TARGET_IPRIO_MASK        0xff
> +#define APLIC_TARGET_EIID_MASK         0x7ff
> +
> +#define APLIC_IDC_BASE                 0x4000
> +#define APLIC_IDC_SIZE                 32
> +
> +#define APLIC_IDC_IDELIVERY            0x00
> +
> +#define APLIC_IDC_IFORCE               0x04
> +
> +#define APLIC_IDC_ITHRESHOLD           0x08
> +
> +#define APLIC_IDC_TOPI                 0x18
> +#define APLIC_IDC_TOPI_ID_SHIFT        16
> +#define APLIC_IDC_TOPI_ID_MASK         0x3ff
> +#define APLIC_IDC_TOPI_PRIO_MASK       0xff
> +
> +#define APLIC_IDC_CLAIMI               0x1c
> +
> +static uint32_t riscv_aplic_read_input_word(RISCVAPLICState *aplic,
> +                                            uint32_t word)
> +{
> +    uint32_t i, irq, ret =3D 0;
> +
> +    for (i =3D 0; i < 32; i++) {
> +        irq =3D word * 32 + i;
> +        if (!irq || aplic->num_irqs <=3D irq) {
> +            continue;
> +        }
> +
> +        ret |=3D ((aplic->state[irq] & APLIC_ISTATE_INPUT) ? 1 : 0) << i=
;
> +    }
> +
> +    return ret;
> +}
> +
> +static uint32_t riscv_aplic_read_pending_word(RISCVAPLICState *aplic,
> +                                              uint32_t word)
> +{
> +    uint32_t i, irq, ret =3D 0;
> +
> +    for (i =3D 0; i < 32; i++) {
> +        irq =3D word * 32 + i;
> +        if (!irq || aplic->num_irqs <=3D irq) {
> +            continue;
> +        }
> +
> +        ret |=3D ((aplic->state[irq] & APLIC_ISTATE_PENDING) ? 1 : 0) <<=
 i;
> +    }
> +
> +    return ret;
> +}
> +
> +static void riscv_aplic_set_pending_raw(RISCVAPLICState *aplic,
> +                                        uint32_t irq, bool pending)
> +{
> +    if (pending) {
> +        aplic->state[irq] |=3D APLIC_ISTATE_PENDING;
> +    } else {
> +        aplic->state[irq] &=3D ~APLIC_ISTATE_PENDING;
> +    }
> +}
> +
> +static void riscv_aplic_set_pending(RISCVAPLICState *aplic,
> +                                    uint32_t irq, bool pending)
> +{
> +    uint32_t sourcecfg, sm;
> +
> +    if ((irq <=3D 0) || (aplic->num_irqs <=3D irq)) {
> +        return;
> +    }
> +
> +    sourcecfg =3D aplic->sourcecfg[irq];
> +    if (sourcecfg & APLIC_SOURCECFG_D) {
> +        return;
> +    }
> +
> +    sm =3D sourcecfg & APLIC_SOURCECFG_SM_MASK;
> +    if ((sm =3D=3D APLIC_SOURCECFG_SM_INACTIVE) ||
> +        (!aplic->msimode && ((sm =3D=3D APLIC_SOURCECFG_SM_LEVEL_HIGH) |=
|
> +                             (sm =3D=3D APLIC_SOURCECFG_SM_LEVEL_LOW))))=
 {
> +        return;
> +    }
> +
> +    riscv_aplic_set_pending_raw(aplic, irq, pending);
> +}
> +
> +static void riscv_aplic_set_pending_word(RISCVAPLICState *aplic,
> +                                         uint32_t word, uint32_t value,
> +                                         bool pending)
> +{
> +    uint32_t i, irq;
> +
> +    for (i =3D 0; i < 32; i++) {
> +        irq =3D word * 32 + i;
> +        if (!irq || aplic->num_irqs <=3D irq) {
> +            continue;
> +        }
> +
> +        if (value & (1U << i)) {
> +            riscv_aplic_set_pending(aplic, irq, pending);
> +        }
> +    }
> +}
> +
> +static uint32_t riscv_aplic_read_enabled_word(RISCVAPLICState *aplic,
> +                                              int word)
> +{
> +    uint32_t i, irq, ret =3D 0;
> +
> +    for (i =3D 0; i < 32; i++) {
> +        irq =3D word * 32 + i;
> +        if (!irq || aplic->num_irqs <=3D irq) {
> +            continue;
> +        }
> +
> +        ret |=3D ((aplic->state[irq] & APLIC_ISTATE_ENABLED) ? 1 : 0) <<=
 i;
> +    }
> +
> +    return ret;
> +}
> +
> +static void riscv_aplic_set_enabled_raw(RISCVAPLICState *aplic,
> +                                        uint32_t irq, bool enabled)
> +{
> +    if (enabled) {
> +        aplic->state[irq] |=3D APLIC_ISTATE_ENABLED;
> +    } else {
> +        aplic->state[irq] &=3D ~APLIC_ISTATE_ENABLED;
> +    }
> +}
> +
> +static void riscv_aplic_set_enabled(RISCVAPLICState *aplic,
> +                                    uint32_t irq, bool enabled)
> +{
> +    uint32_t sourcecfg, sm;
> +
> +    if ((irq <=3D 0) || (aplic->num_irqs <=3D irq)) {
> +        return;
> +    }
> +
> +    sourcecfg =3D aplic->sourcecfg[irq];
> +    if (sourcecfg & APLIC_SOURCECFG_D) {
> +        return;
> +    }
> +
> +    sm =3D sourcecfg & APLIC_SOURCECFG_SM_MASK;
> +    if (sm =3D=3D APLIC_SOURCECFG_SM_INACTIVE) {
> +        return;
> +    }
> +
> +    riscv_aplic_set_enabled_raw(aplic, irq, enabled);
> +}
> +
> +static void riscv_aplic_set_enabled_word(RISCVAPLICState *aplic,
> +                                         uint32_t word, uint32_t value,
> +                                         bool enabled)
> +{
> +    uint32_t i, irq;
> +
> +    for (i =3D 0; i < 32; i++) {
> +        irq =3D word * 32 + i;
> +        if (!irq || aplic->num_irqs <=3D irq) {
> +            continue;
> +        }
> +
> +        if (value & (1U << i)) {
> +            riscv_aplic_set_enabled(aplic, irq, enabled);
> +        }
> +    }
> +}
> +
> +static void riscv_aplic_msi_send(RISCVAPLICState *aplic,
> +                                 uint32_t hart_idx, uint32_t guest_idx,
> +                                 uint32_t eiid)
> +{
> +    uint64_t addr;
> +    MemTxResult result;
> +    RISCVAPLICState *aplic_m;
> +    uint32_t lhxs, lhxw, hhxs, hhxw, group_idx, msicfgaddr, msicfgaddrH;
> +
> +    aplic_m =3D aplic;
> +    while (aplic_m && !aplic_m->mmode) {
> +        aplic_m =3D aplic_m->parent;
> +    }
> +    if (!aplic_m) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: m-level APLIC not found\n",
> +                      __func__);
> +        return;
> +    }
> +
> +    if (aplic->mmode) {
> +        msicfgaddr =3D aplic_m->mmsicfgaddr;
> +        msicfgaddrH =3D aplic_m->mmsicfgaddrH;
> +    } else {
> +        msicfgaddr =3D aplic_m->smsicfgaddr;
> +        msicfgaddrH =3D aplic_m->smsicfgaddrH;
> +    }
> +
> +    lhxs =3D (msicfgaddrH >> APLIC_xMSICFGADDRH_LHXS_SHIFT) &
> +            APLIC_xMSICFGADDRH_LHXS_MASK;
> +    lhxw =3D (msicfgaddrH >> APLIC_xMSICFGADDRH_LHXW_SHIFT) &
> +            APLIC_xMSICFGADDRH_LHXW_MASK;
> +    hhxs =3D (msicfgaddrH >> APLIC_xMSICFGADDRH_HHXS_SHIFT) &
> +            APLIC_xMSICFGADDRH_HHXS_MASK;
> +    hhxw =3D (msicfgaddrH >> APLIC_xMSICFGADDRH_HHXW_SHIFT) &
> +            APLIC_xMSICFGADDRH_HHXW_MASK;
> +
> +    group_idx =3D hart_idx >> lhxw;
> +    hart_idx &=3D APLIC_xMSICFGADDR_PPN_LHX_MASK(lhxw);
> +
> +    addr =3D msicfgaddr;
> +    addr |=3D ((uint64_t)(msicfgaddrH & APLIC_xMSICFGADDRH_BAPPN_MASK)) =
<<
> 32;
> +    addr |=3D ((uint64_t)(group_idx &
> APLIC_xMSICFGADDR_PPN_HHX_MASK(hhxw))) <<
> +             APLIC_xMSICFGADDR_PPN_HHX_SHIFT(hhxs);
> +    addr |=3D ((uint64_t)(hart_idx & APLIC_xMSICFGADDR_PPN_LHX_MASK(lhxw=
)))
> <<
> +             APLIC_xMSICFGADDR_PPN_LHX_SHIFT(lhxs);
> +    addr |=3D (uint64_t)(guest_idx & APLIC_xMSICFGADDR_PPN_HART(lhxs));
> +    addr <<=3D APLIC_xMSICFGADDR_PPN_SHIFT;
> +
> +    address_space_stl_le(&address_space_memory, addr,
> +                         eiid, MEMTXATTRS_UNSPECIFIED, &result);
> +    if (result !=3D MEMTX_OK) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: MSI write failed for "
> +                      "hart_index=3D%d guest_index=3D%d eiid=3D%d\n",
> +                      __func__, hart_idx, guest_idx, eiid);
> +    }
> +}
> +
> +static void riscv_aplic_msi_irq_update(RISCVAPLICState *aplic, uint32_t
> irq)
> +{
> +    uint32_t hart_idx, guest_idx, eiid;
> +
> +    if (!aplic->msimode || (aplic->num_irqs <=3D irq) ||
> +        !(aplic->domaincfg & APLIC_DOMAINCFG_IE)) {
> +        return;
> +    }
> +
> +    if ((aplic->state[irq] & APLIC_ISTATE_ENPEND) !=3D APLIC_ISTATE_ENPE=
ND)
> {
> +        return;
> +    }
> +
> +    riscv_aplic_set_pending_raw(aplic, irq, false);
> +
> +    hart_idx =3D aplic->target[irq] >> APLIC_TARGET_HART_IDX_SHIFT;
> +    hart_idx &=3D APLIC_TARGET_HART_IDX_MASK;
> +    if (aplic->mmode) {
> +        /* M-level APLIC ignores guest_index */
> +        guest_idx =3D 0;
> +    } else {
> +        guest_idx =3D aplic->target[irq] >> APLIC_TARGET_GUEST_IDX_SHIFT=
;
> +        guest_idx &=3D APLIC_TARGET_GUEST_IDX_MASK;
> +    }
> +    eiid =3D aplic->target[irq] & APLIC_TARGET_EIID_MASK;
> +    riscv_aplic_msi_send(aplic, hart_idx, guest_idx, eiid);
> +}
> +
> +static uint32_t riscv_aplic_idc_topi(RISCVAPLICState *aplic, uint32_t id=
c)
> +{
> +    uint32_t best_irq, best_iprio;
> +    uint32_t irq, iprio, ihartidx, ithres;
> +
> +    if (aplic->num_harts <=3D idc) {
> +        return 0;
> +    }
> +
> +    ithres =3D aplic->ithreshold[idc];
> +    if (!ithres) {
> +        return 0;
> +    }
> +
> +    best_irq =3D best_iprio =3D UINT32_MAX;
> +    for (irq =3D 1; irq < aplic->num_irqs; irq++) {
> +        if ((aplic->state[irq] & APLIC_ISTATE_ENPEND) !=3D
> +            APLIC_ISTATE_ENPEND) {
> +            continue;
> +        }
> +
> +        ihartidx =3D aplic->target[irq] >> APLIC_TARGET_HART_IDX_SHIFT;
> +        ihartidx &=3D APLIC_TARGET_HART_IDX_MASK;
> +        if (ihartidx !=3D idc) {
> +            continue;
> +        }
> +
> +        iprio =3D aplic->target[irq] & aplic->iprio_mask;
> +        if (iprio >=3D ithres) {
> +            continue;
> +        }
> +
> +        if (iprio < best_iprio) {
> +            best_irq =3D irq;
> +            best_iprio =3D iprio;
> +        }
> +    }
> +
> +    if (best_irq < aplic->num_irqs && best_iprio <=3D aplic->iprio_mask)=
 {
> +        return (best_irq << APLIC_IDC_TOPI_ID_SHIFT) | best_iprio;
> +    }
> +
> +    return 0;
> +}
> +
> +static void riscv_aplic_idc_update(RISCVAPLICState *aplic, uint32_t idc)
> +{
> +    uint32_t topi;
> +
> +    if (aplic->msimode || aplic->num_harts <=3D idc) {
> +        return;
> +    }
> +
> +    topi =3D riscv_aplic_idc_topi(aplic, idc);
> +    if ((aplic->domaincfg & APLIC_DOMAINCFG_IE) &&
> +        aplic->idelivery[idc] &&
> +        (aplic->iforce[idc] || topi)) {
> +        qemu_irq_raise(aplic->external_irqs[idc]);
> +    } else {
> +        qemu_irq_lower(aplic->external_irqs[idc]);
> +    }
> +}
> +
> +static uint32_t riscv_aplic_idc_claimi(RISCVAPLICState *aplic, uint32_t
> idc)
> +{
> +    uint32_t irq, state, sm, topi =3D riscv_aplic_idc_topi(aplic, idc);
> +
> +    if (!topi) {
> +        aplic->iforce[idc] =3D 0;
> +        return 0;
> +    }
> +
> +    irq =3D (topi >> APLIC_IDC_TOPI_ID_SHIFT) & APLIC_IDC_TOPI_ID_MASK;
> +    sm =3D aplic->sourcecfg[irq] & APLIC_SOURCECFG_SM_MASK;
> +    state =3D aplic->state[irq];
> +    riscv_aplic_set_pending_raw(aplic, irq, false);
> +    if ((sm =3D=3D APLIC_SOURCECFG_SM_LEVEL_HIGH) &&
> +        (state & APLIC_ISTATE_INPUT)) {
> +        riscv_aplic_set_pending_raw(aplic, irq, true);
> +    } else if ((sm =3D=3D APLIC_SOURCECFG_SM_LEVEL_LOW) &&
> +               !(state & APLIC_ISTATE_INPUT)) {
> +        riscv_aplic_set_pending_raw(aplic, irq, true);
> +    }
> +    riscv_aplic_idc_update(aplic, idc);
> +
> +    return topi;
> +}
> +
> +static void riscv_aplic_request(void *opaque, int irq, int level)
> +{
> +    bool update =3D false;
> +    RISCVAPLICState *aplic =3D opaque;
> +    uint32_t sourcecfg, childidx, state, idc;
> +
> +    assert((0 < irq) && (irq < aplic->num_irqs));
> +
> +    sourcecfg =3D aplic->sourcecfg[irq];
> +    if (sourcecfg & APLIC_SOURCECFG_D) {
> +        childidx =3D sourcecfg & APLIC_SOURCECFG_CHILDIDX_MASK;
> +        if (childidx < aplic->num_children) {
> +            riscv_aplic_request(aplic->children[childidx], irq, level);
> +        }
> +        return;
> +    }
> +
> +    state =3D aplic->state[irq];
> +    switch (sourcecfg & APLIC_SOURCECFG_SM_MASK) {
> +    case APLIC_SOURCECFG_SM_EDGE_RISE:
> +        if ((level > 0) && !(state & APLIC_ISTATE_INPUT) &&
> +            !(state & APLIC_ISTATE_PENDING)) {
> +            riscv_aplic_set_pending_raw(aplic, irq, true);
> +            update =3D true;
> +        }
> +        break;
> +    case APLIC_SOURCECFG_SM_EDGE_FALL:
> +        if ((level <=3D 0) && (state & APLIC_ISTATE_INPUT) &&
> +            !(state & APLIC_ISTATE_PENDING)) {
> +            riscv_aplic_set_pending_raw(aplic, irq, true);
> +            update =3D true;
> +        }
> +        break;
> +    case APLIC_SOURCECFG_SM_LEVEL_HIGH:
> +        if ((level > 0) && !(state & APLIC_ISTATE_PENDING)) {
> +            riscv_aplic_set_pending_raw(aplic, irq, true);
> +            update =3D true;
> +        }
> +        break;
> +    case APLIC_SOURCECFG_SM_LEVEL_LOW:
> +        if ((level <=3D 0) && !(state & APLIC_ISTATE_PENDING)) {
> +            riscv_aplic_set_pending_raw(aplic, irq, true);
> +            update =3D true;
> +        }
> +        break;
> +    default:
> +        break;
> +    }
> +
> +    if (level <=3D 0) {
> +        aplic->state[irq] &=3D ~APLIC_ISTATE_INPUT;
> +    } else {
> +        aplic->state[irq] |=3D APLIC_ISTATE_INPUT;
> +    }
> +
> +    if (update) {
> +        if (aplic->msimode) {
> +            riscv_aplic_msi_irq_update(aplic, irq);
> +        } else {
> +            idc =3D aplic->target[irq] >> APLIC_TARGET_HART_IDX_SHIFT;
> +            idc &=3D APLIC_TARGET_HART_IDX_MASK;
> +            riscv_aplic_idc_update(aplic, idc);
> +        }
> +    }
> +}
> +
> +static uint64_t riscv_aplic_read(void *opaque, hwaddr addr, unsigned siz=
e)
> +{
> +    uint32_t irq, word, idc;
> +    RISCVAPLICState *aplic =3D opaque;
> +
> +    /* Reads must be 4 byte words */
> +    if ((addr & 0x3) !=3D 0) {
> +        goto err;
> +    }
> +
> +    if (addr =3D=3D APLIC_DOMAINCFG) {
> +        return aplic->domaincfg | (aplic->msimode ? APLIC_DOMAINCFG_DM :
> 0);
>

Hi Anup,

Should bits[31:24] of domaincfg be 0x80?

The domaincfg register has the format:
    bits 31:24 read-only 0x80
    bit 8 IE
    bit 7 read-only 0
    bit 2 DM (WARL)
    bit 0 BE (WARL)

+    } else if ((APLIC_SOURCECFG_BASE <=3D addr) &&
> +            (addr < (APLIC_SOURCECFG_BASE + (aplic->num_irqs - 1) * 4)))=
 {
> +        irq  =3D ((addr - APLIC_SOURCECFG_BASE) >> 2) + 1;
> +        return aplic->sourcecfg[irq];
> +    } else if (aplic->mmode && aplic->msimode &&
> +               (addr =3D=3D APLIC_MMSICFGADDR)) {
> +        return aplic->mmsicfgaddr;
> +    } else if (aplic->mmode && aplic->msimode &&
> +               (addr =3D=3D APLIC_MMSICFGADDRH)) {
> +        return aplic->mmsicfgaddrH;
> +    } else if (aplic->mmode && aplic->msimode &&
> +               (addr =3D=3D APLIC_SMSICFGADDR)) {
> +        /* Registers SMSICFGADDR and SMSICFGADDRH are implemented only i=
f:
> +         * (a) the interrupt domain is at machine level
> +         * (b) the domain=E2=80=99s harts implement supervisor mode
> +         * (c) the domain has one or more child supervisor-level domains
> +         *     that support MSI delivery mode (domaincfg.DM is not read-
> +         *     only zero in at least one of the supervisor-level child
> +         * domains).
> +         */
> +        return (aplic->num_children) ? aplic->smsicfgaddr : 0;
> +    } else if (aplic->mmode && aplic->msimode &&
> +               (addr =3D=3D APLIC_SMSICFGADDRH)) {
> +        return (aplic->num_children) ? aplic->smsicfgaddrH : 0;
> +    } else if ((APLIC_SETIP_BASE <=3D addr) &&
> +            (addr < (APLIC_SETIP_BASE + aplic->bitfield_words * 4))) {
> +        word =3D (addr - APLIC_SETIP_BASE) >> 2;
> +        return riscv_aplic_read_pending_word(aplic, word);
> +    } else if (addr =3D=3D APLIC_SETIPNUM) {
> +        return 0;
> +    } else if ((APLIC_CLRIP_BASE <=3D addr) &&
> +            (addr < (APLIC_CLRIP_BASE + aplic->bitfield_words * 4))) {
> +        word =3D (addr - APLIC_CLRIP_BASE) >> 2;
> +        return riscv_aplic_read_input_word(aplic, word);
> +    } else if (addr =3D=3D APLIC_CLRIPNUM) {
> +        return 0;
> +    } else if ((APLIC_SETIE_BASE <=3D addr) &&
> +            (addr < (APLIC_SETIE_BASE + aplic->bitfield_words * 4))) {
> +        word =3D (addr - APLIC_SETIE_BASE) >> 2;
> +        return riscv_aplic_read_enabled_word(aplic, word);
> +    } else if (addr =3D=3D APLIC_SETIENUM) {
> +        return 0;
> +    } else if ((APLIC_CLRIE_BASE <=3D addr) &&
> +            (addr < (APLIC_CLRIE_BASE + aplic->bitfield_words * 4))) {
> +        return 0;
> +    } else if (addr =3D=3D APLIC_CLRIENUM) {
> +        return 0;
> +    } else if (addr =3D=3D APLIC_SETIPNUM_LE) {
> +        return 0;
> +    } else if (addr =3D=3D APLIC_SETIPNUM_BE) {
> +        return 0;
> +    } else if (addr =3D=3D APLIC_GENMSI) {
> +        return (aplic->msimode) ? aplic->genmsi : 0;
> +    } else if ((APLIC_TARGET_BASE <=3D addr) &&
> +            (addr < (APLIC_TARGET_BASE + (aplic->num_irqs - 1) * 4))) {
> +        irq =3D ((addr - APLIC_TARGET_BASE) >> 2) + 1;
> +        return aplic->target[irq];
> +    } else if (!aplic->msimode && (APLIC_IDC_BASE <=3D addr) &&
> +            (addr < (APLIC_IDC_BASE + aplic->num_harts *
> APLIC_IDC_SIZE))) {
> +        idc =3D (addr - APLIC_IDC_BASE) / APLIC_IDC_SIZE;
> +        switch (addr - (APLIC_IDC_BASE + idc * APLIC_IDC_SIZE)) {
> +        case APLIC_IDC_IDELIVERY:
> +            return aplic->idelivery[idc];
> +        case APLIC_IDC_IFORCE:
> +            return aplic->iforce[idc];
> +        case APLIC_IDC_ITHRESHOLD:
> +            return aplic->ithreshold[idc];
> +        case APLIC_IDC_TOPI:
> +            return riscv_aplic_idc_topi(aplic, idc);
> +        case APLIC_IDC_CLAIMI:
> +            return riscv_aplic_idc_claimi(aplic, idc);
> +        default:
> +            goto err;
> +        };
> +    }
> +
> +err:
> +    qemu_log_mask(LOG_GUEST_ERROR,
> +                  "%s: Invalid register read 0x%" HWADDR_PRIx "\n",
> +                  __func__, addr);
> +    return 0;
> +}
> +
> +static void riscv_aplic_write(void *opaque, hwaddr addr, uint64_t value,
> +        unsigned size)
> +{
> +    RISCVAPLICState *aplic =3D opaque;
> +    uint32_t irq, word, idc =3D UINT32_MAX;
> +
> +    /* Writes must be 4 byte words */
> +    if ((addr & 0x3) !=3D 0) {
> +        goto err;
> +    }
> +
> +    if (addr =3D=3D APLIC_DOMAINCFG) {
> +        /* Only IE bit writeable at the moment */
> +        value &=3D APLIC_DOMAINCFG_IE;
> +        aplic->domaincfg =3D value;
> +    } else if ((APLIC_SOURCECFG_BASE <=3D addr) &&
> +            (addr < (APLIC_SOURCECFG_BASE + (aplic->num_irqs - 1) * 4)))=
 {
> +        irq  =3D ((addr - APLIC_SOURCECFG_BASE) >> 2) + 1;
> +        if (!aplic->num_children && (value & APLIC_SOURCECFG_D)) {
> +            value =3D 0;
> +        }
> +        if (value & APLIC_SOURCECFG_D) {
> +            value &=3D (APLIC_SOURCECFG_D | APLIC_SOURCECFG_CHILDIDX_MAS=
K);
> +        } else {
> +            value &=3D (APLIC_SOURCECFG_D | APLIC_SOURCECFG_SM_MASK);
> +        }
> +        aplic->sourcecfg[irq] =3D value;
> +        if ((aplic->sourcecfg[irq] & APLIC_SOURCECFG_D) ||
> +            (aplic->sourcecfg[irq] =3D=3D 0)) {
> +            riscv_aplic_set_pending_raw(aplic, irq, false);
> +            riscv_aplic_set_enabled_raw(aplic, irq, false);
> +        }
> +    } else if (aplic->mmode && aplic->msimode &&
> +               (addr =3D=3D APLIC_MMSICFGADDR)) {
> +        if (!(aplic->mmsicfgaddrH & APLIC_xMSICFGADDRH_L)) {
> +            aplic->mmsicfgaddr =3D value;
> +        }
> +    } else if (aplic->mmode && aplic->msimode &&
> +               (addr =3D=3D APLIC_MMSICFGADDRH)) {
> +        if (!(aplic->mmsicfgaddrH & APLIC_xMSICFGADDRH_L)) {
> +            aplic->mmsicfgaddrH =3D value & APLIC_xMSICFGADDRH_VALID_MAS=
K;
> +        }
> +    } else if (aplic->mmode && aplic->msimode &&
> +               (addr =3D=3D APLIC_SMSICFGADDR)) {
> +        /* Registers SMSICFGADDR and SMSICFGADDRH are implemented only i=
f:
> +         * (a) the interrupt domain is at machine level
> +         * (b) the domain=E2=80=99s harts implement supervisor mode
> +         * (c) the domain has one or more child supervisor-level domains
> +         *     that support MSI delivery mode (domaincfg.DM is not read-
> +         *     only zero in at least one of the supervisor-level child
> +         * domains).
> +         */
> +        if (aplic->num_children &&
> +            !(aplic->smsicfgaddrH & APLIC_xMSICFGADDRH_L)) {
> +            aplic->smsicfgaddr =3D value;
> +        }
> +    } else if (aplic->mmode && aplic->msimode &&
> +               (addr =3D=3D APLIC_SMSICFGADDRH)) {
> +        if (aplic->num_children &&
> +            !(aplic->smsicfgaddrH & APLIC_xMSICFGADDRH_L)) {
> +            aplic->smsicfgaddrH =3D value & APLIC_xMSICFGADDRH_VALID_MAS=
K;
> +        }
> +    } else if ((APLIC_SETIP_BASE <=3D addr) &&
> +            (addr < (APLIC_SETIP_BASE + aplic->bitfield_words * 4))) {
> +        word =3D (addr - APLIC_SETIP_BASE) >> 2;
> +        riscv_aplic_set_pending_word(aplic, word, value, true);
> +    } else if (addr =3D=3D APLIC_SETIPNUM) {
> +        riscv_aplic_set_pending(aplic, value, true);
> +    } else if ((APLIC_CLRIP_BASE <=3D addr) &&
> +            (addr < (APLIC_CLRIP_BASE + aplic->bitfield_words * 4))) {
> +        word =3D (addr - APLIC_CLRIP_BASE) >> 2;
> +        riscv_aplic_set_pending_word(aplic, word, value, false);
> +    } else if (addr =3D=3D APLIC_CLRIPNUM) {
> +        riscv_aplic_set_pending(aplic, value, false);
> +    } else if ((APLIC_SETIE_BASE <=3D addr) &&
> +            (addr < (APLIC_SETIE_BASE + aplic->bitfield_words * 4))) {
> +        word =3D (addr - APLIC_SETIE_BASE) >> 2;
> +        riscv_aplic_set_enabled_word(aplic, word, value, true);
> +    } else if (addr =3D=3D APLIC_SETIENUM) {
> +        riscv_aplic_set_enabled(aplic, value, true);
> +    } else if ((APLIC_CLRIE_BASE <=3D addr) &&
> +            (addr < (APLIC_CLRIE_BASE + aplic->bitfield_words * 4))) {
> +        word =3D (addr - APLIC_CLRIE_BASE) >> 2;
> +        riscv_aplic_set_enabled_word(aplic, word, value, false);
> +    } else if (addr =3D=3D APLIC_CLRIENUM) {
> +        riscv_aplic_set_enabled(aplic, value, false);
> +    } else if (addr =3D=3D APLIC_SETIPNUM_LE) {
> +        riscv_aplic_set_pending(aplic, value, true);
> +    } else if (addr =3D=3D APLIC_SETIPNUM_BE) {
> +        riscv_aplic_set_pending(aplic, bswap32(value), true);
> +    } else if (addr =3D=3D APLIC_GENMSI) {
> +        if (aplic->msimode) {
> +            aplic->genmsi =3D value & ~(APLIC_TARGET_GUEST_IDX_MASK <<
> +                                      APLIC_TARGET_GUEST_IDX_SHIFT);
> +            riscv_aplic_msi_send(aplic,
> +                                 value >> APLIC_TARGET_HART_IDX_SHIFT,
> +                                 0,
> +                                 value & APLIC_TARGET_EIID_MASK);
> +        }
> +    } else if ((APLIC_TARGET_BASE <=3D addr) &&
> +            (addr < (APLIC_TARGET_BASE + (aplic->num_irqs - 1) * 4))) {
> +        irq =3D ((addr - APLIC_TARGET_BASE) >> 2) + 1;
> +        if (aplic->msimode) {
> +            aplic->target[irq] =3D value;
> +        } else {
> +            aplic->target[irq] =3D (value & ~APLIC_TARGET_IPRIO_MASK) |
> +                                 (value & aplic->iprio_mask);
> +        }
> +    } else if (!aplic->msimode && (APLIC_IDC_BASE <=3D addr) &&
> +            (addr < (APLIC_IDC_BASE + aplic->num_harts *
> APLIC_IDC_SIZE))) {
> +        idc =3D (addr - APLIC_IDC_BASE) / APLIC_IDC_SIZE;
> +        switch (addr - (APLIC_IDC_BASE + idc * APLIC_IDC_SIZE)) {
> +        case APLIC_IDC_IDELIVERY:
> +            aplic->idelivery[idc] =3D value & 0x1;
> +            break;
> +        case APLIC_IDC_IFORCE:
> +            aplic->iforce[idc] =3D value & 0x1;
> +            break;
> +        case APLIC_IDC_ITHRESHOLD:
> +            aplic->ithreshold[idc] =3D value & aplic->iprio_mask;
> +            break;
> +        default:
> +            goto err;
> +        };
> +    } else {
> +        goto err;
> +    }
> +
> +    if (aplic->msimode) {
> +        for (irq =3D 1; irq < aplic->num_irqs; irq++) {
> +            riscv_aplic_msi_irq_update(aplic, irq);
> +        }
> +    } else {
> +        if (idc =3D=3D UINT32_MAX) {
> +            for (idc =3D 0; idc < aplic->num_harts; idc++) {
> +                riscv_aplic_idc_update(aplic, idc);
> +            }
> +        } else {
> +            riscv_aplic_idc_update(aplic, idc);
> +        }
> +    }
> +
> +    return;
> +
> +err:
> +    qemu_log_mask(LOG_GUEST_ERROR,
> +                  "%s: Invalid register write 0x%" HWADDR_PRIx "\n",
> +                  __func__, addr);
> +}
> +
> +static const MemoryRegionOps riscv_aplic_ops =3D {
> +    .read =3D riscv_aplic_read,
> +    .write =3D riscv_aplic_write,
> +    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .valid =3D {
> +        .min_access_size =3D 4,
> +        .max_access_size =3D 4
> +    }
> +};
> +
> +static void riscv_aplic_realize(DeviceState *dev, Error **errp)
> +{
> +    uint32_t i;
> +    RISCVAPLICState *aplic =3D RISCV_APLIC(dev);
> +
> +    aplic->bitfield_words =3D (aplic->num_irqs + 31) >> 5;
> +    aplic->sourcecfg =3D g_new0(uint32_t, aplic->num_irqs);
> +    aplic->state =3D g_new(uint32_t, aplic->num_irqs);
> +    aplic->target =3D g_new0(uint32_t, aplic->num_irqs);
> +    aplic->idelivery =3D g_new0(uint32_t, aplic->num_harts);
> +    aplic->iforce =3D g_new0(uint32_t, aplic->num_harts);
> +    aplic->ithreshold =3D g_new0(uint32_t, aplic->num_harts);
> +
> +    memory_region_init_io(&aplic->mmio, OBJECT(dev), &riscv_aplic_ops,
> aplic,
> +                          TYPE_RISCV_APLIC, aplic->aperture_size);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &aplic->mmio);
> +
> +    /* Only root APLICs have hardware IRQ lines. All non-root APLICs
> +     * have IRQ lines delegated by their parent APLIC.
> +     */
> +    if (!aplic->parent) {
> +        qdev_init_gpio_in(dev, riscv_aplic_request, aplic->num_irqs);
> +    }
> +
> +    /* Create output IRQ lines for non-MSI mode */
> +    if (!aplic->msimode) {
> +        aplic->external_irqs =3D g_malloc(sizeof(qemu_irq) *
> aplic->num_harts);
> +        qdev_init_gpio_out(dev, aplic->external_irqs, aplic->num_harts);
> +
> +        /* Claim the CPU interrupt to be triggered by this APLIC */
> +        for (i =3D 0; i < aplic->num_harts; i++) {
> +            RISCVCPU *cpu =3D RISCV_CPU(qemu_get_cpu(aplic->hartid_base =
+
> i));
> +            if (riscv_cpu_claim_interrupts(cpu,
> +                (aplic->mmode) ? MIP_MEIP : MIP_SEIP) < 0) {
> +                error_report("%s already claimed",
> +                             (aplic->mmode) ? "MEIP" : "SEIP");
> +                exit(1);
> +            }
> +        }
> +    }
> +
> +    msi_nonbroken =3D true;
> +}
> +
> +static Property riscv_aplic_properties[] =3D {
> +    DEFINE_PROP_UINT32("aperture-size", RISCVAPLICState, aperture_size,
> 0),
> +    DEFINE_PROP_UINT32("hartid-base", RISCVAPLICState, hartid_base, 0),
> +    DEFINE_PROP_UINT32("num-harts", RISCVAPLICState, num_harts, 0),
> +    DEFINE_PROP_UINT32("iprio-mask", RISCVAPLICState, iprio_mask, 0),
> +    DEFINE_PROP_UINT32("num-irqs", RISCVAPLICState, num_irqs, 0),
> +    DEFINE_PROP_BOOL("msimode", RISCVAPLICState, msimode, 0),
> +    DEFINE_PROP_BOOL("mmode", RISCVAPLICState, mmode, 0),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static const VMStateDescription vmstate_riscv_aplic =3D {
> +    .name =3D "riscv_aplic",
> +    .version_id =3D 1,
> +    .minimum_version_id =3D 1,
> +    .fields =3D (VMStateField[]) {
> +            VMSTATE_UINT32(domaincfg, RISCVAPLICState),
> +            VMSTATE_UINT32(mmsicfgaddr, RISCVAPLICState),
> +            VMSTATE_UINT32(mmsicfgaddrH, RISCVAPLICState),
> +            VMSTATE_UINT32(smsicfgaddr, RISCVAPLICState),
> +            VMSTATE_UINT32(smsicfgaddrH, RISCVAPLICState),
> +            VMSTATE_UINT32(genmsi, RISCVAPLICState),
> +            VMSTATE_VARRAY_UINT32(sourcecfg, RISCVAPLICState,
> +                                  num_irqs, 0,
> +                                  vmstate_info_uint32, uint32_t),
> +            VMSTATE_VARRAY_UINT32(state, RISCVAPLICState,
> +                                  num_irqs, 0,
> +                                  vmstate_info_uint32, uint32_t),
> +            VMSTATE_VARRAY_UINT32(target, RISCVAPLICState,
> +                                  num_irqs, 0,
> +                                  vmstate_info_uint32, uint32_t),
> +            VMSTATE_VARRAY_UINT32(idelivery, RISCVAPLICState,
> +                                  num_harts, 0,
> +                                  vmstate_info_uint32, uint32_t),
> +            VMSTATE_VARRAY_UINT32(iforce, RISCVAPLICState,
> +                                  num_harts, 0,
> +                                  vmstate_info_uint32, uint32_t),
> +            VMSTATE_VARRAY_UINT32(ithreshold, RISCVAPLICState,
> +                                  num_harts, 0,
> +                                  vmstate_info_uint32, uint32_t),
> +            VMSTATE_END_OF_LIST()
> +        }
> +};
> +
> +static void riscv_aplic_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> +
> +    device_class_set_props(dc, riscv_aplic_properties);
> +    dc->realize =3D riscv_aplic_realize;
> +    dc->vmsd =3D &vmstate_riscv_aplic;
> +}
> +
> +static const TypeInfo riscv_aplic_info =3D {
> +    .name          =3D TYPE_RISCV_APLIC,
> +    .parent        =3D TYPE_SYS_BUS_DEVICE,
> +    .instance_size =3D sizeof(RISCVAPLICState),
> +    .class_init    =3D riscv_aplic_class_init,
> +};
> +
> +static void riscv_aplic_register_types(void)
> +{
> +    type_register_static(&riscv_aplic_info);
> +}
> +
> +type_init(riscv_aplic_register_types)
> +
> +/*
> + * Add a APLIC device to another APLIC device as child for
> + * interrupt delegation.
> + */
> +void riscv_aplic_add_child(DeviceState *parent, DeviceState *child)
> +{
> +    RISCVAPLICState *caplic, *paplic;
> +
> +    assert(parent && child);
> +    caplic =3D RISCV_APLIC(child);
> +    paplic =3D RISCV_APLIC(parent);
> +
> +    assert(paplic->num_irqs =3D=3D caplic->num_irqs);
> +    assert(paplic->num_children <=3D QEMU_APLIC_MAX_CHILDREN);
> +
> +    caplic->parent =3D paplic;
> +    paplic->children[paplic->num_children] =3D caplic;
> +    paplic->num_children++;
> +}
> +
> +/*
> + * Create APLIC device.
> + */
> +DeviceState *riscv_aplic_create(hwaddr addr, hwaddr size,
> +    uint32_t hartid_base, uint32_t num_harts, uint32_t num_sources,
> +    uint32_t iprio_bits, bool msimode, bool mmode, DeviceState *parent)
> +{
> +    DeviceState *dev =3D qdev_new(TYPE_RISCV_APLIC);
> +    uint32_t i;
> +
> +    assert(num_harts < APLIC_MAX_IDC);
> +    assert((APLIC_IDC_BASE + (num_harts * APLIC_IDC_SIZE)) <=3D size);
> +    assert(num_sources < APLIC_MAX_SOURCE);
> +    assert(APLIC_MIN_IPRIO_BITS <=3D iprio_bits);
> +    assert(iprio_bits <=3D APLIC_MAX_IPRIO_BITS);
> +
> +    qdev_prop_set_uint32(dev, "aperture-size", size);
> +    qdev_prop_set_uint32(dev, "hartid-base", hartid_base);
> +    qdev_prop_set_uint32(dev, "num-harts", num_harts);
> +    qdev_prop_set_uint32(dev, "iprio-mask", ((1U << iprio_bits) - 1));
> +    qdev_prop_set_uint32(dev, "num-irqs", num_sources + 1);
> +    qdev_prop_set_bit(dev, "msimode", msimode);
> +    qdev_prop_set_bit(dev, "mmode", mmode);
> +
> +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
> +
> +    if (parent) {
> +        riscv_aplic_add_child(parent, dev);
> +    }
> +
> +    if (!msimode) {
> +        for (i =3D 0; i < num_harts; i++) {
> +            CPUState *cpu =3D qemu_get_cpu(hartid_base + i);
> +
> +            qdev_connect_gpio_out_named(dev, NULL, i,
> +                                        qdev_get_gpio_in(DEVICE(cpu),
> +                                            (mmode) ? IRQ_M_EXT :
> IRQ_S_EXT));
> +        }
> +    }
> +
> +    return dev;
> +}
> diff --git a/include/hw/intc/riscv_aplic.h b/include/hw/intc/riscv_aplic.=
h
> new file mode 100644
> index 0000000000..de8532fbc3
> --- /dev/null
> +++ b/include/hw/intc/riscv_aplic.h
> @@ -0,0 +1,79 @@
> +/*
> + * RISC-V APLIC (Advanced Platform Level Interrupt Controller) interface
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
> +#ifndef HW_RISCV_APLIC_H
> +#define HW_RISCV_APLIC_H
> +
> +#include "hw/sysbus.h"
> +#include "qom/object.h"
> +
> +#define TYPE_RISCV_APLIC "riscv.aplic"
> +
> +typedef struct RISCVAPLICState RISCVAPLICState;
> +DECLARE_INSTANCE_CHECKER(RISCVAPLICState, RISCV_APLIC, TYPE_RISCV_APLIC)
> +
> +#define APLIC_MIN_SIZE            0x4000
> +#define APLIC_SIZE_ALIGN(__x)     (((__x) + (APLIC_MIN_SIZE - 1)) & \
> +                                   ~(APLIC_MIN_SIZE - 1))
> +#define APLIC_SIZE(__num_harts)   (APLIC_MIN_SIZE + \
> +                                   APLIC_SIZE_ALIGN(32 * (__num_harts)))
> +
> +struct RISCVAPLICState {
> +    /*< private >*/
> +    SysBusDevice parent_obj;
> +    qemu_irq *external_irqs;
> +
> +    /*< public >*/
> +    MemoryRegion mmio;
> +    uint32_t bitfield_words;
> +    uint32_t domaincfg;
> +    uint32_t mmsicfgaddr;
> +    uint32_t mmsicfgaddrH;
> +    uint32_t smsicfgaddr;
> +    uint32_t smsicfgaddrH;
> +    uint32_t genmsi;
> +    uint32_t *sourcecfg;
> +    uint32_t *state;
> +    uint32_t *target;
> +    uint32_t *idelivery;
> +    uint32_t *iforce;
> +    uint32_t *ithreshold;
> +
> +    /* topology */
> +#define QEMU_APLIC_MAX_CHILDREN        16
> +    struct RISCVAPLICState *parent;
> +    struct RISCVAPLICState *children[QEMU_APLIC_MAX_CHILDREN];
> +    uint16_t num_children;
> +
> +    /* config */
> +    uint32_t aperture_size;
> +    uint32_t hartid_base;
> +    uint32_t num_harts;
> +    uint32_t iprio_mask;
> +    uint32_t num_irqs;
> +    bool msimode;
> +    bool mmode;
> +};
> +
> +void riscv_aplic_add_child(DeviceState *parent, DeviceState *child);
> +
> +DeviceState *riscv_aplic_create(hwaddr addr, hwaddr size,
> +    uint32_t hartid_base, uint32_t num_harts, uint32_t num_sources,
> +    uint32_t iprio_bits, bool msimode, bool mmode, DeviceState *parent);
> +
> +#endif
> --
> 2.25.1
>
>
>

--0000000000000c1b9105d589966f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Anup Patel &lt;<a href=3D"mailto:anup@bra=
infault.org" target=3D"_blank">anup@brainfault.org</a>&gt; =E6=96=BC 2021=
=E5=B9=B412=E6=9C=8830=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=888:55=
=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><div class=3D"gmail_quote"><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">From: Anup Patel &lt;<a href=3D"mail=
to:anup.patel@wdc.com" target=3D"_blank">anup.patel@wdc.com</a>&gt;<br>
<br>
The RISC-V AIA (Advanced Interrupt Architecture) defines a new<br>
interrupt controller for wired interrupts called APLIC (Advanced<br>
Platform Level Interrupt Controller). The APLIC is capabable of<br>
forwarding wired interupts to RISC-V HARTs directly or as MSIs<br>
(Message Signaled Interupts).<br>
<br>
This patch adds device emulation for RISC-V AIA APLIC.<br>
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
=C2=A0hw/intc/riscv_aplic.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 970 ++++++++=
++++++++++++++++++++++++++<br>
=C2=A0include/hw/intc/riscv_aplic.h |=C2=A0 79 +++<br>
=C2=A04 files changed, 1053 insertions(+)<br>
=C2=A0create mode 100644 hw/intc/riscv_aplic.c<br>
=C2=A0create mode 100644 include/hw/intc/riscv_aplic.h<br>
<br>
diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig<br>
index 010ded7eae..528e77b4a6 100644<br>
--- a/hw/intc/Kconfig<br>
+++ b/hw/intc/Kconfig<br>
@@ -70,6 +70,9 @@ config LOONGSON_LIOINTC<br>
=C2=A0config RISCV_ACLINT<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
<br>
+config RISCV_APLIC<br>
+=C2=A0 =C2=A0 bool<br>
+<br>
=C2=A0config SIFIVE_PLIC<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
<br>
diff --git a/hw/intc/meson.build b/hw/intc/meson.build<br>
index 70080bc161..7466024402 100644<br>
--- a/hw/intc/meson.build<br>
+++ b/hw/intc/meson.build<br>
@@ -50,6 +50,7 @@ specific_ss.add(when: &#39;CONFIG_S390_FLIC&#39;, if_true=
: files(&#39;s390_flic.c&#39;))<br>
=C2=A0specific_ss.add(when: &#39;CONFIG_S390_FLIC_KVM&#39;, if_true: files(=
&#39;s390_flic_kvm.c&#39;))<br>
=C2=A0specific_ss.add(when: &#39;CONFIG_SH_INTC&#39;, if_true: files(&#39;s=
h_intc.c&#39;))<br>
=C2=A0specific_ss.add(when: &#39;CONFIG_RISCV_ACLINT&#39;, if_true: files(&=
#39;riscv_aclint.c&#39;))<br>
+specific_ss.add(when: &#39;CONFIG_RISCV_APLIC&#39;, if_true: files(&#39;ri=
scv_aplic.c&#39;))<br>
=C2=A0specific_ss.add(when: &#39;CONFIG_SIFIVE_PLIC&#39;, if_true: files(&#=
39;sifive_plic.c&#39;))<br>
=C2=A0specific_ss.add(when: &#39;CONFIG_XICS&#39;, if_true: files(&#39;xics=
.c&#39;))<br>
=C2=A0specific_ss.add(when: [&#39;CONFIG_KVM&#39;, &#39;CONFIG_XICS&#39;],<=
br>
diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c<br>
new file mode 100644<br>
index 0000000000..f4b8828dac<br>
--- /dev/null<br>
+++ b/hw/intc/riscv_aplic.c<br>
@@ -0,0 +1,970 @@<br>
+/*<br>
+ * RISC-V APLIC (Advanced Platform Level Interrupt Controller)<br>
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
+#include &quot;hw/intc/riscv_aplic.h&quot;<br>
+#include &quot;hw/irq.h&quot;<br>
+#include &quot;target/riscv/cpu.h&quot;<br>
+#include &quot;sysemu/sysemu.h&quot;<br>
+#include &quot;migration/vmstate.h&quot;<br>
+<br>
+#define APLIC_MAX_IDC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (1UL &lt;&lt; 14)<br>
+#define APLIC_MAX_SOURCE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A01024<br>
+#define APLIC_MIN_IPRIO_BITS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01<br>
+#define APLIC_MAX_IPRIO_BITS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A08<br>
+#define APLIC_MAX_CHILDREN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
1024<br>
+<br>
+#define APLIC_DOMAINCFG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 0x0000<br>
+#define APLIC_DOMAINCFG_IE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
(1 &lt;&lt; 8)<br>
+#define APLIC_DOMAINCFG_DM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
(1 &lt;&lt; 2)<br>
+#define APLIC_DOMAINCFG_BE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
(1 &lt;&lt; 0)<br>
+<br>
+#define APLIC_SOURCECFG_BASE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x000=
4<br>
+#define APLIC_SOURCECFG_D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
(1 &lt;&lt; 10)<br>
+#define APLIC_SOURCECFG_CHILDIDX_MASK=C2=A0 0x000003ff<br>
+#define APLIC_SOURCECFG_SM_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x00000007<br>
+#define APLIC_SOURCECFG_SM_INACTIVE=C2=A0 =C2=A0 0x0<br>
+#define APLIC_SOURCECFG_SM_DETACH=C2=A0 =C2=A0 =C2=A0 0x1<br>
+#define APLIC_SOURCECFG_SM_EDGE_RISE=C2=A0 =C2=A00x4<br>
+#define APLIC_SOURCECFG_SM_EDGE_FALL=C2=A0 =C2=A00x5<br>
+#define APLIC_SOURCECFG_SM_LEVEL_HIGH=C2=A0 0x6<br>
+#define APLIC_SOURCECFG_SM_LEVEL_LOW=C2=A0 =C2=A00x7<br>
+<br>
+#define APLIC_MMSICFGADDR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
0x1bc0<br>
+#define APLIC_MMSICFGADDRH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
0x1bc4<br>
+#define APLIC_SMSICFGADDR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
0x1bc8<br>
+#define APLIC_SMSICFGADDRH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
0x1bcc<br>
+<br>
+#define APLIC_xMSICFGADDRH_L=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1UL =
&lt;&lt; 31)<br>
+#define APLIC_xMSICFGADDRH_HHXS_MASK=C2=A0 =C2=A00x1f<br>
+#define APLIC_xMSICFGADDRH_HHXS_SHIFT=C2=A0 24<br>
+#define APLIC_xMSICFGADDRH_LHXS_MASK=C2=A0 =C2=A00x7<br>
+#define APLIC_xMSICFGADDRH_LHXS_SHIFT=C2=A0 20<br>
+#define APLIC_xMSICFGADDRH_HHXW_MASK=C2=A0 =C2=A00x7<br>
+#define APLIC_xMSICFGADDRH_HHXW_SHIFT=C2=A0 16<br>
+#define APLIC_xMSICFGADDRH_LHXW_MASK=C2=A0 =C2=A00xf<br>
+#define APLIC_xMSICFGADDRH_LHXW_SHIFT=C2=A0 12<br>
+#define APLIC_xMSICFGADDRH_BAPPN_MASK=C2=A0 0xfff<br>
+<br>
+#define APLIC_xMSICFGADDR_PPN_SHIFT=C2=A0 =C2=A0 12<br>
+<br>
+#define APLIC_xMSICFGADDR_PPN_HART(__lhxs) \<br>
+=C2=A0 =C2=A0 ((1UL &lt;&lt; (__lhxs)) - 1)<br>
+<br>
+#define APLIC_xMSICFGADDR_PPN_LHX_MASK(__lhxw) \<br>
+=C2=A0 =C2=A0 ((1UL &lt;&lt; (__lhxw)) - 1)<br>
+#define APLIC_xMSICFGADDR_PPN_LHX_SHIFT(__lhxs) \<br>
+=C2=A0 =C2=A0 ((__lhxs))<br>
+#define APLIC_xMSICFGADDR_PPN_LHX(__lhxw, __lhxs) \<br>
+=C2=A0 =C2=A0 (APLIC_xMSICFGADDR_PPN_LHX_MASK(__lhxw) &lt;&lt; \<br>
+=C2=A0 =C2=A0 =C2=A0APLIC_xMSICFGADDR_PPN_LHX_SHIFT(__lhxs))<br>
+<br>
+#define APLIC_xMSICFGADDR_PPN_HHX_MASK(__hhxw) \<br>
+=C2=A0 =C2=A0 ((1UL &lt;&lt; (__hhxw)) - 1)<br>
+#define APLIC_xMSICFGADDR_PPN_HHX_SHIFT(__hhxs) \<br>
+=C2=A0 =C2=A0 ((__hhxs) + APLIC_xMSICFGADDR_PPN_SHIFT)<br>
+#define APLIC_xMSICFGADDR_PPN_HHX(__hhxw, __hhxs) \<br>
+=C2=A0 =C2=A0 (APLIC_xMSICFGADDR_PPN_HHX_MASK(__hhxw) &lt;&lt; \<br>
+=C2=A0 =C2=A0 =C2=A0APLIC_xMSICFGADDR_PPN_HHX_SHIFT(__hhxs))<br>
+<br>
+#define APLIC_xMSICFGADDRH_VALID_MASK=C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 (APLIC_xMSICFGADDRH_L | \<br>
+=C2=A0 =C2=A0 =C2=A0(APLIC_xMSICFGADDRH_HHXS_MASK &lt;&lt; APLIC_xMSICFGAD=
DRH_HHXS_SHIFT) | \<br>
+=C2=A0 =C2=A0 =C2=A0(APLIC_xMSICFGADDRH_LHXS_MASK &lt;&lt; APLIC_xMSICFGAD=
DRH_LHXS_SHIFT) | \<br>
+=C2=A0 =C2=A0 =C2=A0(APLIC_xMSICFGADDRH_HHXW_MASK &lt;&lt; APLIC_xMSICFGAD=
DRH_HHXW_SHIFT) | \<br>
+=C2=A0 =C2=A0 =C2=A0(APLIC_xMSICFGADDRH_LHXW_MASK &lt;&lt; APLIC_xMSICFGAD=
DRH_LHXW_SHIFT) | \<br>
+=C2=A0 =C2=A0 =C2=A0APLIC_xMSICFGADDRH_BAPPN_MASK)<br>
+<br>
+#define APLIC_SETIP_BASE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A00x1c00<br>
+#define APLIC_SETIPNUM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00x1cdc<br>
+<br>
+#define APLIC_CLRIP_BASE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A00x1d00<br>
+#define APLIC_CLRIPNUM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00x1ddc<br>
+<br>
+#define APLIC_SETIE_BASE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A00x1e00<br>
+#define APLIC_SETIENUM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00x1edc<br>
+<br>
+#define APLIC_CLRIE_BASE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A00x1f00<br>
+#define APLIC_CLRIENUM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00x1fdc<br>
+<br>
+#define APLIC_SETIPNUM_LE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
0x2000<br>
+#define APLIC_SETIPNUM_BE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
0x2004<br>
+<br>
+#define APLIC_ISTATE_PENDING=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1U &=
lt;&lt; 0)<br>
+#define APLIC_ISTATE_ENABLED=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1U &=
lt;&lt; 1)<br>
+#define APLIC_ISTATE_ENPEND=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (APLI=
C_ISTATE_ENABLED | \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 APLIC_IS=
TATE_PENDING)<br>
+#define APLIC_ISTATE_INPUT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
(1U &lt;&lt; 8)<br>
+<br>
+#define APLIC_GENMSI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A00x3000<br>
+<br>
+#define APLIC_TARGET_BASE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
0x3004<br>
+#define APLIC_TARGET_HART_IDX_SHIFT=C2=A0 =C2=A0 18<br>
+#define APLIC_TARGET_HART_IDX_MASK=C2=A0 =C2=A0 =C2=A00x3fff<br>
+#define APLIC_TARGET_GUEST_IDX_SHIFT=C2=A0 =C2=A012<br>
+#define APLIC_TARGET_GUEST_IDX_MASK=C2=A0 =C2=A0 0x3f<br>
+#define APLIC_TARGET_IPRIO_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 0xff<br>
+#define APLIC_TARGET_EIID_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x7ff<br>
+<br>
+#define APLIC_IDC_BASE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00x4000<br>
+#define APLIC_IDC_SIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A032<br>
+<br>
+#define APLIC_IDC_IDELIVERY=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x00<=
br>
+<br>
+#define APLIC_IDC_IFORCE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A00x04<br>
+<br>
+#define APLIC_IDC_ITHRESHOLD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x08<=
br>
+<br>
+#define APLIC_IDC_TOPI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00x18<br>
+#define APLIC_IDC_TOPI_ID_SHIFT=C2=A0 =C2=A0 =C2=A0 =C2=A0 16<br>
+#define APLIC_IDC_TOPI_ID_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x3ff<br>
+#define APLIC_IDC_TOPI_PRIO_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A00xff<br>
+<br>
+#define APLIC_IDC_CLAIMI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A00x1c<br>
+<br>
+static uint32_t riscv_aplic_read_input_word(RISCVAPLICState *aplic,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 uint32_t word)<br>
+{<br>
+=C2=A0 =C2=A0 uint32_t i, irq, ret =3D 0;<br>
+<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; 32; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 irq =3D word * 32 + i;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!irq || aplic-&gt;num_irqs &lt;=3D irq) {<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret |=3D ((aplic-&gt;state[irq] &amp; APLIC_IS=
TATE_INPUT) ? 1 : 0) &lt;&lt; i;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return ret;<br>
+}<br>
+<br>
+static uint32_t riscv_aplic_read_pending_word(RISCVAPLICState *aplic,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 uint32_t word)<br>
+{<br>
+=C2=A0 =C2=A0 uint32_t i, irq, ret =3D 0;<br>
+<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; 32; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 irq =3D word * 32 + i;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!irq || aplic-&gt;num_irqs &lt;=3D irq) {<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret |=3D ((aplic-&gt;state[irq] &amp; APLIC_IS=
TATE_PENDING) ? 1 : 0) &lt;&lt; i;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return ret;<br>
+}<br>
+<br>
+static void riscv_aplic_set_pending_raw(RISCVAPLICState *aplic,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t=
 irq, bool pending)<br>
+{<br>
+=C2=A0 =C2=A0 if (pending) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 aplic-&gt;state[irq] |=3D APLIC_ISTATE_PENDING=
;<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 aplic-&gt;state[irq] &amp;=3D ~APLIC_ISTATE_PE=
NDING;<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void riscv_aplic_set_pending(RISCVAPLICState *aplic,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t irq, bool pen=
ding)<br>
+{<br>
+=C2=A0 =C2=A0 uint32_t sourcecfg, sm;<br>
+<br>
+=C2=A0 =C2=A0 if ((irq &lt;=3D 0) || (aplic-&gt;num_irqs &lt;=3D irq)) {<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 sourcecfg =3D aplic-&gt;sourcecfg[irq];<br>
+=C2=A0 =C2=A0 if (sourcecfg &amp; APLIC_SOURCECFG_D) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 sm =3D sourcecfg &amp; APLIC_SOURCECFG_SM_MASK;<br>
+=C2=A0 =C2=A0 if ((sm =3D=3D APLIC_SOURCECFG_SM_INACTIVE) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (!aplic-&gt;msimode &amp;&amp; ((sm =3D=3D APL=
IC_SOURCECFG_SM_LEVEL_HIGH) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(sm =3D=3D APLIC_SOURCECFG_SM_LEVEL_LOW)))) =
{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 riscv_aplic_set_pending_raw(aplic, irq, pending);<br>
+}<br>
+<br>
+static void riscv_aplic_set_pending_word(RISCVAPLICState *aplic,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ui=
nt32_t word, uint32_t value,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bo=
ol pending)<br>
+{<br>
+=C2=A0 =C2=A0 uint32_t i, irq;<br>
+<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; 32; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 irq =3D word * 32 + i;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!irq || aplic-&gt;num_irqs &lt;=3D irq) {<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (value &amp; (1U &lt;&lt; i)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_aplic_set_pending(aplic, i=
rq, pending);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static uint32_t riscv_aplic_read_enabled_word(RISCVAPLICState *aplic,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 int word)<br>
+{<br>
+=C2=A0 =C2=A0 uint32_t i, irq, ret =3D 0;<br>
+<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; 32; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 irq =3D word * 32 + i;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!irq || aplic-&gt;num_irqs &lt;=3D irq) {<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret |=3D ((aplic-&gt;state[irq] &amp; APLIC_IS=
TATE_ENABLED) ? 1 : 0) &lt;&lt; i;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return ret;<br>
+}<br>
+<br>
+static void riscv_aplic_set_enabled_raw(RISCVAPLICState *aplic,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t=
 irq, bool enabled)<br>
+{<br>
+=C2=A0 =C2=A0 if (enabled) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 aplic-&gt;state[irq] |=3D APLIC_ISTATE_ENABLED=
;<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 aplic-&gt;state[irq] &amp;=3D ~APLIC_ISTATE_EN=
ABLED;<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void riscv_aplic_set_enabled(RISCVAPLICState *aplic,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t irq, bool ena=
bled)<br>
+{<br>
+=C2=A0 =C2=A0 uint32_t sourcecfg, sm;<br>
+<br>
+=C2=A0 =C2=A0 if ((irq &lt;=3D 0) || (aplic-&gt;num_irqs &lt;=3D irq)) {<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 sourcecfg =3D aplic-&gt;sourcecfg[irq];<br>
+=C2=A0 =C2=A0 if (sourcecfg &amp; APLIC_SOURCECFG_D) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 sm =3D sourcecfg &amp; APLIC_SOURCECFG_SM_MASK;<br>
+=C2=A0 =C2=A0 if (sm =3D=3D APLIC_SOURCECFG_SM_INACTIVE) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 riscv_aplic_set_enabled_raw(aplic, irq, enabled);<br>
+}<br>
+<br>
+static void riscv_aplic_set_enabled_word(RISCVAPLICState *aplic,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ui=
nt32_t word, uint32_t value,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bo=
ol enabled)<br>
+{<br>
+=C2=A0 =C2=A0 uint32_t i, irq;<br>
+<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; 32; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 irq =3D word * 32 + i;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!irq || aplic-&gt;num_irqs &lt;=3D irq) {<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (value &amp; (1U &lt;&lt; i)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_aplic_set_enabled(aplic, i=
rq, enabled);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void riscv_aplic_msi_send(RISCVAPLICState *aplic,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t hart_idx, uint32_t gu=
est_idx,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t eiid)<br>
+{<br>
+=C2=A0 =C2=A0 uint64_t addr;<br>
+=C2=A0 =C2=A0 MemTxResult result;<br>
+=C2=A0 =C2=A0 RISCVAPLICState *aplic_m;<br>
+=C2=A0 =C2=A0 uint32_t lhxs, lhxw, hhxs, hhxw, group_idx, msicfgaddr, msic=
fgaddrH;<br>
+<br>
+=C2=A0 =C2=A0 aplic_m =3D aplic;<br>
+=C2=A0 =C2=A0 while (aplic_m &amp;&amp; !aplic_m-&gt;mmode) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 aplic_m =3D aplic_m-&gt;parent;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 if (!aplic_m) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR, &quot;%s: m-lev=
el APLIC not found\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 __func__);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (aplic-&gt;mmode) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 msicfgaddr =3D aplic_m-&gt;mmsicfgaddr;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 msicfgaddrH =3D aplic_m-&gt;mmsicfgaddrH;<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 msicfgaddr =3D aplic_m-&gt;smsicfgaddr;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 msicfgaddrH =3D aplic_m-&gt;smsicfgaddrH;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 lhxs =3D (msicfgaddrH &gt;&gt; APLIC_xMSICFGADDRH_LHXS_SHIFT=
) &amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 APLIC_xMSICFGADDRH_LHXS_MASK;<br=
>
+=C2=A0 =C2=A0 lhxw =3D (msicfgaddrH &gt;&gt; APLIC_xMSICFGADDRH_LHXW_SHIFT=
) &amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 APLIC_xMSICFGADDRH_LHXW_MASK;<br=
>
+=C2=A0 =C2=A0 hhxs =3D (msicfgaddrH &gt;&gt; APLIC_xMSICFGADDRH_HHXS_SHIFT=
) &amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 APLIC_xMSICFGADDRH_HHXS_MASK;<br=
>
+=C2=A0 =C2=A0 hhxw =3D (msicfgaddrH &gt;&gt; APLIC_xMSICFGADDRH_HHXW_SHIFT=
) &amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 APLIC_xMSICFGADDRH_HHXW_MASK;<br=
>
+<br>
+=C2=A0 =C2=A0 group_idx =3D hart_idx &gt;&gt; lhxw;<br>
+=C2=A0 =C2=A0 hart_idx &amp;=3D APLIC_xMSICFGADDR_PPN_LHX_MASK(lhxw);<br>
+<br>
+=C2=A0 =C2=A0 addr =3D msicfgaddr;<br>
+=C2=A0 =C2=A0 addr |=3D ((uint64_t)(msicfgaddrH &amp; APLIC_xMSICFGADDRH_B=
APPN_MASK)) &lt;&lt; 32;<br>
+=C2=A0 =C2=A0 addr |=3D ((uint64_t)(group_idx &amp; APLIC_xMSICFGADDR_PPN_=
HHX_MASK(hhxw))) &lt;&lt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0APLIC_xMSICFGADDR_PPN_HHX_=
SHIFT(hhxs);<br>
+=C2=A0 =C2=A0 addr |=3D ((uint64_t)(hart_idx &amp; APLIC_xMSICFGADDR_PPN_L=
HX_MASK(lhxw))) &lt;&lt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0APLIC_xMSICFGADDR_PPN_LHX_=
SHIFT(lhxs);<br>
+=C2=A0 =C2=A0 addr |=3D (uint64_t)(guest_idx &amp; APLIC_xMSICFGADDR_PPN_H=
ART(lhxs));<br>
+=C2=A0 =C2=A0 addr &lt;&lt;=3D APLIC_xMSICFGADDR_PPN_SHIFT;<br>
+<br>
+=C2=A0 =C2=A0 address_space_stl_le(&amp;address_space_memory, addr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0eiid, MEMTXATTRS_UNSPECIFIED, &amp;result);<br>
+=C2=A0 =C2=A0 if (result !=3D MEMTX_OK) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR, &quot;%s: MSI w=
rite failed for &quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;hart_index=3D%d guest_index=3D%d eiid=3D%d\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 __func__, hart_idx, guest_idx, eiid);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void riscv_aplic_msi_irq_update(RISCVAPLICState *aplic, uint32_t ir=
q)<br>
+{<br>
+=C2=A0 =C2=A0 uint32_t hart_idx, guest_idx, eiid;<br>
+<br>
+=C2=A0 =C2=A0 if (!aplic-&gt;msimode || (aplic-&gt;num_irqs &lt;=3D irq) |=
|<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 !(aplic-&gt;domaincfg &amp; APLIC_DOMAINCFG_IE=
)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if ((aplic-&gt;state[irq] &amp; APLIC_ISTATE_ENPEND) !=3D AP=
LIC_ISTATE_ENPEND) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 riscv_aplic_set_pending_raw(aplic, irq, false);<br>
+<br>
+=C2=A0 =C2=A0 hart_idx =3D aplic-&gt;target[irq] &gt;&gt; APLIC_TARGET_HAR=
T_IDX_SHIFT;<br>
+=C2=A0 =C2=A0 hart_idx &amp;=3D APLIC_TARGET_HART_IDX_MASK;<br>
+=C2=A0 =C2=A0 if (aplic-&gt;mmode) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* M-level APLIC ignores guest_index */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 guest_idx =3D 0;<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 guest_idx =3D aplic-&gt;target[irq] &gt;&gt; A=
PLIC_TARGET_GUEST_IDX_SHIFT;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 guest_idx &amp;=3D APLIC_TARGET_GUEST_IDX_MASK=
;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 eiid =3D aplic-&gt;target[irq] &amp; APLIC_TARGET_EIID_MASK;=
<br>
+=C2=A0 =C2=A0 riscv_aplic_msi_send(aplic, hart_idx, guest_idx, eiid);<br>
+}<br>
+<br>
+static uint32_t riscv_aplic_idc_topi(RISCVAPLICState *aplic, uint32_t idc)=
<br>
+{<br>
+=C2=A0 =C2=A0 uint32_t best_irq, best_iprio;<br>
+=C2=A0 =C2=A0 uint32_t irq, iprio, ihartidx, ithres;<br>
+<br>
+=C2=A0 =C2=A0 if (aplic-&gt;num_harts &lt;=3D idc) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 ithres =3D aplic-&gt;ithreshold[idc];<br>
+=C2=A0 =C2=A0 if (!ithres) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 best_irq =3D best_iprio =3D UINT32_MAX;<br>
+=C2=A0 =C2=A0 for (irq =3D 1; irq &lt; aplic-&gt;num_irqs; irq++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((aplic-&gt;state[irq] &amp; APLIC_ISTATE_E=
NPEND) !=3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 APLIC_ISTATE_ENPEND) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ihartidx =3D aplic-&gt;target[irq] &gt;&gt; AP=
LIC_TARGET_HART_IDX_SHIFT;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ihartidx &amp;=3D APLIC_TARGET_HART_IDX_MASK;<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ihartidx !=3D idc) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 iprio =3D aplic-&gt;target[irq] &amp; aplic-&g=
t;iprio_mask;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (iprio &gt;=3D ithres) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (iprio &lt; best_iprio) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 best_irq =3D irq;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 best_iprio =3D iprio;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (best_irq &lt; aplic-&gt;num_irqs &amp;&amp; best_iprio &=
lt;=3D aplic-&gt;iprio_mask) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return (best_irq &lt;&lt; APLIC_IDC_TOPI_ID_SH=
IFT) | best_iprio;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
+static void riscv_aplic_idc_update(RISCVAPLICState *aplic, uint32_t idc)<b=
r>
+{<br>
+=C2=A0 =C2=A0 uint32_t topi;<br>
+<br>
+=C2=A0 =C2=A0 if (aplic-&gt;msimode || aplic-&gt;num_harts &lt;=3D idc) {<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 topi =3D riscv_aplic_idc_topi(aplic, idc);<br>
+=C2=A0 =C2=A0 if ((aplic-&gt;domaincfg &amp; APLIC_DOMAINCFG_IE) &amp;&amp=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 aplic-&gt;idelivery[idc] &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (aplic-&gt;iforce[idc] || topi)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_irq_raise(aplic-&gt;external_irqs[idc]);<=
br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_irq_lower(aplic-&gt;external_irqs[idc]);<=
br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static uint32_t riscv_aplic_idc_claimi(RISCVAPLICState *aplic, uint32_t id=
c)<br>
+{<br>
+=C2=A0 =C2=A0 uint32_t irq, state, sm, topi =3D riscv_aplic_idc_topi(aplic=
, idc);<br>
+<br>
+=C2=A0 =C2=A0 if (!topi) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 aplic-&gt;iforce[idc] =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 irq =3D (topi &gt;&gt; APLIC_IDC_TOPI_ID_SHIFT) &amp; APLIC_=
IDC_TOPI_ID_MASK;<br>
+=C2=A0 =C2=A0 sm =3D aplic-&gt;sourcecfg[irq] &amp; APLIC_SOURCECFG_SM_MAS=
K;<br>
+=C2=A0 =C2=A0 state =3D aplic-&gt;state[irq];<br>
+=C2=A0 =C2=A0 riscv_aplic_set_pending_raw(aplic, irq, false);<br>
+=C2=A0 =C2=A0 if ((sm =3D=3D APLIC_SOURCECFG_SM_LEVEL_HIGH) &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (state &amp; APLIC_ISTATE_INPUT)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_aplic_set_pending_raw(aplic, irq, true);=
<br>
+=C2=A0 =C2=A0 } else if ((sm =3D=3D APLIC_SOURCECFG_SM_LEVEL_LOW) &amp;&am=
p;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!(state &amp; APLIC=
_ISTATE_INPUT)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_aplic_set_pending_raw(aplic, irq, true);=
<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 riscv_aplic_idc_update(aplic, idc);<br>
+<br>
+=C2=A0 =C2=A0 return topi;<br>
+}<br>
+<br>
+static void riscv_aplic_request(void *opaque, int irq, int level)<br>
+{<br>
+=C2=A0 =C2=A0 bool update =3D false;<br>
+=C2=A0 =C2=A0 RISCVAPLICState *aplic =3D opaque;<br>
+=C2=A0 =C2=A0 uint32_t sourcecfg, childidx, state, idc;<br>
+<br>
+=C2=A0 =C2=A0 assert((0 &lt; irq) &amp;&amp; (irq &lt; aplic-&gt;num_irqs)=
);<br>
+<br>
+=C2=A0 =C2=A0 sourcecfg =3D aplic-&gt;sourcecfg[irq];<br>
+=C2=A0 =C2=A0 if (sourcecfg &amp; APLIC_SOURCECFG_D) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 childidx =3D sourcecfg &amp; APLIC_SOURCECFG_C=
HILDIDX_MASK;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (childidx &lt; aplic-&gt;num_children) {<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_aplic_request(aplic-&gt;ch=
ildren[childidx], irq, level);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 state =3D aplic-&gt;state[irq];<br>
+=C2=A0 =C2=A0 switch (sourcecfg &amp; APLIC_SOURCECFG_SM_MASK) {<br>
+=C2=A0 =C2=A0 case APLIC_SOURCECFG_SM_EDGE_RISE:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((level &gt; 0) &amp;&amp; !(state &amp; AP=
LIC_ISTATE_INPUT) &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !(state &amp; APLIC_ISTATE_PENDI=
NG)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_aplic_set_pending_raw(apli=
c, irq, true);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 update =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case APLIC_SOURCECFG_SM_EDGE_FALL:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((level &lt;=3D 0) &amp;&amp; (state &amp; =
APLIC_ISTATE_INPUT) &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !(state &amp; APLIC_ISTATE_PENDI=
NG)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_aplic_set_pending_raw(apli=
c, irq, true);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 update =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case APLIC_SOURCECFG_SM_LEVEL_HIGH:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((level &gt; 0) &amp;&amp; !(state &amp; AP=
LIC_ISTATE_PENDING)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_aplic_set_pending_raw(apli=
c, irq, true);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 update =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case APLIC_SOURCECFG_SM_LEVEL_LOW:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((level &lt;=3D 0) &amp;&amp; !(state &amp;=
 APLIC_ISTATE_PENDING)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_aplic_set_pending_raw(apli=
c, irq, true);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 update =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (level &lt;=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 aplic-&gt;state[irq] &amp;=3D ~APLIC_ISTATE_IN=
PUT;<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 aplic-&gt;state[irq] |=3D APLIC_ISTATE_INPUT;<=
br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (update) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (aplic-&gt;msimode) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_aplic_msi_irq_update(aplic=
, irq);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 idc =3D aplic-&gt;target[irq] &g=
t;&gt; APLIC_TARGET_HART_IDX_SHIFT;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 idc &amp;=3D APLIC_TARGET_HART_I=
DX_MASK;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_aplic_idc_update(aplic, id=
c);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static uint64_t riscv_aplic_read(void *opaque, hwaddr addr, unsigned size)=
<br>
+{<br>
+=C2=A0 =C2=A0 uint32_t irq, word, idc;<br>
+=C2=A0 =C2=A0 RISCVAPLICState *aplic =3D opaque;<br>
+<br>
+=C2=A0 =C2=A0 /* Reads must be 4 byte words */<br>
+=C2=A0 =C2=A0 if ((addr &amp; 0x3) !=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (addr =3D=3D APLIC_DOMAINCFG) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return aplic-&gt;domaincfg | (aplic-&gt;msimod=
e ? APLIC_DOMAINCFG_DM : 0);<br></blockquote><div><br></div><div>Hi Anup,</=
div><div><br></div><div>Should bits[31:24] of=C2=A0domaincfg be 0x80?</div>=
<div><br></div><div>The domaincfg register has the format:<br>=C2=A0 =C2=A0=
 bits 31:24 read-only 0x80<br>=C2=A0 =C2=A0 bit 8 IE<br>=C2=A0 =C2=A0 bit 7=
 read-only 0<br>=C2=A0 =C2=A0 bit 2 DM (WARL)<br>=C2=A0 =C2=A0 bit 0 BE (WA=
RL)<br></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
+=C2=A0 =C2=A0 } else if ((APLIC_SOURCECFG_BASE &lt;=3D addr) &amp;&amp;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (addr &lt; (APLIC_SOURCECFG_BASE=
 + (aplic-&gt;num_irqs - 1) * 4))) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 irq=C2=A0 =3D ((addr - APLIC_SOURCECFG_BASE) &=
gt;&gt; 2) + 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return aplic-&gt;sourcecfg[irq];<br>
+=C2=A0 =C2=A0 } else if (aplic-&gt;mmode &amp;&amp; aplic-&gt;msimode &amp=
;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(addr =3D=3D APLIC_=
MMSICFGADDR)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return aplic-&gt;mmsicfgaddr;<br>
+=C2=A0 =C2=A0 } else if (aplic-&gt;mmode &amp;&amp; aplic-&gt;msimode &amp=
;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(addr =3D=3D APLIC_=
MMSICFGADDRH)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return aplic-&gt;mmsicfgaddrH;<br>
+=C2=A0 =C2=A0 } else if (aplic-&gt;mmode &amp;&amp; aplic-&gt;msimode &amp=
;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(addr =3D=3D APLIC_=
SMSICFGADDR)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Registers SMSICFGADDR and SMSICFGADDRH are =
implemented only if:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* (a) the interrupt domain is at machine=
 level<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* (b) the domain=E2=80=99s harts impleme=
nt supervisor mode<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* (c) the domain has one or more child s=
upervisor-level domains<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0that support MSI de=
livery mode (domaincfg.DM is not read-<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0only zero in at lea=
st one of the supervisor-level child<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* domains).<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return (aplic-&gt;num_children) ? aplic-&gt;sm=
sicfgaddr : 0;<br>
+=C2=A0 =C2=A0 } else if (aplic-&gt;mmode &amp;&amp; aplic-&gt;msimode &amp=
;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(addr =3D=3D APLIC_=
SMSICFGADDRH)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return (aplic-&gt;num_children) ? aplic-&gt;sm=
sicfgaddrH : 0;<br>
+=C2=A0 =C2=A0 } else if ((APLIC_SETIP_BASE &lt;=3D addr) &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (addr &lt; (APLIC_SETIP_BASE + a=
plic-&gt;bitfield_words * 4))) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 word =3D (addr - APLIC_SETIP_BASE) &gt;&gt; 2;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return riscv_aplic_read_pending_word(aplic, wo=
rd);<br>
+=C2=A0 =C2=A0 } else if (addr =3D=3D APLIC_SETIPNUM) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 } else if ((APLIC_CLRIP_BASE &lt;=3D addr) &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (addr &lt; (APLIC_CLRIP_BASE + a=
plic-&gt;bitfield_words * 4))) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 word =3D (addr - APLIC_CLRIP_BASE) &gt;&gt; 2;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return riscv_aplic_read_input_word(aplic, word=
);<br>
+=C2=A0 =C2=A0 } else if (addr =3D=3D APLIC_CLRIPNUM) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 } else if ((APLIC_SETIE_BASE &lt;=3D addr) &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (addr &lt; (APLIC_SETIE_BASE + a=
plic-&gt;bitfield_words * 4))) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 word =3D (addr - APLIC_SETIE_BASE) &gt;&gt; 2;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return riscv_aplic_read_enabled_word(aplic, wo=
rd);<br>
+=C2=A0 =C2=A0 } else if (addr =3D=3D APLIC_SETIENUM) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 } else if ((APLIC_CLRIE_BASE &lt;=3D addr) &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (addr &lt; (APLIC_CLRIE_BASE + a=
plic-&gt;bitfield_words * 4))) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 } else if (addr =3D=3D APLIC_CLRIENUM) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 } else if (addr =3D=3D APLIC_SETIPNUM_LE) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 } else if (addr =3D=3D APLIC_SETIPNUM_BE) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 } else if (addr =3D=3D APLIC_GENMSI) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return (aplic-&gt;msimode) ? aplic-&gt;genmsi =
: 0;<br>
+=C2=A0 =C2=A0 } else if ((APLIC_TARGET_BASE &lt;=3D addr) &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (addr &lt; (APLIC_TARGET_BASE + =
(aplic-&gt;num_irqs - 1) * 4))) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 irq =3D ((addr - APLIC_TARGET_BASE) &gt;&gt; 2=
) + 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return aplic-&gt;target[irq];<br>
+=C2=A0 =C2=A0 } else if (!aplic-&gt;msimode &amp;&amp; (APLIC_IDC_BASE &lt=
;=3D addr) &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (addr &lt; (APLIC_IDC_BASE + apl=
ic-&gt;num_harts * APLIC_IDC_SIZE))) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 idc =3D (addr - APLIC_IDC_BASE) / APLIC_IDC_SI=
ZE;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (addr - (APLIC_IDC_BASE + idc * APLIC_I=
DC_SIZE)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case APLIC_IDC_IDELIVERY:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return aplic-&gt;idelivery[idc];=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case APLIC_IDC_IFORCE:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return aplic-&gt;iforce[idc];<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case APLIC_IDC_ITHRESHOLD:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return aplic-&gt;ithreshold[idc]=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case APLIC_IDC_TOPI:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return riscv_aplic_idc_topi(apli=
c, idc);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case APLIC_IDC_CLAIMI:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return riscv_aplic_idc_claimi(ap=
lic, idc);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
+=C2=A0 =C2=A0 }<br>
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
+static void riscv_aplic_write(void *opaque, hwaddr addr, uint64_t value,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned size)<br>
+{<br>
+=C2=A0 =C2=A0 RISCVAPLICState *aplic =3D opaque;<br>
+=C2=A0 =C2=A0 uint32_t irq, word, idc =3D UINT32_MAX;<br>
+<br>
+=C2=A0 =C2=A0 /* Writes must be 4 byte words */<br>
+=C2=A0 =C2=A0 if ((addr &amp; 0x3) !=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (addr =3D=3D APLIC_DOMAINCFG) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Only IE bit writeable at the moment */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 value &amp;=3D APLIC_DOMAINCFG_IE;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 aplic-&gt;domaincfg =3D value;<br>
+=C2=A0 =C2=A0 } else if ((APLIC_SOURCECFG_BASE &lt;=3D addr) &amp;&amp;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (addr &lt; (APLIC_SOURCECFG_BASE=
 + (aplic-&gt;num_irqs - 1) * 4))) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 irq=C2=A0 =3D ((addr - APLIC_SOURCECFG_BASE) &=
gt;&gt; 2) + 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!aplic-&gt;num_children &amp;&amp; (value =
&amp; APLIC_SOURCECFG_D)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (value &amp; APLIC_SOURCECFG_D) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value &amp;=3D (APLIC_SOURCECFG_=
D | APLIC_SOURCECFG_CHILDIDX_MASK);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value &amp;=3D (APLIC_SOURCECFG_=
D | APLIC_SOURCECFG_SM_MASK);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 aplic-&gt;sourcecfg[irq] =3D value;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((aplic-&gt;sourcecfg[irq] &amp; APLIC_SOUR=
CECFG_D) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (aplic-&gt;sourcecfg[irq] =3D=3D=
 0)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_aplic_set_pending_raw(apli=
c, irq, false);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_aplic_set_enabled_raw(apli=
c, irq, false);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 } else if (aplic-&gt;mmode &amp;&amp; aplic-&gt;msimode &amp=
;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(addr =3D=3D APLIC_=
MMSICFGADDR)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(aplic-&gt;mmsicfgaddrH &amp; APLIC_xMSIC=
FGADDRH_L)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 aplic-&gt;mmsicfgaddr =3D value;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 } else if (aplic-&gt;mmode &amp;&amp; aplic-&gt;msimode &amp=
;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(addr =3D=3D APLIC_=
MMSICFGADDRH)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(aplic-&gt;mmsicfgaddrH &amp; APLIC_xMSIC=
FGADDRH_L)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 aplic-&gt;mmsicfgaddrH =3D value=
 &amp; APLIC_xMSICFGADDRH_VALID_MASK;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 } else if (aplic-&gt;mmode &amp;&amp; aplic-&gt;msimode &amp=
;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(addr =3D=3D APLIC_=
SMSICFGADDR)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Registers SMSICFGADDR and SMSICFGADDRH are =
implemented only if:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* (a) the interrupt domain is at machine=
 level<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* (b) the domain=E2=80=99s harts impleme=
nt supervisor mode<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* (c) the domain has one or more child s=
upervisor-level domains<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0that support MSI de=
livery mode (domaincfg.DM is not read-<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0only zero in at lea=
st one of the supervisor-level child<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* domains).<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (aplic-&gt;num_children &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !(aplic-&gt;smsicfgaddrH &amp; A=
PLIC_xMSICFGADDRH_L)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 aplic-&gt;smsicfgaddr =3D value;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 } else if (aplic-&gt;mmode &amp;&amp; aplic-&gt;msimode &amp=
;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(addr =3D=3D APLIC_=
SMSICFGADDRH)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (aplic-&gt;num_children &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !(aplic-&gt;smsicfgaddrH &amp; A=
PLIC_xMSICFGADDRH_L)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 aplic-&gt;smsicfgaddrH =3D value=
 &amp; APLIC_xMSICFGADDRH_VALID_MASK;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 } else if ((APLIC_SETIP_BASE &lt;=3D addr) &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (addr &lt; (APLIC_SETIP_BASE + a=
plic-&gt;bitfield_words * 4))) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 word =3D (addr - APLIC_SETIP_BASE) &gt;&gt; 2;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_aplic_set_pending_word(aplic, word, valu=
e, true);<br>
+=C2=A0 =C2=A0 } else if (addr =3D=3D APLIC_SETIPNUM) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_aplic_set_pending(aplic, value, true);<b=
r>
+=C2=A0 =C2=A0 } else if ((APLIC_CLRIP_BASE &lt;=3D addr) &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (addr &lt; (APLIC_CLRIP_BASE + a=
plic-&gt;bitfield_words * 4))) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 word =3D (addr - APLIC_CLRIP_BASE) &gt;&gt; 2;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_aplic_set_pending_word(aplic, word, valu=
e, false);<br>
+=C2=A0 =C2=A0 } else if (addr =3D=3D APLIC_CLRIPNUM) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_aplic_set_pending(aplic, value, false);<=
br>
+=C2=A0 =C2=A0 } else if ((APLIC_SETIE_BASE &lt;=3D addr) &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (addr &lt; (APLIC_SETIE_BASE + a=
plic-&gt;bitfield_words * 4))) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 word =3D (addr - APLIC_SETIE_BASE) &gt;&gt; 2;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_aplic_set_enabled_word(aplic, word, valu=
e, true);<br>
+=C2=A0 =C2=A0 } else if (addr =3D=3D APLIC_SETIENUM) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_aplic_set_enabled(aplic, value, true);<b=
r>
+=C2=A0 =C2=A0 } else if ((APLIC_CLRIE_BASE &lt;=3D addr) &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (addr &lt; (APLIC_CLRIE_BASE + a=
plic-&gt;bitfield_words * 4))) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 word =3D (addr - APLIC_CLRIE_BASE) &gt;&gt; 2;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_aplic_set_enabled_word(aplic, word, valu=
e, false);<br>
+=C2=A0 =C2=A0 } else if (addr =3D=3D APLIC_CLRIENUM) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_aplic_set_enabled(aplic, value, false);<=
br>
+=C2=A0 =C2=A0 } else if (addr =3D=3D APLIC_SETIPNUM_LE) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_aplic_set_pending(aplic, value, true);<b=
r>
+=C2=A0 =C2=A0 } else if (addr =3D=3D APLIC_SETIPNUM_BE) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_aplic_set_pending(aplic, bswap32(value),=
 true);<br>
+=C2=A0 =C2=A0 } else if (addr =3D=3D APLIC_GENMSI) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (aplic-&gt;msimode) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 aplic-&gt;genmsi =3D value &amp;=
 ~(APLIC_TARGET_GUEST_IDX_MASK &lt;&lt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 APLIC_TARGET_GU=
EST_IDX_SHIFT);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_aplic_msi_send(aplic,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0value &gt;&gt; APLIC_TARGET_HA=
RT_IDX_SHIFT,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0value &amp; APLIC_TARGET_EIID_=
MASK);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 } else if ((APLIC_TARGET_BASE &lt;=3D addr) &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (addr &lt; (APLIC_TARGET_BASE + =
(aplic-&gt;num_irqs - 1) * 4))) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 irq =3D ((addr - APLIC_TARGET_BASE) &gt;&gt; 2=
) + 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (aplic-&gt;msimode) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 aplic-&gt;target[irq] =3D value;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 aplic-&gt;target[irq] =3D (value=
 &amp; ~APLIC_TARGET_IPRIO_MASK) |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(value &amp; aplic-&gt;iprio_m=
ask);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 } else if (!aplic-&gt;msimode &amp;&amp; (APLIC_IDC_BASE &lt=
;=3D addr) &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (addr &lt; (APLIC_IDC_BASE + apl=
ic-&gt;num_harts * APLIC_IDC_SIZE))) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 idc =3D (addr - APLIC_IDC_BASE) / APLIC_IDC_SI=
ZE;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (addr - (APLIC_IDC_BASE + idc * APLIC_I=
DC_SIZE)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case APLIC_IDC_IDELIVERY:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 aplic-&gt;idelivery[idc] =3D val=
ue &amp; 0x1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case APLIC_IDC_IFORCE:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 aplic-&gt;iforce[idc] =3D value =
&amp; 0x1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case APLIC_IDC_ITHRESHOLD:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 aplic-&gt;ithreshold[idc] =3D va=
lue &amp; aplic-&gt;iprio_mask;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (aplic-&gt;msimode) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (irq =3D 1; irq &lt; aplic-&gt;num_irqs; i=
rq++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_aplic_msi_irq_update(aplic=
, irq);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (idc =3D=3D UINT32_MAX) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (idc =3D 0; idc &lt; aplic-&=
gt;num_harts; idc++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_aplic_idc_up=
date(aplic, idc);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_aplic_idc_update(aplic, id=
c);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
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
+static const MemoryRegionOps riscv_aplic_ops =3D {<br>
+=C2=A0 =C2=A0 .read =3D riscv_aplic_read,<br>
+=C2=A0 =C2=A0 .write =3D riscv_aplic_write,<br>
+=C2=A0 =C2=A0 .endianness =3D DEVICE_LITTLE_ENDIAN,<br>
+=C2=A0 =C2=A0 .valid =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .min_access_size =3D 4,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .max_access_size =3D 4<br>
+=C2=A0 =C2=A0 }<br>
+};<br>
+<br>
+static void riscv_aplic_realize(DeviceState *dev, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 uint32_t i;<br>
+=C2=A0 =C2=A0 RISCVAPLICState *aplic =3D RISCV_APLIC(dev);<br>
+<br>
+=C2=A0 =C2=A0 aplic-&gt;bitfield_words =3D (aplic-&gt;num_irqs + 31) &gt;&=
gt; 5;<br>
+=C2=A0 =C2=A0 aplic-&gt;sourcecfg =3D g_new0(uint32_t, aplic-&gt;num_irqs)=
;<br>
+=C2=A0 =C2=A0 aplic-&gt;state =3D g_new(uint32_t, aplic-&gt;num_irqs);<br>
+=C2=A0 =C2=A0 aplic-&gt;target =3D g_new0(uint32_t, aplic-&gt;num_irqs);<b=
r>
+=C2=A0 =C2=A0 aplic-&gt;idelivery =3D g_new0(uint32_t, aplic-&gt;num_harts=
);<br>
+=C2=A0 =C2=A0 aplic-&gt;iforce =3D g_new0(uint32_t, aplic-&gt;num_harts);<=
br>
+=C2=A0 =C2=A0 aplic-&gt;ithreshold =3D g_new0(uint32_t, aplic-&gt;num_hart=
s);<br>
+<br>
+=C2=A0 =C2=A0 memory_region_init_io(&amp;aplic-&gt;mmio, OBJECT(dev), &amp=
;riscv_aplic_ops, aplic,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 TYPE_RISCV_APLIC, aplic-&gt;aperture_size);<br>
+=C2=A0 =C2=A0 sysbus_init_mmio(SYS_BUS_DEVICE(dev), &amp;aplic-&gt;mmio);<=
br>
+<br>
+=C2=A0 =C2=A0 /* Only root APLICs have hardware IRQ lines. All non-root AP=
LICs<br>
+=C2=A0 =C2=A0 =C2=A0* have IRQ lines delegated by their parent APLIC.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 if (!aplic-&gt;parent) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_init_gpio_in(dev, riscv_aplic_request, ap=
lic-&gt;num_irqs);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* Create output IRQ lines for non-MSI mode */<br>
+=C2=A0 =C2=A0 if (!aplic-&gt;msimode) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 aplic-&gt;external_irqs =3D g_malloc(sizeof(qe=
mu_irq) * aplic-&gt;num_harts);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_init_gpio_out(dev, aplic-&gt;external_irq=
s, aplic-&gt;num_harts);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Claim the CPU interrupt to be triggered by =
this APLIC */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; aplic-&gt;num_harts; i++)=
 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RISCVCPU *cpu =3D RISCV_CPU(qemu=
_get_cpu(aplic-&gt;hartid_base + i));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (riscv_cpu_claim_interrupts(c=
pu,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (aplic-&gt;mmode) =
? MIP_MEIP : MIP_SEIP) &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot=
;%s already claimed&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(aplic-&gt;mmode) ? &quot;MEIP&quot; : &quot=
;SEIP&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 msi_nonbroken =3D true;<br>
+}<br>
+<br>
+static Property riscv_aplic_properties[] =3D {<br>
+=C2=A0 =C2=A0 DEFINE_PROP_UINT32(&quot;aperture-size&quot;, RISCVAPLICStat=
e, aperture_size, 0),<br>
+=C2=A0 =C2=A0 DEFINE_PROP_UINT32(&quot;hartid-base&quot;, RISCVAPLICState,=
 hartid_base, 0),<br>
+=C2=A0 =C2=A0 DEFINE_PROP_UINT32(&quot;num-harts&quot;, RISCVAPLICState, n=
um_harts, 0),<br>
+=C2=A0 =C2=A0 DEFINE_PROP_UINT32(&quot;iprio-mask&quot;, RISCVAPLICState, =
iprio_mask, 0),<br>
+=C2=A0 =C2=A0 DEFINE_PROP_UINT32(&quot;num-irqs&quot;, RISCVAPLICState, nu=
m_irqs, 0),<br>
+=C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;msimode&quot;, RISCVAPLICState, msimo=
de, 0),<br>
+=C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;mmode&quot;, RISCVAPLICState, mmode, =
0),<br>
+=C2=A0 =C2=A0 DEFINE_PROP_END_OF_LIST(),<br>
+};<br>
+<br>
+static const VMStateDescription vmstate_riscv_aplic =3D {<br>
+=C2=A0 =C2=A0 .name =3D &quot;riscv_aplic&quot;,<br>
+=C2=A0 =C2=A0 .version_id =3D 1,<br>
+=C2=A0 =C2=A0 .minimum_version_id =3D 1,<br>
+=C2=A0 =C2=A0 .fields =3D (VMStateField[]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32(domaincfg, RISCVA=
PLICState),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32(mmsicfgaddr, RISC=
VAPLICState),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32(mmsicfgaddrH, RIS=
CVAPLICState),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32(smsicfgaddr, RISC=
VAPLICState),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32(smsicfgaddrH, RIS=
CVAPLICState),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32(genmsi, RISCVAPLI=
CState),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_VARRAY_UINT32(sourcecfg,=
 RISCVAPLICState,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 num_irqs, 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmstate_info_uint32, uint32_t=
),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_VARRAY_UINT32(state, RIS=
CVAPLICState,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 num_irqs, 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmstate_info_uint32, uint32_t=
),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_VARRAY_UINT32(target, RI=
SCVAPLICState,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 num_irqs, 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmstate_info_uint32, uint32_t=
),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_VARRAY_UINT32(idelivery,=
 RISCVAPLICState,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 num_harts, 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmstate_info_uint32, uint32_t=
),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_VARRAY_UINT32(iforce, RI=
SCVAPLICState,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 num_harts, 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmstate_info_uint32, uint32_t=
),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_VARRAY_UINT32(ithreshold=
, RISCVAPLICState,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 num_harts, 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmstate_info_uint32, uint32_t=
),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_END_OF_LIST()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+};<br>
+<br>
+static void riscv_aplic_class_init(ObjectClass *klass, void *data)<br>
+{<br>
+=C2=A0 =C2=A0 DeviceClass *dc =3D DEVICE_CLASS(klass);<br>
+<br>
+=C2=A0 =C2=A0 device_class_set_props(dc, riscv_aplic_properties);<br>
+=C2=A0 =C2=A0 dc-&gt;realize =3D riscv_aplic_realize;<br>
+=C2=A0 =C2=A0 dc-&gt;vmsd =3D &amp;vmstate_riscv_aplic;<br>
+}<br>
+<br>
+static const TypeInfo riscv_aplic_info =3D {<br>
+=C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_RISCV_APLIC=
,<br>
+=C2=A0 =C2=A0 .parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_SYS_BUS_DEVICE,<=
br>
+=C2=A0 =C2=A0 .instance_size =3D sizeof(RISCVAPLICState),<br>
+=C2=A0 =C2=A0 .class_init=C2=A0 =C2=A0 =3D riscv_aplic_class_init,<br>
+};<br>
+<br>
+static void riscv_aplic_register_types(void)<br>
+{<br>
+=C2=A0 =C2=A0 type_register_static(&amp;riscv_aplic_info);<br>
+}<br>
+<br>
+type_init(riscv_aplic_register_types)<br>
+<br>
+/*<br>
+ * Add a APLIC device to another APLIC device as child for<br>
+ * interrupt delegation.<br>
+ */<br>
+void riscv_aplic_add_child(DeviceState *parent, DeviceState *child)<br>
+{<br>
+=C2=A0 =C2=A0 RISCVAPLICState *caplic, *paplic;<br>
+<br>
+=C2=A0 =C2=A0 assert(parent &amp;&amp; child);<br>
+=C2=A0 =C2=A0 caplic =3D RISCV_APLIC(child);<br>
+=C2=A0 =C2=A0 paplic =3D RISCV_APLIC(parent);<br>
+<br>
+=C2=A0 =C2=A0 assert(paplic-&gt;num_irqs =3D=3D caplic-&gt;num_irqs);<br>
+=C2=A0 =C2=A0 assert(paplic-&gt;num_children &lt;=3D QEMU_APLIC_MAX_CHILDR=
EN);<br>
+<br>
+=C2=A0 =C2=A0 caplic-&gt;parent =3D paplic;<br>
+=C2=A0 =C2=A0 paplic-&gt;children[paplic-&gt;num_children] =3D caplic;<br>
+=C2=A0 =C2=A0 paplic-&gt;num_children++;<br>
+}<br>
+<br>
+/*<br>
+ * Create APLIC device.<br>
+ */<br>
+DeviceState *riscv_aplic_create(hwaddr addr, hwaddr size,<br>
+=C2=A0 =C2=A0 uint32_t hartid_base, uint32_t num_harts, uint32_t num_sourc=
es,<br>
+=C2=A0 =C2=A0 uint32_t iprio_bits, bool msimode, bool mmode, DeviceState *=
parent)<br>
+{<br>
+=C2=A0 =C2=A0 DeviceState *dev =3D qdev_new(TYPE_RISCV_APLIC);<br>
+=C2=A0 =C2=A0 uint32_t i;<br>
+<br>
+=C2=A0 =C2=A0 assert(num_harts &lt; APLIC_MAX_IDC);<br>
+=C2=A0 =C2=A0 assert((APLIC_IDC_BASE + (num_harts * APLIC_IDC_SIZE)) &lt;=
=3D size);<br>
+=C2=A0 =C2=A0 assert(num_sources &lt; APLIC_MAX_SOURCE);<br>
+=C2=A0 =C2=A0 assert(APLIC_MIN_IPRIO_BITS &lt;=3D iprio_bits);<br>
+=C2=A0 =C2=A0 assert(iprio_bits &lt;=3D APLIC_MAX_IPRIO_BITS);<br>
+<br>
+=C2=A0 =C2=A0 qdev_prop_set_uint32(dev, &quot;aperture-size&quot;, size);<=
br>
+=C2=A0 =C2=A0 qdev_prop_set_uint32(dev, &quot;hartid-base&quot;, hartid_ba=
se);<br>
+=C2=A0 =C2=A0 qdev_prop_set_uint32(dev, &quot;num-harts&quot;, num_harts);=
<br>
+=C2=A0 =C2=A0 qdev_prop_set_uint32(dev, &quot;iprio-mask&quot;, ((1U &lt;&=
lt; iprio_bits) - 1));<br>
+=C2=A0 =C2=A0 qdev_prop_set_uint32(dev, &quot;num-irqs&quot;, num_sources =
+ 1);<br>
+=C2=A0 =C2=A0 qdev_prop_set_bit(dev, &quot;msimode&quot;, msimode);<br>
+=C2=A0 =C2=A0 qdev_prop_set_bit(dev, &quot;mmode&quot;, mmode);<br>
+<br>
+=C2=A0 =C2=A0 sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &amp;error_fat=
al);<br>
+=C2=A0 =C2=A0 sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);<br>
+<br>
+=C2=A0 =C2=A0 if (parent) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_aplic_add_child(parent, dev);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (!msimode) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; num_harts; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CPUState *cpu =3D qemu_get_cpu(h=
artid_base + i);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_connect_gpio_out_named(dev,=
 NULL, i,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_get=
_gpio_in(DEVICE(cpu),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 (mmode) ? IRQ_M_EXT : IRQ_S_EXT));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return dev;<br>
+}<br>
diff --git a/include/hw/intc/riscv_aplic.h b/include/hw/intc/riscv_aplic.h<=
br>
new file mode 100644<br>
index 0000000000..de8532fbc3<br>
--- /dev/null<br>
+++ b/include/hw/intc/riscv_aplic.h<br>
@@ -0,0 +1,79 @@<br>
+/*<br>
+ * RISC-V APLIC (Advanced Platform Level Interrupt Controller) interface<b=
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
+#ifndef HW_RISCV_APLIC_H<br>
+#define HW_RISCV_APLIC_H<br>
+<br>
+#include &quot;hw/sysbus.h&quot;<br>
+#include &quot;qom/object.h&quot;<br>
+<br>
+#define TYPE_RISCV_APLIC &quot;riscv.aplic&quot;<br>
+<br>
+typedef struct RISCVAPLICState RISCVAPLICState;<br>
+DECLARE_INSTANCE_CHECKER(RISCVAPLICState, RISCV_APLIC, TYPE_RISCV_APLIC)<b=
r>
+<br>
+#define APLIC_MIN_SIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x4000<br>
+#define APLIC_SIZE_ALIGN(__x)=C2=A0 =C2=A0 =C2=A0(((__x) + (APLIC_MIN_SIZE=
 - 1)) &amp; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0~(APLIC_MIN_SIZE - 1))<=
br>
+#define APLIC_SIZE(__num_harts)=C2=A0 =C2=A0(APLIC_MIN_SIZE + \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0APLIC_SIZE_ALIGN(32 * (=
__num_harts)))<br>
+<br>
+struct RISCVAPLICState {<br>
+=C2=A0 =C2=A0 /*&lt; private &gt;*/<br>
+=C2=A0 =C2=A0 SysBusDevice parent_obj;<br>
+=C2=A0 =C2=A0 qemu_irq *external_irqs;<br>
+<br>
+=C2=A0 =C2=A0 /*&lt; public &gt;*/<br>
+=C2=A0 =C2=A0 MemoryRegion mmio;<br>
+=C2=A0 =C2=A0 uint32_t bitfield_words;<br>
+=C2=A0 =C2=A0 uint32_t domaincfg;<br>
+=C2=A0 =C2=A0 uint32_t mmsicfgaddr;<br>
+=C2=A0 =C2=A0 uint32_t mmsicfgaddrH;<br>
+=C2=A0 =C2=A0 uint32_t smsicfgaddr;<br>
+=C2=A0 =C2=A0 uint32_t smsicfgaddrH;<br>
+=C2=A0 =C2=A0 uint32_t genmsi;<br>
+=C2=A0 =C2=A0 uint32_t *sourcecfg;<br>
+=C2=A0 =C2=A0 uint32_t *state;<br>
+=C2=A0 =C2=A0 uint32_t *target;<br>
+=C2=A0 =C2=A0 uint32_t *idelivery;<br>
+=C2=A0 =C2=A0 uint32_t *iforce;<br>
+=C2=A0 =C2=A0 uint32_t *ithreshold;<br>
+<br>
+=C2=A0 =C2=A0 /* topology */<br>
+#define QEMU_APLIC_MAX_CHILDREN=C2=A0 =C2=A0 =C2=A0 =C2=A0 16<br>
+=C2=A0 =C2=A0 struct RISCVAPLICState *parent;<br>
+=C2=A0 =C2=A0 struct RISCVAPLICState *children[QEMU_APLIC_MAX_CHILDREN];<b=
r>
+=C2=A0 =C2=A0 uint16_t num_children;<br>
+<br>
+=C2=A0 =C2=A0 /* config */<br>
+=C2=A0 =C2=A0 uint32_t aperture_size;<br>
+=C2=A0 =C2=A0 uint32_t hartid_base;<br>
+=C2=A0 =C2=A0 uint32_t num_harts;<br>
+=C2=A0 =C2=A0 uint32_t iprio_mask;<br>
+=C2=A0 =C2=A0 uint32_t num_irqs;<br>
+=C2=A0 =C2=A0 bool msimode;<br>
+=C2=A0 =C2=A0 bool mmode;<br>
+};<br>
+<br>
+void riscv_aplic_add_child(DeviceState *parent, DeviceState *child);<br>
+<br>
+DeviceState *riscv_aplic_create(hwaddr addr, hwaddr size,<br>
+=C2=A0 =C2=A0 uint32_t hartid_base, uint32_t num_harts, uint32_t num_sourc=
es,<br>
+=C2=A0 =C2=A0 uint32_t iprio_bits, bool msimode, bool mmode, DeviceState *=
parent);<br>
+<br>
+#endif<br>
-- <br>
2.25.1<br>
<br>
<br>
</blockquote></div></div>

--0000000000000c1b9105d589966f--

