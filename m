Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ptZdP-0007ly-AB
	for mharc-qemu-riscv@gnu.org; Mon, 01 May 2023 15:56:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptZdN-0007lR-2u
 for qemu-riscv@nongnu.org; Mon, 01 May 2023 15:56:29 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptZdJ-00081h-BS
 for qemu-riscv@nongnu.org; Mon, 01 May 2023 15:56:28 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f1728c2a57so28552495e9.0
 for <qemu-riscv@nongnu.org>; Mon, 01 May 2023 12:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682970983; x=1685562983;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wv5FhFOIMCDMXLiBaFtFBk9ni6lxBGrmNWp+3EXPojc=;
 b=cJBKw//CBdR2Jvz0JITWnXzjc0ZPMUeA25eWp9sOj3AONqb6U62Cspae/LZWHHHE6z
 apytz6gAH+atr2D6sMC77w83u544VhwkFhZdpJXeU/PbwloN1pveWeKF3wr7s6hLTlIB
 8zWSFMnOpDs2W33B6dECcbuzdPt9SbkRrMNNHW1JO0oE50OJbwpr/B4ttAXvMdpB78pG
 dVMUrm961tcJXAseaXeUUgws6iepEOMnjle3IiWBXW7hDtc/iaZEfyg7xY9IK7iJBGu1
 PNqVa5B1ODDrpfXFK5er14uWW6S3L/z8aFvTmq/F5e4pqpi0fScWGCk4GIE6NCbuwcUy
 K3Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682970983; x=1685562983;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wv5FhFOIMCDMXLiBaFtFBk9ni6lxBGrmNWp+3EXPojc=;
 b=BU3ydjPDiO8tydWMLwLjnzKibBEEbL3jMtaKzIJS3lhCbbEeX/C/n314xesD9IT3HF
 fLHMiErazacZsc59yqjP6EV41IoU6GU7KoNnKSp5CMV3rzRzrpxz4ELuNUUMblnyhaKj
 ebKT9bkQGGsQFuEqBuf9iO/MEbMccgPIFgBkD19LT6fU5mqQHEoX7EUAe+jFR7zEG4y5
 oHlfhgmYQSjoaIoZ9zSNAHVO/YqgGI8+6KGwm0d+CiyN+63N6aDHJXAd1Xj9mZBeuG9v
 knxlpy/snyA82rLJkm2rTMK2SfXkgguunyQ6RdZqu0ug5ITt2Jn0/6vl9OFiX2Lyh6ko
 8Xag==
X-Gm-Message-State: AC+VfDzrvTQJqpPV+++mB6uyks75UwWuJeLMyegeugoLxQSne6Gf15rf
 wVf+cuFTq2Hs8bb8/ChzfN3SHMKtg+SPmjlG0pxhBg==
X-Google-Smtp-Source: ACHHUZ6VkHpsRHYu3R43FTk/xWOsrWQdecPeL1n+5NXFVNZFYJXUsbzgbu2fZODQB0RQUSGc9/bXVA==
X-Received: by 2002:a7b:c3c6:0:b0:3f0:7e63:e034 with SMTP id
 t6-20020a7bc3c6000000b003f07e63e034mr9823499wmj.29.1682970983058; 
 Mon, 01 May 2023 12:56:23 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:74db:8d00:eca5:8bcb:58d9:c940?
 ([2a02:c7c:74db:8d00:eca5:8bcb:58d9:c940])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a05600c204100b003ef64affec7sm33280761wmg.22.2023.05.01.12.56.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 May 2023 12:56:22 -0700 (PDT)
Message-ID: <bf1f3982-1848-2623-2d6b-55a249a286bb@linaro.org>
Date: Mon, 1 May 2023 20:56:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 10/19] qemu/host-utils.h: Add clz and ctz functions for
 lower-bit integers
Content-Language: en-US
To: Lawrence Hunter <lawrence.hunter@codethink.co.uk>, qemu-devel@nongnu.org
Cc: dickon.hood@codethink.co.uk, nazar.kazakov@codethink.co.uk,
 kiran.ostrolenk@codethink.co.uk, frank.chang@sifive.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, pbonzini@redhat.com,
 philipp.tomsich@vrull.eu, kvm@vger.kernel.org, qemu-riscv@nongnu.org
References: <20230428144757.57530-1-lawrence.hunter@codethink.co.uk>
 <20230428144757.57530-11-lawrence.hunter@codethink.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230428144757.57530-11-lawrence.hunter@codethink.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 01 May 2023 19:56:29 -0000

On 4/28/23 15:47, Lawrence Hunter wrote:
> From: Kiran Ostrolenk<kiran.ostrolenk@codethink.co.uk>
> 
> This is for use in the RISC-V vclz and vctz instructions (implemented in
> proceeding commit).
> 
> Signed-off-by: Kiran Ostrolenk<kiran.ostrolenk@codethink.co.uk>
> Reviewed-by: Richard Henderson<richard.henderson@linaro.org>
> ---
>   include/qemu/host-utils.h | 54 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 54 insertions(+)

Queued to tcg-next.

r~

