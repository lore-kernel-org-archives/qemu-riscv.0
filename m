Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D220C88E56
	for <qemu-riscv@archiver.kernel.org>; Sun, 13 Sep 2026 04:00:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x5bOf-000404-2p; Sun, 13 Sep 2026 00:00:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x5bOY-0003pc-7M
 for qemu-riscv@nongnu.org; Sun, 13 Sep 2026 00:00:49 -0400
Received: from mail-pz2-x0f.google.com ([2607:f8b0:4864:3b::f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x5bOT-0003Ip-JZ
 for qemu-riscv@nongnu.org; Sun, 13 Sep 2026 00:00:44 -0400
Received: by mail-pz2-x0f.google.com with SMTP id
 d2e1a72fcca58-8631d0023daso444786b3a.2
 for <qemu-riscv@nongnu.org>; Sat, 12 Sep 2026 21:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789272039; x=1789876839; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Ce7voLRYUu81UjTyLXqC4LV/nMnN/2nV9/+mUN7X9ok=;
 b=GxtHWfz3Xy4/YZ/ZQJLAiknQoosa2jmoGq9VSpOqJECJe9xOhsII0T4+JUrCh92Fnf
 Em8ePZjG52/slu3+irNQ+Kdp/6P0mP6Tz1C63gBQop63Yfvng2FpO7li7BW8QxeK8r7b
 smtPrDk0Xuc0RRqassUXB6NZ2S16SrhziP55hSimemWSpzpb2KwYo4kQjlmqZVaGTuBy
 WPgwk1JYUdzkfeiikMrwkA2Xg3ocL/XgQNP1nuHAyKlY9f9tQKHIdHgLgwicfKTUuEf9
 4PcTBJjn6O6TNsr5tAkx8btbYK9QcBfve8zaofqDe4z1rTkpaUvV+SSzMT+HTEUjKK6S
 Eyhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789272039; x=1789876839;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Ce7voLRYUu81UjTyLXqC4LV/nMnN/2nV9/+mUN7X9ok=;
 b=PF2flactUVhr/YXJtY9l6GN6XXLea8Ev1MgWsHw9MameBb2AwgBd3ckbI9YQi4dQFw
 J1jSciDdMMUgQQLYSbOYLE5OWAETyfDJIBo870VT2VDYBy+2OiSKjSkTIsD/czx0kae3
 Z4tydxe9Fa9ZiE6ZkvBddi9+VmiKFARu0g0JQSjGZSCC+4U4+UJcey/c0pebKRglR89S
 KLZeR4SI/PIw0nVZYQa9DpST56u50mXG1EwrFFCs6lhailPiJyAWWtFcAj/ETj3uTdDO
 lzxnZHcerEnKI65A6OZ24nAk9MY19EgxLw6T+vkDEyOpGBYF2VMUrlD4yPm1jeZZ2Kpq
 hj1A==
X-Forwarded-Encrypted: i=1;
 AKwUvBxXd4Ivt/7CsR2kLaZzyL0jrN0Oz9lTGhEfbtj/p3Ra7Yrim22NLvrtoUurwqLR28muO9n8itgx4ZIZ@nongnu.org
X-Gm-Message-State: AFuF++kQWZ0XGXzjP/LwYJci39PXUi3NLnWXmdZaRyqQOrEvUE36cgYp
 L69Eh+bgFlgbBfZYQdo9jNXO3AKQoC/gSH/J1lp6Ivfa8yQnxGfN6yupDI9XhF4ADpI=
X-Gm-Gg: AYBFou2lYmTousY+wM5uQy5QNajKbQQecrRTlOfcJMPAc2zo4COiQ3xMn/xYAT5WlCc
 HrB1K04Jtdo15h03VlzhiW0i0lMkSxiCFZ5iTJlo/7Ja664YxODCFEiUy3oJCSbvErx+SCPt5O7
 z44HvlCyRxcwQ9lG0mcJYdScLovVRHxN6v2bQk7nsMIoF5mD8FvhxiVMuUbn6/NDkE0WlLKQD7J
 UoOBw2FEnGyvrnU7yTN85M+pqWELCtHf2dcHZpv8m/Cge4Bc1gh5Wqfs9NhRW9W0fye1Ok3JAPC
 bPmZ9Q2DQM+faNUD6lXqPqb/1D4xQgQjgZ08/MUDSvfz927Ajh4fqWWqJAfyJgbZgnCCxrhMecu
 7M/Wd3gsAQ0Tgzo1Y+8jeZFLR44kVpDyVy4VEGAwwmnflM6DGDP5tr/NX+1/jE3K/or4OF/C2zi
 RFG/R8f7ol/P/bY5IFB3K6YJU1zD8SaNhAAYAjVg0jpNNTucK7A+uEPwh4nwNPw+YsHDScZqLnK
 dVqLJP18zzqqiUVll0qRAxjBrOXgy10AnpZWoG7ro0A6LPq3CynRUEa1gDaJw==
X-Received: by 2002:a05:6a20:a11e:b0:3bf:a543:e7f5 with SMTP id
 adf61e73a8af0-3db0e0b887bmr9973617637.3.1789272039390; 
 Sat, 12 Sep 2026 21:00:39 -0700 (PDT)
Received: from ?IPV6:2603:800c:7900:ed00:bf2d:a6f5:e308:cd27?
 ([2603:800c:7900:ed00:bf2d:a6f5:e308:cd27])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-33ba4f55735sm18114698eec.24.2026.09.12.21.00.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Sep 2026 21:00:39 -0700 (PDT)
Message-ID: <44022341-b351-4936-85a7-07979a787608@linaro.org>
Date: Sat, 12 Sep 2026 18:00:36 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/11] accel/tcg: Remove do_interrupt_locked() callback
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org
References: <20260902152044.31291-1-philmd@oss.qualcomm.com>
 <20260902152044.31291-12-philmd@oss.qualcomm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260902152044.31291-12-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:3b::f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pz2-x0f.google.com
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

On 9/2/26 05:20, Philippe Mathieu-Daudé wrote:
> All targets now manage their own BQL locking via do_interrupt(),
> making the do_interrupt_locked() hook unnecessary. Remove it to
> simplify the TCGCPUOps interface.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@oss.qualcomm.com>
> ---
>   include/accel/tcg/cpu-ops.h | 12 ------------
>   accel/tcg/cpu-exec.c        | 10 ++--------
>   2 files changed, 2 insertions(+), 20 deletions(-)

Oh I see.  Objection to hexagon change retracted.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


