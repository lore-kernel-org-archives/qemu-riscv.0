Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B8BC8303C
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Jul 2025 21:22:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uZFK6-0002b5-Ui; Tue, 08 Jul 2025 16:53:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uZEFK-0000U2-Hh
 for qemu-riscv@nongnu.org; Tue, 08 Jul 2025 15:44:55 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uZEFJ-0006jz-5q
 for qemu-riscv@nongnu.org; Tue, 08 Jul 2025 15:44:54 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-6088d856c6eso9243484a12.0
 for <qemu-riscv@nongnu.org>; Tue, 08 Jul 2025 12:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752003891; x=1752608691; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hI8sAmJ13x4dAhHqQ5KRW0VbwKRcg/Fsqe6mUGhQqN4=;
 b=bpJ7qnrdAM4MyjZlxtMMzgrptVxfu9WIeVflX7bG8c6VB/IOmNDzp+5C6czFYlnmyT
 /lmsoBf9FKIKpLovC/K3V7zxnkXGNvNCYnHb8CP1S+XMm4QY9oLLiC4X262oZO/KjYcK
 xFQRCM+diPik5rzq4Fpij1dpdGkn3Mj1KhxqNL9n4pbbJEjaq61fBC2IvVKC4DDfhQc1
 K2ZokEHq8vG0JK34/FoLrdrfu2qK+y2r/3aOn6/FowJHust3zQvvAvJljK+VF6/LJy1n
 Q6HDJofNJi82dBjuevjRr/5ZnIeed4FJTq8FIxeAEB1LJEUP7lN15hcmvivy9CwkMcxN
 xNPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752003891; x=1752608691;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hI8sAmJ13x4dAhHqQ5KRW0VbwKRcg/Fsqe6mUGhQqN4=;
 b=QhvQQwgfu0ngjDM3veVZ8VawS3oLiUPr0o8LX7XU/JM47GtP1jxIdsiuM40N4mxvQR
 Q29oEzU/b6xIcdvLS+NPpgCSqYdTcRsNIUhmeHZHUg2z8a9wNFNd9hyChnU+/ZLMLYME
 F0zkMLoyB7eXP/xEkYbeOFS3QWBe0W27V18Dp5NcAdjYDo7sByCAMHSa9IjOiQYp9me/
 Vg3wYzgsE0rhJpLcyZ2tEzWoCXuq1Ku7Y+4fc41MbCr7YeIixh3AIKTllnRpY+tCz525
 qoGQiftumq/Sf7VJFKZfSY+dUwv1jhin3ta1A4EsekHlUO8NF9X3LPeInVHjEU/K34iF
 bPMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEvlGl16g1CKjckl/P8gOC0axYonDncWobBFV1pDrULNFzlwSwIza7FjNAo55W7gL+hIDIIOkv55XW@nongnu.org
X-Gm-Message-State: AOJu0YzlhI3k5WF7O65bQKbuwd+EQXLQ4owcSwAklcmmg7dt4AD77spK
 eyv75cB+FtYF6W3pt8b70iQ1bJCRIz+6HP0bzXSm89onIVkCe8cY21BjpX4KJh1Q0HIIEOUplfy
 pPOeIN+c=
X-Gm-Gg: ASbGncvYpgDqmX2Qmju3c7MRURosYxImEdtdVZOejS3v8KxwuY3vcGNEiwRW/jwo9XW
 Q/+ogEDYOhPL/CiucU3K2oEr7b/nOxOF7MbXKUzAqCJOT4wwNgq2s2QMqTqTV/ZXVUtMmdYpRMN
 5uUui7PgEXKk/4sMghZmUYx/tokW5hwQ9NyCA6ccJvaNp8ooyy4A5m61mJac1kHpfD39qf2ADv5
 KKTj7T2dtuxIgvX5zoae6zrRmgz/GCSYeWh0iD2FHz9c2ALsR/w3LhsuhbewwWOEzPbodnBpNCm
 FyDJOZkRJPs6rfZayYLPX2KiVnlNAQ+rhsMBTDJmYpkZ9Fh8g8CqcHaEFElGvkGrRKW6N4WwTLv
 z9Ql6kKDcStdliccg4YjpxXOkrHb/H9oJ9DYtaGrR
X-Google-Smtp-Source: AGHT+IEBF8Dg32b2zfK2LEUCiBIqsCkszQ/RmitWt476HpBfkMyJozJs4eVA6oF9QsJ7q9Ox3RaC1w==
X-Received: by 2002:a05:600c:4e05:b0:43d:2313:7b49 with SMTP id
 5b1f17b1804b1-454cd4cbd79mr24423785e9.12.1751970430502; 
 Tue, 08 Jul 2025 03:27:10 -0700 (PDT)
Received: from [192.168.69.242] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454cd39d0f6sm18081605e9.16.2025.07.08.03.27.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 03:27:09 -0700 (PDT)
Message-ID: <21692283-9767-4109-b14b-ef0ff787d856@linaro.org>
Date: Tue, 8 Jul 2025 12:27:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH-for-10.1 v6 00/14] target-info: Add more API for
 VirtIO cleanups & introduce ARM macros
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org
References: <20250707172009.3884-1-philmd@linaro.org>
 <20250707135403-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250707135403-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52f.google.com
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

On 7/7/25 19:55, Michael S. Tsirkin wrote:
> On Mon, Jul 07, 2025 at 07:19:54PM +0200, Philippe Mathieu-Daudé wrote:
>> Rather than re-spinning the whole "single-binary: Make hw/arm/
>> common" series, restrict to the API additions, but include
>> examples of their usefulness (hundreds of virtio objects
>> removed from default Linux build).
>> Time passed since I context-switched out of this work so I'm
>> not sure the DEFINE_MACHINE_WITH_INTERFACES() implementation
>> is in the form Zoltan asked.
> 
> 
> I think I'd prefer to defer cleanups to post 10.1 - already
> too much on my plate as I was out sick. Unless there's a reason
> I'm missing to rush this in? Is there a feature we want in
> 10.1 that depends on it?

Fair enough for the virtio patch.

Hopefully the previous ones (TargetInfo related, not touching
virtio) could get in (you don't have to look a them ;P).

> 
>> Philippe Mathieu-Daudé (14):
>>    target/qmp: Use target_cpu_type()
>>    qemu/target-info: Factor target_arch() out
>>    qemu/target-info: Add %target_arch field to TargetInfo
>>    qemu/target-info: Introduce target_base_arch()
>>    qemu/target-info: Add target_endian_mode()
>>    qemu: Convert target_words_bigendian() to TargetInfo API
>>    gdbstub/helpers: Replace TARGET_BIG_ENDIAN -> target_big_endian()
>>    qemu: Declare all load/store helpert in 'qemu/bswap.h'

