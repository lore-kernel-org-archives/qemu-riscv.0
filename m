Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1olTdd-0003ut-0b
	for mharc-qemu-riscv@gnu.org; Thu, 20 Oct 2022 07:23:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olTZQ-0006QH-A9
 for qemu-riscv@nongnu.org; Thu, 20 Oct 2022 07:18:41 -0400
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f]:47001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olTZO-0001Ph-MA
 for qemu-riscv@nongnu.org; Thu, 20 Oct 2022 07:18:40 -0400
Received: by mail-ua1-x92f.google.com with SMTP id h25so8700484uao.13
 for <qemu-riscv@nongnu.org>; Thu, 20 Oct 2022 04:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TBBTgE5SjL+KvHzc6CU6QBvnsX/EMwfALsfXdxjvrhw=;
 b=sOFaVdksPs+esv0//SuJNNORmUIGnQBS9/G8psBgt75wan1V6JcDl67AzyZ6JXk44l
 mY11VsPYXTsye0MRRmRQC1zc6lHW/Ks6QMvRWELlyhKHyWZKdyyvYBgC54E6LEIEH/gc
 Xce8fdxJI5vCDN6D6U24zv0n6EXGK9oQ3s0Q7LgVnpNk8+SDGdw0ZjhQf8Ysp16cqylC
 z9vxU8WYY+cLRxzLSMPFx1KiAq2Sp8nq5ROR0Rf1YB0qqVzxT2umZWEiiOM1KAG8IaTK
 LtyI5fNsRwVkaJUHx3NHeklxhutvgmceJb6BG49FxRExiAQZD97DV6SFXm6u3dTA1vtT
 04Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TBBTgE5SjL+KvHzc6CU6QBvnsX/EMwfALsfXdxjvrhw=;
 b=a3XoMDlL7I1bYD4io+EFB/CKtfFGeAKJaCPQ8VtxMK2XSvv+sFOh2UQ/nLqH96sB5d
 IC/IQ3tdXstFVboFBIMWF7a/VhOssYRSaOB9y3C5ybb7vrZRz0WAwpQ+MW6ysQACVWlF
 /76sIzky9iJtySjQpgk9rKTHmUTO3cp0BVwX2NZgWiHfgcspnULYzxiX8R3KL6SC49l0
 815KNoejZalXwGeztiaK66nvirkR7j9RTq9WIlaxZuY1QgYLnwqJoXtAAKfU5QQbmHxW
 aR/Gc3vFI59yOtcEPYGGFI8SJ9nkbZ+lS4Q2OMsW03H6oyRL/PQan6aOXsr8uUKJBGgj
 R4IA==
X-Gm-Message-State: ACrzQf1iWxui+UCzBufUJ6gf1RTMvXGLH+hrB14vkjT2XU1oWe2km7k5
 ztdwWdsbnHJaK8Cm4fgzmbBrfhVQb3ZNK4kP
X-Google-Smtp-Source: AMsMyM6/dupd7R/gyLTrCQM9HuCJGl/2KGXY1/FoJWUL+bzRz2WP8lDeI+KcfMa/K7dZy+0guoc+gw==
X-Received: by 2002:a17:902:d48d:b0:185:115c:b165 with SMTP id
 c13-20020a170902d48d00b00185115cb165mr13606724plg.86.1666264706976; 
 Thu, 20 Oct 2022 04:18:26 -0700 (PDT)
Received: from [192.168.1.107] ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 x14-20020a17090a294e00b00208c58d5a0esm1530549pjf.40.2022.10.20.04.18.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 04:18:26 -0700 (PDT)
Message-ID: <4373f964-3336-d076-5284-d5a2983ddd88@linaro.org>
Date: Thu, 20 Oct 2022 21:18:18 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [RFC PATCH 1/3] tcg/riscv: Fix base regsiter for qemu_ld/st
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 lzw194868@alibaba-inc.com
References: <20221020104154.4276-1-zhiwei_liu@linux.alibaba.com>
 <20221020104154.4276-2-zhiwei_liu@linux.alibaba.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221020104154.4276-2-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::92f;
 envelope-from=richard.henderson@linaro.org; helo=mail-ua1-x92f.google.com
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
X-List-Received-Date: Thu, 20 Oct 2022 11:18:41 -0000

On 10/20/22 20:41, LIU Zhiwei wrote:
> When guest base is zero, we should use addr_regl as base regiser instead of
> the initial register TCG_REG_TMP0.
> 
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> ---
>   tcg/riscv/tcg-target.c.inc | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
> index 81a83e45b1..32f4bc7bfc 100644
> --- a/tcg/riscv/tcg-target.c.inc
> +++ b/tcg/riscv/tcg-target.c.inc
> @@ -1185,6 +1185,8 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
>       }
>       if (guest_base != 0) {
>           tcg_out_opc_reg(s, OPC_ADD, base, TCG_GUEST_BASE_REG, addr_regl);
> +    } else {
> +        base = addr_regl;
>       }

You're right that there's a bug here, where TMP0 remains uninitialized.  I think it would 
be better to reorg the other direction: begin with initializeing base = addr_regl, and 
then change it away only when we make modifications.


r~

