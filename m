Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mwdXS-0002O3-Kx
	for mharc-qemu-riscv@gnu.org; Mon, 13 Dec 2021 00:06:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mwdXR-0002Lj-MU
 for qemu-riscv@nongnu.org; Mon, 13 Dec 2021 00:06:13 -0500
Received: from [2a00:1450:4864:20::335] (port=39735
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mwdXQ-0005D8-5A
 for qemu-riscv@nongnu.org; Mon, 13 Dec 2021 00:06:13 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 n33-20020a05600c502100b0032fb900951eso13187008wmr.4
 for <qemu-riscv@nongnu.org>; Sun, 12 Dec 2021 21:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CXDbZ72EhvPIsbyJ5EezoEwlOzUgft6D4XqjM/k4Tos=;
 b=KSCMfIXUndmM5XtTu7qvshpTyYQ+K4SvpaqDdOqNi2TfOfuEoxNE5PUoIRlE/UnWvM
 LyKmhmwQuCXgl+JQ2b8cHpfzGr1BcLgVQL3LFYREOKqN/rh82VjT4GGcUUyT39OuWQju
 d8O5AaXIEvGizGSfZqVgbKd+oYfw+SYFwVN+7jOlC21RhcG5zWKOlqeu+9/GedtmQNvn
 K2qveAB13BUIQBlvO8gK/KbGiTEyKkeCWsBsmkksGh+PAwGP+exdnaglc16o9g3ce50M
 cQegVUDBeeqtG7toIbbN8qEUL9phsyYYnB/p9fWmhS6GTTVQs7C1GwruxCRCsA2vn+8m
 YhvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CXDbZ72EhvPIsbyJ5EezoEwlOzUgft6D4XqjM/k4Tos=;
 b=tSx0d2pLZ2NDYUefOmLr89irR9Sliph+SSUmv4HTw28fISwGNrvmHg2ypQHnjT15Uc
 3f5KRtLTRy8EV+lmsdsdsb012cMm7IGtJM0XQpIX+Z+KvkfGkNw1Zyc1MMKbZBTTknRy
 o3QxKVSq8/ASmky+tYl8fNajglFfLmKBf7dYu2yNX0uwD9Ts2VhR8xqVMQRo6soIWOP5
 4w2g0nLDG0o2n364kFgu92BvDF8AKvqjMbrlilONrgG3HuwvRS2v1DzuHO4sYva4hMJG
 u+jvTG1Z13k69kLGN0SI83sNG5CUN11M+axHYHSHaRVQdSvrsYJdvfHlvoJQUpiZSsbJ
 nZgw==
X-Gm-Message-State: AOAM530Unw8PEe/Rl7qY/MLdXquIN0IOAQGdNSDH1Auk40T2o7RjCpPn
 LhcoLIwLeVufy53hYDrUqkHJE2/QZnXuCeqija+2Pw==
X-Google-Smtp-Source: ABdhPJzffgWI5BpJ72eaC/aE9on/1jFRzBqZ0PO6HX1zF1PGpy7gZGBrO+0xBSdDIZvjqofZjzR0DSV1/EJw8UQpHro=
X-Received: by 2002:a7b:c256:: with SMTP id b22mr34822265wmj.176.1639371970299; 
 Sun, 12 Dec 2021 21:06:10 -0800 (PST)
MIME-Version: 1.0
References: <20211210100732.1080-1-jiangyifei@huawei.com>
 <20211210100732.1080-11-jiangyifei@huawei.com>
In-Reply-To: <20211210100732.1080-11-jiangyifei@huawei.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 13 Dec 2021 10:35:59 +0530
Message-ID: <CAAhSdy11yd+f6OZZxjX9mWxkVH4AC7Kz5Vp+RPUz6cCam9GvNQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/12] target/riscv: Add kvm_riscv_get/put_regs_timer
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
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::335;
 envelope-from=anup@brainfault.org; helo=mail-wm1-x335.google.com
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
X-List-Received-Date: Mon, 13 Dec 2021 05:06:13 -0000

On Fri, Dec 10, 2021 at 3:37 PM Yifei Jiang <jiangyifei@huawei.com> wrote:
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
>  target/riscv/cpu.h |  7 +++++
>  target/riscv/kvm.c | 72 ++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 79 insertions(+)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index e7dba35acb..c892a2c8b7 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -259,6 +259,13 @@ struct CPURISCVState {
>
>      hwaddr kernel_addr;
>      hwaddr fdt_addr;
> +
> +    /* kvm timer */
> +    bool kvm_timer_dirty;
> +    uint64_t kvm_timer_time;
> +    uint64_t kvm_timer_compare;
> +    uint64_t kvm_timer_state;
> +    uint64_t kvm_timer_frequency;
>  };
>
>  OBJECT_DECLARE_TYPE(RISCVCPU, RISCVCPUClass,
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index 171a32adf9..802c076b22 100644
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
> @@ -235,6 +238,75 @@ static int kvm_riscv_put_regs_fp(CPUState *cs)
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

Please read the timer frequency here.

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

Over here, we should get the timer frequency and abort() with an
error message if it does not match env->kvm_timer_frequency

For now, migration will not work between Hosts with different
timer frequency.

Regards,
Anup

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

