Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mt4fW-0007uz-Hr
	for mharc-qemu-riscv@gnu.org; Fri, 03 Dec 2021 04:15:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mt4fS-0007uU-1x
 for qemu-riscv@nongnu.org; Fri, 03 Dec 2021 04:15:47 -0500
Received: from [2a00:1450:4864:20::32d] (port=39627
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mt4fL-0006ZA-5T
 for qemu-riscv@nongnu.org; Fri, 03 Dec 2021 04:15:45 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 n33-20020a05600c502100b0032fb900951eso4306961wmr.4
 for <qemu-riscv@nongnu.org>; Fri, 03 Dec 2021 01:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U0B16HHaf+FizT81Iwjon49q2PNtgQTpgZRHypZR4Ew=;
 b=wnUWQza9St4aErc5H/J4Cg/tfN+2G4OgvfhjiNGAkuXH+dE60Hy5egr5FEqUWyIcNA
 wKPHFahOog+2nmkyfMf1KfU2/garPxXDDBIWW84Rhod+jE4vOmBF/fRPyUzc3/6xIEhh
 t0RLZ2a/zvhaVjCKHPPehSVNET8Z1SzVVb1b4v2gbj0o+NB5y22mcHVaTdAIcBnF5Bxh
 XX8LhbUL0kJhynSVK18QfBStPYTrmFmpctmnroRjJqGw2G3bYQTF3QfXb08AgIP0VSDZ
 ZVGr5WO6OjiVCkIbMBm2yifQUzoHKaFkofFgqrYQsNSoFcUYwDiQQdzV7rCEGEISS0ZX
 rAIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U0B16HHaf+FizT81Iwjon49q2PNtgQTpgZRHypZR4Ew=;
 b=c44UqJnEug9bxtd33k8f5JJITjP40kojWD/iEM2rmvan8apD7z0sJ6N88T7Ta43AIP
 ammp+E5BYl5z48fgM4cvU6yDoOrCIcMoC4M49X8+NRhWOSdKd7U2eQNZmJZ5rgVVkXEO
 Pv8ewbmqF3sSRFf1pjQzpa/I+ONRZAyD+gdGcE6EIl1FusmRUD/aPbc6x8T69C0Auvhd
 C5Zk2wdl0WoKY4EWwOJimNBU5qCc8424KIeC66qtcIt+2CgD++VLyUYDQbKYksERrE/I
 52h6pvwbJG6LU6KT16Z55OA9v4s52OFvuZ7AdSuCuyPByNi0M8RzORz3nL8DYbl0KZz7
 KkZg==
X-Gm-Message-State: AOAM533u5YAIiMPz1xSjVRZjzcaYe5jn2YZdmCOVp3rgrZZ+zd0/KU/e
 rKGfO0OTIi22GYRfjBSFky9ZaiASJMVeK3xmnsOkbg==
X-Google-Smtp-Source: ABdhPJyGf8nSCXjr7ZEoviXXuNLpLMywZUeXL478JSZ7VQpgO6HCuaNaYcon4QUzdxxGhsBkoZy3Ho/SzkNu/lhT7vo=
X-Received: by 2002:a7b:c256:: with SMTP id b22mr13296879wmj.176.1638522937458; 
 Fri, 03 Dec 2021 01:15:37 -0800 (PST)
MIME-Version: 1.0
References: <20211120074644.729-1-jiangyifei@huawei.com>
 <20211120074644.729-8-jiangyifei@huawei.com>
In-Reply-To: <20211120074644.729-8-jiangyifei@huawei.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 3 Dec 2021 14:45:25 +0530
Message-ID: <CAAhSdy3suxztJYmOtEdtY+bpvESACc4QbPbv0jNL00qpw0WeUw@mail.gmail.com>
Subject: Re: [PATCH v1 07/12] target/riscv: Support setting external interrupt
 by KVM
To: Yifei Jiang <jiangyifei@huawei.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 kvm-riscv@lists.infradead.org, KVM General <kvm@vger.kernel.org>,
 libvir-list@redhat.com, 
 Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 fanliang@huawei.com, 
 "Wubin (H)" <wu.wubin@huawei.com>, wanghaibin.wang@huawei.com,
 wanbo13@huawei.com, Mingwang Li <limingwang@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::32d;
 envelope-from=anup@brainfault.org; helo=mail-wm1-x32d.google.com
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
X-List-Received-Date: Fri, 03 Dec 2021 09:15:47 -0000

On Sat, Nov 20, 2021 at 1:17 PM Yifei Jiang <jiangyifei@huawei.com> wrote:
>
> Extend riscv_cpu_update_mip() to support setting external interrupt
> by KVM. It will call kvm_riscv_set_irq() to change the IRQ state in
> the KVM module When kvm is enabled and the MIP_SEIP bit is set in "mask"
>
> In addition, bacause target/riscv/cpu_helper.c is used to TCG, so move
> riscv_cpu_update_mip() to target/riscv/cpu.c from target/riscv/cpu_helper.c
>
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Mingwang Li <limingwang@huawei.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.c        | 34 ++++++++++++++++++++++++++++++++++
>  target/riscv/cpu_helper.c | 27 ---------------------------
>  target/riscv/kvm-stub.c   |  5 +++++
>  target/riscv/kvm.c        | 20 ++++++++++++++++++++
>  target/riscv/kvm_riscv.h  |  1 +
>  5 files changed, 60 insertions(+), 27 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 1c944872a3..a464845c99 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -21,6 +21,7 @@
>  #include "qemu/qemu-print.h"
>  #include "qemu/ctype.h"
>  #include "qemu/log.h"
> +#include "qemu/main-loop.h"
>  #include "cpu.h"
>  #include "internals.h"
>  #include "exec/exec-all.h"
> @@ -131,6 +132,39 @@ static void set_feature(CPURISCVState *env, int feature)
>      env->features |= (1ULL << feature);
>  }
>
> +#ifndef CONFIG_USER_ONLY
> +uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t value)
> +{
> +    CPURISCVState *env = &cpu->env;
> +    CPUState *cs = CPU(cpu);
> +    uint32_t old = env->mip;
> +    bool locked = false;
> +
> +    if (!qemu_mutex_iothread_locked()) {
> +        locked = true;
> +        qemu_mutex_lock_iothread();
> +    }
> +
> +    env->mip = (env->mip & ~mask) | (value & mask);
> +
> +    if (kvm_enabled() && (mask & MIP_SEIP)) {
> +        kvm_riscv_set_irq(RISCV_CPU(cpu), IRQ_S_EXT, value & MIP_SEIP);
> +    }
> +
> +    if (env->mip) {
> +        cpu_interrupt(cs, CPU_INTERRUPT_HARD);
> +    } else {
> +        cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
> +    }
> +
> +    if (locked) {
> +        qemu_mutex_unlock_iothread();
> +    }
> +
> +    return old;
> +}
> +#endif
> +

We should not change riscv_cpu_update_mip() for injecting KVM interrupts
because this function touches the user-space state of MIP csr but for KVM
the SIP csr state is always in kernel-space.

Further, the KVM kernel-space ensures synchronization so we don't need
to do qemu_mutex_lock/unlock_iothread() for KVM interrupts.

I would suggest to extend riscv_cpu_set_irq() for KVM interrupts. When
KVM is enabled, the riscv_cpu_set_irq() should throw warning/abort for
any interrupt other than S-mode external interrupts.

Regards,
Anup

>  static void set_resetvec(CPURISCVState *env, target_ulong resetvec)
>  {
>  #ifndef CONFIG_USER_ONLY
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 9eeed38c7e..5e36c35b15 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -286,33 +286,6 @@ int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint32_t interrupts)
>      }
>  }
>
> -uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t value)
> -{
> -    CPURISCVState *env = &cpu->env;
> -    CPUState *cs = CPU(cpu);
> -    uint32_t old = env->mip;
> -    bool locked = false;
> -
> -    if (!qemu_mutex_iothread_locked()) {
> -        locked = true;
> -        qemu_mutex_lock_iothread();
> -    }
> -
> -    env->mip = (env->mip & ~mask) | (value & mask);
> -
> -    if (env->mip) {
> -        cpu_interrupt(cs, CPU_INTERRUPT_HARD);
> -    } else {
> -        cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
> -    }
> -
> -    if (locked) {
> -        qemu_mutex_unlock_iothread();
> -    }
> -
> -    return old;
> -}
> -
>  void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(uint32_t),
>                               uint32_t arg)
>  {
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
> index 7f3ffcc2b4..8da2648d1a 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -458,6 +458,26 @@ void kvm_riscv_reset_vcpu(RISCVCPU *cpu)
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

