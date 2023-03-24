Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pfkmo-0000YG-72
	for mharc-qemu-riscv@gnu.org; Fri, 24 Mar 2023 13:01:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pfkmm-0000X3-LE
 for qemu-riscv@nongnu.org; Fri, 24 Mar 2023 13:01:04 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pfkmj-0007dd-DH
 for qemu-riscv@nongnu.org; Fri, 24 Mar 2023 13:01:04 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 p13-20020a17090a284d00b0023d2e945aebso6172053pjf.0
 for <qemu-riscv@nongnu.org>; Fri, 24 Mar 2023 10:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679677259;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3BrjrwwT88FeHEx8xF+ALqxpNCbBHkDcivNW4pyG/SA=;
 b=DQLmkUKovXDQPn/fHskaRUy6wY6LzUafA0FJdfvzhc8Z6NOvcf7hNK50nPz6tr3i0f
 zPpxFlfdqWpOx2oTZmTStlBzGGJIkiYqu2HU6WtJJ+Z3bjwziHkUhFDK2bRhEu2rECW6
 tAOMXgqgIgEBouPWEQLj3Rr48QuovvZWY7lOLRT8iAEiHqMjS/C9zCJGJHTWg1JeC3tJ
 916gRsrXRvFwq5dLx1Qu4EqawrmJ6JD6jgLb+y5l8vtkkcJYL2aX5tFr9dxzAkhSb2sk
 Om93WwT/Tl0ZLp+SwIBEMdixBhDbgGJ9W1NZSp/fLLpOESbPqJaO8dh0aHWs6yrOdqqU
 Hhgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679677259;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3BrjrwwT88FeHEx8xF+ALqxpNCbBHkDcivNW4pyG/SA=;
 b=MNMAMmjH3Xrjw5idORzU7qGlxGiYgyhJPSXVOsf7kJbldN/xe0Z7CpvN3aGV3iJTJ8
 ysiaqntJ84QdGi7aom5r2sSq7kV9A4m0i+zc37ltetRlqWvmUxq5i7LGX0AmInup4N0o
 FXlfKwQ6KuamjSEto7H1nMI7A0d4eeiigMVpbCO8brFrG7LCRO3KHuN7dkXRkoOAtoD0
 FmQBw7QXo13dvT8OFiKiatayBTFCrjnCnjGkf3er+VPt676lHgd/Ztk7G+ZHY2nGsUFJ
 BrGm8UpS32MLe+rwa+LD8n6riLosGNTi3bPRzrJbk6B80Mbj0xay7cegJgiDazdkVebW
 sLsQ==
X-Gm-Message-State: AAQBX9eQL4Y4FcTlQVL7AmF0LrIFMXXtWs3bZfe/tpMNR1APG5go7aHu
 88teRjUXpgvPji/beybqGeepMg==
X-Google-Smtp-Source: AKy350a3U0GJznJBAytP96SMDDv2AQngaC+txaXhLjBAVdilpRoMaZq8+Nity5cxFc6Pxt7MXQIZ8Q==
X-Received: by 2002:a17:90a:d583:b0:237:3f83:61f3 with SMTP id
 v3-20020a17090ad58300b002373f8361f3mr3653293pju.16.1679677259375; 
 Fri, 24 Mar 2023 10:00:59 -0700 (PDT)
Received: from ?IPV6:2602:ae:1544:6601:cb42:9f2a:fcd4:54fc?
 ([2602:ae:1544:6601:cb42:9f2a:fcd4:54fc])
 by smtp.gmail.com with ESMTPSA id
 ix18-20020a170902f81200b0019f1027f88bsm14454942plb.307.2023.03.24.10.00.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Mar 2023 10:00:58 -0700 (PDT)
Message-ID: <84fac4a7-84f0-e89c-83b1-0a169372201a@linaro.org>
Date: Fri, 24 Mar 2023 10:00:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/4] target/riscv: Extract virt enabled state from tb flags
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com, qemu-riscv@nongnu.org
References: <20230324055954.908-1-zhiwei_liu@linux.alibaba.com>
 <20230324055954.908-2-zhiwei_liu@linux.alibaba.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230324055954.908-2-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
X-List-Received-Date: Fri, 24 Mar 2023 17:01:05 -0000

On 3/23/23 22:59, LIU Zhiwei wrote:
> Virt enabled state is not a constant. So we should put it into tb flags.
> Thus we can use it like a constant condition at translation phase.
> 
> Reported-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: LIU Zhiwei<zhiwei_liu@linux.alibaba.com>
> ---
>   target/riscv/cpu.h        |  2 ++
>   target/riscv/cpu_helper.c |  2 ++
>   target/riscv/translate.c  | 10 +---------
>   3 files changed, 5 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

