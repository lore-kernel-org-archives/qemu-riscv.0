Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BF7FC4828F
	for <qemu-riscv@archiver.kernel.org>; Thu,  8 Feb 2024 19:31:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rYA7b-0005kP-07; Thu, 08 Feb 2024 14:31:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rYA7Z-0005jv-MR
 for qemu-riscv@nongnu.org; Thu, 08 Feb 2024 14:31:41 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rYA7Y-0004S3-4h
 for qemu-riscv@nongnu.org; Thu, 08 Feb 2024 14:31:41 -0500
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-6e055baec89so158651b3a.1
 for <qemu-riscv@nongnu.org>; Thu, 08 Feb 2024 11:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707420698; x=1708025498; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8QT7kCXOTifYU7mxRxXV5m/JtFcsZsEIRolTsYJp0Ns=;
 b=a9/3o9X10FsKMHE30yA6ygCNzM+GVG9NTZvAMNdTIF3c/0ny+nL9Mx5//PFdrTRSPW
 iyyDgiQ5r9LzANJuokV+z6dZqQnm/6rvY6sBYJy5MsrE8+y2Xz1sisbPzsJ2K+IKt0OT
 YiaP3Bi5/r7shdImWLhohd0Of9rJbE4T3MeuCBQieKgE//H1GMORRJipsIzfDGtVSCPB
 3ox3I9miHoYJrigJOWEG72s90LlM6q/GWQL2BbkIdJWuXzqbc4fdywJVPPOci/LXR2hD
 y10YiFIZMfASrnK4/F8MRp1zFQpGL7x7GhzPcA9tGrBdxzHs/2JrdM0HQrLhPR1trCL9
 wsDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707420698; x=1708025498;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8QT7kCXOTifYU7mxRxXV5m/JtFcsZsEIRolTsYJp0Ns=;
 b=WVfbIPVtSb/T8lurqUowu+IAuH23vkpClcjO8+dGaYYAMsygYZWRzaordlRI3ibMOz
 XS5yFC2ycB8Vg7tm38Bj+V05+aeFOKXe+gaQZ6ueueuso8zioDFv8MFf5oo5VuiHKnrm
 EZNMt0c6rdZVeslkEvt7QVdrBsNcZD5hDCQI+6A7kiL62h46G6luu8VWoY6vh5e1X4jG
 NmurnLx+1fzTCZs00GTg1+PCyD0E5mMo1m/qnWWQwuK7D0jmI+gHN+6sn4NI/3VZ0pfs
 LOO0d7WJkMHYE86Owjj3VGVvQ72avrsZV8HQ1jx0I/xHRbToeptVdiJeC5MWuOudsEN6
 FrvA==
X-Gm-Message-State: AOJu0YwrggB6cCMfPyVukpp8CiLxi14YfdhNFpyaEivdkAKfRRSSa9Sl
 2+2Pkl+RyiZW2POjjio5nfztoybndqZBrtY01Kf147ufi9cAjUXdWzJnJj6ZvBA=
X-Google-Smtp-Source: AGHT+IEaCaHGWSFq6zIwTQD8kiZ/LugApan5XnM+2vyWMYUdYq3dvCRw5Ti9qAbyAUrSCRxKQzGC6g==
X-Received: by 2002:a05:6a00:27a1:b0:6e0:5cb7:168c with SMTP id
 bd33-20020a056a0027a100b006e05cb7168cmr5963228pfb.17.1707420696666; 
 Thu, 08 Feb 2024 11:31:36 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXVuh0jxqYrKmUVfLpPSM+H8L9yAfPYRYKOr1ap4YJ7dgtt3nmP0m/JAbxXsG5gnsR9PCKelWaPIPr3qzz3TlSu+7vvpm9Ox44Yfjv1RblBQdXVddfApLhjdVugVj5WGz1KPASa1L4YAbpIXPYHRHoHOtQXpdlDI5kMvvINBLNAV/jWIIkF9Nnbrk5aTC+2rmH86nRHq7l3oqZUpIDDB925YRnPm4uIgb5MYQ/uYxDSQruRtYQBoQBrJEHL0Ri5IDulrLskqRMJ503em0U+mQ2o5nWoBDy5F8PiQdaiibbPHYY4rfM9qm8GYcDwofeFtHqqRmBGG2UBzlNR4AiTFKyjDr7L4N3/4/9GVQ8nzIAR2SMZcDbS3NCs2Z0L3LI=
Received: from [192.168.4.112] (066-027-223-101.inf.spectrum.com.
 [66.27.223.101]) by smtp.gmail.com with ESMTPSA id
 z29-20020a637e1d000000b005c2420fb198sm205629pgc.37.2024.02.08.11.31.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Feb 2024 11:31:36 -0800 (PST)
Message-ID: <512e3adf-5879-44a4-9adb-04cdcf06579b@linaro.org>
Date: Thu, 8 Feb 2024 09:31:32 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] target/riscv: Update $ra with current $pc in
 trans_cm_jalt()
To: Jason Chien <jason.chien@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20240207081820.28559-1-jason.chien@sifive.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240207081820.28559-1-jason.chien@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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

On 2/6/24 22:18, Jason Chien wrote:
> The original implementation sets $pc to the address read from the jump
> vector table first and links $ra with the address of the next instruction
> after the updated $pc. After jumping to the updated $pc and executing the
> next ret instruction, the program jumps to $ra, which is in the same
> function currently executing, which results in an infinite loop.
> This commit stores the jump address in a temporary, updates $ra with the
> current $pc, and copies the temporary to $pc.
> 
> Signed-off-by: Jason Chien <jason.chien@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> ---
>   target/riscv/insn_trans/trans_rvzce.c.inc | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

> 
> diff --git a/target/riscv/insn_trans/trans_rvzce.c.inc b/target/riscv/insn_trans/trans_rvzce.c.inc
> index 2d992e14c4..cd234ad960 100644
> --- a/target/riscv/insn_trans/trans_rvzce.c.inc
> +++ b/target/riscv/insn_trans/trans_rvzce.c.inc
> @@ -293,12 +293,14 @@ static bool trans_cm_jalt(DisasContext *ctx, arg_cm_jalt *a)
>   {
>       REQUIRE_ZCMT(ctx);
>   
> +    TCGv addr = tcg_temp_new();
> +
>       /*
>        * Update pc to current for the non-unwinding exception
>        * that might come from cpu_ld*_code() in the helper.
>        */
>       gen_update_pc(ctx, 0);
> -    gen_helper_cm_jalt(cpu_pc, tcg_env, tcg_constant_i32(a->index));
> +    gen_helper_cm_jalt(addr, tcg_env, tcg_constant_i32(a->index));
>   
>       /* c.jt vs c.jalt depends on the index. */
>       if (a->index >= 32) {
> @@ -307,6 +309,8 @@ static bool trans_cm_jalt(DisasContext *ctx, arg_cm_jalt *a)
>           gen_set_gpr(ctx, xRA, succ_pc);
>       }
>   
> +    tcg_gen_mov_tl(cpu_pc, addr);
> +
>       tcg_gen_lookup_and_goto_ptr();
>       ctx->base.is_jmp = DISAS_NORETURN;
>       return true;


