Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mhagk-0002MA-KT
	for mharc-qemu-riscv@gnu.org; Mon, 01 Nov 2021 13:01:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhagj-0002M0-Ml
 for qemu-riscv@nongnu.org; Mon, 01 Nov 2021 13:01:37 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:44888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhagg-000174-SG
 for qemu-riscv@nongnu.org; Mon, 01 Nov 2021 13:01:37 -0400
Received: by mail-qk1-x72c.google.com with SMTP id bj20so5881261qkb.11
 for <qemu-riscv@nongnu.org>; Mon, 01 Nov 2021 10:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9CoSEE5xxU2Fe//d6ynBOQtvqF5jNIY6sP1r9R8epN4=;
 b=zVfuL3XKlj8klyf0Ghna0SjjUA93U7Cq5oQLYG6N+j0kS6rhQRKEfpMlAKpxrNzfNB
 dBpU2+fMTIDIz6iV8uXnE9/XjepttFGUx8bC0hBC6CsSeprOvRm4pMs6tHKHfb2QBtbD
 th2exdQmVt97Glo3beuBeaRYbXrCOCAmrK7ju6JjB4yv5aNpc0Ykz/JVRVM7ILqnmJ7f
 c53lxhMuN+s27AWPgBwFyhbfKAMvkih+b61oSRKICRqkWtMsP9qyqkWFFaTy2GBW8jje
 +S87A4esWdiKZMxcazYzqBK3ofeUoo+pEV0PHjaYfD6Nd7dUh6M9Xna3AjT8Wl+bMR2L
 vDAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9CoSEE5xxU2Fe//d6ynBOQtvqF5jNIY6sP1r9R8epN4=;
 b=av56YHpeWlLsBDMRW8aJvW6NO1kSMh36DCwdYObmk9Yo/S4JP3Q5byftO5rXPOYeMu
 ScwejLHDDhjR88SsR5mfT7K6WGFb+m55e5nXvGO13A8Obwh5/x+8+3cdgVVh4kWLg82J
 Lg4/9tSqlJ4eK9qkXG1Oe46Y6r2P6sjBo7ibCKn/VVakXtItvid7ujwM/5eWa7eb4JQa
 yXrYoQ+maDrJQ2lfBuB8NRkJk7jpnV1MZUoOoy2iq7EdHZd5rrN0VUD9QdKjQNRmHkte
 He2vLOEyVjSNtAw9+U6gMxPYaExg/uQRxYHz/hexSRaTgvz8rPN7++mq6J0XfdziHrrk
 1exw==
X-Gm-Message-State: AOAM532rIgB1v4pMvNGimfkltN2YkSr0gzCVbZntqYnluTVQW7MUwrwB
 xcreRn2ph5iJxQXT9NcisBsIyg==
X-Google-Smtp-Source: ABdhPJzEb9A90v6btr4gHl33YMnYJ3NwzTRrcnT0N/z+bDZ1bPViWezKy5GjDhP9qF73xafOsqJAuA==
X-Received: by 2002:a37:9a88:: with SMTP id
 c130mr24797128qke.494.1635786093717; 
 Mon, 01 Nov 2021 10:01:33 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id m68sm10407103qkb.105.2021.11.01.10.01.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 10:01:33 -0700 (PDT)
Subject: Re: [PATCH 13/13] target/riscv: Enable uxl field write
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20211101100143.44356-1-zhiwei_liu@c-sky.com>
 <20211101100143.44356-14-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <869f1399-0158-e609-1e68-57d7a9896e3d@linaro.org>
Date: Mon, 1 Nov 2021 13:01:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211101100143.44356-14-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72c.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.14,
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
X-List-Received-Date: Mon, 01 Nov 2021 17:01:37 -0000

On 11/1/21 6:01 AM, LIU Zhiwei wrote:
>           mask |= MSTATUS_MPV | MSTATUS_GVA;
> +        if ((val ^ mstatus) & MSTATUS64_UXL) {
> +            mask |= MSTATUS64_UXL;
> +        }

Why do you need the conditional here?
Why is this not just

     mask |= MSTATUS_MPV | MSTATUS_GVA | MSTATUS64_UXL;


>  static bool trans_csrrw(DisasContext *ctx, arg_csrrw *a)
>  {
> -    TCGv src = get_gpr(ctx, a->rs1, EXT_NONE);
> +    TCGv src = get_gpr(ctx, a->rs1, EXT_ZERO);

Hmm.  Not sure about this.

It looks like we should in fact change mask, just a few lines down, at which point the 
extension (or not) for the source would not matter.  And likewise in trans_csrrwi.


r~

