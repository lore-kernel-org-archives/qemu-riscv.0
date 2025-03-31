Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 788E9C3600B
	for <qemu-riscv@archiver.kernel.org>; Mon, 31 Mar 2025 14:16:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tzFw9-0005Pv-Mh; Mon, 31 Mar 2025 10:16:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tzFvz-0005OE-38
 for qemu-riscv@nongnu.org; Mon, 31 Mar 2025 10:16:16 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tzFvx-0005Yh-9C
 for qemu-riscv@nongnu.org; Mon, 31 Mar 2025 10:16:14 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4394345e4d5so28897065e9.0
 for <qemu-riscv@nongnu.org>; Mon, 31 Mar 2025 07:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743430571; x=1744035371; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=I64BiwOIwbYPhS3F9PbebY8ATXDtTgB3BXvfnFWJZ8Y=;
 b=GqrLYF+yfztxUNwedzlNM+FcsICvcD00MEwICwCUF/ACIK6/ODiVhlV5seBg5luc9c
 9/mYzJeKw8dy+YJPsvMLLF4Izbx8OR2wHKjHq8CdkGM5Mrln7fEWWQUOp/nBdONlmYpt
 /8u2ITancLOuAsC/eiaCBJJoVSzGAJS8y21qC3WNYfJ5YDXxFvLsKRJIROJ5TwqcYEBu
 jO9QNSzUqA9plWqs92l1hbEZC8EbcoOu9ritLBWz1z5QgtkUB+rNMLzRP1TIqYf6cCyE
 6FANyfNeH3VFPGHhwO98a3S9X2Kf69/sCAzRncoslh2D87VL3GzMeks7X1ai1sigKFQT
 C7Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743430571; x=1744035371;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I64BiwOIwbYPhS3F9PbebY8ATXDtTgB3BXvfnFWJZ8Y=;
 b=a2ig2FM32fx9xSYz6SEL8Y0Zu31pCRtUDPXizNMWZczIBHKoHzjz/+Aa3pcKTZt0Vz
 13CyS1FpwcH4iqLR5yGKH0t1r0D30DReha95LbSEIM2ZNiOIxN/VOjkyrv1RbTHMfrN1
 ASMu8MMsvAbFsqXhsR/zPGI/NXZvLUyY7SQlEPavLd2QW+QRs1Opb8CtI5eyr0vxB8xB
 kAyBObaale84M+EAp546Hc84ZhRVd/3JUN/jfLl59FvGi3ON2rC3iJX0A42rfQGBdMwS
 GOAGtj6jmAgmAC7aMh8CmYz5NiV7dqLv7jGX73LQlRjDZ0krN6ZbrD5xalcF2fKPFpnS
 ZGmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrT0Hbhw0HSP4h28x0kx74HXc9Qi/7Uts4botaTYdFFRj42RwTvxvgH+J8x89BSQ29plzZGW7D0s2o@nongnu.org
X-Gm-Message-State: AOJu0Yy3dxXgxCD8ZyByhNpZbOIxI4McTTBmYD8VaAmzdUIzIbWWbXbA
 R/NrFxnKjAR+ePQL/oHT4R1d3caKeD8+4yOEDFYM7VbuTySVRIKqVvAzebzm5zc=
X-Gm-Gg: ASbGncs1mdZUbAh2RNs0eeM2CSN/Xp9mpl3dN+gEr2rLanChhmzcXbSbrwcLOKDy0sX
 IOebI47Xu5mPVUkwV0kQ47CGUl6aueRjQWeWfGwwcPW0vH6Vik7vd0MiAPBvcWkSRLjrLhrgajD
 36BU+z3xW5wD3QPOtXcqf+x+wf+v/qks+cgnJhlG3Uvo5kRDtV8YRcMyGaCpSgkuTl46vWKomFy
 N0xgyMEfMAZMWjHRbo148f0sd9hyezXQ6q5rak9zQ6vQd2r3CuzQ6drqiSvt77qedVy3CDaHbwt
 Y9xC4WViDwmRYK9KM13rRKD7VaxMUOheeH45NwYPJo0M8yM2SPkIK4gNIubCTR4u51y7YxkLp7A
 78GQK9Y/k/FG5
X-Google-Smtp-Source: AGHT+IF0sWtFMgOi9Wu1wkVWl6LqZ8G34vh3+nnBA++fx2Ke+JQhTAoUnfuRnzoGQD+iCNbL0Mximw==
X-Received: by 2002:a05:600c:1912:b0:43b:c5a3:2e1a with SMTP id
 5b1f17b1804b1-43db61d75d3mr84762625e9.2.1743430571416; 
 Mon, 31 Mar 2025 07:16:11 -0700 (PDT)
Received: from [192.168.69.235] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b662bf9sm11065948f8f.29.2025.03.31.07.16.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Mar 2025 07:16:10 -0700 (PDT)
Message-ID: <102ba955-61c4-437b-b535-55e1c93b435f@linaro.org>
Date: Mon, 31 Mar 2025 16:16:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] goldfish_rtc: keep time offset when resetting
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Anup Patel <anup.patel@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>
Cc: Frederik Du Toit Lotter <fred.lotter@canonical.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org, qemu-stable@nongnu.org
References: <20250321221248.17764-1-heinrich.schuchardt@canonical.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250321221248.17764-1-heinrich.schuchardt@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

On 21/3/25 23:12, Heinrich Schuchardt wrote:
> Currently resetting the leads to resynchronizing the Goldfish RTC with the
> system clock of the host. In real hardware an RTC reset would not change
> the wall time. Other RTCs like pl031 do not show this behavior.
> 
> Move the synchronization of the RTC with the system clock to the instance
> realization.
> 
> Cc: qemu-stable@nongnu.org
> Reported-by: Frederik Du Toit Lotter <fred.lotter@canonical.com>
> Fixes: 9a5b40b8427 ("hw: rtc: Add Goldfish RTC device")
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> v2:
> 	Remove a superfluous intialization to nul.
> 	Add Cc:, Fixes:, and Reviewed-by: tags.
> v1:
> 	https://lore.kernel.org/qemu-devel/CAAhSdy0-we9B19wRRqk_rRFkjY2LPPMRGaTdE=_4Ge_pCR4Y4Q@mail.gmail.com/T/
> ---
>   hw/rtc/goldfish_rtc.c | 13 ++++++-------
>   1 file changed, 6 insertions(+), 7 deletions(-)

Thanks, patch queued!

