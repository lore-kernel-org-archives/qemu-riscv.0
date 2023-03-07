Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pZL39-0006jc-N3
	for mharc-qemu-riscv@gnu.org; Mon, 06 Mar 2023 19:19:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZL35-0006hh-6f
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 19:19:23 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZL30-0005Cw-3Q
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 19:19:22 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 r19-20020a05600c459300b003eb3e2a5e7bso6276708wmo.0
 for <qemu-riscv@nongnu.org>; Mon, 06 Mar 2023 16:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678148356;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SqdsILCaxyD5q9MmfIvFe7Uk40Cg52xItVmecJLLHZw=;
 b=FmdbJQUPbz1N5HG4AOsZP+aJx5z1UpMAU9p1xzLX7okoWYN1oYYPoPlqF1BO/NyxsH
 ZiUwlYtMQsyn/UMqzQqzze6DF0ke8147jyoQIaAAhJ0aUlQgxplqpHLB8czbIWiBnQpa
 ttZYRW5ow2m5CPK5Le04cN5+ZQ6/h01GPA9HEN9c4vHPM1zSnIjbiSe8Opkz2D5hPCCT
 7UCl/CBrC3j7SUEDC+ffZVzqeMj4KFhlkjG2Dfrb+eb+4k6Mti1LDO+CjfHvuQ3OnZjb
 OJNcIsFAr1s+Jn9virZ1mwRDZnLOJM0zB5KUaY3ntmEsv4yjca7BhCdIoRE7V6ovXumL
 bNsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678148356;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SqdsILCaxyD5q9MmfIvFe7Uk40Cg52xItVmecJLLHZw=;
 b=ipGs+JCDFK3TA9RM2fNPl1iY3sN7LNkWDYN5gb5wQw0KhUWCG9DbFx5NmG1jbfEtTQ
 Cn+oWl31eivPcgALrTWwL9vJZ6XDp/CmIZhPT8fibdzzgo8XX9HDtKFBEWE4cy16Yn8U
 E9mUMXw1V6QmH6VkHcHS6M3hMAlAFjrSRDpn9klezjVw/wnieUdb2dzM3S6aD8CDeGs9
 9FXbsC/IBrjSgfCWCRkDarRCwLIYBlUuLETJTVCfsh0NBAUvN9i27ASZ6dGdo3jgdGL+
 A2jyUtMQo5E6P9p8I1I8fhU5ukt8TT0H4HyZNB4g6UL3Zio+4T4OyYG8wR8VR50kizyP
 YQ7g==
X-Gm-Message-State: AO0yUKWZNi/7vuMASZA1vO3hYVxpJkoWacVKQQJKqCLwKfS3m7vIDSyu
 BJMxNFGuJndvse4NxxL3Ernhfg==
X-Google-Smtp-Source: AK7set/QS/j9UpHpC+kn6JoQ1Y0mzefyZLBeo6l+ye29snZONxIjUwnwBUMRHve1D6m6xJNfj4AUeg==
X-Received: by 2002:a05:600c:1c20:b0:3dc:5b88:e6dd with SMTP id
 j32-20020a05600c1c2000b003dc5b88e6ddmr11946725wms.10.1678148356032; 
 Mon, 06 Mar 2023 16:19:16 -0800 (PST)
Received: from [192.168.1.115] (138.red-88-29-178.dynamicip.rima-tde.net.
 [88.29.178.138]) by smtp.gmail.com with ESMTPSA id
 w7-20020a05600c474700b003e204fdb160sm16286552wmo.3.2023.03.06.16.19.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 16:19:15 -0800 (PST)
Message-ID: <38504dfd-e253-0efe-2188-b4b43a7bffe2@linaro.org>
Date: Tue, 7 Mar 2023 01:19:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 56/70] target/tricore: Split t_n as constant from temp as
 variable
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-57-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-57-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Tue, 07 Mar 2023 00:19:23 -0000

On 27/2/23 06:42, Richard Henderson wrote:
> As required, allocate temp separately.

Hmm not quite accurate; this patch contains functions
which don't require separate temp and belong to the
next "All remaining uses are strictly read-only."
patch.

> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/tricore/translate.c | 268 +++++++++++++++++++------------------
>   1 file changed, 140 insertions(+), 128 deletions(-)


> @@ -647,22 +649,22 @@ static inline void
>   gen_maddsum_h(TCGv ret_low, TCGv ret_high, TCGv r1_low, TCGv r1_high, TCGv r2,
>                 TCGv r3, uint32_t n, uint32_t mode)
>   {
> -    TCGv temp = tcg_const_i32(n);
> +    TCGv t_n = tcg_constant_i32(n);

"strictly read-only"

>       TCGv_i64 temp64 = tcg_temp_new_i64();
>       TCGv_i64 temp64_2 = tcg_temp_new_i64();
>       TCGv_i64 temp64_3 = tcg_temp_new_i64();
>       switch (mode) {
>       case MODE_LL:
> -        GEN_HELPER_LL(mul_h, temp64, r2, r3, temp);
> +        GEN_HELPER_LL(mul_h, temp64, r2, r3, t_n);
>           break;
>       case MODE_LU:
> -        GEN_HELPER_LU(mul_h, temp64, r2, r3, temp);
> +        GEN_HELPER_LU(mul_h, temp64, r2, r3, t_n);
>           break;
>       case MODE_UL:
> -        GEN_HELPER_UL(mul_h, temp64, r2, r3, temp);
> +        GEN_HELPER_UL(mul_h, temp64, r2, r3, t_n);
>           break;
>       case MODE_UU:
> -        GEN_HELPER_UU(mul_h, temp64, r2, r3, temp);
> +        GEN_HELPER_UU(mul_h, temp64, r2, r3, t_n);
>           break;
>       }
>       tcg_gen_concat_i32_i64(temp64_3, r1_low, r1_high);



> @@ -752,22 +756,22 @@ static inline void
>   gen_maddsums_h(TCGv ret_low, TCGv ret_high, TCGv r1_low, TCGv r1_high, TCGv r2,
>                  TCGv r3, uint32_t n, uint32_t mode)
>   {
> -    TCGv temp = tcg_const_i32(n);
> +    TCGv t_n = tcg_constant_i32(n);

Ditto,

>       TCGv_i64 temp64 = tcg_temp_new_i64();
>       TCGv_i64 temp64_2 = tcg_temp_new_i64();
>   
>       switch (mode) {
>       case MODE_LL:
> -        GEN_HELPER_LL(mul_h, temp64, r2, r3, temp);
> +        GEN_HELPER_LL(mul_h, temp64, r2, r3, t_n);
>           break;
>       case MODE_LU:
> -        GEN_HELPER_LU(mul_h, temp64, r2, r3, temp);
> +        GEN_HELPER_LU(mul_h, temp64, r2, r3, t_n);
>           break;
>       case MODE_UL:
> -        GEN_HELPER_UL(mul_h, temp64, r2, r3, temp);
> +        GEN_HELPER_UL(mul_h, temp64, r2, r3, t_n);
>           break;
>       case MODE_UU:
> -        GEN_HELPER_UU(mul_h, temp64, r2, r3, temp);
> +        GEN_HELPER_UU(mul_h, temp64, r2, r3, t_n);
>           break;
>       }
>       tcg_gen_sari_i64(temp64_2, temp64, 32); /* high */
> @@ -785,22 +789,22 @@ static inline void
>   gen_maddm_h(TCGv ret_low, TCGv ret_high, TCGv r1_low, TCGv r1_high, TCGv r2,
>              TCGv r3, uint32_t n, uint32_t mode)
>   {
> -    TCGv temp = tcg_const_i32(n);
> +    TCGv t_n = tcg_constant_i32(n);

etc...

>       TCGv_i64 temp64 = tcg_temp_new_i64();
>       TCGv_i64 temp64_2 = tcg_temp_new_i64();
>       TCGv_i64 temp64_3 = tcg_temp_new_i64();
>       switch (mode) {
>       case MODE_LL:
> -        GEN_HELPER_LL(mulm_h, temp64, r2, r3, temp);
> +        GEN_HELPER_LL(mulm_h, temp64, r2, r3, t_n);
>           break;
>       case MODE_LU:
> -        GEN_HELPER_LU(mulm_h, temp64, r2, r3, temp);
> +        GEN_HELPER_LU(mulm_h, temp64, r2, r3, t_n);
>           break;
>       case MODE_UL:
> -        GEN_HELPER_UL(mulm_h, temp64, r2, r3, temp);
> +        GEN_HELPER_UL(mulm_h, temp64, r2, r3, t_n);
>           break;
>       case MODE_UU:
> -        GEN_HELPER_UU(mulm_h, temp64, r2, r3, temp);
> +        GEN_HELPER_UU(mulm_h, temp64, r2, r3, t_n);
>           break;
>       }
>       tcg_gen_concat_i32_i64(temp64_2, r1_low, r1_high);
> @@ -813,21 +817,21 @@ static inline void
>   gen_maddms_h(TCGv ret_low, TCGv ret_high, TCGv r1_low, TCGv r1_high, TCGv r2,
>              TCGv r3, uint32_t n, uint32_t mode)
>   {
> -    TCGv temp = tcg_const_i32(n);
> +    TCGv t_n = tcg_constant_i32(n);
>       TCGv_i64 temp64 = tcg_temp_new_i64();
>       TCGv_i64 temp64_2 = tcg_temp_new_i64();
>       switch (mode) {
>       case MODE_LL:
> -        GEN_HELPER_LL(mulm_h, temp64, r2, r3, temp);
> +        GEN_HELPER_LL(mulm_h, temp64, r2, r3, t_n);
>           break;
>       case MODE_LU:
> -        GEN_HELPER_LU(mulm_h, temp64, r2, r3, temp);
> +        GEN_HELPER_LU(mulm_h, temp64, r2, r3, t_n);
>           break;
>       case MODE_UL:
> -        GEN_HELPER_UL(mulm_h, temp64, r2, r3, temp);
> +        GEN_HELPER_UL(mulm_h, temp64, r2, r3, t_n);
>           break;
>       case MODE_UU:
> -        GEN_HELPER_UU(mulm_h, temp64, r2, r3, temp);
> +        GEN_HELPER_UU(mulm_h, temp64, r2, r3, t_n);
>           break;
>       }
>       tcg_gen_concat_i32_i64(temp64_2, r1_low, r1_high);
> @@ -839,20 +843,20 @@ static inline void
>   gen_maddr64_h(TCGv ret, TCGv r1_low, TCGv r1_high, TCGv r2, TCGv r3, uint32_t n,
>                 uint32_t mode)
>   {
> -    TCGv temp = tcg_const_i32(n);
> +    TCGv t_n = tcg_constant_i32(n);
>       TCGv_i64 temp64 = tcg_temp_new_i64();
>       switch (mode) {
>       case MODE_LL:
> -        GEN_HELPER_LL(mul_h, temp64, r2, r3, temp);
> +        GEN_HELPER_LL(mul_h, temp64, r2, r3, t_n);
>           break;
>       case MODE_LU:
> -        GEN_HELPER_LU(mul_h, temp64, r2, r3, temp);
> +        GEN_HELPER_LU(mul_h, temp64, r2, r3, t_n);
>           break;
>       case MODE_UL:
> -        GEN_HELPER_UL(mul_h, temp64, r2, r3, temp);
> +        GEN_HELPER_UL(mul_h, temp64, r2, r3, t_n);
>           break;
>       case MODE_UU:
> -        GEN_HELPER_UU(mul_h, temp64, r2, r3, temp);
> +        GEN_HELPER_UU(mul_h, temp64, r2, r3, t_n);
>           break;
>       }
>       gen_helper_addr_h(ret, cpu_env, temp64, r1_low, r1_high);
> @@ -872,21 +876,22 @@ gen_maddr32_h(TCGv ret, TCGv r1, TCGv r2, TCGv r3, uint32_t n, uint32_t mode)



> @@ -899,20 +904,20 @@ static inline void
>   gen_maddr64s_h(TCGv ret, TCGv r1_low, TCGv r1_high, TCGv r2, TCGv r3,
>                  uint32_t n, uint32_t mode)
>   {
> -    TCGv temp = tcg_const_i32(n);
> +    TCGv t_n = tcg_constant_i32(n);
>       TCGv_i64 temp64 = tcg_temp_new_i64();
>       switch (mode) {
>       case MODE_LL:
> -        GEN_HELPER_LL(mul_h, temp64, r2, r3, temp);
> +        GEN_HELPER_LL(mul_h, temp64, r2, r3, t_n);
>           break;
>       case MODE_LU:
> -        GEN_HELPER_LU(mul_h, temp64, r2, r3, temp);
> +        GEN_HELPER_LU(mul_h, temp64, r2, r3, t_n);
>           break;
>       case MODE_UL:
> -        GEN_HELPER_UL(mul_h, temp64, r2, r3, temp);
> +        GEN_HELPER_UL(mul_h, temp64, r2, r3, t_n);
>           break;
>       case MODE_UU:
> -        GEN_HELPER_UU(mul_h, temp64, r2, r3, temp);
> +        GEN_HELPER_UU(mul_h, temp64, r2, r3, t_n);
>           break;
>       }
>       gen_helper_addr_h_ssov(ret, cpu_env, temp64, r1_low, r1_high);


> @@ -1604,21 +1612,21 @@ static inline void
>   gen_msubms_h(TCGv ret_low, TCGv ret_high, TCGv r1_low, TCGv r1_high, TCGv r2,
>                TCGv r3, uint32_t n, uint32_t mode)
>   {
> -    TCGv temp = tcg_const_i32(n);
> +    TCGv t_n = tcg_constant_i32(n);
>       TCGv_i64 temp64 = tcg_temp_new_i64();
>       TCGv_i64 temp64_2 = tcg_temp_new_i64();
>       switch (mode) {
>       case MODE_LL:
> -        GEN_HELPER_LL(mulm_h, temp64, r2, r3, temp);
> +        GEN_HELPER_LL(mulm_h, temp64, r2, r3, t_n);
>           break;
>       case MODE_LU:
> -        GEN_HELPER_LU(mulm_h, temp64, r2, r3, temp);
> +        GEN_HELPER_LU(mulm_h, temp64, r2, r3, t_n);
>           break;
>       case MODE_UL:
> -        GEN_HELPER_UL(mulm_h, temp64, r2, r3, temp);
> +        GEN_HELPER_UL(mulm_h, temp64, r2, r3, t_n);
>           break;
>       case MODE_UU:
> -        GEN_HELPER_UU(mulm_h, temp64, r2, r3, temp);
> +        GEN_HELPER_UU(mulm_h, temp64, r2, r3, t_n);
>           break;
>       }
>       tcg_gen_concat_i32_i64(temp64_2, r1_low, r1_high);
> @@ -1630,20 +1638,20 @@ static inline void
>   gen_msubr64_h(TCGv ret, TCGv r1_low, TCGv r1_high, TCGv r2, TCGv r3, uint32_t n,
>                 uint32_t mode)
>   {
> -    TCGv temp = tcg_const_i32(n);
> +    TCGv t_n = tcg_constant_i32(n);
>       TCGv_i64 temp64 = tcg_temp_new_i64();
>       switch (mode) {
>       case MODE_LL:
> -        GEN_HELPER_LL(mul_h, temp64, r2, r3, temp);
> +        GEN_HELPER_LL(mul_h, temp64, r2, r3, t_n);
>           break;
>       case MODE_LU:
> -        GEN_HELPER_LU(mul_h, temp64, r2, r3, temp);
> +        GEN_HELPER_LU(mul_h, temp64, r2, r3, t_n);
>           break;
>       case MODE_UL:
> -        GEN_HELPER_UL(mul_h, temp64, r2, r3, temp);
> +        GEN_HELPER_UL(mul_h, temp64, r2, r3, t_n);
>           break;
>       case MODE_UU:
> -        GEN_HELPER_UU(mul_h, temp64, r2, r3, temp);
> +        GEN_HELPER_UU(mul_h, temp64, r2, r3, t_n);
>           break;
>       }
>       gen_helper_subr_h(ret, cpu_env, temp64, r1_low, r1_high);
> @@ -1664,20 +1672,20 @@ static inline void
>   gen_msubr64s_h(TCGv ret, TCGv r1_low, TCGv r1_high, TCGv r2, TCGv r3,
>                  uint32_t n, uint32_t mode)
>   {
> -    TCGv temp = tcg_const_i32(n);
> +    TCGv t_n = tcg_constant_i32(n);
>       TCGv_i64 temp64 = tcg_temp_new_i64();
>       switch (mode) {
>       case MODE_LL:
> -        GEN_HELPER_LL(mul_h, temp64, r2, r3, temp);
> +        GEN_HELPER_LL(mul_h, temp64, r2, r3, t_n);
>           break;
>       case MODE_LU:
> -        GEN_HELPER_LU(mul_h, temp64, r2, r3, temp);
> +        GEN_HELPER_LU(mul_h, temp64, r2, r3, t_n);
>           break;
>       case MODE_UL:
> -        GEN_HELPER_UL(mul_h, temp64, r2, r3, temp);
> +        GEN_HELPER_UL(mul_h, temp64, r2, r3, t_n);
>           break;
>       case MODE_UU:
> -        GEN_HELPER_UU(mul_h, temp64, r2, r3, temp);
> +        GEN_HELPER_UU(mul_h, temp64, r2, r3, t_n);
>           break;
>       }
>       gen_helper_subr_h_ssov(ret, cpu_env, temp64, r1_low, r1_high);
> @@ -1912,10 +1920,10 @@ gen_msubs64_q(TCGv rl, TCGv rh, TCGv arg1_low, TCGv arg1_high, TCGv arg2,
>                TCGv arg3, uint32_t n)
>   {
>       TCGv_i64 r1 = tcg_temp_new_i64();
> -    TCGv temp = tcg_const_i32(n);
> +    TCGv t_n = tcg_constant_i32(n);
>   
>       tcg_gen_concat_i32_i64(r1, arg1_low, arg1_high);
> -    gen_helper_msub64_q_ssov(r1, cpu_env, r1, arg2, arg3, temp);
> +    gen_helper_msub64_q_ssov(r1, cpu_env, r1, arg2, arg3, t_n);
>       tcg_gen_extr_i64_i32(rl, rh, r1);
>   }
>   


> @@ -1949,22 +1958,22 @@ static inline void
>   gen_msubadm_h(TCGv ret_low, TCGv ret_high, TCGv r1_low, TCGv r1_high, TCGv r2,
>                 TCGv r3, uint32_t n, uint32_t mode)
>   {
> -    TCGv temp = tcg_const_i32(n);
> +    TCGv t_n = tcg_constant_i32(n);
>       TCGv_i64 temp64 = tcg_temp_new_i64();
>       TCGv_i64 temp64_2 = tcg_temp_new_i64();
>       TCGv_i64 temp64_3 = tcg_temp_new_i64();
>       switch (mode) {
>       case MODE_LL:
> -        GEN_HELPER_LL(mul_h, temp64, r2, r3, temp);
> +        GEN_HELPER_LL(mul_h, temp64, r2, r3, t_n);
>           break;
>       case MODE_LU:
> -        GEN_HELPER_LU(mul_h, temp64, r2, r3, temp);
> +        GEN_HELPER_LU(mul_h, temp64, r2, r3, t_n);
>           break;
>       case MODE_UL:
> -        GEN_HELPER_UL(mul_h, temp64, r2, r3, temp);
> +        GEN_HELPER_UL(mul_h, temp64, r2, r3, t_n);
>           break;
>       case MODE_UU:
> -        GEN_HELPER_UU(mul_h, temp64, r2, r3, temp);
> +        GEN_HELPER_UU(mul_h, temp64, r2, r3, t_n);
>           break;
>       }
>       tcg_gen_concat_i32_i64(temp64_3, r1_low, r1_high);



> @@ -2041,22 +2052,22 @@ static inline void
>   gen_msubadms_h(TCGv ret_low, TCGv ret_high, TCGv r1_low, TCGv r1_high, TCGv r2,
>                  TCGv r3, uint32_t n, uint32_t mode)
>   {
> -    TCGv temp = tcg_const_i32(n);
> +    TCGv t_n = tcg_constant_i32(n);
>       TCGv_i64 temp64 = tcg_temp_new_i64();
>       TCGv_i64 temp64_2 = tcg_temp_new_i64();
>   
>       switch (mode) {
>       case MODE_LL:
> -        GEN_HELPER_LL(mul_h, temp64, r2, r3, temp);
> +        GEN_HELPER_LL(mul_h, temp64, r2, r3, t_n);
>           break;
>       case MODE_LU:
> -        GEN_HELPER_LU(mul_h, temp64, r2, r3, temp);
> +        GEN_HELPER_LU(mul_h, temp64, r2, r3, t_n);
>           break;
>       case MODE_UL:
> -        GEN_HELPER_UL(mul_h, temp64, r2, r3, temp);
> +        GEN_HELPER_UL(mul_h, temp64, r2, r3, t_n);
>           break;
>       case MODE_UU:
> -        GEN_HELPER_UU(mul_h, temp64, r2, r3, temp);
> +        GEN_HELPER_UU(mul_h, temp64, r2, r3, t_n);
>           break;
>       }
>       tcg_gen_sari_i64(temp64_2, temp64, 32); /* high */
Regardless you split this patch, move parts to the
next patch, or keep as-is:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


