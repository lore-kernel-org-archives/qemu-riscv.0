Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 408EAC369D1
	for <qemu-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 12:03:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u8Hls-0001wZ-6o; Fri, 25 Apr 2025 08:03:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1u8Hlm-0001v2-1P
 for qemu-riscv@nongnu.org; Fri, 25 Apr 2025 08:03:02 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1u8Hld-0001Um-PW
 for qemu-riscv@nongnu.org; Fri, 25 Apr 2025 08:03:01 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43ea40a6e98so20498565e9.1
 for <qemu-riscv@nongnu.org>; Fri, 25 Apr 2025 05:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1745582572; x=1746187372; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=t6lrEOtLiHSnUWbZGaR2P6WMRAiGvLxZTrI3R6tmPs8=;
 b=F4FNSQBeEMuNZBnbIRB0Z+ZZMkWWeF3croGDmbQjKGE2HW69zD3EjqdEm6zq33/z3h
 7JL7/jM7DCeNx+hZIrHpzF+nV33+ixpB0EQvy+xoNcov43iH1lzlBXcKc/JLY63vevmc
 mJN7uMz2qeacBls+X18dcryp7y8tdBYMS2swFk1EE61gOrFXU7MZvG3ctkl17dt6jjW7
 Y1sq6FaIVAx6M2q6oj+g27RAGhpp9AFGHocn2CYY1GL5g6WSnD1h1+lQJ73Af7jZrOie
 JfYglFL1y4fbe183va24yLixDWla48dyKO5+4Tw9d5N3GKE/mvzsR22HFdDsf50jptuF
 GSHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745582572; x=1746187372;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t6lrEOtLiHSnUWbZGaR2P6WMRAiGvLxZTrI3R6tmPs8=;
 b=kTJQ1PaNEiC96gRYG7UpwlXd0zoLYPnFP6h63LeH9WdLhex5tLaM8oXuXkzzz41/Jv
 ZFU+mKtjNO9FzHDrZYDwkEC53zX22zQSmtBkWjKjlOHGx5xC5UogkN9TBSx6EQ19DbxD
 3jkhDiRaZVoIs0kqodW5w/MMPIX0/dSsccGM2eezPwPLOOEQMkxiTTdV/I/d6vgO5V0U
 zgtx24jDmWzpcaPqQyDkeZZwtdBDA6Xxoq1KZsaOPlIuaZ+oANOHLFhYlHIeYkx+wOzJ
 kVEW3NDnmK6u+uYQONUy97Bt0S5/0Mh0UaJmihXzugUwbhYqhgq29i8B2q3pcX6yXOmC
 yeuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLCf3zq0fA+lnjMtxzSPX6xXsfe/rqDnUq/kDoh7fzvBSEby8RJMUI0zAwEFHcEpg4jryXE1V+h56m@nongnu.org
X-Gm-Message-State: AOJu0Yw65xTOuSTIvuKJSXfL1EkeGo4qq5aRF2/IJ+hwHccyUiFbzJsa
 ozeuw/YiJ2LOdHbHtzgMkvD1h1HBmgwaP0hNlRs6fCeqRlpfw/vH8BpUOCgSuJ0=
X-Gm-Gg: ASbGncs3dU9ZFGblDtJeb+O0cRWNugvAEgCotyLxO5wxk9Vx4JX6Sua2P3A4rZq8epT
 TkT3P231sKcrpNw8y63a7kVSkim5wmgtNEwFJbQM3fRK479svcU9lrqAi93bLUodRJ7+Tmecpju
 U+MATa+uHWDgCbrDKQ1SJNYdDG6HU/Im9UkJKtQ72uuGJtkOBTbY0GUw8CMjIxRdTHASHdY/Cpp
 Hm+f4Hx6w5DFZ3ZmnKXeVBETuQZ3gAmYxGGzsEGkSRJnXYL3/0CCSYgjr4AD/dZYaNGyUjtvmfD
 CNqeMYUV/5idYlwNZhX/4eqTpilC
X-Google-Smtp-Source: AGHT+IEfz932K2d5Y0LLK9b5Brgg9SUhzXSh/2n7N45SgVj4/6vcbWzo/Wl9U3tv4rEwNkWknDdyPA==
X-Received: by 2002:a05:600c:350e:b0:43b:c0fa:f9cd with SMTP id
 5b1f17b1804b1-440a64c13bamr13689945e9.7.1745582571528; 
 Fri, 25 Apr 2025 05:02:51 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::f716])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073e5da0dsm2103490f8f.88.2025.04.25.05.02.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 05:02:51 -0700 (PDT)
Date: Fri, 25 Apr 2025 14:02:50 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com, 
 Andrea Bolognani <abologna@redhat.com>
Subject: Re: [PATCH v2 6/9] target/riscv/kvm: do not read unavailable CSRs
Message-ID: <20250425-d08e2fd1627531f05e02d0ab@orel>
References: <20250425113705.2741457-1-dbarboza@ventanamicro.com>
 <20250425113705.2741457-7-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425113705.2741457-7-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Fri, Apr 25, 2025 at 08:37:02AM -0300, Daniel Henrique Barboza wrote:
> [1] reports that commit 4db19d5b21 broke a KVM guest running kernel 6.6.
> This happens because the kernel does not know 'senvcfg', making it
> unable to boot because QEMU is reading/wriiting it without any checks.
> 
> After converting the CSRs to do "automated" get/put reg procedures in
> the previous patch we can now scan for availability. Two functions are
> created:
> 
> - kvm_riscv_read_csr_cfg_legacy() will check if the CSR exists by brute
>   forcing KVM_GET_ONE_REG in each one of them, interpreting an EINVAL
>   return as indication that the CSR isn't available. This will be use in
>   absence of KVM_GET_REG_LIST;
> 
> - kvm_riscv_read_csr_cfg() will use the existing result of get_reg_list
>   to check if the CSRs ids are present.
> 
> kvm_riscv_init_multiext_cfg() is now kvm_riscv_init_multiext_csr_cfg()
                                       ^ kvm_riscv_init_cfg()

> to reflect that the function is also dealing with CSRs.
> 
> [1] https://lore.kernel.org/qemu-riscv/CABJz62OfUDHYkQ0T3rGHStQprf1c7_E0qBLbLKhfv=+jb0SYAw@mail.gmail.com/
> 
> Fixes: 4db19d5b21 ("target/riscv/kvm: add missing KVM CSRs")
> Reported-by: Andrea Bolognani <abologna@redhat.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/kvm/kvm-cpu.c | 62 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 59 insertions(+), 3 deletions(-)
> 
> diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
> index 7cbe566e5f..f341085ba1 100644
> --- a/target/riscv/kvm/kvm-cpu.c
> +++ b/target/riscv/kvm/kvm-cpu.c
> @@ -636,6 +636,10 @@ static int kvm_riscv_get_regs_csr(CPUState *cs)
>      for (i = 0; i < ARRAY_SIZE(kvm_csr_cfgs); i++) {
>          KVMCPUConfig *csr_cfg = &kvm_csr_cfgs[i];
>  
> +        if (!csr_cfg->supported) {
> +            continue;
> +        }
> +
>          ret = kvm_get_one_reg(cs, csr_cfg->kvm_reg_id, &reg);
>          if (ret) {
>              return ret;
> @@ -662,6 +666,10 @@ static int kvm_riscv_put_regs_csr(CPUState *cs)
>      for (i = 0; i < ARRAY_SIZE(kvm_csr_cfgs); i++) {
>          KVMCPUConfig *csr_cfg = &kvm_csr_cfgs[i];
>  
> +        if (!csr_cfg->supported) {
> +            continue;
> +        }
> +
>          if (KVM_REG_SIZE(csr_cfg->kvm_reg_id) == sizeof(uint32_t)) {
>              reg = kvm_cpu_csr_get_u32(cpu, csr_cfg);
>          } else if (KVM_REG_SIZE(csr_cfg->kvm_reg_id) == sizeof(uint64_t)) {
> @@ -1090,6 +1098,32 @@ static void kvm_riscv_read_multiext_legacy(RISCVCPU *cpu,
>      }
>  }
>  
> +static void kvm_riscv_read_csr_cfg_legacy(KVMScratchCPU *kvmcpu)
> +{
> +    uint64_t val;
> +    int i, ret;
> +
> +    for (i = 0; i < ARRAY_SIZE(kvm_csr_cfgs); i++) {
> +        KVMCPUConfig *csr_cfg = &kvm_csr_cfgs[i];
> +        struct kvm_one_reg reg;
> +
> +        reg.id = csr_cfg->kvm_reg_id;
> +        reg.addr = (uint64_t)&val;
> +        ret = ioctl(kvmcpu->cpufd, KVM_GET_ONE_REG, &reg);
> +        if (ret != 0) {
> +            if (errno == EINVAL) {
> +                csr_cfg->supported = false;
> +            } else {
> +                error_report("Unable to read KVM CSR %s: %s",
> +                             csr_cfg->name, strerror(errno));
> +                exit(EXIT_FAILURE);
> +            }
> +        } else {
> +            csr_cfg->supported = true;
> +        }
> +    }
> +}
> +
>  static int uint64_cmp(const void *a, const void *b)
>  {
>      uint64_t val1 = *(const uint64_t *)a;
> @@ -1146,7 +1180,26 @@ static void kvm_riscv_read_vlenb(RISCVCPU *cpu, KVMScratchCPU *kvmcpu,
>      }
>  }
>  
> -static void kvm_riscv_init_multiext_cfg(RISCVCPU *cpu, KVMScratchCPU *kvmcpu)
> +static void kvm_riscv_read_csr_cfg(struct kvm_reg_list *reglist)
> +{
> +    struct kvm_reg_list *reg_search;
> +    uint64_t reg_id;
> +
> +    for (int i = 0; i < ARRAY_SIZE(kvm_csr_cfgs); i++) {
> +        KVMCPUConfig *csr_cfg = &kvm_csr_cfgs[i];
> +
> +        reg_id = csr_cfg->kvm_reg_id;
> +        reg_search = bsearch(&reg_id, reglist->reg, reglist->n,
> +                             sizeof(uint64_t), uint64_cmp);
> +        if (!reg_search) {
> +            continue;
> +        }
> +
> +        csr_cfg->supported = true;
> +    }
> +}
> +
> +static void kvm_riscv_init_cfg(RISCVCPU *cpu, KVMScratchCPU *kvmcpu)
>  {
>      g_autofree struct kvm_reg_list *reglist = NULL;
>      KVMCPUConfig *multi_ext_cfg;
> @@ -1163,7 +1216,9 @@ static void kvm_riscv_init_multiext_cfg(RISCVCPU *cpu, KVMScratchCPU *kvmcpu)
>       * (EINVAL). Use read_legacy() in this case.
>       */
>      if (errno == EINVAL) {
> -        return kvm_riscv_read_multiext_legacy(cpu, kvmcpu);
> +        kvm_riscv_read_multiext_legacy(cpu, kvmcpu);
> +        kvm_riscv_read_csr_cfg_legacy(kvmcpu);
> +        return;
>      } else if (errno != E2BIG) {
>          /*
>           * E2BIG is an expected error message for the API since we
> @@ -1226,6 +1281,7 @@ static void kvm_riscv_init_multiext_cfg(RISCVCPU *cpu, KVMScratchCPU *kvmcpu)
>      }
>  
>      kvm_riscv_check_sbi_dbcn_support(cpu, reglist);
> +    kvm_riscv_read_csr_cfg(reglist);
>  }
>  
>  static void riscv_init_kvm_registers(Object *cpu_obj)
> @@ -1239,7 +1295,7 @@ static void riscv_init_kvm_registers(Object *cpu_obj)
>  
>      kvm_riscv_init_machine_ids(cpu, &kvmcpu);
>      kvm_riscv_init_misa_ext_mask(cpu, &kvmcpu);
> -    kvm_riscv_init_multiext_cfg(cpu, &kvmcpu);
> +    kvm_riscv_init_cfg(cpu, &kvmcpu);
>  
>      kvm_riscv_destroy_scratch_vcpu(&kvmcpu);
>  }
> -- 
> 2.49.0
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

