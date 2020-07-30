Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k18FK-00041q-PS
	for mharc-qemu-riscv@gnu.org; Thu, 30 Jul 2020 09:05:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k18FI-0003yf-TF
 for qemu-riscv@nongnu.org; Thu, 30 Jul 2020 09:05:16 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:53384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k18FF-0002tU-Vg
 for qemu-riscv@nongnu.org; Thu, 30 Jul 2020 09:05:16 -0400
Received: by mail-pj1-x102a.google.com with SMTP id a9so4146350pjd.3
 for <qemu-riscv@nongnu.org>; Thu, 30 Jul 2020 06:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/ku7Pr4bJavqfcpbIcoy19qbFbYvqMUtxpmV0SoogNk=;
 b=dNHhEVQw6QABS7SyhaCv27nIqJnOESYUoNTnlt702+sJyafNp/MxDAzwl4T1kFxOix
 i0xWFvLqh5d6CCBZ0NPpRrnsKtFCSU/W8H5VDtGm7FE1DZkE6fkyQ6W11eD+JMKI648G
 eg5h/tLaCL+WWOhjlzpmMPPuS1oA7X2EZBTuMMtTNWH8kRFA3c/93DldI+jYl9QuJncT
 3S8w2ecskgFGfuL+Zml9kxIa02agwm6Ot+PgHWyKSE5NzU/4B0zdz3OJy23sxrO1inHk
 MMQLr73LbLrAFdSGMQsrd2jro+SPZ+yHMpN4/SU9lS8UHMTmLeDE2oyfmDh7ee2J0KZO
 p/qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/ku7Pr4bJavqfcpbIcoy19qbFbYvqMUtxpmV0SoogNk=;
 b=ZYmmRY2CKtHq5rsDSvRjIfEh7qKMcNFDc/0Dy/4tbahvWEHH7AdESE0OIX28dLWiwM
 UPMJWHlz12YkzTBPT4g0GK4TqLyQWtXGpZMDMiSAozmK8dNwHscrg1/b0kR1n5r/zEkN
 HjCIGCayvpgJlMbDfQ1gLvIiIZdyFZTLxUqHMZlzUkmCLcNRq8D19xNYlx6gP4OxVl3X
 zhDM5cWeaJ9slOZaiCaZBCnSm/HeZcUYmWxMmgYJyDiCPrXW9ztPXQFobeu96oo3SVLb
 dE1BDVbMLwFbNEbeps9DZW9n9AyRv+BmjkX6YIDcYrL66PRDQQMgJL6nOJv9QegBVL+K
 0kcw==
X-Gm-Message-State: AOAM531g4rqyL+jmlfEGRuPAIqMxGaxdE0G7MYcoDQCH+OUDQgE+EPqQ
 jRfJA5M2/KvMwexoPRFJb+ALjA==
X-Google-Smtp-Source: ABdhPJyEkJBvZaeDg+s7LjeXU0AH5zbEGmB0UFuh6aZQsoJZGR3tp3QTHkgf49TKJvNTZLMYiRxGlg==
X-Received: by 2002:aa7:9e8d:: with SMTP id p13mr3195208pfq.32.1596114312338; 
 Thu, 30 Jul 2020 06:05:12 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id n12sm6593979pfj.99.2020.07.30.06.05.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jul 2020 06:05:11 -0700 (PDT)
Subject: Re: [RFC v2 32/76] target/riscv: rvv-0.9: mask population count
 instruction
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
 <20200722091641.8834-33-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6f82dcc9-945c-b840-76ea-12adb94d28f9@linaro.org>
Date: Thu, 30 Jul 2020 06:05:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722091641.8834-33-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Thu, 30 Jul 2020 13:05:17 -0000

On 7/22/20 2:15 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/helper.h                   | 2 +-
>  target/riscv/insn32.decode              | 2 +-
>  target/riscv/insn_trans/trans_rvv.inc.c | 7 ++++---
>  target/riscv/vector_helper.c            | 6 +++---
>  4 files changed, 9 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

