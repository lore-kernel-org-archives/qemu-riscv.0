Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3411C197A0
	for <qemu-riscv@archiver.kernel.org>; Thu, 16 Nov 2023 13:35:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r3cWh-0000ah-VG; Thu, 16 Nov 2023 08:35:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3cWb-0000ZH-IN
 for qemu-riscv@nongnu.org; Thu, 16 Nov 2023 08:35:17 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3cWY-0004q5-GY
 for qemu-riscv@nongnu.org; Thu, 16 Nov 2023 08:35:16 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4083dbc43cfso5741275e9.3
 for <qemu-riscv@nongnu.org>; Thu, 16 Nov 2023 05:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700141711; x=1700746511; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ieXCHt2U5ZDum61SCHZZRrc1OHNhppLyWsJdB0gRjXg=;
 b=kGs2z3nC0JZfABDV7KcwrkJ75ELv5oW1jmBd2gidUZw3QXWXOMNlOhpFHbHJm8IKr/
 yFih4mjvB9phaA6OT9vn6iDFeUzZq+ZY6Po7bKaMtqMj1hIPyakoKFXuT/DhSmzluStF
 r7LAttimX3l4pxZkbc1+yWIq2ylUslHiKHv1EhptOTsIzyKxNpC7kbUaU6J02KIqcyRB
 zltff4DB/zU0Cpv+fzB8YZSJJLqNhwBFTw1TnN4+FEoRXPH78WJuf/EN6uox4C1Deppl
 kN6zeTb12aWM1yrkuA6f7ptMgY7DSHOLHT4o4OdWDFUd98PhFzfOvDckag4vXP0rDZrc
 9y+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700141711; x=1700746511;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ieXCHt2U5ZDum61SCHZZRrc1OHNhppLyWsJdB0gRjXg=;
 b=X1h5EJix6TirpFDZi4/16tBxnUXGHHN84vxL28ghCST2MxAT3khqYZfNSx+/1X9qj2
 BOfJkQYnThndZ1pAOvwbJY5QUBtd0hCxLrHWkOkKrzACI/G19ahOEdEgNGECBZVFQBzx
 NVCwF+cjfHuI2taVYymf+ambeUnueenN5PIpIUW/5GCsZm7etd23eBWgpCWgqjhn+2Pb
 owidY1lwAP5Cb9DJkp9ihzOyUhaJsuTVp+PkB6Xn4OlSWMu3hmWkIX0W3pyk/9zeczom
 qWy3G0su16Pdf19t8OtKoWWFedDOkf6SS+cjuFTcUaBmWYijSN2MhVaIt5ItKLsTK5HE
 Jgzw==
X-Gm-Message-State: AOJu0Yz1Z5UqATfoBzc2WJpDvrdr1G8umACdngjuYNX4QGHBw/b5v8GT
 9DYdEnJnW59T2pcXnkh0Kfb+MQ==
X-Google-Smtp-Source: AGHT+IHM5EgeQN1JC350e7bXc4sVDxX/fGftKw3Y7NYfPlq4xB3sXldDkz/eUo20PNbKKq98NXXkUA==
X-Received: by 2002:a05:600c:3548:b0:409:231e:2a69 with SMTP id
 i8-20020a05600c354800b00409231e2a69mr12124842wmq.28.1700141710802; 
 Thu, 16 Nov 2023 05:35:10 -0800 (PST)
Received: from [192.168.69.100] ([176.187.220.205])
 by smtp.gmail.com with ESMTPSA id
 k27-20020a05600c1c9b00b00407752bd834sm3838207wms.1.2023.11.16.05.35.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Nov 2023 05:35:10 -0800 (PST)
Message-ID: <efc49f7b-70f5-4ce9-8179-79e8a6abd732@linaro.org>
Date: Thu, 16 Nov 2023 14:35:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/31] Unified CPU type check
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
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231114235628.534334-1-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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

Hi Gavin,

On 15/11/23 00:55, Gavin Shan wrote:
> There are two places where the user specified CPU type is checked to see
> if it's supported or allowed by the board: machine_run_board_init() and
> mc->init(). We don't have to maintain two duplicate sets of logic. This
> series intends to move the check to machine_run_board_init() so that we
> have unified CPU type check.


> Gavin Shan (30):
>    target/alpha: Remove 'ev67' CPU class
>    target/hppa: Remove object_class_is_abstract()
>    target: Remove 'oc == NULL' check
>    cpu: Add helper cpu_model_from_type()
>    cpu: Add generic cpu_list()
>    target/alpha: Use generic cpu_list()
>    target/arm: Use generic cpu_list()
>    target/avr: Use generic cpu_list()
>    target/cris: Use generic cpu_list()
>    target/hexagon: Use generic cpu_list()
>    target/hppa: Use generic cpu_list()
>    target/loongarch: Use generic cpu_list()
>    target/m68k: Use generic cpu_list()
>    target/mips: Use generic cpu_list()
>    target/openrisc: Use generic cpu_list()
>    target/riscv: Use generic cpu_list()
>    target/rx: Use generic cpu_list()
>    target/sh4: Use generic cpu_list()
>    target/tricore: Use generic cpu_list()
>    target/xtensa: Use generic cpu_list()
>    target: Use generic cpu_model_from_type()
>    machine: Constify MachineClass::valid_cpu_types[i]

I'm queuing patches 1-3 & 5-23 to my cpus-next tree. No need to
repost them, please base them on my tree. I'll follow up with the
branch link when I finish my testing and push it.

>    machine: Use error handling when CPU type is checked
>    machine: Introduce helper is_cpu_type_supported()
>    machine: Print CPU model name instead of CPU type name
>    hw/arm/virt: Hide host CPU model for tcg
>    hw/arm/virt: Check CPU type in machine_run_board_init()
>    hw/arm/sbsa-ref: Check CPU type in machine_run_board_init()
>    hw/arm: Check CPU type in machine_run_board_init()
>    hw/riscv/shakti_c: Check CPU type in machine_run_board_init()



