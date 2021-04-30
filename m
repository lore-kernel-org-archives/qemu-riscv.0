Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lcLA8-0006jB-Q9
	for mharc-qemu-riscv@gnu.org; Fri, 30 Apr 2021 00:54:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1lcLA7-0006in-7d
 for qemu-riscv@nongnu.org; Fri, 30 Apr 2021 00:53:59 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:36771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1lcLA3-0005UP-VJ
 for qemu-riscv@nongnu.org; Fri, 30 Apr 2021 00:53:59 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 f15-20020a05600c4e8fb029013f5599b8a9so975094wmq.1
 for <qemu-riscv@nongnu.org>; Thu, 29 Apr 2021 21:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UGRVbFEa+O4nql4wL8JLwDHK88SuI1CttvKEIpPLdho=;
 b=tAZOlBWC/dpe7X4h3LVF4JPHUHPKhmGC5Jgq5flDvzlS3SEXGQc+S+M+lae8i5pcJC
 6NAUgtRCZwc3HQzDsVVo0m/tz+J3cZIZvocq8XlIVFfQt7aiiRAbNdWH3Ae6FpqwCtJu
 ILuQFcAgM/H2XmlV+JYAKfSMQtdgfdg62aDqg5pgLb8PcLaNUa6rmbG0wmUH3Re22mtf
 ywos2ak6Rr+c39ESQDCiWiffWvFwMVReNNkvrqMWszfAHiLk/YHsBuIEdiLC5Q/D2MCK
 PFcaX04lZdC+ZfZUmxdj5jGWROUUyT/cEtvmtnG1DGJ//x2Ja31TqsJVBM/7bGrG7v2e
 JZKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UGRVbFEa+O4nql4wL8JLwDHK88SuI1CttvKEIpPLdho=;
 b=D3MaO9kH7ZhhRpZI0zopWnWXufUFvxyBqXvxJzVDZphBsBw2408IKYly+ufQzNge+7
 gnTFAMIFTie9GyoYic0Mg13FFujsMt2cxbVaRwXM1asmGFfyf/gFXRtzGdt8FFLd7rlZ
 Rwa3oQdrRgzxkWZD66tpydUK2xb/AACgec9dUScOjZOGdEYb7E873zuxEiBrdph9k0Z/
 L1B23Z8SahXlePwswZHJ5fuCYgl/TZidkeNmefRHjEBZd2iZ6YsDWsbTo88+QUNajMu8
 64Uqd9IJ6bCBelupfVjpytaczTvr6hziVZLpM6ZUQbaYCo1zWv2FFnYjCFba8AzQNF/o
 zxdA==
X-Gm-Message-State: AOAM530rgzaynqUYSJYeA6QOKs6hbS5cmr3YbFUbqyrWR6KRy8RgxkS8
 AoUwOeajJSkvGHKXPmb7fE+Svu2MU2nP2KVzwBAnHw==
X-Google-Smtp-Source: ABdhPJz6ciYc399ey9eit4UZvScEpLv5uRf/WYCuteudvmF//NfaJHTVN7DyPq6zhLx3l7ORcT1VPGnVqp22VhrZSEo=
X-Received: by 2002:a7b:c348:: with SMTP id l8mr14781328wmj.152.1619758433260; 
 Thu, 29 Apr 2021 21:53:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210412065246.1853-1-jiangyifei@huawei.com>
 <20210412065246.1853-8-jiangyifei@huawei.com>
In-Reply-To: <20210412065246.1853-8-jiangyifei@huawei.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 30 Apr 2021 10:23:41 +0530
Message-ID: <CAAhSdy34aVwGEW-_Z=FkOkrAGrTsaS-11Ck6gJg77wwUSXe=zw@mail.gmail.com>
Subject: Re: [PATCH RFC v5 07/12] hw/riscv: PLIC update external interrupt by
 KVM when kvm enabled
To: Yifei Jiang <jiangyifei@huawei.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 kvm-riscv@lists.infradead.org, KVM General <kvm@vger.kernel.org>,
 libvir-list@redhat.com, 
 Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Bin Meng <bin.meng@windriver.com>, 
 fanliang@huawei.com, "Wubin (H)" <wu.wubin@huawei.com>, 
 Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 yinyipeng <yinyipeng1@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::32d;
 envelope-from=anup@brainfault.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Apr 2021 04:53:59 -0000

On Mon, Apr 12, 2021 at 12:24 PM Yifei Jiang <jiangyifei@huawei.com> wrote:
>
> Only support supervisor external interrupt currently.
>
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Yipeng Yin <yinyipeng1@huawei.com>
> ---
>  hw/intc/sifive_plic.c    | 29 ++++++++++++++++++++---------
>  target/riscv/kvm-stub.c  |  5 +++++
>  target/riscv/kvm.c       | 20 ++++++++++++++++++++
>  target/riscv/kvm_riscv.h |  1 +
>  4 files changed, 46 insertions(+), 9 deletions(-)
>
> diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
> index 97a1a27a9a..2746eb7a05 100644
> --- a/hw/intc/sifive_plic.c
> +++ b/hw/intc/sifive_plic.c
> @@ -31,6 +31,8 @@
>  #include "target/riscv/cpu.h"
>  #include "sysemu/sysemu.h"
>  #include "migration/vmstate.h"
> +#include "sysemu/kvm.h"
> +#include "kvm_riscv.h"
>
>  #define RISCV_DEBUG_PLIC 0
>
> @@ -147,15 +149,24 @@ static void sifive_plic_update(SiFivePLICState *plic)
>              continue;
>          }
>          int level = sifive_plic_irqs_pending(plic, addrid);
> -        switch (mode) {
> -        case PLICMode_M:
> -            riscv_cpu_update_mip(RISCV_CPU(cpu), MIP_MEIP, BOOL_TO_MASK(level));
> -            break;
> -        case PLICMode_S:
> -            riscv_cpu_update_mip(RISCV_CPU(cpu), MIP_SEIP, BOOL_TO_MASK(level));
> -            break;
> -        default:
> -            break;
> +        if (kvm_enabled()) {
> +            if (mode == PLICMode_M) {
> +                continue;
> +            }
> +            kvm_riscv_set_irq(RISCV_CPU(cpu), IRQ_S_EXT, level);
> +        } else {
> +            switch (mode) {
> +            case PLICMode_M:
> +                riscv_cpu_update_mip(RISCV_CPU(cpu),
> +                                     MIP_MEIP, BOOL_TO_MASK(level));
> +                break;
> +            case PLICMode_S:
> +                riscv_cpu_update_mip(RISCV_CPU(cpu),
> +                                     MIP_SEIP, BOOL_TO_MASK(level));
> +                break;
> +            default:
> +                break;
> +            }

I am not comfortable with this patch.

This way we will endup calling kvm_riscv_set_irq() from various
places in hw/intc and hw/riscv.

I suggest to extend riscv_cpu_update_mip() such that when kvm is
enabled riscv_cpu_update_mip() will:
1) Consider only MIP_SEIP bit in "mask" parameter and all other
    bits in "mask" parameter will be ignored probably with warning
2) When the MIP_SEIP bit is set in "mask" call kvm_riscv_set_irq()
to change the IRQ state in the KVM module.

Regards,
Anup

>          }
>      }
>
> diff --git a/target/riscv/kvm-stub.c b/target/riscv/kvm-stub.c
> index 39b96fe3f4..4e8fc31a21 100644
> --- a/target/riscv/kvm-stub.c
> +++ b/target/riscv/kvm-stub.c
> @@ -23,3 +23,8 @@ void kvm_riscv_reset_vcpu(RISCVCPU *cpu)
>  {
>      abort();
>  }
> +
> +void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level)
> +{
> +    abort();
> +}
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index 79c931acb4..da63535812 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -453,6 +453,26 @@ void kvm_riscv_reset_vcpu(RISCVCPU *cpu)
>      env->gpr[11] = cpu->env.fdt_addr;          /* a1 */
>  }
>
> +void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level)
> +{
> +    int ret;
> +    unsigned virq = level ? KVM_INTERRUPT_SET : KVM_INTERRUPT_UNSET;
> +
> +    if (irq != IRQ_S_EXT) {
> +        return;
> +    }
> +
> +    if (!kvm_enabled()) {
> +        return;
> +    }
> +
> +    ret = kvm_vcpu_ioctl(CPU(cpu), KVM_INTERRUPT, &virq);
> +    if (ret < 0) {
> +        perror("Set irq failed");
> +        abort();
> +    }
> +}
> +
>  bool kvm_arch_cpu_check_are_resettable(void)
>  {
>      return true;
> diff --git a/target/riscv/kvm_riscv.h b/target/riscv/kvm_riscv.h
> index f38c82bf59..ed281bdce0 100644
> --- a/target/riscv/kvm_riscv.h
> +++ b/target/riscv/kvm_riscv.h
> @@ -20,5 +20,6 @@
>  #define QEMU_KVM_RISCV_H
>
>  void kvm_riscv_reset_vcpu(RISCVCPU *cpu);
> +void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level);
>
>  #endif
> --
> 2.19.1
>
>
> --
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

