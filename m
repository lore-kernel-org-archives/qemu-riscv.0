Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33147C001DE
	for <qemu-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 13:37:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qQT5U-0002Wb-B9; Mon, 31 Jul 2023 09:37:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qQT5T-0002WL-Pa
 for qemu-riscv@nongnu.org; Mon, 31 Jul 2023 09:37:27 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qQT5R-0007QB-Vd
 for qemu-riscv@nongnu.org; Mon, 31 Jul 2023 09:37:27 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-686f94328a4so2538453b3a.0
 for <qemu-riscv@nongnu.org>; Mon, 31 Jul 2023 06:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1690810644; x=1691415444;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wz6Vx54FIU5ogvkImhwxegOc+8g8JAPNfio7xsw4wDc=;
 b=wF+1m525H0KInlRxDAVoygeysI63uzG64Vkwf9qLMZJGozFYGZJ6UzFS+Ugb0yYro9
 lToi2DrUCcbGyzrskhFTIPqdlKqwdqcwm3VIbSEcAWTcnVvj0bB6L0Yv3GAArekfq0bs
 N1EEexuzXIaN0zwIrQXsqZtwyNpqEEHlT2Ao7BxjKWm/StI0Gi0uy5DyktcsCnLl81r5
 4KuQ3Bz9WEbELeiQ0lJGSoAJDKJesJT5XsmeQRta0jEGKXLWd2e6/42lnTUolAUE84QU
 GtRK6P3PAZDHi6vUMzkcomhpGyAiVuWNRm9z25j8/cLaFv2iHTkQ1yc1DV6jCsoYqg9j
 CeoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690810644; x=1691415444;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wz6Vx54FIU5ogvkImhwxegOc+8g8JAPNfio7xsw4wDc=;
 b=YC5BdNbTOg3OZPBKuflYcSY1xwJy1HDM3Z5wnjDuEsSy6p3ljYiYw/bqWMTWIm9Tbj
 BmqXiXanFpOSBswJL+9531ne6P8+S0wRXra5khOeEZ3J8BvNjg4YN23OVXNp4mxvvTZ5
 K3iYrezRS1GaoAhHYPh6LSA/re/j9kgdh266fHiIpuD/LreUuOGFivWOM0A1lpoc6KtP
 gjayDLj5Uv0C/L/yqG+MWv5wpDtN7aKyzz1Z5nO8ketsdIFopzC8/jFVpYUh9LGJRpsg
 sa+GtAVNbdT4du1yQJ4One5cLvwQ9AxQHS8FzGqtNWEqdGiuM9DCHUjnXOMQMigb7s5V
 K0pg==
X-Gm-Message-State: ABy/qLY7TBfKhRn1rGriLWz2f2xAbymGWEkff1hpkYPnVTFb4dWHeV/w
 fQ27HJw4cItlZRXtZlYCQWTJ/A==
X-Google-Smtp-Source: APBJJlFiuOnRmsCy7oUaEdzbUnuI+jsQ2FM7sZKGG6HwcOpUEPr39FUVgk+v8+IQYZ6JQ4LxEyyxnA==
X-Received: by 2002:a05:6a20:160b:b0:133:bf18:ef7b with SMTP id
 l11-20020a056a20160b00b00133bf18ef7bmr11737737pzj.24.1690810644425; 
 Mon, 31 Jul 2023 06:37:24 -0700 (PDT)
Received: from [10.4.77.224] ([118.103.63.129])
 by smtp.gmail.com with ESMTPSA id
 c11-20020aa78e0b000000b00662c4ca18ebsm7631950pfr.128.2023.07.31.06.37.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jul 2023 06:37:24 -0700 (PDT)
Message-ID: <70355844-5c8f-4e3b-5ba5-d53a116349ac@daynix.com>
Date: Mon, 31 Jul 2023 22:37:14 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 06/24] hw/core/cpu: Replace gdb_core_xml_file with
 gdb_core_feature
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Michael Rolnik
 <mrolnik@gmail.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Brian Cain <bcain@quicinc.com>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Laurent Vivier
 <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
References: <20230731084354.115015-1-akihiko.odaki@daynix.com>
 <20230731084354.115015-7-akihiko.odaki@daynix.com>
 <09cad822-85c2-3e0b-9414-e1da9de2a2d1@linaro.org>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <09cad822-85c2-3e0b-9414-e1da9de2a2d1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42a;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 2023/07/31 22:27, Philippe Mathieu-Daudé wrote:
> On 31/7/23 10:43, Akihiko Odaki wrote:
>> This is a tree-wide change to replace gdb_core_xml_file, the path to
>> GDB XML file with gdb_core_feature, the pointer to GDBFeature. This
>> also replaces the values assigned to gdb_num_core_regs with the
>> num_regs member of GDBFeature where applicable to remove magic numbers.
>>
>> A following change will utilize additional information provided by
>> GDBFeature to simplify XML file lookup.
>>
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>> ---
>>   include/hw/core/cpu.h   | 5 +++--
>>   target/s390x/cpu.h      | 2 --
>>   gdbstub/gdbstub.c       | 6 +++---
>>   target/arm/cpu.c        | 4 ++--
>>   target/arm/cpu64.c      | 4 ++--
>>   target/arm/tcg/cpu32.c  | 3 ++-
>>   target/avr/cpu.c        | 4 ++--
>>   target/hexagon/cpu.c    | 2 +-
>>   target/i386/cpu.c       | 7 +++----
>>   target/loongarch/cpu.c  | 4 ++--
>>   target/m68k/cpu.c       | 7 ++++---
>>   target/microblaze/cpu.c | 4 ++--
>>   target/ppc/cpu_init.c   | 4 ++--
>>   target/riscv/cpu.c      | 7 ++++---
>>   target/rx/cpu.c         | 4 ++--
>>   target/s390x/cpu.c      | 4 ++--
>>   16 files changed, 36 insertions(+), 35 deletions(-)
> 
> 
>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>> index d71a162070..a206ab6b1b 100644
>> --- a/target/arm/cpu.c
>> +++ b/target/arm/cpu.c
>> @@ -2353,7 +2353,6 @@ static void arm_cpu_class_init(ObjectClass *oc, 
>> void *data)
>>   #ifndef CONFIG_USER_ONLY
>>       cc->sysemu_ops = &arm_sysemu_ops;
>>   #endif
>> -    cc->gdb_num_core_regs = 26;
>>       cc->gdb_arch_name = arm_gdb_arch_name;
>>       cc->gdb_get_dynamic_xml = arm_gdb_get_dynamic_xml;
>>       cc->gdb_stop_before_watchpoint = true;
>> @@ -2378,7 +2377,8 @@ static void cpu_register_class_init(ObjectClass 
>> *oc, void *data)
>>       CPUClass *cc = CPU_CLASS(acc);
>>       acc->info = data;
>> -    cc->gdb_core_xml_file = "arm-core.xml";
>> +    cc->gdb_core_feature = gdb_find_static_feature("arm-core.xml");
> 
> Can we have:
> 
>    cc->gdb_core_feature = gdb_find_static_feature(cc->gdb_core_xml_file);
> 
> once in hw/core/cpu-common.c::cpu_class_init()?
> 
> (haven't verified, just wondering)

Unfortunately no, cpu_class_init() earlier than this line. Also the 
feature needs to be resolved here because the next line refers to it.

> 
>> +    cc->gdb_num_core_regs = cc->gdb_core_feature->num_regs;
>>   }
> 
> 

