Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 339B3C54FB9
	for <qemu-riscv@archiver.kernel.org>; Thu, 16 Nov 2023 16:21:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r3f6y-0006pU-12; Thu, 16 Nov 2023 11:21:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3f6w-0006og-6c
 for qemu-riscv@nongnu.org; Thu, 16 Nov 2023 11:20:58 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3f6t-0000rN-Dd
 for qemu-riscv@nongnu.org; Thu, 16 Nov 2023 11:20:57 -0500
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-32da7ac5c4fso727989f8f.1
 for <qemu-riscv@nongnu.org>; Thu, 16 Nov 2023 08:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700151652; x=1700756452; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zU0y/oNPBlXNKcCKBdzv6P0WXp12W1o/8xvu9k23CBM=;
 b=Yy1gmrnTty4pzUgP3ZdAa1oMxBGi1bqVzDsHmJl5UFZ2Rok+U8jpv9Ett2KIB8HF7A
 L4i1MCOxY3j6PnqhQWVGcaIFoWU2e32C3NSLV/MaMVU/PV7DZKjjdyxQveC8upITwB67
 x+4HWz8/E29LyighsVyFbxQZj8EW0cY5dE9jbw/o9iN4vxVfQFloLVO1hWhx6wuNwc0X
 1Uqff6RwuzmfZZvfABVLEAoq36yFjugYsCC3Qx9f2YxgedNa65f6YNGSXGEwxs/hxvpR
 +cMeywP2QNHJpk/7uMNKEE8ct0PFSPMdc2tbvu1oZwQAzo1/0580kytjKbmyw0tDcQsI
 Mydg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700151652; x=1700756452;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zU0y/oNPBlXNKcCKBdzv6P0WXp12W1o/8xvu9k23CBM=;
 b=AIdMAgVZ7Sc/MZVPCkbdmCz0OAYrxyqyS0Hx+pZGzP+fKlrQq303pDvGxprY+vYpP+
 lok/vnG2VYArS1i9v46GAFxHgnahW24JEVOZ0eoBx6HmUvD+Ste11RlNBBXFOVvt4MuO
 bd1AQanbJgB8wizF2y3PDYK+tGhr+4BfpvIupI4sGC9logDvTaCe027TN1qNev9UeNl4
 XwQgWnOthtQwbUB4zgvrZZh7yGIBHCWxkYT11pqnKQ1kNMVaSjmTPmPMCsZmJFcCO4XH
 mab28RVgg2UtNlvJexs7hBT4QKV1Mi1KhZqkYN3kwXKbcsxvHX1DVqy7yF5AvpuLxN2k
 O/BQ==
X-Gm-Message-State: AOJu0YzxH7g1mgmQkZSGDYJ1XEK8kw0X7GxpY9uddba/HO5GZz+JQXMY
 XXuVofkT1nefNRmcm++bjwbrbQ==
X-Google-Smtp-Source: AGHT+IGFWnnT2ucR8Qe9SSsf9y3OPbtxZ4Zx0BEfVq92Hg2nUJAGZdWYFisO0MI97lnvOpGQX48qJw==
X-Received: by 2002:a05:6000:1845:b0:32f:7fb0:de13 with SMTP id
 c5-20020a056000184500b0032f7fb0de13mr12173865wri.5.1700151652383; 
 Thu, 16 Nov 2023 08:20:52 -0800 (PST)
Received: from [192.168.69.100] ([176.187.220.205])
 by smtp.gmail.com with ESMTPSA id
 d16-20020adfe850000000b0032fb17c65desm14099905wrn.19.2023.11.16.08.20.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Nov 2023 08:20:51 -0800 (PST)
Message-ID: <78526851-6d44-4c18-97b8-57462fb42ab7@linaro.org>
Date: Thu, 16 Nov 2023 17:20:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/31] Unified CPU type check
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 imp@bsdimp.com, kevans@freebsd.org, richard.henderson@linaro.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, imammedo@redhat.com,
 b.galvani@gmail.com, strahinja.p.jankovic@gmail.com, sundeep.lkml@gmail.com,
 kfting@nuvoton.com, wuhaotsh@google.com, nieklinnenbank@gmail.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 laurent@vivier.eu, vijai@behindbytes.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, mrolnik@gmail.com,
 edgar.iglesias@gmail.com, bcain@quicinc.com, gaosong@loongson.cn,
 aurelien@aurel32.net, jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com,
 chenhuacai@kernel.org, shorne@gmail.com, npiggin@gmail.com, clg@kaod.org,
 ysato@users.sourceforge.jp, kbastian@mail.uni-paderborn.de,
 jcmvbkbc@gmail.com, shan.gavin@gmail.com
References: <20231114235628.534334-1-gshan@redhat.com>
 <efc49f7b-70f5-4ce9-8179-79e8a6abd732@linaro.org>
In-Reply-To: <efc49f7b-70f5-4ce9-8179-79e8a6abd732@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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

On 16/11/23 14:35, Philippe Mathieu-Daudé wrote:
> Hi Gavin,
> 
> On 15/11/23 00:55, Gavin Shan wrote:
>> There are two places where the user specified CPU type is checked to see
>> if it's supported or allowed by the board: machine_run_board_init() and
>> mc->init(). We don't have to maintain two duplicate sets of logic. This
>> series intends to move the check to machine_run_board_init() so that we
>> have unified CPU type check.
> 
> 
>> Gavin Shan (30):
>>    target/alpha: Remove 'ev67' CPU class
>>    target/hppa: Remove object_class_is_abstract()
>>    target: Remove 'oc == NULL' check
>>    cpu: Add helper cpu_model_from_type()
>>    cpu: Add generic cpu_list()
>>    target/alpha: Use generic cpu_list()
>>    target/arm: Use generic cpu_list()
>>    target/avr: Use generic cpu_list()
>>    target/cris: Use generic cpu_list()
>>    target/hexagon: Use generic cpu_list()
>>    target/hppa: Use generic cpu_list()
>>    target/loongarch: Use generic cpu_list()
>>    target/m68k: Use generic cpu_list()
>>    target/mips: Use generic cpu_list()
>>    target/openrisc: Use generic cpu_list()
>>    target/riscv: Use generic cpu_list()
>>    target/rx: Use generic cpu_list()
>>    target/sh4: Use generic cpu_list()
>>    target/tricore: Use generic cpu_list()
>>    target/xtensa: Use generic cpu_list()
>>    target: Use generic cpu_model_from_type()
>>    machine: Constify MachineClass::valid_cpu_types[i]
> 
> I'm queuing patches 1-3 & 5-23 to my cpus-next tree. No need to
> repost them, please base them on my tree. I'll follow up with the
> branch link when I finish my testing and push it.

Here are these patches queued:

   https://github.com/philmd/qemu.git branches/cpus-next

I might queue more patches before the 9.0 merge window opens.

Regards,

Phil.

