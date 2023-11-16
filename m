Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CBA5C54FB9
	for <qemu-riscv@archiver.kernel.org>; Thu, 16 Nov 2023 13:33:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r3cTv-0006cd-GJ; Thu, 16 Nov 2023 08:32:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3cTm-0006RV-Gm
 for qemu-riscv@nongnu.org; Thu, 16 Nov 2023 08:32:24 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3cTk-0003hb-Qn
 for qemu-riscv@nongnu.org; Thu, 16 Nov 2023 08:32:22 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4083dbc43cfso5717165e9.3
 for <qemu-riscv@nongnu.org>; Thu, 16 Nov 2023 05:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700141539; x=1700746339; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=E2y8hUSUjJmGrsvpGRoq6+3jNLGfGx94GWr64TZCVx4=;
 b=MLA9bLLpfINhk2BiQguYR1ARUo5i0M5eh3JvWOHIGWpxdBpeBOF7dpSm60KnXWD1Az
 i8YpZ6bUy2oWiRHJR1Xy7xeg3v2B4FfI0rk3jtGS1gOy+jvAbPDgJcKIJLKIGNwoHcu2
 kcG2/E1RpDqCoq4q8NKLi3eQ1ja7DMVtmAq0KSGb8CeCyvdZyGS55a74ykuC6r5PCjS2
 YuYCfC35KNYw5oMbCbfrEKaKisJ75UEWhfUX//UaSkoidllwEdaRsnxFw78G+XZe/w/d
 JK3HrNEK48zYn2BwK+5/a+S4IH18nQue1T4mGkXCCa9pDyAxL+ZD8DiEOk1wJVTQI+0E
 zdoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700141539; x=1700746339;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E2y8hUSUjJmGrsvpGRoq6+3jNLGfGx94GWr64TZCVx4=;
 b=uJkEmKsY/0B9TQAhv2mXYvqgPIEAirGVkP7CJITXIfJ0xxOOX8scdD6vwGJvT8Oenk
 NWFamo66CZOBjA3Sm5CtPFya8rrF71NoLRzl6RYr0iL72QnGvJ3zmfDVyDk/R5ct56mn
 auyB/P5C2mCx0DvBd8sQv7irsCTXgW2HSHPeGIS1Tc5DduxqS4M/31SkiI8p9K+4NNAt
 BsJ32Fz1maRMCWm71qhjkygblvsvu1/mhNw2oVJzvq3NF3Eo38rsEHeemqW/CuSxwbF8
 oIhNEc+7xovI+TEIfGqgOHp1f0k/AfX+4nMoXt54W+RNQ/P3a90lNIdFAOybgNubMi/o
 AAHg==
X-Gm-Message-State: AOJu0Yw4GFyyaeXAKoSOZ5t6Ud/RkY6ZVMoSXCU3CG/sa48uDsuPAAk9
 fYh/4OjK6yEg0kWIjBxoYlGEUg==
X-Google-Smtp-Source: AGHT+IFaE+aGTz7PBKmWgt/JA0/7E1YB+1ME+ohHsXp81dTPu3Bw3R2zC1C5lDneGQPkHtGpXagmPA==
X-Received: by 2002:a05:600c:3596:b0:408:4160:1528 with SMTP id
 p22-20020a05600c359600b0040841601528mr12797808wmq.30.1700141539198; 
 Thu, 16 Nov 2023 05:32:19 -0800 (PST)
Received: from [192.168.69.100] ([176.187.220.205])
 by smtp.gmail.com with ESMTPSA id
 d15-20020a05600c34cf00b0040a4cc876e0sm3692072wmq.40.2023.11.16.05.32.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Nov 2023 05:32:18 -0800 (PST)
Message-ID: <9632567a-3340-4a18-affd-de8caeecb2f9@linaro.org>
Date: Thu, 16 Nov 2023 14:32:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 22/31] target: Use generic cpu_model_from_type()
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
 <20231114235628.534334-23-gshan@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231114235628.534334-23-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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
> Use generic cpu_model_from_type() when the CPU model name needs to
> be extracted from the CPU type name.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>   target/arm/arm-qmp-cmds.c             | 3 +--
>   target/i386/cpu.c                     | 3 +--
>   target/loongarch/loongarch-qmp-cmds.c | 3 +--
>   target/mips/sysemu/mips-qmp-cmds.c    | 3 +--
>   target/ppc/cpu_init.c                 | 3 +--
>   target/ppc/ppc-qmp-cmds.c             | 3 +--
>   target/riscv/cpu.c                    | 3 +--
>   target/riscv/riscv-qmp-cmds.c         | 3 +--
>   8 files changed, 8 insertions(+), 16 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


