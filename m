Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kfpsi-0003pw-Pj
	for mharc-qemu-riscv@gnu.org; Thu, 19 Nov 2020 14:46:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfpsh-0003po-9D
 for qemu-riscv@nongnu.org; Thu, 19 Nov 2020 14:46:11 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:34992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfpsd-00076W-4Z
 for qemu-riscv@nongnu.org; Thu, 19 Nov 2020 14:46:11 -0500
Received: by mail-pg1-x52b.google.com with SMTP id v21so5188502pgi.2
 for <qemu-riscv@nongnu.org>; Thu, 19 Nov 2020 11:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JGFqCjoNZIGGBp44bV86L+YFJFw/urwxjR1lOxlLSzk=;
 b=XMDxO8tZCKJ6Asx1+TQ/HQL31brHLMEJcvTDtAaauCfNK7V6srJTyp1ztHetX8soHh
 SVtM1MkDPWwN/rHuiV7LQ9cYXzgZSzY/ALsStskW+qdrJsfAmYACScXEDe46VWxB7L6T
 FIymteN8StDKR5d14u9/4P6KB64JvyKOw71XF9Y7CHIag4RogyhcT2ImGFlMShPJMV1Z
 TC6ACBJD4k+pJr0rh2l1gyVP9hPTM1K+g54B3guOouheL5gJnq9nt3OrGB41rVZCD3fy
 9T2JrjScChJdsL1R/s1IK/lDgyCbbEZLRfSd/H7hN4r/cTyGH5a7AdTZ2blcD+WkTIFS
 M59g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JGFqCjoNZIGGBp44bV86L+YFJFw/urwxjR1lOxlLSzk=;
 b=U2LUTqfmSOipRhZYOuFKMjkKfuER0P3gjks8FsXK7EZub7zqJSiEjLe9KGr2Rsv/wB
 +g1xLuUvhFacokelgbm20hy+ErCYU/Zr1kB4n3RkI/DYg4tAvxMZGbJxWb/UobPmBBi8
 MLm2Vxon0AsDQ3xAtpW3MknljB7VV6U2wU7LeKQRzl4Dx46tGBFNRKJjd8q5apuAI3yq
 6zVHPSYZOm2iKT+DH/fnzEKZlQiww+Fm10z4Ms12f/ygXv71IAx8pDGLrPAI9xgXrNX9
 xo9+FZZP4KPsCry73hbI7NftakxLszAQhZwW16QydxocTNp/4hXNc0VEk35rYIMIK1wd
 urtw==
X-Gm-Message-State: AOAM532zkIXIRYn4wVc3WFYPv5SI44YM93UCRTRMO7GKYuC0u+AXITCi
 1PVaC20URP1isqsTkg4m8+uE4g==
X-Google-Smtp-Source: ABdhPJweZKijUNrZJVQRctCTZmwI3Nfvzeruz+4qQH0cUgQ6Bmtf48Hwz+IEviDEkPC5PgCiCwTEQQ==
X-Received: by 2002:a17:90b:70e:: with SMTP id
 s14mr5982354pjz.111.1605815165130; 
 Thu, 19 Nov 2020 11:46:05 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id e1sm669921pfi.158.2020.11.19.11.46.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 11:46:04 -0800 (PST)
Subject: Re: [RFC 06/15] target/riscv: rvb: min/max instructions
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Kito Cheng <kito.cheng@sifive.com>
References: <20201118083044.13992-1-frank.chang@sifive.com>
 <20201118083044.13992-7-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3d2336a5-dd8c-6836-87f5-af945d15b759@linaro.org>
Date: Thu, 19 Nov 2020 11:46:02 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201118083044.13992-7-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Thu, 19 Nov 2020 19:46:11 -0000

On 11/18/20 12:29 AM, frank.chang@sifive.com wrote:
> From: Kito Cheng <kito.cheng@sifive.com>
> 
> Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
> ---
>  target/riscv/insn32.decode              |  4 ++++
>  target/riscv/insn_trans/trans_rvb.c.inc | 24 ++++++++++++++++++++++++
>  2 files changed, 28 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

