Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6036C0218D
	for <qemu-riscv@archiver.kernel.org>; Sun, 26 Jan 2025 20:02:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tc8pq-0005ol-34; Sun, 26 Jan 2025 15:02:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tc8oi-0004Hx-Qn
 for qemu-riscv@nongnu.org; Sun, 26 Jan 2025 15:01:18 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tc8oX-0003hf-9X
 for qemu-riscv@nongnu.org; Sun, 26 Jan 2025 15:01:03 -0500
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-21669fd5c7cso64755365ad.3
 for <qemu-riscv@nongnu.org>; Sun, 26 Jan 2025 12:01:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737921659; x=1738526459; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UTEeD0XMSKGDjb4UjeehXNP6i1pjJAUAQz3ZrUzV6BY=;
 b=IhfovkTsNlpTlmE+0B6my/uNwrkrKslF9w3NMhA6vZ9i4MxSo2zxkjeEt362Y+RHRx
 qeac3aJFSDFstdggaaFlINTHatwV5Ie0p7R7FDJccmX7V1m9grwwRGhJbLCOoiRX0rY7
 ZhsJZuX2tlkjnvCajHSU7ftJx7b4Z5n9WYn90JYQ9K/36FfV8ArXn7sYWkbYoJt2nxfz
 r9DY+O8M6wLL3E3PBeoSzXKbk1aGn3rMvMIu244wwRoxXWzBY8Tb6kno9bJ3eoaIZpGu
 BC+O9OGENeaOcRGR3iT6oVXUng87FwrGUY7dhO0WTtphz8Tko3ybjCzTN5zEebbf1HQD
 Rp5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737921659; x=1738526459;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UTEeD0XMSKGDjb4UjeehXNP6i1pjJAUAQz3ZrUzV6BY=;
 b=n0QTuyaWnBXmtzyEFDrGYKYpaHjfHwluhkVHNX9AMHKe5f9WFLDk9I5onE7yUC9WTS
 xrMBOYGqwQI0LfE6K6iG6h+piXeUXjD/sI6VUACpala0IaA8pUM5gu5QqIYh9fiNuxM3
 ROZe/Xok7zaki3PFHkAEQ+KpT4CudUnwgSEiNNHZgxz4BWUopU0luiz51Fwqxk6QluGu
 fH/UOBFCHgLV+PJjsPJxU5dVvZK9GWHMNytUJyFwObcUmYwuMcCS7lGhXwFYFLyPNTuF
 S/YKiz1xVVJzFLuC82HQFfSKeDleZpYXx212OHh2AKVZh6Je/z1sqW+xXbHHPZDfojOp
 dryg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXewjlcYTb6kblYeTvW5LzOZtZn9/y6+kcBmw3lT4SnKFdsxXLDiFcAT+vMsNVqnj1iFBl842HBMx5L@nongnu.org
X-Gm-Message-State: AOJu0Yx5LtbI2q+5LV2MQ6tUwJjEuh/Og7aP5DiYkIy9C4L7mAIV0cdy
 0adeiAepP0Lis9R0eHVV0w9NV/bYYt3aVdKzcdrLKY6syjzeURoCOuUh/2J7nAA=
X-Gm-Gg: ASbGncu90DCGIyu4xaR+YqB+6YdlzH73fCgWghLo72N4dGd09lI7axbytqIZqtkkDfK
 jEr3zG3V/XmlUwIyaA6f0F6TPd1fGfQTVvs7bKfyIVHyENQtHTVi5nHZ6EgbZsCXaE+0WCFVjb5
 wuzIaOOpBTWIBWzC4trcoYmQkLGdCuvNVDQTuSeNj67wOMlS+LbPXMXJ+mLBxzO599fvFpQNbCq
 SVyYpdzu9DozxAAP71ONRZL15uRgm4atqYTQ0oM6FnO3DkB3kMFI1guk3GNpYy6TMJsGjt2UFQc
 GJRwVEPnY/UL0zrzdD74EaDs48IBFOGrY+CqPEVKOtMskxY=
X-Google-Smtp-Source: AGHT+IHk4oCZBkQ3EpN55L01I/3BlN88uO4hEsi17nz9LIDtFF+nfMo3swxHhoOsy6uzlknivzwr8w==
X-Received: by 2002:a05:6a21:99aa:b0:1e0:d89e:f5cc with SMTP id
 adf61e73a8af0-1eb21485c9bmr55831284637.11.1737921659596; 
 Sun, 26 Jan 2025 12:00:59 -0800 (PST)
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-ac495983698sm4974713a12.55.2025.01.26.12.00.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Jan 2025 12:00:59 -0800 (PST)
Message-ID: <aa1564ba-b51d-4278-9368-2849266f8685@linaro.org>
Date: Sun, 26 Jan 2025 12:00:56 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/20] accel/tcg: Build tcg_flags helpers as common code
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org
References: <20250123234415.59850-1-philmd@linaro.org>
 <20250123234415.59850-8-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250123234415.59850-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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

On 1/23/25 15:44, Philippe Mathieu-Daudé wrote:
> While cpu-exec.c is build for each target,tcg_flags helpers
> aren't target specific. Move them to cpu-exec-common.c to
> build them once.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   accel/tcg/cpu-exec-common.c | 33 +++++++++++++++++++++++++++++++++
>   accel/tcg/cpu-exec.c        | 32 --------------------------------
>   2 files changed, 33 insertions(+), 32 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

