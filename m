Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C1C6C83F2C
	for <qemu-riscv@archiver.kernel.org>; Mon,  4 Sep 2023 05:13:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qd1st-0001EA-H3; Mon, 04 Sep 2023 01:12:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qd1sr-0001Cw-Nj
 for qemu-riscv@nongnu.org; Mon, 04 Sep 2023 01:12:21 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qd1sl-0000mq-VG
 for qemu-riscv@nongnu.org; Mon, 04 Sep 2023 01:12:21 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-523100882f2so1305477a12.2
 for <qemu-riscv@nongnu.org>; Sun, 03 Sep 2023 22:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693804334; x=1694409134; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NiA1VuA4y4Hb5mu8pl1p+1zSWDEvOlvH/dn8f2wlrZM=;
 b=eVlH8RyYQhMyw5WpHzG+2l5zbJKncTpoMd9tQJPrVytnArfDoIeIFuA1asLem4Txct
 WDg7JijxojuEqSsWsFMZiBLyd2+Cxg0bPLjmWiQKGxsnYuSYPO7Mr5xaZSh6ELZWH2mR
 E4Alg7IGsBVzZVJGpZ8Nyr8WZy+ff/Yj/MB8SdSgq66y6HTgOX8ewjpEWiGLaKJ40gU6
 BarVwsXzVhauMHmNZSV7cAJ1J6nfeeqhlcC6uaJf8ctb/WA93s4j6EMyrIIHq4tjO/ap
 MS/INV4bDMs7z90gBlirssXBPYW2r859aOykPL3V3GHsM48DaINEUHkMMZPd/C52knO0
 af3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693804334; x=1694409134;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NiA1VuA4y4Hb5mu8pl1p+1zSWDEvOlvH/dn8f2wlrZM=;
 b=ZhoStYB1ITPkDNNrwlpi+r2vPkZZ5UhJBzWpVHX8PK0eBwhF6t8yWqa8XrK00q2UbJ
 9Ufh7ELbBOdMP+m3lXAEf7Kd2HSLhVLaFPtWaLKRRbqrKcTSEuwkXKLNg8j33gbtEaGk
 5Yki9ekiaWwEUCHDMc6eGLPu+36+FA3XMUhoqiBdRWSzNsRK9UODtoOTP19FzD0Ql4ZY
 YSAE5MLvcO9bkzlCrHlAUFB73XubaWn0xM210zD1WEoCXjkCeF0NMikbS0giFiM+9P5Y
 qe+0MFwxXuHNjSjjw5F/cmo/eEJeaL43MqZuxjzXr+UQASRT11P9NpVuzhGGIpbnzlk0
 fzBQ==
X-Gm-Message-State: AOJu0Yz3+qan3/4uVXAEcPaNMc+zsfxJjnkNmKFkxxbD8UpQWl/jvd7Z
 XBp09JsocJvixbMhjZuLjGZwdg==
X-Google-Smtp-Source: AGHT+IEUwGy+hzqjPiyzrBlcBR21kILVgmFzGfQycBlvcjIQmkguNSH4VGLwr4WmB1jJx4QsfJqrYg==
X-Received: by 2002:a17:906:2921:b0:9a5:b8c1:916c with SMTP id
 v1-20020a170906292100b009a5b8c1916cmr6518430ejd.30.1693804333672; 
 Sun, 03 Sep 2023 22:12:13 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.209.227])
 by smtp.gmail.com with ESMTPSA id
 x2-20020aa7dac2000000b005272523b162sm5238593eds.69.2023.09.03.22.12.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Sep 2023 22:12:13 -0700 (PDT)
Message-ID: <a69633a4-54a1-8dcf-6e87-fa43623dbfe6@linaro.org>
Date: Mon, 4 Sep 2023 07:12:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH 4/8] hw/core/cpu: Return static value with gdb_arch_name()
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Mikhail Tyutin <m.tyutin@yadro.com>, Aleksandr Anenkov
 <a.anenkov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Peter Maydell
 <peter.maydell@linaro.org>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>
References: <20230903043030.20708-1-akihiko.odaki@daynix.com>
 <20230903043030.20708-5-akihiko.odaki@daynix.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230903043030.20708-5-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
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

On 3/9/23 06:30, Akihiko Odaki wrote:
> All implementations of gdb_arch_name() returns dynamic duplicates of
> static strings. It's also unlikely that there will be an implementation
> of gdb_arch_name() that returns a truly dynamic value due to the nature
> of the function returning a well-known identifiers. Qualify the value
> gdb_arch_name() with const and make all of its implementations return
> static strings.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   include/hw/core/cpu.h  | 2 +-
>   target/ppc/internal.h  | 2 +-
>   gdbstub/gdbstub.c      | 4 +---
>   target/arm/cpu.c       | 6 +++---
>   target/arm/cpu64.c     | 4 ++--
>   target/i386/cpu.c      | 6 +++---
>   target/loongarch/cpu.c | 4 ++--
>   target/ppc/gdbstub.c   | 6 +++---
>   target/riscv/cpu.c     | 6 +++---
>   target/s390x/cpu.c     | 4 ++--
>   target/tricore/cpu.c   | 4 ++--
>   11 files changed, 23 insertions(+), 25 deletions(-)

Nice.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


