Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pZKs5-0000hv-En
	for mharc-qemu-riscv@gnu.org; Mon, 06 Mar 2023 19:08:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZKs4-0000hI-Dp
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 19:08:00 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZKs1-0003AP-PP
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 19:08:00 -0500
Received: by mail-wr1-x430.google.com with SMTP id r18so10567694wrx.1
 for <qemu-riscv@nongnu.org>; Mon, 06 Mar 2023 16:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678147675;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=olxyY6TeY0afP9/nd0aNiC52BjH3+WJeqTkksI0OYY0=;
 b=TdRxaVpVJ3aQ/fZuJhNsFEsgNiHrORGMSyA3qJ3lY6XtODJPGPkJdN1GW3pZ4tJuqK
 1ndIF8uC3nd4Awp/8mTHOXUN3ocwO2clzoj1SeZdwBvOHyftWET+tXPVM5jlmAIDPcxV
 82Kz5gxroMQS1MWUVEcGAkGuPDq/WOZqUPa2KYj1cAl/lvKK5d1woVLu+z/HW6H0bgVX
 J63mrtzBTR1HGdk7sb7ehm/SMfQKMd6OAR95SPhGNxrqVxw58BcIXdbBnPnRve9YSfFT
 Miy2S07acyv7/dqWhS0Mt1XEE2y7Q5HqkIADdHzqTXGYq+zQDfk93fhYPAbPZI8XUg0Z
 1Ztw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678147675;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=olxyY6TeY0afP9/nd0aNiC52BjH3+WJeqTkksI0OYY0=;
 b=uIKHXYDCjFVrnbsLVGFdsoAxZO+ibM1cCJ11JtTtDO85Pur4aEU3oOF8OrEKeja1X+
 oGzx+6WI0ZBahXhaUQuvaIKbbheatXOhNxRJjnCwRsyYy0Zr5Drk1VBcx33H5WQnlewm
 P6KsGRZVHNG665V15ecnajW1W2tN6DYkricu+olH8N3qAZ+EcfJRGFz3g90wFmculBGf
 gFO0kFmKMUC6TxfnWuOmJ2r6vTQJyKhDmms/65rJlrR3TWFwC2gwbvzvoz43R6IaoesG
 7RevIGrzxXrd8COsj3Uu1Rj8hxMTmP7Wu+sebW3SgQnO0xqyw6vRimM3K2/tLKFosWKM
 pwMA==
X-Gm-Message-State: AO0yUKX/oEvHvn/5K7oCT30sHOvI6sr34UJthvEks+q4FOpNaIqg5ptc
 jZH85QZ3EnztskfcCwk2YNihvw==
X-Google-Smtp-Source: AK7set9N7a6JIoBUcTEN474BFhi9tehkcoaFxrheRDSU6MY9rfwVQMl4mVd3FhCIm1iymN3Lu7lBMw==
X-Received: by 2002:a5d:4ec2:0:b0:2c5:483f:1580 with SMTP id
 s2-20020a5d4ec2000000b002c5483f1580mr12537010wrv.12.1678147675711; 
 Mon, 06 Mar 2023 16:07:55 -0800 (PST)
Received: from [192.168.1.115] (138.red-88-29-178.dynamicip.rima-tde.net.
 [88.29.178.138]) by smtp.gmail.com with ESMTPSA id
 h18-20020a5d4312000000b002c7107ce17fsm11217631wrq.3.2023.03.06.16.07.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 16:07:55 -0800 (PST)
Message-ID: <89ff5c91-13a8-a9d8-cafd-3fc388a580be@linaro.org>
Date: Tue, 7 Mar 2023 01:07:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 62/70] target/xtensa: Tidy translate_bb
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-63-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-63-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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
X-List-Received-Date: Tue, 07 Mar 2023 00:08:00 -0000

On 27/2/23 06:42, Richard Henderson wrote:
> Replace ifdefs with C, tcg_const_i32 with tcg_constant_i32.
> We only need a single temporary for this.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/xtensa/translate.c | 18 +++++++-----------
>   1 file changed, 7 insertions(+), 11 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


