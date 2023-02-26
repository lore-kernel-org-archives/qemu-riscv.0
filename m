Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWLh5-00015p-97
	for mharc-qemu-riscv@gnu.org; Sun, 26 Feb 2023 13:24:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWLh3-00012n-T8
 for qemu-riscv@nongnu.org; Sun, 26 Feb 2023 13:24:17 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWLh2-0001lh-BG
 for qemu-riscv@nongnu.org; Sun, 26 Feb 2023 13:24:17 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 l7-20020a05600c4f0700b003e79fa98ce1so2568597wmq.2
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 10:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FWMwjHf49m5E8/9KwysLnylCdgJZJjLpQg/sl7KuPck=;
 b=zgliCXHgFA5SuctiwD4s+0GceC3w8uc1mzL+PwTTKRxPa0paIvRlGK+Ccz5ePAyjNk
 1D5Niy8WMvwFs1+CMJhxeTTIhbuIGEOq3gW1YSMsy302/v135bzurAv2FQ2xQX5FIlGt
 qCtNKBxQECWOeTvQiVj2yav163nncQMaKN62jox9ABhBQUMiNnLrTiXaesn2XqgChNW2
 9vblQtFzgNKmTUA8LUAofI+ZaurKmbl//4XqrNaaZkj59GR+7ay1irGCq+6/OVxxIXSi
 2Rye46aMfmJ0RiGjsN8TR90Uf1Ls7uYb5Fgwfpvo5a2zDbCCPwLMnlVnIintRS7sLRXo
 1+6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FWMwjHf49m5E8/9KwysLnylCdgJZJjLpQg/sl7KuPck=;
 b=aToEsgkjcL90z2RodNAD6JMD/qP0cehW9YyQc7SczpdPGvF+mm+sXRCNir8E/uwW5E
 irlhZ5V2Ek+eAuwVpvpPwEau7qcCrnYh7nTf46nQe+xF+bQ/gqA4ZSUPLmJVGMv8x3mn
 gu0uip02N/KPNpNSR8A4MBykdF7SjeNzRgauJ8j8SPY46tRCT+x6LVKrMZWKKZGMvUl0
 u1p1om3TLvTrJK/LTVz+9iBOG9TKTIj+mb76eN5NENTgUdmuV1Rhi4VmXUM2jH/ihOYM
 qQeIKNZ7pJLdTo2TeHlrmpwIxV26Uya4eNXPdAD9HMfQBt3DdLiOheFscgpOZxsdI8Vw
 MQiA==
X-Gm-Message-State: AO0yUKU1LTQCVn0vdmjdYGTN9XTTN0OPljUxbsArphvCLE7fmcjHyf07
 pPMjTLx3kThLWg6vsdogWspmUjP0ZX+jnACD
X-Google-Smtp-Source: AK7set+2zIyXKA2U5lZEWYRsdh1M29+Y9hxFF3a+58IM5W/KIxphsP/C6NTCMArHa5qhwME78XzxOA==
X-Received: by 2002:a05:600c:3d1a:b0:3eb:3945:d406 with SMTP id
 bh26-20020a05600c3d1a00b003eb3945d406mr3089574wmb.16.1677435854876; 
 Sun, 26 Feb 2023 10:24:14 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 u26-20020a05600c441a00b003e21638c0edsm6656814wmn.45.2023.02.26.10.24.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Feb 2023 10:24:14 -0800 (PST)
Message-ID: <0f790eb2-e891-640f-a3cf-d3403eccc934@linaro.org>
Date: Sun, 26 Feb 2023 19:24:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] target/riscv/vector_helper.c: avoid env_archcpu()
 when reading RISCVCPUConfig
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com
References: <20230226170514.588071-1-dbarboza@ventanamicro.com>
 <20230226170514.588071-3-dbarboza@ventanamicro.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230226170514.588071-3-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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
X-List-Received-Date: Sun, 26 Feb 2023 18:24:18 -0000

On 26/2/23 18:05, Daniel Henrique Barboza wrote:
> This file has several uses of env_archcpu() that are used solely to read
> cfg->vlen. Use the new riscv_cpu_cfg() inline instead.
> 
> Suggested-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/vector_helper.c | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


