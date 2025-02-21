Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D8CBC021AA
	for <qemu-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 12:41:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tlSLJ-0002HM-VN; Fri, 21 Feb 2025 07:41:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1tlSLD-000297-7D
 for qemu-riscv@nongnu.org; Fri, 21 Feb 2025 07:41:16 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1tlSLB-000183-EE
 for qemu-riscv@nongnu.org; Fri, 21 Feb 2025 07:41:14 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-438a39e659cso13460355e9.2
 for <qemu-riscv@nongnu.org>; Fri, 21 Feb 2025 04:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1740141671; x=1740746471; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=C0X5zw5TMkgq5HOoY4d24ewLzA9dOn8VZ6X5Dd+IQbE=;
 b=FYDJg9d4T8RhulztVK8zZ06ofw2R/UneYLrbEH4FSHPXV+de06kz/7WJkVkyoHsStI
 LudcyZbfp63k2QEJg2r7jUpj/aEnapTH/1Deqyo8A1IJDBR+cH2t5zxC7a+OGmca0tJf
 cqUMWhnbWaJOkzLpREjEm0kbQGzYKlpBxJtLgEjuX5l3WmfoVKGRGI8Sq6rsivwgJcF5
 C9Tn6GFDvB5TZJ9hZooc34nylaPpAFixL+15iRoDB/E1EdfNbhUvTBrqUql9Xneugs7I
 HBLLIdu4NmuhTJS+eBMXsC6EYzRGF1MlqPmz1rmCSBQZ4n13HX7EtxfLQqrNWTFUyDyz
 yBPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740141671; x=1740746471;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C0X5zw5TMkgq5HOoY4d24ewLzA9dOn8VZ6X5Dd+IQbE=;
 b=Xue3uklKKysnYLlBYercYXWdG+3CsiGu4ZgofCJj86k0T1wFfyNNt1cdS9VnoTesfV
 KVp2L1gBeX2UYuZ69/jFdFtIWp0ojLxSFqiN4XH9w8eB45I8c0P8oZZ4otWH0cU6dtTU
 YwxDuPIv45Z9f8Qe8b3OX7hVOWR7alQ1v2P/PIumffoZTvjnoSS+Ioiu9bb4PGRy+3Mq
 fbzoUAQbMhvDkLJiErZOaIzNSQE/nXcUdXq2GuqxkPK8jEENGPTgUbu9ac4T2FJqUvst
 LjWIAZW6DaX0gbDAtO4nzv/2dSNbxHPqud2qh/kb2nbrHPIqbebd1rwFmCNhVFrnn5lL
 ODsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiCiiGdhYxTs8POmP8kuE5lX3m9Xpqu9yzd44XS3jh/3jf5cylD24AUqmPI6LWqGLysk6/w6xSkhbC@nongnu.org
X-Gm-Message-State: AOJu0YxS3zDt/i+eAkZxUXFDRahN6W9k3crqkyDGTJthqP7/1hblOHVX
 TdsuKCJafghm6Um3dj+9ERlu6I4zSmS81S08rlTP/aSbQmfO+4tgqmYxP1tzQKU=
X-Gm-Gg: ASbGnctmRqEiVTNYDbqDJc5DOAPAn74gnJbypnsQFUKPHRQlnd48lajDBHrjoxqF6NH
 9lwu//y/hIYO5jFxiFXlIGgFnU3Ixq+T232DM35SvCZqOhaA+wC5/hK0CxwBUuFuJ5w3qxj4CFM
 uOeAsgERc/qauMyqDd7aDvDk9RkkCjOrQq9q/YO7Cw1oopLiYYK0mhDtq85yQ35Z26J7gYRT2+1
 +nxCqtFcFNzVSk//k3ds8nD8Irw01gH+WhEoeewG1/m9+efs3ADS3ORafUN6Yd7DmA/Mx9t6QwS
 6XFNJ8iNsPbogQ==
X-Google-Smtp-Source: AGHT+IHkVp3h61Pqz4TE6QN44u5uuAMVJHrB4BKEQkiDn9oEWpILNb05ByxUGcR+gwFu+EXnDS5rWg==
X-Received: by 2002:a05:600c:1547:b0:439:884c:96ae with SMTP id
 5b1f17b1804b1-439aebda78fmr21473845e9.27.1740141671061; 
 Fri, 21 Feb 2025 04:41:11 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::766e])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b02d510bsm16116325e9.9.2025.02.21.04.41.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 04:41:10 -0800 (PST)
Date: Fri, 21 Feb 2025 13:41:09 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH 3/3] target/riscv/kvm: add extensions after 6.14-rc3 update
Message-ID: <20250221-c98a4b5352ab3d7534a234c2@orel>
References: <20250218163854.425607-1-dbarboza@ventanamicro.com>
 <20250218163854.425607-4-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218163854.425607-4-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x330.google.com
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

On Tue, Feb 18, 2025 at 01:38:54PM -0300, Daniel Henrique Barboza wrote:
> Expose ziccrse, zabha and svvptc.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/kvm/kvm-cpu.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
> index 23ce779359..471fd554b3 100644
> --- a/target/riscv/kvm/kvm-cpu.c
> +++ b/target/riscv/kvm/kvm-cpu.c
> @@ -274,6 +274,7 @@ static void kvm_riscv_update_cpu_misa_ext(RISCVCPU *cpu, CPUState *cs)
>  static KVMCPUConfig kvm_multi_ext_cfgs[] = {
>      KVM_EXT_CFG("zicbom", ext_zicbom, KVM_RISCV_ISA_EXT_ZICBOM),
>      KVM_EXT_CFG("zicboz", ext_zicboz, KVM_RISCV_ISA_EXT_ZICBOZ),
> +    KVM_EXT_CFG("ziccrse", ext_ziccrse, KVM_RISCV_ISA_EXT_ZICCRSE),
>      KVM_EXT_CFG("zicntr", ext_zicntr, KVM_RISCV_ISA_EXT_ZICNTR),
>      KVM_EXT_CFG("zicond", ext_zicond, KVM_RISCV_ISA_EXT_ZICOND),
>      KVM_EXT_CFG("zicsr", ext_zicsr, KVM_RISCV_ISA_EXT_ZICSR),
> @@ -283,6 +284,7 @@ static KVMCPUConfig kvm_multi_ext_cfgs[] = {
>      KVM_EXT_CFG("zihpm", ext_zihpm, KVM_RISCV_ISA_EXT_ZIHPM),
>      KVM_EXT_CFG("zimop", ext_zimop, KVM_RISCV_ISA_EXT_ZIMOP),
>      KVM_EXT_CFG("zcmop", ext_zcmop, KVM_RISCV_ISA_EXT_ZCMOP),
> +    KVM_EXT_CFG("zabha", ext_zabha, KVM_RISCV_ISA_EXT_ZABHA),
>      KVM_EXT_CFG("zacas", ext_zacas, KVM_RISCV_ISA_EXT_ZACAS),
>      KVM_EXT_CFG("zawrs", ext_zawrs, KVM_RISCV_ISA_EXT_ZAWRS),
>      KVM_EXT_CFG("zfa", ext_zfa, KVM_RISCV_ISA_EXT_ZFA),
> @@ -325,6 +327,7 @@ static KVMCPUConfig kvm_multi_ext_cfgs[] = {
>      KVM_EXT_CFG("svinval", ext_svinval, KVM_RISCV_ISA_EXT_SVINVAL),
>      KVM_EXT_CFG("svnapot", ext_svnapot, KVM_RISCV_ISA_EXT_SVNAPOT),
>      KVM_EXT_CFG("svpbmt", ext_svpbmt, KVM_RISCV_ISA_EXT_SVPBMT),
> +    KVM_EXT_CFG("svvptc", ext_svvptc, KVM_RISCV_ISA_EXT_SVVPTC),
>  };
>  
>  static void *kvmconfig_get_cfg_addr(RISCVCPU *cpu, KVMCPUConfig *kvmcfg)
> -- 
> 2.48.1
> 
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

