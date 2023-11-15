Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D396C072A2
	for <qemu-riscv@archiver.kernel.org>; Wed, 15 Nov 2023 20:51:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r3Mr7-0002v2-6G; Wed, 15 Nov 2023 15:51:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r3Mr6-0002um-Ij
 for qemu-riscv@nongnu.org; Wed, 15 Nov 2023 15:51:24 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r3Mr4-0004La-VK
 for qemu-riscv@nongnu.org; Wed, 15 Nov 2023 15:51:24 -0500
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1cc1e1e74beso1035575ad.1
 for <qemu-riscv@nongnu.org>; Wed, 15 Nov 2023 12:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1700081480; x=1700686280; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=l43tlOgsYJ+rr/5eLqphSGu7z320lk7WToOcB8zTvKY=;
 b=l1du3WiJ3BdfAcdyHNjsbIoU9VbfoADBdhf2INJP7hZARdU1VZCbOXCBOglBiiu+aT
 xSOeK69+0MT2VzKCRjTIZ15Fx6dde4WUPv4WBaWvxby9zfbrFtzsOjoK32xckfaoat/k
 7fBOu0sKO6e3QfQ3pEK9PutmHhDcWBhn8nsauC+AOqOnSnI74BPSr2jRygjUNq6yYyM9
 QlAHy3Xah3MPnNXffPRrJDWF92NLd5u5r3CmlJ3iNtxK1X1gEyZG8O2k2beP5U+Odjjl
 kqmMAikZZ1cW6OrlSaMQFywgj+hj2aiU3kaWkIRE3gm4xYe5OgIVYtzRGNNN2ket30yO
 OO4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700081480; x=1700686280;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=l43tlOgsYJ+rr/5eLqphSGu7z320lk7WToOcB8zTvKY=;
 b=r6xXcFwFdaaRxjIBwhnnKwV+R96DNrqZQevarhh9oPiTjf+F/wTBvEyyP09QOrosRs
 XwoiLzAyw9nEL0MnLhej8yyyZOABNM0slEoGrL9DnLFpJF1aaYtgzJjS3U9c++op69vP
 87NLVnfWslp3Qn/6lCI2hdd9+TKMZdt3T7w9/4iFPCSiIff7GbIDW3gCF/0WH4JmuBrB
 Zz0ZyImff9nr/gex8Mk/Qe3qFG0XkK8Xlr4zZUQ5u4nVk/OQHS/Nhh73Lo2XskcoAK5P
 PB2EmuoABb6BjS0DQEfwfwuMboMG80lxCQPIfkHIX9WE2E3BwQeeFSqsl7hMpUbqXaix
 7GLw==
X-Gm-Message-State: AOJu0YxvITkzyV1Pg9+1jOywuvKri3kFiz3H85b53peEHPGngH0jerhz
 jVY+mRirXXOqo56p8awXQ38YaA==
X-Google-Smtp-Source: AGHT+IENSY4oWYsYroAlh70eBHuoxGlB8qqPgp/EWH6wYzCxKz+QmtB6N+H0bA8/3aZ1dQWzdDEVYg==
X-Received: by 2002:a17:902:d2c3:b0:1b0:f8:9b2d with SMTP id
 n3-20020a170902d2c300b001b000f89b2dmr7149135plc.29.1700081480385; 
 Wed, 15 Nov 2023 12:51:20 -0800 (PST)
Received: from [192.168.68.109] ([152.250.131.148])
 by smtp.gmail.com with ESMTPSA id
 s13-20020a170902988d00b001b567bbe82dsm7818390plp.150.2023.11.15.12.51.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Nov 2023 12:51:19 -0800 (PST)
Message-ID: <035908b8-4964-4878-a0c3-bca06af45b54@ventanamicro.com>
Date: Wed, 15 Nov 2023 17:51:16 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Fix CLINT clock frequency for SiFive E
Content-Language: en-US
To: rcardenas.rod@gmail.com, qemu-devel@nongnu.org
References: <20231110161457.60528-1-rcardenas.rod@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20231110161457.60528-1-rcardenas.rod@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Hi Roman!

It helps to add the maintainers/reviewers in the CC when sending the patch. You
can see who need to be CCed by using the get_maintainer.pl script. E.g:

./scripts/get_maintainer.pl \[PATCH\]\ Fix\ CLINT\ clock\ frequency\ for\ SiFive\ E\ -\ rcardenas.rod@gmail.com\ -\ 2023-11-10\ 1314.eml

Alistair Francis <Alistair.Francis@wdc.com> (supporter:SiFive Machines)
Bin Meng <bin.meng@windriver.com> (supporter:SiFive Machines)
Palmer Dabbelt <palmer@dabbelt.com> (supporter:SiFive Machines)
Weiwei Li <liwei1518@gmail.com> (reviewer:RISC-V TCG CPUs)
Daniel Henrique Barboza <dbarboza@ventanamicro.com> (reviewer:RISC-V TCG CPUs)
Liu Zhiwei <zhiwei_liu@linux.alibaba.com> (reviewer:RISC-V TCG CPUs)
qemu-riscv@nongnu.org (open list:SiFive Machines)
qemu-devel@nongnu.org (open list:All patches CC here)


I'm CCing all these folks in the reply.


On 11/10/23 13:14, rcardenas.rod@gmail.com wrote:
> From: Román Cárdenas Rodríguez <rcardenas.rod@gmail.com>
> 
> ---
>   hw/riscv/sifive_e.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
> index 0d37adc542..87d9602383 100644
> --- a/hw/riscv/sifive_e.c
> +++ b/hw/riscv/sifive_e.c
> @@ -225,7 +225,7 @@ static void sifive_e_soc_realize(DeviceState *dev, Error **errp)
>               RISCV_ACLINT_SWI_SIZE,
>           RISCV_ACLINT_DEFAULT_MTIMER_SIZE, 0, ms->smp.cpus,
>           RISCV_ACLINT_DEFAULT_MTIMECMP, RISCV_ACLINT_DEFAULT_MTIME,
> -        RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, false);
> +        SIFIVE_E_LFCLK_DEFAULT_FREQ, false);

I'm not sure if this is correct. The last commit that touched this line was b8fb878aa2
("hw/intc: Upgrade the SiFive CLINT implementation to RISC-V ACLINT"). If you see the commit
diff, the previous value was:

-            SIFIVE_CLINT_TIMEBASE_FREQ, false);

In this same commit we can see that the existing value of that macro back then was:

-    SIFIVE_CLINT_TIMEBASE_FREQ = 10000000


Which is the same value of RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ.


The value you're changing to, SIFIVE_E_LFCLK_DEFAULT_FREQ (32768), seems to be related to the
SIFIVE AON watchdog implemented in hw/misc/sifive_e_aon.c:

static void sifive_e_aon_init(Object *obj)
{
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
     SiFiveEAONState *r = SIFIVE_E_AON(obj);

     memory_region_init_io(&r->mmio, OBJECT(r), &sifive_e_aon_ops, r,
                           TYPE_SIFIVE_E_AON, SIFIVE_E_AON_MAX);
     sysbus_init_mmio(sbd, &r->mmio);

     /* watchdog timer */
     r->wdog_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
                                  sifive_e_aon_wdt_expired_cb, r);
     r->wdogclk_freq = SIFIVE_E_LFCLK_DEFAULT_FREQ;   <==========
     sysbus_init_irq(sbd, &r->wdog_irq);
}



Thanks,


Daniel



>       sifive_e_prci_create(memmap[SIFIVE_E_DEV_PRCI].base);
>   
>       /* AON */

