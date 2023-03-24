Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pfls1-0002fg-T5
	for mharc-qemu-riscv@gnu.org; Fri, 24 Mar 2023 14:10:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pfls0-0002d4-4w
 for qemu-riscv@nongnu.org; Fri, 24 Mar 2023 14:10:32 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pflry-00079A-1R
 for qemu-riscv@nongnu.org; Fri, 24 Mar 2023 14:10:31 -0400
Received: by mail-pl1-x630.google.com with SMTP id o2so2580050plg.4
 for <qemu-riscv@nongnu.org>; Fri, 24 Mar 2023 11:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679681428;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wcP1fJOpCrs9x6rTi2oUj28zocYwNc+PknvyRHcXTRc=;
 b=XXnxfkcdlygYycVl75dL+pk5UZLkX4gcCyNjb32WSZgDk2Cb7/ZPR1CJFSqbBJbknz
 lqMuUeAg3A0cWR/W7ydws5x85dZcf9Cj9ERcakzTxodp/FTGSFSt3Ebv2FAABqx91TAn
 yQRO/O+2cOLt5YvZHy9JHWp/ayD40VcbEMUFvzOlWcOyVKPkadmoIRBVdIdqy8H5jap0
 4mmZD/iZFv9NE3mKF6ap2kGXdl/8VK0m6eWqbPu16k+J72EHTXh8DhmCf33vj/InT5OZ
 mpmlzOImGj6tgGhpBNtY1MshkO38GcsoNi1Ba7JbrTZ+crKrGiUj5XkkHCTXWHpBJQnW
 CQdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679681428;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wcP1fJOpCrs9x6rTi2oUj28zocYwNc+PknvyRHcXTRc=;
 b=3IqjWW/eC5eWCMMgaB7B1qdx77mq9S0k3fVjLvGTuN+vebykLr0kqXgRl+cbJ+C2/s
 zwgSddDtHFZ7/irCSY5cR2WBCXghT+bSNQBlAKn+JNesSl6wQedX1knBpfaF/F2sBnqE
 BvtPnz3sO89F6en4GR+1uKbkqI57HSTK2xO2mTPjx+QBtR3en2ZRoihiT4g1HJ+P5eSa
 MbnTdjChpTjBEq3ZgfzeDnjYls16d7lyd1r9FXaEO0cXSaRgnRbynkqNODWVeW3glWO4
 j6YOShlupvDfGs86tI0f2IZ9njCGI0Oo4Kqe0A7KufeNDoorgijmoSDysDR3K9OvxH5M
 qmuw==
X-Gm-Message-State: AAQBX9fBO2d/lfhbpWJgfOywsmqEeA0g6J5GF3HGWIeF0ZGLarpimxUw
 OCef3SG5EzqtaVvTAwFucV2myw==
X-Google-Smtp-Source: AKy350afEiZH1FzAxkJiDxXR9koJ8N5IsMqI0LesQXJintwIhFtWT2bB1Tas5ymD19+en64s6rDgsg==
X-Received: by 2002:a17:90b:4b8a:b0:23f:582d:f45f with SMTP id
 lr10-20020a17090b4b8a00b0023f582df45fmr3918916pjb.1.1679681428444; 
 Fri, 24 Mar 2023 11:10:28 -0700 (PDT)
Received: from ?IPV6:2602:ae:1544:6601:cb42:9f2a:fcd4:54fc?
 ([2602:ae:1544:6601:cb42:9f2a:fcd4:54fc])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a17090276cc00b0019abb539cddsm14426220plt.10.2023.03.24.11.10.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Mar 2023 11:10:28 -0700 (PDT)
Message-ID: <ba6a0fe7-49c2-dd0d-1a1b-80ce7221fbec@linaro.org>
Date: Fri, 24 Mar 2023 11:10:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 5/8] target/riscv: Remove redundant parentheses
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230324123809.107714-1-liweiwei@iscas.ac.cn>
 <20230324123809.107714-6-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230324123809.107714-6-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
X-List-Received-Date: Fri, 24 Mar 2023 18:10:32 -0000

On 3/24/23 05:38, Weiwei Li wrote:
> Remove redundant parentheses in get_physical_address.
> 
> Signed-off-by: Weiwei Li<liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang<wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/cpu_helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

