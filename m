Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D30A3EE7FF4
	for <qemu-riscv@archiver.kernel.org>; Mon, 11 Sep 2023 09:10:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qfcwM-0005oV-2x; Mon, 11 Sep 2023 05:10:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qfcwH-0005md-Fh
 for qemu-riscv@nongnu.org; Mon, 11 Sep 2023 05:10:37 -0400
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qfcw7-0006pe-0b
 for qemu-riscv@nongnu.org; Mon, 11 Sep 2023 05:10:35 -0400
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-1d5bb38117dso603595fac.3
 for <qemu-riscv@nongnu.org>; Mon, 11 Sep 2023 02:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1694423424; x=1695028224; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=v6KL3AQc1fIYMHFWWMJmbaO2tRaCrTHkjxVknVhqafk=;
 b=AOX2CtAIzJz0ymww1MkxNeQtEad7WYozUJddOJZmgWbFu7ChpqifZSUczIlhjuOhkf
 Dx1I4YY9yIvRQed9vjKXcdCPC3vW0pPHiq7mfKlZVLfhATcypu5Bq0saOb+cJjA1xtuE
 jR0cEOTGkm2kDKkPmfa6DmlrTZJ58bs85pWftqNQP2Sq4+mLJiKN8GTRXIMY20KFi5n4
 1bmKUfew8aXIcdcxBRIxgiBgq9zZarS5sCHgLA4ci6im6JQIht1xORr9tfID/h/LdG7f
 1qLbKSvh+GqKZF7jiMXck3PXTLY62dlDr7VATTnOAHeqVOIz5Minfev4pwzWaFcaZsyS
 poyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694423424; x=1695028224;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v6KL3AQc1fIYMHFWWMJmbaO2tRaCrTHkjxVknVhqafk=;
 b=iR/K03aUEJB5/zb2+nT4nJydrJuAkAVGL8oKqADRfS0MORSn1khCXwgd6dPHRFBMFE
 mInDw51kCzDagkuMDKa+qYVhLwbakujHpwEpiDjJkVszJuulA2phBBBuqsInsB+fuzYp
 XtWjlGxB8WFtHUzOC3wSSskYg/EnrnsL9gTMHJo/OtLJBOP6GobB7eOkkKbKtC9UHsdz
 9i8o6qH2d/a20u077cezntQ0vBnG98RIVqXPynP905nyp9+Q343duMEBhjTm3UfB+zlZ
 tUm1pBaYcmCbQDe6qO3BhJk0OSHp3HQFu4+A6LYjGS68zTlOdfvLKaEFt0+cHgLtrKkg
 TlbQ==
X-Gm-Message-State: AOJu0Yyh48PKQ5cmRAnt+rlBzh1t+GpS/3ITQAUBXfQLxKqb/mmp0qnh
 JycyaXSSdTD/Ds1WOu9WTRa2bw==
X-Google-Smtp-Source: AGHT+IFLwRVq2v68XeNxLaBKQmhhJMNYapU9fQ599+xIvMM/6eBgHoI9kdnJVjHRJ8cmjzLRdmWK8Q==
X-Received: by 2002:a05:6870:8188:b0:1bb:cb02:7b97 with SMTP id
 k8-20020a056870818800b001bbcb027b97mr10604407oae.37.1694423424204; 
 Mon, 11 Sep 2023 02:10:24 -0700 (PDT)
Received: from [192.168.68.107] ([177.9.182.82])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a056870e28200b001cd07e1c66dsm3785329oad.6.2023.09.11.02.10.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Sep 2023 02:10:23 -0700 (PDT)
Message-ID: <e7b5c115-d1b7-313a-3da5-8466a2f6cba3@ventanamicro.com>
Date: Mon, 11 Sep 2023 06:10:20 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v9 00/20] riscv: 'max' CPU, detect user choice in TCG
Content-Language: en-US
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 palmer@rivosinc.com, ajones@ventanamicro.com
References: <20230901194627.1214811-1-dbarboza@ventanamicro.com>
 <CAKmqyKO3FX7tooTMeOh7ENVh+ca3eAYwqC-QV9h+r7615scXSQ@mail.gmail.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <CAKmqyKO3FX7tooTMeOh7ENVh+ca3eAYwqC-QV9h+r7615scXSQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2e.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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



On 9/10/23 23:34, Alistair Francis wrote:
> On Sat, Sep 2, 2023 at 5:48 AM Daniel Henrique Barboza
> <dbarboza@ventanamicro.com> wrote:
>>
>> Hi,
>>
>> This new version contains suggestions made by Andrew Jones in v8.
>>
>> Most notable change is the removal of the opensbi.py test in patch 11,
>> which was replaced by a TuxBoot test. It's more suitable to test the
>> integrity of all the extensions enabled by the 'max' CPU.
>>
>> The series is available in this branch:
>>
>> https://gitlab.com/danielhb/qemu/-/tree/max_cpu_user_choice_v9
>>
>> Patches missing acks: 11, 15
>>
>> Changes from v8:
>> - patch 7:
>>    - add g_assert(array) at the start of riscv_cpu_add_qdev_prop_array()
>> - patch 8:
>>    - add g_assert(array) at the start of riscv_cpu_add_kvm_unavail_prop_array()
>> - patch 11:
>>    - removed both opensbi.py tests
>>    - added 2 'max' cpu tuxboot tests in tuxrun_baselines.py
>> - patch 12:
>>    - fixed typos in deprecated.rst
>> - patch 15:
>>    - use g_assert_not_reached() at the end of cpu_cfg_ext_get_min_version()
>> - patch 19:
>>    - added comment on top of riscv_cpu_add_misa_properties() explaining why
>>      we're not implementing user choice support for MISA properties
>> - patch 20:
>>    - warn_report() is now called after the G error conditions
>> - v8 link: https://lore.kernel.org/qemu-riscv/20230824221440.484675-1-dbarboza@ventanamicro.com/
>>
>>
>>
>> Daniel Henrique Barboza (20):
>>    target/riscv/cpu.c: split CPU options from riscv_cpu_extensions[]
>>    target/riscv/cpu.c: skip 'bool' check when filtering KVM props
>>    target/riscv/cpu.c: split kvm prop handling to its own helper
>>    target/riscv: add DEFINE_PROP_END_OF_LIST() to riscv_cpu_options[]
>>    target/riscv/cpu.c: split non-ratified exts from
>>      riscv_cpu_extensions[]
>>    target/riscv/cpu.c: split vendor exts from riscv_cpu_extensions[]
>>    target/riscv/cpu.c: add riscv_cpu_add_qdev_prop_array()
>>    target/riscv/cpu.c: add riscv_cpu_add_kvm_unavail_prop_array()
>>    target/riscv/cpu.c: limit cfg->vext_spec log message
>>    target/riscv: add 'max' CPU type
>>    avocado, risc-v: add tuxboot tests for 'max' CPU
>>    target/riscv: deprecate the 'any' CPU type
>>    target/riscv/cpu.c: use offset in isa_ext_is_enabled/update_enabled
>>    target/riscv: make CPUCFG() macro public
>>    target/riscv/cpu.c: introduce cpu_cfg_ext_auto_update()
>>    target/riscv/cpu.c: use cpu_cfg_ext_auto_update() during realize()
>>    target/riscv/cpu.c: introduce RISCVCPUMultiExtConfig
>>    target/riscv: use isa_ext_update_enabled() in
>>      init_max_cpu_extensions()
>>    target/riscv/cpu.c: honor user choice in cpu_cfg_ext_auto_update()
>>    target/riscv/cpu.c: consider user option with RVG
> 
> This series has some build issues. I was hoping a few simple #ifdef
> changes would fix it, but it's a little more complex than that
> unfortunately.
> 
> I'm going to drop this series, do you mind sending a new version which
> fixes this and any other build failures:
> https://gitlab.com/qemu-project/qemu/-/jobs/5045998521

Sure. I'll wait for the pending PR to be merged first. I'll also take the
opportunity  to make the CONFIG_KVM change that Phil requested.


Thanks,

Daniel

> 
> Alistair
> 
>>
>>   docs/about/deprecated.rst         |  12 +
>>   target/riscv/cpu-qom.h            |   1 +
>>   target/riscv/cpu.c                | 564 +++++++++++++++++++++---------
>>   target/riscv/cpu.h                |   2 +
>>   target/riscv/kvm.c                |   8 +-
>>   tests/avocado/tuxrun_baselines.py |  32 ++
>>   6 files changed, 450 insertions(+), 169 deletions(-)
>>
>> --
>> 2.41.0
>>
>>

