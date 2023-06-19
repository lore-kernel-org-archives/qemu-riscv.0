Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 268A6EB64D9
	for <qemu-riscv@archiver.kernel.org>; Mon, 19 Jun 2023 09:44:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qBBQk-0005Pm-8N; Mon, 19 Jun 2023 05:44:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qBBQi-0005PQ-9z
 for qemu-riscv@nongnu.org; Mon, 19 Jun 2023 05:44:12 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qBBQd-0007a8-DD
 for qemu-riscv@nongnu.org; Mon, 19 Jun 2023 05:44:11 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f9b258f3a2so5386175e9.0
 for <qemu-riscv@nongnu.org>; Mon, 19 Jun 2023 02:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1687167845; x=1689759845;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kEnm2+1mfrDz4Jf3V49paZIt0xw6ljP5EExEa3vKbQk=;
 b=Hx7fXh5A3SoJuo974G9IKzg6+GrqwR5EusWkmY/avlBOSMSKwQYVmkkODp8O16+wpl
 gtejqekhNID/ZpToRWtymloY0YMrjcS2ep42RRcS//XeYbxE+fClTDbsyZSRK23wizWH
 RvkQtR6bQYkMaxvE/V3tQLg6Axy4QuMlUJnQzpg1NVDAbMaoc1RIkIboaFy4bmLUqi9t
 w43w+L8BnWBPQofkT49PBoBGdy+7S81GR78DWkaZJw0PbUjcawnpETRFt1ek3hAuRZzS
 AWmXGCATqSBJOuTx605IismjI6E8sg7XmoJ78L8bq5vHMuRDTJdWMY6b/T5mg1fmhXNt
 rYVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687167845; x=1689759845;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kEnm2+1mfrDz4Jf3V49paZIt0xw6ljP5EExEa3vKbQk=;
 b=ZfAPBzBIOeZyTGaNM2vj1Sa266T/ChOHunYaCHrEksBjPxaOTwQO1i0bDyTwit7QXh
 4RbZJ+H5AXGjn7QELRzHihWn4unWwq+awRApnYczHy6eSe3P3lgVAD0qwUuErDpxrJqr
 FmHYc3uBK6YYhfMlGQAkwBYkZmZfBME9VZ+f82YdnO4Q1JHmVms4BdMq3zMoIelS4xN0
 fUU/11nNMgszVZLNGVjSyj6fK5UKZ3snlUms7ac41cZJpcc61GgErQo2kQNDOlNyRDgl
 I+VW1/GtO9h2gY9+PZbrKBedX4Qykf3CWJcer5FBMxeodLsMbhQASmgJ8PglSB5KXE8g
 1I4A==
X-Gm-Message-State: AC+VfDyRmXIXHImdJSUtULNpMJ7vupgnr6Uz3p03qUiXi/O9dYdmpuTj
 zsRoe0o9RwrdYab81fQ4SLUxRQ==
X-Google-Smtp-Source: ACHHUZ6lpk6Cq1+Vj3mYJQrIx3662R/ln/BzisCduiOY74bncvt2iO/yxL3Hy7X9b8VV58910LP8xQ==
X-Received: by 2002:a05:600c:2116:b0:3f7:363a:5657 with SMTP id
 u22-20020a05600c211600b003f7363a5657mr10211308wml.13.1687167845695; 
 Mon, 19 Jun 2023 02:44:05 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 j8-20020a5d6188000000b0031118d80246sm11276564wru.29.2023.06.19.02.44.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 02:44:05 -0700 (PDT)
Date: Mon, 19 Jun 2023 11:44:04 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH v2 14/18] target/riscv/kvm.c: add multi-letter extension
 KVM properties
Message-ID: <20230619-b52d0e7dff9ed47827902b54@orel>
References: <20230613205857.495165-1-dbarboza@ventanamicro.com>
 <20230613205857.495165-15-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230613205857.495165-15-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x332.google.com
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

On Tue, Jun 13, 2023 at 05:58:53PM -0300, Daniel Henrique Barboza wrote:
> Let's add KVM user properties for the multi-letter extensions that KVM
> currently supports: zicbom, zicboz, zihintpause, zbb, ssaia, sstc,
> svinval and svpbmt.
> 
> As with MISA extensions, we're using the KVMCPUConfig type to hold
> information about the state of each extension. However, multi-letter
> extensions have more cases to cover than MISA extensions, so we're
> adding an extra 'supported' flag as well. This flag will reflect if a
> given extension is supported by KVM, i.e. KVM knows how to handle it.
> This is determined during KVM extension discovery in
> kvm_riscv_init_multiext_cfg(), where we test for EINVAL errors. Any
> other error different from EINVAL will cause an abort.
> 
> The use of the 'user_set' is similar to what we already do with MISA
> extensions: the flag set only if the user is changing the extension
> state.
> 
> The 'supported' flag will be used later on to make an exception for
> users that are disabling multi-letter extensions that are unknown to
> KVM.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/kvm.c | 124 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 124 insertions(+)
> 
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index ea38f91b92..63bf97fbff 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -113,6 +113,7 @@ typedef struct KVMCPUConfig {
>      target_ulong offset;
>      int kvm_reg_id;
>      bool user_set;
> +    bool supported;
>  } KVMCPUConfig;
>  
>  #define KVM_MISA_CFG(_bit, _reg_id) \
> @@ -199,6 +200,86 @@ static void kvm_riscv_update_cpu_misa_ext(RISCVCPU *cpu, CPUState *cs)
>      }
>  }
>  
> +#define CPUCFG(_prop) offsetof(struct RISCVCPUConfig, _prop)
> +
> +#define KVM_EXT_CFG(_name, _prop, _reg_id) \
> +    {.name = _name, .offset = CPUCFG(_prop), \
> +     .kvm_reg_id = _reg_id}
> +/*
> + * KVM ISA Multi-letter extensions. We care about the order
> + * since it'll be used to create the ISA string later on.
> + * We follow the same ordering rules of isa_edata_arr[]
> + * from target/riscv/cpu.c.
> + */
> +static KVMCPUConfig kvm_multi_ext_cfgs[] = {
> +    KVM_EXT_CFG("zicbom", ext_icbom, KVM_RISCV_ISA_EXT_ZICBOM),
> +    KVM_EXT_CFG("zicboz", ext_icboz, KVM_RISCV_ISA_EXT_ZICBOZ),
> +    KVM_EXT_CFG("zihintpause", ext_zihintpause, KVM_RISCV_ISA_EXT_ZIHINTPAUSE),
> +    KVM_EXT_CFG("zbb", ext_zbb, KVM_RISCV_ISA_EXT_ZBB),
> +    KVM_EXT_CFG("ssaia", ext_ssaia, KVM_RISCV_ISA_EXT_SSAIA),
> +    KVM_EXT_CFG("sstc", ext_sstc, KVM_RISCV_ISA_EXT_SSTC),
> +    KVM_EXT_CFG("svinval", ext_svinval, KVM_RISCV_ISA_EXT_SVINVAL),
> +    KVM_EXT_CFG("svpbmt", ext_svpbmt, KVM_RISCV_ISA_EXT_SVPBMT),
> +};
> +
> +static void kvm_cpu_cfg_set(RISCVCPU *cpu, KVMCPUConfig *multi_ext,
> +                            uint32_t val)
> +{
> +    int cpu_cfg_offset = multi_ext->offset;
> +    bool *ext_enabled = (void *)&cpu->cfg + cpu_cfg_offset;
> +
> +    *ext_enabled = val;
> +}
> +
> +static uint32_t kvm_cpu_cfg_get(RISCVCPU *cpu,
> +                                KVMCPUConfig *multi_ext)
> +{
> +    int cpu_cfg_offset = multi_ext->offset;
> +    bool *ext_enabled = (void *)&cpu->cfg + cpu_cfg_offset;
> +
> +    return *ext_enabled;
> +}
> +
> +static void kvm_cpu_set_multi_ext_cfg(Object *obj, Visitor *v,
> +                                      const char *name,
> +                                      void *opaque, Error **errp)
> +{
> +    KVMCPUConfig *multi_ext_cfg = opaque;
> +    RISCVCPU *cpu = RISCV_CPU(obj);
> +    bool value, host_val;
> +
> +    if (!visit_type_bool(v, name, &value, errp)) {
> +        return;
> +    }
> +
> +    host_val = kvm_cpu_cfg_get(cpu, multi_ext_cfg);
> +
> +    /*
> +     * Ignore if the user is setting the same value
> +     * as the host.
> +     */
> +    if (value == host_val) {
> +        return;
> +    }
> +
> +    if (!multi_ext_cfg->supported) {
> +        /*
> +         * Error out if the user is trying to enable an
> +         * extension that KVM doesn't support. Ignore
> +         * option otherwise.
> +         */
> +        if (value) {
> +            error_setg(errp, "KVM does not support disabling extension %s",
> +                       multi_ext_cfg->name);
> +        }
> +
> +        return;
> +    }
> +
> +    multi_ext_cfg->user_set = true;
> +    kvm_cpu_cfg_set(cpu, multi_ext_cfg, value);
> +}
> +
>  static void kvm_riscv_add_cpu_user_properties(Object *cpu_obj)
>  {
>      int i;
> @@ -213,6 +294,15 @@ static void kvm_riscv_add_cpu_user_properties(Object *cpu_obj)
>          object_property_set_description(cpu_obj, misa_cfg->name,
>                                          misa_cfg->description);
>      }
> +
> +    for (i = 0; i < ARRAY_SIZE(kvm_multi_ext_cfgs); i++) {
> +        KVMCPUConfig *multi_cfg = &kvm_multi_ext_cfgs[i];
> +
> +        object_property_add(cpu_obj, multi_cfg->name, "bool",
> +                            NULL,
> +                            kvm_cpu_set_multi_ext_cfg,
> +                            NULL, multi_cfg);
> +    }
>  }
>  
>  static int kvm_riscv_get_regs_core(CPUState *cs)
> @@ -528,6 +618,39 @@ static void kvm_riscv_init_misa_ext_mask(RISCVCPU *cpu,
>      env->misa_ext = env->misa_ext_mask;
>  }
>  
> +static void kvm_riscv_init_multiext_cfg(RISCVCPU *cpu, KVMScratchCPU *kvmcpu)
> +{
> +    CPURISCVState *env = &cpu->env;
> +    uint64_t val;
> +    int i, ret;
> +
> +    for (i = 0; i < ARRAY_SIZE(kvm_multi_ext_cfgs); i++) {
> +        KVMCPUConfig *multi_ext_cfg = &kvm_multi_ext_cfgs[i];
> +        struct kvm_one_reg reg;
> +
> +        reg.id = kvm_riscv_reg_id(env, KVM_REG_RISCV_ISA_EXT,
> +                                  multi_ext_cfg->kvm_reg_id);
> +        reg.addr = (uint64_t)&val;
> +        ret = ioctl(kvmcpu->cpufd, KVM_GET_ONE_REG, &reg);
> +        if (ret != 0) {
> +            if (ret == -EINVAL) {
> +                /* Silently default to 'false' if KVM does not support it. */
> +                multi_ext_cfg->supported = false;
> +                val = false;
> +            } else {
> +                error_report("Unable to read ISA_EXT KVM register %s, "
> +                             "error %d", multi_ext_cfg->name, ret);
> +                kvm_riscv_destroy_scratch_vcpu(kvmcpu);
> +                exit(EXIT_FAILURE);
> +            }
> +        } else {
> +            multi_ext_cfg->supported = true;
> +        }
> +
> +        kvm_cpu_cfg_set(cpu, multi_ext_cfg, val);
> +    }
> +}
> +
>  void kvm_riscv_init_user_properties(Object *cpu_obj)
>  {
>      RISCVCPU *cpu = RISCV_CPU(cpu_obj);
> @@ -540,6 +663,7 @@ void kvm_riscv_init_user_properties(Object *cpu_obj)
>      kvm_riscv_add_cpu_user_properties(cpu_obj);
>      kvm_riscv_init_machine_ids(cpu, &kvmcpu);
>      kvm_riscv_init_misa_ext_mask(cpu, &kvmcpu);
> +    kvm_riscv_init_multiext_cfg(cpu, &kvmcpu);
>  
>      kvm_riscv_destroy_scratch_vcpu(&kvmcpu);
>  }
> -- 
> 2.40.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

