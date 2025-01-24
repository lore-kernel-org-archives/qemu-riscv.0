Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF57C0218C
	for <qemu-riscv@archiver.kernel.org>; Fri, 24 Jan 2025 17:07:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tbN8f-00043w-6f; Fri, 24 Jan 2025 12:06:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbN8b-0003z0-Cm
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2025 12:06:33 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbN8Y-0004u4-DV
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2025 12:06:33 -0500
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2161eb94cceso29735475ad.2
 for <qemu-riscv@nongnu.org>; Fri, 24 Jan 2025 09:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737738389; x=1738343189; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ubNcwL7MOw4wrbCa8X+I6HKjnSv8jNSDNrPOC7v+6e8=;
 b=Dj8CrnpDn6UV2fRk8W19Mv3LlR0cYuccQxMAkf/aUIfLg0TJ5l6zSxzgB/eu8mxD/G
 Q0vnridrV57dbImV3UlQCLcEpFGCX0/w6s1WQMVXXb2FoWVQqvRl+KZlq6THsRFWtbSb
 +supG83Roy11V0TSNUgd9/2GTLp6WJRqwvDTPhIUjm0UpvfHOBSDilRrCW/T2Ltvtbaj
 8lwZCl2+yRS5JPq+9Vj6vfCqaOpc4aq8j4i4cTNUqRlB1RLV3A4Iik5ovcHDoaIRl23w
 0TZhPuUJ0JPxGBFzBmdft8FMNGyu/RR+nhC6hy6BFJMH+8bGX+8DDfMdtRU97uEuO63p
 YAFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737738389; x=1738343189;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ubNcwL7MOw4wrbCa8X+I6HKjnSv8jNSDNrPOC7v+6e8=;
 b=YRcWFrxa3h0DyLzQ4+rkX/UCAjr+V+zzHZv078S1wbie5wJLsBtLu5U8XxwRl9l8Ys
 49q45QjlttxPAqdd6df3MbsQbpvRksQAlGHoMbsXrCJncZfYyc47W2mPPlIrGgvt3usD
 3Cik8KSWRBHXuoeXrSura/3DsY2tUnQsL2dW1JHgqWcq8zT5oLtlex1xc9O908ivI244
 bRDWNRnxrxCuyBnytBO14xMHGUq/Et5lX3N/wRiGrP+YsJAkVPtIIGDFzPaxl+gyAtJb
 ekvQBvhbt7Ir5eItZHZQS2VHCJLGul6NrYk/3VYLTd86i8AdwlLIArPopA8k7AgJJCRJ
 9buA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVThO7cqOWXYk4t2duRGCWBqIQEgkxDqUg0/hawqVLHBQz/jKQlWvoQZ/u7djlvRp7iZ7OO4BN9laGw@nongnu.org
X-Gm-Message-State: AOJu0YzTLn91Xi1Obi8eDClmLUkSLfDIlCu636LlUVccIyFl6FYDNe3H
 50UUqqFdUjUMmkJVjpIcfIvVfoUhgHgcX67TlLdZ4G1fKi4jbUMNT4r0KfwSKbK8mUTIAiUPXBL
 E
X-Gm-Gg: ASbGncsH7bh++LLLyyjzUNeDY03p218IoYIkTm2GMWI0ZvMDpxzW260sM62KJ6+PCzc
 WnCA80n9TOArKEjEyS8YKtV6Kx9UvXDcM+A7+QymJEFylGLAvaUp1xAmtImlUPt6NS86BP9/il2
 yxbqD1BlngfjA5aC8HALcbYNAo2H4olRd+X8cuIaRuxoWyh5+V9++qPexA/FXDppuFmnDpLozRW
 A2eDTKVtLdg0YmbKlkuoGQSN1OaUWQiTvtebhmNtmFgOXtjgTlBMDkY5/cQPzgrxVLikxBrwTXZ
 ODOwdj2r5rSU0vL3m+yNkhFC
X-Google-Smtp-Source: AGHT+IELwfYpyGrSYBLhgcxLUIkGVxrgAyWe6YrK/eRNsYtKAAiBwODsov55RDu2E54MDViQYYEtcQ==
X-Received: by 2002:a05:6a00:1c84:b0:72a:9e3c:920d with SMTP id
 d2e1a72fcca58-72dafbe6a98mr38959112b3a.22.1737738388867; 
 Fri, 24 Jan 2025 09:06:28 -0800 (PST)
Received: from [192.168.163.227] ([75.147.178.105])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72f8a6d22e4sm2126729b3a.83.2025.01.24.09.06.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2025 09:06:28 -0800 (PST)
Message-ID: <b20f4f2c-7b2c-40b0-b4b4-07ac96ba237f@linaro.org>
Date: Fri, 24 Jan 2025 09:06:26 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/28] target/arm: Move has_work() from CPUClass to
 SysemuCPUOps
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20250121142341.17001-1-philmd@linaro.org>
 <20250121142341.17001-10-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250121142341.17001-10-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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

On 1/21/25 06:23, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/arm/cpu.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

