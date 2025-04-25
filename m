Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0656FC369D1
	for <qemu-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 22:43:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u8Rc4-0004M5-D8; Fri, 25 Apr 2025 18:33:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u8Rbt-00045l-Iq
 for qemu-riscv@nongnu.org; Fri, 25 Apr 2025 18:33:31 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u8Rbq-0005nf-Ow
 for qemu-riscv@nongnu.org; Fri, 25 Apr 2025 18:33:28 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43d0618746bso21250815e9.2
 for <qemu-riscv@nongnu.org>; Fri, 25 Apr 2025 15:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745620405; x=1746225205; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YyT5TWfRI1CLPsZr26VVfA/aqL9HO8wqqzuYOJ5k+cc=;
 b=vWA4xJH5z2kcHC4lld37txIu9XtWOFdJhLBcKFmrxEFh8x+4V6XuCwutX5Ut3feaBL
 +rMa5EknDKD2FLfi8NUqjLORYQ4TikkXmMgA830hoPffJBVLMOaN5M2QDSoBb7tOk4Vf
 IQtMb+NDs/p4zIXOQU7JsmXNI8al2HO3g+oyKDYCpglGegACyZpieAitUh2NBsKcEuyo
 CTpSrCVrXj3VUzKy5YNqrp3Zc2tG7xm4uzGrAUYjgDaFG6Vu3fIhw/mvL88Rkf7jMkA8
 nk0rzlPPjdIijnoUaKdczq+2VptA55c2HHNuVtS2mSvrcnUUectCm8xFnQB7VR/Mge8T
 GkdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745620405; x=1746225205;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YyT5TWfRI1CLPsZr26VVfA/aqL9HO8wqqzuYOJ5k+cc=;
 b=Y0B/79+E0Qt05tXNgz1Xb5RML4noiYmH3PQGlyBQZilsrrhx6p6v6T47Bw/6yWVRwI
 411bnz7NYNG7HFpKe2kD1r6S7a11royt98J9lF3vSxcoqyqqNks8vzLwJZDfJIe7nepX
 45Y9V0iwgE7VQPSsFTScFThIHtTLaLvsDRE0S/VHGbZgVSJ35LjOgYQO/mB73q/dROYG
 tHPWzYuWsYqxeQmKOej5OCB/lqK5/TYn6b+5En2ATuGUTvspMcUl6UDttWifnrw+5RRe
 +u2Nqt1YocF/JU6xWbry8XcTndVKAKNJ7nFO/ulxl+T94imIXUM8AsSDHd2Yb2/tNale
 ufnw==
X-Gm-Message-State: AOJu0YzFqYCrMaOSOr0EIusPDlOIBHZAKF5FIV2BPK3LMbGph3kN+8/A
 9mvcHaA4phPHmQ/xiB9FDkiZJUHftl59eoicVMpskzRU9hi3nZwtWr/+WVRMff0=
X-Gm-Gg: ASbGncuiEJosRg5vJIwrU+VyVi0E+DnLs5YyvHBRPVpuTPAH7u5ShH/V/6qy74hNKWj
 61fd78EIG/HHapAyooO6CmsdADxKIYqPppUnkYDnAmaYxCfffq274zhKQxATfpywVkV5s+jPV1l
 IzM2hOFRfD7YVWQ9JOrvuWxSAatjM9zXUYbo7+8LREHYxUX/95GTukUvTZhPjO5HB7RNM5lrk19
 oBIDT1AS7Q5k2MscmbeH3qX17CCZKah2i4vQjdjUJZ933fLa83tQEtMK7p3A8UkKg4NUefNkVrg
 pL3unKFoCJbETntGJq4kW3/TFDbMFr3FmrzvJOpkOQhfMEpzwGB/iraBU+OHMCXH7D2TnkbEj9L
 Yr4QX2LDmyiQnxqz/h+4=
X-Google-Smtp-Source: AGHT+IGM8Y+W4gCJ0qb8rs7zIZMoXDIKfZ5Oen2vT3qF0dWZ0x0ka4A0vsYC7XaFdTIWbLvourVplQ==
X-Received: by 2002:a05:6000:4282:b0:39a:cd84:a77a with SMTP id
 ffacd0b85a97d-3a07ab85dd8mr608064f8f.37.1745620405069; 
 Fri, 25 Apr 2025 15:33:25 -0700 (PDT)
Received: from [192.168.69.169] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073e46981sm3555675f8f.66.2025.04.25.15.33.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Apr 2025 15:33:23 -0700 (PDT)
Message-ID: <21574198-8266-4262-b5dd-a9e23d46201c@linaro.org>
Date: Sat, 26 Apr 2025 00:33:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] target/riscv: Fix write_misa vs aligned next_pc
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, dbarboza@ventanamicro.com
References: <20250425152311.804338-1-richard.henderson@linaro.org>
 <20250425152311.804338-8-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250425152311.804338-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

On 25/4/25 17:23, Richard Henderson wrote:
> Do not examine a random host return address, but
> properly compute the next pc for the guest cpu.
> 
> Fixes: f18637cd611 ("RISC-V: Add misa runtime write support")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/riscv/csr.c | 22 +++++++++++++++++-----
>   1 file changed, 17 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

