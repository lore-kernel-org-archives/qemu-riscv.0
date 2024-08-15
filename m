Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB05C3DA7F
	for <qemu-riscv@archiver.kernel.org>; Thu, 15 Aug 2024 09:28:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1seWlf-00006K-3A; Thu, 15 Aug 2024 05:27:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1seWlW-0008W2-Ne
 for qemu-riscv@nongnu.org; Thu, 15 Aug 2024 05:27:32 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1seWlR-00059w-IP
 for qemu-riscv@nongnu.org; Thu, 15 Aug 2024 05:27:28 -0400
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a7d2a9a23d9so97257266b.3
 for <qemu-riscv@nongnu.org>; Thu, 15 Aug 2024 02:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723714043; x=1724318843; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Bpyz4uA4VLTLT6Q2iCunXp01ueOc6QiK3D70B3lOBqo=;
 b=zS9UwOO2E8EbG6zF2GchORxcM7kP6TdXvK6vE9S2vQU7GoP5r0j0S+V3iTeCU86NYI
 n/Dp3nrVtOKDm6j9wGaZgg7MZ8V+XTrBofhmZ6PGh4SLRjrRssJk1Fy2KTD7GjXH9BxA
 vuj8mXnAS5Cm/pKTRIu8OYHmOE5Wn+HyxFgmMf6CJu7jrW4uEi/r30vORDxbBG1cfDT5
 ree/DVKo3TUApCvztxSxriKVMELca08wpxMcOJBHyCX6xEssP2r/rtKi66COLXYEaWD0
 0EMsFqGbVHvAAvG0/bP1ezE3WFFUbQK6rcHVW1XCzCFpPCwJ7SeGrrFDZC2R8G2UiH0u
 4VvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723714043; x=1724318843;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Bpyz4uA4VLTLT6Q2iCunXp01ueOc6QiK3D70B3lOBqo=;
 b=JhcC2Blda0ipyXjGOSzdQm029hiRYHEvmfaEDH6RpBSx6hBKv0IaielUYTaj5Ni/6Q
 p+e7J+EVexQxHF+OEFMPl4T4mpLLVRag1PuTTlsbuKsfRGO0yOlKpfw44Q+pr9w/wc+K
 d0VNGbM7xjS6UJ+wQjypso4ARU18+/h74QtkJQvznV9K/URJycSboHF9jHjHeYfepV2U
 A9b2aBKea40dls/TmPo8e1aprlivKVK9TimntrsLg7rD9byIPars57xkFEaqcwpQJ858
 Qx76+SOInM0PUi+nQI5VUw8yTJiBx2zdpR6wWaz6QRnqMf9InjXTzYdjunv7q8jhbws+
 ijjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8nOZcaYybErd9+cOlTf6CU7o3BKULX4hlidfSCTRgnDL1+wzqUSi0vcSFurGTb5+b7ClrQiVw5lBLHsfn2RieV1nM02A=
X-Gm-Message-State: AOJu0YxozMelXLsfCB2EzU9mMsW9w0c5XRJKxOM8DYlt65Ezg+EZS7U4
 jJof6d3PHzSr1fIrQgRknvh/dYfiGjCNOb/swqfAUFzIJnL/QjvVdJtPe4rxiOo=
X-Google-Smtp-Source: AGHT+IF0ehmcvBCsr74MFCDuVN2CzGKQHkzs/p6e8SX9picY8EgB90GEQ25s8tgqEh6B5xL7tXw1Jw==
X-Received: by 2002:a17:907:c881:b0:a77:e55a:9e91 with SMTP id
 a640c23a62f3a-a8366d3ffabmr370495966b.19.1723714043144; 
 Thu, 15 Aug 2024 02:27:23 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.202.43])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a83839356besm72638466b.99.2024.08.15.02.26.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Aug 2024 02:27:22 -0700 (PDT)
Message-ID: <d8ffe38c-756d-4187-875e-e6697631b7fa@linaro.org>
Date: Thu, 15 Aug 2024 11:26:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] hw/char/serial: Remove unused funtion
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 BALATON Zoltan <balaton@eik.bme.hu>, Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Bin Meng <bmeng.cn@gmail.com>,
 Paul Burton <paulburton@kernel.org>, Stafford Horne <shorne@gmail.com>,
 qemu-ppc@nongnu.org, Tyrone Ting <kfting@nuvoton.com>,
 Joel Stanley <joel@jms.id.au>, Eduardo Habkost <eduardo@habkost.net>,
 Sergio Lopez <slp@redhat.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Hao Wu <wuhaotsh@google.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Jan Kiszka <jan.kiszka@web.de>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Palmer Dabbelt <palmer@dabbelt.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Jia Liu <proljc@gmail.com>, Helge Deller <deller@gmx.de>,
 Max Filippov <jcmvbkbc@gmail.com>, Subbaraya Sundeep
 <sundeep.lkml@gmail.com>, Weiwei Li <liwei1518@gmail.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Steven Lee <steven_lee@aspeedtech.com>, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, qemu-arm@nongnu.org,
 Aleksandar Rikalo <arikalo@gmail.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?B?RnLDqWTDqXJpYyBCYXJyYXQ=?= <fbarrat@linux.ibm.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 qemu-riscv@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Song Gao <gaosong@loongson.cn>
References: <20240814181534.218964-1-shentey@gmail.com>
 <20240814181534.218964-3-shentey@gmail.com>
 <22fa9014-2923-b501-e38d-f5dd1e53d15a@eik.bme.hu>
 <11aeac5f-1985-494e-941a-5115d5e679bc@ilande.co.uk>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <11aeac5f-1985-494e-941a-5115d5e679bc@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x636.google.com
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

On 15/8/24 10:24, Mark Cave-Ayland wrote:
> On 14/08/2024 22:38, BALATON Zoltan wrote:
> 
>> On Wed, 14 Aug 2024, Bernhard Beschow wrote:
>>> The serial port's frequency is set via the "baudbase" property nowadays.
>>
>> Please keep it as some devices might have registers that set this freq 
>> and this function will be needed for emulating that even if it's not 
>> emulated currently.
> 
> Why not remove the function if it isn't being used? In general having 
> unused code lying around is bad as it tends to bitrot.
> 
> If someone did want to re-add this functionality then you would likely 
> want to do it with clock API rather than using a separate function.

I also ended using it in a branch including this old series:
https://lore.kernel.org/qemu-devel/20200806130340.17316-1-f4bug@amsat.org/

Not my priority anymore, so I don't mind re-adding it.


