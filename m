Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14365C10F15
	for <qemu-riscv@archiver.kernel.org>; Thu, 25 Apr 2024 08:31:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rzuVN-0001ws-NU; Thu, 25 Apr 2024 04:30:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rzuVL-0001tX-4R
 for qemu-riscv@nongnu.org; Thu, 25 Apr 2024 04:30:55 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rzuVG-0005SC-Lq
 for qemu-riscv@nongnu.org; Thu, 25 Apr 2024 04:30:52 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-56e48d0a632so894416a12.2
 for <qemu-riscv@nongnu.org>; Thu, 25 Apr 2024 01:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714033848; x=1714638648; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tZ3/6YhofnYJIVLe11MJ4UpdhXlzdTRi2JtZxyvTnHI=;
 b=lTGID9KNHfaMkqbOIfdfktcTadym7hOmgvHpfnYGsBTJEzr8i/r74qY8TUTO6qlm+c
 cEs4jCWD705h4oA2EfK8NYupNArKjuwTBRqP/hjQv+NEKTzatnx1fIi+Au5je6NK/FqA
 b4uhg82jBAMb87QNJY/TzeAX3dq2CHibihLywNLqrzJve0weUSXIiqXB2P7yY3r1EU+G
 o7fpCo+7wq3V9v64hRcsQ9uqAyMeKO9/Jkz5jBQB39A6pn+9EGZS1ujrH/2picMbJ1mx
 8pCX3O+V5wt2P01E70jqFGgMlRDRLmnVI0pcEaTGDXRGvMizDqQXLBd46YE3rn2rZfpY
 12Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714033848; x=1714638648;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tZ3/6YhofnYJIVLe11MJ4UpdhXlzdTRi2JtZxyvTnHI=;
 b=VoLYiB4KsrI8Tld23IZXRLYWOg0lSRBtprBjFsV/GExw1CtAIHD7mYJqd73lEnUo0I
 032XmAtQj3Fx/0wSlkK/Z7D7IrDBhzl7ZbLOf+LUSfaixdQ5TuI/XvLVW9K1zgDZjoli
 HusYYonSp62nbjqycvrP+BYCPIrCwb8MIIKt68APtyTAmlBsGQqAgUAef6AV95Hgy5bp
 ylxoqfe2W462QqvBQQxDe42o6JQrbkq61oX9h/Agt2xT6gh8VmiVvNsadO5PO4QF3G7s
 H22v1yjb/47JMaH3+eWSlc7Mnt9ulO5iaCLTEvpvy2dlJt5+ND0ZLowUBswhpOarHzyj
 BNlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUluAM2SVKRxLEMJ/lbjuEX6sLWnsoMIF0LfQxFDxyRpix6y2gBONV65dyioT9Csidk8Cj1qX36jTiJcy8HHlkLKSFzYbc=
X-Gm-Message-State: AOJu0YwGMhPcFlP1jgd6/gry9HAKnrTolKVZXmaOHH2OmZhX8as+EMQU
 xQH84N1KxhxPiu5Ua480CZzNQpOM6Xaw3pj7ZEY4tLoEEE/wsMjFVuVoOnbkYao=
X-Google-Smtp-Source: AGHT+IGbxmvKPuF7F+Qe1o2T+PT4u6mNxMQq2gs4ua6p8aEqwoV+d0VmlM+jfXg6mkwgsGfHemKX2Q==
X-Received: by 2002:a17:906:3b5b:b0:a55:33a5:9116 with SMTP id
 h27-20020a1709063b5b00b00a5533a59116mr4508604ejf.33.1714033847972; 
 Thu, 25 Apr 2024 01:30:47 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.197.201])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a1709061e4700b00a52244ab819sm9434096ejj.170.2024.04.25.01.30.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Apr 2024 01:30:47 -0700 (PDT)
Message-ID: <86326b55-3435-4ceb-8630-e44ce3b15d93@linaro.org>
Date: Thu, 25 Apr 2024 10:30:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/24] exec: Rename 'exec/user/guest-base.h' as
 'user/guest-base.h'
To: Anton Johansson <anjo@rev.ng>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Riku Voipio <riku.voipio@iki.fi>
References: <20240418192525.97451-1-philmd@linaro.org>
 <20240418192525.97451-15-philmd@linaro.org>
 <mneadkx4ytvujstobsjifz7hoizsbbpes5opi7i2lyodl3tgs2@7jzadxaldrpi>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <mneadkx4ytvujstobsjifz7hoizsbbpes5opi7i2lyodl3tgs2@7jzadxaldrpi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x532.google.com
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

On 25/4/24 09:39, Anton Johansson wrote:
> On 18/04/24, Philippe Mathieu-Daudé wrote:
>> The include/user/ directory contains the user-emulation
>> specific headers. Move guest-base.h there too.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   include/exec/cpu-all.h               | 2 +-
>>   include/{exec => }/user/guest-base.h | 4 ++--
>>   tcg/tcg.c                            | 2 +-
>>   3 files changed, 4 insertions(+), 4 deletions(-)
>>   rename include/{exec => }/user/guest-base.h (72%)
> 
> Patch looks good, but the difference between user/ and exec/user is not
> entirely clear to me :)

Neither it is for me. In next batch (part 3) all headers are
moved to user/.

> Reviewed-by: Anton Johansson <anjo@rev.ng>

Thanks!

