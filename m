Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C4AC54791
	for <qemu-riscv@archiver.kernel.org>; Sun, 10 Mar 2024 07:43:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rjDps-0008S4-Gx; Sun, 10 Mar 2024 03:43:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rjDpY-0008N9-QL
 for qemu-riscv@nongnu.org; Sun, 10 Mar 2024 03:42:53 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rjDpX-0008W4-CH
 for qemu-riscv@nongnu.org; Sun, 10 Mar 2024 03:42:48 -0400
Received: by mail-oi1-x233.google.com with SMTP id
 5614622812f47-3c1a2f7e302so1473403b6e.0
 for <qemu-riscv@nongnu.org>; Sat, 09 Mar 2024 23:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710056566; x=1710661366; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xCv+FQXr7fB4LAkFQsLtyuQ6RGVFRIjjsphNAoD0ZU8=;
 b=q5LPwoZj9TwMmsqwoyoP8ZQiG4qngXyaLUNsiQONGPNlg45kqAMiMVFU4yRpiqV2OK
 MjRB7/X6VIZDCi+brfH58EwyvkqRGFdQpoD/Vu46gcR8xGRd0S7S0T7gIYuAk9WznOVL
 6AZk7DcEzjdugQH5yGY5h4scv9CsaqdzTtaL48nzJbcCpH1JUuQ6XbCYpji3LfIo4oBx
 yBkb8X7DO3tIazOl1CUV+F3JXoBdax1fhDmdsLllmCAsC4vjmFrBASbnvqV9VzqAhfEV
 W2mZTN1B1jtuzlpz8RIiRhBWjIiBZOeoQOGUSpcoWTgbhTc34xM0ykMk473XYh8le8wx
 2zcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710056566; x=1710661366;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xCv+FQXr7fB4LAkFQsLtyuQ6RGVFRIjjsphNAoD0ZU8=;
 b=Pmrm07EbO7Xe6yXCiDSDh9Slqc3d0rcDLQ8uvTf8WVWDJN/IceNidrDzxC1/2C6+sN
 XpEHZ5R0MlYLNKx3InDBXNzF/AW17mK0RxBGGuOWmdDYyGz4k1SXxH8g+oIspHxDPC1z
 hnp6Fyv0VylN80vPxIKtfc2Rh3J17EeSlNakW/5ciLqlVy2l6d9tKD+HYtFj4bagLSJn
 OG9zP9drcOY6XEbP3CY7M3dVmVbGzCpOnkUuwYhJXiFhdxgmYS51AbqRs0uovmJ3JCpv
 4V3cv7hIhq5XbNVqi+M8VEdJjOUgGJHHrANXORw9WQUgBIPfWNy8Sk23PhK3Yg21Tvzw
 Mpig==
X-Gm-Message-State: AOJu0Yzualf8dFxsGKG0y8Scozp1OdrrvyNJg8NARY1voTjJDbpdzUur
 Jn5XGjuuYSiCoT0KlBkKgbw+s+akqjNMteLE8KKvwNNo5bcqfIS2CEnaD/UrdnQ=
X-Google-Smtp-Source: AGHT+IEDzUBEhj1KqrdBTZHsNN/SJYGS5h7qcHdqRdzT5Ao60NCK6MMfPYJ06wg0cnIHiN8x7wvxMw==
X-Received: by 2002:a05:6808:1644:b0:3c2:1386:ba0f with SMTP id
 az4-20020a056808164400b003c21386ba0fmr4489250oib.44.1710056566055; 
 Sat, 09 Mar 2024 23:42:46 -0800 (PST)
Received: from [172.20.1.19] (173-197-098-125.biz.spectrum.com.
 [173.197.98.125]) by smtp.gmail.com with ESMTPSA id
 y15-20020a17090264cf00b001d9b537ad0bsm2316216pli.275.2024.03.09.23.42.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Mar 2024 23:42:45 -0800 (PST)
Message-ID: <bae39543-8e94-4185-9c36-745b5d656c44@linaro.org>
Date: Sat, 9 Mar 2024 21:42:41 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 05/10] target/riscv: use vext_set_tail_elems_1s() in
 vcrypto insns
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 philmd@linaro.org
References: <20240309204347.174251-1-dbarboza@ventanamicro.com>
 <20240309204347.174251-6-dbarboza@ventanamicro.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240309204347.174251-6-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x233.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 3/9/24 10:43, Daniel Henrique Barboza wrote:
> Vcrypto insns should also use the same helper the regular vector insns
> uses to update the tail elements.
> 
> Move vext_set_tail_elems_1s() to vector_internals.c and make it public.
> Use it in vcrypto_helper.c to set tail elements instead of
> vext_set_elems_1s(). Helpers must set env->vstart = 0 after setting the
> tail.
> 
> Signed-off-by: Daniel Henrique Barboza<dbarboza@ventanamicro.com>
> ---
>   target/riscv/vcrypto_helper.c   | 63 ++++++++++++---------------------
>   target/riscv/vector_helper.c    | 30 ----------------
>   target/riscv/vector_internals.c | 29 +++++++++++++++
>   target/riscv/vector_internals.h |  4 +++
>   4 files changed, 56 insertions(+), 70 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

