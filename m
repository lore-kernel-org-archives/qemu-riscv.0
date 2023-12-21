Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28CC2C46CCD
	for <qemu-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 13:25:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rGJ3Z-0006sb-Fi; Thu, 21 Dec 2023 08:25:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rGJ3Y-0006rt-6y
 for qemu-riscv@nongnu.org; Thu, 21 Dec 2023 08:25:44 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rGJ3T-0008WO-Og
 for qemu-riscv@nongnu.org; Thu, 21 Dec 2023 08:25:43 -0500
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1d408c2908cso1865745ad.1
 for <qemu-riscv@nongnu.org>; Thu, 21 Dec 2023 05:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1703165138; x=1703769938; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dtCpxS5Y5FkbYHPyPu9ckoSAdShFhEOJjAO41TPz1fc=;
 b=OuFqvPPL/gf6XLSvU091QrezYv2n5vn8DfYSOPPEfebUXWYcxxKRTpyAPwjcJHdlZm
 12uEGPfFjp+9JE8GlUCpYYqFSMLNwi3hdaLn2BpeVNgh87JER1ijAehQVx5FbzqPaZ+a
 xAFduEuyuxrsnPfDXg2dgtPwYcu7KdwNk23o7pR0K4J1mlvKBfzm1WWECQwcBlSaZneF
 6P2RBsyknf7Fn3FqiMORPk575YTh//vjJWsYUf9uE0oGuyEVYKSe6VYINZa8uSwvNpzG
 K7gsnMtMn+slyJ+apvtpFoplLlQyMJ3FxAtXzE4Fytvm2JO532xPMtHszGRw2XWm6NBA
 Cpfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703165138; x=1703769938;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dtCpxS5Y5FkbYHPyPu9ckoSAdShFhEOJjAO41TPz1fc=;
 b=N/8fTrfdScDA73/flDYDnLa0Z4VqBQ9hBiGoFxC7HjPbM8sa+AbG/VGve7O8D9Kfe6
 eELobsvZiYbSScK2HiDCxbkdIOfDu20fgSDLQTDxPYH183ma6qTOXprRFu6+DYbIGErB
 NOS/WEJDTqToO9fmmgs0+1efITAZtYwyjhAdAsVjyauRb3SOZKBPYn4smbdRQ/4CyGHD
 kY3itWvBsURYZOfuZXNc71a8inL/axtnKOxqWJWYxqVJi4dxa1CpECKHLVXmSfTkcxgP
 nARnYezRnM+tDeedebcP82fNIIqZZHPjr3jxXx2FCZSjhQe2oXjuRC2YtDTh8d7oleXr
 +0lQ==
X-Gm-Message-State: AOJu0Yxu96eC9HROqFO9vXQajOOepjxghIn4/zFk4pndOZyIPn+bc8qz
 YTl2OrI8Rw74+mhb++LPP3tcYw==
X-Google-Smtp-Source: AGHT+IGmQ4NVTK242CFrIh95WymHvHQRAmABQI/g7pxJl1ifoOvOKw0JhFlZD7/7t1UrpNArEKrydQ==
X-Received: by 2002:a17:902:cec7:b0:1d3:df5f:65fd with SMTP id
 d7-20020a170902cec700b001d3df5f65fdmr3797948plg.126.1703165137953; 
 Thu, 21 Dec 2023 05:25:37 -0800 (PST)
Received: from [192.168.68.110] ([179.93.21.205])
 by smtp.gmail.com with ESMTPSA id
 ja15-20020a170902efcf00b001d3ef57d916sm1618410plb.10.2023.12.21.05.25.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Dec 2023 05:25:37 -0800 (PST)
Message-ID: <01b04447-ec85-448a-9b84-e73e35864412@ventanamicro.com>
Date: Thu, 21 Dec 2023 10:25:33 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] target/riscv: UPDATE xATP write CSR
Content-Language: en-US
To: Irina Ryapolova <irina.ryapolova@syntacore.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com
References: <20231212110305.45443-1-irina.ryapolova@syntacore.com>
 <20231212110305.45443-2-irina.ryapolova@syntacore.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20231212110305.45443-2-irina.ryapolova@syntacore.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x635.google.com
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



On 12/12/23 08:03, Irina Ryapolova wrote:
> Added xATP_MODE validation for vsatp/hgatp CSRs.
> The xATP register is an SXLEN-bit read/write WARL register, so
> the legal value must be returned (See riscv-privileged-20211203, SATP/VSATP/HGATP CSRs).
> 
> Signed-off-by: Irina Ryapolova <irina.ryapolova@syntacore.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/csr.c | 52 ++++++++++++++++++++++++++--------------------
>   1 file changed, 29 insertions(+), 23 deletions(-)
> 
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 735fb27be7..6d7a3dd9aa 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1282,6 +1282,32 @@ static bool validate_vm(CPURISCVState *env, target_ulong vm)
>       return get_field(mode_supported, (1 << vm));
>   }
>   
> +static target_ulong legalize_xatp(CPURISCVState *env, target_ulong old_xatp,
> +                                  target_ulong val)
> +{
> +    target_ulong mask;
> +    bool vm;
> +    if (riscv_cpu_mxl(env) == MXL_RV32) {
> +        vm = validate_vm(env, get_field(val, SATP32_MODE));
> +        mask = (val ^ old_xatp) & (SATP32_MODE | SATP32_ASID | SATP32_PPN);
> +    } else {
> +        vm = validate_vm(env, get_field(val, SATP64_MODE));
> +        mask = (val ^ old_xatp) & (SATP64_MODE | SATP64_ASID | SATP64_PPN);
> +    }
> +
> +    if (vm && mask) {
> +        /*
> +         * The ISA defines SATP.MODE=Bare as "no translation", but we still
> +         * pass these through QEMU's TLB emulation as it improves
> +         * performance.  Flushing the TLB on SATP writes with paging
> +         * enabled avoids leaking those invalid cached mappings.
> +         */
> +        tlb_flush(env_cpu(env));
> +        return val;
> +    }
> +    return old_xatp;
> +}
> +
>   static target_ulong legalize_mpp(CPURISCVState *env, target_ulong old_mpp,
>                                    target_ulong val)
>   {
> @@ -2997,31 +3023,11 @@ static RISCVException read_satp(CPURISCVState *env, int csrno,
>   static RISCVException write_satp(CPURISCVState *env, int csrno,
>                                    target_ulong val)
>   {
> -    target_ulong mask;
> -    bool vm;
> -
>       if (!riscv_cpu_cfg(env)->mmu) {
>           return RISCV_EXCP_NONE;
>       }
>   
> -    if (riscv_cpu_mxl(env) == MXL_RV32) {
> -        vm = validate_vm(env, get_field(val, SATP32_MODE));
> -        mask = (val ^ env->satp) & (SATP32_MODE | SATP32_ASID | SATP32_PPN);
> -    } else {
> -        vm = validate_vm(env, get_field(val, SATP64_MODE));
> -        mask = (val ^ env->satp) & (SATP64_MODE | SATP64_ASID | SATP64_PPN);
> -    }
> -
> -    if (vm && mask) {
> -        /*
> -         * The ISA defines SATP.MODE=Bare as "no translation", but we still
> -         * pass these through QEMU's TLB emulation as it improves
> -         * performance.  Flushing the TLB on SATP writes with paging
> -         * enabled avoids leaking those invalid cached mappings.
> -         */
> -        tlb_flush(env_cpu(env));
> -        env->satp = val;
> -    }
> +    env->satp = legalize_xatp(env, env->satp, val);
>       return RISCV_EXCP_NONE;
>   }
>   
> @@ -3506,7 +3512,7 @@ static RISCVException read_hgatp(CPURISCVState *env, int csrno,
>   static RISCVException write_hgatp(CPURISCVState *env, int csrno,
>                                     target_ulong val)
>   {
> -    env->hgatp = val;
> +    env->hgatp = legalize_xatp(env, env->hgatp, val);
>       return RISCV_EXCP_NONE;
>   }
>   
> @@ -3772,7 +3778,7 @@ static RISCVException read_vsatp(CPURISCVState *env, int csrno,
>   static RISCVException write_vsatp(CPURISCVState *env, int csrno,
>                                     target_ulong val)
>   {
> -    env->vsatp = val;
> +    env->vsatp = legalize_xatp(env, env->vsatp, val);
>       return RISCV_EXCP_NONE;
>   }
>   

