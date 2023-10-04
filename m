Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D48BE8FDD1
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 08:12:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qnwvt-0002m4-Ca; Wed, 04 Oct 2023 04:08:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qnwve-0000SI-AK
 for qemu-riscv@nongnu.org; Wed, 04 Oct 2023 04:08:22 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qnwvZ-00041L-Sm
 for qemu-riscv@nongnu.org; Wed, 04 Oct 2023 04:08:21 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4054496bde3so17830635e9.1
 for <qemu-riscv@nongnu.org>; Wed, 04 Oct 2023 01:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1696406895; x=1697011695; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kZ2h9W6WckZb3YhlcwicxwUBE5dX/kJ2aeOwgXDzYuE=;
 b=bd7DCK89iMinVVA4//OLJ4oQor2ZGoEz6dPR8/Y+SS/Qolx9C75h5CrvPAsqOxDjRY
 jaZ+Kxaw5ncDs66cK2b8/uk1YOHSqiaxDvSmpUT0KKWoyuifm+9fxCvsCVzRxBDVjeHX
 as0hqz5SdJcznNKfhxeC3GZ7EgvQZruRfn4oXnLIfQp0zM39vy2RKQagiXDCEvf5Y5no
 c2gYSnjS6XazSmhvGSk2rWOrsB3dze03JccpU27wb52vYLDi7vEi6VIr8//tqknemDr3
 ZlbSCkgFYpHnM5ucwXLGI74YDa94o9mldHWjhlugp1nhlIQAni2ZotkbiHgSvHx/bvq4
 H2MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696406895; x=1697011695;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kZ2h9W6WckZb3YhlcwicxwUBE5dX/kJ2aeOwgXDzYuE=;
 b=U370NUzkKnMvxBeH4yqb4z17zeRQSO6cupFXmiERNRZnBL5kFYj2b6+o+TWl7B/rLl
 wEMA1D0RXM8SMsqI1Pkr3AesWSW4CxN1cQmnYsZz3LdP4rY1RethifuaYGowcfVSgeSM
 anKZcUyGyTFxBuyTF1gR+kSMJgsjpmtMBFthYYZ0v/VD6aNrYURfMNadWwkXZBWiziOq
 DZN1oPZT02KtcBfi82pb8wiKWSQtt9QhRV40yXxzXTVEsgycrqnhxNrgYciagTiQorsu
 l7TiiGkNSw+vqBkdKQ7axvvUA4eHrOAhCuRq9YRHqfxmgSDFY11h9Pom7ouy0pBgR8Yu
 GemQ==
X-Gm-Message-State: AOJu0YwBs2ZqOTe7D4Ekt6xwpF+P18gg/LmvlFs/DFXUHaxAz+hF65a8
 1EqyxpHj0Z4HemW0tfrDiiVhJA==
X-Google-Smtp-Source: AGHT+IFw/LdYoeMgifApFKs0g7wPnCIaIyIJXV91alk5f9QWXSvEO4Duh/D6sN1w4HhEptcPHTz0GA==
X-Received: by 2002:a05:600c:20f:b0:405:40c6:2b96 with SMTP id
 15-20020a05600c020f00b0040540c62b96mr1332836wmi.3.1696406895084; 
 Wed, 04 Oct 2023 01:08:15 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 z2-20020a5d6402000000b003197efd1e7bsm3372321wru.114.2023.10.04.01.08.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Oct 2023 01:08:14 -0700 (PDT)
Date: Wed, 4 Oct 2023 10:08:13 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH v2 2/2] target/riscv/kvm: support KVM_GET_REG_LIST
Message-ID: <20231004-1d8f3886982d5082d1d75e09@orel>
References: <20231003132148.797921-1-dbarboza@ventanamicro.com>
 <20231003132148.797921-3-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231003132148.797921-3-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, Oct 03, 2023 at 10:21:48AM -0300, Daniel Henrique Barboza wrote:
> KVM for RISC-V started supporting KVM_GET_REG_LIST in Linux 6.6. It
> consists of a KVM ioctl() that retrieves a list of all available regs
> for get_one_reg/set_one_reg. Regs that aren't present in the list aren't
> supported in the host.
> 
> This simplifies our lives when initing the KVM regs since we don't have
> to always attempt a KVM_GET_ONE_REG for all regs QEMU knows. We'll only
> attempt a get_one_reg() if we're sure the reg is supported, i.e. it was
> retrieved by KVM_GET_REG_LIST. Any error in get_one_reg() will then
> always considered fatal, instead of having to handle special error codes
> that might indicate a non-fatal failure.
> 
> Start by moving the current kvm_riscv_init_multiext_cfg() logic into a
> new kvm_riscv_read_multiext_legacy() helper. We'll prioritize using
> KVM_GET_REG_LIST, so check if we have it available and, in case we
> don't, use the legacy() logic.
> 
> Otherwise, retrieve the available reg list and use it to check if the
> host supports our known KVM regs, doing the usual get_one_reg() for
> the supported regs and setting cpu->cfg accordingly.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/kvm/kvm-cpu.c | 96 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 95 insertions(+), 1 deletion(-)
> 
> diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
> index c3daf74fe9..090d617627 100644
> --- a/target/riscv/kvm/kvm-cpu.c
> +++ b/target/riscv/kvm/kvm-cpu.c
> @@ -771,7 +771,8 @@ static void kvm_riscv_read_cbomz_blksize(RISCVCPU *cpu, KVMScratchCPU *kvmcpu,
>      }
>  }
>  
> -static void kvm_riscv_init_multiext_cfg(RISCVCPU *cpu, KVMScratchCPU *kvmcpu)
> +static void kvm_riscv_read_multiext_legacy(RISCVCPU *cpu,
> +                                           KVMScratchCPU *kvmcpu)
>  {
>      CPURISCVState *env = &cpu->env;
>      uint64_t val;
> @@ -812,6 +813,99 @@ static void kvm_riscv_init_multiext_cfg(RISCVCPU *cpu, KVMScratchCPU *kvmcpu)
>      }
>  }
>  
> +static int uint64_cmp(const void *a, const void *b)
> +{
> +    uint64_t val1 = *(const uint64_t *)a;
> +    uint64_t val2 = *(const uint64_t *)b;
> +
> +    if (val1 < val2) {
> +        return -1;
> +    }
> +
> +    if (val1 > val2) {
> +        return 1;
> +    }
> +
> +    return 0;
> +}
> +
> +static void kvm_riscv_init_multiext_cfg(RISCVCPU *cpu, KVMScratchCPU *kvmcpu)
> +{
> +    KVMCPUConfig *multi_ext_cfg;
> +    struct kvm_one_reg reg;
> +    struct kvm_reg_list rl_struct;
> +    struct kvm_reg_list *reglist;
> +    uint64_t val, reg_id, *reg_search;
> +    int i, ret;
> +
> +    rl_struct.n = 0;
> +    ret = ioctl(kvmcpu->cpufd, KVM_GET_REG_LIST, &rl_struct);
> +
> +    /*
> +     * If KVM_GET_REG_LIST isn't supported we'll get errno 22
> +     * (EINVAL). Use read_legacy() in this case.
> +     */
> +    if (errno == EINVAL) {
> +        return kvm_riscv_read_multiext_legacy(cpu, kvmcpu);
> +    } else if (errno != E2BIG) {
> +        /*
> +         * E2BIG is an expected error message for the API since we
> +         * don't know the number of registers. The right amount will
> +         * be written in rl_struct.n.
> +         *
> +         * Error out if we get any other errno.
> +         */
> +        error_report("Error when accessing get-reg-list, code: %s",
> +                     strerrorname_np(errno));
> +        exit(EXIT_FAILURE);
> +    }
> +
> +    reglist = g_malloc(sizeof(struct kvm_reg_list) +
> +                       rl_struct.n * sizeof(uint64_t));
> +    reglist->n = rl_struct.n;
> +    ret = ioctl(kvmcpu->cpufd, KVM_GET_REG_LIST, reglist);
> +    if (ret) {
> +        error_report("Error when reading KVM_GET_REG_LIST, code %s ",
> +                     strerrorname_np(errno));
> +        exit(EXIT_FAILURE);
> +    }
> +
> +    /* sort reglist to use bsearch() */
> +    qsort(&reglist->reg, reglist->n, sizeof(uint64_t), uint64_cmp);
> +
> +    for (i = 0; i < ARRAY_SIZE(kvm_multi_ext_cfgs); i++) {
> +        multi_ext_cfg = &kvm_multi_ext_cfgs[i];
> +        reg_id = kvm_riscv_reg_id(&cpu->env, KVM_REG_RISCV_ISA_EXT,
> +                                  multi_ext_cfg->kvm_reg_id);
> +        reg_search = bsearch(&reg_id, reglist->reg, reglist->n,
> +                             sizeof(uint64_t), uint64_cmp);
> +        if (!reg_search) {
> +            continue;
> +        }
> +
> +        reg.id = reg_id;
> +        reg.addr = (uint64_t)&val;
> +        ret = ioctl(kvmcpu->cpufd, KVM_GET_ONE_REG, &reg);
> +        if (ret != 0) {
> +            error_report("Unable to read ISA_EXT KVM register %s, "
> +                         "error code: %s", multi_ext_cfg->name,
> +                         strerrorname_np(errno));
> +            exit(EXIT_FAILURE);
> +        }
> +
> +        multi_ext_cfg->supported = true;
> +        kvm_cpu_cfg_set(cpu, multi_ext_cfg, val);
> +    }
> +
> +    if (cpu->cfg.ext_icbom) {
> +        kvm_riscv_read_cbomz_blksize(cpu, kvmcpu, &kvm_cbom_blocksize);
> +    }
> +
> +    if (cpu->cfg.ext_icboz) {
> +        kvm_riscv_read_cbomz_blksize(cpu, kvmcpu, &kvm_cboz_blocksize);
> +    }
> +}
> +
>  static void riscv_init_kvm_registers(Object *cpu_obj)
>  {
>      RISCVCPU *cpu = RISCV_CPU(cpu_obj);
> -- 
> 2.41.0
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

