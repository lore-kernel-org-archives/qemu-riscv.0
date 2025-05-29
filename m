Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 861C8C54FB3
	for <qemu-riscv@archiver.kernel.org>; Thu, 29 May 2025 11:56:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uKbsC-0007hA-HM; Thu, 29 May 2025 07:56:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1uKbs6-0007g8-8J
 for qemu-riscv@nongnu.org; Thu, 29 May 2025 07:56:31 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1uKbs3-0003YO-K7
 for qemu-riscv@nongnu.org; Thu, 29 May 2025 07:56:29 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-450ce3a2dd5so6863215e9.3
 for <qemu-riscv@nongnu.org>; Thu, 29 May 2025 04:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1748519785; x=1749124585; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7mWMNOiewFH0KOD+eh1/kf1jNm9uWTWLWCR8uU/CijY=;
 b=B+qnaE+HYI7vUG5NkKqgwZNbBwNYKJWicayTq/F2sKVeNHhkG+Yrbej+wZfYSygzLW
 ztPtbC3UjYe3gBKmpP0KTkLKt6LDfLoBVdInAxOcfpJRS5/x+JgdJt7zMX7LeABUOJZb
 SPgUId2WVslzd6EvS0Jup4El9NGxbkuBR04KivpOmqbu+T+Gx2yjbNE3RxEZV52hmURf
 tpgA3yTf7K3q6AI9gue520E8rnMM6DFCmG8xqEySGoN6xvfIqinzfmlL7F+rKVEhwAMp
 9GVn9Gj08Z3SrTqM7CDB4xoAxXjg/esb/jRY60QGlFTwH7k2vYiZJZdrMLhNlQMf1H7m
 lsoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748519785; x=1749124585;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7mWMNOiewFH0KOD+eh1/kf1jNm9uWTWLWCR8uU/CijY=;
 b=dN6yEWZrD3o/vnSEzfoPHET5PRqC3pIABOxiI+sUuJv2uWs+jrd5hFvr+0ovqSeCBw
 H9C6j2XfSwyrmNZaMS6r1ymYwVGosKNtz5xk3Vix2wwqFnP+F+it74vTrAJUhsNEv2Y2
 05rYsgA2oLEZU9p58uMzTt3wd4bthRKujPCJ8Dlgsq/Qr3b1YGAWVlPOqhPw+Coh6ZCv
 nQB+y/Apr2aHb4Lg0QkVB9hs6jGuK+PEK+onDI5qVuXbswHl7PmVj7wg5L/TVMZdYSf2
 UadzX2f1zkzlseA5FV21vvGwviGpDUpZ0lW0NvZ5miO3DhoCEO0D34jfAVhaXdHqomqv
 WLpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUS+yB5MsScWlMd0iXY5lTZenRSRfEEyLWwVtS1geA134nEIgUe6cmnb2d/4YSczLNi0CtNS6wryYHO@nongnu.org
X-Gm-Message-State: AOJu0Yyh+ocOpdD5hfVoaTxWpLeBgzwwI0bKrsu9nBzOOvQAU3Z00sFE
 nY+2sbzmC+QxUOihtmjlPbU46YJ0whpbDksismUU5RofuvCFKzREq47eqXsh+bY/GOk=
X-Gm-Gg: ASbGncsGneIIfH3V4TvQhMyPp4yAKIIx0NdZmqS17sE8daBQRHVqCixURLZ51PeCkNB
 oQ0ijKIUZ2EwJIA/JAoELlumnosupdAFB7RlRsuVdslGbFdo75gXwP8H7TC7IQgIqR6VaE2UEob
 gP9D0+YWcUTn1qOxiE6F/iOUm2an6jY7TBuYsxMrxWJW06mIykFtMxlhgChy94HjaZiHqTWp+fu
 YcFYLjChLrixFInxppcnt2Lw5iTKAiYLMXXSZkiAUPXw6A0YeM4J8WfUTKO+NGmWTwcai4ppqVq
 c8i5LjOs0ZymcijvrVBn1ArKUcJhKxXv4GZb0TcO7m9gz6wUTQ==
X-Google-Smtp-Source: AGHT+IEVL4IdjrTarXTh7wvxU6OZY2L6myoxPIKhOIPXAC5jRhtZ89lc2Uk3PSu/hiUJKf8S2D9UCQ==
X-Received: by 2002:a05:6000:4014:b0:3a4:ed2f:e80c with SMTP id
 ffacd0b85a97d-3a4ed2fea0amr3980139f8f.31.1748519785342; 
 Thu, 29 May 2025 04:56:25 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::ce80])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4efe5b887sm1853198f8f.18.2025.05.29.04.56.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 May 2025 04:56:24 -0700 (PDT)
Date: Thu, 29 May 2025 13:56:24 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com, 
 Fei Wu <wu.fei9@sanechips.com.cn>
Subject: Re: [PATCH v3 2/4] target/riscv: Add server platform reference cpu
Message-ID: <20250529-9c1e4e13c8dad55fddbd31e3@orel>
References: <20250528200129.1548259-1-dbarboza@ventanamicro.com>
 <20250528200129.1548259-3-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528200129.1548259-3-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x331.google.com
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

On Wed, May 28, 2025 at 05:01:27PM -0300, Daniel Henrique Barboza wrote:
> From: Fei Wu <wu.fei9@sanechips.com.cn>
> 
> The harts requirements of RISC-V server platform [1] require RVA23 ISA
> profile support, plus Sv48, Svadu, H, Sscofmpf etc. This patch provides
> a virt CPU type (rvsp-ref) as compliant as possible.
> 
> [1] https://github.com/riscv-non-isa/riscv-server-platform/blob/main/server_platform_requirements.adoc
> 
> Signed-off-by: Fei Wu <fei2.wu@intel.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu-qom.h |  1 +
>  target/riscv/cpu.c     | 11 +++++++++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
> index 1ee05eb393..70978fd53c 100644
> --- a/target/riscv/cpu-qom.h
> +++ b/target/riscv/cpu-qom.h
> @@ -55,6 +55,7 @@
>  #define TYPE_RISCV_CPU_VEYRON_V1        RISCV_CPU_TYPE_NAME("veyron-v1")
>  #define TYPE_RISCV_CPU_TT_ASCALON       RISCV_CPU_TYPE_NAME("tt-ascalon")
>  #define TYPE_RISCV_CPU_XIANGSHAN_NANHU  RISCV_CPU_TYPE_NAME("xiangshan-nanhu")
> +#define TYPE_RISCV_CPU_RVSP_REF         RISCV_CPU_TYPE_NAME("rvsp-ref")
>  #define TYPE_RISCV_CPU_HOST             RISCV_CPU_TYPE_NAME("host")
>  
>  OBJECT_DECLARE_CPU_TYPE(RISCVCPU, RISCVCPUClass, RISCV_CPU)
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 4a30cf8444..ec2fbc0e78 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -3166,6 +3166,17 @@ static const TypeInfo riscv_cpu_type_infos[] = {
>          .cfg.max_satp_mode = VM_1_10_SV39,
>      ),
>  
> +    DEFINE_RISCV_CPU(TYPE_RISCV_CPU_RVSP_REF, TYPE_RISCV_VENDOR_CPU,
> +        .misa_mxl_max = MXL_RV64,
> +        .profile = &RVA23S64,
> +
> +        /* ISA extensions */
> +        .cfg.ext_zkr = true,
> +        .cfg.ext_svadu = true,
> +
> +        .cfg.max_satp_mode = VM_1_10_SV57,

This is still missing several extensions required by the platform spec.

Sdtrig
Sdext
Ssccfg
Ssstrict
Ssaia

Thanks,
drew

> +    ),
> +
>  #if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
>      DEFINE_RISCV_CPU(TYPE_RISCV_CPU_BASE128, TYPE_RISCV_DYNAMIC_CPU,
>          .cfg.max_satp_mode = VM_1_10_SV57,
> -- 
> 2.49.0
> 

