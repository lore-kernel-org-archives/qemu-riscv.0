Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFFFDCAC592
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 11:49:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uy7iK-0000Zy-9H; Mon, 15 Sep 2025 07:49:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uy7i6-0000Yk-Fh
 for qemu-riscv@nongnu.org; Mon, 15 Sep 2025 07:49:33 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uy7hu-0003SX-AC
 for qemu-riscv@nongnu.org; Mon, 15 Sep 2025 07:49:28 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-32b8919e7c7so5500315a91.2
 for <qemu-riscv@nongnu.org>; Mon, 15 Sep 2025 04:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1757936948; x=1758541748; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=u7mxC0HuOzB+yJSqNf1nfsc6C+SkvCo5zuen1EsOI6o=;
 b=nUaezd8YmZhjpHvIErNX/nQUPWZ1heg6bRPlFdeDsI/IUvDVJ2TTFURDzQVu+2Z5Lq
 +5ZVokRyJnWUI7K8zYCPQ9y/XA309r7qDfY04VrPUWG4lwvijt3K5moP4EktVGSDNIGd
 1UZa7CvMV8YfTBWg2FOlkyoMmgMgd5QKQazYMVh62N3X4PQ5Ym/w38nPBHvs9tUYnT/8
 KQ02xiYRn8nurBDXLfOku7xzDgkBa3BMXhVjTaI1FRhYllV6l2vWmIBf6Hp90u+GKfvT
 y+gQ3qCToKPoYftdDVX5P5zs7QVKeYlOcZbMHKOsusnC4uuJ7kDfjfeHP5OtzPkjFCVs
 P8Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757936948; x=1758541748;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u7mxC0HuOzB+yJSqNf1nfsc6C+SkvCo5zuen1EsOI6o=;
 b=GxCrDOG0sQEBtlUCQa7vScAVNNIPxjipx6JG6cWVQifCs23TSAcaEt62QaPVY3WEbj
 vcXWoelyMbSVBpqBQiEr7azjRq4rmLjC/cY9T/RIfu4cBm+NJvTn2yZNPf0++m0Us1PW
 nfbojxq7BTe8YLAouzhggxtPTdZ5zpprDqcoXFdMmkHpwmKQu51+tNLNHba0CscsRiyY
 eEO3Sijvlus6mQKrdMBrtSCy0MxSy1p0xhJNJSGkvu7uNe7SHH3DX4ra2XvRT1YPhxGZ
 wjVkY3kLvkYv/bPvB/JvHlBkCYuI+1MGweabgEvRV2SErxcAMocI/C8amX7YACyTCXAw
 38Tw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEWh24CWdCU7UePAGf/H25/PJHPP1AYSN6ITaLA4boOyQ8yDWrPt4FAVtu4kB4OruZA06VrSiUbf9i@nongnu.org
X-Gm-Message-State: AOJu0Yxk8Huywk8ffGCt8seMVDbvgAlOQG1F4XWcnHzU5fFd3RAZDjxW
 KiQI5Fx4cELzjbF7Uq2Ix93k3xCCXExCNuloftR8t9GGafkry4WJQ9OBgmP5SE1ym9w=
X-Gm-Gg: ASbGnctZZtBo6zvm25IAenv/P0WMmsKlFhGzV5wasne0Rewy0gSkhvTnfU4dM4jd8af
 Mry1/p57Ymo2f3TiQxGS0xNZFNrGU7OWCznzbWkpYcv5YBIFd8M5brh713sjcP6hBQphpX1EvBb
 v79hC+U7Hz/wlWtciyvuOfAfrukfctJjA9Oh/C0LOl442jyVQSkZL7fiN+ezAS3eAhoFkiNDpAO
 nUX3P3q84sWrkIXh8ajTbuz6IzUOrRRfJGY2xxpM3bO5DHF2cTRn4jZBJEuL300qOnOWZfSZmEW
 0uvUI613OZJbzvvYZmGHjfjTVnjuiaU6oJnqdvLdOJz1q77yYgCzH7prT6VfJLHHm2uU51r0wAo
 PRPQGSbkLZj9QNsAzYV4ZvWZ9OrnwdNJVgmMLYxin6JayjTxWr0NMezl6jz2OhUNB03FrXML4CU
 Bf
X-Google-Smtp-Source: AGHT+IHA+iUL5IPdvnwzKSs0hmIGoESId0wNDYCa/UrO2sXNqAD1pp9hIg598iipXD0Hxra06hhaxQ==
X-Received: by 2002:a17:90b:5403:b0:32b:c610:6ef6 with SMTP id
 98e67ed59e1d1-32de4f7df23mr13405996a91.21.1757936948546; 
 Mon, 15 Sep 2025 04:49:08 -0700 (PDT)
Received: from ?IPV6:2804:7f0:bcc0:a026:14f7:a39e:7d17:ef5a?
 ([2804:7f0:bcc0:a026:14f7:a39e:7d17:ef5a])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-32ded1ac2fdsm10574102a91.27.2025.09.15.04.49.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Sep 2025 04:49:07 -0700 (PDT)
Message-ID: <72b57d2b-9e18-4177-a079-b30a7e1e6243@ventanamicro.com>
Date: Mon, 15 Sep 2025 08:49:04 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] target/riscv: print all available CSRs in
 riscv_cpu_dump_state()
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com
References: <20250623172119.997166-1-dbarboza@ventanamicro.com>
 <20250623172119.997166-4-dbarboza@ventanamicro.com>
 <CAKmqyKMdio17PjxfRVUbF33Y0p2vk8SxFUCr0WXN_uSDE+25gA@mail.gmail.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Language: en-US
In-Reply-To: <CAKmqyKMdio17PjxfRVUbF33Y0p2vk8SxFUCr0WXN_uSDE+25gA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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



On 9/15/25 12:22 AM, Alistair Francis wrote:
> On Tue, Jun 24, 2025 at 3:22 AM Daniel Henrique Barboza
> <dbarboza@ventanamicro.com> wrote:
>>
>> At this moment we're printing a small selection of CSRs. There's no
>> particular reason to not print all of them.
> 
> The reason was that there are just so many and printing everything
> makes it hard for people to read. So we just print the "main" ones and
> people can then probe the more obscure ones they are interested in.
> 
> Do we actually want to print all of them?

In case we have no idea what is going on with the CPU, e.g. there is something
wrong and you can't quite put your finger on it, outputting all CSRs can help
identify errors in unusual places you wouldn't expect.

After identifying the problematic CSRs we can then use the MonitorDef API to
fetch just the CSRs we want with "p $<reg>".

At this is the sort of use case I was imagining with these patches. They'll be
more effective when used together.


Thanks,

Daniel
  

> 
>>
>> We're ignoring the note about CSR_SSTATUS being ommited because it can
>> be read via CSR_MSTATUS. There's a huge list of CSRs that would fall in
>> this category and it would be an extra burden to manage them, not
>> mentioning having to document "we're not listing X because it's the same
>> value as Y" to users.
>>
>> Remove 'dump_csrs' and use the existing 'csr_ops' array to print all
>> available CSRs. Create two helpers in csr.c to identify FPU and VPU CSRs
>> and skip them - they'll be printed in the FPU/VPU blocks later.
>>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> 
> The actual code looks fine though
> 
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> 
> Alistair
> 
>> ---
>>   target/riscv/cpu.c | 55 ++++++++++++++++------------------------------
>>   target/riscv/cpu.h |  2 ++
>>   target/riscv/csr.c | 18 +++++++++++++++
>>   3 files changed, 39 insertions(+), 36 deletions(-)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index 95d0b88937..ed1bf18625 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -544,44 +544,27 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>>   #endif
>>       qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "pc      ", env->pc);
>>   #ifndef CONFIG_USER_ONLY
>> -    {
>> -        static const int dump_csrs[] = {
>> -            CSR_MHARTID,
>> -            CSR_MSTATUS,
>> -            CSR_MSTATUSH,
>> -            /*
>> -             * CSR_SSTATUS is intentionally omitted here as its value
>> -             * can be figured out by looking at CSR_MSTATUS
>> -             */
>> -            CSR_HSTATUS,
>> -            CSR_VSSTATUS,
>> -            CSR_MIP,
>> -            CSR_MIE,
>> -            CSR_MIDELEG,
>> -            CSR_HIDELEG,
>> -            CSR_MEDELEG,
>> -            CSR_HEDELEG,
>> -            CSR_MTVEC,
>> -            CSR_STVEC,
>> -            CSR_VSTVEC,
>> -            CSR_MEPC,
>> -            CSR_SEPC,
>> -            CSR_VSEPC,
>> -            CSR_MCAUSE,
>> -            CSR_SCAUSE,
>> -            CSR_VSCAUSE,
>> -            CSR_MTVAL,
>> -            CSR_STVAL,
>> -            CSR_HTVAL,
>> -            CSR_MTVAL2,
>> -            CSR_MSCRATCH,
>> -            CSR_SSCRATCH,
>> -            CSR_SATP,
>> -        };
>> +    for (i = 0; i < ARRAY_SIZE(csr_ops); i++) {
>> +        int csrno = i;
>>
>> -        for (i = 0; i < ARRAY_SIZE(dump_csrs); ++i) {
>> -            riscv_dump_csr(env, dump_csrs[i], f);
>> +        /*
>> +         * Early skip when possible since we're going
>> +         * through a lot of NULL entries.
>> +         */
>> +        if (csr_ops[csrno].predicate == NULL) {
>> +            continue;
>>           }
>> +
>> +        /*
>> +         * FPU and VPU CSRs will be printed in the
>> +         * CPU_DUMP_FPU/CPU_DUMP_VPU blocks later.
>> +         */
>> +        if (riscv_csr_is_fpu(csrno) ||
>> +            riscv_csr_is_vpu(csrno)) {
>> +            continue;
>> +        }
>> +
>> +        riscv_dump_csr(env, csrno, f);
>>       }
>>   #endif
>>
>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> index 4a862da615..ecdf709c2d 100644
>> --- a/target/riscv/cpu.h
>> +++ b/target/riscv/cpu.h
>> @@ -967,6 +967,8 @@ bool riscv_cpu_accelerator_compatible(RISCVCPU *cpu);
>>
>>   /* CSR function table */
>>   extern riscv_csr_operations csr_ops[CSR_TABLE_SIZE];
>> +bool riscv_csr_is_fpu(int csrno);
>> +bool riscv_csr_is_vpu(int csrno);
>>
>>   extern const bool valid_vm_1_10_32[], valid_vm_1_10_64[];
>>
>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>> index 6296ecd1e1..229257b31b 100644
>> --- a/target/riscv/csr.c
>> +++ b/target/riscv/csr.c
>> @@ -5799,6 +5799,24 @@ static RISCVException write_jvt(CPURISCVState *env, int csrno,
>>       return RISCV_EXCP_NONE;
>>   }
>>
>> +bool riscv_csr_is_fpu(int csrno)
>> +{
>> +    if (!csr_ops[csrno].predicate) {
>> +        return false;
>> +    }
>> +
>> +    return csr_ops[csrno].predicate == fs;
>> +}
>> +
>> +bool riscv_csr_is_vpu(int csrno)
>> +{
>> +    if (!csr_ops[csrno].predicate) {
>> +        return false;
>> +    }
>> +
>> +    return csr_ops[csrno].predicate == vs;
>> +}
>> +
>>   /*
>>    * Control and Status Register function table
>>    * riscv_csr_operations::predicate() must be provided for an implemented CSR
>> --
>> 2.49.0
>>
>>


