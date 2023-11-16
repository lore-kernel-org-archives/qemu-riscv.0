Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E3EC197A0
	for <qemu-riscv@archiver.kernel.org>; Thu, 16 Nov 2023 07:54:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r3XCT-0005py-VM; Thu, 16 Nov 2023 02:54:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3XCP-0005fX-Qp
 for qemu-riscv@nongnu.org; Thu, 16 Nov 2023 02:54:06 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3XCB-0001Ie-C7
 for qemu-riscv@nongnu.org; Thu, 16 Nov 2023 02:54:04 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40859dee28cso4130145e9.0
 for <qemu-riscv@nongnu.org>; Wed, 15 Nov 2023 23:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700121229; x=1700726029; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bRfQ6Fok2eTonPLBPNc1tqXnMZnV+oCGWm5xG6hbQnY=;
 b=O5/p+DDU04Ujp6kmbQV/U3QlfeYwyZ87+hgETiR/2UP3jiBUv6BDwBZKmk7phHTr4B
 koFwBEcFrta71NIty0+g+B84zLbw0PnQhpH+OHbrVnM9QrzkJhsLmzMpMLaEwr1AYgBn
 DG/ym2+Del0So83Zh/MZQGyDdTBEA5OfSDXqzeb0BriVmOtUFbEfmMQubglKyRKfS4rV
 KtijaRagX5LUPTu72wwsj3PYPeVuZJwOE3fC/5FwkCaGguen1pv8MACLvGlAIoQPu5xr
 ZgGVvs7u2aXEsuHGAZhIP7kJcSvxqwUuLXct02EcVYG4O8BQ245D6tRE/I4iAaSOu7WU
 Pnrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700121229; x=1700726029;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bRfQ6Fok2eTonPLBPNc1tqXnMZnV+oCGWm5xG6hbQnY=;
 b=n3HkbqbS3v/Qbxpp+HfgRnY/JqmkYtvl3PPyLIGHIBWyFyUPc2O2JMptNIWG2aMFHF
 vjh+m2O+WAZyDCQluKkaNgMD2ZKIXGjhn2SvcZ7APDyt+3hEOzbjsRqLeZxGVhCPWum/
 VF4c8Clbae3Ya8xwNLoLmd+L+Ia3noVSVIloMurxY0bcGOAFBzFeqk8sB69yZLnjZyvv
 ajsKDH0m0J4ynCqjv8nSTUxti+86SFFa+DdCxH7O3UZ0hq6qnZBTbLQMaGvrKQAY1Pot
 84Pcx3oCjp/zqLcHbOo92mET4fCMMUPV5FyHoAzR8cjkka2skzIceWr1YRTsc9CWU+7h
 HxAQ==
X-Gm-Message-State: AOJu0YwbFk4sZjUrxVn6DW8n3zwkLBOZeX3zHNam1QNTKlLIeKwGPOOz
 SKlJ+t28LYSMFptcVyCwb8ro7Q==
X-Google-Smtp-Source: AGHT+IFZGpUdGuuqbBwtsY6CGbZ7EyuMYWfYjxDB/ZCgCpSP7mokGRyzZOU8p7pz9XcJY6wo6gfgEw==
X-Received: by 2002:a05:600c:4f4a:b0:40a:4432:6b01 with SMTP id
 m10-20020a05600c4f4a00b0040a44326b01mr12410764wmq.20.1700121228896; 
 Wed, 15 Nov 2023 23:53:48 -0800 (PST)
Received: from [192.168.69.100] ([176.187.220.205])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a056000024400b0032fb0e2087asm12582889wrz.82.2023.11.15.23.53.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Nov 2023 23:53:48 -0800 (PST)
Message-ID: <2858cbe4-8c5e-4712-a744-b318b301f922@linaro.org>
Date: Thu, 16 Nov 2023 08:53:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/31] target/mips: Use generic cpu_list()
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
 <20231114235628.534334-16-gshan@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231114235628.534334-16-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
> Before it's applied:
> 
> [gshan@gshan q]$ ./build/qemu-system-mips64 -cpu ?
> MIPS '4Kc'
> MIPS '4Km'
> MIPS '4KEcR1'
> MIPS 'XBurstR1'
> MIPS '4KEmR1'
> MIPS '4KEc'
> MIPS '4KEm'
> MIPS '24Kc'
> MIPS '24KEc'
> MIPS '24Kf'
> MIPS '34Kf'
> MIPS '74Kf'
> MIPS 'XBurstR2'
> MIPS 'M14K'
> MIPS 'M14Kc'
> MIPS 'P5600'
> MIPS 'mips32r6-generic'
> MIPS 'I7200'
> MIPS 'R4000'
> MIPS 'VR5432'
> MIPS '5Kc'
> MIPS '5Kf'
> MIPS '20Kc'
> MIPS 'MIPS64R2-generic'
> MIPS '5KEc'
> MIPS '5KEf'
> MIPS 'I6400'
> MIPS 'I6500'
> MIPS 'Loongson-2E'
> MIPS 'Loongson-2F'
> MIPS 'Loongson-3A1000'
> MIPS 'Loongson-3A4000'
> MIPS 'mips64dspr2'
> MIPS 'Octeon68XX'
> 
> After it's applied:
> 
> [gshan@gshan q]$ ./build/qemu-system-mips64 -cpu ?
> Available CPUs:
>    20Kc
>    24Kc
>    24KEc
>    24Kf
>    34Kf
>    4Kc
>    4KEc
>    4KEcR1
>    4KEm
>    4KEmR1
>    4Km
>    5Kc
>    5KEc
>    5KEf
>    5Kf
>    74Kf
>    I6400
>    I6500
>    I7200
>    Loongson-2E
>    Loongson-2F
>    Loongson-3A1000
>    Loongson-3A4000
>    M14K
>    M14Kc
>    mips32r6-generic
>    mips64dspr2
>    MIPS64R2-generic
>    Octeon68XX
>    P5600
>    R4000
>    VR5432
>    XBurstR1
>    XBurstR2
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>   target/mips/cpu-defs.c.inc | 9 ---------
>   target/mips/cpu.h          | 4 ----
>   2 files changed, 13 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


