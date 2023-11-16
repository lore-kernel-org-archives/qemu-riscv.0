Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE5BC54FB9
	for <qemu-riscv@archiver.kernel.org>; Thu, 16 Nov 2023 07:55:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r3XDs-0007wj-WD; Thu, 16 Nov 2023 02:55:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3XDr-0007qZ-6Y
 for qemu-riscv@nongnu.org; Thu, 16 Nov 2023 02:55:35 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3XDo-0001nz-60
 for qemu-riscv@nongnu.org; Thu, 16 Nov 2023 02:55:34 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4083f61322fso3585005e9.1
 for <qemu-riscv@nongnu.org>; Wed, 15 Nov 2023 23:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700121330; x=1700726130; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eeAclw7QmKClKGXsAkhYu6vVMcQf+GGL62FWZwi1uU8=;
 b=Lpz5e+5Sr84DfWxzHuBJBEhgnZyfS8uRPCEHLTBCN4ncJb8L3OMLYldTQ4qjWO97B5
 syTr01J73Yq860D20+b0zG81dzVd7yl7Z7F16X1nb+PHAV781byYsNBgQbpSaH0cLwlG
 38baAgOBffK8rnj9w3CuUgfHcqhlvDuWOaP4PKHZ6Rbc61m2x83dRiTQUiX75M+nqgs4
 fCS8iDJZvTEUOMfp9bDtOxCw2MnmVcUx6F6cGrZ6gBJqcAIYy2rlTdbukZW++UVQ55OL
 A8/yFYjFk5rSkdwHFfD1XG45RfEA82G5rwemQ0kECNL8BgLSZo1ibFv7rHKTDj4+pkjP
 OifQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700121330; x=1700726130;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eeAclw7QmKClKGXsAkhYu6vVMcQf+GGL62FWZwi1uU8=;
 b=ehriAr2EFLuDyHlJGn+TRKBCxkd7DnPSKSS6le6zYo2zK+oROcBw8FY3cnXiIkhjCV
 noXVf/ztgZkyq5QWs4Vztv1kXZ1gxcEJxXnlki0Xh0jXflEzSNuTIM/2Agl1Hphh/F8f
 jCqgQJOfKAOmo+QWpQTCwx00+qkpNWR42dXsIrAG0MpP4dj5eN91wNMaVXv3hWYjLY5M
 fiqmqrnJBnEAF7Mm7w1ZUfhpLDg0RhPUxC61c5LiWTTx57uOvG1uU6j8SmO08pfC6AjG
 5MQnolr2LNJ+g4UNMHWA4UISQ/8JUK2krQxO8UyoIvYtlOWUVJGphyFp4FNpeYqIOS7W
 bd0w==
X-Gm-Message-State: AOJu0YxBdu9/i73gQEGmRj2zluWDL0lgzqBmHeoliyFj6idwsUA3Kwz0
 XDnrS0JEirOgsSilHnKduLNj3g==
X-Google-Smtp-Source: AGHT+IHV1Mx7vFnFrAt+cHZsmYEZhVCpjkEFZxUytNbJGmKtYCCuUkQe2V1zDK15xisxlQrxC14bQg==
X-Received: by 2002:a05:600c:450f:b0:40a:4b4e:2b32 with SMTP id
 t15-20020a05600c450f00b0040a4b4e2b32mr11491293wmo.26.1700121330629; 
 Wed, 15 Nov 2023 23:55:30 -0800 (PST)
Received: from [192.168.69.100] ([176.187.220.205])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a056000024400b0032fb0e2087asm12582889wrz.82.2023.11.15.23.55.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Nov 2023 23:55:30 -0800 (PST)
Message-ID: <f71e943c-4177-41bf-8745-69d50786fec3@linaro.org>
Date: Thu, 16 Nov 2023 08:55:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 19/31] target/sh4: Use generic cpu_list()
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
 <20231114235628.534334-20-gshan@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231114235628.534334-20-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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
> Before it's applied:
> 
> [gshan@gshan q]$ ./build/qemu-system-sh4 -cpu ?
> sh7750r
> sh7751r
> sh7785
> 
> After it's applied:
> 
> [gshan@gshan q]$ ./build/qemu-system-sh4 -cpu ?
> Available CPUs:
>    sh7750r
>    sh7751r
>    sh7785
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>   target/sh4/cpu.c | 17 -----------------
>   target/sh4/cpu.h |  3 ---
>   2 files changed, 20 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


