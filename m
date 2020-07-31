Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k1Yrr-0004jw-US
	for mharc-qemu-riscv@gnu.org; Fri, 31 Jul 2020 13:30:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k1Yrq-0004in-E2
 for qemu-riscv@nongnu.org; Fri, 31 Jul 2020 13:30:50 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:45725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k1Yro-0008Aw-KC
 for qemu-riscv@nongnu.org; Fri, 31 Jul 2020 13:30:50 -0400
Received: by mail-pg1-x52d.google.com with SMTP id x6so1199601pgx.12
 for <qemu-riscv@nongnu.org>; Fri, 31 Jul 2020 10:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WNZ0jVmsgiE0w8UeoHmpnAwLATROJgr1I69IRXhLDMM=;
 b=hW11kHc/rcOBR4aW0LrlQY9nKvO9ploB8n2V95PVOghD8cEGV9JvrA8vrXKOlBsRqJ
 Ml6za6Qk4YpWtsTG1uxcRH3anCrIapKz6+IbDefDoPNYVtksNGMiDbV15vrfqu3IC7dl
 ePRMTeWvZ8TPbLhhYkG+lnTTE9eTbIFBCDHozNhcv2Lp8YXeIqm0qjy6JflqEVAMdeme
 v04lyq2BBparMGY+UqKXs+kybTmsPzXgzmYWdOgaMTJySf8JlgvfjGLlA1qcADIpordl
 PqWeJDac9smM6xaBsQJhHgykr4VVhkUWrYrylPGzj+VpGg36wjx+h8tDHalPrMDLZ5at
 f5iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WNZ0jVmsgiE0w8UeoHmpnAwLATROJgr1I69IRXhLDMM=;
 b=cJdDkTTumYFyTpTD06fzx1A7u0kQxPP2T2FbrXBQQb785ekojOAq0tg16mf5cw/orc
 q+BmmvOYHBKi8UgsfuxflEdYixoK4tdxuMxB8JPOPXp7SqdKf/mEkLNRw4PJYJYKpmYr
 uGGZK/hYFtJL+ganfcEJRZn+HOfY6qieKzS4BJDwG5ttJns4lxBFQMlld+1IzSLN4jeW
 Oopu+w2W4OYUa0P0UwAIS6ELs79IXfPWG74E/UZefrOiCqNXus8gIjjFJfnCZSDlxnWu
 78SKX90uqPpLrRU/8k2JDe7lQQrWkcb6vu8RB7ihgjZUBS8UiaqyJeY5Mjg8jH/D3v7q
 FpZw==
X-Gm-Message-State: AOAM533ZjFIuhxb1iXXr2T80yCRcHO0PokvScBQ9NToncJwu6ujG1XDn
 +GvTHwQB4HMApUqdwCEPEt+Yiw==
X-Google-Smtp-Source: ABdhPJxcJNZPdh5W7MuE70WBa7wRoDFMALmRXCq3C6mmwx9lWVVBCZXJ7ue2FBPV4Id1qqqwzeJZ/w==
X-Received: by 2002:aa7:9404:: with SMTP id x4mr4651500pfo.46.1596216646863;
 Fri, 31 Jul 2020 10:30:46 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id z25sm11051807pfg.150.2020.07.31.10.30.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Jul 2020 10:30:46 -0700 (PDT)
Subject: Re: [RFC v2 43/76] target/riscv: rvv-0.9: integer extension
 instructions
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
 <20200722091641.8834-44-frank.chang@sifive.com>
 <0b042afa-61e4-d6a4-7fbd-2c359026b8aa@linaro.org>
 <CAE_xrPhOJ3nUJJ_9o2m8EcJsBbpdEUz78qEt71mtFoF8gKgtiA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ea51f7de-24c4-7e9e-0649-b4e74810c887@linaro.org>
Date: Fri, 31 Jul 2020 10:30:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAE_xrPhOJ3nUJJ_9o2m8EcJsBbpdEUz78qEt71mtFoF8gKgtiA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
X-List-Received-Date: Fri, 31 Jul 2020 17:30:50 -0000

On 7/31/20 3:17 AM, Frank Chang wrote:
> On Fri, Jul 31, 2020 at 4:35 AM Richard Henderson <richard.henderson@linaro.org
>     I don't understand why there aren't more functions in this table.  As far as I
>     can see, the only NULLs should be at [*][0].
> 
> 
> As source EEW has to be 1/2, 1/4, 1/8 of SEW and the source EEW must be
> a supported width (Section 12.3).

Oh, duh, of course.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

