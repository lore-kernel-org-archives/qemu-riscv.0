Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2260AEB64D7
	for <qemu-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 10:16:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qFBAN-0004r5-Ds; Fri, 30 Jun 2023 06:15:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qFBAM-0004p9-2Y
 for qemu-riscv@nongnu.org; Fri, 30 Jun 2023 06:15:50 -0400
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qFBAK-0002h8-8i
 for qemu-riscv@nongnu.org; Fri, 30 Jun 2023 06:15:49 -0400
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2b6a084a34cso26120671fa.1
 for <qemu-riscv@nongnu.org>; Fri, 30 Jun 2023 03:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688120146; x=1690712146;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=urdJ868+VMnBHLWaVveKOF+PV3LzYkhhHU9YE6dM3+s=;
 b=bf8esDKOXqdOkju73X+8I3cx+eeAjZAyul1kEfyhDg16B4LVAovtz0SFBx/cm2k0kp
 P7LyCeoofMpvwi6y6TCUlP4lsfvsMXAunLuTxXbvVSJI+60jWoHTpROdaeDkkI1U0W+h
 l4cOOCMjfRlyNtth2hztpjFVWIdanWm9TStrv3bX7c9KcgckPq9sV717mGdAfgASull5
 lvFYLifjWOtvyY9AdcCfnc8t+6eUHOsqlvVyBkliV9hLSuxsW7c2htD0QvE4k/LTz0Bm
 kShmOJ8DtH5ZR/KfRer1UaLUvT0DSpuIxBJQPS64B8lGOGYS+Vor0DgJEa/sC2FKqA36
 XzDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688120146; x=1690712146;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=urdJ868+VMnBHLWaVveKOF+PV3LzYkhhHU9YE6dM3+s=;
 b=AgoIRQAzSnVm7/EjApmnBgQNClSCWF+qNholsEmaKOsjK2JBkqmQApxvxBnt2s0cVy
 RqC0ilatN5EDXSS23wdq2V800ECxPf2dW2ZRKO7Vh6hxGGuPjtW+qVjhbZIYRnKJy3nv
 BZ64lg6Y78733mlzpCgfb9tUayvA+XC4O96oTG34QAGXXoNiiwPgTE45Q3p7PlEPrLQs
 KwoKfT00uZ2UoVZybewJ3Cg2mLRCfupazxv376XC1HVBg/mJCu0uvr95xq/Amm6+ULqo
 WeYcEydzP/a6dwsLtKx/P5bYXea/EyAaluNXWuXS7DNe2nLzl1Zt4rLWFwJc9js96+Fq
 UXrQ==
X-Gm-Message-State: ABy/qLYYa0x0uVo7Jyml9uhF8s/5MnFhdT7TBle0WeEROWnWKcOUlkCd
 nmdRtdZ5VSCGgBE1K8E2Mnx3Ow==
X-Google-Smtp-Source: APBJJlFlrjHiQePgTYCaeeCwpQ/TAYXEQJxGt9t1tDP1bfAK3oHYysREVzGOe13lgMnB3ajCLY0rug==
X-Received: by 2002:a2e:9252:0:b0:2b3:4ea3:d020 with SMTP id
 v18-20020a2e9252000000b002b34ea3d020mr1731174ljg.17.1688120145504; 
 Fri, 30 Jun 2023 03:15:45 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.211.104])
 by smtp.gmail.com with ESMTPSA id
 p2-20020a056402044200b0051beb873d98sm6500940edw.27.2023.06.30.03.15.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jun 2023 03:15:45 -0700 (PDT)
Message-ID: <d1367b5b-c432-5939-6af1-c279617fa4b9@linaro.org>
Date: Fri, 30 Jun 2023 12:15:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v7 11/20] target/riscv/cpu: add misa_ext_info_arr[]
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com
References: <20230630100811.287315-1-dbarboza@ventanamicro.com>
 <20230630100811.287315-12-dbarboza@ventanamicro.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230630100811.287315-12-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x22f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.093,
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

On 30/6/23 12:08, Daniel Henrique Barboza wrote:
> Next patch will add KVM specific user properties for both MISA and
> multi-letter extensions. For MISA extensions we want to make use of what
> is already available in misa_ext_cfgs[] to avoid code repetition.
> 
> misa_ext_info_arr[] array will hold name and description for each MISA
> extension that misa_ext_cfgs[] is declaring. We'll then use this new
> array in KVM code to avoid duplicating strings. Two getters were added
> to allow KVM to retrieve the 'name' and 'description' for each MISA
> property.
> 
> There's nothing holding us back from doing the same with multi-letter
> extensions. For now doing just with MISA extensions is enough.
> 
> It is worth documenting that even using the __bultin_ctz() directive to
> populate the misa_ext_info_arr[] we are forced to assign 'name' and
> 'description' during runtime in riscv_cpu_add_misa_properties(). The
> reason is that some Gitlab runners ('clang-user' and 'tsan-build') will
> throw errors like this if we fetch 'name' and 'description' from the
> array in the MISA_CFG() macro:
> 
> ../target/riscv/cpu.c:1624:5: error: initializer element is not a
>                                compile-time constant
>      MISA_CFG(RVA, true),
>      ^~~~~~~~~~~~~~~~~~~
> ../target/riscv/cpu.c:1619:53: note: expanded from macro 'MISA_CFG'
>      {.name = misa_ext_info_arr[MISA_INFO_IDX(_bit)].name, \
>               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
> 
> gcc and others compilers/builders were fine with that change. We can't
> ignore failures in the Gitlab pipeline though, so code was changed to
> make every runner happy.
> 
> As a side effect, misa_ext_cfg[] is no longer a 'const' array because
> it must be set during runtime.
> 
> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/cpu.c | 110 +++++++++++++++++++++++++++++++++------------
>   target/riscv/cpu.h |   7 ++-
>   2 files changed, 88 insertions(+), 29 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


