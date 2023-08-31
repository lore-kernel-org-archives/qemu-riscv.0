Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E102C83F10
	for <qemu-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 15:44:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qbjq2-0007rY-L8; Thu, 31 Aug 2023 11:44:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qbjpn-0007k3-6C
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 11:43:53 -0400
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qbjpk-0004jt-RK
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 11:43:50 -0400
Received: by mail-oi1-x232.google.com with SMTP id
 5614622812f47-3a76d882080so584539b6e.2
 for <qemu-riscv@nongnu.org>; Thu, 31 Aug 2023 08:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1693496627; x=1694101427; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2mRrC2GhiNrKDUYxp9amzH9bhv5kqn4vNj0RTdOEEok=;
 b=Ak8OV84GA/vQp2DBg6p7xM6+wziQgBXancmR5ika1dK9hkbcnH65RZ/s4TA3ypVXOu
 HYRwPDLT7XJVjjBt2zlIQUFf5fKbxuRS1n62swZ4mIsERFRdk1LjFf3kM3ovLkLx+NHK
 SEJFrrmGZCsDzYUu8EE6iYFK7Tu/sRzVn4oNubCIpFcxbSvbXqm/5TdfSPOOSxAg/sRX
 rDC4HCnAYIRrnI9AI4kTaKiiWan+4WfEfy6fuIXs/4uQqH8vLotrMHQpLUMnyJrOaT7Z
 EiEtlJqhGIJRJR10p5xLUk5EGRoLnTgv4isbXgOCA88zg3Hpfxfm1z3KKEPkpNUvByLV
 9Jbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693496627; x=1694101427;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2mRrC2GhiNrKDUYxp9amzH9bhv5kqn4vNj0RTdOEEok=;
 b=kPl8ptNslplT7chxGRIp03tQhGWHsayPyxTDiOmln+6jJm5VW/CEUVH8GO9GL5l5K/
 vNB7oLCvJ2YKm3RzOLZcfAa13JPEZlM0/BbgImcGOQcY8hrjVBVLoQp55x4TUS69nHjz
 M9bwVWH67IEXurD/HLk1DEDUofZ+xN1X3iojcy78pIFACfFegT2FXGjIocCTsqUx1Ybx
 k7bcRYWCMSrumuOj4AYFPhjGSPaefZ1nBuP8mJKJXSNw6t+eA+IqxPpDtZnU5Gl852Xb
 hYatuebCAiUBlfiJusyliFAJoArmUwsSlNLRuK0IwR6F0t5fkT+qyzvuCXCZUxM8i3S2
 o99w==
X-Gm-Message-State: AOJu0YzjwG3NVI/rjcA8CaXfvB6BD8OjhCRnaXarmGjA4kS2j43n7+3J
 nvYLhzdV0C89xCGzsIG7kd453g==
X-Google-Smtp-Source: AGHT+IEjBBBwQhHqy4eKuLElrMq6LYSgDRmJHZcIUGB/3wSQRdtGdMT+1uaCNdFSwSySoXC2upFB6Q==
X-Received: by 2002:a05:6808:4e:b0:398:5d57:3d08 with SMTP id
 v14-20020a056808004e00b003985d573d08mr5352016oic.37.1693496627484; 
 Thu, 31 Aug 2023 08:43:47 -0700 (PDT)
Received: from [192.168.68.108] ([177.94.15.194])
 by smtp.gmail.com with ESMTPSA id
 a19-20020a056808129300b003a724566afdsm859008oiw.20.2023.08.31.08.43.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Aug 2023 08:43:47 -0700 (PDT)
Message-ID: <be4f96e6-c6c8-8bb1-a1c4-5bfaf6d28aec@ventanamicro.com>
Date: Thu, 31 Aug 2023 12:43:43 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RESEND v8 20/20] target/riscv/cpu.c: consider user option
 with RVG
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 palmer@rivosinc.com
References: <20230824221440.484675-1-dbarboza@ventanamicro.com>
 <20230824221440.484675-21-dbarboza@ventanamicro.com>
 <20230831-4464df075538419005400c02@orel>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230831-4464df075538419005400c02@orel>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x232.google.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.478,
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



On 8/31/23 11:02, Andrew Jones wrote:
> On Thu, Aug 24, 2023 at 07:14:40PM -0300, Daniel Henrique Barboza wrote:
>> Enabling RVG will enable a set of extensions that we're not checking if
>> the user was okay enabling or not. And in this case we want to error
>> out, instead of ignoring, otherwise we will be inconsistent enabling RVG
>> without all its extensions.
>>
>> After this patch, disabling ifencei or icsr while enabling RVG will
>> result in error:
>>
>> $ ./build/qemu-system-riscv64 -M virt -cpu rv64,g=true,Zifencei=false --nographic
>> qemu-system-riscv64: warning: Setting G will also set IMAFD_Zicsr_Zifencei
>> qemu-system-riscv64: RVG requires Zifencei but user set Zifencei to false
> 
> The warning makes it sound like Zifencei is getting overridden, but then
> the error says "nope". So I think...
> 
>>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>> ---
>>   target/riscv/cpu.c | 18 ++++++++++++++++--
>>   1 file changed, 16 insertions(+), 2 deletions(-)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index e07b2c73e7..21ebdbf084 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -1155,8 +1155,22 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>>             riscv_has_ext(env, RVD) &&
>>             cpu->cfg.ext_icsr && cpu->cfg.ext_ifencei)) {
>>           warn_report("Setting G will also set IMAFD_Zicsr_Zifencei");
> 
> ...we want to move this warning down below the checks and we should even
> check if it should be issued with
> 
>   if (!cpu->cfg.ext_icsr || !cpu->cfg.ext_ifencei || !cpu->cfg.a || ...)
>      warn_report(...)

Moving the warning makes sense. I'll do that.

About the check, it's not visible in the patch but right before this code we have:


     /* Do some ISA extension error checking */
     if (riscv_has_ext(env, RVG) &&
         !(riscv_has_ext(env, RVI) && riscv_has_ext(env, RVM) &&
           riscv_has_ext(env, RVA) && riscv_has_ext(env, RVF) &&
           riscv_has_ext(env, RVD) &&
           cpu->cfg.ext_icsr && cpu->cfg.ext_ifencei)) {
         warn_report("Setting G will also set IMAFD_Zicsr_Zifencei");

So we're already checking if we have at least one G extension disabled
before issuing the warning.



Thanks,

Daniel


> 
>> -        cpu->cfg.ext_icsr = true;
>> -        cpu->cfg.ext_ifencei = true;
>> +
>> +        if (cpu_cfg_ext_is_user_set(CPU_CFG_OFFSET(ext_icsr)) &&
>> +            !cpu->cfg.ext_icsr) {
>> +            error_setg(errp, "RVG requires Zicsr but user set Zicsr to false");
>> +            return;
>> +        }
>> +
>> +        if (cpu_cfg_ext_is_user_set(CPU_CFG_OFFSET(ext_ifencei)) &&
>> +            !cpu->cfg.ext_ifencei) {
>> +            error_setg(errp, "RVG requires Zifencei but user set "
>> +                       "Zifencei to false");
>> +            return;
>> +        }
>> +
>> +        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_icsr), true);
>> +        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_ifencei), true);
>>   
>>           env->misa_ext |= RVI | RVM | RVA | RVF | RVD;
>>           env->misa_ext_mask |= RVI | RVM | RVA | RVF | RVD;
>> -- 
>> 2.41.0
>>
>>
> 
> Thanks,
> drew

