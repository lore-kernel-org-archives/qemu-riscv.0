Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lWoLZ-0004zy-2Z
	for mharc-qemu-riscv@gnu.org; Wed, 14 Apr 2021 18:50:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lWoLV-0004xB-JN; Wed, 14 Apr 2021 18:50:53 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:43920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lWoLT-0004I1-PM; Wed, 14 Apr 2021 18:50:53 -0400
Received: by mail-io1-xd32.google.com with SMTP id v123so15432438ioe.10;
 Wed, 14 Apr 2021 15:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YMl0q4Qg+LLVVghVpz3Z75rPVp0f8dXQ4rlEwW2PnGY=;
 b=MSWSM466xn2JwPKk40F9f0J0QSVWykebgtuupTAWaKe7xc8NFvydhhv6fEGlB5Emvr
 phLpPjr4MxjPnc4/4xEZVaCAkH4/sqQRy9VUfOn3XRRVSV0EdVRFj7LM3yzEnVmoEzco
 VB+RRIaYV445qO8LzejzorIh1Fu0YPD9vY+j/3K6ERPoRTL1oeKQMyjVxtrHSa+4jSTB
 vtObrsewgGLlbFm+wpVp7XKo1zVtN/nt8tjom/92KZy6IUJLEvMUft9vfrJVwtyI7wWA
 dlGDI93zZvW0SIdD2WNYcd/GMoGLc49tFP0WOyQe5irB5Oc75L074gPIUl0e4BQjVk24
 HUww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YMl0q4Qg+LLVVghVpz3Z75rPVp0f8dXQ4rlEwW2PnGY=;
 b=ozQBBPpUBKABFmLDvcxCrvfSXulmZNi6h8eZB5XjxaGzyUCVujPS8FSQJMB7K8md21
 JS2keWTpqm/viP0VH/LDdG/2uAlGCS3vT/8C4ogngtSvS/exJxnKMQLOWDeafXKY5psx
 HKpEPGKe3xC/DGnfC27h8ALv6IOAWG5u+a3HaFWhxgZp29iHHYERwAZkSYZtJ9legQE9
 Dg1V3w+CNxILJPVouuw15YB1oJ0PeUJEj7EluAvqde6Q5W9lPCinhTXFnfJZYnPxg9N6
 plNCSmAh5sMGCDkpJdId9ROQL0toD1xTTVo+mVG9dW91+gbKfiQLdo/V1yucI/CQuKTh
 EsJA==
X-Gm-Message-State: AOAM533kWyhJOFe39T3/nEYSJluCahH8jXHNab+pphYUOAnuUSoeKheo
 aDIgyGfY05n1unvvcHqiBYmmoiot79DvaHlCJ64=
X-Google-Smtp-Source: ABdhPJxgaQGhRs1C/cFTlO12Ada6lPwWqpJPa3I/q2ak8K0Eq4Xr5SAYvJLaCBDcpyS9uy5RW9XvJXGaB5Cvzsq6VTE=
X-Received: by 2002:a05:6638:3048:: with SMTP id
 u8mr203045jak.91.1618440650050; 
 Wed, 14 Apr 2021 15:50:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210412065246.1853-1-jiangyifei@huawei.com>
 <20210412065246.1853-8-jiangyifei@huawei.com>
In-Reply-To: <20210412065246.1853-8-jiangyifei@huawei.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 15 Apr 2021 08:50:23 +1000
Message-ID: <CAKmqyKNzyftUr0yTJ1TOENo_p3S_nO9peQRpdu=1Zbm70zncdQ@mail.gmail.com>
Subject: Re: [PATCH RFC v5 07/12] hw/riscv: PLIC update external interrupt by
 KVM when kvm enabled
To: Yifei Jiang <jiangyifei@huawei.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "open list:Overall" <kvm@vger.kernel.org>, libvir-list@redhat.com, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Anup Patel <anup.patel@wdc.com>, 
 yinyipeng <yinyipeng1@huawei.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 kvm-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 fanliang@huawei.com, "Wubin (H)" <wu.wubin@huawei.com>,
 Zhanghailiang <zhang.zhanghailiang@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d32;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd32.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 14 Apr 2021 22:50:54 -0000

On Mon, Apr 12, 2021 at 4:57 PM Yifei Jiang <jiangyifei@huawei.com> wrote:
>
> Only support supervisor external interrupt currently.
>
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Yipeng Yin <yinyipeng1@huawei.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

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

