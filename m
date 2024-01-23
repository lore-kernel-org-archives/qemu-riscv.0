Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AADBFC47DDB
	for <qemu-riscv@archiver.kernel.org>; Tue, 23 Jan 2024 05:43:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rS9Yk-0003iH-LE; Tue, 23 Jan 2024 00:42:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rS9Yj-0003hV-8M
 for qemu-riscv@nongnu.org; Tue, 23 Jan 2024 00:42:53 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rS9Yh-0007XV-Fc
 for qemu-riscv@nongnu.org; Tue, 23 Jan 2024 00:42:52 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40e76626170so44290925e9.2
 for <qemu-riscv@nongnu.org>; Mon, 22 Jan 2024 21:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705988569; x=1706593369; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ttf/iRoFnInREDH8ZgG2eVL3+i2zeTo5X3wAhxaomzw=;
 b=UBL/xv0nkIO/MLf9FsgCP0TPL/kU+W8YEsCrdu3SoNURhRVKehVhU/f7MNWP0PSQDg
 aZv1ZR2qehdbFpHWinkLfNT6jAe6PizoEXN/dfV4RHqeydWZ2//hR2FHF2uqI2GaOyeA
 P5O1wonj2LoLJ5jLQSxcdpasiur7/2NA0+iKPJGYWnaw+olxI/QFrPTWd+caEGnL/0Rr
 HJj/Cofiqs7CReuCwmnAdZiHxiQUgz7sW7tEpyQzbIEacUORR7gRWeilQNZJbHff3Tx7
 uRQgzZ3NkOAdMFukycqN4ySlgvWT98ZdQi02iqV5xgQyyhLLjIm4Q8NcY2uFiZRWKY8d
 kxWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705988569; x=1706593369;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ttf/iRoFnInREDH8ZgG2eVL3+i2zeTo5X3wAhxaomzw=;
 b=jJUDelxzT9V7jalDYUwafUVLozcFr+fHL9AZGa2+s9FfFeMc2mIp5FmWX1J7nVN12Y
 N2O/NJgIUfrjTDbBPAAyaxTUQeLQw2RVsiruU6XY9Fph1IufWTpiyQcffUM2xdqxQbzo
 9zqA2+tyfUGSnsQbWZpjIDgmIIvHR/GiQ1WJjZ5zbRsfXRPk9VnbQgYt4UjMhV0xbkUs
 HqPdj7pBb34SHy2RqC2boydcr1OPy3VZFqHS3UhnkIdroFEV3xzbAaT+MkkXEMUpHY4k
 pKpq1ZNitMieRjkQS3aVnS6HPtIW0rrvDHJs1kUywJNIY1oqQaQ7yfzIt9L2BxVA/ASd
 254A==
X-Gm-Message-State: AOJu0YzFUK6gGpKlAvaOUBQopmzchx+q+jWvjXkUj8KZKcsaHiMBjHMO
 S+2nbC+6+AXqQFJMjrzR0cI1Ek8Ccftew6s0FdfhJpKd8yq2zDxqmdlGMPzY02M=
X-Google-Smtp-Source: AGHT+IHSEbfW4CUNHhkf4qJaEgXe+zcg+bE/q7swmJK73FIGfn59Xg4j7H0KzlH+9AKmc3j/6n/Bsg==
X-Received: by 2002:a05:600c:4b99:b0:40e:5abe:84d4 with SMTP id
 e25-20020a05600c4b9900b0040e5abe84d4mr189462wmp.68.1705988569498; 
 Mon, 22 Jan 2024 21:42:49 -0800 (PST)
Received: from [192.168.69.100] ([176.187.194.78])
 by smtp.gmail.com with ESMTPSA id
 m35-20020a05600c3b2300b0040e541ddcb1sm41322468wms.33.2024.01.22.21.42.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jan 2024 21:42:49 -0800 (PST)
Message-ID: <144fc09e-fa3c-4a6d-a724-a46e434fc5f8@linaro.org>
Date: Tue, 23 Jan 2024 06:42:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] hw/riscv/virt.c: use g_autofree in
 create_fdt_socket_cpus()
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
References: <20240122221529.86562-1-dbarboza@ventanamicro.com>
 <20240122221529.86562-4-dbarboza@ventanamicro.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240122221529.86562-4-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

On 22/1/24 23:15, Daniel Henrique Barboza wrote:
> Move all char pointers to the loop. Use g_autofree in all of them to
> avoid the g_free() calls.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   hw/riscv/virt.c | 12 +++++-------
>   1 file changed, 5 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


