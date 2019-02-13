Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtzBY-0000Lk-B9
	for mharc-qemu-riscv@gnu.org; Wed, 13 Feb 2019 13:23:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42070)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtzBV-0008VG-2S
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 13:23:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtz15-0004bf-DI
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 13:12:17 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:40487)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gtz14-0004aG-UK
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 13:12:15 -0500
Received: by mail-pg1-x543.google.com with SMTP id z10so1512181pgp.7
	for <qemu-riscv@nongnu.org>; Wed, 13 Feb 2019 10:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=54pKL8ibb3V0HWY4bU8RDlVOG12LC+yFLEQFWLU5JL0=;
	b=m6+fypNBdmoB2HBCnuxDDPYsTAaaqBaQ4dWHe8PPU6RS757G0t95oHhS4IP0GEzLVA
	HZyHvOUSLrqztjDygW1sXlahUxmHC/F44+36K/4Wzt16kUwX7YYSc3S8YFA/p4XTZMcs
	V1arh9rvz8SBk/kpgbjLy4h3iUbZpEwMzA/wyTeXv5ZLrNv9CJFFibppCe7U8dffypWu
	cxaKSN4xVPTr8JnRxDSzKiaiBzgYXFT7hJSFN4TI+SONn2dmEdqD2X9rCm71lKF9M6OY
	GmkTIlIIdYiMbjsvG6I4uhU3//7ka1u6xxVA3Ykm8y8eIHRPCpECZtdCanbWPR0+S+ma
	wwdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=54pKL8ibb3V0HWY4bU8RDlVOG12LC+yFLEQFWLU5JL0=;
	b=fv7ZC6+fRJw9YLxTRWTZSNQDvoPKVstr0MR5KQjnRI0OnV7YLs6E7WRBje/ZgELWqY
	nX+bxiZdm5WNGWBdqWFoTYyEIHjG/kTa6uhmsinuhLHrByTdwHFhEG9JYUULgDyC9WzP
	X4sHo02fWqEWoGihgMwgf+ERLSfXgP/GZwfXSLJrHJUrR4z9phML5+DHHeIXoNtDRkJN
	icvuBPzSLsf0oghGReE3/Q8zl1XecDXq5yGoOJ+4W4QftTS6Eoc4rXgJoxCriQF9EiYC
	nyQUihjMFL4GYvnFa+6DqT02uTemxar63j/O5DnnbfW+qnJ5isVtbMgCUpPfQXDTPhZH
	DEjg==
X-Gm-Message-State: AHQUAuZ081zyHmOxA44ZSRaBXjP40SCYIMBMgzczam2PLWw3osVmWh8b
	5vxeXKmumHxlaQm2NTLsyxN3hQ==
X-Google-Smtp-Source: AHgI3IZoNoOdl4waiSoTXkFo0IXz7yDtzIaC5SavtH/YNYlGHZpA6dfTu271+0P/ECsA1xhDx5aHeA==
X-Received: by 2002:a63:aa46:: with SMTP id x6mr1598853pgo.452.1550081533374; 
	Wed, 13 Feb 2019 10:12:13 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	l81sm34313888pfg.100.2019.02.13.10.12.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Feb 2019 10:12:12 -0800 (PST)
Date: Wed, 13 Feb 2019 10:12:12 -0800 (PST)
X-Google-Original-Date: Wed, 13 Feb 2019 10:11:56 PST (-0800)
In-Reply-To: <CAKmqyKNPpRKYJunZLQrbNE9LmXLKkMcGUdghe3Ry6kO=R9TQLw@mail.gmail.com>
CC: luke.r.nels@gmail.com, qemu-riscv@nongnu.org, sagark@eecs.berkeley.edu,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	qemu-devel@nongnu.org, lukenels@pm.me, mjc@sifive.com, 
	Alistair Francis <Alistair.Francis@wdc.com>, xi.wang@gmail.com
From: Palmer Dabbelt <palmer@sifive.com>
To: alistair23@gmail.com
Message-ID: <mhng-eb63042f-42db-4a31-96b5-e13a0e1d2363@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] RISC-V: Fix pmpcfg register
 indexing
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Feb 2019 18:23:02 -0000

On Fri, 08 Feb 2019 10:57:17 PST (-0800), alistair23@gmail.com wrote:
> On Wed, Jan 30, 2019 at 2:20 PM Luke Nelson <luke.r.nels@gmail.com> wrote:
>>
>> pmpcfg_csr_{read,write} do not correctly handle accesses to PMP
>> configurations 8 through 15 (CSR pmpcfg2) on RV64.
>>
>> The current code computes the pmpcfg index using:
>>
>>   (reg_index * sizeof(target_ulong))
>>
>> This is incorrect on RV64.  For example, when reg_index is 2 (i.e.,
>> pmpcfg2), the computed configuration index will be 16-23, which
>> should be 8-15.
>>
>> A correct way is to use (reg_index * 4) instead, which works for
>> both RV32 and RV64.
>>
>> Cc: Xi Wang <xi.wang@gmail.com>
>> Signed-off-by: Luke Nelson <luke.r.nels@gmail.com>
>
> Good catch!
>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Ya, thanks -- that's a somewhat embarrassing bug, as someone else just fixed 
one on the line below :).  I'll target this for my next PR.

>
> Alistair
>
>> ---
>>  target/riscv/pmp.c | 7 +++----
>>  1 file changed, 3 insertions(+), 4 deletions(-)
>>
>> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
>> index 15a5366616..a1bee56c86 100644
>> --- a/target/riscv/pmp.c
>> +++ b/target/riscv/pmp.c
>> @@ -311,9 +311,8 @@ void pmpcfg_csr_write(CPURISCVState *env, uint32_t reg_index,
>>      }
>>
>>      for (i = 0; i < sizeof(target_ulong); i++) {
>> -        cfg_val = (val >> 8 * i)  & 0xff;
>> -        pmp_write_cfg(env, (reg_index * sizeof(target_ulong)) + i,
>> -            cfg_val);
>> +        cfg_val = (val >> (i * 8)) & 0xff;
>> +        pmp_write_cfg(env, (reg_index * 4) + i, cfg_val);
>>      }
>>  }
>>
>> @@ -328,7 +327,7 @@ target_ulong pmpcfg_csr_read(CPURISCVState *env, uint32_t reg_index)
>>      target_ulong val = 0;
>>
>>      for (i = 0; i < sizeof(target_ulong); i++) {
>> -        val = pmp_read_cfg(env, (reg_index * sizeof(target_ulong)) + i);
>> +        val = pmp_read_cfg(env, (reg_index * 4) + i);
>>          cfg_val |= (val << (i * 8));
>>      }
>>
>> --
>> 2.19.1
>>
>>

