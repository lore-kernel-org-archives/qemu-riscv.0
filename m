Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D721D1BDF3
	for <qemu-riscv@archiver.kernel.org>; Mon,  4 Nov 2024 20:50:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1t841p-0007Vn-Jj; Mon, 04 Nov 2024 15:50:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t841o-0007VQ-Mw
 for qemu-riscv@nongnu.org; Mon, 04 Nov 2024 15:50:24 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t841n-0003mg-5H
 for qemu-riscv@nongnu.org; Mon, 04 Nov 2024 15:50:24 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43155afca99so35532895e9.1
 for <qemu-riscv@nongnu.org>; Mon, 04 Nov 2024 12:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730753421; x=1731358221; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pMMxOBw2dh19te8EtH8Ezcy3wzinirkjVOWhdgBBZcc=;
 b=AVP50W23rdeUDybfD3+gvwK6s4ZvcklgWN6Da5S4PRIs7SXM+wcPZCs8zbzpyEPqg3
 ZLHSjvvdN2fwDZ7V8GlyvKlE/rQIdkO+Z0ryf0lRWe4fiI0ATGN8R+j3NwMkR0JOByzW
 5OHfPCeJGegj6+p9eM12oIM8E1fM7f5UvcIubJ2pE4vqX0G8d2uHgrScpa/gUnhSIXkd
 GuQ+XFgfrrs3cX2xYPFRHG/ghogO1igOwEvpPSYx1A5j/1Gte0I+Urc1ysQXc/6SiTn2
 IukT47ze/9M/910yqChqI7pB7nfsn7mg9Low1lSqd8BF7GUHFNcJaYaDCk3OOVeoHAHb
 1DIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730753421; x=1731358221;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pMMxOBw2dh19te8EtH8Ezcy3wzinirkjVOWhdgBBZcc=;
 b=M57IV9t48cctcwWF3B9VXX36ux8hwIqUAZ7dnfRIYZ2YiXUhAAZs+wM9rX5Wjk2Uc9
 meWwIRWfz6qrh+PB37bzmB3iBYgO2AkXc8osT1DdCEu2L/KiJ3EsJYXong+cdmbn832U
 Ib/kPROoI3q9wSi8jcebqt/VFeA8bPugrB262ZDr3yAiN1GSjGXlx39NaCLWosENhtn1
 EXleWuKBZZl2/mkrY9+bRc0fzsHUwGx2PjY1b5yMknBU+16QnhL63VjUveJIpPsx15rh
 M6sIUBUHfokoaoAdKwvGcaUegjBV/pqVMpACLhiQQQvZeQyrlM+e/4v56sofH7AZBzIK
 8ITg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV69OTd3zJ10aBTNolGOx2l40IibrPplwZS0VvZrOgKbra6QigUG/6iQtbQIlwfaHirmRqM7WQ8T90N@nongnu.org
X-Gm-Message-State: AOJu0Yzm0QDlvmSF817tdeUtzUD+rb+YLKd1g00dKMxSHYQaAz9LdmC7
 Wi3sJpf4NmsZFu23UaclIavy3JaUj0urQNsGyjrwHAogrcr+6P6TKkDz5MZjx+8=
X-Google-Smtp-Source: AGHT+IE0CZNppMuuiYeNhmcmTQyGJhw5PmF5Sx3MpQB4+LDkChNCshQsFn01HrTYxRYAGTgm77R9tA==
X-Received: by 2002:a05:6000:1865:b0:37d:460d:2d07 with SMTP id
 ffacd0b85a97d-381c7973ad1mr10363456f8f.10.1730753420993; 
 Mon, 04 Nov 2024 12:50:20 -0800 (PST)
Received: from [192.168.69.126] (juv34-h02-176-184-26-5.dsl.sta.abo.bbox.fr.
 [176.184.26.5]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431bd8e7f33sm193810075e9.6.2024.11.04.12.50.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Nov 2024 12:50:20 -0800 (PST)
Message-ID: <b2f85535-3f5d-4045-8b6d-2073639feb8d@linaro.org>
Date: Mon, 4 Nov 2024 21:50:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/char/sifive_uart: Fix broken UART on big endian hosts
To: Thomas Huth <thuth@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org, Daniel Henrique Barboza <dbarboza@ventanamicro.com>
References: <20241104163504.305955-1-thuth@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241104163504.305955-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

On 4/11/24 13:35, Thomas Huth wrote:
> Casting a "uint32_t *" to a "uint8_t *" to get to the lowest 8-bit
> part of the value does not work on big endian hosts. We've got to
> take the proper detour through an 8-bit variable.
> 
> Fixes: 53c1557b23 ("hw/char: sifive_uart: Print uart characters async")
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   hw/char/sifive_uart.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


