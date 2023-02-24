Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVfi6-0001Bv-3z
	for mharc-qemu-riscv@gnu.org; Fri, 24 Feb 2023 16:34:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVfi1-0001BH-LG
 for qemu-riscv@nongnu.org; Fri, 24 Feb 2023 16:34:32 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVfhy-0001A6-Eg
 for qemu-riscv@nongnu.org; Fri, 24 Feb 2023 16:34:29 -0500
Received: by mail-pl1-x634.google.com with SMTP id ko13so818389plb.13
 for <qemu-riscv@nongnu.org>; Fri, 24 Feb 2023 13:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yQPF4QRg+Y6u3cCwj84l/KgLy9yLpA+J7Spud4VsUrQ=;
 b=YHMSE3e9xp5wPKRx9i3EMA5h3x/cd+Nf5Nmxm2yeIwsZROigSAHWvyTf4BqBhmDU2B
 TN28TEvqjbBHbo9aOMkBvCHgDkUcMZFPa7lioujm6j+RtKPlm9YHol9l7L/GexXoHruL
 3o2WiVktBLGqEb+GN45u8LP4D6D11WymSrRfrJkqafCRr4ll4d4QC/rb7wY5s6vIM/0F
 VkuMK8e3D9MX2RTGaa22hdrKx95igD/Q0enOPbiZ4yDssDx9pZixVerZw+TdSA8CmEb2
 asnryUKwrqJ294MHVfBVp0ERbHSLWo9s8RGE1IvSkRO75Cl2RGA8EwFxSksxbHS5LbPU
 /WtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yQPF4QRg+Y6u3cCwj84l/KgLy9yLpA+J7Spud4VsUrQ=;
 b=VSw3klLLCWFfgS2wauW75gzfZPHwiu9XOCQl76m9sA5Vs9LWbGefL6f72Y25bGn7JH
 Rg3OLuX4JWCn3nO8mKiAgFGUqygogeBA2TARKXpoZj2Gdgf28/CG9X9SoEFym2irlwfU
 F8PGSUZ80/RVNGXKkiAHsPardyF1FuTQ9bAhSskY7EL8ZALa4MTPoYeiNKfBceuiyw1g
 x42jzMevf0OnznSMwer+OyASEPsTySOjhb0k4s9PLQJ+7vC0BQEDpQRuTPSlCmGq1XrH
 CmlwWcI9V9DWz6PKoN2VLlpM+Unhe9G712KcUepfUHefMAU+3kdgbgPrOGZnwv6nUZUF
 mZYg==
X-Gm-Message-State: AO0yUKVxi8pp1x84gIylGHRD4VKS6LYpppk62Evunb6qxBSIcWC2hwoA
 isMksBhPPqE7v5GZJ+BmKCCD3g==
X-Google-Smtp-Source: AK7set/SpVI4KtiKqz33mkBiC/eRf3dGgL3olwBlpEHtX0rn0mgxD7y7Je6wdlCKY8fXHVqf3spqpQ==
X-Received: by 2002:a17:90b:4a4d:b0:231:284:ea4d with SMTP id
 lb13-20020a17090b4a4d00b002310284ea4dmr19629268pjb.22.1677274447041; 
 Fri, 24 Feb 2023 13:34:07 -0800 (PST)
Received: from [192.168.54.227] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 p6-20020a17090ac00600b002366c766ef4sm1943498pjt.33.2023.02.24.13.34.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Feb 2023 13:34:06 -0800 (PST)
Message-ID: <d2b57ebe-791a-74bc-1ba0-5909d36e6910@linaro.org>
Date: Fri, 24 Feb 2023 11:34:00 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 0/4] RISCVCPUConfig related cleanups
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com
References: <20230224174520.92490-1-dbarboza@ventanamicro.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230224174520.92490-1-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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
X-List-Received-Date: Fri, 24 Feb 2023 21:34:32 -0000

On 2/24/23 07:45, Daniel Henrique Barboza wrote:
> Hi,
> 
> These cleanups were suggested by LIU Zhiwei during the review of the
> RISCV_FEATURE_* cleanups, currently on version 7 [1].
> 
> These are dependent on the patch "[PATCH v7 01/10] target/riscv: introduce
> riscv_cpu_cfg()" from [1] because we use the riscv_cpu_cfg() API.

If you add

Based-on: <message-id>

to the cover letter, then patchew can stitch the two patch sets together in its git 
repository.


r~

