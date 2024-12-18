Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D79E77187
	for <qemu-riscv@archiver.kernel.org>; Wed, 18 Dec 2024 16:36:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tNx2W-00042N-8l; Wed, 18 Dec 2024 11:36:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tNx20-0003W2-Ht
 for qemu-riscv@nongnu.org; Wed, 18 Dec 2024 11:36:22 -0500
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tNx1y-000331-Hd
 for qemu-riscv@nongnu.org; Wed, 18 Dec 2024 11:36:15 -0500
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-3023c51146cso9630411fa.1
 for <qemu-riscv@nongnu.org>; Wed, 18 Dec 2024 08:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734539769; x=1735144569; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rrSzl/ZANxSpzGhPycCpYwWwoO6roHsVBOPDc7jLSe0=;
 b=y+B1rUjNkO7Q4RNrET7h03SrRcjOn23jCzyntzlLIT+T+q5S0tY2I7y4RjvJ9VG4OB
 8ZjmRyPB/k5QJEl4MWxYARlmyDW7DJmbsEPKAYGco2FXejIQ4r5q+hNtlDv3KQlHq29C
 7XOW00oL+c8DvylSX7AFq5xfx+VIXRzp9O7MIRJopzknjY0lO1rtZTTuQ+u0X6Z4MVzy
 LzZJ5hylv1W7PUM783WJt8PUgiaWhO8Cruvv6jNAJBvqKMb/0MRoecriVKIPPt7WmD8Z
 /UBvdiYASbRab6DcYhWi9aytWu9BnAMMUXkCdA00GaL9oGrst0euUxM6bsgrDQXaXsqC
 wrdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734539769; x=1735144569;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rrSzl/ZANxSpzGhPycCpYwWwoO6roHsVBOPDc7jLSe0=;
 b=pE5SWFw+mqkIWPonO28yBNMWZfkJ0UIXLPuJQEhIXiHExrORBouXnYAnZecG33I4QO
 8dAakCIEdiojiYu9IOT1B8vR6Tf4hxQqioIxiHlowjb6ODihFfrXwrrMhVvGx4gNTcaP
 YW3jTFqTcJYFzsras5hhdL3NEwCqOBzFbZPVINz85Y9F+jmGCwub0/3RrtWSpSKnPU6e
 3Z2uxiz2YY0SMR9BQ6uJU4bMhgffK5JxQRMsfuh6gxAJB54J9cl9GqYnq9pdGijvdaKD
 pxOzHdAirQUdFBPmJahJJcIvgyR/kE0QKtenuJQbunZdTsoe6LTeztn1ckjf5dgdozi8
 GVJA==
X-Gm-Message-State: AOJu0YyruqT3fZLQhTLVZwBzqhIGez+bmHMa6Bd++B9QFqlCFVQpFNZI
 8h/yz8Q0jafHgThOWII76zHwk54HLgdwxnqqq4KJoWAtRDtwz+1CwlHxfx5Ip3Q=
X-Gm-Gg: ASbGnct+/swPa5+0z+STKQjxYxyU/twvffNNus1gMfyUDXaxEU8nNI946vVSy8KDL7u
 OKkIpcK7709056bMrO+6RDkmpm+0AwOTtI2P/dzfI5OZswphaa7yJrmaQSH3tMtL44NRRziRT4w
 89NUB2tZ6eaOxNs3p1Iu3mDfcp5FM5rVo1NyfxD3f4H1JbVl1xwoJUc1BIzbXlOat8RMolIkWOk
 GFjyoxZsU8bbbZS12fkFSRhmWqPVjJEkapboqblNFFels/LezYWn/hMEdDWwaYPepsIjqdd8Gc=
X-Google-Smtp-Source: AGHT+IH6o7g3vLCPAlgQgYZtqUBD0Njc5xJA3GMfaxdFtCFJ5/uURHsO1CqCnpPPemk8lhMsG63DQQ==
X-Received: by 2002:a2e:a715:0:b0:300:1f5f:e24f with SMTP id
 38308e7fff4ca-3044e6f7593mr9553541fa.15.1734539769106; 
 Wed, 18 Dec 2024 08:36:09 -0800 (PST)
Received: from [192.168.242.227] ([91.209.212.65])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30344176152sm16151791fa.81.2024.12.18.08.36.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Dec 2024 08:36:07 -0800 (PST)
Message-ID: <b1561e17-63a7-42d4-9d8c-3cbb3c9dc60f@linaro.org>
Date: Wed, 18 Dec 2024 10:36:01 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/tcg: Un-inline translator_is_same_page()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20241218154145.71353-1-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241218154145.71353-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=richard.henderson@linaro.org; helo=mail-lj1-x234.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 12/18/24 09:41, Philippe Mathieu-Daudé wrote:
> Remove the single target-specific definition used in
> "exec/translator.h" (TARGET_PAGE_MASK) by un-inlining
> is_same_page().
> Rename the method as translator_is_same_page() and
> improve its documentation.
> Use it in translator_use_goto_tb().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> Richard, I'll merge this myself once reviewed.
> ---
>   include/exec/translator.h    | 15 +++++++--------
>   accel/tcg/translator.c       |  7 ++++++-
>   target/i386/tcg/translate.c  |  6 +++---
>   target/riscv/translate.c     |  4 ++--
>   target/s390x/tcg/translate.c |  4 ++--
>   5 files changed, 20 insertions(+), 16 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

