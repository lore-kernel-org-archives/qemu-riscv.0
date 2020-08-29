Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kC7Nk-0000SZ-BC
	for mharc-qemu-riscv@gnu.org; Sat, 29 Aug 2020 16:23:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kC7Nj-0000QG-4v
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 16:23:23 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:41002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kC7Ng-00081z-AI
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 16:23:22 -0400
Received: by mail-pl1-x62e.google.com with SMTP id 10so1217657plg.8
 for <qemu-riscv@nongnu.org>; Sat, 29 Aug 2020 13:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VPBRWOBAu4JXZEra3gUwoSL59KGeKfxNTtudadYRL4o=;
 b=A89BZyvGgjdleWJ5pbhco3kB1FpOTg3Ay9guDZ4FX9/yaKUFjNic3hOHhj2pZza3xI
 /CH9abgIaBGGjJDGsvSTdi3b5sr8w1d2dPJZM1eyTM1KYjGpz7reOIdRS2FTI/5xQihQ
 RbkbYgy6MgQt7KU8fpgj9PU5aXMQj+HQeLrEI+Eju2J2xqbfyDkkKlPUpQA8UMzJ1QGd
 FvN0ptRDT/5kP0GdjT7fryGskKihrkE6TnbIDbLuy0gT7eHtbtfyRBIx5gnYZL/jRQh0
 yir+5+HaEqwIR9FeHeHJM9OCPOIbbCxf5b21oKw+t3FOESdH7GmryZswD10fvBJqtBCs
 SvRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VPBRWOBAu4JXZEra3gUwoSL59KGeKfxNTtudadYRL4o=;
 b=Sj5MLFg4DBPNk57SLJAHN2yoWc8Bp0u7vFcWTrfNKF6h5jxKv/OFA5DWj2UYGo8kI8
 klJ/pZGymiU/p08jPZkO+sq/HIbnjpbEWTzJ2qOxOynUe8dWv0Q+YyJAD/X1gPoZFmk/
 yIPvpkKFlUYgducoPn1rqZ65nUAVMx9x1L8YSaGReAQtayBCHStaN0IYEMCsVEt9IEb+
 sJcH4Hca9MyDA3A5fqpFRfMgKEJGaDyHAwI3sWtWjOUfrX9I6I+nqoYJOY73WWA+GDyL
 M0Tsu+Wb6CBMaEyjSPJZkEPnaRLHGfgpqYDyunGIMMTJwwu+JirLShnYq4uaFGPU+Wa5
 KoHw==
X-Gm-Message-State: AOAM533lNDNiTCV+DIFtsLU42a8mIMsoL0mnnaZoz5DkSEVkr147axS9
 6HjRNaDwdyg084yJ/RYOMWYNwQ==
X-Google-Smtp-Source: ABdhPJyrDeVIPEjgzlciiXinzSgObukrxX+DYOWaduemd8I5SlbdHN8SwdU/BVkIq4bcMckJgUWxtg==
X-Received: by 2002:a17:90a:f2c1:: with SMTP id
 gt1mr4387688pjb.70.1598732596278; 
 Sat, 29 Aug 2020 13:23:16 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id w14sm3499590pfi.211.2020.08.29.13.23.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Aug 2020 13:23:15 -0700 (PDT)
Subject: Re: [RFC v4 47/70] target/riscv: rvv-1.0: single-width saturating add
 and subtract instructions
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20200817084955.28793-1-frank.chang@sifive.com>
 <20200817084955.28793-48-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <626d19ce-0651-76d1-ccd4-ca6c30cae41a@linaro.org>
Date: Sat, 29 Aug 2020 13:23:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817084955.28793-48-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
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
X-List-Received-Date: Sat, 29 Aug 2020 20:23:23 -0000

On 8/17/20 1:49 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> Sign-extend vsaddu.vi immediate value.
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/insn_trans/trans_rvv.inc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

