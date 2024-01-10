Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D036AC47073
	for <qemu-riscv@archiver.kernel.org>; Wed, 10 Jan 2024 18:41:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rNdVz-0003R9-03; Wed, 10 Jan 2024 13:41:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rNdVw-0003Qh-Cb
 for qemu-riscv@nongnu.org; Wed, 10 Jan 2024 13:41:20 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rNdVu-0000kg-92
 for qemu-riscv@nongnu.org; Wed, 10 Jan 2024 13:41:19 -0500
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-5ce07cf1e5dso2316218a12.2
 for <qemu-riscv@nongnu.org>; Wed, 10 Jan 2024 10:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1704912074; x=1705516874; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uHAq2jKdxHntFCyEDj442zPebyc09taPifRLZidi7gs=;
 b=BMtvJ/ru1FXcZx0MdcRpcxVGLC7yW9/fQPP1cU+zlHbT4FqnYLl1vY+eqzIFoODDdC
 SQK1MeoSWWwuRMBcgl6qD+PkqjF2vFQ5/okmMvIOfTwkp42IOGoTgV1hn56wjZUk1CI4
 M9NgwbeEwKolYALK/o3iklmxFIDcJcESvU7jmd/xeBlwUqhu8VmMEZU/EhfYN6gAJ4re
 D3oTmiPwdoWP2JFSEyTWqXG6QTl18TYSbI9pRxmwbAKYhJ9RDLY8RIEOzE8J/pAnECJk
 +OE5wh5h9SzILJDn/sT+EE52VPfrLb/rFVApjZUobBkfGdBrUMEuZntwMcvED6Vb7tjQ
 MWBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704912074; x=1705516874;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uHAq2jKdxHntFCyEDj442zPebyc09taPifRLZidi7gs=;
 b=jDuX9nExms1e+JOHyPmMPune8RF2WsdvBhkyDDQvF+ExTysvBZmRLtltpbzLBNQAe9
 IEM1DcPvR+QBr7M4bqWssoDBTTA7ae11LaCQTskwE593uOceAB9Oto+sUNTrKo7vtKWS
 VVpj1NRpyQNTjEnVNB0ESYEl8RMf894B87XESNKqaZFkOsedI0JAl7T1bpxXaGgC2miP
 tlkDpDfz+Ni5AY6X4I06GfpmYMgSTHHpZ2MvMTCis/IhWE28p4U4ZMj4bqVFysWQQtR6
 O7G5SpI6lXUt+caBwb0V5oXodu1yS/st4FiF742b6FtUuj7dXKgoL1GXX+Rbc4QTeOhI
 8fbQ==
X-Gm-Message-State: AOJu0YxdbO+u845eff2TKzhFn3yGI8TYi1VxMNf+Tjo9bHQjTL06lFrX
 OH7jcmGdFLDGOh9sG1yZKKHWN6JDZpaADA==
X-Google-Smtp-Source: AGHT+IGj4dMR87ZZOrGfWCVlcVglpI7p9qF1OXZPp2q2VrY5QfSq/YtGWvnX0ABWZkglUy0Mb2W9Lw==
X-Received: by 2002:a05:6a20:3605:b0:19a:3f76:2a5b with SMTP id
 r5-20020a056a20360500b0019a3f762a5bmr306918pze.66.1704912074419; 
 Wed, 10 Jan 2024 10:41:14 -0800 (PST)
Received: from [192.168.68.110] ([152.234.123.64])
 by smtp.gmail.com with ESMTPSA id
 q19-20020aa79833000000b006d9bfb8a6casm3824931pfl.27.2024.01.10.10.41.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jan 2024 10:41:13 -0800 (PST)
Message-ID: <f88b1fe0-c177-45a7-8c98-fc2168aaab67@ventanamicro.com>
Date: Wed, 10 Jan 2024 15:41:10 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] target/riscv: Enable 'B' extension on max CPU type
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: Rob Bradford <rbradford@rivosinc.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, atishp@rivosinc.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com
References: <20240109171848.32237-1-rbradford@rivosinc.com>
 <20240109171848.32237-4-rbradford@rivosinc.com>
 <de442ad9-0479-4a7e-bccf-97fcd081a35e@ventanamicro.com>
In-Reply-To: <de442ad9-0479-4a7e-bccf-97fcd081a35e@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x52d.google.com
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

Rob,

Given that you'll need to resend the patches due to the conflict in patch 2,
I think it would be nice to mention in this commit message that we're ok with
enabling RVB in the 'max' CPU, even though RVB per se is experimental, because
it's just an alias for extensions that the CPU already uses.

I'm asking this because future Daniel will forget why we're adding an experimental
extension in the 'max' CPU, and this info in the commit msg will spare him from
searching the ML archives to discover why :)



Thanks,

Daniel

On 1/10/24 15:32, Daniel Henrique Barboza wrote:
> 
> 
> On 1/9/24 14:07, Rob Bradford wrote:
>> Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
>> ---
>>   target/riscv/tcg/tcg-cpu.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
>> index f10871d352..9705daec93 100644
>> --- a/target/riscv/tcg/tcg-cpu.c
>> +++ b/target/riscv/tcg/tcg-cpu.c
>> @@ -999,7 +999,8 @@ static void riscv_init_max_cpu_extensions(Object *obj)
>>       const RISCVCPUMultiExtConfig *prop;
>>       /* Enable RVG, RVJ and RVV that are disabled by default */
>> -    riscv_cpu_set_misa(env, env->misa_mxl, env->misa_ext | RVG | RVJ | RVV);
>> +    riscv_cpu_set_misa(env, env->misa_mxl,
>> +                       env->misa_ext | RVG | RVJ | RVV | RVB);
> 
> I'm aware that we decided a while ago the 'max' CPU could only have non-vendor and
> non-experimental extensions enabled. RVB is experimental, so in theory we shouldn't
> enable it.
> 
> But RVB is an alias for zba, zbb and zbs, extensions that the 'max' CPU is already
> enabling. In this case I think it's sensible to enable RVB here since it would just
> reflect stuff that it's already happening.
> 
> 
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> 
> 
> 
> 
>>       for (prop = riscv_cpu_extensions; prop && prop->name; prop++) {
>>           isa_ext_update_enabled(cpu, prop->offset, true);

