Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AC67C021A3
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 21:56:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1thbkt-0003Bx-HK; Mon, 10 Feb 2025 16:55:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1thbko-0003Ay-OB
 for qemu-riscv@nongnu.org; Mon, 10 Feb 2025 16:55:47 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1thbkl-0006ZR-QE
 for qemu-riscv@nongnu.org; Mon, 10 Feb 2025 16:55:46 -0500
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-21f7f03d7c0so40557935ad.3
 for <qemu-riscv@nongnu.org>; Mon, 10 Feb 2025 13:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739224542; x=1739829342; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EB8wNvdrHW8cKwkJWprogzd09c1jUUh+Kcirc2bmyrI=;
 b=Vsw5Zq+2hpeLaWpq3zeXr68RFV1bbiwfzNkfLKYJQaiSKHFYLMhJ2wFalnOICRcJ8V
 NUT8TJ97ud7mYRFXNBXig+eP8PlFfCl7h99clJY2o2uHt9Rs9IyEplIVWpOJSprDUUHX
 rbptASNTDT1xJoB1j3QFyIwy5Wp73tybcyaXQgRr/s3kf6gqnV+8TOn9eXo24Yirb4Q8
 8D+uRwhUlQRa/r2ns+YC/mkV9wwkkGyg+BDvsd6kJRzl19Cu6aIsWtEUEnD5fPO4JzSf
 XTLyx3cpctE0MVX9Mx2FTxuBz8XXYdnTz5j9yJEFrcaIxAwNAti1p2Nbw3niEk5iGTOn
 aa0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739224542; x=1739829342;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EB8wNvdrHW8cKwkJWprogzd09c1jUUh+Kcirc2bmyrI=;
 b=YLJmMJ54F4eE2/7/x/Fk2EFb4ftxd9Z2MtVk6PKyOsMRUApPONZ9wd0Z7UQaRbPbvm
 fwoJPJGka6GSNCjZeBQ9594J0Q13xjG/bz+GWxCWFPFmmrGupjOuWhEgN6yXNXCH6s0K
 idsBXxrrvmMwMFzUHeFr4+QMO9uxq9gx+0PF4yXzE+XujimS3PYs4kjj5+6zo3U/NeZQ
 ixn/50/sYsQvei9oCY3buFR/YdyO0fAF9i/rHuWgZ/rVLQ/Rne1zLOYPeXUvFuT26tdq
 QNSAwZOoZIZOo5IB3bE4nm/tgWHqmE4Hz0xeKLfEv1zY8/PO4t8ZfRzjl0+smD4DHvWk
 Ar3g==
X-Gm-Message-State: AOJu0YwTDAeoMr7FbFUqbqGUuTImit4E2PDuqvTsM/whwvun5ppxtCaK
 YTBzGjitL9/m1gAWzS+CSz5A244b0kJ5DSgOrTgzCAP/yC6jKyqONLXBETdiEjo=
X-Gm-Gg: ASbGncvYVn2PrjwEuCqEJsopW4ScQbtWKPGcXiPGimjvpfjULQxzkJkP96jv+Y4v+V4
 k2he7eNlr822MLW+DFuaxwbXXOdi9wvzweDLYFhSirv6ZiHg/+hVGsmO+oBE8jJoI2mAfxSJq3M
 S7uoCmmd3A+pOxxyGMh4cJ5/wlvgomojOXJvbPTsApOMk4P4jMx96HFT5FvN2vDB6XRRK6Le0nL
 UslFiFZXxJOI46rmB1/Hu/xC7uVw+mX/Ti2xtRdE7Gh5ze9xOW8D2XauTlGAmyR+xt+aZhxpDC1
 KD/R7BPav/sgdQWZrIKI07xjTKdD7kpy9zFPghklBOwSqpPqOz6qMoQ=
X-Google-Smtp-Source: AGHT+IECMRarfMDCqkErNLnAUNgtkgI0F66aVyKROltcd3fRaEfiTY+Q8pzv4D9kaPpn3XQfcfPimQ==
X-Received: by 2002:a17:902:e945:b0:21f:b483:2ad5 with SMTP id
 d9443c01a7336-21fb4832b7dmr24393175ad.20.1739224542418; 
 Mon, 10 Feb 2025 13:55:42 -0800 (PST)
Received: from [192.168.0.4] (71-212-39-66.tukw.qwest.net. [71.212.39.66])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21f36561397sm83910685ad.89.2025.02.10.13.55.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 13:55:42 -0800 (PST)
Message-ID: <51fc4c66-43b4-4b19-8241-ec0af2d78355@linaro.org>
Date: Mon, 10 Feb 2025 13:55:40 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/10] target: Set disassemble_info::endian value for
 big-endian targets
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Thomas Huth
 <thuth@redhat.com>, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org
References: <20250210212931.62401-1-philmd@linaro.org>
 <20250210212931.62401-3-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250210212931.62401-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

On 2/10/25 13:29, Philippe Mathieu-Daudé wrote:
> Have theCPUClass::disas_set_info() callback set the
> disassemble_info::endian field for big-endian targets.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> Reviewed-by: Thomas Huth<thuth@redhat.com>
> ---
>   target/hppa/cpu.c     | 1 +
>   target/m68k/cpu.c     | 1 +
>   target/openrisc/cpu.c | 1 +
>   target/s390x/cpu.c    | 1 +
>   target/sparc/cpu.c    | 1 +
>   5 files changed, 5 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

