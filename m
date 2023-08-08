Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2AB7C001DB
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 22:10:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qTUuB-0004of-BJ; Tue, 08 Aug 2023 18:10:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vineetg@rivosinc.com>)
 id 1qTUu9-0004m6-2Z
 for qemu-riscv@nongnu.org; Tue, 08 Aug 2023 18:10:17 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vineetg@rivosinc.com>)
 id 1qTUu5-0000CL-8f
 for qemu-riscv@nongnu.org; Tue, 08 Aug 2023 18:10:15 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-267fabc8465so3498833a91.1
 for <qemu-riscv@nongnu.org>; Tue, 08 Aug 2023 15:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1691532611; x=1692137411; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dPDUAI8wkYDoMCVngS1za4p6eQ3nGAgFpSIfADzIvZs=;
 b=ZuAoyCgkyquYKrTIUcmUkvjH8XtKy8HQd1fwc97wSlC/mvY6/TjPP9KJAybKHmDJBI
 WXBm5JFJF/g9SbBn4Z6ks9TYIgEP3jrcWvXB7S6EcI5Ql5M1N8pWRDGx6C0+CQrEQ/Ky
 ziCmMJGVev6KycFullO50KIN2UnvjYI5Po2CV3+8fb4NVGBtI4ec8N3XTXlsD1/rig3d
 sYJ2Hkw8Nbuo6eG1VMkK73qaPV6FjjZBbilfKXAop/6bv3vqoQpKAvRCOZlEXHrLZLg5
 87Ir/D1OiJtxb2J/FFsWYulELo+HQ7pCGSMMlp3VW40fbN7/cIADbEUYSftzPEZA7Obo
 HEDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691532611; x=1692137411;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dPDUAI8wkYDoMCVngS1za4p6eQ3nGAgFpSIfADzIvZs=;
 b=RWcN5xPlYGAuE759M7wEXHwPDL/dGV384Iu5jhnTC8NuIeQHgl05+zKzLcx5Fiqszh
 McQD+EHKcd4BOYWfdPxtSaNvvjPD09JPgtFVE4KpUGRPXCEmrbUZmA9SrSifno29AssW
 S/S9niN04T5s1132jY0oXa2l4+mPGh157jfuyjTuHXKJ+E8R3R6HifXQRVBhxeHDVs2C
 XZoX/0g0OHnfX90JXcGFR52tz+PRgulnKtL6fqvhXOFrAUOSnywCq7exb4HVuGm/jp4d
 4MrhUN/YBHkAHh2oozp4FucDWnfH7jTwYHdt5SIoRDfpeUvrVhWEYX6yKqH7UhFOMi3c
 MZhw==
X-Gm-Message-State: AOJu0Yza24N+5f7Is6rqNbNQYVzRiaZS+6BIc5PgFaHige8suivOC2Rg
 q3LDO18wyPx52zLy2MPOrpHTDQ==
X-Google-Smtp-Source: AGHT+IEaBw3JPsZ8sEZgb+6eQC3flSlYaRw4XlNciO4FUtHyXoSeX33FC/kpWPi6NDI4ZYNf2Mjpag==
X-Received: by 2002:a17:90b:3144:b0:263:931b:bb5f with SMTP id
 ip4-20020a17090b314400b00263931bbb5fmr695392pjb.14.1691532610977; 
 Tue, 08 Aug 2023 15:10:10 -0700 (PDT)
Received: from [10.0.16.165] ([50.221.140.188])
 by smtp.gmail.com with ESMTPSA id
 23-20020a17090a005700b00268b9862343sm34497pjb.24.2023.08.08.15.10.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Aug 2023 15:10:10 -0700 (PDT)
Message-ID: <1aa3bdff-0db4-c589-8863-56bbea825fda@rivosinc.com>
Date: Tue, 8 Aug 2023 15:10:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/2] riscv: zicond: make default
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: kito.cheng@gmail.com, Jeff Law <jeffreyalaw@gmail.com>,
 Palmer Dabbelt <palmer@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liweiwei@iscas.ac.cn>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20230808181715.436395-1-vineetg@rivosinc.com>
 <20230808181715.436395-2-vineetg@rivosinc.com>
 <ff43edc3-f160-e57d-deb1-185601ed5b7d@ventanamicro.com>
From: Vineet Gupta <vineetg@rivosinc.com>
In-Reply-To: <ff43edc3-f160-e57d-deb1-185601ed5b7d@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=vineetg@rivosinc.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-4.14, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



On 8/8/23 14:06, Daniel Henrique Barboza wrote:
> (CCing Alistair and other reviewers)
>
> On 8/8/23 15:17, Vineet Gupta wrote:
>> Again this helps with better testing and something qemu has been doing
>> with newer features anyways.
>>
>> Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
>> ---
>
> Even if we can reach a consensus about removing the experimental (x- 
> prefix) status
> from an extension that is Frozen instead of ratified, enabling stuff 
> in the default
> CPUs because it's easier to test is something we would like to avoid. 
> The rv64
> CPU has a random set of extensions enabled for the most different and 
> undocumented
> reasons, and users don't know what they'll get because we keep beefing 
> up the
> generic CPUs arbitrarily.

I understand this position given the arbitrary nature of gazillion 
extensions. However pragmatically things like bitmanip and zicond are so 
fundamental it would be strange for designs to not have them, in a few 
years. Besides these don't compete or conflict with other extensions.
But on face value it is indeed possible for vendors to drop them for 
various reasons or no-reasons.

But having the x- dropped is good enough for our needs as there's 
already mechanisms to enable the toggles from elf attributes.

>
> Starting on QEMU 8.2 we'll have a 'max' CPU type that will enable all 
> non-experimental
> and non-vendor extensions by default, making it easier for tooling to 
> test new
> features/extensions. All tooling should consider changing their 
> scripts to use the
> 'max' CPU when it's available.

That would be great.

>
> For now, I fear that gcc and friends will still need to enable 
> 'zicond' in the command
> line via 'zicond=true'.  Thanks,

Thx,
-Vineet

