Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6380EC19776
	for <qemu-riscv@archiver.kernel.org>; Fri, 28 Feb 2025 13:21:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1to0If-0004zK-5q; Fri, 28 Feb 2025 08:21:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1to0Id-0004yZ-N2
 for qemu-riscv@nongnu.org; Fri, 28 Feb 2025 08:21:07 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1to0Ic-0001s3-2Y
 for qemu-riscv@nongnu.org; Fri, 28 Feb 2025 08:21:07 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-439a4dec9d5so22256985e9.0
 for <qemu-riscv@nongnu.org>; Fri, 28 Feb 2025 05:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1740748864; x=1741353664; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=H1Dx5ImyGZG6uec1FligJ1TR7rQ48uSzdtk1HRQIVEY=;
 b=npguhaCd4tEPi8cNuWtBeefBRyLgU29VTLQ+Jvej6Bj9H6h1oE6FHZQZVQd8UdA4GN
 6jJ/fmvlN/3y7wR4Eps3/244oJppIWEh2VNTtgsiTr7sZ0if7Wg8KSzHQHYthyxUmRBa
 Zfa6zdCM2x+llwWWaKNSxjahXBWSTyjo4b+WxHtd5uoCBKxrZSXMaMnwAhGEuVq0dxGf
 srvsmi5ZozaeXTWeZmZTr2Ye3HmgESweUZ5M2gfVAesq0fb6g1LNin3A+4d8hOOKGQ8e
 AfqWDPolXPe/NX8QY6fP/WbVt9jDYwKujmkp1P58SHrSmiti92BTUVM18o96HhWWrcGu
 7g5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740748864; x=1741353664;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H1Dx5ImyGZG6uec1FligJ1TR7rQ48uSzdtk1HRQIVEY=;
 b=H2TlOB/eHlfSs8MwYBgUlJeFYUE6janxpxoGf0sjlVMPM1u6KK+8d/koPj32PE0/q3
 aOuc1JvYHif1IpIrCtdy/iV7ksA/PetGZYc3ot9cFv94JDOkyQ12kJ24QzhjBcX2OeJA
 gHLBgDUPVjuKqCqhWa0+MAKMZDEDm4m+dTi/6IsCQ7hmEQz3lynzM44u3H20fVzR68aD
 zZoU5XwBYzDOMa150gI/d19N/yppGhHs1who/sFvF+rsnwbt9eE8E+0TDAHzO+BumR05
 FV+k6DNlbOn68lxjtz2IrUadbJZ29ZT1VhW+C/M3FdNCjoFvYhbn/1sNJWfWz9lP2Qur
 LKfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNOkvRs0gs8ye5cfAczsTiNqxLFBDcHnPfH6R8G03MLGrhmuvQXxSS98OKAQ0YUDlK4scCWRb3jd31@nongnu.org
X-Gm-Message-State: AOJu0Yx0PktkXYqGbJUxqCExSDJkYAyAgza8Rbc98qmShXEEkPEsXPlP
 Bl6OXU6SkGVwdirrBrdA9EUeZiHN83QDW/tyKINnRLLr+V56Tbe9vP5YAEhI7Rs=
X-Gm-Gg: ASbGncvFJ4/mpfS1rA+GSQLqqn5rWnvhtkRTS3TuA/UQV66OwlSg3T0glXhP42ceTM5
 +efbe1/pqYXMM9w4jUoKienjcR0g2sFHIrmZMxAdvEgU7l3wYYDZlDnKVRONxD8UlNhvOQUgeyU
 z2T8fdYpG7GjZWzSdJBRLuU8DL7elX67Ts1PMBBElssC1lzpvw3SEAmkS+AX5vw7lr2fFUw9Pw7
 EZ79cTlmradCJ0OwcihYClhhj9ZQgvet9i6kPNzKhxeLurAEwEfvES6KTYbuosx0hJIZ/+iTRsC
 f2UiHWTTofSK7w==
X-Google-Smtp-Source: AGHT+IEvYqecsF8gzPg87cDfUk4y0jW3qW56McBQKWhTmIcZUW+E1Mt77Uqo2UHa3GQHrncigKN6YA==
X-Received: by 2002:a05:600c:1d08:b0:439:9a40:aa0b with SMTP id
 5b1f17b1804b1-43ba675bb51mr27352675e9.25.1740748864432; 
 Fri, 28 Feb 2025 05:21:04 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::688c])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e47a66bcsm5161083f8f.21.2025.02.28.05.21.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2025 05:21:04 -0800 (PST)
Date: Fri, 28 Feb 2025 14:21:03 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, greentime.hu@sifive.com, 
 vincent.chen@sifive.com, frank.chang@sifive.com, jim.shu@sifive.com, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH v2 3/8] target/riscv/kvm: add KVM_REG_RISCV_CSR_SMSTATEEN
Message-ID: <20250228-aa65cab1325f4717a41d038f@orel>
References: <20250224082417.31382-1-yongxuan.wang@sifive.com>
 <20250224082417.31382-4-yongxuan.wang@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224082417.31382-4-yongxuan.wang@sifive.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x32f.google.com
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

On Mon, Feb 24, 2025 at 04:24:10PM +0800, Yong-Xuan Wang wrote:
> Add KVM_REG_RISCV_CSR_SMSTATEEN support to get/set the context of
> Smstateen extension in VS mode.
> 
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> ---
>  target/riscv/kvm/kvm-cpu.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
> index c7318f64cf12..d421c7a1b65d 100644
> --- a/target/riscv/kvm/kvm-cpu.c
> +++ b/target/riscv/kvm/kvm-cpu.c
> @@ -135,6 +135,9 @@ static uint64_t kvm_riscv_vector_reg_id(RISCVCPU *cpu,
>  #define RISCV_AIA_CSR_REG(name) \
>      (KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(name))
>  
> +#define RISCV_SMSTATEEN_CSR_REG(name) \
> +    (KVM_REG_RISCV_CSR_SMSTATEEN | KVM_REG_RISCV_CSR_SMSTATEEN_REG(name))
> +
>  #define KVM_RISCV_GET_CSR(cs, env, idx, reg) \
>      do { \
>          int _ret = kvm_get_one_reg(cs, RISCV_CSR_REG(env, idx), &reg); \
> @@ -687,10 +690,31 @@ static int kvm_riscv_put_regs_aia_csr(CPUState *cs)
>      return 0;
>  }
>  
> +static int kvm_riscv_get_regs_smstateen_csr(CPUState *cs)
> +{
> +    CPURISCVState *env = &RISCV_CPU(cs)->env;
> +
> +    KVM_RISCV_GET_CSR(cs, env,
> +                      RISCV_SMSTATEEN_CSR_REG(sstateen0), env->sstateen[0]);
> +
> +    return 0;
> +}
> +
> +static int kvm_riscv_put_regs_smstateen_csr(CPUState *cs)
> +{
> +    CPURISCVState *env = &RISCV_CPU(cs)->env;
> +
> +    KVM_RISCV_SET_CSR(cs, env,
> +                      RISCV_SMSTATEEN_CSR_REG(sstateen0), env->sstateen[0]);
> +
> +    return 0;
> +}
> +
>  static int kvm_riscv_get_regs_csr(CPUState *cs)
>  {
>      kvm_riscv_get_regs_general_csr(cs);
>      kvm_riscv_get_regs_aia_csr(cs);
> +    kvm_riscv_get_regs_smstateen_csr(cs);
>  
>      return 0;
>  }
> @@ -699,6 +723,7 @@ static int kvm_riscv_put_regs_csr(CPUState *cs)
>  {
>      kvm_riscv_put_regs_general_csr(cs);
>      kvm_riscv_put_regs_aia_csr(cs);
> +    kvm_riscv_put_regs_smstateen_csr(cs);
>  
>      return 0;
>  }
> -- 
> 2.17.1
>

Looks good other than the missing error checking/propagating in
kvm_riscv_get/put_regs_csr() which the general and aia registers are also
missing.

Thanks,
drew

