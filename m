Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lTQcw-0005bC-Em
	for mharc-qemu-riscv@gnu.org; Mon, 05 Apr 2021 10:54:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTQcu-0005Sq-2Q
 for qemu-riscv@nongnu.org; Mon, 05 Apr 2021 10:54:52 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:40881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTQcs-0005WN-99
 for qemu-riscv@nongnu.org; Mon, 05 Apr 2021 10:54:51 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 b8-20020a17090a5508b029014d0fbe9b64so2224588pji.5
 for <qemu-riscv@nongnu.org>; Mon, 05 Apr 2021 07:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Smsrc7OqF+sb2wdFaCwY7eO66Q5ezyha5qHvu4qMuPc=;
 b=TPe4rMfYr2PCCcZVfsv6q4w+9I+QEsFs9FDr5bSpurNG6QKT1xtuzaqdO0+dZCFx3W
 9qWquBwMxxqXFfRPE2tz+IgLRg6JkGu/v+k/lKqx9YhVt2aRyzqO8YrCrdYI+LkeP1vJ
 hKUCCri1KaUMTjpr7Bq3sSd/P9Ren47mPkDGbSkaKtLvmr268xsMUcr3ao2lItGoXK/k
 JjRLgUlrAxNocYyZ/BQQWvXs7WXnjADPIFqFQhPQVNR924L+++BXDJ2Cm5e7cvQTAkgF
 yQpfzcbbehD4fLVR0cy8BeER28cBq4MuU1wTW2xDX+V9gUj+LA7MQUlHFwSL2BlujarF
 Jzuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Smsrc7OqF+sb2wdFaCwY7eO66Q5ezyha5qHvu4qMuPc=;
 b=mHFixnl0rzon18HAW2fyZLmdPcALnfQbcqVaf2kD1fXz26/Nx8lxF+HJj1QheK65c5
 9cWWMeASOI3JlZVF5eOcwHJvM4dpePjR8e4zo79Sg5z59K2jRVmOPde6lACzM3ID3SHE
 tVfadaaf9+eMKYSYy1sCBRgTQ9LrqurOmpMIV2g+I3Si8isUdoylGgqFKgoDlpLBrUBz
 zkj8cOdBiEvA7znsoDhau6lYpzPaiHV+k104ZZIUbCQfwATeO5SDENQ5nWZWkvW6YKeQ
 sG8M6he6q3mofmNP73CLuJ0XxYJtJEjLST95biVk1/tGLRODokwoLPuAAUhKlUiJCe8Z
 8KNw==
X-Gm-Message-State: AOAM530srew2lStU6H4AOBd94eR2yrD8nExThVjlXCal1W14a3gntJA0
 wLJVLVI5EpJi99cl4m6MtEi+Lg==
X-Google-Smtp-Source: ABdhPJzUKWxhU75zS9HdQEaS96va0UteSHd3q+MkbIEtJgNZ6VGPZ9a51zeYklTyMOjy+K59Ziryew==
X-Received: by 2002:a17:90a:7344:: with SMTP id
 j4mr26108760pjs.223.1617634488921; 
 Mon, 05 Apr 2021 07:54:48 -0700 (PDT)
Received: from [192.168.73.67] (50-200-230-211-static.hfc.comcastbusiness.net.
 [50.200.230.211])
 by smtp.gmail.com with ESMTPSA id l2sm16554449pji.45.2021.04.05.07.54.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Apr 2021 07:54:47 -0700 (PDT)
Subject: Re: [PATCH v1 3/8] target/riscv: Remove the hardcoded HGATP_MODE macro
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair23@gmail.com
References: <cover.1617393702.git.alistair.francis@wdc.com>
 <91de8cea886eaef39f8ff51d3962fc9b75ef1a0c.1617393702.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5d3da671-8916-5d6f-15d8-1a9acca2accb@linaro.org>
Date: Mon, 5 Apr 2021 07:54:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <91de8cea886eaef39f8ff51d3962fc9b75ef1a0c.1617393702.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Apr 2021 14:54:52 -0000

On 4/2/21 1:02 PM, Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>   target/riscv/cpu_bits.h   | 11 -----------
>   target/riscv/cpu_helper.c | 21 ++++++++++++++++-----
>   2 files changed, 16 insertions(+), 16 deletions(-)


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> @@ -621,9 +626,15 @@ static void raise_mmu_exception(CPURISCVState *env, target_ulong address,
>               get_field(env->satp, SATP_MODE) != VM_1_10_MBARE &&
>               !pmp_violation;
>       } else {
> -        page_fault_exceptions =
> -            get_field(env->hgatp, HGATP_MODE) != VM_1_10_MBARE &&
> -            !pmp_violation;
> +        if (riscv_cpu_is_32bit(env)) {
> +            page_fault_exceptions =
> +                get_field(env->hgatp, SATP32_MODE) != VM_1_10_MBARE &&
> +                !pmp_violation;
> +        } else {
> +            page_fault_exceptions =
> +                get_field(env->hgatp, SATP64_MODE) != VM_1_10_MBARE &&
> +                !pmp_violation;
> +        }

Looks like you could simplify this to extract the vm in each if branch, then do 
the comparison afterward.

   if (first) {
     vm = ...
   } else if (32bit) {
     vm = ...
   } else {
     vm = ...
   }
   page_fault_exceptions = vm != VM_1_10_MBARE && !pmp_violation;


r~


