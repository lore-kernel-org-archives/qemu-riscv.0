Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kC78O-0007sn-KD
	for mharc-qemu-riscv@gnu.org; Sat, 29 Aug 2020 16:07:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kC78L-0007sX-W7
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 16:07:30 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:37354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kC78J-0006K8-Sk
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 16:07:29 -0400
Received: by mail-pg1-x530.google.com with SMTP id 5so2128167pgl.4
 for <qemu-riscv@nongnu.org>; Sat, 29 Aug 2020 13:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3nmGwSqBhm6HCgLsxw54ultec1tWk10IPwUoHSfRS58=;
 b=k6W3/pCb4da32oYFo4R46oLpVqe0MIBVHkjAqVhcHtq/0Me5vw8xbrE+C4JVP26q3a
 l/3HdlWFn8pkpLTiJLXQk0xQowUGaGTWCRk6AWeIuSIEqMs3EkXEyrqmCkCgpTmeLOXE
 jtLEEI840hfb0P/k7Edczg4ZM5xVQ+oODF2tiQ0CuIy5j1WB71V+aXNGRHj539N639pW
 bom4h87xSEqRt5f2RwgR1Lf+95ulr3vWDXJBewBcgQs9B1Fk6FrdVL1PiWsxIA58hyzw
 O5DNXCjHoEcfJG9BRheG+BddiM4ddmTbm1pyORvEnGkIW6yulN2lTl1EQxva9Fy1nNnY
 0mRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3nmGwSqBhm6HCgLsxw54ultec1tWk10IPwUoHSfRS58=;
 b=g7RNbfImXW7cpRZt8ygTqaWmzGFVd2eJPjVRNDc3jma7cCeXoUvhDzdNA70VI6jLrB
 Ye11a/WxDVukDQu8CRfuqMvYUDRVqPEMf34oIqCtO/toRsnLNcYWKRAZqcpxkStigZiR
 LFxfbpBOIOuIUTLy1fNVdIzWKtbssgBkyjcmgjFFuT7/dMBW4E0p2lbL7ApEBByps10r
 nmtakAORlA+g0tI3BQdljjTd7Y48hfduTUrLyolcEPL3L5rJXnbF5tJqa1hYupbt81I9
 sKbHbj8yO7Vp66+514OrExBcT/7BHLelhMmCfF6DvBtrtPGBsp95GGRnZ9UO4HGgsz8a
 Ktig==
X-Gm-Message-State: AOAM530wt/wtF63yugaciGIpHG5fcwmVJkQUbSXwrW8t9tqODRF5hjSf
 Co2sir6TuXWTERulYx8CDaik5A==
X-Google-Smtp-Source: ABdhPJxGSUPo2z8WteXNO69qJrEoEhpCug2ZGLgGaBdKK/wzI6usAj9NncdApXBZRsQjCLmFXLVbdw==
X-Received: by 2002:aa7:9a4c:: with SMTP id x12mr3999222pfj.307.1598731646141; 
 Sat, 29 Aug 2020 13:07:26 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id o23sm3348373pgm.18.2020.08.29.13.07.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Aug 2020 13:07:25 -0700 (PDT)
Subject: Re: [RFC v4 37/70] target/riscv: rvv-1.0: floating-point scalar move
 instructions
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20200817084955.28793-1-frank.chang@sifive.com>
 <20200817084955.28793-38-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fa016ba8-faa0-2e34-5d5e-e655936707f2@linaro.org>
Date: Sat, 29 Aug 2020 13:07:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817084955.28793-38-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
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
X-List-Received-Date: Sat, 29 Aug 2020 20:07:30 -0000

On 8/17/20 1:49 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> NaN-boxed the scalar floating-point register based on RVV 1.0's rules.
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/insn32.decode              |  4 +--
>  target/riscv/insn_trans/trans_rvv.inc.c | 42 ++++++++++++++-----------
>  2 files changed, 25 insertions(+), 21 deletions(-)

Needs require_rvf(), as discussed vs the previous patch,

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

