Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E7FDC83F2C
	for <qemu-riscv@archiver.kernel.org>; Sun,  3 Sep 2023 00:50:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qcbJj-0004MD-TM; Sat, 02 Sep 2023 20:50:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qcbJf-0004Lg-4e
 for qemu-riscv@nongnu.org; Sat, 02 Sep 2023 20:50:15 -0400
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qcbJb-0003Md-3O
 for qemu-riscv@nongnu.org; Sat, 02 Sep 2023 20:50:14 -0400
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-6bd0425ad4fso319823a34.2
 for <qemu-riscv@nongnu.org>; Sat, 02 Sep 2023 17:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693702208; x=1694307008; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bTFmXBBzplCEJU3kIhLsj/2Gs3egDkrSa0QUkm8kK14=;
 b=AI4vk0wrFiXKlDmemPyrRcKlbaHHzyDjx40xhqvo+Kwhwv3PhmY4ROqxT9RxTGfhBM
 T/Q0Uwr59sabhWA7GftxP4lDFi2Iuh+5N5TPBS2Fn9ggwnoGHhTwjS/u9rvpMRIzewaZ
 7uHYzabmzrDPtUxNvXPGYTQq4H6t9MyeepMZzDiMkthIXOe6XxClNDqQuttnt3o81uBo
 gcNumvbELXVnOos/5d6NL1ivWXs0JK2gaH/Jg7m+fiFvdo9kp8TnQwmxp+cIG8U3C52a
 Q9Mjv1Cj8JJensK5gLOb2bqV0qwkVnIxNr2lQo1DtiPLbWTxSOF6asYbLG8P0JudbBpI
 b6+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693702208; x=1694307008;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bTFmXBBzplCEJU3kIhLsj/2Gs3egDkrSa0QUkm8kK14=;
 b=O6qltiERlgzlM8bg4GB1L0GokogMl7cA8aSH9kdPmemUMMl1NjhsUDvbHkx+lQcY3k
 pD7SU2CoS+exQvMDU4eU+8fO9G8MXn1ZohKx6I65TOW6qVJWLYd7i+GQofOMVux7bJHN
 c4SgcLBcyWY3RquwgWCgaOhlI8FIE+U7P3AdvfN7TP4C9NjV18AYWf+CLpeHTZ8qy8Ho
 CBOHL4DqRlPceNALf7aODv5IutUNWBzRdJDxnM3jACP5v6tGOGYW13UxDcYkaga46qnz
 agVLA/BFT7UdP8+hqmBjisfXVFvITTBzqC/cYPdx1xsP6nX8YQkx/r6rHaP2DcoaF2ot
 wj2A==
X-Gm-Message-State: AOJu0YwpO2jF52/g6PuFhrGUyf+2TK56mjbVTPgBHV4LvhVYj45U7wjS
 NEDFtGrBbof08OrpU0V3nHNl4Q==
X-Google-Smtp-Source: AGHT+IEOTzjRNCfPDja2ITimQQeppzC2fUV/NrD7Li0N7xKCZe9H/44+GdphPi9zv0ki1afoJbIpHA==
X-Received: by 2002:a54:418c:0:b0:3a1:e85f:33c3 with SMTP id
 12-20020a54418c000000b003a1e85f33c3mr6857484oiy.50.1693702207955; 
 Sat, 02 Sep 2023 17:50:07 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.131.115])
 by smtp.gmail.com with ESMTPSA id
 gw18-20020a17090b0a5200b00268dac826d4sm5075131pjb.0.2023.09.02.17.50.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Sep 2023 17:50:07 -0700 (PDT)
Message-ID: <b4b598c3-293e-d1fd-bd2d-662a669f73a3@linaro.org>
Date: Sat, 2 Sep 2023 17:50:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 03/16] tcg: pass vece to tcg_target_const_match()
To: Jiajie Chen <c@jia.je>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, git@xen0n.name,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Huacai Chen <chenhuacai@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Stefan Weil <sw@weilnetz.de>,
 "open list:AArch64 TCG target" <qemu-arm@nongnu.org>,
 "open list:RISC-V TCG target" <qemu-riscv@nongnu.org>
References: <20230902050415.1832700-1-c@jia.je>
 <20230902050415.1832700-4-c@jia.je>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230902050415.1832700-4-c@jia.je>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x333.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 9/1/23 22:02, Jiajie Chen wrote:
> Pass vece to tcg_target_const_match() to allow correct interpretation of
> const args of vector ops.
> 
> Signed-off-by: Jiajie Chen<c@jia.je>
> ---
>   tcg/aarch64/tcg-target.c.inc     | 2 +-
>   tcg/arm/tcg-target.c.inc         | 2 +-
>   tcg/i386/tcg-target.c.inc        | 2 +-
>   tcg/loongarch64/tcg-target.c.inc | 2 +-
>   tcg/mips/tcg-target.c.inc        | 2 +-
>   tcg/ppc/tcg-target.c.inc         | 2 +-
>   tcg/riscv/tcg-target.c.inc       | 2 +-
>   tcg/s390x/tcg-target.c.inc       | 2 +-
>   tcg/sparc64/tcg-target.c.inc     | 2 +-
>   tcg/tcg.c                        | 4 ++--
>   tcg/tci/tcg-target.c.inc         | 2 +-
>   11 files changed, 12 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

