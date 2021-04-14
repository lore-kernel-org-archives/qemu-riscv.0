Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lWoHQ-0000Wh-JQ
	for mharc-qemu-riscv@gnu.org; Wed, 14 Apr 2021 18:46:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lWoHO-0000WS-DG; Wed, 14 Apr 2021 18:46:38 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:45000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lWoHM-0001e0-Bu; Wed, 14 Apr 2021 18:46:38 -0400
Received: by mail-io1-xd30.google.com with SMTP id p8so897310iol.11;
 Wed, 14 Apr 2021 15:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tD31o03cwWU2/UEkF/mBgAJtCepUfts3vL4bqT0X5lA=;
 b=uKdPZ/IThFmw7R+mG1RV1UVUXEvH4bzxByzfuoOy1bnO4JZztN49MKhEjF41UuAXIw
 aDJekHldA3vXOYgav6uR6diW8o8G3yZAHNH+Dq/hbkwVwvMaihJQSM5fICBSlCfQ5Hz9
 oHAU0Bfw/WvZJsYf/oqCRoyuLgh061BnM9tzE/AYPEvvX/5tAvSJY2FNkBz4kxFt017X
 d+lQgt1l1WQT+MnaW1UI8Sb1cJFYYlO/cPIoA/fW2YzL8aFhynJruicIcfnIFWpiHaeE
 YcYFh/dHuHNqQ09EsAtgr9vtQpLdroJcQVuzBYaaknfgt9U4y4is6iTLPpibSd5tAwZx
 8ldg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tD31o03cwWU2/UEkF/mBgAJtCepUfts3vL4bqT0X5lA=;
 b=N8egHHDIC4iC8ROdoC33NmDCHS7oFQv1Sst8wE7fxwsXBqh/mmfmnd/RR33QwCn7nl
 nbz9lXT8GrMQJ2sXd82zY2mu66ETkIgYCVT9hFHDqsnZWF7PWizYKmc4ag1ChFxUXx0l
 cb4HvKyowWqVULFH5D8u7D+AG/36+T4xCY29wYggNalXpwCtFkj9AphqD5QJJz9L1VUx
 vj2b+UVCx2fsjBAqPUIfcXQ+CxyokUzTZ1HEtOY7vevYD0ksxrdGXU6zm93kIBTT6ehO
 ciXYrt+qfNCNffJlARCpFajfW1ZMa0hdZ66EYL/kbXVnxSplD6fOGhGN/sasFOVfnbc7
 obyQ==
X-Gm-Message-State: AOAM531hlYvc4EZlfBdOyrCXbmUv9OOLaf6nJRAFmR9wLSddSXGpyuDV
 uIaUN4MOPmOVGIl8gwwKnkG9tL5YONzSTVd5moc=
X-Google-Smtp-Source: ABdhPJyPkwX8w60HMCIVLkOx1pGysb2sABms6XxME3eWDjxdh8gBwAa0StYXVahp2/0GWlMHQ5JKweUj7CBbzyVoqd4=
X-Received: by 2002:a6b:7808:: with SMTP id j8mr302634iom.118.1618440393777;
 Wed, 14 Apr 2021 15:46:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210412065246.1853-1-jiangyifei@huawei.com>
 <20210412065246.1853-6-jiangyifei@huawei.com>
In-Reply-To: <20210412065246.1853-6-jiangyifei@huawei.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 15 Apr 2021 08:46:07 +1000
Message-ID: <CAKmqyKMgh0uTSoUrJW8O73i37rpwFoz7s1QZNgNf+8HKBfXRnA@mail.gmail.com>
Subject: Re: [PATCH RFC v5 05/12] target/riscv: Implement
 kvm_arch_put_registers
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::d30;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd30.google.com
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
X-List-Received-Date: Wed, 14 Apr 2021 22:46:39 -0000

On Mon, Apr 12, 2021 at 4:56 PM Yifei Jiang <jiangyifei@huawei.com> wrote:
>
> Put GPR CSR and FP registers to kvm by KVM_SET_ONE_REG ioctl
>
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Yipeng Yin <yinyipeng1@huawei.com>
> ---
>  target/riscv/kvm.c | 142 ++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 141 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index 63485d7b65..9d1441952a 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -85,6 +85,31 @@ static int kvm_riscv_get_regs_core(CPUState *cs)
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
> +        __u64 id = kvm_riscv_reg_id(env, KVM_REG_RISCV_CORE, i);

Can you use uint64_t for the entire series instead?

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
> @@ -148,6 +173,70 @@ static int kvm_riscv_get_regs_csr(CPUState *cs)
>      return ret;
>  }
>
> +static int kvm_riscv_put_regs_csr(CPUState *cs)
> +{
> +    int ret = 0;
> +    target_ulong reg;
> +    CPURISCVState *env = &RISCV_CPU(cs)->env;
> +
> +    reg = env->mstatus;
> +    ret = kvm_set_one_reg(cs, RISCV_CSR_REG(env, sstatus), &reg);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    reg = env->mie;
> +    ret = kvm_set_one_reg(cs, RISCV_CSR_REG(env, sie), &reg);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    reg = env->stvec;
> +    ret = kvm_set_one_reg(cs, RISCV_CSR_REG(env, stvec), &reg);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    reg = env->sscratch;
> +    ret = kvm_set_one_reg(cs, RISCV_CSR_REG(env, sscratch), &reg);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    reg = env->sepc;
> +    ret = kvm_set_one_reg(cs, RISCV_CSR_REG(env, sepc), &reg);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    reg = env->scause;
> +    ret = kvm_set_one_reg(cs, RISCV_CSR_REG(env, scause), &reg);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    reg = env->sbadaddr;

This will change soon-ish as my next PR converts this to stval.

> +    ret = kvm_set_one_reg(cs, RISCV_CSR_REG(env, stval), &reg);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    reg = env->mip;
> +    ret = kvm_set_one_reg(cs, RISCV_CSR_REG(env, sip), &reg);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    reg = env->satp;
> +    ret = kvm_set_one_reg(cs, RISCV_CSR_REG(env, satp), &reg);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    return ret;
> +}
> +
> +

Double line here.

Otherwise:

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>  static int kvm_riscv_get_regs_fp(CPUState *cs)
>  {
>      int ret = 0;
> @@ -181,6 +270,40 @@ static int kvm_riscv_get_regs_fp(CPUState *cs)
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
> @@ -209,7 +332,24 @@ int kvm_arch_get_registers(CPUState *cs)
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
>

