Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F1D3C0218B
	for <qemu-riscv@archiver.kernel.org>; Fri, 24 Jan 2025 17:36:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tbNb6-0006kO-9D; Fri, 24 Jan 2025 12:36:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbNb0-0006aA-0i
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2025 12:35:55 -0500
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbNax-0001aY-HM
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2025 12:35:53 -0500
Received: by mail-qt1-x829.google.com with SMTP id
 d75a77b69052e-467a63f5d1cso21288321cf.0
 for <qemu-riscv@nongnu.org>; Fri, 24 Jan 2025 09:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737740150; x=1738344950; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Vj2bmY7ocEoFlIJW1XIP32ep602ok8GPszCadUjMCC0=;
 b=q2NfdE8WjKnllajXNWdfmj+UGrWXtdBzy/jmVavcROZSF5uLaXevueO2/UvwgPlyVP
 axJDsD6yiTSm/NDHSf/KuMGi8Pjj+bvoFbJfG6LyQE+l2TjZn+CA/KzOmo4rlKjj5dkn
 aQ4Hgy95FqpD1i3cO6sexQ/RhEt7ap6uqR9sV2CiBU1JLMB2+dD9AWfbt9JuW1OWyNPX
 Z8AHRvaBHZ9t96u2Ug0gXVllrT/xh9gjUdcvGzNkmSOxnyMII8xktrgyGakvFQScxWjM
 p83tzbihhxXwxfZU7WY2roAjnwpDnD00LJZCaJmZjhnmVIzzMbiNILnYLAUaWqEZ6R3N
 REwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737740150; x=1738344950;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vj2bmY7ocEoFlIJW1XIP32ep602ok8GPszCadUjMCC0=;
 b=choplPetB6koGkzr3c3du8svzhiQ/YozRja3pBapsAmrFGNmuI9Z7TszSsfCudZxcr
 FoP9TPrBpkrLSaYcelgPX7o+KnD879OgKFdk9/qj9OVo93pIDGg0TpJnkRJWi+N8PhLU
 eVgKVDBmtUlHIoTriP71F0U00RGt2rEJhHpNeXIPm2w6O4bsOQNXlDyDLNK+B15F5k7k
 syqrqWeOb30KQq3PzbRnSmf7Dr5t17VOa4pVo9ymsmi6LBIDZkrG5YtNH9VxNpEAbz9O
 Q9jOsoIWm3l1QCUxOd8VStqGfkM55/LdNpp8exFrdqUSwoMI6Ftt0vBO6p6aJcyelLoV
 OBHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4YMlDLE3hvPPEAEn5+BTJvZBpBCI/NgMJdN1a5+eNp6foYWDXYa5zstr7LYDJ2sCge8LNsjEQmO6P@nongnu.org
X-Gm-Message-State: AOJu0YxEZPGyB0zGUUTQXrVFfQM2xwR/qOOLx4la0P/Ts7ASQLRc4dvV
 fw659uxo4j0fQEVJHruDForegKoEhU0ObzLRJ0xBZ0XWi78QjYejYYY8uCJb4C8=
X-Gm-Gg: ASbGncuGLZi16kL+y4GQfKIhy1O3xSXnZSZ8j/r0CPdSSdiMnQQyUsv2oQLJC8gm1Qy
 2e4nthgRtO9aUsxy+TlyOpEurukaX2dGy5jBMhZC14bvXpo2eXgCbryr5w1TrVApWu47D/zT6mU
 yYUlbcMHJoJqRjTcL0sDZWIO2QXn/WHxgS6PBPnh83GkQjHYoTzqCdB9TCXnf1ew5ii225kMhXQ
 /TGF0bwImX4epiaN9IR4dvTRsiR0YwYg5Q5Pn/FHz+A18MGJZ8c+zCHrPYbCQldfGrEUKyL9Vdt
 W9dIpMiQ3i5VRHvK2MDtC2rv/FSN9EivRNTTO33xaAv98yQ9UH+OyLqYxAOBOHGVhQ==
X-Google-Smtp-Source: AGHT+IG5zy7kpCZfM4oDghApgGhB9RDQUW4jb5N1vvFI3/InGtq+Q5BK9G6MoPKTFkdaYrToA9Px6g==
X-Received: by 2002:a05:622a:1387:b0:467:674d:237f with SMTP id
 d75a77b69052e-46e12ad5f7bmr480219311cf.11.1737740150360; 
 Fri, 24 Jan 2025 09:35:50 -0800 (PST)
Received: from ?IPV6:2607:fb90:c9e1:9829:9eed:533c:6788:9f4a?
 ([2607:fb90:c9e1:9829:9eed:533c:6788:9f4a])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-46e66b84c9esm11820501cf.66.2025.01.24.09.35.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2025 09:35:49 -0800 (PST)
Message-ID: <83ce8b2f-6f97-4287-89ba-0f5bf3815eab@linaro.org>
Date: Fri, 24 Jan 2025 09:35:47 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 25/28] target/sparc: Move has_work() from CPUClass to
 SysemuCPUOps
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20250121142341.17001-1-philmd@linaro.org>
 <20250121142341.17001-26-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250121142341.17001-26-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x829.google.com
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
>   target/sparc/cpu.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

