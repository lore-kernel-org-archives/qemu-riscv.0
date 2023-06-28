Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2156AEB64D7
	for <qemu-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 06:43:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qEOtI-0000Rv-9L; Wed, 28 Jun 2023 02:43:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qEOtG-0000RN-MH
 for qemu-riscv@nongnu.org; Wed, 28 Jun 2023 02:42:58 -0400
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qEOtF-0008Km-16
 for qemu-riscv@nongnu.org; Wed, 28 Jun 2023 02:42:58 -0400
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2b6985de215so56655691fa.2
 for <qemu-riscv@nongnu.org>; Tue, 27 Jun 2023 23:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687934575; x=1690526575;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=M1xAJ0pk+7OhNoSCVNG8ARMKIScywqlsC5HPzuwn/Io=;
 b=y+Izicx0b6D3Exio7iQVsx2qU0/ydOR0BqLZNHOqUvOAWTfjAp+xyFJ2ZYF7kmjInH
 at0EIge6wK3AYZLWRlyGAcgEZIi2kZPGfofzb2jgvAw3T79AcgKpaBn/YUpp3U8XgcjE
 tFXmuKVr9DMpRt2pW7R6JnMhcLiWm4gntVlL/5rsCVdOQ1gdGCO66a8iaxiNJSNPs3Jb
 0oV4UY/piNjB2EY+GEDnLcqYxlhL7GhXcyaDRCgQu6Ucw5wihRPPKKxf+zyktjVgqIAf
 Cd32z/rRwKmPbaeCsPzLI4AfRUQLzE3XTGwwPwkBkASFaV7unYhsMkAFlx6RdsyqAyTi
 AxcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687934575; x=1690526575;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M1xAJ0pk+7OhNoSCVNG8ARMKIScywqlsC5HPzuwn/Io=;
 b=A/xr3zlORfiG5FGjBnFNsbxG5rsk0U7BR+kKPneAVgfYT/JVK/caQWBy1vFW6Q54wU
 ow9RUqR78x0UiuEivIFsCRWzpe2knl6dKkWiYZLjI/FcRbpeipFr3UuX17924rxeJ4nw
 uo/4fepRmrStUqAJAQ80bp7qOmq8xasMLld7mddDQo5TQPC6wEAiUVhm95HMkVzpLY5q
 jy08U9c89yBnjK4wXwJsTnAYaQHAzZn11S5CKxDGAjw/ww9F00WtfHvGnhwRDu/chDy8
 6q7ZkOYBqYMh6Z0wD6nUzihDGMcR5dZTx6HeqQduCgR7z6NksAG88z19FO+VsirqdJAP
 qtsQ==
X-Gm-Message-State: AC+VfDwZXiuNT+Vxh9DZe0aPylGwFZdT/gxiZiC0IIi2+M1wSXxSjxZq
 yd+N1y+IAyw/Cxm/+M2FbFaWEA==
X-Google-Smtp-Source: ACHHUZ790nxaJWDjBmbx94ZDumUJNvx3IQLEXw1wavHvNTC7W6Tv3cegdZOmUNRKojb+3Plsj6XrKw==
X-Received: by 2002:a2e:7306:0:b0:2b6:9930:871 with SMTP id
 o6-20020a2e7306000000b002b699300871mr6179927ljc.13.1687934575116; 
 Tue, 27 Jun 2023 23:42:55 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.207.229])
 by smtp.gmail.com with ESMTPSA id
 c1-20020a056000104100b0031402a910edsm3108466wrx.86.2023.06.27.23.42.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jun 2023 23:42:54 -0700 (PDT)
Message-ID: <e4655be5-311a-e2b3-d134-11aa29bb4dff@linaro.org>
Date: Wed, 28 Jun 2023 08:42:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v6 2/3] hw/riscv: sifive_e: Support the watchdog timer of
 HiFive 1 rev b.
Content-Language: en-US
To: Tommy Wu <tommy.wu@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 jim.shu@sifive.com, frank.chang@sifive.com, liweiwei@iscas.ac.cn
References: <20230627141216.3962299-1-tommy.wu@sifive.com>
 <20230627141216.3962299-3-tommy.wu@sifive.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230627141216.3962299-3-tommy.wu@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x236.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.103,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 27/6/23 16:12, Tommy Wu wrote:
> Create the AON device when we realize the sifive_e machine.
> This patch only implemented the functionality of the watchdog timer,
> not all the functionality of the AON device.
> 
> Signed-off-by: Tommy Wu <tommy.wu@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>   hw/riscv/Kconfig            |  1 +
>   hw/riscv/sifive_e.c         | 17 +++++++++++++++--
>   include/hw/riscv/sifive_e.h |  9 ++++++---
>   3 files changed, 22 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


