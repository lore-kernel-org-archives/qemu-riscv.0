Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pFTpb-0007co-Ob
	for mharc-qemu-riscv@gnu.org; Wed, 11 Jan 2023 00:39:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pFTpa-0007cJ-6o
 for qemu-riscv@nongnu.org; Wed, 11 Jan 2023 00:39:22 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pFTpY-00026a-O7
 for qemu-riscv@nongnu.org; Wed, 11 Jan 2023 00:39:21 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 h7-20020a17090aa88700b00225f3e4c992so18876182pjq.1
 for <qemu-riscv@nongnu.org>; Tue, 10 Jan 2023 21:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1mILLToEQSFznoisqcOMWl3SJWfi8lRpBkCgUozEfIs=;
 b=sy2MKt7M0vIYExT2CmpnYfeq51Sks47HoUIweLLxVmIxqhg5Mi9QZ9Hw16ho1ZkQde
 uHA176M88tEEN9DdhldCN1meg8fkuuhw5mqFRrcVzcwk+StH13zHCT7xGMsNRKeUe0ac
 J6WxDAYy7dX6WEb3PALa9WMXHmctrMEdwiWlWmzNs+KBO2LwbUn8WXPYjRblpT4GwiY8
 MVnlEr6VAnI9Tg1kM+1x7f23Hj2JpZOH0pMrJGThj2xRrBUnkoxN51rT7E+u7CGsOYmo
 ROqmrRgbOub92OiE1pRTmvzFkrhfxAbcpb7cir/Zl8pBTziviyhTHXhz7tsUf5kib9G2
 A+/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1mILLToEQSFznoisqcOMWl3SJWfi8lRpBkCgUozEfIs=;
 b=mPiFwedgxORLMaeU1+JZ4OxUX2yO6aOtGwDbmT/JzlQoY/tp+jUAl2KkDBER9Isiws
 osiNJGryemhz/2XrGnrl8R7RCouCROBQHjqxwQs6OvAcWZZRu9G+oJhyPErh861yQxOc
 W5HeqAqZuCRkM0TjIhg6k4iLik0XMiW9nS/548V8W1WMnDZ217USptVK5/l7BE68KUKJ
 1uTrMTMCR7/yS71ID9TIdSJ2MobtNc5hpK2K0+kSY8sBhri0nsni2hRfj5UwEm49fiDt
 4rSc2vwDFUsUtgLTMnz3KujfakJwfS/o/KsJxpUCQo9QXZNJPRN3ZdDkSSfgG5RT0DGS
 6aPA==
X-Gm-Message-State: AFqh2kphNEz0QjMMvMqMwO+iOSfCs2jBwgWKNObfncPbREF7zTThn2EH
 VFlAYa1RJfMsfj46fBweSu3Gag==
X-Google-Smtp-Source: AMrXdXtbriMkJCCnSao5aFgrcC9mn+lvbGzgy0MRyDHtTGIZVN47k0epXGw+oH6iv6qNpzv2YoFV5Q==
X-Received: by 2002:a17:902:9b86:b0:194:4b48:f7f1 with SMTP id
 y6-20020a1709029b8600b001944b48f7f1mr1109091plp.17.1673415559073; 
 Tue, 10 Jan 2023 21:39:19 -0800 (PST)
Received: from [192.168.0.115] (63-157-97-90.dia.static.qwest.net.
 [63.157.97.90]) by smtp.gmail.com with ESMTPSA id
 v7-20020a1709028d8700b00192902287d1sm8986860plo.288.2023.01.10.21.39.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jan 2023 21:39:18 -0800 (PST)
Message-ID: <cbc36e57-6a55-0c96-0170-ff4c0563d556@linaro.org>
Date: Tue, 10 Jan 2023 21:39:16 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/2] target/riscv/cpu: set cpu->cfg in register_cpu_props()
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com
References: <20230110201405.247785-1-dbarboza@ventanamicro.com>
 <20230110201405.247785-2-dbarboza@ventanamicro.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230110201405.247785-2-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 11 Jan 2023 05:39:22 -0000

On 1/10/23 12:14, Daniel Henrique Barboza wrote:
> +/*
> + * Register CPU props based on env.misa_ext. If a non-zero
> + * value was set, register only the required cpu->cfg.ext_*
> + * properties and leave. env.misa_ext = 0 means that we want
> + * all the default properties to be registered.
> + */
>   static void register_cpu_props(DeviceState *dev)

Suggest invoking this as .instance_post_init hook on TYPE_RISCV_CPU.
Then you don't need to manually call it on every cpu class.


r~

