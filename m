Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pZKkC-0003XZ-QC
	for mharc-qemu-riscv@gnu.org; Mon, 06 Mar 2023 18:59:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZKk9-0003Uo-EF
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 18:59:50 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZKk6-0001mO-Ox
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 18:59:49 -0500
Received: by mail-wr1-x42b.google.com with SMTP id h11so10539237wrm.5
 for <qemu-riscv@nongnu.org>; Mon, 06 Mar 2023 15:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678147185;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Hehao85AxNJpHmbvnxI3tvwfUWkZ/dCDh20dyCPMOjE=;
 b=ouSZr0+iQ1xU2Pyd7v3vYwbO6GjwE71OeMi+wiZXOTuoSClqFo8vZyg09IkaB0ZUWZ
 Pn3JaLQ/dB+XS27lBDPguaVaTGoPikJmmh05Bwo7Fjj/dd2LJaLtdbQ8UV2Qx5bv6p/j
 PXTF1zvuHGrhgr1keHhSTppMVZXSwesph56T4IWWGeVLrWnmJgaPJiickNC8vanhgch1
 Ye5zPh08kENn1Fh5jA/jNLwgp3zC9UpwrfyuDgDxMnll+KV+oDd2DO/QwKKwGexTg1pV
 ujUv6dVa4pU6esPEEN4QBBbJl73Jl8xFgKPGxnMqW7TDm2OWeC082/5H3kkcKTv2hlN4
 Fbbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678147185;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Hehao85AxNJpHmbvnxI3tvwfUWkZ/dCDh20dyCPMOjE=;
 b=0TMUK61vsFecQhYg1HJpg0Esjeh94htk7j+DTT6IWQQTt2LG1Gp8FYx1iY+dd2i8QJ
 U/8uIIeyRmZXlENB/IAhcOBEcnLkrjsNBzXFP3Syes4XojtvBoMSXu9k3Y4U9/vwpZPV
 9HGAJYvUONaS/siekeZT+u1rbR3olhT4FFE7jS29HjnCAPj5gELWxN/l1sVhiGpH6tPQ
 9I8msnTzdt72FssHJ3Qa1sgwEcauzTXeF+M7idE5EoePnTWtLp1o2X5p+Lb1s4tKcZ2k
 9nJCS5y+RNtJXw0cFVHcke2h/yHHZ2LE/jgKdp+ZnPShnP3hfkBTdoXvtgMGxjfSoxFR
 wk5g==
X-Gm-Message-State: AO0yUKUrDlZOZ+Jp2cGU83VYkBRw8oPfCE8az8uaxnP0EKA/xxtttVo5
 aIYHsJ4Fh0CiTfH5seroRn/yNQ==
X-Google-Smtp-Source: AK7set+YOabg2h42F3GXqGgl6oQSZdvjh+mr94A9u0irh0ASttfQEtZpAKPrfzUmSDRoZq7jwQiQ7A==
X-Received: by 2002:adf:e34c:0:b0:2ca:8995:38d with SMTP id
 n12-20020adfe34c000000b002ca8995038dmr8969477wrj.16.1678147185120; 
 Mon, 06 Mar 2023 15:59:45 -0800 (PST)
Received: from [192.168.1.115] (138.red-88-29-178.dynamicip.rima-tde.net.
 [88.29.178.138]) by smtp.gmail.com with ESMTPSA id
 r8-20020a5d4e48000000b002c5d3f0f737sm11161923wrt.30.2023.03.06.15.59.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 15:59:44 -0800 (PST)
Message-ID: <2a5155cf-c840-7599-7860-b8c4f3809ed6@linaro.org>
Date: Tue, 7 Mar 2023 00:59:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 28/70] target/m68k: Avoid tcg_const_* throughout
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-29-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-29-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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
X-List-Received-Date: Mon, 06 Mar 2023 23:59:51 -0000

On 27/2/23 06:41, Richard Henderson wrote:
> All remaining uses are strictly read-only.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/m68k/translate.c | 158 ++++++++++++++++++++--------------------
>   1 file changed, 77 insertions(+), 81 deletions(-)

A bit tedious, I hope I didn't miss anything.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


