Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6041BC48BEB
	for <qemu-riscv@archiver.kernel.org>; Wed, 21 Feb 2024 15:29:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rcoW8-0005tn-1j; Wed, 21 Feb 2024 10:28:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rcoMz-0000sX-9P
 for qemu-riscv@nongnu.org; Wed, 21 Feb 2024 10:18:51 -0500
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rciQI-0007DU-M7
 for qemu-riscv@nongnu.org; Wed, 21 Feb 2024 03:58:05 -0500
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-511976c126dso512086e87.1
 for <qemu-riscv@nongnu.org>; Wed, 21 Feb 2024 00:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708505869; x=1709110669; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7t6mAG1EUDAho6AiXqXIo3jBL8cJhhykuGlPnEoGADQ=;
 b=ygTDFL2J2K1mqisIUn9erLOcSxjnCn1LuFkzrzerCIpMpAHen1lLz23Z7mmHMFw+YJ
 De+P6p2UgNQwjobO1eWN/hZj7xZkLbIxqjXcFgBA8dhoyxaVyrW4WOusmFS2zNBMY+gC
 jlu7BjybmD3+r4Bzl8txKgFE95V2IGV6a4hvYQgMh5pe/DJc+Bn6raYOyua1lk90tXT7
 XT7q1I6dxumkGZ8EIpUQkDM1zTl9xTswgH5lFzgpVXjNcr7x8c0DCdyu4RxMHbzH+wd6
 +M0yBEYbOxlRDQwQTFyRbjTNTWsHjJcy6AexleHf01bvBNJv08fz1AtvIwNiMjaEVh2o
 N3Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708505869; x=1709110669;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7t6mAG1EUDAho6AiXqXIo3jBL8cJhhykuGlPnEoGADQ=;
 b=scQ6pdyO2bXRnPn2GvoZITITveqwJD+xVNgKRka1WhLxjWW9QiuFqHYx6YITNdWSaf
 TGHk9yHmY47MECcoOQLKLCv48gUWxKOsBy0rU5OaGMFjUZnY0K6DR4Z5tmgDZZmieyA7
 pq9gUr23AlbwX027F5jWSwYwLL3GZVuOYLiX/0V7GqRa3sypj+w9mn3wpbLK3ArUH3ls
 YPdNkzYg36adFlx5jrsTj/ldMCliD/qK5Z3T3gI5hOENKPCzNWofeBtRhSNStQACueBr
 awIG8J4wjQvzJwifRhjQM3tGgPjGE0XzcZrJ1+Tahuf5o2VdjWp+awstN5XVyA9BaxdP
 Nkmw==
X-Gm-Message-State: AOJu0YwFAWhND/HnChP9Z+iDFBqbxVFwKCvY43oZguD+SVbThOWb3dOT
 bzdRorVfi01yIw1FBwIcfOl5twjcRIIpjRoy7nE6Qpiv0TiVYjh42nCZpZQVhMs=
X-Google-Smtp-Source: AGHT+IFBadK8X+1K0lQAkzgEncKrCdTlQRXYF6Q0eJCswNub8cCSL9RsOZOGIYwZ8AWwIJ3JW5ptTQ==
X-Received: by 2002:ac2:546c:0:b0:511:6a0b:1035 with SMTP id
 e12-20020ac2546c000000b005116a0b1035mr10899639lfn.17.1708505868761; 
 Wed, 21 Feb 2024 00:57:48 -0800 (PST)
Received: from [192.168.69.100] ([176.187.211.159])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a05600c298100b0041069adbd87sm1760797wmd.21.2024.02.21.00.57.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Feb 2024 00:57:48 -0800 (PST)
Message-ID: <8289a482-4717-4b46-82b9-b4a1cb6070c3@linaro.org>
Date: Wed, 21 Feb 2024 09:57:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/7] trans_rvv.c.inc: remove 'is_store' bool from
 load/store fns
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org, max.chou@sifive.com
References: <20240221022252.252872-1-dbarboza@ventanamicro.com>
 <20240221022252.252872-3-dbarboza@ventanamicro.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240221022252.252872-3-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 21/2/24 03:22, Daniel Henrique Barboza wrote:
> After the 'mark_vs_dirty' changes from the previous patch the 'is_store'
> bool is unused in all load/store functions that were changed. Remove it.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/insn_trans/trans_rvv.c.inc | 69 ++++++++++++-------------
>   1 file changed, 34 insertions(+), 35 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


