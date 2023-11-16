Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA7D9C197A0
	for <qemu-riscv@archiver.kernel.org>; Thu, 16 Nov 2023 10:28:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r3Zbj-0008EC-0Q; Thu, 16 Nov 2023 05:28:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3Zbh-00084j-KQ
 for qemu-riscv@nongnu.org; Thu, 16 Nov 2023 05:28:21 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3Zbf-0005IT-44
 for qemu-riscv@nongnu.org; Thu, 16 Nov 2023 05:28:21 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40907b82ab9so10718685e9.1
 for <qemu-riscv@nongnu.org>; Thu, 16 Nov 2023 02:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700130497; x=1700735297; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=M2QjEtb2u2rABHKtXUg/bwaytnMjcgZRc1wDHrMIS1s=;
 b=hFMsCsd9o7RaCc8Nu7pDqs87KHPkV6jHLW8UOozZEznWvrq8E7ipqHlqTNNVbGIL6Q
 FH40rVoZI7SLUQI5J3E9tQfmw5J39uhqIOESVv6/AwJSG762N6UuUhCPDQDVK4stEshc
 DRW4VhLPNWMVSyGMT8KjoyCtu3IT0DDCeSD0YBbhPWERBHguRVtq/GrIkydPmoS/JfXS
 AJNz1iFAGpygrOVB8NbMIDDWBIUnlN41xUbS9XtY+SQsGpNflgujs1gPqSmsT6+eO7lN
 ejvVltzZf4mZC01Hdo5+nxDOoXoORL3HFGtuc5Om61zZDdoxVkrRG7MfmrZktFb5yu/5
 ra5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700130497; x=1700735297;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M2QjEtb2u2rABHKtXUg/bwaytnMjcgZRc1wDHrMIS1s=;
 b=mS3rIP+qz4laL/3W7lcBuPpLfZODm8tTvBs0ASfMZKc9dRlAGPV7t88/r+rAM1Z/PP
 Z8zwYD4G9iBRsBfFh/gEfz3D0cjEGhkyk20j/NZoCRnVPU3GsVwN4MmKyn1RNEpgDE7y
 IbNUgvjKirGITQYwkAA5RzNOg2JgObBXq95WMTt68q0z5UeSTMplmNjMyO1FJGykSanW
 ET0glrZTJnOOFmsuZzEHo6WnsYWw7KizwsDLFYSu5NAl2MCbTopcC+fLuTIsI+TwuLRX
 tbvaM8RV4Cp9ILngPJcMQeawibh2SuHYWMCVpiOnp93g4bpQMjQnk/rTwODKXWFHj1DU
 sd3Q==
X-Gm-Message-State: AOJu0YwBI+mHUKSf5fHacywBzfUN1Ko3Uae8fg7hpo9oouQOqodloQh/
 el8gTf4d5WnDdoV/orhQGqY0Sg==
X-Google-Smtp-Source: AGHT+IFdOFVcrQVxLOeohsaN7z3BBVVqRAc20eDkuxnpxRGJJQ4i+yiqDAL3nmL49pOUqgn5t8RHcA==
X-Received: by 2002:a05:600c:310f:b0:406:44fc:65c9 with SMTP id
 g15-20020a05600c310f00b0040644fc65c9mr1218058wmo.8.1700130497563; 
 Thu, 16 Nov 2023 02:28:17 -0800 (PST)
Received: from [192.168.69.100] ([176.187.220.205])
 by smtp.gmail.com with ESMTPSA id
 u5-20020a05600c138500b003fee6e170f9sm3001006wmf.45.2023.11.16.02.28.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Nov 2023 02:28:17 -0800 (PST)
Message-ID: <f0849f2f-77a4-466f-9191-038a8c041dad@linaro.org>
Date: Thu, 16 Nov 2023 11:28:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 16/31] target/openrisc: Use generic cpu_list()
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
 <20231114235628.534334-17-gshan@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231114235628.534334-17-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On 15/11/23 00:56, Gavin Shan wrote:
> Before it's applied:
> 
> [gshan@gshan q]$ ./build/qemu-or1k -cpu ?
> Available CPUs:
>    or1200
>    any
> 
> After it's applied:
> 
> [gshan@gshan q]$ ./build/qemu-or1k -cpu ?
> Available CPUs:
>    any
>    or1200
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>   target/openrisc/cpu.c | 42 ------------------------------------------
>   target/openrisc/cpu.h |  3 ---
>   2 files changed, 45 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


