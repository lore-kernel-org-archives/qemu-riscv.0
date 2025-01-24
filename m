Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77B3FC02181
	for <qemu-riscv@archiver.kernel.org>; Fri, 24 Jan 2025 17:35:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tbNae-0006HW-R5; Fri, 24 Jan 2025 12:35:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbNad-0006GW-3y
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2025 12:35:31 -0500
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbNab-0001V9-G8
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2025 12:35:30 -0500
Received: by mail-qk1-x729.google.com with SMTP id
 af79cd13be357-7bcf32a6582so204406085a.1
 for <qemu-riscv@nongnu.org>; Fri, 24 Jan 2025 09:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737740128; x=1738344928; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AMV+qxzvpWkMNhHrkYE0PGfCQKHhVFb9yy79ND4wiAs=;
 b=ZOkkwgOc1ZgtGSzzRnR930ObNXtjo2+PHpRAvnL/LFUw/VTW+il7Bz/gZMKGfSV/gF
 vlZSxqmpBfDcTnOYlo9onJbmUsdOntJAT/ebslNg0bCA9xHyczaoZL0m1T3Cmjsv7n6O
 7ja0svIejZcW11QvG98jHByVGMOkrshRvjRqYJcaD5Lqy6v5nI5wXhce/nMbV/eiqNfr
 gwY95A/ngXSx2G8QidVzB+hlkkwyNvE7kReqqrIf68of933zknb/045dUL7sjdhgf1/M
 PEROUzDfyh321/m+13YwQg4/TnoG107YcDgJu0IwgRv2xiaWrUzCSl7EDpVNzbSrottH
 NnnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737740128; x=1738344928;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AMV+qxzvpWkMNhHrkYE0PGfCQKHhVFb9yy79ND4wiAs=;
 b=vUZmt3AW2vwXbCC2lIRfpkd259zGzVcFVZgO7nU0AFneTwxTs2aO09m1BSpxDswUyO
 mbDUleYKaCd2Ji5c3FEPLFdGp0ptMlUAPq2ZPixNoATPe2DlqKFXNpzIjajNH8aS21Bz
 pC9UWP/fhb08e0SpU24qddrq9Xkf/QZZt8bYh8qNIpkQH1zFBUjHmVQEhyjVg+MRtm/R
 ahnqkpYGBCqF1q+50sw8eECUIIHA/6aIrOXiwYy2mLAprciWNt8qtsqqM85i34qShz7Y
 7YKf4nwubFNlRJSgdWl28R/O6ODfjKcCtUynSdOO33WqzrjUtXEstjDm02cTbjO/gQcq
 W7JA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaA9G+pY5keFwIvz+vNx3xapE7t0rWh1m/y9ewJ2ahfzlujg0sK5UVgKHxDsfOAb+IqDi9Q/ufbt1A@nongnu.org
X-Gm-Message-State: AOJu0YxKBvrr9g8+j/vgAcfqdMD+XPuHbY8lyprs89Us0GsEULN0vHDP
 uQLMAMmgIj9btPbsCqf40DCAlq7N5uj0N8LDFAYp2IlNuLVK2o7ew9nHreLVpSA=
X-Gm-Gg: ASbGncsqB6A53uFavVTMU3zRY5Q9gwfzpAS12u5Vp4uy5BJ3CdZUr+t67woFV4SwXqb
 eAc+V+R9Ztvzl15KXwWkg2f19yeJqrkuQiEwounuAq/GC+Rv9rhjPYeJMcmMQDucF2acH3Wi5Tx
 6hGy1m1FRwozitY6EsEd5ubCkSbEvi44PSb68pxI9lDWXv6eFWHjQhmOgh9g2anIVg2V4WpzGk8
 G1TZ8z5qZsbMhcyRfGjjZ/rv5CV58VIFEIwUiVS8b1dJS+cnzE9V0gwgE5D2j/f3nAYCfuBPtP3
 12IB616I+1FHCpvurBvwlMErg9wmLibv7v/Acz134c4UJNS3qVeNnIAxxu4M363jZA==
X-Google-Smtp-Source: AGHT+IFqT2uj9wwWRu5cFAOT4OajMSZyAfttDtfHz3yV6UsbaJ/kYc4lOumCvgdjutXyJ54T76XZSQ==
X-Received: by 2002:a05:620a:4151:b0:7b6:d050:720f with SMTP id
 af79cd13be357-7be6321c277mr4448304985a.22.1737740128327; 
 Fri, 24 Jan 2025 09:35:28 -0800 (PST)
Received: from ?IPV6:2607:fb90:c9e1:9829:9eed:533c:6788:9f4a?
 ([2607:fb90:c9e1:9829:9eed:533c:6788:9f4a])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7be9af109c7sm113780885a.111.2025.01.24.09.35.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2025 09:35:27 -0800 (PST)
Message-ID: <822bca3a-600f-4a08-98bc-07a11a5e32c2@linaro.org>
Date: Fri, 24 Jan 2025 09:35:24 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 24/28] target/sh4: Move has_work() from CPUClass to
 SysemuCPUOps
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20250121142341.17001-1-philmd@linaro.org>
 <20250121142341.17001-25-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250121142341.17001-25-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::729;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x729.google.com
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

On 1/21/25 06:23, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/sh4/cpu.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

