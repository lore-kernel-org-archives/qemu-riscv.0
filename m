Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82779C197A0
	for <qemu-riscv@archiver.kernel.org>; Thu, 16 Nov 2023 07:52:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r3XAE-0001jc-TQ; Thu, 16 Nov 2023 02:51:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3XAA-0001Zo-P1
 for qemu-riscv@nongnu.org; Thu, 16 Nov 2023 02:51:47 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3XA9-0000gw-5f
 for qemu-riscv@nongnu.org; Thu, 16 Nov 2023 02:51:46 -0500
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-32f7c80ab33so360699f8f.0
 for <qemu-riscv@nongnu.org>; Wed, 15 Nov 2023 23:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700121104; x=1700725904; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fGPIIo+oWgUbTH02UBSRyk9mwsyIl/36Lb2JEBEbS7Y=;
 b=nbaH0u6a19VXMxC2NNTg9W5+SM+go8s8spLW/LOqqnPgdVwNwgIDk1iipArc2MSGFf
 CjmHyMTMa94gsJTJqX3IGNKbJ6ENUWaIYqzJC9gOLtEb9z8yZKVDRN0Nkwyz1BBYnQ9a
 dow3S3yXggP6T9hP/Ul0yM4aDpZ21/KR7opE01ZxWa4gbpggfRRKcUhhNs10I3GbKWu5
 LTYt1i1WsPZQQSRujSyWpqHH0vTGydIAJBiq1ze0o4BU3afWSbp+t8WHnyKCeOkGZFwu
 SF0FtqU9SYvhqCNaP7TteWAQ0tqpGqgBN+aVgRMC7OFYMcTWr368sHA9vu7NRJXxr+/t
 MyaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700121104; x=1700725904;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fGPIIo+oWgUbTH02UBSRyk9mwsyIl/36Lb2JEBEbS7Y=;
 b=ltDaB+ribCuOi9ucE8fTXlpL8c4tXl++wG/IGRep8sTZsEI1F7tA4Wvqd0UOGi3rNM
 iQvFGf8LROlSKspDdJ14HsBFQh+lY4mnze3/LfT908yhfWm/e/u4I4eySXcESVx1EpKA
 0jL9h7i9Z7JX9eYubELqJtdEkAE1TC2p0CoauWJKNKvvL2XsB/dEBHM57pN5MpK9voMd
 TtZ05aiLueE8zCD30Wnmz9QB6Ec92CZxbSGBbbk4diOzkAIvG6UxCsATTz8yzSzwp0xa
 wU2VnK9vF13HZxyyRePR67FNW02U3VYAgk3y+YZEitzCnmTT8hA3/jbFwjswpaNXzBY6
 Ps8A==
X-Gm-Message-State: AOJu0YycnUqiKjbLy3mQtMqrVNcCuWZ5ELWN5JsuJZAr7btw0THg8Di9
 bifab9f/Y/C708qGcc7NtBq6KA==
X-Google-Smtp-Source: AGHT+IFaw+qaF9TAlYNqCmSBQ1ddepFKfbYNwb3dbHrKLcMqAvRgE4EtE4FBmShMA35PuoZQif20aA==
X-Received: by 2002:adf:e685:0:b0:32d:9541:b1e3 with SMTP id
 r5-20020adfe685000000b0032d9541b1e3mr8930365wrm.26.1700121103683; 
 Wed, 15 Nov 2023 23:51:43 -0800 (PST)
Received: from [192.168.69.100] ([176.187.220.205])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a056000024400b0032fb0e2087asm12582889wrz.82.2023.11.15.23.51.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Nov 2023 23:51:43 -0800 (PST)
Message-ID: <1ade7285-7f0b-406e-9d8f-8386da038087@linaro.org>
Date: Thu, 16 Nov 2023 08:51:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/31] target/arm: Use generic cpu_list()
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 imp@bsdimp.com, kevans@freebsd.org, richard.henderson@linaro.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, imammedo@redhat.com,
 b.galvani@gmail.com, strahinja.p.jankovic@gmail.com, sundeep.lkml@gmail.com,
 kfting@nuvoton.com, wuhaotsh@google.com, nieklinnenbank@gmail.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 laurent@vivier.eu, vijai@behindbytes.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, mrolnik@gmail.com,
 edgar.iglesias@gmail.com, bcain@quicinc.com, gaosong@loongson.cn,
 aurelien@aurel32.net, jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com,
 chenhuacai@kernel.org, shorne@gmail.com, npiggin@gmail.com, clg@kaod.org,
 ysato@users.sourceforge.jp, kbastian@mail.uni-paderborn.de,
 jcmvbkbc@gmail.com, shan.gavin@gmail.com
References: <20231114235628.534334-1-gshan@redhat.com>
 <20231114235628.534334-9-gshan@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231114235628.534334-9-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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

On 15/11/23 00:56, Gavin Shan wrote:
> No changes of the output from the following command before and
> after it's applied.
> 
> [gshan@gshan q]$ ./build/qemu-system-aarch64 -cpu ?
> Available CPUs:
>    a64fx
>    arm1026
>    arm1136
>    arm1136-r2
>    arm1176
>    arm11mpcore
>    arm926
>    arm946
>    cortex-a15
>    cortex-a35
>    cortex-a53
>    cortex-a55
>    cortex-a57
>    cortex-a7
>    cortex-a710
>    cortex-a72
>    cortex-a76
>    cortex-a8
>    cortex-a9
>    cortex-m0
>    cortex-m3
>    cortex-m33
>    cortex-m4
>    cortex-m55
>    cortex-m7
>    cortex-r5
>    cortex-r52
>    cortex-r5f
>    max
>    neoverse-n1
>    neoverse-n2
>    neoverse-v1
>    pxa250
>    pxa255
>    pxa260
>    pxa261
>    pxa262
>    pxa270-a0
>    pxa270-a1
>    pxa270
>    pxa270-b0
>    pxa270-b1
>    pxa270-c0
>    pxa270-c5
>    sa1100
>    sa1110
>    ti925t
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>   target/arm/cpu.h    |  3 ---
>   target/arm/helper.c | 46 ---------------------------------------------
>   2 files changed, 49 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


