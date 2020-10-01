Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kO2Pc-0002KR-2P
	for mharc-qemu-riscv@gnu.org; Thu, 01 Oct 2020 13:30:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kO2PW-0002HM-LH
 for qemu-riscv@nongnu.org; Thu, 01 Oct 2020 13:30:30 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:44853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kO2PU-0004vk-SN
 for qemu-riscv@nongnu.org; Thu, 01 Oct 2020 13:30:30 -0400
Received: by mail-ot1-x344.google.com with SMTP id a2so6224116otr.11
 for <qemu-riscv@nongnu.org>; Thu, 01 Oct 2020 10:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2zTn6UmRDFxIs8ngnHnsvmIE7cYSTi6nE7o8QaMVh/4=;
 b=gIce9xcGe73X1XlmKYURkfoFvoZRnStNNJWyumKgE6G4bW3pCOdtLbr4JBILIEhNs/
 sywA8Hk6FJKbNJeHy4qEfUMnIf/6krJHv+BqekgEZquLrAr0iSqT+Ag6N/dlMPOqsqCQ
 4PKqG6IGTzRbJGi8UYbs/JqxCJZYBSATYWf1WHFxj8tGDxBRZQBq7OQIEdr70Zbqqxas
 UkrHek1J0nT8K6gUumjQTYyaUqCIZbbGJz3u7zDR/mBt257qwJU3JtBsu4CBbj92iKUm
 PFgr/2WDpC6PFBYGQWM+rV+IGQDCYxu6ln8SIHo1J/OMIJF2Tfps15nD04w4BcQqOLq9
 osSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2zTn6UmRDFxIs8ngnHnsvmIE7cYSTi6nE7o8QaMVh/4=;
 b=lDXQC6OZ1C7ZnaAzRcnY2kJ8PM8QKR4EGKoq+wRYU1zyO/CkhgxflCoSSFHI0QDS8I
 Svx4MijdkBa74az3LIZXEon5IksaH+bzhdeI5Tl9ku87WoowyDZeucvTlaGOUD4DLo+X
 hoS59tlu7HiQfFre4sYkSAxpd1JQeIwxZz6FsmjP6PFr2rXPYenYsfFKOW6KV+Z+iScj
 GMXdtiyF18lnpaHYFKbAktupxcuzlH9p8JgEsNtg3zBAe+cQQxvoMx8b3Yk8qNQGKl2e
 jTlb0oalMpPa5ZscgbELImCrtO72p68zm1zVj9D5Rye3tp+tAEeCwnhMvqPD5c+6XpzW
 dO4Q==
X-Gm-Message-State: AOAM530tMWA+kOHOvHPCluwwNLaM45UtiOpdg9D52C0cJvucthcK2I5/
 fG2EOqkGEJDq98aImasjoY0iGw==
X-Google-Smtp-Source: ABdhPJwA7IsNAMHtf8Ilb++VnjC5zb040uvQ3EaOqsxb03NjE5mdqfYClFCr9x+r4M8ZqPJ3cDWmDw==
X-Received: by 2002:a05:6830:124d:: with SMTP id
 s13mr5560103otp.12.1601573425829; 
 Thu, 01 Oct 2020 10:30:25 -0700 (PDT)
Received: from [10.10.73.179] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id u2sm1467840oot.39.2020.10.01.10.30.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2020 10:30:25 -0700 (PDT)
Subject: Re: [PATCH 4/5] target/riscv: Add V extention state description
To: Yifei Jiang <jiangyifei@huawei.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: zhang.zhanghailiang@huawei.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, victor.zhangxiaofeng@huawei.com,
 Alistair.Francis@wdc.com, yinyipeng1@huawei.com, palmer@dabbelt.com,
 wu.wubin@huawei.com, dengkai1@huawei.com
References: <20200929020337.1559-1-jiangyifei@huawei.com>
 <20200929020337.1559-5-jiangyifei@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <adfc3dc2-606f-5670-4b3b-c0719826a60e@linaro.org>
Date: Thu, 1 Oct 2020 12:30:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200929020337.1559-5-jiangyifei@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.26,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Oct 2020 17:30:31 -0000

On 9/28/20 9:03 PM, Yifei Jiang wrote:
> In the case of supporting V extention, add V extention description
> to vmstate_riscv_cpu.
> 
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Yipeng Yin <yinyipeng1@huawei.com>
> ---
>  target/riscv/machine.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Though of course this is racing with the v1.0 patch set, which changes the set
of vector csrs.


r~

