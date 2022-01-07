Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n5wG8-0007HQ-7K
	for mharc-qemu-riscv@gnu.org; Fri, 07 Jan 2022 15:54:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5wG6-0007Fx-MM
 for qemu-riscv@nongnu.org; Fri, 07 Jan 2022 15:54:46 -0500
Received: from [2607:f8b0:4864:20::52a] (port=41712
 helo=mail-pg1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5wG5-0002G8-5a
 for qemu-riscv@nongnu.org; Fri, 07 Jan 2022 15:54:46 -0500
Received: by mail-pg1-x52a.google.com with SMTP id f8so6419441pgf.8
 for <qemu-riscv@nongnu.org>; Fri, 07 Jan 2022 12:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xH5A+OLh+UWeclINroISM6yVrZpD3EmLP4qyHcqEUYo=;
 b=noMG2npDi//ipkO8RtcAXMdi07QbTZjYu8wTnRP1cCaYDaPMWuIb7MnW/oePGDmItS
 dswUAUooYRlwpZV6FnEMP6W2k7Od49LxiGAWe0xMaZSi1GNil32fdrWouk0BBpFEvwYk
 3NroxwYC5b++VwI6Pd0ecVMRWDCBqB8CNZOUkv9SkVK3wDGzEchxpcuAIPuISp5FShUf
 5Nf2RlgfGhQOuQSS7yEoC29ylXDAOXG/aHnQWPpNYmENLkBaEcRb1dAEM34hia5scxFj
 ZcQ5FDTmT65aCm3S4QHMLVZg1GI0/AgBfVOXyhXvLUBbSkB+iCEVd8CKhIwtZJ6sw605
 pTUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xH5A+OLh+UWeclINroISM6yVrZpD3EmLP4qyHcqEUYo=;
 b=NysyqOcTEH96CPc+jjFMZ/Epui/zwhIQHiekOX2ahLvHVXfGnzS2mpc4IdbA2Wes9j
 9qlZ5C89jOfeM2882TrFkzIY79I2LpYGDGBD8Usg3rRPGba1suB5hR3LbjlpnX943aYd
 HqV8/YGit7gHpgU5f55w9u0imi56cM8Iad6d5KJ/xjdGTtKqKtLoUHMiNEFO9ubL6155
 bY5PFGGnmHwnjXHHW5Rvw2WBrUvBD85K05knLwSnSTHhgKLitIIOP+IpE9EKFKjSlJwl
 DGyPkW6S0k2HkK9ZyrHJX2cpKTI6oBqA+1aWPday8qrXMeBlapZsyk/q88Mm0hnzGmoW
 SnYA==
X-Gm-Message-State: AOAM530PcmYbah3UDADTsUtYIGn78lIYOI3UjSWKQa8c5FDM9hhE9q66
 VzotWH5kKO2pOAXCeSrGr1GtNg==
X-Google-Smtp-Source: ABdhPJzky5S73Jn+Z7Dqmm5JATXAKyuua9y0qkJHSi6HPd5DW/hLKi0zbfEYFKRg7bXLVdA8KZcpUw==
X-Received: by 2002:a63:1422:: with SMTP id u34mr58483215pgl.135.1641588883811; 
 Fri, 07 Jan 2022 12:54:43 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id f4sm7112465pfj.25.2022.01.07.12.54.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jan 2022 12:54:43 -0800 (PST)
Subject: Re: [PATCH v3 4/6] target/riscv: add support for zdinx
To: Weiwei Li <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, ardxwe@gmail.com
References: <20220107112749.981-1-liweiwei@iscas.ac.cn>
 <20220107112749.981-5-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3ad579d2-9b29-a635-48ec-64f63e9b5ed6@linaro.org>
Date: Fri, 7 Jan 2022 12:54:42 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220107112749.981-5-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.691,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 07 Jan 2022 20:54:46 -0000

On 1/7/22 3:27 AM, Weiwei Li wrote:
> +#define REQUIRE_EVEN(ctx, reg) do { \
> +    if (ctx->ext_zdinx && (get_xl(ctx) == MXL_RV32) && \
> +        (reg & 0x1)) { \
> +        return false; \
> +    } \
> +} while (0)

Parenthesis around reg.

> +    REQUIRE_EVEN(ctx, a->rd);
> +    REQUIRE_EVEN(ctx, a->rs1);
> +    REQUIRE_EVEN(ctx, a->rs2);
> +    REQUIRE_EVEN(ctx, a->rs3);

I think these could all be combined:

     REQUIRE_EVEN(ctx, a->rd | a->rs1 | a->rs2 | a->rs3);

etc.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

