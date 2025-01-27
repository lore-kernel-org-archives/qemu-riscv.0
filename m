Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46122C02188
	for <qemu-riscv@archiver.kernel.org>; Mon, 27 Jan 2025 21:34:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tcWky-0003px-Lv; Mon, 27 Jan 2025 16:34:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tcWkx-0003pd-N4
 for qemu-riscv@nongnu.org; Mon, 27 Jan 2025 16:34:55 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tcWkw-0004Op-6e
 for qemu-riscv@nongnu.org; Mon, 27 Jan 2025 16:34:55 -0500
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2165448243fso107288995ad.1
 for <qemu-riscv@nongnu.org>; Mon, 27 Jan 2025 13:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738013692; x=1738618492; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=r7gsIIcQvUJ0JH2mAc1rpcS3+SsghCgsaj/oUrn8DsI=;
 b=b/z/5pNEYhYKyR904v5qtOGv5LM+UUdNMoaZsEcu+PqHVhDXvL8suCI2ocqJoChs+q
 vWb0DUrQeUiC9kgnX2Ps4dOtS+2vV35NZM33S0xO3lhXloYKgxFnWZneRmHN0idUF12V
 ChzkNna5c5BIB3HtQnQyYpftrlu27x4F8jwxQZTi0e8cJ2bzezEeIJPpNV2KVbxFgN3C
 vMkXEKfYYDKEyLv2A2LdUvo1HWMmslzlsWMT8Y8/1tTxBbNf0n0Vly3WNfMBjmV9coQH
 sWXbcb9Newd75k7QRKgE4B7lrbzqkBzydxvCz0U3/CZLRr7VNjZXpeDBWFovFujFYreL
 TNqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738013692; x=1738618492;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r7gsIIcQvUJ0JH2mAc1rpcS3+SsghCgsaj/oUrn8DsI=;
 b=IOjPAyb22t+Njvt+PYTN6OqbzwKTzjy4ZgBJWZZU9s++eCZI8FGWS5JfMXV7TtgbBG
 P/1nHjJtm5bhoYs9k5cStjyQrjEZh7yOxS8YTGsej6M3OO2gUGduiMPwaMmIPI2rW74/
 Qu8/DB3SkUX4NLlTrhtuansQoB0fbP4vn2LOpb7veTzXc/b11kYQyKxh06aNdGqEQ2De
 mG0sRoBcSGB4mmFtse7o/f4L/ZNsPQ3pH5FLrhkaws3+caKb3JJKd0BIBodKOHT6FKna
 Zo+XbS0pONMgTxrgu2TJtr2upVsrsYzTosdxESFsBauWZdk7TBWSn+MN6Ya8fjBffcrH
 wwYw==
X-Gm-Message-State: AOJu0YzQodoCz0dsh8bYFwcYc38/r+JF8x/PDCPf1l/KRJekS9s1scVS
 Cpw0k83qdpbgOo0yfB2G1/FvIiNPaVEBv7qILh6HoAziNM+lHURbBjz6sKtPbBg=
X-Gm-Gg: ASbGncvKeTr1lFev4NZq22L8Deo83RpgPhYWbyM5KKTAfeC29Aolj29XbyJQygn4cNi
 aFbEo/HJv9ePMKCbRAgY1bf23lkCJbNyUlQVzeyaD5n5pOKDX7a5pgUK68jnZKm+oPHMFeA7LY8
 ZAY+UXNyOpnZyWhXG1SJKb+0StVfH2DB7hgmcfG3w6yEkFPTNEaIazQxHpcFPNuns5UllEPMML5
 /HyiMTFs8o6uwT9E/Yj2ENkVQ1PzVBsKpeZ1IhE1E4TIf8AMYTULeLIjppXqsISCWHxkN4QHkEt
 +Gc0VozJ/58xrtg7liNhhvXf0/xdodCB44HHJgkH7q8XDrg=
X-Google-Smtp-Source: AGHT+IFzB9K8UbPAWbfGtU2Z6kIZtJm2FU/x805Oyll7oDMqM3Cc3+11FCkGdapSjgqAWgO/4+1VzA==
X-Received: by 2002:a05:6a20:12d6:b0:1e5:dace:693f with SMTP id
 adf61e73a8af0-1eb2144d3f1mr64665975637.4.1738013692166; 
 Mon, 27 Jan 2025 13:34:52 -0800 (PST)
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-ac495d57960sm7049522a12.50.2025.01.27.13.34.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 13:34:51 -0800 (PST)
Message-ID: <3a24e07f-3da2-4798-942d-65d2ec398db6@linaro.org>
Date: Mon, 27 Jan 2025 13:34:50 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] hw/loader: Pass ELFDATA endian order argument to
 load_elf()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20250127113824.50177-1-philmd@linaro.org>
 <20250127113824.50177-7-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250127113824.50177-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 1/27/25 03:38, Philippe Mathieu-Daudé wrote:
> Rather than passing a boolean 'is_big_endian' argument,
> directly pass the ELFDATA, which can be unspecified using
> the ELFDATANONE value.
> 
> Update the call sites:
>    0                 -> ELFDATA2LSB
>    1                 -> ELFDATA2MSB
>    TARGET_BIG_ENDIAN -> TARGET_BIG_ENDIAN ? ELFDATA2MSB : ELFDATA2LSB
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
> Sorry, couldn't find good ways to split this patch...
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

