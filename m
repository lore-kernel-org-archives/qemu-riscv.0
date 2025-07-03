Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA370C83030
	for <qemu-riscv@archiver.kernel.org>; Thu,  3 Jul 2025 21:05:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uXR7O-0006yz-76; Thu, 03 Jul 2025 17:05:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uXR7L-0006xt-Mu
 for qemu-riscv@nongnu.org; Thu, 03 Jul 2025 17:05:16 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uXR7I-0003sX-VC
 for qemu-riscv@nongnu.org; Thu, 03 Jul 2025 17:05:15 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-7424ccbef4eso390949b3a.2
 for <qemu-riscv@nongnu.org>; Thu, 03 Jul 2025 14:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1751576711; x=1752181511; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xQAJsmbCcorVTn9mhPmve34tqI6+ze5GzNhH7tjY3Sg=;
 b=im81JJTKsXeLgzkGBGjhA/ZaZLJGS8agfVFcRy8rKlSkH+smMNVd39czE8EoYZm5m+
 Zd7pVDzN5NUWS8Egkpixk8mPOibgP+cv+3GvxP9SHTi7b/ZRsy3qZSPgIvoNuv2rHCwG
 B2LS9lumz+94iUwvvvqNywuRo8dgn3oKRgekg2sCYy9Yd6vMpdA1f7SsVsRD8fRiBZcs
 fDQHv03qA+vrYGtJ9Er9E9Wv9STW6AasalTTzJxcMWlo4jEZgGCu+42ouStkoLa6k8HI
 j8cjWRy8gweFauhKngx4p66ZnRyugmsQXgMkhWLgsFX2ooD/Moh8vKYK2ItXMudB7/K+
 UTyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751576711; x=1752181511;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xQAJsmbCcorVTn9mhPmve34tqI6+ze5GzNhH7tjY3Sg=;
 b=jWmqKf/KB5cbtrFIXlZdQybJXiuslYH/Qr/WXscLj/Gv/dYBzqkqbJGrlagm+pIVtt
 NjprCvxr/BubsDqECa62wMjKQXqnx43QxVFLwn4yT+GyiqVXnkoQHThHmnuSbNRugV5w
 g2ZRHnNJYpGYcSxaEyQidhZ+KL2gh8VjfWo4hzRkLiQ1niDkVqfoKZyuiRAyQOV8i9pn
 Yvs1RfHi/Y7H3QE112KnOZtTxbw13Uc8Y7v1jxwrgnZoPdpV2mfGjLIz+vtRl1PIDUdh
 5O6VE2Qkwi9nDytGeh8DkewC3VvVZIc1zI0qtamlIFC4dfmR7OseRLogFG6F4kMQmlai
 wo7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxcd7k41uAg/F0OQPkaRJr+Pz57MX/Z6ewuT+N5gIJXA3uMHsOZHdKlTG2lXxpJzJi24GVGErAmmxL@nongnu.org
X-Gm-Message-State: AOJu0Yx0cIUTXNm2b41oEBJYEF+7Oyn1f7RyiUNMcU6AyZ/J01Qr48Ma
 JsBkOvqv51GzJKjBFeqiT+HmuM8QniTu2qWbiBHISqlGTFhNR12QEumd+MzhNjt5oCU=
X-Gm-Gg: ASbGncsvvH60FeEn4dnv5VTC9CgTNZhpiwsAdWTybSWKbnsKte5sUq5WI/XDn5NY1mu
 WiXQ3rGclML1eHZ6wFUMmxZP/cCJNCaG08UtlddD2cwENIAbM556AZ7/kTMmxflfknlEWE5kdSU
 WmxVSN07tbhQqyIHss54aWW22rlozsh1ESjDYwLTityNfRngi+fVlPao7iBDbyJnWm5qaB2NBn9
 7rLJu0sTyx3fa/8cJGv8ZYkfc2CO4vjc0ca7b8oOiCdTCQQbr9ZjqS6zCScyAjVaTcNqtNmC4yO
 vcc5cosFEvpTpISmSmn2D7onKxwawaqP3oV4ry5CWFFpWe2QEcWW+igdYgQw4wTdBkCi+jUu/3x
 6PQ==
X-Google-Smtp-Source: AGHT+IEAvWGlx1JnzVtQpSNbiXAOqcfnCZKRxhnLn6u5kMGqwm6Ia5S+9kIy5H+Abe1jjQv2pfTLZA==
X-Received: by 2002:a05:6300:44:b0:220:6cf3:eef0 with SMTP id
 adf61e73a8af0-225ba630e8fmr394421637.37.1751576711221; 
 Thu, 03 Jul 2025 14:05:11 -0700 (PDT)
Received: from [192.168.68.110] ([189.110.107.157])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74ce35cca90sm435484b3a.37.2025.07.03.14.05.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jul 2025 14:05:10 -0700 (PDT)
Message-ID: <79aeae5b-9b7c-492c-b6f2-c3c2a963762c@ventanamicro.com>
Date: Thu, 3 Jul 2025 18:05:06 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] target/riscv: Fix MEPC/SEPC bit masking for IALIGN
To: Charalampos Mitrodimas <charmitro@posteo.net>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com
References: <20250703182157.281320-1-charmitro@posteo.net>
 <20250703182157.281320-2-charmitro@posteo.net>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250703182157.281320-2-charmitro@posteo.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x436.google.com
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



On 7/3/25 3:21 PM, Charalampos Mitrodimas wrote:
> According to the RISC-V Privileged Architecture specification, the low
> bit of MEPC/SEPC must always be zero. When IALIGN=32, the two low bits
> must be zero.
> 
> This commit fixes the behavior of MEPC/SEPC CSR reads and writes, and
> the implicit reads by MRET/SRET instructions to properly mask the
> lowest bit(s) based on whether the C extension is enabled:
> - When C extension is enabled (IALIGN=16): mask bit 0
> - When C extension is disabled (IALIGN=32): mask bits [1:0]
> 
> Previously, when vectored mode bits from STVEC (which sets bit 0 for
> vectored mode) were written to MEPC, the bits would not be cleared
> correctly, causing incorrect behavior on MRET.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2855
> Signed-off-by: Charalampos Mitrodimas <charmitro@posteo.net>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/csr.c       |  8 ++++----
>   target/riscv/internals.h | 11 +++++++++++
>   target/riscv/op_helper.c |  4 ++--
>   3 files changed, 17 insertions(+), 6 deletions(-)
> 
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index fb14972169..c33a6e86d2 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -3126,14 +3126,14 @@ static RISCVException write_mscratch(CPURISCVState *env, int csrno,
>   static RISCVException read_mepc(CPURISCVState *env, int csrno,
>                                   target_ulong *val)
>   {
> -    *val = env->mepc;
> +    *val = env->mepc & get_xepc_mask(env);
>       return RISCV_EXCP_NONE;
>   }
>   
>   static RISCVException write_mepc(CPURISCVState *env, int csrno,
>                                    target_ulong val, uintptr_t ra)
>   {
> -    env->mepc = val;
> +    env->mepc = val & get_xepc_mask(env);
>       return RISCV_EXCP_NONE;
>   }
>   
> @@ -4113,14 +4113,14 @@ static RISCVException write_sscratch(CPURISCVState *env, int csrno,
>   static RISCVException read_sepc(CPURISCVState *env, int csrno,
>                                   target_ulong *val)
>   {
> -    *val = env->sepc;
> +    *val = env->sepc & get_xepc_mask(env);
>       return RISCV_EXCP_NONE;
>   }
>   
>   static RISCVException write_sepc(CPURISCVState *env, int csrno,
>                                    target_ulong val, uintptr_t ra)
>   {
> -    env->sepc = val;
> +    env->sepc = val & get_xepc_mask(env);
>       return RISCV_EXCP_NONE;
>   }
>   
> diff --git a/target/riscv/internals.h b/target/riscv/internals.h
> index 4570bd50be..89ac6a160f 100644
> --- a/target/riscv/internals.h
> +++ b/target/riscv/internals.h
> @@ -142,6 +142,17 @@ static inline float16 check_nanbox_h(CPURISCVState *env, uint64_t f)
>       }
>   }
>   
> +static inline target_ulong get_xepc_mask(CPURISCVState *env)
> +{
> +    /* When IALIGN=32, both low bits must be zero.
> +     * When IALIGN=16 (has C extension), only bit 0 must be zero. */
> +    if (riscv_has_ext(env, RVC)) {
> +        return ~(target_ulong)1;
> +    } else {
> +        return ~(target_ulong)3;
> +    }
> +}
> +
>   #ifndef CONFIG_USER_ONLY
>   /* Our implementation of SysemuCPUOps::has_work */
>   bool riscv_cpu_has_work(CPUState *cs);
> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> index 557807ba4b..15460bf84b 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -280,7 +280,7 @@ target_ulong helper_sret(CPURISCVState *env)
>           riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
>       }
>   
> -    target_ulong retpc = env->sepc;
> +    target_ulong retpc = env->sepc & get_xepc_mask(env);
>       if (!riscv_cpu_allow_16bit_insn(&env_archcpu(env)->cfg,
>                                       env->priv_ver,
>                                       env->misa_ext) && (retpc & 0x3)) {
> @@ -391,7 +391,7 @@ static target_ulong ssdbltrp_mxret(CPURISCVState *env, target_ulong mstatus,
>   
>   target_ulong helper_mret(CPURISCVState *env)
>   {
> -    target_ulong retpc = env->mepc;
> +    target_ulong retpc = env->mepc & get_xepc_mask(env);
>       uint64_t mstatus = env->mstatus;
>       target_ulong prev_priv = get_field(mstatus, MSTATUS_MPP);
>   


