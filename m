Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5500CE6C617
	for <qemu-riscv@archiver.kernel.org>; Tue,  3 Dec 2024 08:40:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tIOS8-00048r-6W; Tue, 03 Dec 2024 03:40:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIOS6-00046d-A3
 for qemu-riscv@nongnu.org; Tue, 03 Dec 2024 03:40:14 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIOS2-0005B2-E7
 for qemu-riscv@nongnu.org; Tue, 03 Dec 2024 03:40:12 -0500
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5cf6f367f97so6223648a12.0
 for <qemu-riscv@nongnu.org>; Tue, 03 Dec 2024 00:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733215208; x=1733820008; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=o6/zb/veCkx9SB91tVjl6GkFGPbtBPargb60SM0fqHE=;
 b=iN6yFMCPKAXRL+/Z67y5PlySHIpOAkKexSvYEpNdNIHM4Szu1XsE85K1TNkROMwGaG
 6bCYOh8lqnbGV4brfWnmSuKUTV+lz5cfW5m/DYuVc3xwGkvbuqa43Q3/83p7HgL3HvB6
 fwrR5X67940rtyDvc3erW7n0MRmgRYSKQtzHKyfYdAwqWdppV4Pe5Mx5LyYlvWFlI66G
 00FkB2XvOfZmZdiq0o7JoZZtJ8rzUP9yxXv0TZ95JJvEUNKZZzINacSNLw4ibHDRskIc
 8bLoExSRQLiQmrkCHWOCcXxgihW+yOiUxkKt8bcHldnMxGZRzDFIIlr+HImL7odYBWNM
 17QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733215208; x=1733820008;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o6/zb/veCkx9SB91tVjl6GkFGPbtBPargb60SM0fqHE=;
 b=IxufWkOHsKc1B/IU9gxiDOOlqXLdbu0okDVZ3wwrdGJ993Jn4gMzuSWMpNvf4ZdSmF
 Z6oYwUE8yKi1rdVy5+gQR1xjh2XTZxwAdYep3aCo7uCq1doTI9zYtWwMDm6iXrdcIVbm
 P+51HfrhhYIwgJP/KJAV6+YwHAlQ5vN2W7IQdfHEy7uxqI/V8o1A3ncs/g9tHvehchqE
 3sglnRvKEsSwsREXpgF+qX5LWXTw7/NZu/h9oI0OlQixfo8Q7RVAO6RbmKTz+OYl3VKK
 hjwLbQ0+cKODTu99zPwQeK0HLiMKd53v2o+x6TwsKdhGu3b6triGZwnQoFzVa7v64fnd
 0x/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsjYX8z4Z4b8s1M2HYvnA731HL8/vjPwDsl2WivA4SKO/DSclNmmRuGkubo62j7MGwuvKkm7DvPcmr@nongnu.org
X-Gm-Message-State: AOJu0Yz8oBhZuXHZ1MqmGdDHBOUdK7opRJCVQSg8j9pKj5Ap1F12Ipig
 0VZU5vLfnFcLloQESfG5cnrxnHjranpGlUcUJiWoTJit3BbjSb5qamZ8xp8nMFw=
X-Gm-Gg: ASbGncvr21CwCtG94Q7opElslM8roK6rJqEg1RhYiHvZ22cP6wXrTsC9lJ0vgqC7O8E
 BVN0Pzh6oYhNuQ7GKB0XfvSfHpcOdLmW2tHuVLeQd64tHQW5UdKmJZYTVvcr3p+aPBbmQcUwmmD
 jBNKXw45dypJaHnQb/KGM8rYRtG5aM8ik3o0FTl7g0mZqNZnTpYTzjxfIaHmi9GsKsHwg88v7gV
 8X8d25qz0hftf6Xf6s0QaiqkZKhXzQJed7GJGmGa55bUFNjGyORe1QfSNVqPzW3CQ==
X-Google-Smtp-Source: AGHT+IGLOVbZJ/jztPYBOQR5wNpq9a5znl4vYKqAINQPYjEThbq8U4XKCzPalOsFp+uFzgWG+WBrHg==
X-Received: by 2002:a17:906:3ca2:b0:aa5:2237:67af with SMTP id
 a640c23a62f3a-aa5f7ccee6amr97719466b.9.1733215208411; 
 Tue, 03 Dec 2024 00:40:08 -0800 (PST)
Received: from [192.168.69.223] ([176.187.209.146])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa59991f215sm586668766b.158.2024.12.03.00.40.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Dec 2024 00:40:07 -0800 (PST)
Message-ID: <6334bba6-bbe8-404d-94b8-684c7acc43d9@linaro.org>
Date: Tue, 3 Dec 2024 09:40:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-9.2] target/riscv: Avoid bad shift in
 riscv_cpu_do_interrupt()
To: Alistair Francis <alistair23@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org
References: <20241128103831.3452572-1-peter.maydell@linaro.org>
 <CAKmqyKOYjhdp1fNSnqGdhyFJF2Ywhi16q_h3+LaATFuFFqoHpg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAKmqyKOYjhdp1fNSnqGdhyFJF2Ywhi16q_h3+LaATFuFFqoHpg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52d.google.com
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

Hi Alistair,

On 3/12/24 07:31, Alistair Francis wrote:
> On Thu, Nov 28, 2024 at 7:39 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> In riscv_cpu_do_interrupt() we use the 'cause' value we got out of
>> cs->exception as a shift value.  However this value can be larger
>> than 31, which means that "1 << cause" is undefined behaviour,
>> because we do the shift on an 'int' type.
>>
>> This causes the undefined behaviour sanitizer to complain
>> on one of the check-tcg tests:
>>
>> $ UBSAN_OPTIONS=print_stacktrace=1:abort_on_error=1:halt_on_error=1 ./build/clang/qemu-system-riscv64 -M virt -semihosting -display none -device loader,file=build/clang/tests/tcg/riscv64-softmmu/issue1060
>> ../../target/riscv/cpu_helper.c:1805:38: runtime error: shift exponent 63 is too large for 32-bit type 'int'
>>      #0 0x55f2dc026703 in riscv_cpu_do_interrupt /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/clang/../../target/riscv/cpu_helper.c:1805:38
>>      #1 0x55f2dc3d170e in cpu_handle_exception /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/clang/../../accel/tcg/cpu-exec.c:752:9
>>
>> In this case cause is RISCV_EXCP_SEMIHOST, which is 0x3f.
>>
>> Use 1ULL instead to ensure that the shift is in range.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> 
> Thanks!
> 
> Applied to riscv-to-apply.next

Since next release PRs are due in less than 4h, I'll take this
patch via my hw-misc tree (I already ran various tests with it).

Regards,

Phil.

