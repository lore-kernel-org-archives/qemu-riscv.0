Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pZCuS-0005rx-K4
	for mharc-qemu-riscv@gnu.org; Mon, 06 Mar 2023 10:38:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZCuK-0005l1-GJ
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 10:37:49 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZCuI-0002tJ-Ua
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 10:37:48 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 bg16-20020a05600c3c9000b003eb34e21bdfso8526321wmb.0
 for <qemu-riscv@nongnu.org>; Mon, 06 Mar 2023 07:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678117065;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0doLNr/wObV4OJzl8A9J+FNkaNwUADY4dXGF679npck=;
 b=S7wEztM8pHmihMejj9yhPSaeCY6hHcca5PUGpfpxJIT1LIyfBsj6u2qUBPx5mzHGHr
 1DrDtsAwGH/GIQCM9XpXrm8Gpq91IW6u1iXxLR/gRAx9D3ywAc1WhX0eFtEeJNbdpDSv
 TPTtyjOxFdzbz8wvlOf6jdrhz7BZ8GXcFKlv34gQxgw4oHFTo7hUf5TOyQ68sIgkCiWb
 9aNTtfCaTB+2sdr8Pr2fagYLzVMvIarXa4lfuDzgk61uHbIevwhmhXWJS4iNdIXkmpd3
 +T4QcDd2NGPocPHO7/BYfgu1ZIpXeeB/EEI2NGfnhJd6OiVwybc4IRF9uFqCc5ewYpZ0
 TjAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678117065;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0doLNr/wObV4OJzl8A9J+FNkaNwUADY4dXGF679npck=;
 b=XaBHkcRH0nFBbyZJejWFAIOnTjCKhNb5ejhNF5S8tsSWQLcZ517NMUFikL3HRKQjw+
 CSdWppa60X9oEnJTXri9bJtUYBa75aNsBRaQD/qacIwfS+NwqQY18hd4hXWsM1qZoSkC
 NxRO6lc3pfR2KDn2fAA4EcsntgSGZC7XoVdDsnnlYWKU+EpbsKOYPBgTeiKOTASo4X5n
 YmEw1NVGsjZpJ3Va+vBNVzb+WTbrCg0CRjhyW55JMqDcAYfU29PrKHrzOrNlgcOXMDxs
 Is8iZ3DKuO2JtlCnNvbowjwkry+iMTvZAygavko/k5VpCbxR+cOT6mnADL8mgjN9E8d2
 NxsA==
X-Gm-Message-State: AO0yUKVFcmv/KS5H3xWQAoJkZyeEf7M/DxLGs+/0fYL2Dqjbq7lBIYBI
 5FPzUMGgV2rh7ljEPmilNcNixQ==
X-Google-Smtp-Source: AK7set+GPknnKfQZNkhQuu0Oigdwwyy1gR1h5Uwp+MDB2W+khLYUvr7uH58Z1AlzmvSMYfJ8vOlItA==
X-Received: by 2002:a05:600c:4f4a:b0:3dc:4042:5c21 with SMTP id
 m10-20020a05600c4f4a00b003dc40425c21mr9807883wmq.6.1678117065669; 
 Mon, 06 Mar 2023 07:37:45 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 i47-20020a05600c4b2f00b003eb5a531232sm10550084wmp.38.2023.03.06.07.37.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 07:37:45 -0800 (PST)
Message-ID: <a034dd81-2d10-b864-87f2-9086bfccc24b@linaro.org>
Date: Mon, 6 Mar 2023 16:37:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 55/70] target/sparc: Avoid tcg_const_{tl,i32}
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-56-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-56-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Mon, 06 Mar 2023 15:37:50 -0000

On 27/2/23 06:42, Richard Henderson wrote:
> All remaining uses are strictly read-only.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/sparc/translate.c | 80 +++++++++++++++++++---------------------
>   1 file changed, 38 insertions(+), 42 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


