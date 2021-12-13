Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mwd1C-0007Wa-8N
	for mharc-qemu-riscv@gnu.org; Sun, 12 Dec 2021 23:32:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mwd1B-0007WJ-0S
 for qemu-riscv@nongnu.org; Sun, 12 Dec 2021 23:32:53 -0500
Received: from [2a00:1450:4864:20::32d] (port=33461
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mwd19-0006uH-AC
 for qemu-riscv@nongnu.org; Sun, 12 Dec 2021 23:32:52 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 r9-20020a7bc089000000b00332f4abf43fso10228434wmh.0
 for <qemu-riscv@nongnu.org>; Sun, 12 Dec 2021 20:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y6ULSPcKlV9Vt0GLH7sDZM7VOzSC0N6caPzZeQCOwq8=;
 b=RlylBlpiukPincecpuULwmLaQ9HDGWFLnsQEV/EqGK7EgB6AHwLUDVUTIgbIoncJ89
 1+x9HDDvvromaZd8ayp9Ky4ES3V82lPnnPbOBaEcuOeKdgIbekDlfbwFY3urS/r/KIK7
 RC7jAc6h/qAuiM8jdGlVNIKX8Cpta/eoCIy+hhPAyxHY8xYIsjo4kmxsT2v0vPnqlxH1
 zP+Pvs/5wAhCzCpdaS4xMxub30RHpf0H0Xl1pSrOeULgLbfduFgue61iofNiX5n0+DbS
 3WdwawKOpz5ErDXbcf1CBf0Lv0Vf5Eb+tLsae0xb0LeNDW+p0xhDhUzAWHjrcIAveInu
 G2nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y6ULSPcKlV9Vt0GLH7sDZM7VOzSC0N6caPzZeQCOwq8=;
 b=ExQZWTSc/4Nri1eYqqSRK4ZpokPPVoTVOe15kNaRT4JTeL7Vv5c4XDBY+t8Twq5l/g
 vfgJby+pGOqUTNCm8vRbhKZdqUF5dS2rjyOBm4be6w/RfoIKWUWiJvNRgVFD0L0LbKSL
 sf0xLgmwVzORUQ1CMuBKOYzj+svRODrbuhevkkjmcsEel2GGwndOy1Z2ji9yNtWJ6Kg9
 l25Q8Hxa8Zskw02ARLjMKgC9Y0z9VvGKX0ePkLXCaKcOJOlkqj6G31/TZevkr06onC5+
 jcvYUeUjwT48yIMId+28FUtksMwuuBloX0ZFERgb5mS7MQhgkE5B6dwJgmm9LKlGiF6I
 b8vg==
X-Gm-Message-State: AOAM531FkWpb4SPUAX/A1B1XPp9CmZHJVVzuvG2rGPYOpCcCeQgRJZLx
 yYdkHsov76eOescbrTH4Iqr/XHXTPZ+7VY7QYpYvVw==
X-Google-Smtp-Source: ABdhPJzKPc1NNbqbPPvupXHUy/7zUdyE70MX0jImhbJ8IDBzf7DLlIKNR6s7hBZjpZLvwIoPOu/QThZWCSbRFYTbfGg=
X-Received: by 2002:a7b:c017:: with SMTP id c23mr34700828wmb.137.1639369969288; 
 Sun, 12 Dec 2021 20:32:49 -0800 (PST)
MIME-Version: 1.0
References: <20211210100732.1080-1-jiangyifei@huawei.com>
 <20211210100732.1080-8-jiangyifei@huawei.com>
In-Reply-To: <20211210100732.1080-8-jiangyifei@huawei.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 13 Dec 2021 10:02:38 +0530
Message-ID: <CAAhSdy0q3iuURMcW9+wV4oyB1O=Mj19UaT9P31fLHAYZ_wU3pg@mail.gmail.com>
Subject: Re: [PATCH v2 07/12] target/riscv: Support setting external interrupt
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
X-List-Received-Date: Mon, 13 Dec 2021 04:32:53 -0000

On Fri, Dec 10, 2021 at 3:37 PM Yifei Jiang <jiangyifei@huawei.com> wrote:
>
> When KVM is enabled, set the S-mode external interrupt through
> kvm_riscv_set_irq function.
>
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Mingwang Li <limingwang@huawei.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.c       |  6 +++++-
>  target/riscv/kvm-stub.c  |  5 +++++
>  target/riscv/kvm.c       | 17 +++++++++++++++++
>  target/riscv/kvm_riscv.h |  1 +
>  4 files changed, 28 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 1c944872a3..71a7ac6831 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -603,7 +603,11 @@ static void riscv_cpu_set_irq(void *opaque, int irq, int level)
>      case IRQ_S_EXT:
>      case IRQ_VS_EXT:
>      case IRQ_M_EXT:
> -        riscv_cpu_update_mip(cpu, 1 << irq, BOOL_TO_MASK(level));
> +        if (kvm_enabled() && (irq & IRQ_M_EXT) ) {
> +            kvm_riscv_set_irq(cpu, IRQ_S_EXT, level);
> +        } else {
> +            riscv_cpu_update_mip(cpu, 1 << irq, BOOL_TO_MASK(level));
> +        }

This does not look right.

I suggest the following:

if (kvm_enabled()) {
    kvm_riscv_set_irq(cpu, irq, level);
} else {
   riscv_cpu_update_mip(cpu, 1 << irq, BOOL_TO_MASK(level));
}

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

Regards,
Anup

