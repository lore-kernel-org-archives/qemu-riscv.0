Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5CA7C001DC
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Jul 2023 14:32:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qP1y2-0006ZI-Sq; Thu, 27 Jul 2023 10:27:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qP1y0-0006Sd-66
 for qemu-riscv@nongnu.org; Thu, 27 Jul 2023 10:27:48 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qP1xx-00068b-Fj
 for qemu-riscv@nongnu.org; Thu, 27 Jul 2023 10:27:47 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-686e0213c0bso775321b3a.1
 for <qemu-riscv@nongnu.org>; Thu, 27 Jul 2023 07:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690468064; x=1691072864;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mnll3YnzAhuEV+dKxBZko/tIefx3NBcNIu5X1R+g1OY=;
 b=fx0lJ8kWrRDT0a4PFHouBRLMX3UqQ5H1OLkkszpedbZr73CGkrvYR4OMUONdQlmCPE
 fNZT5N9WZT370pXtPQJfUAvOaF832YyWYy9Xj/911kDsm2AvWf06/r+G56dFfsWU8Ilr
 nb/Pvi5z4rTb8BlqXLHMb+F2Mrsbcabo+cq1TTw9uzqcU0peg2kqsfPKjzWcroyZMX/6
 Gnj0oC85os51jJoBRGM0ywdpKojG92hs3/pB/fz6u2BVvbF9gTMLjppjZrR+/SY7Cdw3
 kfTY5eJskNrlcJkfxD4GqfmGFlX2+ltpYgipamOooBMFoLC2YbJI/EDtn/gDBZpqsQss
 xQxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690468064; x=1691072864;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mnll3YnzAhuEV+dKxBZko/tIefx3NBcNIu5X1R+g1OY=;
 b=M/QqfN7cVjm88aiWFnTXndthBYu3yH/wjWUHND2nctDUHqMhuib2rj4/GYKYl+OjSY
 4YFJynmbiOLOaa1Jf5aPwKiX62IqlAQquT4xmPBV4zigllOLKXPTBB8p6OGo38M5mS+5
 46i1JNSCdqKP1+pJhImVe0klQx3bBLIu40SKtB7t4uizaSW7K6XE031576Rbi2KUebSV
 IIfzoJniLoS8OFxkSurkKu8AGGKfElcQLuhssn1VByuM/tJO6diJ4CaG9WEn5o7RdjxO
 XwgumtxA2Oq55GGMmFI48o6pRQVDN49aLlOWHQQQDP+AGsAtQae8vmmnD7Lbeh/M7OOl
 FQNQ==
X-Gm-Message-State: ABy/qLbq6cR2d4VjLKtRtbLqYgcZIMkN80eARXbOTdplj/4rk51jtChD
 djjXyWCtqAnwh120PLYmhEQVNA==
X-Google-Smtp-Source: APBJJlFXldcSJ7xbgf9Dm6V4sbu3tej7i31yQSlBEnfXzQ7ZOWwcmfjN98wkxt5MeGwGA/F6Y5Wl2w==
X-Received: by 2002:a05:6a00:1882:b0:668:8596:752f with SMTP id
 x2-20020a056a00188200b006688596752fmr5817168pfh.4.1690468063963; 
 Thu, 27 Jul 2023 07:27:43 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:3178:82f3:53ff:b9bb?
 ([2602:ae:1598:4c01:3178:82f3:53ff:b9bb])
 by smtp.gmail.com with ESMTPSA id
 5-20020a630105000000b0056353c0a03esm1598128pgb.37.2023.07.27.07.27.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jul 2023 07:27:43 -0700 (PDT)
Message-ID: <af279f3d-35b9-e782-8d55-98cd6b3ceb80@linaro.org>
Date: Thu, 27 Jul 2023 07:27:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 3/8] machine: Print supported CPU models instead of
 typenames
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org,
 b.galvani@gmail.com, strahinja.p.jankovic@gmail.com, sundeep.lkml@gmail.com,
 kfting@nuvoton.com, wuhaotsh@google.com, nieklinnenbank@gmail.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, laurent@vivier.eu, vijai@behindbytes.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, imammedo@redhat.com, cohuck@redhat.com,
 pbonzini@redhat.com, shan.gavin@gmail.com
References: <20230726003205.1599788-1-gshan@redhat.com>
 <20230726003205.1599788-4-gshan@redhat.com>
 <24e54bac-9149-20da-e4cf-5829a6dcb174@linaro.org>
 <0454c1ad-314c-3df6-d6e9-1a05cb4c4050@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <0454c1ad-314c-3df6-d6e9-1a05cb4c4050@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
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

On 7/26/23 22:16, Gavin Shan wrote:
> 
> On 7/27/23 09:08, Richard Henderson wrote:
>> On 7/25/23 17:32, Gavin Shan wrote:
>>> -static const char *q800_machine_valid_cpu_types[] = {
>>> +static const char * const q800_machine_valid_cpu_types[] = {
>>>       M68K_CPU_TYPE_NAME("m68040"),
>>>       NULL
>>>   };
>>> +static const char * const q800_machine_valid_cpu_models[] = {
>>> +    "m68040",
>>> +    NULL
>>> +};
>>
>> I really don't like this replication.
>>
> 
> Right, it's going to be lots of replications, but gives much flexibility.
> There are 21 targets and we don't have fixed pattern for the mapping between
> CPU model name and CPU typename. I'm summarizing the used patterns like below.
> 
>    1 All CPU model names are mappinged to fixed CPU typename;
>    2 CPU model name is same to CPU typename;
>    3 CPU model name is alias to CPU typename;
>    4 CPU model name is prefix of CPU typename;
> 
>    Target         Categories    suffix-of-CPU-typename
>    -------------------------------------------------------
>    alpha          -234          -alpha-cpu
>    arm            ---4          -arm-cpu
>    avr            -2--
>    cris           --34          -cris-cpu
>    hexagon        ---4          -hexagon-cpu
>    hppa           1---
>    i386           ---4          -i386-cpu
>    loongarch      -2-4          -loongarch-cpu
>    m68k           ---4          -m68k-cpu
>    microblaze     1---
>    mips           ---4          -mips64-cpu  -mips-cpu
>    nios2          1---
>    openrisc       ---4          -or1k-cpu
>    ppc            --34          -powerpc64-cpu  -powerpc-cpu
>    riscv          ---4          -riscv-cpu
>    rx             -2-4          -rx-cpu
>    s390x          ---4          -s390x-cpu
>    sh4            --34          -superh-cpu
>    sparc          -2--
>    tricore        ---4          -tricore-cpu
>    xtensa         ---4          -xtensa-cpu

That is unfortunate, however...


> There are several options as below. Please let me know which one or something
> else is the best.
> 
> (a) Keep what we have and use mc->valid_{cpu_types, cpu_models}[] to track
> the valid CPU typenames and CPU model names.
> 
> (b) Introduce CPUClass::model_name_by_typename(). Every target has their own
> implementation to convert CPU typename to CPU model name. The CPU model name
> is parsed from mc->valid_cpu_types[i].
> 
>      char *CPUClass::model_by_typename(const char *typename);
> 
> (c) As we discussed before, use mc->valid_cpu_type_suffix and mc->valid_cpu_models
> because the CPU type check is currently needed by target arm/m68k/riscv where we
> do have fixed pattern to convert CPU model names to CPU typenames. The CPU typename
> is comprised of CPU model name and suffix. However, it won't be working when the CPU
> type check is required by other target where we have patterns other than this.

(d) Merge the two arrays together and use macro expansion, e.g.

typedef struct {
     const char *name;
     const char *type;
} Something;

#define ARM_SOMETHING(x)  { x, ARM_CPU_TYPE_NAME(x) }

static const Something valid[] = {
     ARM_SOMETHING("cortex-a53"),
     { NULL, NULL }
};

where Something ought to be better named.


r~

