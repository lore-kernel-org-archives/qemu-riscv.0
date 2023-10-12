Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2FB1CDB46E
	for <qemu-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 15:54:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qqy0R-0003xt-Hj; Thu, 12 Oct 2023 11:53:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qqy0P-0003x6-KR
 for qemu-riscv@nongnu.org; Thu, 12 Oct 2023 11:53:45 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qqy0M-0003Ke-NX
 for qemu-riscv@nongnu.org; Thu, 12 Oct 2023 11:53:45 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-51e28cac164so4764202a12.1
 for <qemu-riscv@nongnu.org>; Thu, 12 Oct 2023 08:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697126021; x=1697730821; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Q+xORZM9Yq9cP7wH5c3U+ZvE+B2XoO1bTQHG5hQkecs=;
 b=bYGocSPOmtzaySvZI8AAwY8JI7Lgz6xh8FYdURxjbY7MBtzepj2BBP3F0L0uP3MN0P
 0R8ISsIm0rntF1zRnBjEgz4Ywb7zGNY4Ke6DefnjDASdmLimlnreJuRrp8SjLFAEKRDI
 VxtNaHpwsFi5XzDauNBNBy/rkpGOZFlI0Dh0hEoUhKhrzgS1by0Xag+XFqJslHOVL3Wa
 1JX3yjvPTfIsVnvH6ex94Xak5OMu7zO+gxE5Nd5iUR8hrWHiTBbismN1YtqTSiSnF10O
 S4LIVHF5WmN7PY65hKBV4gLfDfRL0TWDklbY7WbtEq8sCwBZfHwP43f7zShBR2+tZCBi
 Qp+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697126021; x=1697730821;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q+xORZM9Yq9cP7wH5c3U+ZvE+B2XoO1bTQHG5hQkecs=;
 b=BnwI8A9tgmMsiS48wpg0nLsIuOOkUwJ3SLO9PFzK6Taz5iwYSp+BJ7VC0Pl0ZfknUQ
 hdBQSoj+LhJSN6M/BNuCqLYyotVWshieT7spaSIVV2tovB7/57xpco89ptbh5nvKf0Eq
 r2TFHp2aIi+m9JHGPH0qZSGce5Lr3XY/IQtB3sLuG6vj45YG0sMp237j81rrYxo/0HPG
 pWk5TpcgotQDMyw2LQTGDoEjnAAelBKgC6f2W5mATHNXjZHGBuuMHXiLAptnsRwcjzEx
 prBq02KOkX4lR27qPnYyz/bIP4vC4AC13ZFxlYlwVWRca9bMmOxj93stKvc9gdgNnEiJ
 Ip8g==
X-Gm-Message-State: AOJu0Yzad/xSUsD66L430ZovWKKX0mYCFy0lLyXx+4adaIbfQJD7gGXK
 eWY3f7VAfdQ5Wuq8uP+zWT+8sg==
X-Google-Smtp-Source: AGHT+IFuAq+uu+hWxZ+IQ/Zyfegvh2aLCli5ylErNQSfiiRZjFECcQPS7rMWXrUuPA9BQrJuTanLEw==
X-Received: by 2002:a17:906:4a03:b0:9b2:be2f:e31a with SMTP id
 w3-20020a1709064a0300b009b2be2fe31amr23197563eju.31.1697126020933; 
 Thu, 12 Oct 2023 08:53:40 -0700 (PDT)
Received: from [192.168.69.115] (176-131-211-232.abo.bbox.fr.
 [176.131.211.232]) by smtp.gmail.com with ESMTPSA id
 h13-20020a17090619cd00b009ae587ce135sm11162276ejd.223.2023.10.12.08.53.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Oct 2023 08:53:40 -0700 (PDT)
Message-ID: <358415d4-f8e6-5374-522a-7aa5cdb83485@linaro.org>
Date: Thu, 12 Oct 2023 17:53:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH v11 11/18] gdbstub: Infer number of core registers from XML
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Mikhail Tyutin <m.tyutin@yadro.com>, Aleksandr Anenkov
 <a.anenkov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Peter Maydell
 <peter.maydell@linaro.org>, Michael Rolnik <mrolnik@gmail.com>,
 Brian Cain <bcain@quicinc.com>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Laurent Vivier
 <laurent@vivier.eu>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>
References: <20231012130616.7941-1-akihiko.odaki@daynix.com>
 <20231012130616.7941-12-akihiko.odaki@daynix.com>
 <62fd649b-1c07-c0f5-11cc-ca17ad0675e5@linaro.org>
 <d38a342b-4c63-46b0-9ce3-952412708eea@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <d38a342b-4c63-46b0-9ce3-952412708eea@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.339,
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

On 12/10/23 16:45, Akihiko Odaki wrote:
> On 2023/10/12 22:43, Philippe Mathieu-Daudé wrote:
>> Hi Akihiko,
>>
>> On 12/10/23 15:06, Akihiko Odaki wrote:
>>> GDBFeature has the num_regs member so use it where applicable to
>>> remove magic numbers.
>>>
>>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>>> ---
>>>   include/hw/core/cpu.h   | 3 ++-
>>>   target/s390x/cpu.h      | 2 --
>>>   gdbstub/gdbstub.c       | 5 ++++-
>>>   target/arm/cpu.c        | 1 -
>>>   target/arm/cpu64.c      | 1 -
>>>   target/avr/cpu.c        | 1 -
>>>   target/hexagon/cpu.c    | 1 -
>>>   target/i386/cpu.c       | 2 --
>>>   target/loongarch/cpu.c  | 2 --
>>>   target/m68k/cpu.c       | 1 -
>>>   target/microblaze/cpu.c | 1 -
>>>   target/riscv/cpu.c      | 1 -
>>>   target/rx/cpu.c         | 1 -
>>>   target/s390x/cpu.c      | 1 -
>>>   14 files changed, 6 insertions(+), 17 deletions(-)
>>>
>>> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
>>> index 3968369554..11d4b5cd0c 100644
>>> --- a/include/hw/core/cpu.h
>>> +++ b/include/hw/core/cpu.h
>>> @@ -127,7 +127,8 @@ struct SysemuCPUOps;
>>>    * @gdb_adjust_breakpoint: Callback for adjusting the address of a
>>>    *       breakpoint.  Used by AVR to handle a gdb mis-feature with
>>>    *       its Harvard architecture split code and data.
>>> - * @gdb_num_core_regs: Number of core registers accessible to GDB.
>>> + * @gdb_num_core_regs: Number of core registers accessible to GDB or 
>>> 0 to infer
>>> + *                     from @gdb_core_xml_file.
>>>    * @gdb_core_xml_file: File name for core registers GDB XML 
>>> description.
>>>    * @gdb_stop_before_watchpoint: Indicates whether GDB expects the 
>>> CPU to stop
>>>    *           before the insn which triggers a watchpoint rather 
>>> than after it.


>> Why not remove SysemuCPUOps::gdb_num_core_regs entirely?
> 
> It is used by targets without XMLs and ppc, which overrides the number 
> from XML.

Right.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


