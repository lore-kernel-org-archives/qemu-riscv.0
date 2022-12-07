Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p2oPz-00081z-P7
	for mharc-qemu-riscv@gnu.org; Wed, 07 Dec 2022 02:00:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2oPq-00080p-Ai
 for qemu-riscv@nongnu.org; Wed, 07 Dec 2022 02:00:33 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2oPn-00009A-Kn
 for qemu-riscv@nongnu.org; Wed, 07 Dec 2022 02:00:25 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 h8-20020a1c2108000000b003d1efd60b65so388209wmh.0
 for <qemu-riscv@nongnu.org>; Tue, 06 Dec 2022 23:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=I18epeLpw50esSdUOLnd6DwcxshhgMSh+Zo9m+jL/JQ=;
 b=v5Sr5WpOJFVeufhCfLnJhCDrc9UyysCyRE+QFC7lRw/9lX2ymkDbOQibU7M89c5l0g
 sNC15aJSbPt9+Q3aYhYZefnJNZGzJZwHCm+tkFZBEjN9rDb43ohIjC220cdRDy63P+7I
 Vtk5ENsaaF8IYCRA8D10QgrweygvkWUS8EW4Pvc98LPPZ4HYGMSDqnZpAEEb3vBrxafz
 yS4dA3G5O7yYOcN6K6NjkrM57y5qlN0vw41Id+O6A0t9bfJiJBqc8SbbZDXzv1LrF68g
 D5NGReTqsCJ1p9wvomdfs5BEO4jj/FhNmKRTQ11Qhky2wsDyS60K1qNQeDFhB4CZOjUh
 d64g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I18epeLpw50esSdUOLnd6DwcxshhgMSh+Zo9m+jL/JQ=;
 b=ft4yUbnnvxI8ZdHPQvp4l0NAgQNzsp8gire+a23Jwi0Qwg1PznN7/Jsr2tAO0fE6V3
 8RJ+UYhRsC6xYjAHrFEq9PQ9NZBpGrDlvR3bK2fdzZIOjhLoo8e+q3k9YIIHEZx2In1s
 ibaR+Fzu3RCXWJH/fdTfcq5PU9E9iNJ1I2PsqNPKaZzff//VOnRjX++tWnzccI4eIQCO
 efXC0G9YxIdzOuNrF8/iZC1RsVdQ6Xv/Lw2lx6nhT11BdCPHVa7pbBelPevO0rb12PHT
 +YZ1jmkaWSsyXj259VumXZS2x955YHDkdeSVit2WWh73UO8eaKxiRiU7yzr6AXlxFKmU
 Qk2A==
X-Gm-Message-State: ANoB5pnl9smYyU7/hfKH3D8BvKgKYH2r/bv2apy2dB8bMgddTIdGcCUv
 7bd4W6YfPwGRYMqmepKQIgQbxw==
X-Google-Smtp-Source: AA0mqf6ytC5Off81jpjE6VIV/Y/3iAplEQ7gPCJn2BhR+hQSe0y6USwYbNIF/P5gc76Ug0PKspvslQ==
X-Received: by 2002:a05:600c:4f82:b0:3cf:aa11:9394 with SMTP id
 n2-20020a05600c4f8200b003cfaa119394mr52965115wmq.183.1670396420334; 
 Tue, 06 Dec 2022 23:00:20 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 bd10-20020a05600c1f0a00b003cf774c31a0sm671156wmb.16.2022.12.06.23.00.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Dec 2022 23:00:19 -0800 (PST)
Message-ID: <bedfefae-fe78-2c1e-6219-20ccb90f34b4@linaro.org>
Date: Wed, 7 Dec 2022 08:00:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH] target/riscv: Set pc_succ_insn for !rvc illegal insn
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-stable@nongnu.org
References: <20221203175744.151365-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221203175744.151365-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.27,
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
X-List-Received-Date: Wed, 07 Dec 2022 07:00:33 -0000

On 3/12/22 18:57, Richard Henderson wrote:
> Failure to set pc_succ_insn may result in a TB covering zero bytes,
> which triggers an assert within the code generator.
> 
> Cc: qemu-stable@nongnu.org
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1224
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/riscv/translate.c          | 12 ++++--------
>   tests/tcg/Makefile.target         |  2 ++
>   tests/tcg/riscv64/Makefile.target |  5 +++++
>   tests/tcg/riscv64/test-noc.S      | 32 +++++++++++++++++++++++++++++++
>   4 files changed, 43 insertions(+), 8 deletions(-)
>   create mode 100644 tests/tcg/riscv64/test-noc.S
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


