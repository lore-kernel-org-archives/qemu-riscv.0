Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5083EC98304
	for <qemu-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 19:19:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x9SU1-00079B-8R; Wed, 23 Sep 2026 15:18:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x9STw-00077w-5z
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 15:18:16 -0400
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x9STs-0005ew-QK
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 15:18:15 -0400
Received: by mail-pj2-x10.google.com with SMTP id
 98e67ed59e1d1-396ccd5cf02so773871a91.3
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 12:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790191091; x=1790795891; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=iTcmsIZxlHcLEj4Nb7hdWcReyZmF3W5VheB1cCrtj9Q=;
 b=i78wbcVcfKG6qTrpoO39XNrZ9+vb52jfHx9KjR5SSjfiz8gM6pc4WT4G7J18YZpXr7
 xc/nxelFsMuHbfAIBtT/9YeLaT+ayunGz6OI2NGpTsys5r4WJcFh3Wyn6yfUGiHOMemQ
 QjK7rheFB3vqaGDRo6cSF5R1Z0+SwZz7Sq86BS2xYy+1ROl7ylPQkjVw/stjo2W9VSBf
 vwaB8wlB91II51xU7zUhRvqyKOvu6d62DWyOD6YcHBPZT/FSeWKr2T5an3IHe0S0zlpR
 CMOnIN7D5DL+CZNGpemkK7SNi+7usgpfhSUT5AoplN0MSnX5gaQUK8DIJ4HNSmNqu51N
 Fy9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790191091; x=1790795891;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=iTcmsIZxlHcLEj4Nb7hdWcReyZmF3W5VheB1cCrtj9Q=;
 b=NlFmTMQKxw3Sb/2l8FTXWdROs69Y92qzaRLQPGYyu8RzzEdAA1uAckn0Gpb6/qOpGo
 y5Jxn3caolquxluUV36PXO0UaMXfge8UcWpQFcgsrxkIHUCLzczeNeG+qc9divd5Wn07
 6VPJQNRGicxquF+5DL1wZsUTt2bPwQRwZgRxjyGD71AaQCHotIvM+sYeNehBdvbJ9yfF
 KyKxVwn5K78SxeBClXf//uNfE/8wSOLOM6+NgRq5PZ+8+GZ4ucws6PZM7H+ahItQI96c
 RreqTatTr1I1Ns+mil++z+chps5MBOSZ4rK0SVqYWVd2kk+fq5Q6Qp21W+48tkLm8iIF
 zfjw==
X-Forwarded-Encrypted: i=1;
 AKwUvByM7ixvBMWoTXgwf+OjeLJn/YgiZS7/i67LLx6J2AgFuU5NZ3s0F4zPKAOMlUrA/plaP5ZYSn/1cESQ@nongnu.org
X-Gm-Message-State: AFuF++nRJ1H+NcfC05zNPqyRJdpq1w0lmHhAA9g2rGKlm/n97ztnfQij
 rZ4ABMf0g2KNzuvHU64+fKuDqDOCK9WbWx8PF1EuPjqjqDsyahXM5olthUwWqe+Ru9XnmlGrAVh
 RD2Bx
X-Gm-Gg: AYBFou2UrxahFn0by2vO7c7+C0PlO8g9UkekrdSvTZxvsqNJ5+S6736nwb/vCcCkFV/
 U6vWD8XBi6VX4ohhmH4/acEmWME9x12z1iDIkRMJIRDx3IXl8YuqQeSLBjCcsAAGqXoxlwGKc8Y
 zhs1HQ6SDSnERyem62bbjAVhpWxt5uHi1FMc6eI7M5FLS9SVmhdCadZ/74js9hmlsVIuJkQ0DZg
 4JBmkVkMCD+FmjLjsMV+ikHLhzaAcmFGhhTTtpux6xp04ZASGQ9szLK12WzeTW0qx7cZKBqb8I0
 R3vtn7mVBabGzAACLeEZTQWhbKa0uOoCeqDQkC6YGJ+TrXQVlV8Lrj0HM2TW+BR5vEBFWK50lgr
 naDndRul8RtSgQSUOIEE1SxfaoGRCaXTHuN7ykF48V7JCAA1qQ//fmka1koloN8+78vZahNabeA
 +51m0tAiftvtkPZXjlfdWyq7WOB0lPm9wL77psB5soEf7KKU4jxPUqPzS18Qi0nkrE0s0dNltNy
 scvyiup2MZqU8jTvh4ZGOcxXsyP0P5vtnangjEU2D88e0tShvs=
X-Received: by 2002:a17:90b:3b48:b0:39e:6c69:f471 with SMTP id
 98e67ed59e1d1-3a098cf4f03mr99491a91.48.1790191090462; 
 Wed, 23 Sep 2026 12:18:10 -0700 (PDT)
Received: from [192.168.0.4] (174-21-68-150.tukw.qwest.net. [174.21.68.150])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3a0812c87e9sm2184194a91.3.2026.09.23.12.18.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Sep 2026 12:18:09 -0700 (PDT)
Message-ID: <a1572edb-536e-47ff-9220-7146304b1a07@linaro.org>
Date: Wed, 23 Sep 2026 12:18:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 17/21] target/i386: Use an acquire load for
 interrupt_request
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Zhao Liu <zhao1.liu@intel.com>
References: <20260923171116.31276-1-philmd@oss.qualcomm.com>
 <20260923171116.31276-18-philmd@oss.qualcomm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260923171116.31276-18-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::10;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj2-x10.google.com
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

On 9/23/26 10:11, Philippe Mathieu-Daudé wrote:
> x86_cpu_has_work() may run without the BQL, but currently reads
> CPUState::interrupt_request directly. Other threads update this
> field with qatomic_or() in cpu_set_interrupt(), so the direct
> read races with an atomic access.
> 
> Load the interrupt request with qatomic_load_acquire(), matching
> cpu_test_interrupt(). This provides the acquire ordering required
> before x86_cpu_pending_interrupt() inspects the CPU state.
> 
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
> ---
>   target/i386/cpu.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index b97f144aea5..ee1aa3a5a70 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -10640,7 +10640,10 @@ int x86_cpu_pending_interrupt(const CPUState *cs, int interrupt_request)
>   
>   static bool x86_cpu_has_work(CPUState *cs)
>   {
> -    return x86_cpu_pending_interrupt(cs, cs->interrupt_request) != 0;
> +    uint32_t pending_interrupts;
> +
> +    pending_interrupts = qatomic_load_acquire(&cs->interrupt_request);
> +    return x86_cpu_pending_interrupt(cs, pending_interrupts) != 0;
>   }
>   #endif /* !CONFIG_USER_ONLY */
>   

For the change overall,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Because of -ftrivial-auto-var-init=zero, I am now in general against 
uninitialized local variables, if at all possible, everywhere.

I know you've added the local variable due to wrapping, and split the 
initialization for the same reason.  In this case, perhaps best to just 
use a shorter variable name:

     uint32_t ir = qatomic_load_acquire(&cs->interrupt_request);
     return x86_cpu_pending_interrupt(cs, ir) != 0;

but in others, just wrap the initialization:

     uint32_t pending_interrupts
         = qatomic_load_acquire(&cs->interrupt_request);


r~

