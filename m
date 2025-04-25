Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A36C369C2
	for <qemu-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 12:13:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u8HvN-0007P8-GL; Fri, 25 Apr 2025 08:12:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1u8HvK-0007OU-LU
 for qemu-riscv@nongnu.org; Fri, 25 Apr 2025 08:12:55 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1u8HvI-0002mu-54
 for qemu-riscv@nongnu.org; Fri, 25 Apr 2025 08:12:54 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3912fdddf8fso2220077f8f.1
 for <qemu-riscv@nongnu.org>; Fri, 25 Apr 2025 05:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1745583170; x=1746187970; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=KsZbVntz61oea4I9vKgPtHvh0FZUfeKMD9DSBLAI6Jg=;
 b=ERuzZmnDjR2BoSvJvgbps67mhQ6D3ykdfp1kFkFnM7AcR4EFd3GlHk6X+qucYgRfLB
 J5sOfIU5IIUXKg/l+Lh4ML7YwEyhbxxARP3EdHvQUKmg1IIkRP/POFBHMpkwVFalfimv
 F2T3FZWLDeSDG663iXkA8wxJTM8Y85ddOL1CbnfUpD+OczUxoXVsLqXnSICfkxzNkA1H
 6AnMZSwZdR4xbqBNtkHX0Pw0221iFkHm2Cy1gZMt3bJVGz4Gu5Dq96rW1oj/hxnQVAt6
 b2MYZlg2uFO6vR7zRC2ROVMMOWMiF8m76A4GBHkBLQDX8gjIWhR4gZoDHuhHxnbeII6r
 ed1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745583170; x=1746187970;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KsZbVntz61oea4I9vKgPtHvh0FZUfeKMD9DSBLAI6Jg=;
 b=BLSbCp7QpRxmU79urJkeggnIqqhP4df9EvSdZ/D+rcFgeO/R0IjD02iv5a/r8htKHk
 p6afghWwa37s9liuC1RHJFcgwkXPvUdU0rqRUr3Y2Y8y3H1ClB28R/8qbt42CN5c1xM1
 Q9+EIOzbR5WWR7Y4FcUNxDNxV623SC+nlV4USmTaCEXHLVk9xw8iMyaqtKmaOtj3C3ma
 gvqRvhRW1FusaElefUve+2e5NqEYi7tGpJajGdquaO+jcGCdgxbX4jbytKn02aZaqt/3
 6JHAovBPFqOq7PfAzumKBx1lTTQ9n8PpH5sM4lUmiNTvbFUPv8LW4RSKecpwHKwk1+i+
 keXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1OWXY2zezC0i9n+0W8yyYdVYoZfzB5BW8GQdd7KvBdSAxYirKfcqxUpeYyrEaY+q4aqmRr07k2/UD@nongnu.org
X-Gm-Message-State: AOJu0YyTAldzENOo8EIuP6Nb8q5lmR/VPGn5YzhEgQThJzZh3SEHlEOV
 qE0MDMJQmFFOvRmNUrucWu9PnNQMZFwVwA9D7W2k7I2o+WnZSALf4rLojfqGbxE=
X-Gm-Gg: ASbGnctoo0kf23MD95JaqMS8eSreVoRKe7rqds4kvsMEnKYFsN+8OZIlWL5Uso02fZ/
 Rf0nmpA6D8HSw2ZL9RabvaV0hnkZEeKPVIvsex5OpzhOHOiz1oI1kYEHPZJDNme7FaBVdLIBqe4
 ikGzhiUDRr/i+3qthMvh9wxf+yoi+bOAbkfvj5i/ZTOmQPY/qzVqDQsUE6KtGwd8qZ7o+Dhb8tR
 PmLFtSq91kArJafJ74sfVZsJQSFhnOStSrNK8Lw8sTU8ZhpNfbFaLW2YPyoaqAv90QAvVCqfYAP
 XlxzsxxPqkwQue2aqtJvoxfDW3RA
X-Google-Smtp-Source: AGHT+IFltgaSnu+NQRT8JQTVq/kPwuQUiuq4uDFdzKtnx9c66sFgwltEZpiXzqtTHawaPCsNHclKOQ==
X-Received: by 2002:a05:6000:22ca:b0:38d:ba8e:7327 with SMTP id
 ffacd0b85a97d-3a074cf18aamr1529689f8f.8.1745583170182; 
 Fri, 25 Apr 2025 05:12:50 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::f716])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073e46538sm2193295f8f.64.2025.04.25.05.12.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 05:12:49 -0700 (PDT)
Date: Fri, 25 Apr 2025 14:12:48 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
Subject: Re: [PATCH v2 9/9] target/riscv/kvm: add scounteren CSR
Message-ID: <20250425-6bc102914dd39e7896cefdff@orel>
References: <20250425113705.2741457-1-dbarboza@ventanamicro.com>
 <20250425113705.2741457-10-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425113705.2741457-10-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x42a.google.com
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

On Fri, Apr 25, 2025 at 08:37:05AM -0300, Daniel Henrique Barboza wrote:
> Now that CPURISCVState::scounteren is a target_ulong, add support for
> the scounteren KVM CSR.
> 
> Reported-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/kvm/kvm-cpu.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
> index e37fa38c07..5db63e78e2 100644
> --- a/target/riscv/kvm/kvm-cpu.c
> +++ b/target/riscv/kvm/kvm-cpu.c
> @@ -250,6 +250,7 @@ static KVMCPUConfig kvm_csr_cfgs[] = {
>      KVM_CSR_CFG("sip", mip, RISCV_CSR_REG(sip)),
>      KVM_CSR_CFG("satp", satp, RISCV_CSR_REG(satp)),
>      KVM_CSR_CFG("senvcfg", senvcfg, RISCV_CSR_REG(senvcfg)),
> +    KVM_CSR_CFG("scounteren", scounteren, RISCV_CSR_REG(scounteren)),
>  };
>  
>  static void *kvmconfig_get_env_addr(RISCVCPU *cpu, KVMCPUConfig *csr_cfg)
> @@ -700,6 +701,7 @@ static void kvm_riscv_reset_regs_csr(CPURISCVState *env)
>      env->mip = 0;
>      env->satp = 0;
>      env->senvcfg = 0;
> +    env->scounteren = 0;

Let's keep these in struct kvm_riscv_csr order here and everywhere else
they get listed, like in kvm_csr_cfgs[]

>  }
>  
>  static int kvm_riscv_get_regs_fp(CPUState *cs)
> -- 
> 2.49.0
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

