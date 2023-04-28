Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1psWIK-0002hf-7c
	for mharc-qemu-riscv@gnu.org; Fri, 28 Apr 2023 18:10:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1psWII-0002hN-Ql
 for qemu-riscv@nongnu.org; Fri, 28 Apr 2023 18:10:22 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1psWIG-0001vJ-V1
 for qemu-riscv@nongnu.org; Fri, 28 Apr 2023 18:10:22 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f178da21b5so1106505e9.3
 for <qemu-riscv@nongnu.org>; Fri, 28 Apr 2023 15:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682719819; x=1685311819;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KAJH0aRFMMXj2/dcokl803vkY6ifagUqWlLi9LPb4Ig=;
 b=MVdOtxOZxLtMqKXASFUQSGLo5fKp4gGReDABvmuDNeMeCwTR/WMF2SBZcDslg11hfe
 MIsbxefbYSCMpLI+oSYkxD40wiPllDrawei1ayfykQnt/4zEU9lP8id1hfeXlSCWbyEm
 432Pse3J63RZtGqynyrfU7BQMLd07o45kh7epciB61KQmIDOBMPw5GHgBvFomZf3wjcr
 YuVvWMZLAeMBpzTC6q8catpTzykCHK+KMqvjCkA05S7POTu08FAqqtFMCFCGoivwSRR/
 shUgBq5fSJJshdU+Cl65lhn4sbKXEh/BzcIj8D3Z/7CYQGBYMMDAapNK/mJDF6tT3jea
 rjig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682719819; x=1685311819;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KAJH0aRFMMXj2/dcokl803vkY6ifagUqWlLi9LPb4Ig=;
 b=KZZl4RWzYEEaEpl45/EhwfXJTKZRT4vQmA1RWEnRlsWx7IM2yU7rlnvJyzMxpMHJIh
 Q0uIati7PLm5OgacJg30e2yDHbwDbDim5g3BPDHHvGCxygH4QymC4uECLLYLPQsBb8T5
 BQRr9hO1obsN/OUCMT7cVXLdhZJAUOsKOSzGmUv2cqFmg1SjK255zbRzqoijTfAX4K3n
 gR5y6Byi/g+iDldN33W4fhaJjF7XFford6ttClQOFtWEH07QFGNrqusQhbtXrsyNvoYw
 gLNbZwOumvMNJp2c0wzuQ41QaukJ2fO1/3YC+8Z13D4sYD+vUJYn407WW0FdhGb7FPZN
 FMXA==
X-Gm-Message-State: AC+VfDyQN/Dyg9MX51GidgRgrI9qvGVB8WNsmMe9ckAI52CfUVR1ivqV
 8gdDkT25M8jvbs1VveCFHycRJQ==
X-Google-Smtp-Source: ACHHUZ515wpY0Mn0phfwJLn02KZ9m2JvHfqC67wnZxM9SXvZvN4i5hZcRL9A2PmLOT0u7YO9oNQ9AQ==
X-Received: by 2002:a05:6000:c:b0:2f2:7adf:3c67 with SMTP id
 h12-20020a056000000c00b002f27adf3c67mr4461041wrx.61.1682719818832; 
 Fri, 28 Apr 2023 15:10:18 -0700 (PDT)
Received: from [192.168.1.17] (78-141-23-110.xdsl.murphx.net. [78.141.23.110])
 by smtp.gmail.com with ESMTPSA id
 m18-20020a7bcb92000000b003f24f245f57sm16682212wmi.42.2023.04.28.15.10.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Apr 2023 15:10:18 -0700 (PDT)
Message-ID: <08685e34-c44c-7f10-6635-ee4d0efe8bb5@linaro.org>
Date: Fri, 28 Apr 2023 23:10:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 5/7] accel/tcg: Uncache the host address for
 instruction fetch when tlb size < 1
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230422130329.23555-1-liweiwei@iscas.ac.cn>
 <20230422130329.23555-6-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230422130329.23555-6-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 28 Apr 2023 22:10:23 -0000

On 4/22/23 14:03, Weiwei Li wrote:
> When PMP entry overlap part of the page, we'll set the tlb_size to 1, which
> will make the address in tlb entry set with TLB_INVALID_MASK, and the next
> access will again go through tlb_fill.However, this way will not work in
> tb_gen_code() => get_page_addr_code_hostp(): the TLB host address will be
> cached, and the following instructions can use this host address directly
> which may lead to the bypass of PMP related check.
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1542.
> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   accel/tcg/cputlb.c | 5 +++++
>   1 file changed, 5 insertions(+)

Queueing this one patch to tcg-next.


r~

> 
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index e984a98dc4..efa0cb67c9 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -1696,6 +1696,11 @@ tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env, target_ulong addr,
>       if (p == NULL) {
>           return -1;
>       }
> +
> +    if (full->lg_page_size < TARGET_PAGE_BITS) {
> +        return -1;
> +    }
> +
>       if (hostp) {
>           *hostp = p;
>       }


