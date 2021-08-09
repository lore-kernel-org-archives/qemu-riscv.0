Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mDB2k-0003kB-C9
	for mharc-qemu-riscv@gnu.org; Mon, 09 Aug 2021 15:34:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDB2j-0003jx-Ch
 for qemu-riscv@nongnu.org; Mon, 09 Aug 2021 15:34:37 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:43923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDB2h-0002ZH-8E
 for qemu-riscv@nongnu.org; Mon, 09 Aug 2021 15:34:37 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 pj14-20020a17090b4f4eb029017786cf98f9so1593184pjb.2
 for <qemu-riscv@nongnu.org>; Mon, 09 Aug 2021 12:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pPcCycoZaAWKYNQlrXsatKDZcRD/A1Al+PwuNps7dTM=;
 b=OId5eN+vTUiPD0bFt/9drpraDb0ZabrRvz4mgArYtrN+GPxdtaPCCxFkiarF7pAIux
 SXqb0d5rW2yvLubXoLbMsO3HW84qBKXFjwM6LiCksEEMsrf5ZGiHPPkCSgusdbt+ztBY
 zRl3oT5scrEtnY2fcuVM9ytgUCtd9rtsyhLpAJ2qCV/TXB3JfGmHRmLN6S7BrDTBqtwG
 zRPjqXAtyKGcJvsxvQxMYApAWD8tMWnde1+EcRKafYE9VBSVHWG9kv8vUOvHP6k5LCB9
 s9/SuZU4uFJOirgAvl4UEF17tqA9+cwFdUGG2bxGcB0QFgunaAh3gRNb2VshrJC2hwrf
 fHHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pPcCycoZaAWKYNQlrXsatKDZcRD/A1Al+PwuNps7dTM=;
 b=iUaNrAmXvHkQw1+Vr3FVrsc5jP/xKzH/+NI8zyNsFKRU8ZB1u+TPljpI/e6tMoC6NC
 nk3iVJec3mxv4GvD05IrkpLAwSmzLiaAz/dhPY/0xWc+/Dvt7UO97Fe0Tu9cVhNz8/EV
 +ZdQ8J5etAI+FXA5/JD56LXSaLWYwI+wp1pJDutXSyt5AN/Of/PW2KGH5cPVIl8BPV3T
 w5zPO24wvenat7n+tc/BTLG5XtEZhQXXWCcjFVH1nezPX+18CshrQacv0R9cQ5RqGd8u
 cX21cfv6A8YR/mwVNMS35TugUmKmjxhf3zYVERlKF1iePnh/FattfoYenK2jSACD543f
 tqOg==
X-Gm-Message-State: AOAM53370Hv3a0d2TnEEeuC2Ck8Ye56DFty5wkuwEi94ks0Rp+o2FMb7
 Sl9nf/pmdeJN/IwHKwcAjtY9WMviHKp8/A==
X-Google-Smtp-Source: ABdhPJyUSLS/kL2uEA/v8MZDTzjiQEzmHnQPlwvdp+1za5y6NydSWLLHo+TNJ5Ld1zJ+OKnE1nOyCw==
X-Received: by 2002:a17:90a:9411:: with SMTP id
 r17mr26872892pjo.49.1628537673724; 
 Mon, 09 Aug 2021 12:34:33 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id x13sm19641429pjh.30.2021.08.09.12.34.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 12:34:33 -0700 (PDT)
Subject: Re: [RFC PATCH 02/13] target/riscv: Support UXL32 for branch
 instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20210805025312.15720-1-zhiwei_liu@c-sky.com>
 <20210805025312.15720-3-zhiwei_liu@c-sky.com>
 <840d76cc-fd1c-6324-19cc-a6ec0075d032@linaro.org>
 <5ae8f7a7-7659-aeee-9b4b-3521e19f4c75@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <249ce5f9-333a-7186-36bb-a2ecadb19254@linaro.org>
Date: Mon, 9 Aug 2021 09:34:30 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <5ae8f7a7-7659-aeee-9b4b-3521e19f4c75@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 09 Aug 2021 19:34:37 -0000

On 8/8/21 3:45 PM, LIU Zhiwei wrote:
> 
> On 2021/8/6 上午3:06, Richard Henderson wrote:
>> On 8/4/21 4:53 PM, LIU Zhiwei wrote:
>>> +static TCGv gpr_src_u(DisasContext *ctx, int reg_num)
>>> +{
>>> +    if (reg_num == 0) {
>>> +        return ctx->zero;
>>> +    }
>>> +    if (ctx->uxl32) {
>>> +        tcg_gen_ext32u_tl(cpu_gpr[reg_num], cpu_gpr[reg_num]);
>>> +    }
>>> +    return cpu_gpr[reg_num];
>>> +}
>>> +
>>> +static TCGv gpr_src_s(DisasContext *ctx, int reg_num)
>>> +{
>>> +    if (reg_num == 0) {
>>> +        return ctx->zero;
>>> +    }
>>> +    if (ctx->uxl32) {
>>> +        tcg_gen_ext32s_tl(cpu_gpr[reg_num], cpu_gpr[reg_num]);
>>> +    }
>>> +    return cpu_gpr[reg_num];
>>> +}
>>
>> This is bad: you cannot modify the source registers like this.
> 
> In my opinion, when uxl32, the only meaningful part is the low 32 bits, and it doesn't 
> matter to modify the high parts.

Then why does the architecture manual specify that when registers are modified the value 
written sign-extended?  This effect should be visible...

> 
>>
>> These incorrect modifications will be visible to the kernel on transition back to S-mode.
> 
> When transition back to S-mode, I think the kernel will save the U-mode registers to memory.

... here.  Once we're in S-mode, we have SXLEN, and if SXLEN > UXLEN, the high part of the 
register will be visible.  It really must be either (1) sign-extended because U-mode wrote 
to the register or (2) unmodified from the last time S-mode wrote to the register.


r~

