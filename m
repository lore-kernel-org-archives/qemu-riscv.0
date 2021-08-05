Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mBlhS-0003Bh-Nd
	for mharc-qemu-riscv@gnu.org; Thu, 05 Aug 2021 18:18:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mBlhR-0003BZ-P9
 for qemu-riscv@nongnu.org; Thu, 05 Aug 2021 18:18:49 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:54938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mBlhQ-0006c1-57
 for qemu-riscv@nongnu.org; Thu, 05 Aug 2021 18:18:49 -0400
Received: by mail-pj1-x102e.google.com with SMTP id a8so12397751pjk.4
 for <qemu-riscv@nongnu.org>; Thu, 05 Aug 2021 15:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=i/H173aqdFOCQj+m5IIfEIRP6jGTgWAQjQImfUYcgWs=;
 b=bJQB6ky6NJdJFr9B0aUfRW7CEJkseJIyE/veX/n0VjsYhUhebHRfVcOX7NhcORnZ2N
 vMuNAHmJTBBEyRRAbH0CTFejKXbUBSwZBz/xWMIoJvW8AbSsaU2Dh1B9iqimUfeKjbvQ
 7tXZcrupYzQwoYd2D4r88O44+F5oX1fqhIcHBOaXSpfKi5e6tC4bEjmiqsGNV1RnvCvC
 CxBOVjhtT1pPiqYF5LIFR1eYpVPAvEfrwijswdrUh+TaqM9AeeM3jKGrofpAC2ACdc5K
 bPdqQo7NENhN+jwcQgL/qzfjwoy2ALqjGdxbd0BN2Wx2JYieeSNUe+Ud1jzjhkKuhJQr
 VFAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=i/H173aqdFOCQj+m5IIfEIRP6jGTgWAQjQImfUYcgWs=;
 b=mCxUziGunXtV2P9I0sgmDSdqWBR/SjBkGEC6Nud4IUhJ7glIEzmGAhW16c/yD/aw1F
 6ztBJYU+e0/fH9EHjDOmlwN6vMbOEVjrNwK0jTKBoz/lFK2vKyPfGhGQgzwHr3CJcDkJ
 LuB5xr4Xj0mTCwHZSgYRBHUrU/h9RA6ZjONwRfn6uJusrYRFja8PY6PzPlz8C5VbjCdr
 ZjT2R4qFVNWtdBFk39ApH9uc/BNSuT/XDNRNlOtzzB/FTH1Xph6gTRD+dHz3hFQvrz7h
 pr8Dmi0HUBa9kLXo8BcSPnalwilYG0k+FDWfi9bZKLRlCDdZVsKQ3SDDxcBGMhRngG5X
 fxFA==
X-Gm-Message-State: AOAM533hRA07Oib+uiPlKIhQPaFmC049r5Vzpqz8CjVjYiCTZfRW0wOi
 wFMSou3HPendt9bJwY3e5HIznA==
X-Google-Smtp-Source: ABdhPJwlgcaKz05P+CmB197BU7ytbWiSIbtZLo1doeKKvEc/UXWJ35Wa7CETn1wH7O+bM+8eQdsmww==
X-Received: by 2002:a17:90b:215:: with SMTP id
 fy21mr6725578pjb.203.1628201926701; 
 Thu, 05 Aug 2021 15:18:46 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id 129sm2917666pfg.50.2021.08.05.15.18.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 15:18:46 -0700 (PDT)
Subject: Re: [RFC PATCH 06/13] target/riscv: Fix div instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20210805025312.15720-1-zhiwei_liu@c-sky.com>
 <20210805025312.15720-7-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dd9d55df-523e-2085-c324-e68c54cee403@linaro.org>
Date: Thu, 5 Aug 2021 12:18:43 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210805025312.15720-7-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.132,
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
X-List-Received-Date: Thu, 05 Aug 2021 22:18:50 -0000

On 8/4/21 4:53 PM, LIU Zhiwei wrote:
> Don't overwrite global source register after
> https://lists.gnu.org/archive/html/qemu-riscv/2021-07/msg00058.html.
> 
> Signed-off-by: LIU Zhiwei<zhiwei_liu@c-sky.com>
> ---
>   target/riscv/translate.c | 46 +++++++++++++++++++++++-----------------
>   1 file changed, 26 insertions(+), 20 deletions(-)

FWIW, I have a cleanup to these routines that does more than add temps.  I've been slow to 
re-post the series; sorry about that.


r~

