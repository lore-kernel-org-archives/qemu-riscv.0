Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B8FEB64DC
	for <qemu-riscv@archiver.kernel.org>; Mon, 17 Jul 2023 23:11:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qLXNE-0000Nn-6e; Mon, 17 Jul 2023 19:11:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qLXNC-0000NK-22
 for qemu-riscv@nongnu.org; Mon, 17 Jul 2023 19:11:22 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qLXN6-0007m3-2d
 for qemu-riscv@nongnu.org; Mon, 17 Jul 2023 19:11:21 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-6b9d68a7abaso1058587a34.3
 for <qemu-riscv@nongnu.org>; Mon, 17 Jul 2023 16:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1689635473; x=1692227473;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xB3jzmsfUxwitg5niwscS/7l3TLsPIhKwR6+kzYcaz0=;
 b=c86PVyRSke7jX6s9hQnyOda0OGeN1zm1/Gz5FkYQ4y6UyTKwT10rgiDOQek11yA1TU
 o8y/zirXUtlv1fa0V9e0f2chNQczjx82s2CE4KOxqMFcztnBLNQRTjgIUjH2ptK/46AU
 cP0rzdSeof4pFqaI9Pu9eVXp1cJqtaQE5lLQBW/UQ9rQ3R22RkB+WVcb3bgg3dFpOD1L
 NulkYxK27RZKzGL9FTCvUhurszkn280PLfgYl2pQFiu647v0alHP+sOaJ5+Enh495aqZ
 ifW2dkGOxE2V2MHZqnfRiv3rRi/Edsn0Ixf4nmtA1jiF4pkKDt2tDIBGJE6J6dxPHROZ
 kp7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689635473; x=1692227473;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xB3jzmsfUxwitg5niwscS/7l3TLsPIhKwR6+kzYcaz0=;
 b=CsQHYNRUSJ0OT3ZoZwZhZQVNKGD4+9qpEz+sSk81LB8HpuUzF/JvtVmn2OvUwPVq38
 BtUxmLTl5C0ktW8fs/85bbSrbVskw3OOoJIIYaqmDKqObcctHtFuIeX6adsWMCj0c+YD
 mjKvdpcRDZBmDqtT6SEctKiRr6kZyEqgYo1J5BBKDuK/w7ptbJZS7erw20h8kUZPcDOf
 ikxIp2MTHVDQFuwal4XJY9OlOrc5KLN7L442HMFqxQdxj6FHw8i0Yf2Bpq9x9WY9r/8l
 +r76elqJGmVzmnRt/S61VXURfBO7zSufD0T9QFzkmlnUbnhsXXdm2AKh3Fq8EzftVqZq
 0BsQ==
X-Gm-Message-State: ABy/qLan80nY90tBiha2Z0vMjDuuPW6iroE0UYfdvjmlV+lMsp64CHR3
 ebccwLwRDxgzjuzaWkWy0ckqtg==
X-Google-Smtp-Source: APBJJlFuGWUzPMVBInc1O7ZCXvQTVQhgrEms9gvWN1oJLxLyQA5exaIRF60XxsRdP2wYBz+JIZ3Iyw==
X-Received: by 2002:a9d:66c1:0:b0:6b7:57aa:45cc with SMTP id
 t1-20020a9d66c1000000b006b757aa45ccmr10711004otm.15.1689635473448; 
 Mon, 17 Jul 2023 16:11:13 -0700 (PDT)
Received: from [192.168.68.108] (201-69-66-211.dial-up.telesp.net.br.
 [201.69.66.211]) by smtp.gmail.com with ESMTPSA id
 b25-20020a056830105900b006b94fb2762asm378720otp.23.2023.07.17.16.11.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jul 2023 16:11:13 -0700 (PDT)
Message-ID: <2f123883-3064-28af-649f-2bbc8c52a60a@ventanamicro.com>
Date: Mon, 17 Jul 2023 20:11:09 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH for-8.2 0/2] target/riscv: add zicntr and zihpm flags
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 palmer@rivosinc.com
References: <20230717215419.124258-1-dbarboza@ventanamicro.com>
 <20230717-snugly-pencil-98d62b254a74@spud>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230717-snugly-pencil-98d62b254a74@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x335.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
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



On 7/17/23 19:33, Conor Dooley wrote:
> Hey,
> 
> On Mon, Jul 17, 2023 at 06:54:17PM -0300, Daniel Henrique Barboza wrote:
>> Hi,
>>
>> I decided to include flags for both timer/counter extensions to make it
>> easier for us later on when dealing with the RVA22 profile (which
>> includes both).
>>
>> The features were already implemented by Atish Patra some time ago, but
>> back then these 2 extensions weren't introduced yet. This means that,
>> aside from extra stuff in riscv,isa FDT no other functional changes were
>> made.
>>
>> Both are defaulted to 'true' since QEMU already implements both
>> features, but the flag can be disabled if Zicsr isn't present or, in
>> the case of zihpm, if pmu_num = 0.
> 
> Out of curiosity, since you are allowing them to be disabled, how do you
> intend to communicate to a guest that zicsr or zihpm are not present?

At this point I'd say that existing guests are using other ways of checking
if these timers and counters are available. After this patches OSes can confirm
if these timers are available via riscv,isa, but they can't assume that
they are not available if riscv,isa doesn't display them.

There's a chance that guests will continue ignoring these 2 extensions regardless
of whether the platform exposes them or not.

> 
>> This means that,
>> aside from extra stuff in riscv,isa FDT no other functional changes were
>> made.
> 
> This is barely a "functional" change either, as the presence of these
> extensions has to be assumed, whether they appear in riscv,isa or not :/

It's more of an organizational change for the sake of QEMU internals because the
RVA22 profile happens to include zicntr and zihpm as mandatory extensions. It's
easier to add the flags than to document why we're claiming RVA22 support but
aren't displaying these 2 in riscv,isa.



Thanks,


Daniel

