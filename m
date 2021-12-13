Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mwcla-0006Rf-Vi
	for mharc-qemu-riscv@gnu.org; Sun, 12 Dec 2021 23:16:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mwclZ-0006OG-81
 for qemu-riscv@nongnu.org; Sun, 12 Dec 2021 23:16:45 -0500
Received: from [2a00:1450:4864:20::432] (port=34713
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mwclX-0002sU-2s
 for qemu-riscv@nongnu.org; Sun, 12 Dec 2021 23:16:44 -0500
Received: by mail-wr1-x432.google.com with SMTP id j3so24919742wrp.1
 for <qemu-riscv@nongnu.org>; Sun, 12 Dec 2021 20:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kr5T/TfAr5RHzp2pbsiukOnL5ToQSl7CSqwITkm4EJA=;
 b=N+vMPjjSS0/hzhWVQGnr0Yk85Y/hPAj1H8um5240b+2x4sljGdN4fz9SqmlVhJ/uD3
 nlvnkOPVPrPspyQzF+yBl2cL9FDC2AppR/4Y8HAzRiFltYAfkKNoDQKlTHQs3sm4do+0
 XwtKFXXbrZC1g2Tr7BshA2MvzBZw+To/HuyMsXG5WuHRjgC4jYBC9G0h4ggFMx2rowtT
 kA4HHEna4ziENLLAg2YynLYcHyJeyEN1/4EUJtu1wVdfHkSv/gMJ280eShq4z6ExBoKF
 QbhMonaNSluDTdOSxD8cm8MFwnVoEgcK+78q0Tj4NRWYTIKX03MknyHzL0vHcM1nzikq
 AP/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kr5T/TfAr5RHzp2pbsiukOnL5ToQSl7CSqwITkm4EJA=;
 b=MIgGl+Swx8YYeb7l9lffqLu0oguaVT4JI/ta1rAHQcq94Xr0UmiP0J1ipuhQ0QDkPB
 Q8ZzTQ9My9h+uU+5baf4heCIb1mYuc2ESPkiebic9lIOUAvFOmNr9hbgKDzFeFZwt3L6
 2Y/JMuw1L0dxrizfeWFWafH7bVfQ+yIycPAI8lASZ8CzRuLx2sX/+pplMoRkYm2jeTNl
 vhitK/BjLm6BwuI8womt/WoRqZZdN6Eol1kguuV/hka6lXdUU5zrPOCk9GekNkynoIN6
 NmIqv6OWGrYhsPvkG/bZDz6V3QBN88m0R6+y9DI9/JS7YrjFOm/3GWWbqjNSbwGPj8VG
 FB9g==
X-Gm-Message-State: AOAM532gOXnZ829KS0Yq1QPLungY3gYf1bI7xzgpgJ+IK2qn2LdqG7S/
 WEHOEo3J73yW/iZ4vNyic8CGKA3V5n9ahiMiiSlq7A==
X-Google-Smtp-Source: ABdhPJx8oBuEM7yPZW4YJdFrm+BDOSp3Xvi+sGHOAKArkqFl+YuWykSPhmqaaArV6kxGHuHOVwnThBGv7WHF2i5E2qc=
X-Received: by 2002:adf:eb0f:: with SMTP id s15mr13057967wrn.690.1639369000633; 
 Sun, 12 Dec 2021 20:16:40 -0800 (PST)
MIME-Version: 1.0
References: <20211210100732.1080-1-jiangyifei@huawei.com>
 <20211210100732.1080-5-jiangyifei@huawei.com>
In-Reply-To: <20211210100732.1080-5-jiangyifei@huawei.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 13 Dec 2021 09:46:29 +0530
Message-ID: <CAAhSdy124838mMoU61DfPH9T_rQGzvBURj0w57pHbM_Y0YVDRQ@mail.gmail.com>
Subject: Re: [PATCH v2 04/12] target/riscv: Implement kvm_arch_get_registers
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
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::432;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x432.google.com
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
X-List-Received-Date: Mon, 13 Dec 2021 04:16:45 -0000

On Fri, Dec 10, 2021 at 3:37 PM Yifei Jiang <jiangyifei@huawei.com> wrote:
>
> Get GPR CSR and FP registers from kvm by KVM_GET_ONE_REG ioctl.
>
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Mingwang Li <limingwang@huawei.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Looks good to me.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Regards,
Anup

> ---
>  target/riscv/kvm.c | 112 ++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 111 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index ccf3753048..6d4df0ef6d 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -55,13 +55,123 @@ static uint64_t kvm_riscv_reg_id(CPURISCVState *env, uint64_t type, uint64_t idx
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
> +#define KVM_RISCV_GET_CSR(cs, env, csr, reg) \
> +    do { \
> +        int ret = kvm_get_one_reg(cs, RISCV_CSR_REG(env, csr), &reg); \
> +        if (ret) { \
> +            return ret; \
> +        } \
> +    } while(0)
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
> +    CPURISCVState *env = &RISCV_CPU(cs)->env;
> +
> +    KVM_RISCV_GET_CSR(cs, env, sstatus, env->mstatus);
> +    KVM_RISCV_GET_CSR(cs, env, sie, env->mie);
> +    KVM_RISCV_GET_CSR(cs, env, stvec, env->stvec);
> +    KVM_RISCV_GET_CSR(cs, env, sscratch, env->sscratch);
> +    KVM_RISCV_GET_CSR(cs, env, sepc, env->sepc);
> +    KVM_RISCV_GET_CSR(cs, env, scause, env->scause);
> +    KVM_RISCV_GET_CSR(cs, env, stval, env->stval);
> +    KVM_RISCV_GET_CSR(cs, env, sip, env->mip);
> +    KVM_RISCV_GET_CSR(cs, env, satp, env->satp);
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

