Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n0HEX-00015c-VX
	for mharc-qemu-riscv@gnu.org; Thu, 23 Dec 2021 01:05:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n0HEQ-00013X-9A
 for qemu-riscv@nongnu.org; Thu, 23 Dec 2021 01:05:38 -0500
Received: from [2a00:1450:4864:20::333] (port=42745
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n0HEO-0003BW-Hu
 for qemu-riscv@nongnu.org; Thu, 23 Dec 2021 01:05:37 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 a83-20020a1c9856000000b00344731e044bso2665701wme.1
 for <qemu-riscv@nongnu.org>; Wed, 22 Dec 2021 22:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1XgeblNjyLRR0VJexdQ72YWUWRRoaoPGkJJML+2iIio=;
 b=2oS8G8wzk9dq8rZDZ5ZSer7XJ2oqA3CcpCnFYWtJMevQoz4ZztBfdqkuaMvYn5QGcP
 J2Bg9HPbWGzhtWmJUHZnsm3s3c7p9DSD7nELjVhb6qaNsTZxR0uzDYAxhzEXupovu6Gn
 mi0FjQQmiRhUd6LJMRn9HyRspMc3TXedNQpnGjr1GCtz8V8LmZzWmRIcFpOLIL4ZF7YW
 +7qxtnDKULC7pdiHSPMO3z99Ey5eJYSTeuDs5X+AIpc0TK6ILuGw2XvaqXS4QTQi1BLL
 vV7VmKlUtFkk6X7/0rp/2Rzmm+4naTO6UL8nAsZwbCkMy7j+iSyrBskPwP6ulWZa1Sjo
 kpVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1XgeblNjyLRR0VJexdQ72YWUWRRoaoPGkJJML+2iIio=;
 b=xxh06NY99DHsfFfGcPmR+AwIOF+1qqMVLHbUUMbVwNoHiXmrr1KYCMW+pc6DJrhehf
 nwc6SHtkSHtQU1BGLzl3tIInKYXQoxTLUI3PbR7+bN8WiJF/WcRGs3Wri480ojHVjCw6
 jwyddpejCgUY7j894g/izEklxxq7Hqorxz425bXoIey3phNvNlEcyxB6xxsJlqyAuEd/
 KbK/9QuHaU79O02f/K/2sBWoFEncwwlTqlbljVm5MCTBnjIeX9GLJfsBCnMSUlkz3/RJ
 KTauq2vgArQJcW7nzllWMEQUI3hl6FD5cI4ci7V6gy0lsKkLikM887RWrpHDqVyGApiD
 7MxA==
X-Gm-Message-State: AOAM532H74MZiMGEpx+vLpp4pxWPC3TazavrOIjAwkjA8Zyp5ZbMVLu+
 Papx+pnH6jJ0kWgS7nOUbWOPbo58/WaiyEiBNTcYsQ==
X-Google-Smtp-Source: ABdhPJyqcT8DUVax4HxTlJfCZ8O3g/CTsOX2tmncos53JiwJ4I7hLYtfwBD3A1vas8TtRWuZsnZA/e2ydv2coAFrwhs=
X-Received: by 2002:a7b:c0c1:: with SMTP id s1mr617063wmh.176.1640239535261;
 Wed, 22 Dec 2021 22:05:35 -0800 (PST)
MIME-Version: 1.0
References: <20211220130919.413-1-jiangyifei@huawei.com>
 <20211220130919.413-8-jiangyifei@huawei.com>
In-Reply-To: <20211220130919.413-8-jiangyifei@huawei.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 23 Dec 2021 11:35:23 +0530
Message-ID: <CAAhSdy1rsRKwwLu2n58U0Wk8FVG17c3md-gDVAipgEC1P=srSQ@mail.gmail.com>
Subject: Re: [PATCH v3 07/12] target/riscv: Support setting external interrupt
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
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::333;
 envelope-from=anup@brainfault.org; helo=mail-wm1-x333.google.com
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
X-List-Received-Date: Thu, 23 Dec 2021 06:05:40 -0000

On Mon, Dec 20, 2021 at 6:39 PM Yifei Jiang <jiangyifei@huawei.com> wrote:
>
> When KVM is enabled, set the S-mode external interrupt through
> kvm_riscv_set_irq function.
>
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Mingwang Li <limingwang@huawei.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Looks good to me.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Regards,
Anup

> ---
>  target/riscv/cpu.c       |  6 +++++-
>  target/riscv/kvm-stub.c  |  5 +++++
>  target/riscv/kvm.c       | 17 +++++++++++++++++
>  target/riscv/kvm_riscv.h |  1 +
>  4 files changed, 28 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 1c944872a3..3fc3a9c45b 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -603,7 +603,11 @@ static void riscv_cpu_set_irq(void *opaque, int irq, int level)
>      case IRQ_S_EXT:
>      case IRQ_VS_EXT:
>      case IRQ_M_EXT:
> -        riscv_cpu_update_mip(cpu, 1 << irq, BOOL_TO_MASK(level));
> +        if (kvm_enabled()) {
> +            kvm_riscv_set_irq(cpu, irq, level);
> +        } else {
> +            riscv_cpu_update_mip(cpu, 1 << irq, BOOL_TO_MASK(level));
> +        }
>          break;
>      default:
>          g_assert_not_reached();
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
> index db6d8a5b6e..0027f11f45 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -383,6 +383,23 @@ void kvm_riscv_reset_vcpu(RISCVCPU *cpu)
>      env->satp = 0;
>  }
>
> +void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level)
> +{
> +    int ret;
> +    unsigned virq = level ? KVM_INTERRUPT_SET : KVM_INTERRUPT_UNSET;
> +
> +    if (irq != IRQ_S_EXT) {
> +        perror("kvm riscv set irq != IRQ_S_EXT\n");
> +        abort();
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

