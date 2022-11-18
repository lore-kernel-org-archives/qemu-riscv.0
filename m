Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ovyDX-0002Df-Uj
	for mharc-qemu-riscv@gnu.org; Fri, 18 Nov 2022 05:03:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovyDT-0002By-1R
 for qemu-riscv@nongnu.org; Fri, 18 Nov 2022 05:03:23 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovyDQ-0004aO-MD
 for qemu-riscv@nongnu.org; Fri, 18 Nov 2022 05:03:22 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 w15-20020a17090a380f00b0021873113cb4so4180352pjb.0
 for <qemu-riscv@nongnu.org>; Fri, 18 Nov 2022 02:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vJHSbecfHElT/9RaubhNbvT61TXsuX2A0QPk1VQBzWc=;
 b=HwoarAtaJxMSs2V+MVQ1n7g7sO1CYtGzE3X0xIpVLOeIVMuW/mAiI3MVIjVaIaXwkr
 zW3Cv8y7LnY9QDD9TMqH4hJhu+2cUoWt/dedGxa6zkiOvXbNHO9lZQ8Q5EjXCW3LqYcz
 AulXuZhKFl2eDqgIN0VH3KXoSAsLq2LNGddG+V58dw9jYwKsN+52hbJDnEwtgykYp96F
 kMdE84H7wOv7AZVeT+A0riUoh2iqhELyBplr9dumodf92TmBeLbPdK1FG6wNpEccjXhi
 t0wYH6t3Uk+GKTZDVlSyz4Qx5emW7IpVmvsPDtecf2HkKJnTRH4CRaZ5diSNg4Fg5wzY
 RuDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vJHSbecfHElT/9RaubhNbvT61TXsuX2A0QPk1VQBzWc=;
 b=vSpkQE8wNqIPPbvX9DojN32ShWfbStctCT8zfY5w8sz4qAsEDgfvcxlbQNMV3AW14Q
 KNbGVB+chP/zMmPphqg8m1iovJHFS4wU2WhpqbUnAMbvuvXLs3IJQbHU7F5PLhYvt7qM
 TvJDLLW/m4GxUDuG8tKar7VDM+fQO2Sia1SNh7SWkq00fKcVZuZAwbPFZwze3EEJgzFb
 6DFcnILouL0JngegQwH9dn54J91lOO2Cdva3eMgR/mVSRTeVvqJ+Dj5xiSORGqk9v8lP
 xwhMVeUWRzk4Km5mxfZZBP0DlGpZWIKzDObcPNe3mur7eUMA3LhUQ3K9zdYxdyLVCLCy
 P/4w==
X-Gm-Message-State: ANoB5plVkiNDfa2/93MLP2DyqMna7Zb/kaTw1A7vtzIoLgLlsdmQT73W
 jxBoegVhNAxV0M4D3wWME8LlhA==
X-Google-Smtp-Source: AA0mqf7OKaYnNIpDM/DyuD5M8mpZ6fFAMRqbn+3UODbnjN2oST08gJM6pdzBDbinq6BstAymmq2iFw==
X-Received: by 2002:a17:90a:9c18:b0:212:fa9a:12df with SMTP id
 h24-20020a17090a9c1800b00212fa9a12dfmr13165248pjp.231.1668765781357; 
 Fri, 18 Nov 2022 02:03:01 -0800 (PST)
Received: from ?IPV6:2602:47:d48a:1201:90b2:345f:bf0a:c412?
 ([2602:47:d48a:1201:90b2:345f:bf0a:c412])
 by smtp.gmail.com with ESMTPSA id
 z6-20020aa79906000000b005613220346asm2684513pff.205.2022.11.18.02.02.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Nov 2022 02:03:00 -0800 (PST)
Message-ID: <9be5988b-8947-373c-3c48-6fd73eaa4653@linaro.org>
Date: Fri, 18 Nov 2022 02:02:58 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 6/9] target/riscv: add support for Zcmp extension
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20221118071704.26959-1-liweiwei@iscas.ac.cn>
 <20221118071704.26959-7-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221118071704.26959-7-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
X-List-Received-Date: Fri, 18 Nov 2022 10:03:23 -0000

On 11/17/22 23:17, Weiwei Li wrote:
> Add encode, trans* functions for Zcmp instructions
> 
> Signed-off-by: Weiwei Li<liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang<wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/insn16.decode                |  18 +++
>   target/riscv/insn_trans/trans_rvzce.c.inc | 189 +++++++++++++++++++++-
>   target/riscv/translate.c                  |   5 +
>   3 files changed, 211 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

