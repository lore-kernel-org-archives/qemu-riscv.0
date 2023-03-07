Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pZKoQ-0005Yo-OY
	for mharc-qemu-riscv@gnu.org; Mon, 06 Mar 2023 19:04:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZKoJ-0005V9-A0
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 19:04:07 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZKoF-0002VK-21
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 19:04:05 -0500
Received: by mail-wr1-x436.google.com with SMTP id f11so10536989wrv.8
 for <qemu-riscv@nongnu.org>; Mon, 06 Mar 2023 16:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678147441;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aCoebHdkpPPcBj+jDj6eAqnOoTvKqv9yJqVJuh6zxc4=;
 b=ITBXTB+1zKGDHoZTVsRonOaDMrUqHqnX4pOMw9ymKVhGiNSw2/GrH8ti+weKugbOPT
 GKUwgBxCW+9oWIoSVyPlD/rpDgwxKsjcMW/uMYwlU6m4iyGgrDhean8IAwF9wfsq5Tce
 FLyth1JpiYYZRDN5REpA2UFRAmzzrjlEuwb8LmbX+7glbZi+h2dAUgwBkI2IyvoQXS2V
 Sp+Dh0VmprGn8ntnnu4WZMHGgwh3HVg8fg/sKNjKtgO8oCsjgZ81L9+DDs/E27d3Fyr/
 OGpXgd7JlE+6t6fNiFDdG9ADZ0DZ5uQSZp4zU9rI7B7OmIZdYuS8YnN/W9UTH3b30oJd
 oUtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678147441;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aCoebHdkpPPcBj+jDj6eAqnOoTvKqv9yJqVJuh6zxc4=;
 b=NcTO5/y6Qfii4ipgtx5QwKMslSzCEGrkOerqIaxUszCalmcAo4RHZgfxdoNbOCKFm0
 /W1M2BwUbCmX5h6ZsjdvE6nKuv1uph1fsYLY3jQ0RxYDiZdZqPsfFAKnef+8Ddh0HsQP
 dLaDPyrNfJzGInf5ICCEgjvSrhwi+lY7eGLQYih+nH3QcMQMqPUCF//45BbTma7btHyU
 36AhZ3UxC391DwlZ37Nb5uH/jhJ55fqcBucFCbtP0eaEWUA8EM4YgYUZQtjZnn8xM+P5
 tv5mzJvAfWUos5hHEEl3Ou2f+xeHpXhsfpUYi+QYEbhR1lgnFfRF9Fn8GpiFn1WmtZlC
 he4w==
X-Gm-Message-State: AO0yUKXa42a6615eg0Yk6T7zMsEKAzhAHxtP09EU27uv9qDVqUoIIo4e
 Ju5B1ObTI01McW9KOsOMkPengA==
X-Google-Smtp-Source: AK7set925e8ERw46fmLpgWv+gEFzHiqLffUXsnCroE/8+/+bLFU+xSHjzFkCm++qCvTEIAVJarufxw==
X-Received: by 2002:adf:ea90:0:b0:2c9:d90c:56c3 with SMTP id
 s16-20020adfea90000000b002c9d90c56c3mr7549062wrm.53.1678147441482; 
 Mon, 06 Mar 2023 16:04:01 -0800 (PST)
Received: from [192.168.1.115] (138.red-88-29-178.dynamicip.rima-tde.net.
 [88.29.178.138]) by smtp.gmail.com with ESMTPSA id
 m16-20020a056000009000b002be099f78c0sm11096122wrx.69.2023.03.06.16.03.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 16:04:01 -0800 (PST)
Message-ID: <3b40fffe-c307-a0ea-7cea-c0f3b72848ec@linaro.org>
Date: Tue, 7 Mar 2023 01:03:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 27/70] target/m68k: Avoid tcg_const_i32 in bfop_reg
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-28-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-28-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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
X-List-Received-Date: Tue, 07 Mar 2023 00:04:07 -0000

On 27/2/23 06:41, Richard Henderson wrote:
> Tidy up the whole function, hoisting is_bfffo as a common test
> for whether tlen and tofs needed. Use tcg_constant_i32, and load
> a separate temporary for mask.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/m68k/translate.c | 42 ++++++++++++++++++++---------------------
>   1 file changed, 20 insertions(+), 22 deletions(-)


>           if (ext & 0x800) {
>               /* Variable offset */
>               tcg_gen_andi_i32(tmp, DREG(ext, 6), 31);
>               tcg_gen_rotl_i32(QREG_CC_N, src, tmp);
>               tcg_gen_andc_i32(QREG_CC_N, QREG_CC_N, mask);
>               tcg_gen_rotr_i32(mask, mask, tmp);
> -            if (tofs) {
> -                tcg_gen_mov_i32(tofs, tmp);
> +            if (is_bfffo) {
> +                tofs = tmp;

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

>               }
>           } else {

