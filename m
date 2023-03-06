Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pZBIk-0002Qp-IX
	for mharc-qemu-riscv@gnu.org; Mon, 06 Mar 2023 08:54:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZBIi-0002Q0-6Q
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 08:54:52 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZBIf-0004ni-Gm
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 08:54:51 -0500
Received: by mail-wr1-x42c.google.com with SMTP id f11so8882989wrv.8
 for <qemu-riscv@nongnu.org>; Mon, 06 Mar 2023 05:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678110887;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4EGe3rjG59cvND13hozZg6CRYWs6WJif705Xs+gVVZE=;
 b=GKp6bK5r8BuP+fiZou9RFbs3K9dHi4DSmZkYdY/f043ZWIuoiMTvX2Nc5hgYThj2jc
 9ev4F7z8Qb1dDjY238Dlb7Kovfp4VeV61GjNuX3vPLPm72/CuncwnNPZO6q0f54XC3Tm
 Z4auhVT/FzrEMcoinGeIOYI+JMJHO87VbQ36AV40vpAw13wCXqB1BkhfV3i6hjgLuK+r
 2BhIay6xIG8n1jyZ0KAtxcMBWmZXEqnsJ3LAeVv1UFROoHHq+NNpyTranrGbADEMSpwy
 rrFjNe4RUWHGoIxzcY9xejka3TnknoqJ9f3VSewTZmqEAloQSloX7CVjMTektrbkYJXx
 WUUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678110887;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4EGe3rjG59cvND13hozZg6CRYWs6WJif705Xs+gVVZE=;
 b=S1zVzi05nTQLshzLJ9BnwZby1uwl/eDkTBEnnlF9UHMjw2qMth/fD69bd8AVGwO1yV
 RpzKiNKgXivaPbhSjigMV2P1wXze4D/3AGdRfxJAHVZZXIzB+ZPFG/dYM/jxf/XVL9g7
 jz42rwY0pDw4v2kU+15G8Knqovj44qja/bRqL5K/Li4mZWMCoRMZwAWLDZtOR8D1i4GV
 K2OstBtdgCJJDoRJLsQdSt2gTEQ/QRWkq05S/W38IcCeopTkdYO1MA54MiREjOitB1P8
 h8TrZyKxsaIa6TkjtrnwcjwR3gM/PVXvNBq66fGicMXTih4a/l8z1nOTQMuZGMCp4s/S
 M9sg==
X-Gm-Message-State: AO0yUKUUjH7NbhhVZSV79C38Ocfju/Yl3NnJTU+Q9O3zu3I+fa9fPkNi
 dv/6yYAIEyvef25iHK4BlCf1qQ==
X-Google-Smtp-Source: AK7set+lOT7ZbxCgU6Q1t7SFmFVle95RsCwwga0XhiOpECfqb0tACL59cbYbB6VmlZRomFnEjd6Q4Q==
X-Received: by 2002:adf:d089:0:b0:2c7:17a4:4ece with SMTP id
 y9-20020adfd089000000b002c717a44ecemr6695952wrh.26.1678110887003; 
 Mon, 06 Mar 2023 05:54:47 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 r11-20020a5d494b000000b002c54c9bd71fsm9626993wrs.93.2023.03.06.05.54.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 05:54:46 -0800 (PST)
Message-ID: <5935d68b-2b42-80f3-4c88-48c27727b24b@linaro.org>
Date: Mon, 6 Mar 2023 14:54:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 01/70] target/arm: Use rmode >= 0 for need_rmode
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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
X-List-Received-Date: Mon, 06 Mar 2023 13:54:52 -0000

On 27/2/23 06:41, Richard Henderson wrote:
> Initialize rmode to -1 instead of keeping two variables.
> This is already used elsewhere in translate-a64.c.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/translate-a64.c | 34 ++++++----------------------------
>   1 file changed, 6 insertions(+), 28 deletions(-)
> 
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index b1fa210d64..1c575de3e0 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -12133,7 +12133,6 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
>       int rn = extract32(insn, 5, 5);
>       int rd = extract32(insn, 0, 5);
>       bool need_fpstatus = false;
> -    bool need_rmode = false;
>       int rmode = -1;

Unrelated, but rmode could be an enum arm_fprounding.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


