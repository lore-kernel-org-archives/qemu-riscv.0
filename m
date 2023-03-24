Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pflrs-0002Xq-6Z
	for mharc-qemu-riscv@gnu.org; Fri, 24 Mar 2023 14:10:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pflro-0002Wp-EJ
 for qemu-riscv@nongnu.org; Fri, 24 Mar 2023 14:10:20 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pflrl-00077B-Vs
 for qemu-riscv@nongnu.org; Fri, 24 Mar 2023 14:10:19 -0400
Received: by mail-pj1-x1031.google.com with SMTP id q102so2172296pjq.3
 for <qemu-riscv@nongnu.org>; Fri, 24 Mar 2023 11:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679681416;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=e7Zwgmg7lLgBkstgZN7om6+EzqPG8iEVLf/hxZVgdzs=;
 b=YxNGEcBHaIbRlZ/Jd0E+sQAf8qLqqznplhE+k8ly9CtW7+FMtKwjfhVc8PmiohVgUX
 nD6Cp2K3bp9S4afsmWcBdJwoommfu9/ivRKULndYKewj62tYNuDk1xCXzZ7da870amYP
 Y7+bAIwH19rlISL+WHkmTMol/HGlv6zpqhGI3v0hDwNqxkRqjGP7dYGfzl9yrEaOhkgO
 V6GNtG2NtmK41SnaiwMhGt+PxPrw0x1h03ZPfaiLybC85sPx65YTf4ACXubgdY8z3ulL
 IcEiYEPzjHARYUHICCLirYO0mMdz2ehVuXsCi47WutIScWnNEnkbSrpKl2I2Mfzf3grn
 ndpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679681416;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e7Zwgmg7lLgBkstgZN7om6+EzqPG8iEVLf/hxZVgdzs=;
 b=aaF9Tn+MOnq9VX1BxZlcy5l5TlWU2j/M/nuS9aSmRO5jN5qx02coA2zjaH7HXI1NMY
 ggiU3x6bzwudqeXzSaGAQzMmCECMUzHIh8PUk38EOw8kVUKoYcUpo6XCcq7B3Qbnx6UU
 bITzMscENc1z2HOwk1gMENF+xjaaDqrjrndXO9EVAw8izMXQnajLq2HZANSnpeT4PxHx
 b8BU+4OTGxRTahuwG37j+z3nDYVoHyiNsBqFXMGxWyXfhPIAfHXWCdbASrT3N6n3Ii1K
 s25mg6Ux1gbH/y6MouSlb15tY0oaGZWjcEGi+SUlyb8Tbz4cPzH5V5HSjYAtxE0frUke
 yRrg==
X-Gm-Message-State: AAQBX9fQX5jC2hBvHZli9g5np5ERzBOkj+YpyXQ8/aH9gL9xSsTG4TJp
 r1FLVKTOr18ypENTwy+LtOnFQg==
X-Google-Smtp-Source: AKy350bJJjDOg6PYrpRjj6TqGhTOAuPMK2t8OM04urhIHIdFdxEuwUmLEP10gdZVzfVo88FmpMGpNw==
X-Received: by 2002:a17:90b:1d90:b0:23c:ffd2:6502 with SMTP id
 pf16-20020a17090b1d9000b0023cffd26502mr4073877pjb.12.1679681416294; 
 Fri, 24 Mar 2023 11:10:16 -0700 (PDT)
Received: from ?IPV6:2602:ae:1544:6601:cb42:9f2a:fcd4:54fc?
 ([2602:ae:1544:6601:cb42:9f2a:fcd4:54fc])
 by smtp.gmail.com with ESMTPSA id
 g4-20020a17090adb0400b0023f8bdc4a7fsm211762pjv.14.2023.03.24.11.10.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Mar 2023 11:10:15 -0700 (PDT)
Message-ID: <ec88c7be-d89c-885d-3c87-a3179b827288@linaro.org>
Date: Fri, 24 Mar 2023 11:10:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 4/8] target/riscv: Remove check on RVH for
 riscv_cpu_set_virt_enabled
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230324123809.107714-1-liweiwei@iscas.ac.cn>
 <20230324123809.107714-5-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230324123809.107714-5-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
X-List-Received-Date: Fri, 24 Mar 2023 18:10:21 -0000

On 3/24/23 05:38, Weiwei Li wrote:
> In current implementation, riscv_cpu_set_virt_enabled is only called when
> RVH is enabled.
> 
> Signed-off-by: Weiwei Li<liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang<wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/cpu_helper.c | 4 ----
>   1 file changed, 4 deletions(-)

Perhaps assert, or assert under CONFIG_DEBUG.
Otherwise the function deserves a comment about the interface.

With that,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

