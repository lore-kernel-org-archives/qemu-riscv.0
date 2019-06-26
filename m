Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hg161-00005d-V3
	for mharc-qemu-riscv@gnu.org; Wed, 26 Jun 2019 02:07:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41763)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hg160-000051-2D
 for qemu-riscv@nongnu.org; Wed, 26 Jun 2019 02:07:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hg15z-0002ib-0v
 for qemu-riscv@nongnu.org; Wed, 26 Jun 2019 02:07:52 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:38438)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hg15y-0002ho-RV
 for qemu-riscv@nongnu.org; Wed, 26 Jun 2019 02:07:50 -0400
Received: by mail-pg1-f195.google.com with SMTP id z75so670759pgz.5
 for <qemu-riscv@nongnu.org>; Tue, 25 Jun 2019 23:07:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=EmGZqkWZXz+TznH7WqJXu6yj6AO4KHO44rr6hePQgrs=;
 b=oT4zQ1LModB/DnyPs2TUZQZY+gNMAsdIwakLCLfaFzpQZpgE3VeqpX6/laGhfWrer8
 uICpG/TMxGzoJ97AUXCDd8ljh7fgqCMNVlcBK27/5NgGquEKGoD3rwmBjoJGcqx70cgU
 hbEobf2cdj5CdjeZ50RSxlVVSrtSoK5Li4e7kVQ2pyJ2SU7d/nPaUv/bKRyVUyN/QKwD
 eibBGAxLQ3mKMSrsOV+182CFre1YZHVs3vHYuVh8cV/tebFQQe5qmlmsm6UVzhITydt0
 AU/r7icOYlE6vKWsqGpKq0ag3599GYVvN1+7/3B8KJAJKL86tA5B9Eu221pUzixB52wH
 AEbQ==
X-Gm-Message-State: APjAAAVc0HmgmHu/3rFWSDyGX/snU8S390SBqzLKKMO9qbxZZtr12Xdn
 dkEtQeGgrU1YpfeNVCPfoIOVUA==
X-Google-Smtp-Source: APXvYqzXFdyOlcRsq0ehCife6IjFondFhfG8Gxh0s/+OgauV14yDlln/7qLxLGHJP4njXHScufagBg==
X-Received: by 2002:a63:2323:: with SMTP id j35mr1215735pgj.166.1561529269373; 
 Tue, 25 Jun 2019 23:07:49 -0700 (PDT)
Received: from localhost (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id x65sm20879927pfd.139.2019.06.25.23.07.48
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 25 Jun 2019 23:07:48 -0700 (PDT)
Date: Tue, 25 Jun 2019 23:07:48 -0700 (PDT)
X-Google-Original-Date: Tue, 25 Jun 2019 22:32:56 PDT (-0700)
In-Reply-To: <CAKmqyKOGKuMJXSPJJEWn7s6OkUZ4ZRL7KFOqtaBWTErrbi6+aQ@mail.gmail.com>
CC: Alistair Francis <Alistair.Francis@wdc.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: alistair23@gmail.com
Message-ID: <mhng-9ce79f43-2d09-489c-a089-be1ad81057ee@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.215.195
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] RISC-V: Add support for the
 Zicsr extension
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Jun 2019 06:07:53 -0000

On Tue, 25 Jun 2019 08:20:55 PDT (-0700), alistair23@gmail.com wrote:
> On Tue, Jun 25, 2019 at 3:09 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>>
>> The various CSR instructions have been split out of the base ISA as part
>> of the ratification process.  This patch adds a Zicsr argument, which
>> disables all the CSR instructions.
>>
>> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
>> ---
>>  target/riscv/cpu.c | 1 +
>>  target/riscv/cpu.h | 1 +
>>  target/riscv/csr.c | 5 +++++
>>  3 files changed, 7 insertions(+)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index bbad39a337b3..915b9e77df33 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -442,6 +442,7 @@ static Property riscv_cpu_properties[] = {
>>      DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
>>      DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
>>      DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
>> +    DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
>>      DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
>>      DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
>>      DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> index ba551cd3082c..0adb307f3298 100644
>> --- a/target/riscv/cpu.h
>> +++ b/target/riscv/cpu.h
>> @@ -224,6 +224,7 @@ typedef struct RISCVCPU {
>>          bool ext_u;
>>          bool ext_counters;
>>          bool ext_ifencei;
>> +        bool ext_icsr;
>>
>>          char *priv_spec;
>>          char *user_spec;
>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>> index de67741f3648..ff988917b995 100644
>> --- a/target/riscv/csr.c
>> +++ b/target/riscv/csr.c
>> @@ -793,6 +793,7 @@ int riscv_csrrw(CPURISCVState *env, int csrno, target_ulong *ret_value,
>>  {
>>      int ret;
>>      target_ulong old_value;
>> +    RISCVCPU *cpu = env_archcpu(env);
>>
>>      /* check privileges and return -1 if check fails */
>>  #if !defined(CONFIG_USER_ONLY)
>> @@ -803,6 +804,10 @@ int riscv_csrrw(CPURISCVState *env, int csrno, target_ulong *ret_value,
>>      }
>>  #endif
>>
>> +    /* ensure the CSR extension is enabled. */
>> +    if (!cpu->cfg.ext_icsr)
>> +        return -1;
>
> QEMU style include curly braces around a single line if. Plus I think
> it makes it less error prone. Can you add braces?
>
> After that:
>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Thanks.

>
> Alistair
>
>> +
>>      /* check predicate */
>>      if (!csr_ops[csrno].predicate || csr_ops[csrno].predicate(env, csrno) < 0) {
>>          return -1;
>> --
>> 2.21.0
>>
>>

