Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 665EFCAC5B0
	for <qemu-riscv@archiver.kernel.org>; Wed, 24 Sep 2025 12:24:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v1OXK-0000xR-G9; Wed, 24 Sep 2025 08:23:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1v1OX8-0000w9-Kb
 for qemu-riscv@nongnu.org; Wed, 24 Sep 2025 08:23:43 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1v1OX3-0000Rm-N6
 for qemu-riscv@nongnu.org; Wed, 24 Sep 2025 08:23:42 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-71d6083cc69so69077107b3.2
 for <qemu-riscv@nongnu.org>; Wed, 24 Sep 2025 05:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1758716614; x=1759321414; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IgWN7UIbJZ/ZuVQ3yAJWjm/lbr2P12F6KEt8R4Wdkbs=;
 b=mnotR0kTLLpH/Efn2taJdVwbvik8GL/uXh/Cf3L3GNsFYqAm9eADsU13lTFepZGRhN
 RHqhpXNU/A2U1ACISMmcZ38BTqY2zZ9NylgQwgOgTiCt/gmshKm3k1Bd+4u2g9ni+w/O
 OifrAZeXiO55MMm+SG2N39klez54ifiLFBDFH36CR2qqXNv9an37s5l0WF3W1A0FGEoQ
 /t3QEPjZe8BmxHgHCR09nDAY2yJagHNNFaHJIbWxsil1DgO4ssyPgoJgtc1eez1dB1im
 YUBBYUq2cobWqKopykvUejH4j72EimNqpfrTt5PZu/YRnaHjGq0GXeyUKi9yzSaRIzxB
 9Thg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758716614; x=1759321414;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IgWN7UIbJZ/ZuVQ3yAJWjm/lbr2P12F6KEt8R4Wdkbs=;
 b=aXK64Gr9Up1vVOwxI0XiEk39yzPBYEGM/X52Y2YBZQeTsyPwc6IxMPASYdi9l8bKGZ
 psDXtNF3nUmTszTZXS10NZyERy7LKCBO1XFcjc9qYmgCchVVtKhDNqr867Nx9FgenAMy
 yoUZ5RkVokuTYVr5+zJimvDCcYIyVT3nBXNGMKj4KQpB0L5X/tgd+JuUwRWUYZhUITEJ
 s3yazq4JUkVPE3Hiq6rMmxaswx8heO1VHvrpTExPkodoCsceZuSqLy4syhAZthY6L69h
 Svu0gXBk+xbq/s78SH6wpAd7+9/QowTj6GqQnK5ReE9NMB2nhfKZWFw7ljD8ZPfOi8YR
 FS1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqcad8r3dSf+VZUqEPTveM5cAyMiEgoQHDeYYHtCN3zGt5uYVBDcOwVcLMRmA3iNbn5e2R78fGnKuv@nongnu.org
X-Gm-Message-State: AOJu0YxmsL/cvghRe54vHED/tacn/hdKC3r0YfP6DEEbrvGb0T5Lyi4A
 dFnhBVNHKRCBSUxvQd7hd76ANRUU+d+rLtMFHSPy5dkT3OVpgT8KbIBr06Fcw0EUnDg=
X-Gm-Gg: ASbGncuhNMweH3uH+6Q5dpJ6VCsoxv+u+gFbyy9T9yUjdIck5nF9OP3Ts7JqjSlLm5h
 7K9fRqhmS2W0ok3tWRE72h0XAqa+i76goNJ0py5KpLZrfTNFTZmZBy3YQ7pOqXpG/6xIMQFRniY
 KyEuCkJCJLi3wFrmXUF+IigcX3clrO936fZ3eJmS0W6UU8pv3/0JC0549Ge7hTste3leYWZQTOd
 w86+DVWg+sBYOQuKnXdHRrwqpk+DtuvjJ45EzqsazdfVskqtVGBnHHbTHLTKJPInqLHg9Y+IVxw
 DtWhOf05XVwxiXihKFHQ/vD2OpYjM+U0TAKIOt1nQjkNX8lkQBZUMTVmoOcWMMh0ndenwfQi7YV
 ro5MahM5C6S4zKiHmhTurjDlwGt9Vbe61nk8hAw==
X-Google-Smtp-Source: AGHT+IEadO0HcG37pdz7hLk5/yL62pKo3mjFZjN4191Ffuf7Jg7wnfRmuKOetvmHcHBcvqtrpVA8xA==
X-Received: by 2002:a05:690c:3507:b0:734:f858:b1f2 with SMTP id
 00721157ae682-758a2c0c0c4mr50428077b3.30.1758716614486; 
 Wed, 24 Sep 2025 05:23:34 -0700 (PDT)
Received: from [192.168.68.110] ([152.234.123.171])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-747ff308313sm29236287b3.37.2025.09.24.05.23.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Sep 2025 05:23:34 -0700 (PDT)
Message-ID: <f9cf2b82-4857-460a-a613-cc4a00a8bedc@ventanamicro.com>
Date: Wed, 24 Sep 2025 09:23:31 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/12] target/riscv: Record misa_ext in
 TCGTBCPUState.cs_base
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-riscv@nongnu.org
References: <20250923023922.3102471-1-richard.henderson@linaro.org>
 <20250923023922.3102471-5-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Language: en-US
In-Reply-To: <20250923023922.3102471-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-yw1-x1130.google.com
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



On 9/22/25 11:39 PM, Richard Henderson wrote:
> The tb_flush within write_misa was incorrect.  It assumed
> that we could adjust the ISA of the current processor and
> discard all TB and all would be well.  But MISA is per vcpu,
> so globally flushing TB does not mean that the TB matches
> the MISA of any given vcpu.
> 
> By recording misa in the tb state, we ensure that the code
> generated matches the vcpu.
> 
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

> Cc: Alistair Francis <alistair.francis@wdc.com>
> Cc: Weiwei Li <liwei1518@gmail.com>
> Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Cc: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
> Cc: qemu-riscv@nongnu.org
> ---
>   target/riscv/csr.c         | 3 ---
>   target/riscv/tcg/tcg-cpu.c | 3 ++-
>   2 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 8842e07a73..3c8989f522 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -25,7 +25,6 @@
>   #include "pmu.h"
>   #include "time_helper.h"
>   #include "exec/cputlb.h"
> -#include "exec/tb-flush.h"
>   #include "exec/icount.h"
>   #include "accel/tcg/getpc.h"
>   #include "qemu/guest-random.h"
> @@ -2173,8 +2172,6 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
>           env->mstatus &= ~MSTATUS_FS;
>       }
>   
> -    /* flush translation cache */
> -    tb_flush(env_cpu(env));
>       env->xl = riscv_cpu_mxl(env);
>       return RISCV_EXCP_NONE;
>   }
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 78fb279184..143ab079d4 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -191,7 +191,8 @@ static TCGTBCPUState riscv_get_tb_cpu_state(CPUState *cs)
>   
>       return (TCGTBCPUState){
>           .pc = env->xl == MXL_RV32 ? env->pc & UINT32_MAX : env->pc,
> -        .flags = flags
> +        .flags = flags,
> +        .cs_base = env->misa_ext,
>       };
>   }
>   


