Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ouvOo-0002Kx-8z
	for mharc-qemu-riscv@gnu.org; Tue, 15 Nov 2022 07:50:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ouvOc-0002CK-4L
 for qemu-riscv@nongnu.org; Tue, 15 Nov 2022 07:50:44 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ouvOa-00038h-D8
 for qemu-riscv@nongnu.org; Tue, 15 Nov 2022 07:50:33 -0500
Received: by mail-pl1-x62e.google.com with SMTP id io19so13058701plb.8
 for <qemu-riscv@nongnu.org>; Tue, 15 Nov 2022 04:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=M1fCuhFTHf5E8jIF/ijZAweB+kSzyX1RDHh+ip2GFjk=;
 b=g+jfKxu9Lerg8OaJr9yTixR7apt9k3TWCJTWpbWvKe2rRqYdyZxDJTmix43uDj5bFU
 sDykTy5Xo0lGtB+SUgRnkbjYKKn/lYKZPA3nkh6bmoIG8qpZSenu+SZiWm2cdogyxL2H
 8oJCuXZwTy6lp6tZD71l7RrkYuIZ/fzD+pqB/cfE1BaY6SldwjIkTZDz2jsEMQSpa2u3
 QvEADqFFY93xk5r+yFXTuEktkh7Cuja9WDcgXBwxG2fseW/d6XgpnN7t4aEtF4kogpqQ
 haL7VKwzVX8LntyA2tp7+6Zgoax2eHGUxcGChAeQOmx5ZvvoYYpF+olG4dGYp/0H3Jem
 6XPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M1fCuhFTHf5E8jIF/ijZAweB+kSzyX1RDHh+ip2GFjk=;
 b=yIJVlLX0onuP8+8XjKPsc4hso9eh1Fb9tpSxuXb9t1xD0rrqeTXEWPCtz8bP06Tp2l
 5XljssGJ9G73vhp9dCF/l31aIcS7yWr/ncgTkSPpod8L6x4GLaKqeLNSS6C9eL5T+wmq
 mFigKaHZhXA8Cm/qwmEMp32zSiLz1FP9F4uymi180/rkCRmRpB3PC0k2WRlB67Gi5rMD
 4a95blmLFtQZUJfZ5qPaOhZMs4fFnwJtW4KlRsJXgeG/pOSPvKr612D4XLtGya5Eeesc
 sY49h+RLGvdeYEmhIUyPyWa20+V322+AbhPD1vAbWXc7NUZAeozKZvPBPhtBjChCq97N
 uEgQ==
X-Gm-Message-State: ANoB5pkxX+96jypcGf99sX1w5zsq45yAvXUuXgRqYdLiK7P4ELeYTKKh
 n5HOUHf8c9FmHlfH/1CX0bsT0w==
X-Google-Smtp-Source: AA0mqf6byH0H1DnmaZRH4riOXAR+bER6QqDQHayrVmibl5eSMFg/ih/+hNAyYuQeYEIIG72Plhn0Nw==
X-Received: by 2002:a17:90a:f412:b0:212:d636:1543 with SMTP id
 ch18-20020a17090af41200b00212d6361543mr466058pjb.33.1668516630818; 
 Tue, 15 Nov 2022 04:50:30 -0800 (PST)
Received: from [10.0.0.228] (119-18-35-77.771223.bne.static.aussiebb.net.
 [119.18.35.77]) by smtp.gmail.com with ESMTPSA id
 s30-20020a17090a69a100b00217cdc4b0a5sm11533175pjj.16.2022.11.15.04.50.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Nov 2022 04:50:28 -0800 (PST)
Message-ID: <df537c45-3d28-1d64-972f-e7a7d75f7ac2@linaro.org>
Date: Tue, 15 Nov 2022 22:50:21 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 3/8] target/riscv: add support for Zcd extension
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20221113023251.11047-1-liweiwei@iscas.ac.cn>
 <20221113023251.11047-4-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221113023251.11047-4-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
X-List-Received-Date: Tue, 15 Nov 2022 12:50:44 -0000

On 11/13/22 12:32, Weiwei Li wrote:
> Separate c_fld/c_fsd from fld/fsd to add additional check for
> c.fld{sp}/c.fsd{sp} which is useful for zcmp/zcmt to reuse
> their encodings
> 
> Signed-off-by: Weiwei Li<liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang<wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/insn16.decode              |  8 ++++----
>   target/riscv/insn_trans/trans_rvd.c.inc | 18 ++++++++++++++++++
>   2 files changed, 22 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

