Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mt51l-0001j6-NU
	for mharc-qemu-riscv@gnu.org; Fri, 03 Dec 2021 04:38:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mt51g-0001hO-O7
 for qemu-riscv@nongnu.org; Fri, 03 Dec 2021 04:38:45 -0500
Received: from [2a00:1450:4864:20::436] (port=38841
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mt51e-00051o-9V
 for qemu-riscv@nongnu.org; Fri, 03 Dec 2021 04:38:44 -0500
Received: by mail-wr1-x436.google.com with SMTP id q3so4428257wru.5
 for <qemu-riscv@nongnu.org>; Fri, 03 Dec 2021 01:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fPLe+X7B/92EvPeH79F8SC+4zXJechhiMlgJJ6ygJmM=;
 b=CJaqo33rn2+ADYA2f/NMEfRi3vbkvCgT8HP4vhySKDcBqFs6H+5s0DmFpNUdTgaXb9
 swu9tUt/h83MNptF7zM7T37Hau8UDcu9IEFeJtYOrDo9eaMrO0shVGyJ1kZuReH6PfuR
 nfwLPAaxb5gMd9+pUwcVYUCpyhlo7YFxcqWsDfaUrfAVcmHinzpe+YvjKxiQvExpdUyV
 +NkRwo6qJ2O6CKidqkOurhuU78GikV9ud2+p5sKI9BgzqapfQg9V9MROJbXY84/hYnwv
 JLmDHTOI/xOjw4MRXjqSPQVwf82QqWHn2RSLMuVRA0umGUIzyQZYKB/wgYfa747Tzjtb
 r1WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fPLe+X7B/92EvPeH79F8SC+4zXJechhiMlgJJ6ygJmM=;
 b=iY+oGdf7MTQbkxTGjuYb1oLARneypjRJAmpjBviHyAPWrVF+BjUyHU41ps1lHcWTxj
 RwRr1Mnz/y+1iNbHXZYsWXifHgOI1jRfSeutJWFA4Zwa47leeA5Ik6GzkPhZhdQ1qbou
 OAT0Bse4sDl48CgM6Dl4pf4jSUV3evhI6HNhAu9oqNxoJUY1RDlEo50RlkH4fansfSa5
 eGosKcP1rbQJX1Yg3t6tBl4ZQqeKtxN75Vm8YcXgutnUwfLdeUZa+xescklVs89EFmeA
 Wa3XllXTcPumcynrAGwS9VgIq5r8HPwl0irXj/LfsELSaASNlaBmL2m9oZNSvxH94qKV
 kO+A==
X-Gm-Message-State: AOAM530j4pBN8qD1WiyaaizuYjQNk4z6sZ1OGu1z/eN14VAKM91n+ggc
 i8IQagfEj54qi98QzpK3At6EioQDkYDF+usS6yRhGQ==
X-Google-Smtp-Source: ABdhPJysNJvbytvXQ9Wiw5VXNtJc5Npfsb4jjldQ+LMjn/PB6gfHLrfoog5BHaXm8GtO9JC9uFk0bMrmdlhQ7wr54uE=
X-Received: by 2002:adf:e848:: with SMTP id d8mr20955918wrn.3.1638524320486;
 Fri, 03 Dec 2021 01:38:40 -0800 (PST)
MIME-Version: 1.0
References: <20211120074644.729-1-jiangyifei@huawei.com>
 <20211120074644.729-11-jiangyifei@huawei.com>
In-Reply-To: <20211120074644.729-11-jiangyifei@huawei.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 3 Dec 2021 15:08:29 +0530
Message-ID: <CAAhSdy075GcmcMTsVsvgXN+W9Cf7EKCrycnOG9BZAkfKfp3J-w@mail.gmail.com>
Subject: Re: [PATCH v1 10/12] target/riscv: Add kvm_riscv_get/put_regs_timer
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
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::436;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x436.google.com
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
X-List-Received-Date: Fri, 03 Dec 2021 09:38:47 -0000

On Sat, Nov 20, 2021 at 1:17 PM Yifei Jiang <jiangyifei@huawei.com> wrote:
>
> Add kvm_riscv_get/put_regs_timer to synchronize virtual time context
> from KVM.
>
> To set register of RISCV_TIMER_REG(state) will occur a error from KVM
> on kvm_timer_state == 0. It's better to adapt in KVM, but it doesn't matter
> that adaping in QEMU.
>
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Mingwang Li <limingwang@huawei.com>
> ---
>  target/riscv/cpu.h |  6 ++++
>  target/riscv/kvm.c | 72 ++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 78 insertions(+)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index e7dba35acb..dea49e53f0 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -259,6 +259,12 @@ struct CPURISCVState {
>
>      hwaddr kernel_addr;
>      hwaddr fdt_addr;
> +
> +    /* kvm timer */
> +    bool kvm_timer_dirty;
> +    uint64_t kvm_timer_time;
> +    uint64_t kvm_timer_compare;
> +    uint64_t kvm_timer_state;

We should also include kvm_timer_frequency here.

Currently, it is read-only but in-future KVM RISC-V will allow
setting timer_frequency using SBI para-virt time scaling extension.

Regards,
Anup

>  };
>
>  OBJECT_DECLARE_TYPE(RISCVCPU, RISCVCPUClass,
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index 6d419ba02e..e5725770f2 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -64,6 +64,9 @@ static uint64_t kvm_riscv_reg_id(CPURISCVState *env, uint64_t type, uint64_t idx
>  #define RISCV_CSR_REG(env, name)  kvm_riscv_reg_id(env, KVM_REG_RISCV_CSR, \
>                   KVM_REG_RISCV_CSR_REG(name))
>
> +#define RISCV_TIMER_REG(env, name)  kvm_riscv_reg_id(env, KVM_REG_RISCV_TIMER, \
> +                 KVM_REG_RISCV_TIMER_REG(name))
> +
>  #define RISCV_FP_F_REG(env, idx)  kvm_riscv_reg_id(env, KVM_REG_RISCV_FP_F, idx)
>
>  #define RISCV_FP_D_REG(env, idx)  kvm_riscv_reg_id(env, KVM_REG_RISCV_FP_D, idx)
> @@ -310,6 +313,75 @@ static int kvm_riscv_put_regs_fp(CPUState *cs)
>      return ret;
>  }
>
> +static void kvm_riscv_get_regs_timer(CPUState *cs)
> +{
> +    int ret;
> +    uint64_t reg;
> +    CPURISCVState *env = &RISCV_CPU(cs)->env;
> +
> +    if (env->kvm_timer_dirty) {
> +        return;
> +    }
> +
> +    ret = kvm_get_one_reg(cs, RISCV_TIMER_REG(env, time), &reg);
> +    if (ret) {
> +        abort();
> +    }
> +    env->kvm_timer_time = reg;
> +
> +    ret = kvm_get_one_reg(cs, RISCV_TIMER_REG(env, compare), &reg);
> +    if (ret) {
> +        abort();
> +    }
> +    env->kvm_timer_compare = reg;
> +
> +    ret = kvm_get_one_reg(cs, RISCV_TIMER_REG(env, state), &reg);
> +    if (ret) {
> +        abort();
> +    }
> +    env->kvm_timer_state = reg;
> +
> +    env->kvm_timer_dirty = true;
> +}
> +
> +static void kvm_riscv_put_regs_timer(CPUState *cs)
> +{
> +    int ret;
> +    uint64_t reg;
> +    CPURISCVState *env = &RISCV_CPU(cs)->env;
> +
> +    if (!env->kvm_timer_dirty) {
> +        return;
> +    }
> +
> +    reg = env->kvm_timer_time;
> +    ret = kvm_set_one_reg(cs, RISCV_TIMER_REG(env, time), &reg);
> +    if (ret) {
> +        abort();
> +    }
> +
> +    reg = env->kvm_timer_compare;
> +    ret = kvm_set_one_reg(cs, RISCV_TIMER_REG(env, compare), &reg);
> +    if (ret) {
> +        abort();
> +    }
> +
> +    /*
> +     * To set register of RISCV_TIMER_REG(state) will occur a error from KVM
> +     * on env->kvm_timer_state == 0, It's better to adapt in KVM, but it
> +     * doesn't matter that adaping in QEMU now.
> +     * TODO If KVM changes, adapt here.
> +     */
> +    if (env->kvm_timer_state) {
> +        reg = env->kvm_timer_state;
> +        ret = kvm_set_one_reg(cs, RISCV_TIMER_REG(env, state), &reg);
> +        if (ret) {
> +            abort();
> +        }
> +    }
> +
> +    env->kvm_timer_dirty = false;
> +}
>
>  const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
>      KVM_CAP_LAST_INFO
> --
> 2.19.1
>
>
> --
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

