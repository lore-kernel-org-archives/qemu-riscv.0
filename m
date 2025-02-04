Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CEDBC02193
	for <qemu-riscv@archiver.kernel.org>; Tue,  4 Feb 2025 18:12:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tfNPQ-0004jM-Hr; Tue, 04 Feb 2025 13:12:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfNPG-0004Rb-62
 for qemu-riscv@nongnu.org; Tue, 04 Feb 2025 13:12:19 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfNPD-0007mz-L4
 for qemu-riscv@nongnu.org; Tue, 04 Feb 2025 13:12:17 -0500
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-38da6dde4c0so533133f8f.1
 for <qemu-riscv@nongnu.org>; Tue, 04 Feb 2025 10:12:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738692734; x=1739297534; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y6n4KRzeTHbK4w+XNxVWOELQISpUnvz1D+9zTHfaYRY=;
 b=muh4c5AwFCqdwm3Jh+xqCkUZ5qDh9P9REfPBmE7zr2aV3ZKXPkJHy/sqm89MuJbpqz
 Fc8QxIvrDJGMYbQS85E3TduQTyqtud1MxTM9IRP8WUHysmRXkP6r7N0AYHbjZKZFTSIC
 5ihaGkF+A7NjzT9DSw0hl+MkY8ClvJrAe8Veyqv6TZOkWIDHHzVGv9vI75iFw44EIFxB
 X03CvvZyrfd5GN3QrgJ7sElYfRr2Vk+eyJUT7LX36nzmx6QbVOFJM/OpTIAzZDs6expm
 HtQo5Cuhw5sEW8d/LdTbQ4xuROku5BZdVNhOxTDJ0nK3wvvcGxsLFJAKpe7J0d6oA6UX
 +SZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738692734; x=1739297534;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y6n4KRzeTHbK4w+XNxVWOELQISpUnvz1D+9zTHfaYRY=;
 b=LJeJj5HigQ4+XVycuvnPjXUq/yMK+Wj96FkpCOv+yA0OTfrNpR49JsRujgfZHInvf9
 HFXw2xmCMOjSnsN9RQ4sflA3CcFLGBp3jI7XzOCcQ46XEhDFrNmJoErFIa41Y5Elatue
 rRJW7k9FrW3lQqmH395aFfEoo+vEsC7f9uL4Kx3hWJcoeFyvwOQnAk4bcR+cSMud6VQ3
 QHHtMf1z6qHcr/PihLtHEq0Pp1o+7IEVjnuR4mtoQH0z4VYgPUji3dV3xH3ujz7syC8g
 nX3mjnlLSDRwoAobFxUl8RkkQbDJ1e84YAfAG0aSN2LjBtalj4rzwKTrOQRhorpFHv/T
 /tww==
X-Gm-Message-State: AOJu0YyE+x9dWhCSVaPaFAS+SBo0/TSaEtsQ3OomL7CBalkhdk5t9QCW
 +p6shEQIHvFY5qSkFzSZnMX1i5TBWIrMbKcyM/+sDDntDRJEsrajDC1cTELeg0o=
X-Gm-Gg: ASbGncs4KjebfHx0psGVaD1bCQ1MRSLn7Y32iM5I+Cab3OmgoOnz/nnpIyWcBthtOWE
 UwMB39/UDPgzeHxXSNiHY/fGbvFipdsPM/w+ILmlB0IJzSH/h3qRzlr8cFR8QY744pPf8bg0fJd
 rGMAAiUTurCakmRtbWODHLwT97Gw1d4i2kgfKVl9GfrPoMks3CgglL1uFDCwiwLV4kp8XyaEOgn
 +Xeibrklt4yR9xufm/9a1siLWVOJhhazl4twJg7o8lGjOt7CCXP2jx4bxlCxj2iGyn339gpBiMs
 SwjQdG7LxRCGJgons7wZZNJvlFHXyFX5JKZxzS67RvlSddCaOOhyetql4vg=
X-Google-Smtp-Source: AGHT+IG6c5VXZ9qRf1qq9Q3QP9hhMRgOviUewRn3aO38/wp+yoZPJE7e5PMl2988x9oHzCbu9BD0qw==
X-Received: by 2002:a05:6000:1fa4:b0:38a:673b:3738 with SMTP id
 ffacd0b85a97d-38c519738d2mr23483948f8f.33.1738692733926; 
 Tue, 04 Feb 2025 10:12:13 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e23e6860sm197358125e9.20.2025.02.04.10.12.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 10:12:13 -0800 (PST)
Message-ID: <4c200141-d9c9-4a8f-832e-38f4aeeb0ed0@linaro.org>
Date: Tue, 4 Feb 2025 19:12:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] hw/ppc/e500: Remove empty
 ppce500_machine_class_init()
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org, Markus Armbruster <armbru@redhat.com>
References: <20250204180746.58357-1-philmd@linaro.org>
 <20250204180746.58357-6-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250204180746.58357-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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

On 4/2/25 19:07, Philippe Mathieu-Daudé wrote:
> Previous commit left this method empty, remove it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/ppc/e500.c | 5 -----
>   1 file changed, 5 deletions(-)
> 
> diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
> index 59208da87de..26933e0457e 100644
> --- a/hw/ppc/e500.c
> +++ b/hw/ppc/e500.c
> @@ -1285,10 +1285,6 @@ static void e500_ccsr_initfn(Object *obj)
>                          MPC8544_CCSRBAR_SIZE);
>   }
>   
> -static void ppce500_machine_class_init(ObjectClass *oc, void *data)
> -{
> -}

Hmm I think it is a left-over and shouldn't be necessary in patch #2.


