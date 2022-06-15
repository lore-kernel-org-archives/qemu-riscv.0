Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o1Uk7-0006Xd-GL
	for mharc-qemu-riscv@gnu.org; Wed, 15 Jun 2022 11:15:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o1Ujw-0006OL-MK
 for qemu-riscv@nongnu.org; Wed, 15 Jun 2022 11:15:28 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:44993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o1Uju-00087X-US
 for qemu-riscv@nongnu.org; Wed, 15 Jun 2022 11:15:28 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 gc3-20020a17090b310300b001e33092c737so2349931pjb.3
 for <qemu-riscv@nongnu.org>; Wed, 15 Jun 2022 08:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=NwKCxxDZHaRzzVB7y9ioblZeMvE6INBXtnG6G6DvlDo=;
 b=oHtPf+58J+yOhJt6zInPeYyDQIOC3w+50vJioSe4YpX7pNWAd5Wwd0HrDUrvIMikC0
 EA4j3mL6IU/RflQ2rush/0WjUXQQFU4d8k9xgp+GsM5PFFZUe5kLg1n0ssqfzLbJLTZB
 UDXNo0s/MCEZhcdNZ9F2ofmNdT/wxO7A57mK6wSfvXNGmMWuxlWFQKp4wEHDVhBObzLk
 qV5gZExnmuyb9v9mZ/WOkhMQwCoCYTUkz22IDPSYmTvdet1TCb2r4guY4NbAy1JhnUQo
 1FzuQtEZSuu+Okdyc7yTEtY+xiLGXPrPD+OWFOE3zBYzTi7jAV3fiIjnFYtTeW5Bcyj/
 pU6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NwKCxxDZHaRzzVB7y9ioblZeMvE6INBXtnG6G6DvlDo=;
 b=mRO87JZmpAyjrz4Bz77Ns6z5r6yoRJ2TGh5Yzv32CQBYxAn3ZTu9BwrBt15MWaXISS
 uGoa7IjPZSN+xIanWiNxRxL38O86Tc6J6QRglGpEuiWsr+XibHQb8sDNYl/xUHYi5Qpc
 iiRcJoTTM1vkG+kq0bb5kZHWvKAllI2MwxIhWEZMJKgX3WiBJ9OyOvz09pIp3a3vw3Ut
 qcMrVLAxyA+b+fPM7r+C7nWPFrZKVSdKeMwZ0nCTFrdDzJUK3aL4/K9ljVBRtnhLdBtE
 IH+btvjoYwK0X3Ia+dJuEm3PlKbwtQxMTz6wwr7pa6gjIGmn+ZDM4aVFaqI/1kAFDJP7
 o0GQ==
X-Gm-Message-State: AJIora8cmciqksLxupK+5II2hBqXWC4ymYhJcz56wQn8jDV5/HxVxINx
 qOdHyHVYsIzhQ+SmOHHCk49Vxw==
X-Google-Smtp-Source: AGRyM1veAhJ624Enp1iv0kS/RDjx/hu41sR5D3MX5OJ070DfVMJllYenF7nLSXx/hAiJt0nZq6bH+w==
X-Received: by 2002:a17:903:234e:b0:164:1668:3bc with SMTP id
 c14-20020a170903234e00b00164166803bcmr102029plh.106.1655306125293; 
 Wed, 15 Jun 2022 08:15:25 -0700 (PDT)
Received: from [172.21.2.253] ([50.208.55.229])
 by smtp.gmail.com with ESMTPSA id
 t9-20020a63a609000000b00401a7b4f137sm1527695pge.41.2022.06.15.08.15.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jun 2022 08:15:24 -0700 (PDT)
Message-ID: <bb1686ea-077f-81b0-7f0c-19e39fe16c85@linaro.org>
Date: Wed, 15 Jun 2022 08:15:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] target/riscv: Update tval for hardware watchpoint
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Bin Meng <bin.meng@windriver.com>
References: <20220615040806.137678-1-bmeng.cn@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220615040806.137678-1-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Wed, 15 Jun 2022 15:15:30 -0000

On 6/14/22 21:08, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> When watchpoint is hit, the breakpoint exception should update tval
> to point to the faulting virtual address.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>   target/riscv/cpu.h        | 1 +
>   target/riscv/cpu_helper.c | 6 ++++++
>   target/riscv/debug.c      | 2 ++
>   3 files changed, 9 insertions(+)
> 
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 7d6397acdf..fdcba8978b 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -289,6 +289,7 @@ struct CPUArchState {
>   
>       /* trigger module */
>       target_ulong trigger_cur;
> +    bool wp_hit;

It would be better to not add this, which duplicates cs->watchpoint_hit.
In riscv_cpu_debug_excp_handler, raise a synthetic exception number 
(RISCV_EXCP_WATCHPOINT?), then set tval in the same switch as the others.


r~

