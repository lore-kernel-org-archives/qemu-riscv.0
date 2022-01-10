Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n6oYU-0001nk-Sn
	for mharc-qemu-riscv@gnu.org; Mon, 10 Jan 2022 01:53:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n6oY3-0001kt-CZ; Mon, 10 Jan 2022 01:52:59 -0500
Received: from [2607:f8b0:4864:20::136] (port=43752
 helo=mail-il1-x136.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n6oY1-00070D-Fd; Mon, 10 Jan 2022 01:52:54 -0500
Received: by mail-il1-x136.google.com with SMTP id d3so10468971ilr.10;
 Sun, 09 Jan 2022 22:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NsHy/5+QqdRkw9PRCfJEH7Dt5lwaLVOXuuF/YTlBNDo=;
 b=i7xiKxfaUBWmIoZobYONW7nX9gl4AMWo6xkTTxlqHPo2S/1OY7xqIQouMJaI/xvI8i
 nYXOeFw5G3mggy++oBVY7JyKQ5nzFMiS6M3N2tQgfiM5+rn3C9UkbZZKFty0tMmvFuXG
 DhqDJx+CK9MEHv53jkN485g5iHjq4pnSLnJPs51tKQu+/m0Iyo3iPx+hJoWKPtrKOFcX
 wp0Pz7Z8gZZIdf4Ap9TEaW7O8YlKU8HoNJlF4vAWpZXmWBgV6EtJcdNk33lHWcAipgpu
 liTIKAtds+c4x3/5deERulaAw4D+hsc5V877Nc78Dtl0gD7EabVfcvfUE0x2XvQXl6/o
 G5Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NsHy/5+QqdRkw9PRCfJEH7Dt5lwaLVOXuuF/YTlBNDo=;
 b=5qLERdAyNuw/gEKIHEHKZp58JvTZEyg8QE+CVz8giLZbp+WkDEVlKC7oREWIl0mfZS
 VOWyoJQ1p5S0XUXnAnbsngjBG3E5YkPfKqoEcv30p7uGnFPrUSz4I74wNLsYe3LsbRW0
 19T/96CUmBhv8gn1Fp1rLG/g8O+cSNGyx4FQ8m/6aHw2UEErJwD/tg+PVzw7kxLPz/xk
 StmGw6wnTrFUkP6byGcjG3Uxo5Mv7/wWvI4y26upnwHrb6fsJdMluhXozBF8W7BfY/8b
 sn8nMaPRfK7DvpLI+onmvK03UjNdCqcfgsOGWzJQVooTUod/UDpy41w2+6Sl/pSLNtHL
 UFLQ==
X-Gm-Message-State: AOAM531TB8fVCpsA72LaQchPAgWbY0R2dyAXQGEOJHNafBBbcLQ47J9l
 ccP+MNncZerCYwdalnYgU02hY+gXrttGUPXRAjY=
X-Google-Smtp-Source: ABdhPJygbB7GMhaRJpQW+IQxT6619gQbWeRuqgIM0D4IA7qith9Sd+meHXb0l4kT2zCQC/Dt+IO/QxRpx+PE1z+nmOw=
X-Received: by 2002:a05:6e02:1806:: with SMTP id
 a6mr32172727ilv.221.1641797571979; 
 Sun, 09 Jan 2022 22:52:51 -0800 (PST)
MIME-Version: 1.0
References: <20220110013831.1594-1-jiangyifei@huawei.com>
 <20220110013831.1594-11-jiangyifei@huawei.com>
In-Reply-To: <20220110013831.1594-11-jiangyifei@huawei.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 10 Jan 2022 16:52:25 +1000
Message-ID: <CAKmqyKNb4eDQVm4tMz1VJk006Y=X7tpuG8dAQ1Uuj02mHMMbKg@mail.gmail.com>
Subject: Re: [PATCH v4 10/12] target/riscv: Add kvm_riscv_get/put_regs_timer
To: Yifei Jiang <jiangyifei@huawei.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 kvm-riscv@lists.infradead.org, "open list:Overall" <kvm@vger.kernel.org>,
 libvir-list@redhat.com, 
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 fanliang@huawei.com, 
 "Wubin (H)" <wu.wubin@huawei.com>, wanghaibin.wang@huawei.com,
 wanbo13@huawei.com, 
 Mingwang Li <limingwang@huawei.com>, Anup Patel <anup.patel@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::136
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::136;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x136.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 10 Jan 2022 06:53:09 -0000

On Mon, Jan 10, 2022 at 11:54 AM Yifei Jiang via <qemu-devel@nongnu.org> wrote:
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
> Reviewed-by: Anup Patel <anup.patel@wdc.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.h |  7 +++++
>  target/riscv/kvm.c | 72 ++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 79 insertions(+)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 5f54fae7cc..9eceded96c 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -261,6 +261,13 @@ struct CPURISCVState {
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
> index ded2a8c29d..b1f1d55f29 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -40,6 +40,7 @@
>  #include "kvm_riscv.h"
>  #include "sbi_ecall_interface.h"
>  #include "chardev/char-fe.h"
> +#include "migration/migration.h"
>
>  static uint64_t kvm_riscv_reg_id(CPURISCVState *env, uint64_t type, uint64_t idx)
>  {
> @@ -64,6 +65,9 @@ static uint64_t kvm_riscv_reg_id(CPURISCVState *env, uint64_t type, uint64_t idx
>  #define RISCV_CSR_REG(env, name)  kvm_riscv_reg_id(env, KVM_REG_RISCV_CSR, \
>                   KVM_REG_RISCV_CSR_REG(name))
>
> +#define RISCV_TIMER_REG(env, name)  kvm_riscv_reg_id(env, KVM_REG_RISCV_TIMER, \
> +                 KVM_REG_RISCV_TIMER_REG(name))
> +
>  #define RISCV_FP_F_REG(env, idx)  kvm_riscv_reg_id(env, KVM_REG_RISCV_FP_F, idx)
>
>  #define RISCV_FP_D_REG(env, idx)  kvm_riscv_reg_id(env, KVM_REG_RISCV_FP_D, idx)
> @@ -84,6 +88,22 @@ static uint64_t kvm_riscv_reg_id(CPURISCVState *env, uint64_t type, uint64_t idx
>          } \
>      } while(0)
>
> +#define KVM_RISCV_GET_TIMER(cs, env, name, reg) \
> +    do { \
> +        int ret = kvm_get_one_reg(cs, RISCV_TIMER_REG(env, name), &reg); \
> +        if (ret) { \
> +            abort(); \
> +        } \
> +    } while(0)
> +
> +#define KVM_RISCV_SET_TIMER(cs, env, name, reg) \
> +    do { \
> +        int ret = kvm_set_one_reg(cs, RISCV_TIMER_REG(env, time), &reg); \
> +        if (ret) { \
> +            abort(); \
> +        } \
> +    } while (0)
> +
>  static int kvm_riscv_get_regs_core(CPUState *cs)
>  {
>      int ret = 0;
> @@ -235,6 +255,58 @@ static int kvm_riscv_put_regs_fp(CPUState *cs)
>      return ret;
>  }
>
> +static void kvm_riscv_get_regs_timer(CPUState *cs)
> +{
> +    CPURISCVState *env = &RISCV_CPU(cs)->env;
> +
> +    if (env->kvm_timer_dirty) {
> +        return;
> +    }
> +
> +    KVM_RISCV_GET_TIMER(cs, env, time, env->kvm_timer_time);
> +    KVM_RISCV_GET_TIMER(cs, env, compare, env->kvm_timer_compare);
> +    KVM_RISCV_GET_TIMER(cs, env, state, env->kvm_timer_state);
> +    KVM_RISCV_GET_TIMER(cs, env, frequency, env->kvm_timer_frequency);
> +
> +    env->kvm_timer_dirty = true;
> +}
> +
> +static void kvm_riscv_put_regs_timer(CPUState *cs)
> +{
> +    uint64_t reg;
> +    CPURISCVState *env = &RISCV_CPU(cs)->env;
> +
> +    if (!env->kvm_timer_dirty) {
> +        return;
> +    }
> +
> +    KVM_RISCV_SET_TIMER(cs, env, time, env->kvm_timer_time);
> +    KVM_RISCV_SET_TIMER(cs, env, compare, env->kvm_timer_compare);
> +
> +    /*
> +     * To set register of RISCV_TIMER_REG(state) will occur a error from KVM
> +     * on env->kvm_timer_state == 0, It's better to adapt in KVM, but it
> +     * doesn't matter that adaping in QEMU now.
> +     * TODO If KVM changes, adapt here.
> +     */
> +    if (env->kvm_timer_state) {
> +        KVM_RISCV_SET_TIMER(cs, env, state, env->kvm_timer_state);
> +    }
> +
> +    /*
> +     * For now, migration will not work between Hosts with different timer
> +     * frequency. Therefore, we should check whether they are the same here
> +     * during the migration.
> +     */
> +    if (migration_is_running(migrate_get_current()->state)) {
> +        KVM_RISCV_GET_TIMER(cs, env, frequency, reg);
> +        if (reg != env->kvm_timer_frequency) {
> +            error_report("Dst Hosts timer frequency != Src Hosts");
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

