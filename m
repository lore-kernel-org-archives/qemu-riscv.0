Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19306EB64D9
	for <qemu-riscv@archiver.kernel.org>; Mon, 19 Jun 2023 12:34:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qBE57-0005gD-SV; Mon, 19 Jun 2023 08:34:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qBE53-0005fW-SW
 for qemu-riscv@nongnu.org; Mon, 19 Jun 2023 08:34:04 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qBE50-0007y7-3G
 for qemu-riscv@nongnu.org; Mon, 19 Jun 2023 08:34:01 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-307d58b3efbso2514495f8f.0
 for <qemu-riscv@nongnu.org>; Mon, 19 Jun 2023 05:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1687178036; x=1689770036;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Aq1eORVQbA3saDlGvSjo0IQaYEakPkUHZVoI6Wob8Bs=;
 b=eqeEwISyVrJzmm3WbNxIkAr1wDQehDf0w9eKO9nQW+eD5U4xgCh3XLOEdJ6e64grPS
 9hZzeaBOmW7/biIY+DmQPTVEc+unIMu9XOzQjSn7MrErRqaogRdUEx0j7DoHtRJAvm8D
 JhE2O50JMAJum/7DWYzD22hI5wAemfXpoeq3TLZDsCc0RWfFcFO0swVWqalPYUx35Smn
 UCSG9uxjropIly9No5mTVvhe8rwiYpiOP6Tc9vgC+/HbRp6GL0f/an6ZbRSuOzQA0hra
 34jGExT+N/ZbaO+djpYBpFpl6pjg572rKqNu7rzN9z4eqyGeszMTY2QGaaG8PKOBBFpf
 KKag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687178036; x=1689770036;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Aq1eORVQbA3saDlGvSjo0IQaYEakPkUHZVoI6Wob8Bs=;
 b=glKZSZvbYPKkmuY8oRzoRzE3kmq1GMvOdBPP0YFShxkg7Qxag7dXNwo73COseI+nJJ
 VkgslmyC8JMXtydGif3MFUaVnWxHqCMTfAjFsZrUdRxImX2T1uSQNni4BdUaM1OKdnLb
 k+kZJHyaIvEFbH2+PzRwqlCrSMDzTarjAXU0AzvyxZ3cwFDSnu3nopO/Nz+EQnD855mW
 GObIDSyzTGNG9U+kWetjuap1PM+yheb68affCqcxCLrwPVZVdeezFpBhVOrCLbvXSJ4f
 aPkxfIL8HGIPT4/zywfY4Qq3wPXaTQE1PGelT+FyG9xBn6lueZpK0MAI1NTLeIp9z4mK
 NbMQ==
X-Gm-Message-State: AC+VfDz7TFl0RMQ7xZO8UqBXYGVvta8vgepjMBqlGPq0JJr6y/CvfKZi
 iLIhpvPvGnaFVkNZx3+GxYrIWsTQHQOWbLt5+pc=
X-Google-Smtp-Source: ACHHUZ7BszJLVGWowu/qPdlfZUMtMUtb7bb8viSvI/vB6IuHoq46+n9fKMfVa8ocyZ7batgGZVgQcw==
X-Received: by 2002:adf:df12:0:b0:30d:af7c:5046 with SMTP id
 y18-20020adfdf12000000b0030daf7c5046mr5631320wrl.60.1687178036296; 
 Mon, 19 Jun 2023 05:33:56 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 n16-20020adfe350000000b0030e5b1fffc3sm31650571wrj.9.2023.06.19.05.33.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 05:33:55 -0700 (PDT)
Date: Mon, 19 Jun 2023 14:33:54 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH v2 18/18] target/riscv/kvm.c: read/write
 (cbom|cboz)_blocksize in KVM
Message-ID: <20230619-00d5750aac3bcc62aefa3e28@orel>
References: <20230613205857.495165-1-dbarboza@ventanamicro.com>
 <20230613205857.495165-19-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230613205857.495165-19-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Tue, Jun 13, 2023 at 05:58:57PM -0300, Daniel Henrique Barboza wrote:
> If we don't set a proper cbom_blocksize|cboz_blocksize in the FDT the
> Linux Kernel will fail to detect the availability of the CBOM/CBOZ
> extensions, regardless of the contents of the 'riscv,isa' DT prop.
> 
> The FDT is being written using the cpu->cfg.cbom|z_blocksize attributes,
> so let's expose them as user properties like it is already done with
> TCG.
> 
> This will also require us to determine proper blocksize values during
> init() time since the FDT is already created during realize(). We'll
> take a ride in kvm_riscv_init_multiext_cfg() to do it. Note that we
> don't need to fetch both cbom and cboz blocksizes every time: check for
> their parent extensions (icbom and icboz) and only read the blocksizes
> if needed.
> 
> In contrast with cbom/z_blocksize properties from TCG, the user is not
> able to set any value that is different from the 'host' value when
> running KVM. KVM can be particularly harsh dealing with it: a ENOTSUPP
> can be thrown for the mere attempt of executing kvm_set_one_reg() for
> these 2 regs.
> 
> Hopefully, we don't need to call kvm_set_one_reg() for these regs.
> We'll check if the user input matches the host value in
> kvm_cpu_set_cbomz_blksize(), the set() accessor for both blocksize
> properties. We'll fail fast since it's already known to not be
> supported.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/kvm.c | 70 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
> 
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index 3a9f7b0722..ccd2375d8d 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -283,6 +283,42 @@ static void kvm_cpu_set_multi_ext_cfg(Object *obj, Visitor *v,
>      kvm_cpu_cfg_set(cpu, multi_ext_cfg, value);
>  }
>  
> +static KVMCPUConfig kvm_cbom_blocksize = {
> +    .name = "cbom_blocksize",
> +    .offset = CPUCFG(cbom_blocksize),
> +    .kvm_reg_id = KVM_REG_RISCV_CONFIG_REG(zicbom_block_size)
> +};
> +
> +static KVMCPUConfig kvm_cboz_blocksize = {
> +    .name = "cboz_blocksize",
> +    .offset = CPUCFG(cboz_blocksize),
> +    .kvm_reg_id = KVM_REG_RISCV_CONFIG_REG(zicboz_block_size)
> +};
> +
> +static void kvm_cpu_set_cbomz_blksize(Object *obj, Visitor *v,
> +                                      const char *name,
> +                                      void *opaque, Error **errp)
> +{
> +    KVMCPUConfig *cbomz_cfg = opaque;
> +    RISCVCPU *cpu = RISCV_CPU(obj);
> +    uint16_t value, *host_val;
> +
> +    if (!visit_type_uint16(v, name, &value, errp)) {
> +        return;
> +    }
> +
> +    host_val = kvmconfig_get_cfg_addr(cpu, cbomz_cfg);
> +
> +    if (value != *host_val) {
> +        error_report("Unable to set %s to a different value than "
> +                     "the host (%u)",
> +                     cbomz_cfg->name, *host_val);
> +        exit(EXIT_FAILURE);
> +    }
> +
> +    cbomz_cfg->user_set = true;
> +}
> +
>  static void kvm_riscv_update_cpu_cfg_isa_ext(RISCVCPU *cpu, CPUState *cs)
>  {
>      CPURISCVState *env = &cpu->env;
> @@ -332,6 +368,14 @@ static void kvm_riscv_add_cpu_user_properties(Object *cpu_obj)
>                              kvm_cpu_set_multi_ext_cfg,
>                              NULL, multi_cfg);
>      }
> +
> +    object_property_add(cpu_obj, "cbom_blocksize", "uint16",
> +                        NULL, kvm_cpu_set_cbomz_blksize,
> +                        NULL, &kvm_cbom_blocksize);
> +
> +    object_property_add(cpu_obj, "cboz_blocksize", "uint16",
> +                        NULL, kvm_cpu_set_cbomz_blksize,
> +                        NULL, &kvm_cboz_blocksize);
>  }
>  
>  static int kvm_riscv_get_regs_core(CPUState *cs)
> @@ -647,6 +691,24 @@ static void kvm_riscv_init_misa_ext_mask(RISCVCPU *cpu,
>      env->misa_ext = env->misa_ext_mask;
>  }
>  
> +static void kvm_riscv_read_cbomz_blksize(RISCVCPU *cpu, KVMScratchCPU *kvmcpu,
> +                                         KVMCPUConfig *cbomz_cfg)
> +{
> +    CPURISCVState *env = &cpu->env;
> +    struct kvm_one_reg reg;
> +    int ret;
> +
> +    reg.id = kvm_riscv_reg_id(env, KVM_REG_RISCV_CONFIG,
> +                              cbomz_cfg->kvm_reg_id);
> +    reg.addr = (uint64_t)kvmconfig_get_cfg_addr(cpu, cbomz_cfg);
> +    ret = ioctl(kvmcpu->cpufd, KVM_GET_ONE_REG, &reg);
> +    if (ret != 0) {
> +        error_report("Unable to read KVM reg %s, error %d",
> +                     cbomz_cfg->name, ret);
> +        exit(EXIT_FAILURE);
> +    }
> +}
> +
>  static void kvm_riscv_init_multiext_cfg(RISCVCPU *cpu, KVMScratchCPU *kvmcpu)
>  {
>      CPURISCVState *env = &cpu->env;
> @@ -678,6 +740,14 @@ static void kvm_riscv_init_multiext_cfg(RISCVCPU *cpu, KVMScratchCPU *kvmcpu)
>  
>          kvm_cpu_cfg_set(cpu, multi_ext_cfg, val);
>      }
> +
> +    if (cpu->cfg.ext_icbom) {
> +        kvm_riscv_read_cbomz_blksize(cpu, kvmcpu, &kvm_cbom_blocksize);
> +    }
> +
> +    if (cpu->cfg.ext_icboz) {
> +        kvm_riscv_read_cbomz_blksize(cpu, kvmcpu, &kvm_cboz_blocksize);
> +    }
>  }
>  
>  void kvm_riscv_init_user_properties(Object *cpu_obj)
> -- 
> 2.40.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

