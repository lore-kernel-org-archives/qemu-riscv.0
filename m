Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06222C35274
	for <qemu-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 13:11:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rE7yN-0007CB-UY; Fri, 15 Dec 2023 08:11:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1rE7yL-0007BT-NJ
 for qemu-riscv@nongnu.org; Fri, 15 Dec 2023 08:11:21 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1rE7yH-0001eU-En
 for qemu-riscv@nongnu.org; Fri, 15 Dec 2023 08:11:20 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40c60dfa5bfso7614465e9.0
 for <qemu-riscv@nongnu.org>; Fri, 15 Dec 2023 05:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1702645875; x=1703250675; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7IUJXYjWEGVQH3ve7qjXeVVRGJKiJSZNPobmx4cSSjI=;
 b=DNMgQmzhPCU9nVh8f8DvTHsVXXfsGjTZYc6kfVYwDUo2+wezbOKcL4qHXu36UKRb5m
 U+z90Wjyg8NnPBJSAOG3lnmMj4zEKKwoqMiJp+9k4n+xNsoddtYrxoZNFG06PeOdxTgh
 awIlAAirmGVsJiRPI2StqEL4XvNph33sRqAalbvGEBmITwwvP3N5zY4cjVHAzcQbMiZK
 8TKutI01agzl3WO5det+OUnhQRHtMA/UQgQD/P8r776ckYYlbaxcHH2NbMkp/1qFGrGM
 +91TfH32CvfG4MHn4XMZTNQAbJ7mPPLt9DrrzGOtLhruTbJrGO4FiazmPQZT3dp9Ss7l
 FEyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702645875; x=1703250675;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7IUJXYjWEGVQH3ve7qjXeVVRGJKiJSZNPobmx4cSSjI=;
 b=Ulnxgy4npT4WKAhS9N4ZFaIbI0Lk7DHAiDqcy6rITRYoYL4STgen8+hOP2CO57UGhx
 ta/COZIT9TNjUOUEKERV7ncND1vNIzs8YQVHBrTLWtGwiFWhxZKE7MecTmPMBxTVSjs/
 SOjZyPfQsq5wa8dMsY/rJmCi8LV1OUf9gJv2ju5STCvE1D5P9BPAQ5du3EOVXwIlJdg+
 mvMG9lu7tJk3SB3YRxg5q/pCF5La1/hn25GIJ6WblcZ0uTPjlyAdlKYeZtjxb4MqbXdc
 HKF++08EtVTjq2djx8X50jGfxQM4KtIzDkdIPa1lKqVXyDsCny72Fji6SgXFCi9qAIKQ
 o5kg==
X-Gm-Message-State: AOJu0YzmslNXGKdhaQskppVQZCZtXdZwxqzHAfnOjfhTXvisVPzaefAS
 Ghp4yYc6FR4+fqb0GnaiXd0keQ==
X-Google-Smtp-Source: AGHT+IFu1LRSLwwF1e6PJ6t83Ow8E+Jtgo/hvwj6Y78PfE2bvCuKTYvRWxbu8CC9adbM5gEvW39pAA==
X-Received: by 2002:a05:600c:164a:b0:40b:5e59:c566 with SMTP id
 o10-20020a05600c164a00b0040b5e59c566mr6000397wmn.144.1702645875340; 
 Fri, 15 Dec 2023 05:11:15 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 z20-20020a05600c0a1400b004064e3b94afsm31971271wmp.4.2023.12.15.05.11.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Dec 2023 05:11:14 -0800 (PST)
Date: Fri, 15 Dec 2023 14:11:13 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH for-9.0 2/5] target/riscv/kvm: change KVM_REG_RISCV_FP_D
 to u64
Message-ID: <20231215-fbdf34e111d91f94bc654a13@orel>
References: <20231208183835.2411523-1-dbarboza@ventanamicro.com>
 <20231208183835.2411523-3-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231208183835.2411523-3-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x32e.google.com
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

On Fri, Dec 08, 2023 at 03:38:32PM -0300, Daniel Henrique Barboza wrote:
> KVM_REG_RISCV_FP_D regs are always u64 size. Using kvm_riscv_reg_id() in
> RISCV_FP_D_REG() ends up encoding the wrong size if we're running with
> TARGET_RISCV32.
> 
> Create a new helper that returns a KVM ID with u64 size and use it with
> RISCV_FP_D_REG().
> 
> Reported-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/kvm/kvm-cpu.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
> index 9bfbc4ac98..34ed82ebe5 100644
> --- a/target/riscv/kvm/kvm-cpu.c
> +++ b/target/riscv/kvm/kvm-cpu.c
> @@ -77,6 +77,11 @@ static uint64_t kvm_riscv_reg_id_u32(uint64_t type, uint64_t idx)
>      return KVM_REG_RISCV | KVM_REG_SIZE_U32 | type | idx;
>  }
>  
> +static uint64_t kvm_riscv_reg_id_u64(uint64_t type, uint64_t idx)
> +{
> +    return KVM_REG_RISCV | KVM_REG_SIZE_U64 | type | idx;
> +}
> +
>  #define RISCV_CORE_REG(env, name)  kvm_riscv_reg_id(env, KVM_REG_RISCV_CORE, \
>                   KVM_REG_RISCV_CORE_REG(name))
>  
> @@ -88,7 +93,7 @@ static uint64_t kvm_riscv_reg_id_u32(uint64_t type, uint64_t idx)
>  
>  #define RISCV_FP_F_REG(idx)  kvm_riscv_reg_id_u32(KVM_REG_RISCV_FP_F, idx)
>  
> -#define RISCV_FP_D_REG(env, idx)  kvm_riscv_reg_id(env, KVM_REG_RISCV_FP_D, idx)
> +#define RISCV_FP_D_REG(idx)  kvm_riscv_reg_id_u64(KVM_REG_RISCV_FP_D, idx)
>  
>  #define KVM_RISCV_GET_CSR(cs, env, csr, reg) \
>      do { \
> @@ -579,7 +584,7 @@ static int kvm_riscv_get_regs_fp(CPUState *cs)
>      if (riscv_has_ext(env, RVD)) {
>          uint64_t reg;
>          for (i = 0; i < 32; i++) {
> -            ret = kvm_get_one_reg(cs, RISCV_FP_D_REG(env, i), &reg);
> +            ret = kvm_get_one_reg(cs, RISCV_FP_D_REG(i), &reg);
>              if (ret) {
>                  return ret;
>              }
> @@ -613,7 +618,7 @@ static int kvm_riscv_put_regs_fp(CPUState *cs)
>          uint64_t reg;
>          for (i = 0; i < 32; i++) {
>              reg = env->fpr[i];
> -            ret = kvm_set_one_reg(cs, RISCV_FP_D_REG(env, i), &reg);
> +            ret = kvm_set_one_reg(cs, RISCV_FP_D_REG(i), &reg);
>              if (ret) {
>                  return ret;
>              }
> -- 
> 2.41.0
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

afaict, we're also missing fcsr here. And watch out for D's fcsr, it's
32-bit, even though the rest of the registers are 64-bit.

Thanks,
drew

