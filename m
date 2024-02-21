Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A92F3C54788
	for <qemu-riscv@archiver.kernel.org>; Wed, 21 Feb 2024 22:03:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rcugh-0007y1-VH; Wed, 21 Feb 2024 17:03:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rcugg-0007xl-Sn
 for qemu-riscv@nongnu.org; Wed, 21 Feb 2024 17:03:35 -0500
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rcugW-0002D0-VC
 for qemu-riscv@nongnu.org; Wed, 21 Feb 2024 17:03:34 -0500
Received: by mail-oo1-xc2b.google.com with SMTP id
 006d021491bc7-59ffbff2841so1089093eaf.2
 for <qemu-riscv@nongnu.org>; Wed, 21 Feb 2024 14:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708553003; x=1709157803; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=90WBAGCwy2F2XYUFXm1yvKLC6SVb6oJe6/N/XfSb+y0=;
 b=mlNdkT/ZxvmzXkmU5DKlIGU3Q2ND7kpOcIc3VtFSjIcuySf/wx7NoXKyIS3bYxP/GG
 xOMW5fQH4L6pM+gysyhTXKqBI3cjiE2y7HG1e41HA8yHm9wY/YV5jca0A3TQZoZr08U4
 K/7CUTz0PH/QSg6p18nmSK+LosGyjmWu1w8rFmLFlx/r0fXDNh6fBuKnARCndcpSZ9BB
 +v5nVt0NbX2WpNJP3EQ+0kektc6YKsOIYVk3UJVqRzVyUh3clQQ2BY1D3AAilur38H4e
 pjCIRHyTTvxRRsoogne+WVAtpFbHsfcCgd+Tk63ytH00K+l7NNye0HikZneteIgLnYZy
 YaXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708553003; x=1709157803;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=90WBAGCwy2F2XYUFXm1yvKLC6SVb6oJe6/N/XfSb+y0=;
 b=RWX2c7bjj2rFXGPbFM7WY2x2mLnKs52PLLuywRtAp2ARk+eA4AYuEAqUDnIIc1kvPY
 EQtRMkVSoJYmzlN2+Kv8B6HzzQtq81XtBa7esXgxCrY5CLtwX6uzjdWVWHebvJVfo1do
 u52N+3cToUqhMdryrBql0wQ2fvMs9h+VWdfOmFM8c9bCUI84pSZ9a+jQVn1kGzBY/N1y
 67BibA3WpFQXw8IdrF/Ts9i2CB8NKuqkjRAaz+coBWEMY3kv5knU0vpIJor7o9aRQ8Cr
 vY4Y6i9dLk86WxqTbJL8Q38IjF40f8r46ZQADEpfpflDepEknyuwTbZLcrSjmD5yqYLD
 iOfw==
X-Gm-Message-State: AOJu0YwATE2CvUoU8E3qgpfkhVRD6av2bkWjaXMvTgOK4l7izFK/qpoh
 dGxo125/oEXJ94NXi9paMipnVROs520+M0uZLme3s4XaB+cskyRwE+OJktjq3mA=
X-Google-Smtp-Source: AGHT+IGuQePfU48GPJSIwX5tETuN8zl1udNvdSCzr4dzfg7knhhf0M7B0JoFFJO5dWmc76iYLwyKPA==
X-Received: by 2002:a05:6358:4403:b0:17b:2bb1:3c34 with SMTP id
 z3-20020a056358440300b0017b2bb13c34mr15564662rwc.0.1708553003067; 
 Wed, 21 Feb 2024 14:03:23 -0800 (PST)
Received: from [172.20.1.19] (173-197-098-125.biz.spectrum.com.
 [173.197.98.125]) by smtp.gmail.com with ESMTPSA id
 c18-20020a056a00009200b006dff3ca9e26sm9382389pfj.102.2024.02.21.14.03.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Feb 2024 14:03:22 -0800 (PST)
Message-ID: <b8076749-42c3-4ddd-a6f0-49c89230b284@linaro.org>
Date: Wed, 21 Feb 2024 12:03:20 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 9/9] target/riscv/vector_helper.c: optimize loops in
 ldst helpers
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 max.chou@sifive.com
References: <20240221213140.365232-1-dbarboza@ventanamicro.com>
 <20240221213140.365232-10-dbarboza@ventanamicro.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240221213140.365232-10-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 2/21/24 11:31, Daniel Henrique Barboza wrote:
> Change the for loops in ldst helpers to do a single increment in the
> counter, and assign it env->vstart, to avoid re-reading from vstart
> every time.
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Daniel Henrique Barboza<dbarboza@ventanamicro.com>
> ---
>   target/riscv/vector_helper.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

