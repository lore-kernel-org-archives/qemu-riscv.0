Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B07F3C48260
	for <qemu-riscv@archiver.kernel.org>; Mon, 19 Feb 2024 08:19:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rbysV-0006GT-QS; Mon, 19 Feb 2024 03:19:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rbysV-0006GD-AO
 for qemu-riscv@nongnu.org; Mon, 19 Feb 2024 03:19:55 -0500
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rbysT-0000HT-Nr
 for qemu-riscv@nongnu.org; Mon, 19 Feb 2024 03:19:55 -0500
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-512acc1a881so1034571e87.3
 for <qemu-riscv@nongnu.org>; Mon, 19 Feb 2024 00:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708330792; x=1708935592; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:cc:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gdARqvMJZsxlGjCYbjIqbtu8swX7fCZKzCBdngaqHzI=;
 b=IAAe7r9iz63E7KuwHpayeamOGKC6S4WWJiCinbzecRIBLIUMZ9YUP038ebKm5oa1dU
 CugoK58+6ezmRnO1k2wPXndq+ABrwSgbBb7NUIdZRC2Vx93Oz8QDquZ0Fxo06tlKnZkd
 hgOxLp6gVuimNrcgqWsBM1B1plKHDdLWD1oDbJ+bARzkmvtG8wvsuzPfweRWVsUcizOU
 xqsVoqLxkPegAB7d2EZOdP5Z+OmUXeh6bzBwYAQQUtrcc8in0CZ2W8cB6CQjUfmqhn5P
 jGehpYYPKgU0A2h+NgjfdPAY2ZtjH/Ih4la8VnL3erQA1WvOfdeXHhtN1kz3q9Cud3to
 oJTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708330792; x=1708935592;
 h=content-transfer-encoding:in-reply-to:from:cc:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gdARqvMJZsxlGjCYbjIqbtu8swX7fCZKzCBdngaqHzI=;
 b=i5Wl1qBxcL1aij5CpQcnidL+TdICx3na/UpktuRLh7X7Wn70uw2l2D40nIWN+9LxYl
 3o1VZeXYXP/OkwiaB97zpXvJc6G2v0uNbCVQqiTAV7ZSVl88yu7kxTEKp5MpPPOl6uxs
 rEpll0gHAlJJetquEgxaZWrc1eSUz8MuJfP56HqvwBTe41dXT5MVLvKBcVAsDECeoSQr
 MHrcoVwusveWHCwQBnugaPZtWrR4bDzI5/RTgU23L8irWqkfv+LQmjSwkYX3JvIJwfcp
 YRbNJFMBjm4GSWk89Sdo3oj9Y93PVxd+Pi6S2EQEDp37gkO3l1jMmaxuJTJkVnPZQKRg
 RhTQ==
X-Gm-Message-State: AOJu0YyaeKSDUVLwQ3nOaGzTDb9R6SU7NkdqhMQ1qICT2pE9Xx4rh210
 jDBtZdlBLugcncLQHrFwWXprXZN4P59fd8s/BRlaWcdAXI0xINqQdU2Bo3H4CvpXV8Z2xQ+QgqE
 G
X-Google-Smtp-Source: AGHT+IFlGrAFRDkQIzvL7LVK3mwr8YSuDjy/5oj3icWussZG0SNsxzPbqIT5wRCQvJihulikjyioVQ==
X-Received: by 2002:ac2:4245:0:b0:511:33d4:c99a with SMTP id
 m5-20020ac24245000000b0051133d4c99amr7228453lfl.61.1708330791647; 
 Mon, 19 Feb 2024 00:19:51 -0800 (PST)
Received: from [192.168.69.100] ([176.176.181.220])
 by smtp.gmail.com with ESMTPSA id
 p11-20020a05600c1d8b00b004126a0dfd11sm315254wms.29.2024.02.19.00.19.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Feb 2024 00:19:51 -0800 (PST)
Message-ID: <98da32fd-8027-4635-bd12-c5d45fd0b948@linaro.org>
Date: Mon, 19 Feb 2024 09:19:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: riscv virt target write pflash
To: max <cmax@mailbox.org>, qemu-discuss@nongnu.org
References: <6f8f1176-90ce-4fa4-9877-816f52478340@mailbox.org>
Content-Language: en-US
Cc: qemu-riscv <qemu-riscv@nongnu.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <6f8f1176-90ce-4fa4-9877-816f52478340@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x131.google.com
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

Cc'ing qemu-riscv mailing list which is more focused.

On 18/2/24 22:32, max wrote:
> I am relatively new to QEMU so I hope that this is the right place to ask:
> 
> I tried starting QEMU with the following command:
> ```
> qemu-system-riscv64 -M virt -drive 
> if=pflash,format=raw,unit=0,file=bios.rom -m 512M -nographic -s -S
> ```
> 
> I am using GDB to debug the `bios.rom` Firmware. At some point in the 
> execution `bios.rom` writes into some global variable (at 0x2000525C) 
> inside the .bss section which is linked to be inside the memory mapped 
> pflash0. But when I step forward with GDB to the exact location where 
> the store instruction (sw) is executed, QEMU prints the following:
> ```
> pflash_write: Unimplemented flash cmd sequence (offset 000000000000525c, 
> wcycle 0x0 cmd 0x0 value 0x1)
> ```
> According to the top of `hw/block/pflash_cfi01.c` Flash writes are 
> supported. I am probably missing something here so it would be nice if 
> someone could point me in the right direction. I would also gladly 
> contribute if there is something missing in the riscv virt target.
> 
> 


