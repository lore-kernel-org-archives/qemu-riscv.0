Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzCX6-0007cE-0m
	for mharc-qemu-riscv@gnu.org; Tue, 12 Jan 2021 00:47:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzCX4-0007ai-S3
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 00:47:54 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:40618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzCX2-0005Ft-S4
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 00:47:54 -0500
Received: by mail-pf1-x431.google.com with SMTP id x126so727141pfc.7
 for <qemu-riscv@nongnu.org>; Mon, 11 Jan 2021 21:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QtRWZNVx+/O8QZ7RfhyHbtfIVLRwdrGSvp3PHVAdGEU=;
 b=SAUM2TwW71YqzwgKKKCPQfh+kIQAxRKYUYmoZFFhh8HUJ+eqVQZ/Qe9V/Oq8ifTdor
 mvR+2XeTT3DUC55zDvXHPgjygBG1P+JWE0mCX28N7s5SKcspmNhCqiG0uJvsDK0i+DZ1
 DsSOBlXpdwqBYajmOGcTiQVc9G97lU0psXTJsK5xPtqxmQ4grxJFbrRN65hUJ/efc8JL
 UD/rSt6AUvEj7jP2J0gegOoA9sa7+YYoBcGvY1NxeCmz96e6kDrYXO0gBwwORhdXUCLL
 lXKsBdc/FbnhE+PrkNmYSYf/4adraUf4HqLw6HHC1XwgjkmpRzTnZwykbH21i5tlLJBF
 9riw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QtRWZNVx+/O8QZ7RfhyHbtfIVLRwdrGSvp3PHVAdGEU=;
 b=MaW8fCKrSp1VC2ndnwBWVH8aMGacUvUa9lp5gmalrX7xBziYI70YSKmxnfilXCIYlq
 kJHAlljncSWVjFbcgZ1L8XjSoo4T6zKTTwRQl8vCHYEKNGP4jl1rP6tk6XZ6e3EigAYX
 Fz8cYWdQSMxJsxFre8X20inoErWuT5inh5EXr/fU/h/dbyzbboO585A71aUwZdO/9Spa
 Ggb174NrMVF1acldeAlDV3/9Hq7DO4qUY9DmR7MFoMTV2ofZt38I4BDPS3U5RgohT/rA
 AvCZcXr7YCf/MxxJWX7BTkHEqQyAg4iagexds5cuscE7gIhdX9PbU5RfuMTEOXgD2MOq
 qbKg==
X-Gm-Message-State: AOAM530aHirKYOWw3LE8XO6kYrxhxuNnp049PDDODo321CqZ1cCH9ul/
 vQCPTqLvL9l3z7l2e2Y+NnrYTg==
X-Google-Smtp-Source: ABdhPJwMRHIJSk7HD+uZIaEdH4ca9zwXYEhqTc5yOL2F9QxSLCnDKhVgNnaCy25M1cnxWvtakkGNGA==
X-Received: by 2002:a62:ae18:0:b029:1a9:ac67:3b1c with SMTP id
 q24-20020a62ae180000b02901a9ac673b1cmr3038444pff.29.1610430471605; 
 Mon, 11 Jan 2021 21:47:51 -0800 (PST)
Received: from [10.25.18.36] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id y27sm1507701pfr.78.2021.01.11.21.47.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 21:47:51 -0800 (PST)
Subject: Re: [RFC v3 16/16] target/riscv: rvb: support and turn on B-extension
 from command line
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Kito Cheng <kito.cheng@sifive.com>
References: <20210112022001.20521-1-frank.chang@sifive.com>
 <20210112022001.20521-17-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <acde5c9d-88ba-f4ae-5d05-e0266254b588@linaro.org>
Date: Mon, 11 Jan 2021 19:47:47 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210112022001.20521-17-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
X-List-Received-Date: Tue, 12 Jan 2021 05:47:55 -0000

On 1/11/21 4:19 PM, frank.chang@sifive.com wrote:
> From: Kito Cheng <kito.cheng@sifive.com>
> 
> B-extension is default off, use cpu rv32 or rv64 with x-b=true to
> enable B-extension.
> 
> Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.c | 4 ++++
>  target/riscv/cpu.h | 2 ++
>  2 files changed, 6 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

