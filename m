Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD9DC282D1
	for <qemu-riscv@archiver.kernel.org>; Thu,  6 Mar 2025 13:59:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tqBkd-0007Zb-Ey; Thu, 06 Mar 2025 08:59:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tqBkb-0007YL-SV
 for qemu-riscv@nongnu.org; Thu, 06 Mar 2025 08:59:01 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tqBkY-0007tH-BF
 for qemu-riscv@nongnu.org; Thu, 06 Mar 2025 08:59:01 -0500
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3912e96c8e8so353584f8f.2
 for <qemu-riscv@nongnu.org>; Thu, 06 Mar 2025 05:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741269536; x=1741874336; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nCk7xfTFWFGROlrsmv5jMFrY4lgry6lErJKkNV3UDvY=;
 b=IAzFldW2NJkY06gM2pYg1eiqGButGn1HWaYnFE+UGCkAcrUS3VUCVJd8jjLhfer9Q7
 lM4UtIZqORPxkXb4GcOoTk2GUU3XqiwQcklLPG0UeyB42FBLjyvikem2IMCRe00j5ArP
 gklM2WB9Zkm7JNr2LQYFAv3oNkyzFAMAJdwkyWmLADdOMPCwG5n5o/5OJiOJM+yFebZD
 FWn2q4Q2F/hEIwxkl50VUuGjwLABDjLG5DZMQbNGhdy9P0EIlTIpK2XYaBZ5yCF9mOOg
 I2/+qs+Se2CHqhmqg3YK+q6UjM8cCJK6JV5smC/rPnmGnQSiC7X5mgZJ5wm5gFpVpaRI
 96Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741269536; x=1741874336;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nCk7xfTFWFGROlrsmv5jMFrY4lgry6lErJKkNV3UDvY=;
 b=q5IWAx/gKe+HXS5aVKHnbHlO/pYmYyrdqOfK6Qjjv6oh2NUUvBMR6r+W792l804QtS
 ZJ8GfucidyVFcGy0kVHkDqnVqS7bApw64h3YUNhx26G9ui4riPXaKZbuILzR/dNK3rDW
 cK4ZCZXD1RLYdrdETxtL2K2taR6jLrEZ6F7A9XETw1LJvMNIHRo43pA4WpqvuTwvd6Dx
 U161e1HU7NOMIdtlEVBEZ+HSwDEGmFOhigTOZQuvc1wUJ30UBdutUxz4ssXVukSswtpt
 i7+YZ9Wf+EP6KHTgRQps7ZO3KPmPvu1LFjzNZc7HCa8dBpLBkE3Sg2W2/pGlATGyZ4Ka
 scJg==
X-Gm-Message-State: AOJu0YyATajjJ+x4KpaY7s3+VJGVWAy8bpTR0guU68PYx7SW3tNuXHuj
 PFsOp2XOk7YjdV8OVKjza3y0j3CGO4RMki9oAluycInRw1wQkPildHJ3Bjo0Cbg=
X-Gm-Gg: ASbGncsZkmnhpUSk33rh3TJjsZGf3izEzN0zMLcQQ0ApJMf6cjzdE/BcV+J5KArLPzq
 Hyz/zbrvw8y4JTzc0gvOkaFT7r9wM0wNgD450I/+J7AmACAeEkktnbEzseL8uHhghtH5SGBHrzY
 riSyzbJIYwFkLkvF2V6+gxcI+FJ1GBdj+Zadm/2DSPPJUCj3JwqKAQS4vVBZeVdAYxb40NDkR7f
 sfjeFnagfvDd6PecfBHziYg9I/p9frSyKRgO+lOLGKWFtrdWAawJUUM9EmAEmvEHzZsvc9SwLMU
 gjgiIAa2q4inUoQuX3TWQSyLGBAWMV2pimjUT00FJ+UDeh1VGPYunj7/lovdy5nK20+OCamx6k+
 reoLeNHqdiWjR
X-Google-Smtp-Source: AGHT+IFB1AX8mjv9QI/Wqgw81OBthHGrGT6Vi4R1b+3ml4kSkyvQeK5lsUyn9VR6GCztvJJTNQhqHw==
X-Received: by 2002:a05:6000:4022:b0:38f:5057:5810 with SMTP id
 ffacd0b85a97d-3911f7567c5mr5613840f8f.25.1741269536557; 
 Thu, 06 Mar 2025 05:58:56 -0800 (PST)
Received: from [192.168.69.199] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912bfba8a9sm2149631f8f.9.2025.03.06.05.58.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Mar 2025 05:58:55 -0800 (PST)
Message-ID: <8a185083-0459-4108-bd57-4bae75d871c6@linaro.org>
Date: Thu, 6 Mar 2025 14:58:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/10] disas: Have CPUClass::disas_set_info() callback
 set the endianness
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Thomas Huth
 <thuth@redhat.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org
References: <20250210212931.62401-1-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250210212931.62401-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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

On 10/2/25 22:29, Philippe Mathieu-Daudé wrote:

> Philippe Mathieu-Daudé (10):
>    target: Set disassemble_info::endian value for little-endian targets
>    target: Set disassemble_info::endian value for big-endian targets
>    target/arm: Set disassemble_info::endian value in disas_set_info()
>    target/microblaze: Set disassemble_info::endian value in
>      disas_set_info
>    target/mips: Set disassemble_info::endian value in disas_set_info()
>    target/ppc: Set disassemble_info::endian value in disas_set_info()
>    target/riscv: Set disassemble_info::endian value in disas_set_info()
>    target/sh4: Set disassemble_info::endian value in disas_set_info()
>    target/xtensa: Set disassemble_info::endian value in disas_set_info()
>    disas: Remove target_words_bigendian() call in
>      initialize_debug_target()

Series queued with rth's comments addressed, thanks!

