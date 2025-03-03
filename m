Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F769C282C5
	for <qemu-riscv@archiver.kernel.org>; Mon,  3 Mar 2025 10:04:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tp2f8-0008AE-FB; Mon, 03 Mar 2025 05:04:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tp2f3-000890-1o
 for qemu-riscv@nongnu.org; Mon, 03 Mar 2025 05:04:34 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tp2f1-0002m7-Fs
 for qemu-riscv@nongnu.org; Mon, 03 Mar 2025 05:04:32 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43bbc8b7c65so8848425e9.0
 for <qemu-riscv@nongnu.org>; Mon, 03 Mar 2025 02:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740996261; x=1741601061; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=F5xci5jkvGoBu00Xu5PYLiB6b9yJDooqphwzmPuqKxw=;
 b=Ndpn8FMUBOqa01SYYno7XGHZR5HWELwCIcRW63zDd17NFpqlz/FvqUrSgTXNGL2Mf1
 iD1Y7iwBTh0NoWqJlC6aquwwkzCwiuwRtFdwWHHBdBMYeIf7Xy2x+LKYJxQNeQP3Qo7V
 UGKPelQXgub82QE5GLr4BWOpdZ70lwLDPOzfdCfqr7a0Y7aBW6tXCFavQAxPp9EeKVh4
 5uLihWkZQ4/WrzjSnSc7RH+J6ST3jpGiaG1OJbV7JRTQkREaUFmVjOzuv5JJKZLz9w05
 0PZWDcQKhXQlKuM4cxOCQnzZFDm7cSYfHlb7FYXllFozZ+ZeVDxaCFz810+IvtVEmnbx
 16Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740996261; x=1741601061;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F5xci5jkvGoBu00Xu5PYLiB6b9yJDooqphwzmPuqKxw=;
 b=mlpZx7/mOErz1zIUWWrO9aYLrylbwJszaLUV4tz5XAfNo3vytCz2q0BL1Iqd+RT1fT
 7HjcTUXtllyKy8Zk/vc5pXC5nAumrB5P18aRpQ0cBiVhqNVbmrkzTru0VFFFEyWxky14
 /cehKfVmcO8WCnpgNImYdz9XUYE+KmevrWIAf4U0tVmbekju0P6WH0WkpXTAotScTqDQ
 TYVSP3MrsU9XIMkUD+RuF3RzL6ahjaWFnKRxdBBWPgfc4I+eawEoyzyijFBdpnDr+nwL
 gzf6Ir/Z0ZUCn6lpfr3aF81StcbmU5XBc+mnYS6jxFTlL5JAwlEtrPicmxjctAS7TLdu
 PkIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV27aefQG+6nAVWuuxSmTLIOdvTTteeGT5cGQX1SszKBfjCatnUurKU+xgvhdkp6I2E2ku2SP7vgLqu@nongnu.org
X-Gm-Message-State: AOJu0YzZ36wLdl0HGRj9touxZbSUGONAGwprLVb7WT7v3ZI2vS1h/RxH
 L8Y3ejGvsM6/UYYqEJCM0a8W3Jm085Jt3+lxdA9vksEKUeJzADJd5LWOMZr/3LQ=
X-Gm-Gg: ASbGncs7DY1hpLTsvHKytUc229mpsZBRWZJA3oVlhY3xJp6qHeUpTeLWJMrrXW4SPPB
 E/heS1m2LKp9CHF0uUG78dm7PMK9XcKJOSGk/lggOSgJjJF5EbaVQUYhDIdqDTZEtuHmabqJr9Y
 JazyTvHGCY/TSuDj0/tC8imy57mqZEHNub/IFJOALJUxeRkKpmjjc3qUiUcwJRL0VFWnWo9dq+Q
 XF41vajPx6PwqJvgz8yCXDDdL9R7+y8wVXEsNa3tIEtj+9n0prF/3w2v+h0u6D5kLLW+RPr6ePt
 QuRsbJNzoHwjjU2MK0EaUvg9db478t05jA5kejIN44+vx4u7oVGUbbj//7YLrT/wwFTbfDuVyHE
 KLDvfdxY5Pd8K
X-Google-Smtp-Source: AGHT+IGCYgYOmJhhbVT7jU5lZWOrQH108rQzhmL8DtR4YGcNGej4J0nftIJRPOZTRyj/SHJhC4aHjw==
X-Received: by 2002:a5d:5f84:0:b0:390:e9e0:5cb3 with SMTP id
 ffacd0b85a97d-390ec7cd28amr12517735f8f.12.1740996260819; 
 Mon, 03 Mar 2025 02:04:20 -0800 (PST)
Received: from [192.168.69.199] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e484486bsm14070386f8f.65.2025.03.03.02.04.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Mar 2025 02:04:20 -0800 (PST)
Message-ID: <95ddeebf-bb6e-428f-80d0-cbcf14d80df1@linaro.org>
Date: Mon, 3 Mar 2025 11:04:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/char: sifive_uart: Free fifo on unrealize
To: Alistair Francis <alistair23@gmail.com>, palmer@dabbelt.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, qemu-riscv@nongnu.org, chigot@adacore.com
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
References: <20250303023120.157221-1-alistair.francis@wdc.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250303023120.157221-1-alistair.francis@wdc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

On 3/3/25 03:31, Alistair Francis wrote:
> We previously allocate the fifo on reset and never free it, which means
> we are leaking memory.
> 
> Instead let's allocate on realize and free on unrealize.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>   hw/char/sifive_uart.c | 44 +++++++++++++++++++++++++++----------------
>   1 file changed, 28 insertions(+), 16 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


