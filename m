Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8302DC9830E
	for <qemu-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 17:29:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x9Qmn-0005mQ-2o; Wed, 23 Sep 2026 13:29:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x9Qmk-0005l1-Az
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 13:29:34 -0400
Received: from mail-pz2-x0d.google.com ([2607:f8b0:4864:3b::d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x9Qmh-0003NE-OZ
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 13:29:33 -0400
Received: by mail-pz2-x0d.google.com with SMTP id
 d2e1a72fcca58-85469d249c6so851232b3a.1
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 10:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790184570; x=1790789370; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ziEWh6Dg+Ckid0U+Ykz1atD92kwnbf3RzQPVPp1TOUA=;
 b=aUUpa2CVaNHWWAai3SrrwRGn4O/V2WLUD73coQk/EkhJIZS7B9SJeyrJBtSyxVfDjj
 Wh08EN2y2NYiT0VdV4YFPcGWZvT+n08f+MkkIFioBdEhrw+xHJA1Ns0qw8P+Vw9F4t1K
 VzZJViiHy4pQAmCjbSzFaGpd+X+hzX7T+d/l7yYms0OVMiY1MJvG/ryqq7y8s4NePQNo
 p9hqSeaPdP/U9TmK/lquj22OvValUygf6B3dMx6eD+JEXM55a/JGgdrbF+Emufe+XcbJ
 V1wbSZdRttIIs/w6c4yiR71uGdxdop9b40CyCtT6MQm2lDlRqZIt0t8P5joSKoaMDdPb
 xf+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790184570; x=1790789370;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ziEWh6Dg+Ckid0U+Ykz1atD92kwnbf3RzQPVPp1TOUA=;
 b=BkPfiTg9Q9wlJwdnjgrjgrMmqAMGCustur+xy2p3CVjbV4TXdphG4gH7rlVV8gh6g6
 ShOG7eoaViyEjZqJ9NsnSBhjw/SEj+7uzfFGhykL6ryYzPxh+LRNOAs4KNwHyWF7+ca4
 pSQv6cxbCGElo+UH3kh2cc+5jBqkJ8aGWoC8HrJ6s0+KecgvL6xTUmxiTwzJ1T20Hp1F
 KdQ3t13VvKn1jlRKEEl4ZIb320CR/cksII0xXBt63mP18QYu3BLDhstN5u0sU9xmi087
 5iRW8vFHVJ67vdSdWmv1GTHA3+WlMTYtoPCnZ3om2fBJ7VfWgSEoZC/dd1JsxLACmGyz
 BcfQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxh38HdPVxJJbL+M719UC/TQdADlWVIWg40Cum7za3DSxR4b3LDqMAnwDzMOZaNQrFUYoBnKfytlyrG@nongnu.org
X-Gm-Message-State: AFuF++lnRZEQUWOcfGgB6gTLtjeJUV/8GjgMdmEQEEvTSRO44vG5+r3W
 JWjP0fZMisHlhpk3h+cW9ymz8Zz8UpUs3jhZCDIeKpqpl0Mkr+pXooGVjiN/uHw9ro0=
X-Gm-Gg: AYBFou0t+MvLuTjfBPIxDfxLsbTCS18BE6qeFD6iQFHHsXXoivoEEAm0oirP5RdVUkj
 GbvHXsghETPckl/go70a1/D5kFNFgCG7CiusFtBxqHX9a2stXQZafru2ufixAC7lL74wfTA4Esj
 60dtUkiHiup7R4L6G9nsH9zHS45iZ8Y6vp4mgaxoRulqTu4t551Wyo+WJ2uttXsWycmcHwJw1N7
 aYgIyNr9/LnEIB2TgLWpqTgOauPJH/rrOcz+k4xVw7zYE3Qy2OYiXfTXgWXutgjl8K1q9hOk02C
 L0a3IINthyunIO7b8Ubn++yjFQoU4yi06ht67Ir/D6g67ujOppjm8+RlaSpFR58j83lpFQW+XZh
 ndtzJlKqLcN2GkUM83yk54RhZYH/RgNy/Sf9FKNjxhekMKL9XYU9mIeRKGzl3E9bekXR2Q6p79A
 CVzW3BkmMEKVdKENTeX1HyKSgqvj/LhrzeaXv5qGE9nWowQwmDiipLF+HT0EnqWjHvjemzo1GmF
 tm22Xm5c4hxCbXzxDrXBbXjIzFd2KfZjP9PMQTu
X-Received: by 2002:a05:6a00:3c86:b0:871:2152:980e with SMTP id
 d2e1a72fcca58-87d1abb5128mr2637011b3a.23.1790184569673; 
 Wed, 23 Sep 2026 10:29:29 -0700 (PDT)
Received: from [192.168.0.4] (174-21-68-150.tukw.qwest.net. [174.21.68.150])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-87d1d4c483asm1695227b3a.21.2026.09.23.10.29.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Sep 2026 10:29:29 -0700 (PDT)
Message-ID: <70b6f5e2-44cc-4ab7-a279-ee8c5c51f43b@linaro.org>
Date: Wed, 23 Sep 2026 10:29:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/21] target/arm: Access halt state atomically
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20260923171116.31276-1-philmd@oss.qualcomm.com>
 <20260923171116.31276-10-philmd@oss.qualcomm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260923171116.31276-10-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:3b::d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pz2-x0d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On 9/23/26 10:11, Philippe Mathieu-Daudé wrote:
> arm_cpu_has_work() runs without the BQL held and can inspect
> halt_reason and event_register while other CPU contexts update
> them. The WFxT timer may also consume HALT_WFE asynchronously.
> 
> Use atomic accesses for the halt state, including the WFI/WFE
> and halt-exit stores. This keeps the halt/wakeup protocol
> race-free and matches the atomic state transitions used by the
> asynchronous wake-up paths.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@oss.qualcomm.com>
> ---
> v3: Dropped rth's R-b because of HELPER()s call also updated
> ---
>   target/arm/cpu.c           | 7 ++++---
>   target/arm/tcg/op_helper.c | 8 ++++----
>   2 files changed, 8 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

