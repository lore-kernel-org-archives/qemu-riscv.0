Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mBicp-00018g-Gi
	for mharc-qemu-riscv@gnu.org; Thu, 05 Aug 2021 15:01:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mBicm-00016m-FT
 for qemu-riscv@nongnu.org; Thu, 05 Aug 2021 15:01:48 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:55148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mBick-0003sJ-Ss
 for qemu-riscv@nongnu.org; Thu, 05 Aug 2021 15:01:48 -0400
Received: by mail-pj1-x1030.google.com with SMTP id a8so11166290pjk.4
 for <qemu-riscv@nongnu.org>; Thu, 05 Aug 2021 12:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fx0nKJq2nwgGGk+UWNrnOAev+kg1mpALrTBulYKo2iA=;
 b=bFMYOZTTncDf0VzNFwlw5K64a9NWLRhBl8YNz6NrpKMWo2e4o6HsBHhe3xfkIeZg2k
 dLyV2NWOYNpj2Vx4uUTgOUfBJE0KFytFt2Us+BrRz57gfEK8JkNvSscQgb6MIMjDE96n
 5ZYQut3DHA7MQo+R75XhfbE+MB9Gsap4jFXZET0LD/U9MFkKaS0T25r8dXJgWJdoAnsf
 DkQ2C/3LSgR8/TZu7oc0gxkz3UHGjmEOJE2eg1KcSwid/JeljKfSeIF5/v26BKCKuFDu
 fektu9d8MArgrMW2pXwpNC8ZvZFsJZcD50AspDY/iZUUP5TLzH9ckV/NWQFy4J9rDyQF
 Vocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fx0nKJq2nwgGGk+UWNrnOAev+kg1mpALrTBulYKo2iA=;
 b=dLEJn0SlTSExlmKjcazj/DFF40IhSnPtmbIdEXRRaZO3QAJMUvrCKEH3oYv5/EKqF6
 ijkc3dCpOcp8OQzovh7Qcfj+bt/3QHHvDgywu6JGe32xfMneJ7F6uCoLnJy8QH/3tbts
 lKFJkMZBDUx8tIZmJ9IzHZQXEkhLtdYy2YMILi6EJY+sIW5IwOSa6LSgqccXIJrnOPxG
 KQBzc5tGmieDhDJcHXBqVuxbBtkiPxfeYxzGsPxjMwr5F3W4MGEWpkgm3AN7uMSawjVJ
 Xu69LIu8sTUZ+DjGhXNdQ/LMjSNXtOUs0NsximYGIXu34LxJJnmDmePCh+BniKmXFUMD
 7DqQ==
X-Gm-Message-State: AOAM5316SM+FYSmiIKcIo9WznUeLZ7alWB7yO/++UrpEbhbz+5T5XhTB
 KttsCS0Qr6CUWZaMWvx0NUTCOw==
X-Google-Smtp-Source: ABdhPJzTccBrVul20CBfSl75KCitvIJj5ArwdXTQWvFaENKXcAppzgXhWyOtrsFOYpchv2bJ4QiTNg==
X-Received: by 2002:a62:d447:0:b029:291:19f7:ddcd with SMTP id
 u7-20020a62d4470000b029029119f7ddcdmr887486pfl.54.1628190104974; 
 Thu, 05 Aug 2021 12:01:44 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id m1sm4995493pfk.84.2021.08.05.12.01.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 12:01:44 -0700 (PDT)
Subject: Re: [RFC PATCH 01/13] target/riscv: Add UXL to tb flags
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20210805025312.15720-1-zhiwei_liu@c-sky.com>
 <20210805025312.15720-2-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <94c93e5e-3469-e81c-33b8-9a6ba7f4922a@linaro.org>
Date: Thu, 5 Aug 2021 09:01:40 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210805025312.15720-2-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.132,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 05 Aug 2021 19:01:49 -0000

On 8/4/21 4:53 PM, LIU Zhiwei wrote:
> For 32-bit applications run on 64-bit cpu, it may share some code
> with other 64-bit applictions. Thus we should distinguish the translated
> cache of the share code with a tb flag.
> 
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>   target/riscv/cpu.h       | 15 +++++++++++++++
>   target/riscv/translate.c |  3 +++
>   2 files changed, 18 insertions(+)
> 
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index bf1c899c00..2b3ba21a78 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -394,9 +394,20 @@ FIELD(TB_FLAGS, SEW, 5, 3)
>   FIELD(TB_FLAGS, VILL, 8, 1)
>   /* Is a Hypervisor instruction load/store allowed? */
>   FIELD(TB_FLAGS, HLSX, 9, 1)
> +FIELD(TB_FLAGS, UXL, 10, 2)

Are you intending to reserve space for RV128 here?
Otherwise this could be a single bit.

Also, you probably don't want to name it "UXL", since it should indicate the current 
operating XLEN, taking MXL, SXL and UXL into account.

Perhaps just name the field XLEN32, and make it a single bit?

> +static inline bool riscv_cpu_is_uxl32(CPURISCVState *env)
> +{
> +#ifndef CONFIG_USER_ONLY
> +    return (get_field(env->mstatus, MSTATUS64_UXL) == 1) &&
> +           !riscv_cpu_is_32bit(env) &&
> +           (env->priv == PRV_U);
> +#endif
> +    return false;
> +}

Again, naming could be better?
It seems trivial to handle all of the fields here.  Perhaps


static inline bool riscv_cpu_is_xlen32(env)
{
#if defined(TARGET_RISCV32)
     return true;
#elif defined(CONFIG_USER_ONLY)
     return false;
#else
     /* When emulating a 32-bit-only cpu, use RV32. */
     if (riscv_cpu_is_32bit(env)) {
         return true;
     }
     /*
      * If MXL has been reduced to RV32, MSTATUSH doesn't have UXL/SXL,
      * therefore, XLEN cannot be widened back to RV64 for lower privs.
      */
     if (get_field(env->misa, MISA64_MXL) == 1) {
         return true;
     }
     switch (env->priv) {
     case PRV_M:
         return false;
     case PRV_U:
         return get_field(env->mstatus, MSTATUS64_UXL) == 1;
     default: /* PRV_S & PRV_H */
         return get_field(env->mstatus, MSTATUS64_SXL) == 1;
     }
#endif
}


> @@ -451,6 +462,10 @@ static inline void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
>               flags = FIELD_DP32(flags, TB_FLAGS, HLSX, 1);
>           }
>       }
> +    if (riscv_cpu_is_uxl32(env)) {
> +        flags = FIELD_DP32(flags, TB_FLAGS, UXL,
> +                           get_field(env->mstatus, MSTATUS64_UXL));

   flags = FIELD_DP32(flags, TB_FLAGS, XLEN32,
                      riscv_cpu_is_xlen32(env));


r~

