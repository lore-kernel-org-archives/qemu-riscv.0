Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lCm3j-0002Si-0w
	for mharc-qemu-riscv@gnu.org; Thu, 18 Feb 2021 11:21:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCm3g-0002Qi-Ez
 for qemu-riscv@nongnu.org; Thu, 18 Feb 2021 11:21:40 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:35906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCm3c-0004Si-7B
 for qemu-riscv@nongnu.org; Thu, 18 Feb 2021 11:21:40 -0500
Received: by mail-pf1-x42e.google.com with SMTP id z15so1628037pfc.3
 for <qemu-riscv@nongnu.org>; Thu, 18 Feb 2021 08:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pIzqnRFcEP3NrQBdnfrc1W/r20vjMKF8sfedDR+6mTs=;
 b=bPiNSNCUp1kAAmikl4bZbxprYaEcUT+47PniQmyTFzwrUUt83DYP104AKZoqw/stCn
 GCssWSQDXSK0YCkgbSIeL4iKmXab/UcgWEOUMZUT72CEJwZ7H4/bX4N8Z+B1jrv/mNb1
 s1k4FvcGFQFGy9BwVkc4H3tHBv8s2nYL44idjgkTdFO0wZd2JXBBCZc08gcAgeed17Lc
 4ViY+ZGOIs9JEy4p0QmI5t+folFjnFVoDABZXw049MeC6RPX5/wgdJgWxHKugilQCz7p
 WFGg+hiin7vgEprM7vTVLka0KLrHORUFPGQV1/7Y2HvYKSywH1tuN1WJmSbnHdjTNaIQ
 CnKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pIzqnRFcEP3NrQBdnfrc1W/r20vjMKF8sfedDR+6mTs=;
 b=VkdqEyrqPrX0Ms9SsbvgDielLEDnArqzw4OOBOe4NDd41DvegS4tek8gaPP10VN2oi
 bpxgAsxc6EdF/wUS0IMpjd2Py0rjjWtjrQuPN2c2CsEBRRWqogoAtMU0l2iEcjWK0Ut7
 ntfc/ctJNrK993CMUTXzCmxHKpNZ1DFM1BqFcYf6pL+50GtvRLnOA1G3bdPdABCmYHON
 MjxUIT+l0kz4sIK+W4z109uFMd5vwgavlz6QVGps3ic3rwkWncmDGCiBlRWO9YRMFRWt
 NUhMdfqfNr82XIZ4XWVN3EPOXseeqmUPRuxnADwVQVtxJ6YlxWEYmNsjVh+z/35n8UKB
 D24w==
X-Gm-Message-State: AOAM531ycB1Mf3LBMkYQpz1rLnMURgbIW+EYYQXRHUTFjL5yMB2rmX4C
 dGvJhZftHCxVFAAsbxZztWcYpw==
X-Google-Smtp-Source: ABdhPJxfud21FxQ7+LzacdcoDk0TR1GtBoA/EUiNGA+8XIg57sVYF8wgFsu2B+1OT6a45978yWxgtg==
X-Received: by 2002:a62:5344:0:b029:1c7:eeea:8bad with SMTP id
 h65-20020a6253440000b02901c7eeea8badmr5127764pfb.1.1613665294889; 
 Thu, 18 Feb 2021 08:21:34 -0800 (PST)
Received: from [192.168.3.43] (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id s19sm6856954pfc.79.2021.02.18.08.21.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Feb 2021 08:21:32 -0800 (PST)
Subject: Re: [PATCH 04/38] target/riscv: 16-bit Addition & Subtraction
 Instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair23@gmail.com, palmer@dabbelt.com
References: <20210212150256.885-1-zhiwei_liu@c-sky.com>
 <20210212150256.885-5-zhiwei_liu@c-sky.com>
 <7e459e06-7405-e01c-02c7-79dabf4ceb70@linaro.org>
 <7d1489ee-1be5-08d7-4708-7ef22e49ce64@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <361a618f-78b0-b003-296a-e8e2908d9296@linaro.org>
Date: Thu, 18 Feb 2021 08:21:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <7d1489ee-1be5-08d7-4708-7ef22e49ce64@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 18 Feb 2021 16:21:40 -0000

On 2/18/21 12:47 AM, LIU Zhiwei wrote:
> Do you mind  continue to review the other patches in v1? Or should I send a v2
> to fix current error at first?

Yes, I can have a look through the others.

r!


