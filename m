Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABEEBEE57DC
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Sep 2024 23:14:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1soWXS-0008RX-1Y; Wed, 11 Sep 2024 19:14:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1soWXP-0008QR-EG
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2024 19:14:15 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1soWXN-0001zI-Ca
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2024 19:14:15 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-7179802b8fcso227062b3a.1
 for <qemu-riscv@nongnu.org>; Wed, 11 Sep 2024 16:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726096451; x=1726701251; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uKlC+HZqnh3/ZrfCdqyRa6f5P7AY+coEDiy42qYLEkc=;
 b=PSiOVFR/uJBZxTEjhj4xkrr1aHMKygemAmarRJP/73ayZutXmA/pjOziyRTiSea1LS
 VJ5X6QXbDBpPafeHUz4gDF+45cyLsb5yFu8xrncMtteF+z+totjSjaW23pKmRtCf9xcV
 0DrY8Odi7+ydr7FaiZUail6Vomdc4r+g1y/XZGM8FgTtO8yIob+z39tflmBp6lAcHLyv
 DLHr2HXYIO9QwVKu2jpRlLsfbzRG3fIWiFKwYEeWIAXew9SXqCFeydGdULCP4Y1o0sBT
 DLg8OzEc9vCCmRyoQld1mON6c1CwSgy4BWQvCfrf7XgMFGvc+XOQiFgIXSORpOGStaEr
 8dYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726096451; x=1726701251;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uKlC+HZqnh3/ZrfCdqyRa6f5P7AY+coEDiy42qYLEkc=;
 b=WT1F77eyI6AQOqBqxQ+y2JaOsfKUdUrZkoN4bd27F6OvYqhI4pgkCd9Ex7/v9ubWYO
 4hnCUK63msizhi16pUcWOdC472RAcjlQx7ZX0ltOlyFK11mHA4jUVS2YU8nnFVjFSVpQ
 x/dhj2UW/MFvzJ81R2jVOzNahXa8hKCjgnuN+5IkxWKV9G+R2ZjCH+gdMrdW2Q+nAXrn
 WKpc0XpAp8riF8d1zfUy5xr/jcxUWB4PPwA/aF/sgO1BkIagV7DxOM1N0T0xIwDR3yel
 m1d9z//V/LMDzpDHT3aUNu+tSL2VHc4lNasHQDBiApho1oYi1uZ/qZPoijIjU2EJ5r8b
 Q/ow==
X-Gm-Message-State: AOJu0Yx8pPnspFDK53F4+YlBi97CF2CLHb6Yg48NoIaJXN36b5/iDky3
 ASdqHCv3163rnicrzhHGWO7dSSJzaInWEIWWbWiY86UPgeI1bSYOj/DkEcOhayF73FpPimkp2UN
 D
X-Google-Smtp-Source: AGHT+IHgfNUyaK2fb6FCCj+AelkajAuaRVVV/OHIINbevyWipH3yJIzFc626C0nHBc+mED37oVzuPw==
X-Received: by 2002:a05:6a20:b598:b0:1c6:cb01:db61 with SMTP id
 adf61e73a8af0-1cf75f35fd8mr1062750637.28.1726096451426; 
 Wed, 11 Sep 2024 16:14:11 -0700 (PDT)
Received: from [192.168.0.4] (174-21-81-121.tukw.qwest.net. [174.21.81.121])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7db1fddd4cdsm508100a12.65.2024.09.11.16.14.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Sep 2024 16:14:11 -0700 (PDT)
Message-ID: <84653330-bac5-4bdc-998f-76b3e0be532e@linaro.org>
Date: Wed, 11 Sep 2024 16:14:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/12] tcg/riscv: Implement vector cmp/cmpsel ops
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 dbarboza@ventanamicro.com, liwei1518@gmail.com, bmeng.cn@gmail.com,
 TANG Tiancheng <tangtiancheng.ttc@alibaba-inc.com>
References: <20240911132630.461-1-zhiwei_liu@linux.alibaba.com>
 <20240911132630.461-7-zhiwei_liu@linux.alibaba.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240911132630.461-7-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On 9/11/24 06:26, LIU Zhiwei wrote:
> From: TANG Tiancheng<tangtiancheng.ttc@alibaba-inc.com>
> 
> 1.Address immediate value constraints in RISC-V Vector Extension 1.0 for
> comparison instructions.
> 
> 2.Extend comparison results from mask registers to SEW-width elements,
>    following recommendations in The RISC-V SPEC Volume I (Version 20240411).
> 
> This aligns with TCG's cmp_vec behavior by expanding compare results to
> full element width: all 1s for true, all 0s for false.
> 
> Expand cmp with cmpsel.
> 
> Signed-off-by: TANG Tiancheng<tangtiancheng.ttc@alibaba-inc.com>
> Reviewed-by: Liu Zhiwei<zhiwei_liu@linux.alibaba.com>
> ---
>   tcg/riscv/tcg-target-con-set.h |   2 +
>   tcg/riscv/tcg-target-con-str.h |   2 +
>   tcg/riscv/tcg-target.c.inc     | 251 +++++++++++++++++++++++++++------
>   tcg/riscv/tcg-target.h         |   2 +-
>   4 files changed, 209 insertions(+), 48 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

