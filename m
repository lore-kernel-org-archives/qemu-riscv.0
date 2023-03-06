Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pZCiC-0000MR-Cj
	for mharc-qemu-riscv@gnu.org; Mon, 06 Mar 2023 10:25:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZCiB-0000GV-5P
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 10:25:15 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZCi9-0008WI-FA
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 10:25:14 -0500
Received: by mail-wr1-x42b.google.com with SMTP id t15so9214672wrz.7
 for <qemu-riscv@nongnu.org>; Mon, 06 Mar 2023 07:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678116312;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AC6n4hE/acDWMcNUaPxU3ltggUE/RGR0BGPoFG0XiHA=;
 b=HHj1p+7ctKespZDf7N6NI/XJ9kpthhGy2j2GODy4E4pLVXhntSsyMgOgsAw17/Wnb4
 2+Fm+J+mTCjKddHk9ZNs22HNC6EZGTao/xnUCUm52GvDPS75D/5kQI2GVvlSyflSQzye
 3GRdGC40otNkaj41uI378RVsyze2ioC0LWFWVGKula/eAzoyBbwMYg/fMXcIMby4Yj8b
 oy5nRHL4Hos0gycDrkUn1kYjjVAalnjeNAaX6qNQMVoqO1DfPf0+k+mj1rtUCJpH8vzz
 2HhZlf8qI8XGDF73C5y9wDRuS8EzM26+HaoOopGdiqKFmOiggi9Qeth16WE2znD0nmAu
 nVFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678116312;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AC6n4hE/acDWMcNUaPxU3ltggUE/RGR0BGPoFG0XiHA=;
 b=2malf9b8rN46oeMmbzeU3ajCGa9zwZR0t7rX65Iz5IAAUN4IsvI/vyKWo6Jbm80IcZ
 ojEbnCSICLM2z2mcCAY4c/1/PSMn5PxiOWC2ryJzQ/LLHBrpMizl2of/u48DBfwjMcaD
 S+xE7DHWEcGowbL+dp/m4ClkVLiiEv2PHkLaxojFKfsQpvodTb4j/2tfoRNbRyCVQehH
 qtBBcaejp5tZp3iyiLodIqFyV/p3ZMVS2r+nENZGbcUKvYCNOIr+pyUre/sxf5A6k/QT
 XSkTr+TjKyp2/G1KfZlWApgR4P3gaNHoUpm/dWwQAoMbI7XsqJ00fD+AO+KklsoQ7y8+
 w/1g==
X-Gm-Message-State: AO0yUKWI/dQWByhWr8o2Pveh3cVzxl2RL2199hjcJr9AfjCWVby2bQdw
 +suZmLHes8aMLjC7e2WUnAqTGg==
X-Google-Smtp-Source: AK7set989At1CZXbwHphjNCqAfNYPccCyy+0d3RsPo2QGSTosdcxNHSTpCY2IlKEsQ4WcyN0p5Fp3w==
X-Received: by 2002:adf:f70d:0:b0:2c7:1d97:bdcb with SMTP id
 r13-20020adff70d000000b002c71d97bdcbmr7252655wrp.36.1678116311968; 
 Mon, 06 Mar 2023 07:25:11 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 x17-20020adfdcd1000000b002c5804b6afasm10355817wrm.67.2023.03.06.07.25.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 07:25:11 -0800 (PST)
Message-ID: <0d252671-2f96-4071-2b7b-4a53965143bc@linaro.org>
Date: Mon, 6 Mar 2023 16:25:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 60/70] target/tricore: Drop some temp initialization
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-61-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-61-richard.henderson@linaro.org>
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
X-List-Received-Date: Mon, 06 Mar 2023 15:25:15 -0000

On 27/2/23 06:42, Richard Henderson wrote:
> The temp variables here are always set afterward;
> the initialization with a constant was discarded.

Since commit b00aa8ecbc, 2015. Shouldn't this had hit
the CONFIG_DEBUG_TCG temp leak guard?

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/tricore/translate.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



