Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F83D606A31C
	for <qemu-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 12:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zdKAKpiG
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xMP4V-0008J8-8H; Thu, 29 Oct 2026 08:17:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xMP4R-0008FK-Tg
 for qemu-riscv@nongnu.org; Thu, 29 Oct 2026 08:17:27 -0400
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xMP4P-0000Me-CN
 for qemu-riscv@nongnu.org; Thu, 29 Oct 2026 08:17:27 -0400
Received: by mail-oi1-x22f.google.com with SMTP id
 5614622812f47-53dbe9b8d6eso603300b6e.1
 for <qemu-riscv@nongnu.org>; Thu, 29 Oct 2026 05:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793276244; x=1793881044; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=HwCspv9KVpeNpKaoIMyOBsabutmcdbAvFeFXn1CMntk=;
 b=zdKAKpiGCn+ruCUDZBqZo2W+opB6yZ/uASd+VA80HaYeCOISeEnahrQv7Wpdz3Eg4s
 0zA1aXDt3qMKbhw5Zu4voTRcIhU4xU2hSxL26E8rCNcG6eDzv+AOJahyzBIDnXGqgAOI
 JWR28n5WX8MhAwdnMGWN1veYdQD2KKp+1ct0IewiVS+4P+UeY1VeD85+0OplHNWyXnbU
 0OGwYfAuvUykm/E+tWqIWP2oIP+QWvTCzGcbN6COCAvn2hxxsjo1PZPratB/gyzGe4da
 f7qeTdr6tqLnJb/xqyjmiB7ScqYDl09WCGRIo3sVnFaTe68DQDJc1lt7S5U+pPahO1Fa
 aRnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793276244; x=1793881044;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=HwCspv9KVpeNpKaoIMyOBsabutmcdbAvFeFXn1CMntk=;
 b=XGOMWDfV2su0/IbHY+PmGtqnJJ0lmlvJqZt6iDKA8SfkiR33AqHidz2LJDJ/YIP6qx
 zWlrXU3wuNs0jSC11xV4fM8IWYwOiSposV+FTn0v+QBbYJSg/ajyzwpVxLeQokVs2w9y
 QriVb2IdEwsq7MJRZo5J+8At05/yCpKSz9Q9ZO+PwqbazKo3DnyPl8T0VIRVc2fleI8k
 K5zn0mPC/NMeV3uhRioo95vtNMDmcxrhcrO1lNGkw9KfNuYn2YELiUBC7A2fcylZ7s6h
 4CvqDu3tnd5CLnS2OJYcbhpMEnfIRhI7+nwSi+BaPBqy3gXK9ORoDmcRw/VuAqZQ6M5u
 DeFA==
X-Gm-Message-State: AFq9FYLszz/Qqe/e8o8m41zAXod5Xlzyw6XE3v4URqjbiA25obzxNE6O
 MxMdKi8I7WtbYb+HRVmkrffL417TNFWIz+WFWgH/qPO5szMpQIbpvrBF4S33lFWOZgA=
X-Gm-Gg: AYBFou2Y8Olytu6mg3GVxgERFxuLZx28Qv9mJh1y9EFPkAcq3Nv/QGL3g8TIks2LBUe
 +3Iau6aCqvfm5L+OKkwaWQZgwWXczKg4DybRe+QBklES11w9lavzXzr9SA3pr3JI6Ivk6XIsBQ9
 LH+mDK/R6okq2BkKHfeaubNzdgoNG6KPoc+yFAcZX6ScP5/2i0Jkjy8UfvAfTSamL5FhbQ/eoyz
 gxC3MeQUW0RukUF4nomeanjr2sZMz9SYqCFUUHi0I/ZU3+t7FI5UqWm8mBqRz593eyGMgrfDo04
 15EugQtJdVljcaXiE/WB7xGv0eFhd13vM21P2HRAgmkPeLMZU0Bv5I8gE9Iibo71dm+HLNoBwoQ
 BfydONHy0DIT2qwoxFHLzVARFpkhn4gh1GeTg8M+tOmZc8AskEiNp3ksSpKeNAkG7NkxUlIuAMP
 O4inBRyl7EV7+SjxPUUp2QRpS4Bl+CcETdR/F1o+6YxUq2tIET3UWJ8y+870VOUoJBwJYQwYhgF
 ijYM2+4TtntCsbGYQWr8e4YDsHeypQZu693RX/uahHBrC7NGVBelUDSgX6A/+I72Ue/E6NqaLl8
 luri3A2gSNsjQ1c0DIJ2+dpJMH1MQ7v+N1d6FxFm19NL
X-Received: by 2002:a05:6808:250d:b0:496:976:acad with SMTP id
 5614622812f47-563ef5c1674mr1205981b6e.1.1793276243814; 
 Thu, 29 Oct 2026 05:17:23 -0700 (PDT)
Received: from [192.168.129.53] ([50.233.235.3])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-563c5a4d8b7sm3302136b6e.8.2026.10.29.05.17.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Oct 2026 05:17:22 -0700 (PDT)
Message-ID: <31a583fe-d71b-4b50-9e5b-c4acb138117e@linaro.org>
Date: Thu, 29 Oct 2026 07:17:21 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] tcg/riscv64: Fix constant handling in vector
 comparisons and selects
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, qemu-arm@nongnu.org
References: <20261028143330.6518-1-philmd@oss.qualcomm.com>
 <20261028143330.6518-5-philmd@oss.qualcomm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20261028143330.6518-5-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/28/26 09:33, Philippe Mathieu-Daudé wrote:
> tcg_out_cmpsel() takes constants as TCGReg and passes them to the
> encoders unextracted. In a release build, "cmlt v0.8h, #0" emitted
> the illegal instruction 0xffffb057.
> 
> Use TCGArg for these operands and extract the element with
> vec_imm() before encoding, including before the LT/GE adjustment.
> 
> Fixes: 006352d69f14 ("tcg/riscv64: Assert immediate in range ...")
> Signed-off-by: Philippe Mathieu-Daudé<philmd@oss.qualcomm.com>
> ---
>   tcg/riscv64/tcg-target.c.inc | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

