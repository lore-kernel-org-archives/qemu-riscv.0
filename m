Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65EEAC7115A
	for <qemu-riscv@archiver.kernel.org>; Thu, 29 Aug 2024 01:35:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sjU3z-0000rn-Fq; Wed, 28 Aug 2024 21:35:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sjU3v-0000oB-Om
 for qemu-riscv@nongnu.org; Wed, 28 Aug 2024 21:34:59 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sjU3u-0004zW-9t
 for qemu-riscv@nongnu.org; Wed, 28 Aug 2024 21:34:59 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-260e6298635so642776fac.1
 for <qemu-riscv@nongnu.org>; Wed, 28 Aug 2024 18:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724895297; x=1725500097; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Qep8yR8s+rY1Ef9UBF07/Ay4uhtiHegsBcniif4fzWI=;
 b=vRhPXS94r2YHyH2lYiwj/Y9IHQFiYUNs30dEpqvcHd38FwyahpbmUugzYRdPpnwrvG
 4JtbkqcGgGrSvzSRYXyYfdNNpDVh2DlsYthGYlYnU/hxWCPWIINPcbnzbnruYEFPEXYZ
 808t8Ykbb4rp16uYVUy80CpWVzEFGK4GAPVso6VeWOv5Ep39KytjYwZK4hPOrrVv1ncE
 OWZcPXqgrvYLUo0ziLrPlLI+4An+pq4kj94SiRYmf0Cxwz+8+6Jm+lcKEOZCOhd/IaZl
 e6L6lHzT+0IV24veTfXqdRW//M0rhElkeD4gdTQQ1QjTC3V57qed1gTCJRH8WNPDr2T0
 5ZWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724895297; x=1725500097;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Qep8yR8s+rY1Ef9UBF07/Ay4uhtiHegsBcniif4fzWI=;
 b=ufM8jUlWg0xlf6mfJ4JgSplmPhUMOL3jlExxZ6lkWrxyPMkpEcLWdA7gxmT8S8SuKN
 Vtjdt+zMDjxk9suAJZrq7yymsxiJr5iltP0S37pDfWAR0X9jMd6lyFsLZdaXCSIX4owj
 XbXLV21v64VVhGZwUhHlLl15JhlEOXkx3gOS8T1IAtGodsc7N0IRr1vy155esM5bDMQH
 eSp1+eYENS1F+CJvlUyYiOnpTLuhlyomPx+l492kfQ2mFPVklKra5tekpeE8T0EC6tSl
 0RbXhvZpPVFrW/cmKDVGAYGXyD43WiVN8WMnAMQ0+nOXS1RcN3sZdUS+/2MZMx34SMh1
 +u2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbOyeFWzm+MFRWH6PEMOKBYmBZU0VR2ZMUBXi8pyTErF0AyvkWggA/evFbqrNfHluly/BrEZhY8Iic@nongnu.org
X-Gm-Message-State: AOJu0YyX21nsoSd5dz2xcX5uXa6oW+qSqvO8jLZ8jHbDv56yJnU0nD0j
 eKxYRgGr4xBuMKKtk7D/Rx1G05YhoEd8khYcfajGpy/0zUwfSW1Ps5AgQGil9mA=
X-Google-Smtp-Source: AGHT+IH11RFil94bYuSqIYb6Ojv1CrJ47fzCO+9WZ9tthT8AcMrLiZZ775MIXrxzR+Sowk4dk6wSjw==
X-Received: by 2002:a05:6870:56a8:b0:268:282b:be0e with SMTP id
 586e51a60fabf-2779b731bc9mr11221fac.15.1724895296605; 
 Wed, 28 Aug 2024 18:34:56 -0700 (PDT)
Received: from [192.168.98.227] ([172.58.111.246])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-70f60c73484sm38699a34.24.2024.08.28.18.34.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Aug 2024 18:34:56 -0700 (PDT)
Message-ID: <58b2e7af-3ec0-49ff-a44f-e32924a99062@linaro.org>
Date: Thu, 29 Aug 2024 11:34:35 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 12/20] target/riscv: tb flag for shadow stack
 instructions
To: Deepak Gupta <debug@rivosinc.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, Alistair.Francis@wdc.com, laurent@vivier.eu,
 bmeng.cn@gmail.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, jim.shu@sifive.com, andy.chiu@sifive.com,
 kito.cheng@sifive.com
References: <20240828174739.714313-1-debug@rivosinc.com>
 <20240828174739.714313-13-debug@rivosinc.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240828174739.714313-13-debug@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x32.google.com
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

On 8/29/24 03:47, Deepak Gupta wrote:
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -169,6 +169,10 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, vaddr *pc,
>           flags = FIELD_DP32(flags, TB_FLAGS, FCFI_ENABLED, 1);
>       }
>   
> +    if (cpu_get_bcfien(env)) {
> +        flags = FIELD_DP32(flags, TB_FLAGS, BCFI_ENABLED, 1);
> +    }
> +
>   #ifdef CONFIG_USER_ONLY
>       fs = EXT_STATUS_DIRTY;
>       vs = EXT_STATUS_DIRTY;
...
> @@ -1241,6 +1243,8 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>       ctx->pm_base_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_BASE_ENABLED);
>       ctx->ztso = cpu->cfg.ext_ztso;
>       ctx->itrigger = FIELD_EX32(tb_flags, TB_FLAGS, ITRIGGER);
> +    ctx->bcfi_enabled = cpu_get_bcfien(env) &&
> +                        FIELD_EX32(tb_flags, TB_FLAGS, BCFI_ENABLED);
The call to cpu_get_bcfien here is wrong -- only test TB_FLAGS.
(1) The compile-time check vs env is incorrect,
(2) You've already done the check in cpu_get_tb_cpu_state.


r~

