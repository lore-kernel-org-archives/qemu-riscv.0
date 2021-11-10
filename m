Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mklVp-0001be-DZ
	for mharc-qemu-riscv@gnu.org; Wed, 10 Nov 2021 06:11:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mklVo-0001bO-MZ
 for qemu-riscv@nongnu.org; Wed, 10 Nov 2021 06:11:28 -0500
Received: from [2a00:1450:4864:20::32c] (port=54893
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mklVm-00047s-MC
 for qemu-riscv@nongnu.org; Wed, 10 Nov 2021 06:11:28 -0500
Received: by mail-wm1-x32c.google.com with SMTP id i12so966880wmq.4
 for <qemu-riscv@nongnu.org>; Wed, 10 Nov 2021 03:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hIeV+irR4Vh5jemQpQiqBskCyzTs0BoezXTi4VIE6vA=;
 b=Oi2CrI+6h8Nf1fH+nsozwwDPpJuBNh9ZCE9HWTGZTVNehzzWke3M2yfJ5xhE1/adFm
 V83NlSOUrJ9OJOLrUZ9wV2LObSeGLPk0v1r6PEsQOz11Qq/3bhj/VO1ZyyeKEMP4n9s4
 n/2mHU5jmIxYK87v3mALGVHtxGqY4JI/Angvoq871K12QuNphtoc7XEIf46wRUkX1JiE
 Bgx84vh2GkWfK5kKR8mk82ahCjTLZ4z4ot4Xps7DR6JdndFMdtcXJLJLxw5EWNxPTMKj
 v42l5X1/HkKM/U4aGG4YvPhWVyNtGeBdBzie8G4IvYzQtVuqceYyAvfM5RbQxuo8kEJY
 W5Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hIeV+irR4Vh5jemQpQiqBskCyzTs0BoezXTi4VIE6vA=;
 b=EqT5UBD5aLSUDDuosRx4brMyXBAeCpJLqLQEToS97BWLpM52iiQeR9Uc30MKPWEVoQ
 S9jokemTeeeHMrYOD9jGxkk9w91j43Y+U5fjvSZULgS9XreI44t4UkYIMGwXovT4ReG6
 wGbgqYEhae5gl7hCyC++bhYwP6Om/VxVB9uzS6NxNvhZ1iM3N6fPS08lmnv94GntQOro
 VGSc9JxQXRoc79/S/NwI2mFMXCITTZjZwDVuJBvOlC8DYky2PTSrHMVXz25dGeYq/0iI
 uDgQehIDD9eQRpwseRc8zZuuEC9i5z9qSo0wwEWj/LxN7oPfR5bfJNw3iQECUtMDJMic
 OTnQ==
X-Gm-Message-State: AOAM532BbMqqwkGf9201xVMzye7tddShuLgbc2ei5OCmwicHcrTvb/eg
 o5VOApuAB01mLBZX+ACQrIc+sw==
X-Google-Smtp-Source: ABdhPJznOWZaLwyw7++TEohW/vCek1mNrs/lZDuZinW/s0fSSBGd5mODXU8/CB9Ey8xnLdD13JKwOg==
X-Received: by 2002:a05:600c:190c:: with SMTP id
 j12mr12929770wmq.117.1636542685079; 
 Wed, 10 Nov 2021 03:11:25 -0800 (PST)
Received: from [192.168.8.106] (104.red-2-142-241.dynamicip.rima-tde.net.
 [2.142.241.104])
 by smtp.gmail.com with ESMTPSA id o10sm14655694wri.15.2021.11.10.03.11.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 03:11:24 -0800 (PST)
Subject: Re: [PATCH v2 10/14] target/riscv: Adjust vector address with mask
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20211110070452.48539-1-zhiwei_liu@c-sky.com>
 <20211110070452.48539-11-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <30642177-1f52-08fb-c3ed-77492fdc7cc8@linaro.org>
Date: Wed, 10 Nov 2021 12:11:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211110070452.48539-11-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.678,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 10 Nov 2021 11:11:28 -0000

On 11/10/21 8:04 AM, LIU Zhiwei wrote:
> The mask comes from the pointer masking extension, or the max value
> corresponding to XLEN bits.
> 
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>   target/riscv/cpu.c           |  1 +
>   target/riscv/cpu.h           |  4 ++++
>   target/riscv/cpu_helper.c    | 40 ++++++++++++++++++++++++++++++++++++
>   target/riscv/csr.c           | 19 +++++++++++++++++
>   target/riscv/machine.c       | 10 +++++++++
>   target/riscv/vector_helper.c | 23 +++++++++++++--------
>   6 files changed, 88 insertions(+), 9 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 0d2d175fa2..886388f066 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -378,6 +378,7 @@ static void riscv_cpu_reset(DeviceState *dev)
>   #ifndef CONFIG_USER_ONLY
>       env->misa_mxl = env->misa_mxl_max;
>       env->priv = PRV_M;
> +    riscv_cpu_update_mask(env);
>       env->mstatus &= ~(MSTATUS_MIE | MSTATUS_MPRV);
>       if (env->misa_mxl > MXL_RV32) {
>           /*
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 11590a510e..73d7aa9ad7 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -252,6 +252,8 @@ struct CPURISCVState {
>       target_ulong upmmask;
>       target_ulong upmbase;
>   #endif
> +    target_ulong mask;
> +    target_ulong base;

I think the name here isn't great.  Without the context of the preceeding elements, the 
question becomes: mask of what?

Better might be cur_pmmask, cur_pmbase.

Broader than that, you're doing too many things in this patch.  The subject is "adjust 
vector address with mask", but you're also creating new fields and updating them at priv 
changes, etc.  Too much.

> +void riscv_cpu_update_mask(CPURISCVState *env)

... update_pmmask?

> +}
> +
> +
> +

Watch the extra spaces.

> @@ -1571,6 +1572,9 @@ static RISCVException write_mpmmask(CPURISCVState *env, int csrno,
>       uint64_t mstatus;
>   
>       env->mpmmask = val;
> +    if ((env->priv == PRV_M) && (env->mmte & M_PM_ENABLE)) {
> +        env->mask = val;
> +    }

This needs to use the function; there are pieces missing here, notably the zero-extend for 
RV32.

I don't see any updates to the exception entry and exception return paths.

You'll want to update the translator to use these new fields instead of using the 
[msu]pmmask / [msu]pmbase fields directly.  (Which means that we will have fewer tcg 
variables, and need not copy the "current" into DisasContext.)


> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 60006b1b1b..0b297f6bc8 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -123,6 +123,11 @@ static inline uint32_t vext_maxsz(uint32_t desc)
>       return simd_maxsz(desc) << vext_lmul(desc);
>   }
>   
> +static inline target_ulong adjust_addr(CPURISCVState *env, target_ulong addr)
> +{
> +    return (addr & env->mask) | env->base;
> +}

The code here in vector_helper.c looks fine as a patch by itself, under the subject that 
you have given.


r~

