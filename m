Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k1FSV-00032X-FI
	for mharc-qemu-riscv@gnu.org; Thu, 30 Jul 2020 16:47:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k1FST-0002za-2P
 for qemu-riscv@nongnu.org; Thu, 30 Jul 2020 16:47:21 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:53818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k1FSQ-00070v-6c
 for qemu-riscv@nongnu.org; Thu, 30 Jul 2020 16:47:20 -0400
Received: by mail-pj1-x1034.google.com with SMTP id a9so5267262pjd.3
 for <qemu-riscv@nongnu.org>; Thu, 30 Jul 2020 13:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RcGUfUAjddfUBHOuKQ5pN2qzHSThkFPpWgJf8aJoMoA=;
 b=mVvo+EdnweQQ0owvecVAbpCC9S82jrPwmEHyb6ndiCCmrYlT7XqlqWBBbbI9+cVDw8
 yONrU0dOVNRKJd6wKzGB4lrBWEWeYfArcVSiQDc57nfhFxr1RlphMNQz12YneqjtX16K
 u0RRkNhFwRVrCqW27bBPyKxs3x2cdUjAoeNDOP1UC3xxteAVNiVpYs512GOWJruPkBj6
 r0QneH1x97RsBOPVbH4OqVjmTPAZ745spIJhc8ApU6OcRwh2uaCb/b9MQibRC0RLn4wN
 //QG7R8hZajsTKXRXGWB1m5Hr90pkSWSjMB6QV0LAV7DFRhBVuqGM73D8LmrUPIE2j2b
 UK/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RcGUfUAjddfUBHOuKQ5pN2qzHSThkFPpWgJf8aJoMoA=;
 b=H0CSwo0HEVds6dNjAtinfM46bXcqwE2OKSbi82H8NOTYD57uH/32dsWyLMFN7sjCJd
 Nd7v1p2xc+n+DUbzDocfEmbWD0EzLMzuus6AFHUMUFSO8LSy2ekvFC/VN64GYaYoOpuH
 O40cNde7sRjVVSc0TzAa0VgOXeDu5t8VMqi730850Jw0tS2QIDk3kK5aUC05tx3M0jku
 bWgUfl1t3c8QTWf+4MZv0hmQ7Ph7Jn0k3Mqemq9dzxHZKQBoMyg0+5EUOx5cWK7NOLlX
 uFuLcF+IzI3RHku7qSH8aGSSDYXvfghoFQTd00AXUajFajeegBVR7LQ5YiCHzHhPKbcj
 t/Ig==
X-Gm-Message-State: AOAM53385SqAD5pkLKFa5P1aS/X/KbjKGa1noGTn3TRpcGDL4OLj9+d8
 bah8ifz3rivLd31hi3dTR8ylt/uhong=
X-Google-Smtp-Source: ABdhPJykdA/f5sQf8LJIrWRuKboV7p24vpJXHrnmAYx4lQAxDrGaTr1SImSF5ckvLkG688apB0cyOw==
X-Received: by 2002:a62:3382:: with SMTP id z124mr669971pfz.309.1596142036102; 
 Thu, 30 Jul 2020 13:47:16 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id b20sm265922pfo.88.2020.07.30.13.47.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jul 2020 13:47:15 -0700 (PDT)
Subject: Re: [RFC v2 45/76] target/riscv: rvv-0.9: single-width bit shift
 instructions
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
 <20200722091641.8834-46-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2498a5e8-4026-69e4-f402-8d1e85ef6dd1@linaro.org>
Date: Thu, 30 Jul 2020 13:47:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722091641.8834-46-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
X-List-Received-Date: Thu, 30 Jul 2020 20:47:21 -0000

On 7/22/20 2:16 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> Truncate vsll.vi, vsrl.vi, vsra.vi's immediate values to lg2(SEW) bits.
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/insn_trans/trans_rvv.inc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

