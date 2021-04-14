Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lWoBI-0007Ya-MK
	for mharc-qemu-riscv@gnu.org; Wed, 14 Apr 2021 18:40:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lWoBG-0007YN-SL; Wed, 14 Apr 2021 18:40:18 -0400
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c]:37729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lWoBF-0005wd-0m; Wed, 14 Apr 2021 18:40:18 -0400
Received: by mail-il1-x12c.google.com with SMTP id j12so4633810ils.4;
 Wed, 14 Apr 2021 15:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n7d5Pcc0VNYj7xJiDh9xXCDiQUNA26uEPx/UGxLUN40=;
 b=ua6Sag9BHfyRiKrYpjN1/P7tMimT7WvVKQ1INLqttw5yMrRxxFJIIX6wCCYdvzk33b
 jKrglZ0aHu52HZSuSH3xtYVaSjmmEmvjXSFSX5r0vcY2Lrhy8r2o6J9oK+tvAoPe0eks
 H3W0LenlTtoCoUYa9QpnS6tOda+y30lRJevL1BAwXxFKqhC8R4azUnSJKpFy06dskhhV
 5WELmDUCJp5NV+ocMRQlkha0UvLSsrGJJAhvqI8v/3EzuCg5VQiMu0VAudIy0FEEJ8Fg
 q1OmikIADtLWQDDMzDf7jF1JAs52pKgcFx9+zVs8cFfoaHZ4i6OX2o0kkGO+bXOvE6qE
 WaXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n7d5Pcc0VNYj7xJiDh9xXCDiQUNA26uEPx/UGxLUN40=;
 b=ATe+5uNPlLEC27fpThVw6m7qPCp0Z1ZA+XnXJk2Mi0C5EcA0Y2vJTuznCnUMEe2qGu
 acBEG0Peu3BW4tt1PCCXzc+NqRz5pXRY9Bh+/Ni0nU69z5BXtpe0l/zsJ4ZC9n+lhmDU
 IeQ6TfOTXloueSYPPrJCiSoGJy4ibtLZmbAE3G3q5YXb9dcEl08VjqZ6Wj4x8mecOEZy
 RweiHC25C5lHfgB9xolz5utGEBRcCVHmbzfOKlyAT8GvXx1izJMD6YKAAKjDzgWvE8Eg
 0812nuz7J6kw6Ns7WZPdm7dRoKjkNBIGZiCJF7BzhAoBQe9GaoqaalY4TxU3y8D77ETL
 vIgw==
X-Gm-Message-State: AOAM53197vyzzPUBfPHP58R5zKv1f++LM3WtugG/0YVXMCoVcEtnyY6u
 v23rXWVFz0QELXVB2q5j61++UFJQR8/gpAqZ7c8=
X-Google-Smtp-Source: ABdhPJz0bHcyFH6loQKbB7SM4wJ2UxXqwZ4IQTDo24LsulLKqareNjVZld6J05qf/+twje9vI0eg82HjMRHuvoPSVkU=
X-Received: by 2002:a92:d90f:: with SMTP id s15mr408088iln.227.1618440015373; 
 Wed, 14 Apr 2021 15:40:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210412065246.1853-1-jiangyifei@huawei.com>
 <20210412065246.1853-5-jiangyifei@huawei.com>
In-Reply-To: <20210412065246.1853-5-jiangyifei@huawei.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 15 Apr 2021 08:39:49 +1000
Message-ID: <CAKmqyKPnrhC9c2ek5ZetoHaDHir52ihEKzRCXHioOqMNvnVknQ@mail.gmail.com>
Subject: Re: [PATCH RFC v5 04/12] target/riscv: Implement
 kvm_arch_get_registers
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::12c;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12c.google.com
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
X-List-Received-Date: Wed, 14 Apr 2021 22:40:19 -0000

On Mon, Apr 12, 2021 at 4:58 PM Yifei Jiang <jiangyifei@huawei.com> wrote:
>
> Get GPR CSR and FP registers from kvm by KVM_GET_ONE_REG ioctl.
>
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Yipeng Yin <yinyipeng1@huawei.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/kvm.c | 150 ++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 149 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index 0d924be33f..63485d7b65 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -50,13 +50,161 @@ static __u64 kvm_riscv_reg_id(CPURISCVState *env, __u64 type, __u64 idx)
>      return id;
>  }
>
> +#define RISCV_CORE_REG(env, name)  kvm_riscv_reg_id(env, KVM_REG_RISCV_CORE, \
> +                 KVM_REG_RISCV_CORE_REG(name))
> +
> +#define RISCV_CSR_REG(env, name)  kvm_riscv_reg_id(env, KVM_REG_RISCV_CSR, \
> +                 KVM_REG_RISCV_CSR_REG(name))
> +
> +#define RISCV_FP_F_REG(env, idx)  kvm_riscv_reg_id(env, KVM_REG_RISCV_FP_F, idx)
> +
> +#define RISCV_FP_D_REG(env, idx)  kvm_riscv_reg_id(env, KVM_REG_RISCV_FP_D, idx)
> +
> +static int kvm_riscv_get_regs_core(CPUState *cs)
> +{
> +    int ret = 0;
> +    int i;
> +    target_ulong reg;
> +    CPURISCVState *env = &RISCV_CPU(cs)->env;
> +
> +    ret = kvm_get_one_reg(cs, RISCV_CORE_REG(env, regs.pc), &reg);
> +    if (ret) {
> +        return ret;
> +    }
> +    env->pc = reg;
> +
> +    for (i = 1; i < 32; i++) {
> +        __u64 id = kvm_riscv_reg_id(env, KVM_REG_RISCV_CORE, i);
> +        ret = kvm_get_one_reg(cs, id, &reg);
> +        if (ret) {
> +            return ret;
> +        }
> +        env->gpr[i] = reg;
> +    }
> +
> +    return ret;
> +}
> +
> +static int kvm_riscv_get_regs_csr(CPUState *cs)
> +{
> +    int ret = 0;
> +    target_ulong reg;
> +    CPURISCVState *env = &RISCV_CPU(cs)->env;
> +
> +    ret = kvm_get_one_reg(cs, RISCV_CSR_REG(env, sstatus), &reg);
> +    if (ret) {
> +        return ret;
> +    }
> +    env->mstatus = reg;
> +
> +    ret = kvm_get_one_reg(cs, RISCV_CSR_REG(env, sie), &reg);
> +    if (ret) {
> +        return ret;
> +    }
> +    env->mie = reg;
> +
> +    ret = kvm_get_one_reg(cs, RISCV_CSR_REG(env, stvec), &reg);
> +    if (ret) {
> +        return ret;
> +    }
> +    env->stvec = reg;
> +
> +    ret = kvm_get_one_reg(cs, RISCV_CSR_REG(env, sscratch), &reg);
> +    if (ret) {
> +        return ret;
> +    }
> +    env->sscratch = reg;
> +
> +    ret = kvm_get_one_reg(cs, RISCV_CSR_REG(env, sepc), &reg);
> +    if (ret) {
> +        return ret;
> +    }
> +    env->sepc = reg;
> +
> +    ret = kvm_get_one_reg(cs, RISCV_CSR_REG(env, scause), &reg);
> +    if (ret) {
> +        return ret;
> +    }
> +    env->scause = reg;
> +
> +    ret = kvm_get_one_reg(cs, RISCV_CSR_REG(env, stval), &reg);
> +    if (ret) {
> +        return ret;
> +    }
> +    env->sbadaddr = reg;
> +
> +    ret = kvm_get_one_reg(cs, RISCV_CSR_REG(env, sip), &reg);
> +    if (ret) {
> +        return ret;
> +    }
> +    env->mip = reg;
> +
> +    ret = kvm_get_one_reg(cs, RISCV_CSR_REG(env, satp), &reg);
> +    if (ret) {
> +        return ret;
> +    }
> +    env->satp = reg;
> +
> +    return ret;
> +}
> +
> +static int kvm_riscv_get_regs_fp(CPUState *cs)
> +{
> +    int ret = 0;
> +    int i;
> +    CPURISCVState *env = &RISCV_CPU(cs)->env;
> +
> +    if (riscv_has_ext(env, RVD)) {
> +        uint64_t reg;
> +        for (i = 0; i < 32; i++) {
> +            ret = kvm_get_one_reg(cs, RISCV_FP_D_REG(env, i), &reg);
> +            if (ret) {
> +                return ret;
> +            }
> +            env->fpr[i] = reg;
> +        }
> +        return ret;
> +    }
> +
> +    if (riscv_has_ext(env, RVF)) {
> +        uint32_t reg;
> +        for (i = 0; i < 32; i++) {
> +            ret = kvm_get_one_reg(cs, RISCV_FP_F_REG(env, i), &reg);
> +            if (ret) {
> +                return ret;
> +            }
> +            env->fpr[i] = reg;
> +        }
> +        return ret;
> +    }
> +
> +    return ret;
> +}
> +
>  const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
>      KVM_CAP_LAST_INFO
>  };
>
>  int kvm_arch_get_registers(CPUState *cs)
>  {
> -    return 0;
> +    int ret = 0;
> +
> +    ret = kvm_riscv_get_regs_core(cs);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    ret = kvm_riscv_get_regs_csr(cs);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    ret = kvm_riscv_get_regs_fp(cs);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    return ret;
>  }
>
>  int kvm_arch_put_registers(CPUState *cs, int level)
> --
> 2.19.1
>
>

