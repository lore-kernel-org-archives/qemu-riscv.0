Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nOltB-0001cE-EA
	for mharc-qemu-riscv@gnu.org; Mon, 28 Feb 2022 14:40:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOlt8-0001Zy-0Q
 for qemu-riscv@nongnu.org; Mon, 28 Feb 2022 14:40:54 -0500
Received: from [2607:f8b0:4864:20::434] (port=42922
 helo=mail-pf1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOlt6-000818-Gk
 for qemu-riscv@nongnu.org; Mon, 28 Feb 2022 14:40:53 -0500
Received: by mail-pf1-x434.google.com with SMTP id a5so11112408pfv.9
 for <qemu-riscv@nongnu.org>; Mon, 28 Feb 2022 11:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=yZw1LvtoqlpWDEgVBZpwRMYoNnqtyA2R97ror7ln6Uk=;
 b=oqeURccO2ai+Wttk3HByYllDglkg62ChnO2hzubg3xv9Q49Wu5vkJLkMEfQnAaCTOk
 jwmQkJWWlNOokniVouXsHXudJif1Me/QwB8uRtWVBzvhT1yVMkovgX1xzj58yT0GGL45
 yfFPv8tIipU12uBJ/hzYWET6/HsXxfPJ/ozhWRAnUJrGvWYHrzMqM6AsuXPqShUEkpfe
 ddky9OK/VFFSzb06j+nTvsYmHMvjGUWFkpoDvg1XZNay3T4J3PwYjK2c5tTMIKL9y2Gz
 ghSmvcK2W6YYSyAqBCjL4r3Vkfc7eeDp8Tb32cuaeoXlmgBMOerG+bMR1T+xK1la9WRi
 9RsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yZw1LvtoqlpWDEgVBZpwRMYoNnqtyA2R97ror7ln6Uk=;
 b=KQEhHH2A010LrT8GzoAdkNyAdn86yFms78NKEppK4BO4OJ0PVx/GvbbmMkVq0UAVGa
 cHdfZ7NpytJ0J9DpTzd8pa/DGB1hHVKrQmiTqI0aleN1m4Svq7NK5fRWfSPblvw+uVGh
 PtVxQ/aFaIRxyNjJjDEMj7YD2Zt9SkaMiL+yzf5NwDnokE9r3zqq0fGrlVwIXBJ+KtFY
 QJXdhTB+r79siSh3K0fPeGPkOF/lo/iUnU8pGeMDvZ/TlbPZzsPmE7uCxl0osRz7VPDY
 e2FOr3LHmtGpmLNlj3aFoAUlG9tenhBtEwDga0V5iLLk9zQ/n6LrL3nHH+Zm0IoV75VH
 jDXA==
X-Gm-Message-State: AOAM530j3dkjJYdv5/tSGzQquPz9AlpZfC0ZgeYQgTS3g2echqPBYup6
 OkG6epIUtWQG14ODm7E3ruG6BQ==
X-Google-Smtp-Source: ABdhPJxZJSv57QGOguAC2AMy3xUp3tKuf7Q10ot8IUE1thWT/kX7suxEvok9LQ/pRj/rgSXXVU5dow==
X-Received: by 2002:a63:2a53:0:b0:372:cb6d:3d61 with SMTP id
 q80-20020a632a53000000b00372cb6d3d61mr18475830pgq.575.1646077251274; 
 Mon, 28 Feb 2022 11:40:51 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:483f:d486:138f:7868?
 (2603-800c-1201-c600-483f-d486-138f-7868.res6.spectrum.com.
 [2603:800c:1201:c600:483f:d486:138f:7868])
 by smtp.gmail.com with ESMTPSA id
 bg3-20020a056a001f8300b004f40e8b3133sm4084560pfb.188.2022.02.28.11.40.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 11:40:50 -0800 (PST)
Message-ID: <fe8b6323-adcf-0bec-06ae-02f468fe4afa@linaro.org>
Date: Mon, 28 Feb 2022 09:40:47 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v7 10/14] target/riscv: rvk: add support for sha512
 related instructions for RV64 in zknh extension
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, lustrew@foxmail.com,
 luruibo2000@163.com
References: <20220228144810.7284-1-liweiwei@iscas.ac.cn>
 <20220228144810.7284-11-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220228144810.7284-11-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::434
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 28 Feb 2022 19:40:54 -0000

On 2/28/22 04:48, Weiwei Li wrote:
>   - add sha512sum0, sha512sig0, sha512sum1 and sha512sig1 instructions
> 
> Co-authored-by: Zewen Ye<lustrew@foxmail.com>
> Signed-off-by: Weiwei Li<liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang<wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/insn32.decode              |  5 ++++
>   target/riscv/insn_trans/trans_rvk.c.inc | 32 +++++++++++++++++++++++++
>   2 files changed, 37 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Same comment about the macro, though.


r~

