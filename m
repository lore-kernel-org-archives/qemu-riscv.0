Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mt1vq-0001MT-E6
	for mharc-qemu-riscv@gnu.org; Fri, 03 Dec 2021 01:20:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mt1vp-0001L7-A2
 for qemu-riscv@nongnu.org; Fri, 03 Dec 2021 01:20:29 -0500
Received: from [2a00:1450:4864:20::32d] (port=39746
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mt1vm-0001Eo-RL
 for qemu-riscv@nongnu.org; Fri, 03 Dec 2021 01:20:29 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 n33-20020a05600c502100b0032fb900951eso4013081wmr.4
 for <qemu-riscv@nongnu.org>; Thu, 02 Dec 2021 22:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/3va/pCm2+lgIP7wgFl0KWgrsAldqC5qmmGmCVaaa0s=;
 b=JnV91t9CzVZNp+7ARVQtVb+rHXUwELdxD7AfULeML9AGRKu2COE6kzcQHCuQ93OXKB
 Cw1RF2tp/WbX2/mwkKeyJJZJEMrFOGrkuIEnGynwlXONMdt3pqQhUXPwjdw27V+BYrTp
 2PmEvR/yt65VGKFR62l7EJm0m9RsAurfnWHOOFVEcCA45Unj7FmtDOStwP02k02WzDpY
 pLI9DIDwJQzeC35DcLrfY1wJcrL1kQ+V8cFnWsutKON8xFWR9QbUatJqHbpGMdfduETw
 YLHFwZtRo23pGJHg7OI6RaIIpaC5AA7As97ob2s7zannHlQ/UnV+p/8ARR3oaDqE3STn
 mklA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/3va/pCm2+lgIP7wgFl0KWgrsAldqC5qmmGmCVaaa0s=;
 b=loOVBuDYzozDzecH7uwV1sByvS/Z6ki6j/C4mTgLbDigv1UMoKLJVYsTACrKzAkIkT
 5oZ89DrzXCEQQhxa8Qwo63SLazvsuLaS2TVeR5PHZyJG65MwLHRkn8aXbu664C/f3KYu
 BHMwYDzoGQ4KhqJmmUbthUFAVRoTU3xkAYoaDkTHcaU3q8YuSFi5LaYV0mAQZL3c0c7O
 7ZP6SuSetJUUuSvVDTn5EO/PqEl2bCUHqf/c7s3V4aO9ObKjqsS1CdrrTVsRHn9D8icZ
 5mI0HnwJr/F5oyz713SgVUtDEOeC6TREHcmgckMdLrvPfEcF2I6oHglqW8VVkEwnFNBX
 w5hw==
X-Gm-Message-State: AOAM530B99ZRHv2+L+Cv5URxfoIFhLyTIVQ4Yzjxrt+v9ie04SXOw2TV
 wfsfGyJyRcdY2WnXksLOOGfOUrqSjnGYmqbMFC58JQ==
X-Google-Smtp-Source: ABdhPJz9y1XCwJi9YPIQOYXvTyTFvwc6jUzGcaWbytAXXTrxY6JpkwRLyEwMi7rK2sjwI8sZz+QFIFyB5+yGqcbLSh4=
X-Received: by 2002:a7b:c017:: with SMTP id c23mr12379673wmb.137.1638512424299; 
 Thu, 02 Dec 2021 22:20:24 -0800 (PST)
MIME-Version: 1.0
References: <20211120074644.729-1-jiangyifei@huawei.com>
 <20211120074644.729-5-jiangyifei@huawei.com>
In-Reply-To: <20211120074644.729-5-jiangyifei@huawei.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 3 Dec 2021 11:50:13 +0530
Message-ID: <CAAhSdy2gFufV4Xuu9Ewn2htLRB8SZ+xohbAnjYmnM1D_xMQP4A@mail.gmail.com>
Subject: Re: [PATCH v1 04/12] target/riscv: Implement kvm_arch_get_registers
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
X-List-Received-Date: Fri, 03 Dec 2021 06:20:29 -0000

On Sat, Nov 20, 2021 at 1:17 PM Yifei Jiang <jiangyifei@huawei.com> wrote:
>
> Get GPR CSR and FP registers from kvm by KVM_GET_ONE_REG ioctl.
>
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Mingwang Li <limingwang@huawei.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/kvm.c | 150 ++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 149 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index 9f9692fb9e..b49c24be0a 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -55,13 +55,161 @@ static uint64_t kvm_riscv_reg_id(CPURISCVState *env, uint64_t type, uint64_t idx
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
> +        uint64_t id = kvm_riscv_reg_id(env, KVM_REG_RISCV_CORE, i);
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
> +    env->stval = reg;
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

There is a common pattern in above kvm_get_one_reg() calls so I suggest
creating a macro for repeating code patterns. This can help us to have one
line for each CSR and in future it is easy to add more CSRs.

Regards,
Anup

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
> --
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

