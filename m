Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pgroF-0006kx-0K
	for mharc-qemu-riscv@gnu.org; Mon, 27 Mar 2023 14:43:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pgroD-0006ka-C7
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 14:43:09 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pgroB-00085d-FG
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 14:43:08 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 l9-20020a17090a3f0900b0023d32684e7fso11326453pjc.1
 for <qemu-riscv@nongnu.org>; Mon, 27 Mar 2023 11:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679942584;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=smElFyTXO9NrU2Fyau0lLYj3kwui4it19HAiV9AbNs8=;
 b=brEOjb0faughg8lfQMXzJYbWvu6NWvJFokhlnoRo/iJ5CDNRwEyNls4k3ieuzNforR
 NOyZB0ebBDq0XKES7NMhK6mKASpNZ8pKYf4IJ04ku52JTI5fQ/HBEER8Q+2yyObWARCr
 d8x4W9YThG75vOJslYRvCQEgEk1M9WXDPuwo9ZeVxlvWIsALWdg3IHaKMuV6jFM+n8a5
 OcuywG7j9cL0N9bstydM9uhDq9qCfE5GPfY2J2aYWBEWzFeOwlkFEQVkYSAzHzVq5297
 o3h/3x2qRxkhmc/9JMqnuMOOSbuO/VpuMjDB917LbEHdAa2MCv77PXr6m6ZsD/RLzk+/
 3/7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679942584;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=smElFyTXO9NrU2Fyau0lLYj3kwui4it19HAiV9AbNs8=;
 b=BRdQ+lyUwFCqM77DJaCDGB5TL7U7jaP/Imz0wpG4uddXe9y3EUeg0hy4EVugdmt7zn
 kxsiQUKd/n1EW6scstlQV7ks1pMrtDZimBZXcvNZ1nR/iBSVLDi0p63rMwwMSbLKu5fS
 r/9djIIN0BuY9JogaZdglR8xv1qyZ1Q5NQq4TONVtblrOpg4qL2B89HmBpF1YQBvPYRe
 tmjSLranwMNPASCCcVNSyFBhyn55Bwunvz8ypDDriLHsK+UpyAyaIyGo8eU0jq60X06x
 lL71JLQ6ENMlSaYxYNeggr8Lr7nYjAhr2Qxi8IO2Dhu5hs5SqJXZQ53fgzdsn4cLyZm0
 g31w==
X-Gm-Message-State: AAQBX9eGFZ2eoGu4it3d3GljuzJOeUSciI1w7WnM9H5iyZzNUbIfZfvl
 KHm1tDvmQbla+QVf258D7Je0ZA==
X-Google-Smtp-Source: AKy350aJB8lQ4hEDQPGVwImBrgJGvXPgYlzdsaBp0miVAzh0m7ZRZDT6ja6VDAnGVWM3eUgJdDI0LQ==
X-Received: by 2002:a17:902:d48a:b0:19f:3617:e9e9 with SMTP id
 c10-20020a170902d48a00b0019f3617e9e9mr17837697plg.43.1679942584465; 
 Mon, 27 Mar 2023 11:43:04 -0700 (PDT)
Received: from ?IPV6:2602:ae:1544:6601:6705:aa17:3641:e634?
 ([2602:ae:1544:6601:6705:aa17:3641:e634])
 by smtp.gmail.com with ESMTPSA id
 m33-20020a635821000000b0050927cb606asm17994505pgb.13.2023.03.27.11.43.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Mar 2023 11:43:04 -0700 (PDT)
Message-ID: <8a27b03e-9100-6b64-fde9-6b92a9f643b9@linaro.org>
Date: Mon, 27 Mar 2023 11:43:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 03/19] target/riscv: introduce
 riscv_cpu_add_misa_properties()
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
References: <20230327124247.106595-1-dbarboza@ventanamicro.com>
 <20230327124247.106595-4-dbarboza@ventanamicro.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230327124247.106595-4-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
X-List-Received-Date: Mon, 27 Mar 2023 18:43:09 -0000

On 3/27/23 05:42, Daniel Henrique Barboza wrote:
> +        g_autofree char *name = g_strdup_printf("%s", misa_cfg->name);
> +        g_autofree char *desc = g_strdup_printf("%s", misa_cfg->description);

What is the point of this?  It would seem that you could simply pass the original string 
literals to object_property_*.


r~

