Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F69C88E56
	for <qemu-riscv@archiver.kernel.org>; Sun, 13 Sep 2026 02:45:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x5aDG-0003DR-BC; Sat, 12 Sep 2026 22:45:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x5aCp-0002lR-EE
 for qemu-riscv@nongnu.org; Sat, 12 Sep 2026 22:44:41 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x5aCm-0002IZ-3J
 for qemu-riscv@nongnu.org; Sat, 12 Sep 2026 22:44:33 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-2d6efd73032so29928055ad.0
 for <qemu-riscv@nongnu.org>; Sat, 12 Sep 2026 19:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789267470; x=1789872270; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=acBFeuWET6PcOIIIXhZ62OXiH58NgPyeqPIBUtEYsMs=;
 b=RY12mCP3CWZtKNNC0NU9NnHJcu5pYioGCaU/0RK1vwtolPhFrwiKJ+SJdnVRLABYM/
 v0zn8DHuKERurCJSnJutevcs2LSBL4bJscJIG5bO8msNHCvXj4mU+R6YhqTC7khAl15B
 yAERqkBVV8mKb3T1nl4uOJk9eqYZuhcsOMqapAg8JA8yeJaKjhdhpNDVpPMJp2HB+vLr
 f4t+Tt7jxhwimlA1inHJ1k0iDYX3GlkTOTYKdogKMz+wlwpYWXgXtIqKvxZ0DvIWQXTM
 gn1ikQEbSgRrkTUxEkrWmtY5QwjYU2HsDgLApB20LXAGIEkrnMsxAyZQAXcXSVPlk54T
 DQqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789267470; x=1789872270;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=acBFeuWET6PcOIIIXhZ62OXiH58NgPyeqPIBUtEYsMs=;
 b=jWdfb/O8ue6giBD/5S97wzWgU5g2IUE0JRYDn+WVUYM9fakAWHMldPyjw/Ul0ZsdJO
 2KcyZASgWONefc75U3Fblohg80U2XmDrUbwnoeXlsxR99NECxSrJ+TJhFBYLy4eTnQ6F
 JI5qKHApzepWPTUbTUcLmjGJSHmsLuYgxDQ2CgBndt9lAuja3WTer7DSpBnfnMuscg2e
 u9ogiHIvmprzDZY+zaxIqBwzw1GKrB0a15l2fPHEZuqUFeDC7HcvYRikRu2dntIh/Nse
 adtFn96v3XdaWzO+4dOmyr716RwZMR6SM4HWU3Ih1PDqbjUKoVlXI1xa7Epi5311WwSI
 lsAQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByAP9otnMSSUU/tvP07c4g9nteoyZN7C3WDGmUIWO60703baoFmx6xeQobsNndVEcpdMNBRTm/AVnmI@nongnu.org
X-Gm-Message-State: AFuF++kHPPxN8UP9bGd1fv+BBk2M/YdjfBOeklszphzcZkxKeMDtwE7j
 xYrO3u4htIKzmr5A9rqRmAkIg6tW0IX0Cn/nZ9Zmla7X1RyE0EtGgcrZotLMtiFe9sg=
X-Gm-Gg: AYBFou09Qi1uZac5aKds993Zjara/Qe0pVHfimHXZ53u9zb8f32JeYxJx88vIEHYRTi
 pusrAMAssKgEgmqWE3CfXwjEFIDIiBtD04SklDjWpYnAKrk4SsnhqUj/aP/G2MyFmV08dUzhT/V
 2Nv8fxIZG26nQRsD+2wjBH9LdfqJKN4HR0u3qbjj+Hyj8Ns1/EzBbjTiFQLOxm8z64Okx99vzYk
 SHbhvzRsWc3fA1hRfdJ1r/wXNEig0YJe5TPotE5REs3LIfyZrZlJ0u185yJjOeG5fZEinolghCy
 RA1iXP7W1GqW62ljdcj5YRfIaFihFOD+GCjqQQenpD6Gx2fJ5JaAX+4Ql0e+cs8AqBkgy9lt+bI
 Y6NuOTh9kQQFx61yA+FOOwoZ4BIovIaPJZM/EyeR+M6sKASluGIulZb1/S0SxttvD+oA25iq0kV
 jKoyqNaO/MW7XDv6783u4A6KUMrMxWjvOfWTq9nV9DIXBk76c0aHeeHtZpok6C6jfM1tjo09Lkr
 woOzl/0T1WDk4VPe5D3GvesdlJzxLrasp/qzStVwiOHHn/iiIljtlThoF2vbROGA2GzgtPT
X-Received: by 2002:a17:902:f605:b0:2db:3734:cfa4 with SMTP id
 d9443c01a7336-2dd5f0745a6mr8905445ad.5.1789267469953; 
 Sat, 12 Sep 2026 19:44:29 -0700 (PDT)
Received: from ?IPV6:2603:800c:7900:ed00:bf2d:a6f5:e308:cd27?
 ([2603:800c:7900:ed00:bf2d:a6f5:e308:cd27])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-33ba4e9b359sm16591583eec.14.2026.09.12.19.44.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Sep 2026 19:44:29 -0700 (PDT)
Message-ID: <bab55949-4352-48fb-a986-794e9358b0ca@linaro.org>
Date: Sat, 12 Sep 2026 16:44:26 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/11] target/i386: Rename fake_do_interrupt to
 fake_user_exception
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org
References: <20260902152044.31291-1-philmd@oss.qualcomm.com>
 <20260902152044.31291-4-philmd@oss.qualcomm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260902152044.31291-4-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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

On 9/2/26 05:20, Philippe Mathieu-Daudé wrote:
> The fake_user_exception hook handles exceptions in the outer
> exception loop (cpu_handle_exception), not inner loop interrupts
> (cpu_handle_interrupt). Rename to clarify the scope and intent.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@oss.qualcomm.com>
> ---
>   include/accel/tcg/cpu-ops.h       | 4 ++--
>   target/i386/tcg/helper-tcg.h      | 4 +++-
>   accel/tcg/cpu-exec.c              | 4 ++--
>   target/i386/tcg/tcg-cpu.c         | 2 +-
>   target/i386/tcg/user/seg_helper.c | 6 +++---
>   5 files changed, 11 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

