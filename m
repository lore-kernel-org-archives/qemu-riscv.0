Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k3opM-0006FA-Nr
	for mharc-qemu-riscv@gnu.org; Thu, 06 Aug 2020 18:57:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k3opL-0006Dt-FE
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 18:57:35 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:41161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k3opJ-0007kF-Us
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 18:57:35 -0400
Received: by mail-pg1-x542.google.com with SMTP id s15so16204135pgc.8
 for <qemu-riscv@nongnu.org>; Thu, 06 Aug 2020 15:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2EudLFvAWPx6Wgl/bLKmED9QDLUN+/0FThciq5PThqc=;
 b=ZoNpORpLpkAcUE9uEmMnKr1/1jEM7abjzuCXQbFksZxWRxPJBHa45nkWwaZtIQnRti
 uqVRuDwXFVY/7wr1fJ1VzGcAD4jXk4M9FJEaMOmaaFwagc6ibOFrwPj0yCxrlWoEPsLb
 IsVnAHKyxrGqUpmzhEofp68ixruhEI1kZI1fSVDdXWI78v+TQuSmwibQHbE0m7B2WUL0
 Vpw+C7lc3gcE75pkWsN6O5ORi7R2UpJer2EArHNJLgxZ30q2aucTvx65w17FsWJpjrkf
 B4EYtr16PKiRpk2fOuKkHAStG/oZNlWEeZUsBGM1T+l1ptqQ/dD8wCFCR7SJ3ocj58G2
 EcDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2EudLFvAWPx6Wgl/bLKmED9QDLUN+/0FThciq5PThqc=;
 b=dt/cfJSQ+ca8ROiHwkWFTTeadKVE8jSqEdiXqcP4ZJK/e6fbS7zb8Xn2q8ztmrSJeY
 5/d60Hj968PNWTJ0blRcrglvveVH8NMUDsfxoijtmNKmosPJWOQX2Dg2/0J8+d3PdtKQ
 IG9FyZ31cHYb7vo4X5T2N7HcX+f3TY3GTssjjcupAe4H+xBVQmeBhgCNka/IKjlxwQfA
 WdtluC4xeHrm1E5a9JmDJIHOUFd7wMhlLFq8LR3zL/H9uoRlD7VhYR9VPsMcEbI4JQAn
 Q3h+raomN1Q0TbfBIINC1j0UZdHf8ftLmxHwPlBJOHeY5yuKPZs95gAUBGEMRdSe+akq
 9T0A==
X-Gm-Message-State: AOAM532tpQiaVy0+Og4OdclI688STRRQB7Sl33b+rT8gWnCS8TS/BDdb
 tyIxPGqj7CZsoPXV6vOvEO22yQ==
X-Google-Smtp-Source: ABdhPJwuYRiWgTzqC4GmQc7M/O36y8T+hRt0/33gHpgmBljOUea2ByUZtdEzG57F6kVoxrYJhrWA0Q==
X-Received: by 2002:a62:206:: with SMTP id 6mr10179796pfc.228.1596754652427;
 Thu, 06 Aug 2020 15:57:32 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id g15sm9935128pfh.70.2020.08.06.15.57.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Aug 2020 15:57:31 -0700 (PDT)
Subject: Re: [RFC v3 16/71] target/riscv: add fp16 nan-box check generator
 function
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20200806104709.13235-1-frank.chang@sifive.com>
 <20200806104709.13235-17-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5f9df8b5-5537-d06c-584b-633cf89696b1@linaro.org>
Date: Thu, 6 Aug 2020 15:57:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200806104709.13235-17-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Thu, 06 Aug 2020 22:57:35 -0000

On 8/6/20 3:46 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> If a 16-bit input is not properly nanboxed, then the input is replaced
> with the default qnan.
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/translate.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)

The code is perfectly fine, but the patch has to be merged with the first user
of gen_check_nanbox_h.  Otherwise a bisection that stops at this patch will
Werror for the unused function.


r~

