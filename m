Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D9F4CAC592
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 11:31:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uy7QG-0002RH-Hd; Mon, 15 Sep 2025 07:31:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uy7QB-0002Oe-W5
 for qemu-riscv@nongnu.org; Mon, 15 Sep 2025 07:31:01 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uy7Q0-0000v9-At
 for qemu-riscv@nongnu.org; Mon, 15 Sep 2025 07:30:58 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-77616dce48cso1958246b3a.0
 for <qemu-riscv@nongnu.org>; Mon, 15 Sep 2025 04:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1757935841; x=1758540641; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MHaPpaUUwTF3u2h7vgd4ZSfSpKG/v/F11o+xd7BuNAY=;
 b=dg7aAP/fLGmg7yo2x4vgCV5leelbubNAarQizQAFt8CQfQwIDJ8muv6X4oVnuR85f2
 +XeUiev04yZbJZB55I2y/2Z5vfABe8zygw8E5B2i5Sk9QkXf6nk5a1k1yMGy2XOgc9+i
 VGp5Y4zJZZg7PQ4qlEoh/ZTUw0PvO49JJIRx6CKCu2zcG/FuNaPKriMkJGrcRj1ctAfT
 J5VjmW3gQ+VlR4vvDIRMUZE31eBIGVx9kSiHQQlG1aZAjNabMHcKIoMl7XrtfX5KktN7
 EPcV0beoC23+wljKqYCh/OA7fVspB00DwJaXbWh3CYbXCRlLZQXEkQmv6nLgskqqL/i6
 7mfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757935841; x=1758540641;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MHaPpaUUwTF3u2h7vgd4ZSfSpKG/v/F11o+xd7BuNAY=;
 b=L/E/J4TtsQ2y9xtbc+gAqChXZM4h7MFvvOiy4nl0SnkECNaRpleSrZWI5agYnyCN+y
 tZTzV+J0zCu2OLtEvofJ3VFP8ttiAZiJGpCK7n/uQ0ych2dd2GHQFMhQ11mdBgQVyA2S
 +Oud+JPslzrRaPEAA7eHyhgjHkH1FKb+zKmWBpn2WGDtIq3eWnLedREYZ/uYM+WIjIf0
 Wx23W8tDSK/+G2a4q1WUCKEvO6bzd/t/g7fm3MzwwcYC77J1MSGKSO1Sd48qwBPaDcem
 6FrcgZcNAFnNdiZ9eOHgPteV2rj076ILZcHn983PGOG3Sk0soARJLSx0mmMgbOvcXTgw
 fCrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzGIgNTBN1yDrEMsiPjnh30k1axpmrq2oJODJfDFlL4j7pw0lHJUGS73uofAUxB2ND8QotqRHHDWA7@nongnu.org
X-Gm-Message-State: AOJu0Yx4pxQvenNDQaFLQ29t5hBA22xT+shhZEbWA8j53Vlfbs/2N6Kc
 AkmD36+ASjEjo7LM5wX3sdRLsuxEPymtGMyKHRnLLnFkFNN6Dw0WLvfcNLiOcuC7d0k=
X-Gm-Gg: ASbGncvUuQof9tyJGU8xX6VNn2lUIZOs6wIOvf/azbmqk5XKcjVi4gKL+zYYCY709Dy
 n6i8Wr/aCLpDAcciwRQ7PLe/2ZnCG6v6sEyobU8N3+FQZI+nH5tFnWP11pyNIGi0inNla5iT8dS
 Ayx0So1nrREZKOLjMlV8Fc3nR0o7BNdiKdhq8e9MengYecOrnVBTs2f+uOdAmArz8m0sSRodqyV
 yJ7FfL+BR5M99AhcpmBJDZMwACR6JvTOUNgyGCSh5NaDvksAdN3A4VYKX+vd4ud0Can0cwhdZRY
 /6TnQj8oEgvp7JvtXmJLzbSfgFNes43+E+wQTKgxB00SsFkGjgf92rMTDU7L0o168VYK2Ix9s0q
 3D51YRSsWjBQZToivh7eQ22uMjlq+uAmvaL67+mAEAjcPBZJdO61XOsv4d68M46sfo0+0ik+2ND
 4D+9APUViZwnU=
X-Google-Smtp-Source: AGHT+IGKDcR8Z01ZFprF8e0PG3KgimOJoUd5pK6sn2WYSmuQ7O7oB5kCQXe1Veo/AssAXD63X386KQ==
X-Received: by 2002:a05:6a20:3c8f:b0:262:b539:b889 with SMTP id
 adf61e73a8af0-262b539bcf9mr7297620637.40.1757935841200; 
 Mon, 15 Sep 2025 04:30:41 -0700 (PDT)
Received: from ?IPV6:2804:7f0:bcc0:a026:14f7:a39e:7d17:ef5a?
 ([2804:7f0:bcc0:a026:14f7:a39e:7d17:ef5a])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7761562f25dsm10079357b3a.74.2025.09.15.04.30.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Sep 2025 04:30:40 -0700 (PDT)
Message-ID: <5319bc5d-ee82-43e0-adb2-2657b150a0ea@ventanamicro.com>
Date: Mon, 15 Sep 2025 08:30:34 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-10.1 1/1] roms/opensbi: Update to v1.7
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com
References: <20250723094213.2975268-1-dbarboza@ventanamicro.com>
 <20250723094213.2975268-2-dbarboza@ventanamicro.com>
 <CAKmqyKPirO4wLus3kWeHk_ir6kOTru6U745AVUW1jNzYXbzr2Q@mail.gmail.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Language: en-US
In-Reply-To: <CAKmqyKPirO4wLus3kWeHk_ir6kOTru6U745AVUW1jNzYXbzr2Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x431.google.com
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



On 9/15/25 12:27 AM, Alistair Francis wrote:
> On Wed, Jul 23, 2025 at 7:43 PM Daniel Henrique Barboza
> <dbarboza@ventanamicro.com> wrote:
>>
>> Update OpenSBI and the pre-built opensbi32 and opensbi64 images to
>> version 1.7.
>>
>> It has been almost an year since we last updated OpenSBI (at the time,
>> up to v1.5.1) and we're missing a lot of good stuff from both v1.6 and
>> v1.7, including SBI 3.0 and RPMI 1.0.
>>
>> The changelog is too large and tedious to post in the commit msg so I
>> encourage referring to [1] and [2] to see the new features we're adding
>> into the QEMU roms.
>>
>> [1] https://github.com/riscv-software-src/opensbi/releases/tag/v1.6
>> [2] https://github.com/riscv-software-src/opensbi/releases/tag/v1.7
>>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   .../opensbi-riscv32-generic-fw_dynamic.bin    | Bin 268312 -> 268752 bytes
>>   .../opensbi-riscv64-generic-fw_dynamic.bin    | Bin 272504 -> 273048 bytes
>>   roms/opensbi                                  |   2 +-
>>   3 files changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/pc-bios/opensbi-riscv32-generic-fw_dynamic.bin b/pc-bios/opensbi-riscv32-generic-fw_dynamic.bin
>> index b2e740010b..02be3a72a8 100644
>> Binary files a/pc-bios/opensbi-riscv32-generic-fw_dynamic.bin and b/pc-bios/opensbi-riscv32-generic-fw_dynamic.bin differ
>> diff --git a/pc-bios/opensbi-riscv64-generic-fw_dynamic.bin b/pc-bios/opensbi-riscv64-generic-fw_dynamic.bin
>> index 018b4731a7..cce35c65c2 100644
>> Binary files a/pc-bios/opensbi-riscv64-generic-fw_dynamic.bin and b/pc-bios/opensbi-riscv64-generic-fw_dynamic.bin differ
>> diff --git a/roms/opensbi b/roms/opensbi
>> index 43cace6c36..a32a910691 160000
>> --- a/roms/opensbi
>> +++ b/roms/opensbi
>> @@ -1 +1 @@
>> -Subproject commit 43cace6c3671e5172d0df0a8963e552bb04b7b20
>> +Subproject commit a32a91069119e7a5aa31e6bc51d5e00860be3d80
> 
> https://gitlab.com/qemu-project/opensbi needs to be updated, but I
> don't know how to do that...

I don't think we need to do anything aside from upstreaming this patch. The roms/opensbi
repo will just fetch the new subproject commit.

Note that this is a no-binary patch and can't be directly applied, so you'll need to
cherry-pick from the repo I pointed in the commit msg. This is the commit:

https://gitlab.com/danielhb/qemu/-/commit/ad1292586b2ec3ceb836fb7e46982bfa19920d9f


And then:

$ git submodule update --init roms/opensbi
Submodule 'roms/opensbi' (https://gitlab.com/qemu-project/opensbi.git) registered for path 'roms/opensbi'
Submodule path 'roms/opensbi': checked out 'a32a91069119e7a5aa31e6bc51d5e00860be3d80'
$
$ cd roms/opensbi/
$ ls
CONTRIBUTORS.md  COPYING.BSD  docs  firmware  include  Kconfig  lib  Makefile  platform  README.md  scripts  ThirdPartyNotices.md
$
$ git log
commit a32a91069119e7a5aa31e6bc51d5e00860be3d80 (HEAD, tag: v1.7)
Author: Anup Patel <apatel@ventanamicro.com>
Date:   Mon Jun 30 08:37:30 2025 +0530

     include: Bump-up version to 1.7
     
     Update the OpenSBI version to 1.7 as part of release preparation.
     
     Signed-off-by: Anup Patel <apatel@ventanamicro.com>
     Signed-off-by: Anup Patel <anup@brainfault.org>


Note that 'git submodule' already used https://gitlab.com/qemu-project/opensbi.git to retrieve
the commit we want. I don't think we need to do anything special w.r.t the submodule per se.


Thanks,

Daniel


> 
> Alistair
> 
>> --
>> 2.50.1
>>
>>


