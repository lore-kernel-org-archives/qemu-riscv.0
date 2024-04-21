Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D52C4345F
	for <qemu-riscv@archiver.kernel.org>; Sun, 21 Apr 2024 16:37:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1ryaBD-0006rB-CE; Sun, 21 Apr 2024 12:36:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ryaBB-0006qL-M5
 for qemu-riscv@nongnu.org; Sun, 21 Apr 2024 12:36:37 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ryaBA-0000cp-5V
 for qemu-riscv@nongnu.org; Sun, 21 Apr 2024 12:36:37 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1e65a1370b7so35526135ad.3
 for <qemu-riscv@nongnu.org>; Sun, 21 Apr 2024 09:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713717395; x=1714322195; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nkXglo0SDqCy5Sv7qTCxjByr3WjPttpM3Agj+6LK07c=;
 b=LYP5M05UJsvkbThLwUQx2PukrdYMnxSvNOh3tZwlg652ja3RovoYrx1wlPb7s5S0ia
 ZL++Td8gv51a+pBkuS7/xo33aVtJeWcV/MJ8HWlNx+gNdOtjnYgtKGBGn3YMQiahGhO7
 tZXZaw2VFsOSH64YKsiGqFgCRtU5rxPAODzPnTdSpE7+euKBEtxE7lJvQFRQttLlzEf0
 rgqhsN5YbTQN7+ncuEpvT4T14sl+cBNuIwDg3VufVFZHE4J44FTodACbOPMI6Or1w9Jg
 4DapRcevo0IHbohZVlEdaqMAivDamgmom4lfVjt7FRtLcc4NowGRyyILTgRLMYArEl1i
 aiCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713717395; x=1714322195;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nkXglo0SDqCy5Sv7qTCxjByr3WjPttpM3Agj+6LK07c=;
 b=BZaPqAMxEi0TPzh+i2iUfEdum6mXetwmYF0CrxLbJZYYmJxGArmhA/TwqYO1hCzb0Y
 Qy0uLliuSBPH/+xZxxM+oOcCVCffgwOd/gmpQfVgjTBNonlo8Lo/LQX0mvH8GksOU8os
 Gbx3O7e3z2Tvh7VBH20lkVTwd54hKUPrF6YMVo5mggvELhTnrNIoVrlI4CxOEWmN2/qy
 y+jPbfnfroRF3aE2v4W6RPeS5uKGU+jvtaq4Ik3tDsObQgRLvriD/NXhaZDQI7UcqfDb
 MhngQ0ATyCuBaGMGNRGfav6l5pzCh7Z22G2o1IcY8zakx3pKkFJUxbC+M8EnBdkMOxYU
 hXJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaAojews+2JtTvQdLWbcIvULpjNjhVa1Ib3AS+EVNbaYw5ZG5cFaN2O6jJ9Amt4GDtBPtIvqip1YuKs+ErHLMNpDNriP4=
X-Gm-Message-State: AOJu0YzkBJ5QdArZZXj2eCyKX8VgpPWOajsGvM/eU4uvP1Vsq7uJnwpJ
 yh3Z90M37NrwuU8nXv+/eQTrmJROHrv2DLGmNZ5fXY4/eq7Epu2ftrDrk5C/CBY=
X-Google-Smtp-Source: AGHT+IGXt7Sa27+S5/L2k57srA4K09RsQxja6IL9SAbabgU+eQP9G+Ydc70B+4gH5g13DhBKS1Ov/w==
X-Received: by 2002:a17:902:b607:b0:1e3:dbb4:2c90 with SMTP id
 b7-20020a170902b60700b001e3dbb42c90mr8167330pls.64.1713717394813; 
 Sun, 21 Apr 2024 09:36:34 -0700 (PDT)
Received: from [192.168.91.227] ([156.19.246.23])
 by smtp.gmail.com with ESMTPSA id
 w16-20020a170902e89000b001e8ab6b927asm5279578plg.39.2024.04.21.09.36.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Apr 2024 09:36:34 -0700 (PDT)
Message-ID: <bc5d2dda-7826-49b4-b567-c9fb3b387da4@linaro.org>
Date: Sun, 21 Apr 2024 09:36:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/24] exec: Reduce tlb_set_dirty() declaration scope
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Anton Johansson <anjo@rev.ng>
References: <20240418192525.97451-1-philmd@linaro.org>
 <20240418192525.97451-11-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240418192525.97451-11-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 4/18/24 12:25, Philippe Mathieu-Daudé wrote:
> tlb_set_dirty() is only used in accel/tcg/cputlb.c,
> where it is defined. Declare it statically, removing
> the stub.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/exec/exec-all.h | 1 -
>   accel/stubs/tcg-stub.c  | 4 ----
>   accel/tcg/cputlb.c      | 2 +-
>   3 files changed, 1 insertion(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

