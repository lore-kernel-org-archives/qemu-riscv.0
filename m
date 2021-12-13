Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mwcmA-0007YJ-0F
	for mharc-qemu-riscv@gnu.org; Sun, 12 Dec 2021 23:17:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mwcm7-0007W5-U1
 for qemu-riscv@nongnu.org; Sun, 12 Dec 2021 23:17:19 -0500
Received: from [2a00:1450:4864:20::430] (port=40870
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mwcm5-0003iY-Ly
 for qemu-riscv@nongnu.org; Sun, 12 Dec 2021 23:17:19 -0500
Received: by mail-wr1-x430.google.com with SMTP id t9so24870141wrx.7
 for <qemu-riscv@nongnu.org>; Sun, 12 Dec 2021 20:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BRcF4DfHIqBKfleTCwMXo7Eh2GKC1UVAwKmaROY7m7I=;
 b=gOf7znJnRp/h5O2fztIccS4KoXxriuRkiThU1N8MYSoL9PI/1oviF7q4UD265sEyMF
 eugDNLz6uXb28nQoKehYeaJgFE1nZred9DCYhsRDsUxKEEzrWWKirIOy6i3ZFOvvcSTz
 xkKZBAHuG0KAqSZy5jeNdvKwGF0HKouNX0TsDhiWTVTTRu5sVpAflcn/UOBMLJK4kXK8
 dguTLYt8sJeRsL2YCjkdhu3mrq595sYy7OGbxxuOJqM2MVMkap24c24az0daCH1Zl1UH
 UBR43OX312zJxpttPOJQYDo6OBCyLsZBJS/lXVPwoiaNukfnK2lzBDG7dmsLkE4QDGRF
 8mlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BRcF4DfHIqBKfleTCwMXo7Eh2GKC1UVAwKmaROY7m7I=;
 b=70nJp6blfIskdoG2EUb5hrvcBRUPdNPRAD8qXODP5e9+Zk9xSjBk0qo9NaSu1zvjOn
 a0LTiGyTrJqI7dnHBjxT5QpVKRbBc8ls2b80aAKqURq+dad4FckizVnTqRl0TYaVSGXh
 JE9aPSW3nH4RfaYMMQkWXvJ6MANQEgQvSIr4yI2ssL6/m4UfUl+2ahsTQ0oaR6QGcHCG
 75v5ZaoqUKc5SYL1IRgh8U+Wr/BZ7awx7qIQYcsYT9givi7J8zmN0inKJlLLeqmjgBzW
 8rg/t33NPpz++HtTgIDQ2jniKImelzi6Ah30JoAU0mUAUprijy2ZPeSxbDw6Uf+yYWVk
 yvXg==
X-Gm-Message-State: AOAM531C2Gt3Q8W689E8JtcO6oSli2aYfmhrWwBRmHALlB1lGSVM8Uo1
 WX8AAPzg4IcJFLrMTAb7x7/L7Mj1480DicwF4cZmuw==
X-Google-Smtp-Source: ABdhPJyrMlvAv+QC/NETimV1IGnrw4Sk4dxEyHVlUAtgjj2DIO55ZQ8nzuSGmUQRXlrveO21jWlOGUWxsL2jF/JGfVY=
X-Received: by 2002:adf:d082:: with SMTP id y2mr29944773wrh.214.1639369036422; 
 Sun, 12 Dec 2021 20:17:16 -0800 (PST)
MIME-Version: 1.0
References: <20211210100732.1080-1-jiangyifei@huawei.com>
 <20211210100732.1080-6-jiangyifei@huawei.com>
In-Reply-To: <20211210100732.1080-6-jiangyifei@huawei.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 13 Dec 2021 09:47:04 +0530
Message-ID: <CAAhSdy04riukdShAHxT4i0gvV5-Zt6fXLzCGS-aPZCcpxBq43g@mail.gmail.com>
Subject: Re: [PATCH v2 05/12] target/riscv: Implement kvm_arch_put_registers
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
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::430;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x430.google.com
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
X-List-Received-Date: Mon, 13 Dec 2021 04:17:20 -0000

On Fri, Dec 10, 2021 at 3:37 PM Yifei Jiang <jiangyifei@huawei.com> wrote:
>
> Put GPR CSR and FP registers to kvm by KVM_SET_ONE_REG ioctl
>
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Mingwang Li <limingwang@huawei.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Looks good to me.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Regards,
Anup

> ---
>  target/riscv/kvm.c | 104 ++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 103 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index 6d4df0ef6d..e695b91dc7 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -73,6 +73,14 @@ static uint64_t kvm_riscv_reg_id(CPURISCVState *env, uint64_t type, uint64_t idx
>          } \
>      } while(0)
>
> +#define KVM_RISCV_SET_CSR(cs, env, csr, reg) \
> +    do { \
> +        int ret = kvm_set_one_reg(cs, RISCV_CSR_REG(env, csr), &reg); \
> +        if (ret) { \
> +            return ret; \
> +        } \
> +    } while(0)
> +
>  static int kvm_riscv_get_regs_core(CPUState *cs)
>  {
>      int ret = 0;
> @@ -98,6 +106,31 @@ static int kvm_riscv_get_regs_core(CPUState *cs)
>      return ret;
>  }
>
> +static int kvm_riscv_put_regs_core(CPUState *cs)
> +{
> +    int ret = 0;
> +    int i;
> +    target_ulong reg;
> +    CPURISCVState *env = &RISCV_CPU(cs)->env;
> +
> +    reg = env->pc;
> +    ret = kvm_set_one_reg(cs, RISCV_CORE_REG(env, regs.pc), &reg);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    for (i = 1; i < 32; i++) {
> +        uint64_t id = kvm_riscv_reg_id(env, KVM_REG_RISCV_CORE, i);
> +        reg = env->gpr[i];
> +        ret = kvm_set_one_reg(cs, id, &reg);
> +        if (ret) {
> +            return ret;
> +        }
> +    }
> +
> +    return ret;
> +}
> +
>  static int kvm_riscv_get_regs_csr(CPUState *cs)
>  {
>      int ret = 0;
> @@ -115,6 +148,24 @@ static int kvm_riscv_get_regs_csr(CPUState *cs)
>      return ret;
>  }
>
> +static int kvm_riscv_put_regs_csr(CPUState *cs)
> +{
> +    int ret = 0;
> +    CPURISCVState *env = &RISCV_CPU(cs)->env;
> +
> +    KVM_RISCV_SET_CSR(cs, env, sstatus, env->mstatus);
> +    KVM_RISCV_SET_CSR(cs, env, sie, env->mie);
> +    KVM_RISCV_SET_CSR(cs, env, stvec, env->stvec);
> +    KVM_RISCV_SET_CSR(cs, env, sscratch, env->sscratch);
> +    KVM_RISCV_SET_CSR(cs, env, sepc, env->sepc);
> +    KVM_RISCV_SET_CSR(cs, env, scause, env->scause);
> +    KVM_RISCV_SET_CSR(cs, env, stval, env->stval);
> +    KVM_RISCV_SET_CSR(cs, env, sip, env->mip);
> +    KVM_RISCV_SET_CSR(cs, env, satp, env->satp);
> +
> +    return ret;
> +}
> +
>  static int kvm_riscv_get_regs_fp(CPUState *cs)
>  {
>      int ret = 0;
> @@ -148,6 +199,40 @@ static int kvm_riscv_get_regs_fp(CPUState *cs)
>      return ret;
>  }
>
> +static int kvm_riscv_put_regs_fp(CPUState *cs)
> +{
> +    int ret = 0;
> +    int i;
> +    CPURISCVState *env = &RISCV_CPU(cs)->env;
> +
> +    if (riscv_has_ext(env, RVD)) {
> +        uint64_t reg;
> +        for (i = 0; i < 32; i++) {
> +            reg = env->fpr[i];
> +            ret = kvm_set_one_reg(cs, RISCV_FP_D_REG(env, i), &reg);
> +            if (ret) {
> +                return ret;
> +            }
> +        }
> +        return ret;
> +    }
> +
> +    if (riscv_has_ext(env, RVF)) {
> +        uint32_t reg;
> +        for (i = 0; i < 32; i++) {
> +            reg = env->fpr[i];
> +            ret = kvm_set_one_reg(cs, RISCV_FP_F_REG(env, i), &reg);
> +            if (ret) {
> +                return ret;
> +            }
> +        }
> +        return ret;
> +    }
> +
> +    return ret;
> +}
> +
> +
>  const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
>      KVM_CAP_LAST_INFO
>  };
> @@ -176,7 +261,24 @@ int kvm_arch_get_registers(CPUState *cs)
>
>  int kvm_arch_put_registers(CPUState *cs, int level)
>  {
> -    return 0;
> +    int ret = 0;
> +
> +    ret = kvm_riscv_put_regs_core(cs);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    ret = kvm_riscv_put_regs_csr(cs);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    ret = kvm_riscv_put_regs_fp(cs);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    return ret;
>  }
>
>  int kvm_arch_release_virq_post(int virq)
> --
> 2.19.1
>

