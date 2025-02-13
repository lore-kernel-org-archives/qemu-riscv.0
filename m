Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 473A6C0219D
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 11:32:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tiXSS-0000al-Jo; Thu, 13 Feb 2025 06:32:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tiXSQ-0000aU-LW
 for qemu-riscv@nongnu.org; Thu, 13 Feb 2025 06:32:38 -0500
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tiXSO-0004HI-OI
 for qemu-riscv@nongnu.org; Thu, 13 Feb 2025 06:32:38 -0500
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-71fbb0d035dso505980a34.2
 for <qemu-riscv@nongnu.org>; Thu, 13 Feb 2025 03:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1739446353; x=1740051153; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BqhwDScs3lFuaFv5vu9mrKpFQ9HDO2UAWFUu3zZf7hI=;
 b=WdibVJEDoRs25U3CSd1GUnBEyuScEwEzBWFCYsmT78jTKtMCDw3extCHoPXxuVIwVQ
 2ia/udY6a8hm6CO3yhtO9QrU6NPcU52eXc5qsujpDewn35di4hLeOErZJe/o+BFM343A
 kw4SV5pbfZr21hmcoJwEKDoVrccLiJHHvCMsxi1Zxezw/oAn5g2DPAJa/VkUzEeLKTAm
 VgQ1QlKnCW/oe2TgkROqOls42zw8IkuiAmPZz3BgqDV+u5WYTTjEKyDJf2g2cOw8qy+R
 A+kTtxk3OfkWXmvbwb4hW9ZSnLYNvZh8Ox9H+kTOcCMMc94GPvKCKME2IlwRpywuou0T
 oQDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739446353; x=1740051153;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BqhwDScs3lFuaFv5vu9mrKpFQ9HDO2UAWFUu3zZf7hI=;
 b=X0crzQZ2hjc7Krq5fFXSDQNQ3igq+AijHYrBIMdUckO4MKBz7H16BMmDeKZjA9Td8s
 OGpJcdYfPJHM87RxuyVTesvBDVmndBT9GzRtLvNbyv6rWdPKCBL8Sy1R+JTbAl9TLqSJ
 aOfli9RiV03RUiBImGLWkHpFi21YrmDoNDatTqoNQzzdFVCyh7v5C/0fJ9nVsm61Dsvg
 u2kbZdKuS1rH1fIG5jNKurZBZJCl9thpV/OZ4493Rdq/OejiMTo5lRXqTCnuvCO2+oNU
 iSvF/r1lLMdyKdeupyY55hPVpWvorlBzGkSrOS5HTARUu/WCocYjqiTjP9CH8mtM6jKI
 ep0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxBjvStbY3SpCa1DogCOy7+cZ5ZHzMlEbJin6GlymFZwmH3TyvUWR2LGVNNVnJeTMK7rPpOtLMqaxb@nongnu.org
X-Gm-Message-State: AOJu0YxjgKUP2z12+j/8M7qNRmcP9AeX6AhxslapF19u3rfGmflfdjV8
 lGeakUwVvt6dOnX7evrmwzH9da0ulWbZYucpyOdYS0pw4hUhTAO+ZH1xTSsiMzU=
X-Gm-Gg: ASbGncsZMwO5MZ1BZJns9HC3xh1vOdKdcKLwxGmShbH2s5003DBpH70bmAaOJiebTjA
 wOD8eRFFMqXt6VrvL0WFBwMjQ6WB+C/IM428PIXGg5KrmssNHLztGJkLxd91BqTf3zpp0xzl7KO
 /obE3wlDN1C09i55s0IGPqpq4QdkTvghWl9O0P2h45nWQazdpKsDcGaDJC2fWkbtvP5ty3mGMPf
 rLUk/s55vLDzLWcRwwSomhY3hWAnouoNRhWUfb3l3M0P4maF3a16dE1RsqkMdVIynKfJ9SRVly9
 ldAjjCI9tpsSg4MitDaZ/ESKjGIC1M2jiVfdvL42htBaK3PD4CdIeS2Efgz9HsMl
X-Google-Smtp-Source: AGHT+IGK+tKZYLs3IEma9hN31YWaTpq9wY0nVWf+mi6HBK9c7b4xj672Q7gqT1omET8RIPlAZUwWdg==
X-Received: by 2002:a05:6830:4425:b0:718:d31:feb8 with SMTP id
 46e09a7af769-726fe76d416mr1587717a34.7.1739446353702; 
 Thu, 13 Feb 2025 03:32:33 -0800 (PST)
Received: from [192.168.68.110] (201-68-240-180.dsl.telesp.net.br.
 [201.68.240.180]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-727001fc69dsm478795a34.36.2025.02.13.03.32.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2025 03:32:33 -0800 (PST)
Message-ID: <6ac67c25-9ad7-42f6-b246-24053ce37ddc@ventanamicro.com>
Date: Thu, 13 Feb 2025 08:32:29 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: silent warnings about Smdbltrp/Smrnmi being
 disabled
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Tommy Wu <tommy.wu@sifive.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20250213075221.622676-1-cleger@rivosinc.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250213075221.622676-1-cleger@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



On 2/13/25 4:52 AM, Clément Léger wrote:
> As raised by Richard Henderson, these warnings are displayed in user
> only as well. Disable them for CONFIG_USER_ONLY.
> 
> Signed-off-by: Clément Léger <cleger@rivosinc.com>
> ---

I'm second guessing having these warnings at all.

Sure they serve as a warning for us, developers, that something needs to
be revisited (e.g. after an OpenSBI update). However it will degrade user
experience with warnings related to something out of the user control.

Instead of adding CONFIG_USER_ONLY gates for these warnings I believe we're
better of removing them. We can add TODO/FIXME tags in the code if there's
something that we need to revisit at a later time.


Thanks,

Daniel


>   target/riscv/tcg/tcg-cpu.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 0a137281de..4d0d16576d 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -1437,7 +1437,9 @@ static void riscv_init_max_cpu_extensions(Object *obj)
>        */
>       if (cpu->cfg.ext_smrnmi) {
>           isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_smrnmi), false);
> +#ifndef CONFIG_USER_ONLY
>           qemu_log("Smrnmi is disabled in the 'max' type CPU\n");
> +#endif
>       }
>   
>       /*
> @@ -1447,7 +1449,9 @@ static void riscv_init_max_cpu_extensions(Object *obj)
>        */
>       if (cpu->cfg.ext_smdbltrp) {
>           isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_smdbltrp), false);
> +#ifndef CONFIG_USER_ONLY
>           qemu_log("Smdbltrp is disabled in the 'max' type CPU\n");
> +#endif
>       }
>   }
>   


