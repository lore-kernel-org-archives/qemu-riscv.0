Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 846F3C35274
	for <qemu-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 13:08:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rE7va-0005s6-SV; Fri, 15 Dec 2023 08:08:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1rE7vZ-0005rx-Tr
 for qemu-riscv@nongnu.org; Fri, 15 Dec 2023 08:08:29 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1rE7vY-0000e9-6g
 for qemu-riscv@nongnu.org; Fri, 15 Dec 2023 08:08:29 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40c517d0de5so6993495e9.0
 for <qemu-riscv@nongnu.org>; Fri, 15 Dec 2023 05:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1702645706; x=1703250506; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rzT3URh4lii6qv450JCPiT19FIxtNVL/nzs0v92ibqw=;
 b=Hbm91A1XnZlC2TFoV+5wQPJq1A74u5iqM7BprEEov8JAlBGZ024OrJBcTUWLh1pK3n
 cd59wRX0gjss6W/KI3lyrkImI7+H32z1d/9Y2jFrCAND87VTwS/S45WwV+oAEoUoSlN/
 +Jbi2SwBwQM2AVrJBBEy5dLroYZjIjkbml1naAGUwyF5ufZ/9JL1VyGTTkvO29lDp04P
 //boYi1rreUwBv+bmOn45FltpmDFzcAWn1uyfHwaLxguZ69HZq8DFGxmW8EvgEsCIAV4
 0VpMPS22x2b3mHgKa1rqvzxyZwv0cDlbE/h8JzVttue0nnXAouI3AOQxSccBolICz8BO
 7nhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702645706; x=1703250506;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rzT3URh4lii6qv450JCPiT19FIxtNVL/nzs0v92ibqw=;
 b=L8Y9J0NfFkr8MbeC8jc08Xw4TssdwDkEaOBNjoYQ1w42oUoVwf8SnALXl1BI0Xeix8
 TKauOAQYPiGh0ov0mSMgM8fRYVupdHFLMz4tf1f8wA2voVpPpCevdgy7w4FE2JOYK45/
 ta/wDcAIIvYOi304nJMeOjytqLXDCpnYPJZMqo/uNmLsKzQtQXE4D+nd4IZL72yoahIw
 GohNavKTHdbSbOilQZWWdsD9D5mEGlUvufsW7DcW8u8LrHbP/YowbN0ORuU9T36paDrn
 o8I1Zhe1fXjPuXFFaUOq3sFqULR8W7Kj68TTIGK1mz0ZaznBkIyrgJPSndKiNjyd4Qyz
 cWnw==
X-Gm-Message-State: AOJu0YyVc/je/QTp6hhN4iKYvfXvdmcppd9OrKGD/FPycfuMQxpgPcTo
 Z9EMoz0M1hwJ3E6bEw8Cpxhqsg==
X-Google-Smtp-Source: AGHT+IG6SoPBAewSHBLzCLVh/OwCnTc/h6N5iI/2TEJdWhIw0WNiBOcx4PYOONO16mluT3yZDckbwA==
X-Received: by 2002:a05:600c:2d52:b0:40c:2e1c:8f93 with SMTP id
 a18-20020a05600c2d5200b0040c2e1c8f93mr5561646wmg.179.1702645706174; 
 Fri, 15 Dec 2023 05:08:26 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 fm14-20020a05600c0c0e00b00407b93d8085sm31428906wmb.27.2023.12.15.05.08.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Dec 2023 05:08:25 -0800 (PST)
Date: Fri, 15 Dec 2023 14:08:24 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH for-9.0 1/5] target/riscv/kvm: change KVM_REG_RISCV_FP_F
 to u32
Message-ID: <20231215-5de53b96e91f184205c0155c@orel>
References: <20231208183835.2411523-1-dbarboza@ventanamicro.com>
 <20231208183835.2411523-2-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231208183835.2411523-2-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, Dec 08, 2023 at 03:38:31PM -0300, Daniel Henrique Barboza wrote:
> KVM_REG_RISCV_FP_F regs have u32 size according to the API, but by using
> kvm_riscv_reg_id() in RISCV_FP_F_REG() we're returning u64 sizes when
> running with TARGET_RISCV64. The most likely reason why no one noticed
> this is because we're not implementing kvm_cpu_synchronize_state() in
> RISC-V yet.
> 
> Create a new helper that returns a KVM ID with u32 size and use it in
> RISCV_FP_F_REG().
> 
> Reported-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/kvm/kvm-cpu.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
> index 45b6cf1cfa..9bfbc4ac98 100644
> --- a/target/riscv/kvm/kvm-cpu.c
> +++ b/target/riscv/kvm/kvm-cpu.c
> @@ -72,6 +72,11 @@ static uint64_t kvm_riscv_reg_id(CPURISCVState *env, uint64_t type,
>      return id;
>  }
>  
> +static uint64_t kvm_riscv_reg_id_u32(uint64_t type, uint64_t idx)
> +{
> +    return KVM_REG_RISCV | KVM_REG_SIZE_U32 | type | idx;
> +}
> +
>  #define RISCV_CORE_REG(env, name)  kvm_riscv_reg_id(env, KVM_REG_RISCV_CORE, \
>                   KVM_REG_RISCV_CORE_REG(name))
>  
> @@ -81,7 +86,7 @@ static uint64_t kvm_riscv_reg_id(CPURISCVState *env, uint64_t type,
>  #define RISCV_TIMER_REG(env, name)  kvm_riscv_reg_id(env, KVM_REG_RISCV_TIMER, \
>                   KVM_REG_RISCV_TIMER_REG(name))
>  
> -#define RISCV_FP_F_REG(env, idx)  kvm_riscv_reg_id(env, KVM_REG_RISCV_FP_F, idx)
> +#define RISCV_FP_F_REG(idx)  kvm_riscv_reg_id_u32(KVM_REG_RISCV_FP_F, idx)
>  
>  #define RISCV_FP_D_REG(env, idx)  kvm_riscv_reg_id(env, KVM_REG_RISCV_FP_D, idx)
>  
> @@ -586,7 +591,7 @@ static int kvm_riscv_get_regs_fp(CPUState *cs)
>      if (riscv_has_ext(env, RVF)) {
>          uint32_t reg;
>          for (i = 0; i < 32; i++) {
> -            ret = kvm_get_one_reg(cs, RISCV_FP_F_REG(env, i), &reg);
> +            ret = kvm_get_one_reg(cs, RISCV_FP_F_REG(i), &reg);
>              if (ret) {
>                  return ret;
>              }
> @@ -620,7 +625,7 @@ static int kvm_riscv_put_regs_fp(CPUState *cs)
>          uint32_t reg;
>          for (i = 0; i < 32; i++) {
>              reg = env->fpr[i];
> -            ret = kvm_set_one_reg(cs, RISCV_FP_F_REG(env, i), &reg);
> +            ret = kvm_set_one_reg(cs, RISCV_FP_F_REG(i), &reg);
>              if (ret) {
>                  return ret;
>              }
> -- 
> 2.41.0
>

This patch looks good, so

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

But... I don't see where we save/restore __riscv_f_ext_state.fcsr

Thanks,
drew

