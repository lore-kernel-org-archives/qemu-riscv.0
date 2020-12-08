Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kmlV4-0005S7-Sf
	for mharc-qemu-riscv@gnu.org; Tue, 08 Dec 2020 17:30:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kmlUv-0005Gt-Fv; Tue, 08 Dec 2020 17:30:17 -0500
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:36730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kmlUs-0003Nq-U0; Tue, 08 Dec 2020 17:30:17 -0500
Received: by mail-io1-xd42.google.com with SMTP id z136so157400iof.3;
 Tue, 08 Dec 2020 14:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=29eBtDtyvwAuueSeF0oAu/txUr+9Ao/9LQHUlVU+2fc=;
 b=TlDD6aUalTYuTfenNQAJ3zERjK6Q4H8256n1j7bQnm2m971BN4p1XB8JDCwAWfJBf+
 2ejwqZ+KDc0ShxbVivY+Yt1aOz2GBbGNfiE69BdzG/ZGu8C1zL3XpzxhERfeqCuoSXe3
 c3cvYwq9Y6Q6eoLLvyYl4zxrsf9yXyqItjWUkqeYN2UPHukd45hxYRLw1IY6PTEz0/x3
 qshEjy0GXYWL1L553lcudUwAIMbDL8aU/Sr+MyHeirorCDuR1Qga4GCYKs7V6u8EFtZM
 If9Bt5Yq/P7dLFox6eXHEAEMco6zV/K3JO0W4aFKRyrkuo8YwQQVyskYq1sWdymu//EI
 PbzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=29eBtDtyvwAuueSeF0oAu/txUr+9Ao/9LQHUlVU+2fc=;
 b=Rh4GVwVJMiSFBf+ybRuwF0R+c+Llm9JSWGatLLZalVx1Pk5cp4Q0jj1VWyX6rBlvpF
 NMgVRxf5qFzag+Q1reYw5LF3bj678DXMdjIwAQlOb6quy+vTRUIYnXEfB6WvJowwfyeu
 kUTvLIK4O8BTjMrSkXUBTH8TFcbsNnSlOPbyZ44+hiy+4hPrrwmZodS+H1bjBgcbgUB0
 OPCjd351RASyFShShSbBNwxUr9QO6yan87cy1sorvcLAZnXmJdvDS9UbEY6gecvDIWwn
 5BzFLnuoPnwExLTcwHjsgZIE47VZS7IoicV9maUlwYl9QZ/YKrKqy7wxM3yzRJr/tF8D
 KIGQ==
X-Gm-Message-State: AOAM532U8zqxVB742ALaV0zUOm1s4/HuPAcjv3uvS0jCHD1sGcwLbUh3
 /DDsDl0q+mblWnFKVMPhvNOH3s0FoDi1u+7L/ki3RnMb/eucuA==
X-Google-Smtp-Source: ABdhPJydZr404HaRvsRmgbtUATpJcCUZ8/SGlgfkBg22Seph0XiRiwRnnc4GJRJOJCjBUjk7r9govf33CuCi98jG7+8=
X-Received: by 2002:a02:6c09:: with SMTP id w9mr28541514jab.135.1607466613268; 
 Tue, 08 Dec 2020 14:30:13 -0800 (PST)
MIME-Version: 1.0
References: <20201203124703.168-1-jiangyifei@huawei.com>
 <20201203124703.168-8-jiangyifei@huawei.com>
In-Reply-To: <20201203124703.168-8-jiangyifei@huawei.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 8 Dec 2020 14:29:47 -0800
Message-ID: <CAKmqyKMXmCPyMmo_OHdeVZCjN1k_Lv9n_FVFe9pvbnoHhVSL1g@mail.gmail.com>
Subject: Re: [PATCH RFC v4 07/15] hw/riscv: PLIC update external interrupt by
 KVM when kvm enabled
To: Yifei Jiang <jiangyifei@huawei.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "Zhangxiaofeng (F)" <victor.zhangxiaofeng@huawei.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "open list:Overall" <kvm@vger.kernel.org>, libvir-list@redhat.com, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Anup Patel <anup.patel@wdc.com>, 
 yinyipeng <yinyipeng1@huawei.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 kvm-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 "dengkai (A)" <dengkai1@huawei.com>, "Wubin (H)" <wu.wubin@huawei.com>, 
 Zhanghailiang <zhang.zhanghailiang@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d42;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd42.google.com
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
X-List-Received-Date: Tue, 08 Dec 2020 22:30:24 -0000

On Thu, Dec 3, 2020 at 4:47 AM Yifei Jiang <jiangyifei@huawei.com> wrote:
>
> Only support supervisor external interrupt currently.
>
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Yipeng Yin <yinyipeng1@huawei.com>
> ---
>  hw/intc/sifive_plic.c    | 31 ++++++++++++++++++++++---------
>  target/riscv/kvm.c       | 19 +++++++++++++++++++
>  target/riscv/kvm_riscv.h |  1 +
>  3 files changed, 42 insertions(+), 9 deletions(-)
>
> diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
> index 97a1a27a9a..a419ca3a3c 100644
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
> @@ -147,15 +149,26 @@ static void sifive_plic_update(SiFivePLICState *plic)
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
> +#ifdef CONFIG_KVM
> +            kvm_riscv_set_irq(RISCV_CPU(cpu), IRQ_S_EXT, level);
> +#endif

What if kvm_enalbed() is true, but CONFIG_KVM isn't defined?

Alistair

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
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index 6250ca0c7d..b01ff0754c 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -454,3 +454,22 @@ void kvm_riscv_reset_vcpu(RISCVCPU *cpu)
>      env->satp = 0;
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

