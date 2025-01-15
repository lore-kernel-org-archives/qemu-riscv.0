Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C1AEC02180
	for <qemu-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 08:36:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tXyt9-0002sO-4F; Wed, 15 Jan 2025 03:36:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1tXyt7-0002nG-SW
 for qemu-riscv@nongnu.org; Wed, 15 Jan 2025 03:36:33 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1tXyt1-0006zG-Sm
 for qemu-riscv@nongnu.org; Wed, 15 Jan 2025 03:36:33 -0500
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5d0d32cd31aso9121992a12.0
 for <qemu-riscv@nongnu.org>; Wed, 15 Jan 2025 00:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1736930186; x=1737534986; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5oH6RFdMLscFZUJ99jK6Qzwu0OGgn8EU6WO5+shP+Po=;
 b=BDsUtFyCNNNJLvy/weLGu1RK/Y6S94qebvSRRpwNHjOy9MtAUwre6EHHUJudKHVJIo
 HJRMVLS1OUwmNvzMBPwoi8vIWneMQzvsnKzaMbLG2FJfheboV+E/tNIjMdtFqmoPRMUz
 qvFz2XWgsefni0g2TyUJhSUWwdACmCczCCCUkBFWBXHFDh5y1M4vT/kMoXj3dfGTGOaO
 oGKZJ3dr/2TSf+MkDtltoC3FFSK3+j6i97BzF2qwZfIcIqxQrKektOeIA7fpN24yb7vY
 xmmXR1nwE47mHWsmwit3A2XnYHv2r8EKgKEs8ILlRswp3hKunhIxGyrNQ+BIuEoure2S
 kXBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736930186; x=1737534986;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5oH6RFdMLscFZUJ99jK6Qzwu0OGgn8EU6WO5+shP+Po=;
 b=hQBXVNxOCE7Umh+y8MGwThFq+9GyaepGkFqa5krSa+1PomLiWdC2TdO2cxFVSZL49E
 EgkyxXHRSIgLfQuUam8wT75GPJnc4Na85/243zFY8MGzPe6W2M6Qx4kOJs6mZMtDM4xY
 cacIJNGXV/bFxKlExbPdF15L6rLRj6SvZEA7gUUhwrMffTurQFNfNwj18Ks6L3rjD4lM
 wiiUpXzRWI/sQlih4odIH8WCFwAk5G5IgRVqs+GZE3itIjqWeDtZG1bj1FqRH7ti5s65
 3AMuWYOg4XF0lAiKbK3tgSn/MQ1j726FzTYOiyMH0X6gT88TraLpKS1IdWZ5bMGU7yx9
 HWcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/232PzDiju3QN0cIRokr+PYMuQ+ADmrFW6PW1hGKsSe9Bgy6siHQ80TJ/L2JsbRx+15QmpqWYnBok@nongnu.org
X-Gm-Message-State: AOJu0YzmJL+k2ThhyIAn8Ju3FOoawMR6FPWviKxy8vq37rfNoHUTmFoN
 cP17ljr7CFaB2uRL6YajkCYZM9CFIXvExxcv369hYcnsdCo644rq5K3HscU4toI=
X-Gm-Gg: ASbGncuBdg3f2enDoTIadF87hNa/Iu9q2rwrBNi6GtVaBJX3s4Gx4t0acUYUr+Tp+tN
 UXwJKj5xoqVVFkoHDxsxgSlWX3irUvlJQhFcCbqmOall9mScxUjDXyZBnt1wVXrSCG/Tgz6uRqZ
 5lkzuQHgC6JMfuwFrq0bwS5P2pVw/SIvnjehBDTAcVDlEaTlURMKiwVOasASSQI2oLk0Y/6Xn/k
 Gpz1AGPqNHq6uyuqTx/d6K0OE4pl6kci+qrTxIMKX0rRnoOWX+RHcFKjkYDq9dyolcLYFjzpnsj
 sQ2lkpGWWQehz1pO6AAnVzKWUswM+A5hHNtoC6iyWQ==
X-Google-Smtp-Source: AGHT+IGbHxBgYKO/qlbE1yeVzlrCXimSBDkBLnMl+hj8s02Ak2nz4RkiN4tq7P+cHtqRfCs6jrigEw==
X-Received: by 2002:a05:6402:278f:b0:5d0:ed92:cdf6 with SMTP id
 4fb4d7f45d1cf-5d972e1c66bmr61321052a12.19.1736930185724; 
 Wed, 15 Jan 2025 00:36:25 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d9903c3333sm7364885a12.47.2025.01.15.00.36.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 00:36:25 -0800 (PST)
Date: Wed, 15 Jan 2025 09:36:24 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH v2 2/4] target/riscv: use RVB in RVA22U64
Message-ID: <20250115-6e22221375223c8e6236182b@orel>
References: <20250114190001.1650942-1-dbarboza@ventanamicro.com>
 <20250114190001.1650942-3-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250114190001.1650942-3-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x52e.google.com
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

On Tue, Jan 14, 2025 at 03:59:59PM -0300, Daniel Henrique Barboza wrote:
> From the time we added RVA22U64 until now the spec didn't declare 'RVB'
> as a dependency, using zba/zbb/zbs instead. Since then the RVA22 spec
> [1] added the following in the 'RVA22U64 Mandatory Extensions' section:
> 
> "B Bit-manipulation instructions
> 
> Note: The B extension comprises the Zba, Zbb, and Zbs extensions. At the
> time of RVA22U64's ratification, the B extension had not yet been
> defined, and so RVA22U64 explicitly mandated Zba, Zbb, and Zbs instead.
> Mandating B is equivalent."
> 
> It is also equivalent to QEMU (see riscv_cpu_validate_b() in
> target/riscv/tcg/tcg-cpu.c).
> 
> Finally, RVA23U64 [2] directly mentions RVB as a mandatory extension,
> not citing zba/zbb/zbs.
> 
> To make it clear that RVA23U64 will extend RVA22U64 (i.e. RVA22 is a
> parent of RVA23), use RVB in RVA22U64 as well.
> 
> (bios-tables-test change: RVB added to riscv,isa)
> 
> [1] https://github.com/riscv/riscv-profiles/blob/main/src/profiles.adoc#61-rva22u64-profile
> [2] https://github.com/riscv/riscv-profiles/blob/main/src/rva23-profile.adoc#rva23u64-profile
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.c                |   2 +-
>  tests/data/acpi/riscv64/virt/RHCT | Bin 398 -> 400 bytes
>  2 files changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index b187ef2e4b..6fb4d5f374 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -2351,7 +2351,7 @@ static const PropertyInfo prop_marchid = {
>  static RISCVCPUProfile RVA22U64 = {
>      .parent = NULL,
>      .name = "rva22u64",
> -    .misa_ext = RVI | RVM | RVA | RVF | RVD | RVC | RVU,
> +    .misa_ext = RVI | RVM | RVA | RVF | RVD | RVC | RVB | RVU,
>      .priv_spec = RISCV_PROFILE_ATTR_UNUSED,
>      .satp_mode = RISCV_PROFILE_ATTR_UNUSED,
>      .ext_offsets = {
> diff --git a/tests/data/acpi/riscv64/virt/RHCT b/tests/data/acpi/riscv64/virt/RHCT
> index b14ec15e553200760a63aad65586913d31ea2edc..13c8025b868051485be5ba62974a22971a07bc6a 100644
> GIT binary patch
> delta 53
> zcmeBUp1{l%<l!7LfsuiM@#{n`13^7TMg~>JqB1j+%-qDZl;ot1UQ&#clNpsc(ij;S
> I3K$s}0ARKZK>z>%
> 
> delta 52
> zcmbQh+{ern<l!9B$H>6Im@tvcKtP9)kwJyAsLaeHGdD3UC3&N_6yxMHMkS6EMh1pF
> HMg|4|IwT82
> 
> -- 
> 2.47.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

