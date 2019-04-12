Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hF41t-0000Ya-8j
	for mharc-qemu-riscv@gnu.org; Fri, 12 Apr 2019 17:48:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59476)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1hF41q-0000YD-PC
	for qemu-riscv@nongnu.org; Fri, 12 Apr 2019 17:48:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1hF41p-0005Op-NA
	for qemu-riscv@nongnu.org; Fri, 12 Apr 2019 17:48:10 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:44069)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1hF41p-0005Nl-Ea
	for qemu-riscv@nongnu.org; Fri, 12 Apr 2019 17:48:09 -0400
Received: by mail-pg1-x542.google.com with SMTP id i2so5783544pgj.11
	for <qemu-riscv@nongnu.org>; Fri, 12 Apr 2019 14:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=F3UZY2ASwvRN9UNuEcMbeX1oR/oKjU39wUXoZeThpzc=;
	b=RA0HHkxU/SlzzDwixC942C95EeXwXOhOznrwbLOPWZYgXQWpwr23tW/TqpT8SM4LGK
	oOLR3keqZojMSJ/6PKoiLWyttmAr9ku/rsbiFaiNOiT8IQmcJYmc3BlIcZIfIRgZ9J/F
	BNBUIDyXWhaKGvTzlug28zJrsrWK9OXLn2J1DaHpjBEtiBWsHTMeFt9X2BPtgGTOehQf
	usXYzAOjzUykCSHXRNl3kE/PsTLspjjLZyFsURan0vsstX6rEn/qdcsYZ6M4qh5Mkopl
	yWTsHRlG5vWXf/dAOe2Z77adoXMPofaMe0sklL4yc1RV8xriqZnug/Qtoz2F5kUcD8yl
	Y0sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=F3UZY2ASwvRN9UNuEcMbeX1oR/oKjU39wUXoZeThpzc=;
	b=uAki8PrKT+9Ed46LM3JCr1JobWi1EKCazeurrdTIOxF1Lva9J6h2YbSMucoqgooBPf
	KagDYIY/xlxgFUEVLQNJHGEDcnifbP/N6glZTSY2esaceYs+9UlDOrKa6M0jBiLrDLJY
	fiYlFXr4/ygnpp3FOkGdDxHpK/7U7hMhanNPl2gpD6af2Y1hu/RP5fs5aVUYo/eCihC6
	tjhSPkvuUezOsIJFyUa+RNP7Fat1aPrCxehhuPtN2EnX9H67rhSDyOgP8OYGFtB0W2W0
	ynQzdVMtO1zKhrQMBw/JYdOVW+D8mnKc0ZYfAm77Nr9YxUbsAUqEzh9si/6ieIfV4TOI
	22yA==
X-Gm-Message-State: APjAAAVKBcI/ko8XuQpcAS8hhUuFQZZ0vt7mIiccJfREbwjmLTO4KWkp
	zJuRzcniaENDtspsxvqP504RBA==
X-Google-Smtp-Source: APXvYqztZdvFNG6IcLSBN/1w1RJGJreSsDoA8dH4o52q+TBt/V8NbQx6msbUEKjSZVvEnUHLIpEW/Q==
X-Received: by 2002:a63:1d5b:: with SMTP id d27mr54566323pgm.386.1555105687724;
	Fri, 12 Apr 2019 14:48:07 -0700 (PDT)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	j19sm33087955pfr.155.2019.04.12.14.48.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 Apr 2019 14:48:06 -0700 (PDT)
Date: Fri, 12 Apr 2019 14:48:06 -0700 (PDT)
X-Google-Original-Date: Fri, 12 Apr 2019 14:45:46 PDT (-0700)
In-Reply-To: <CAKmqyKOSujRkv+JkgmP79FHVPZabg0QTki3c+BeFMTZpMFSYxA@mail.gmail.com>
CC: fintelia@gmail.com, qemu-devel@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Alistair Francis <Alistair.Francis@wdc.com>, qemu-riscv@nongnu.org, 
	sagark@eecs.berkeley.edu
From: Palmer Dabbelt <palmer@sifive.com>
To: alistair23@gmail.com
Message-ID: <mhng-fe62b897-1d18-47aa-8dc1-ab08cad65092@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] target/riscv: Do not allow
 sfence.vma from user mode
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
X-List-Received-Date: Fri, 12 Apr 2019 21:48:11 -0000

I actually missed this.  I just added it to for-next on 
github.com/palmer-dabbelt.

Thanks for the ping!

On Fri, 12 Apr 2019 14:23:42 PDT (-0700), alistair23@gmail.com wrote:
> On Fri, Apr 12, 2019 at 2:15 PM Jonathan Behrens <fintelia@gmail.com> wrote:
>>
>> Just to double check, nothing further on this is need from me, right? It is set to be merged onto the master branch once the 4.0 release is out?
>
> Thanks for checking!
>
> Yep you don't need to do anything, Palmer will merge it in the next
> RISC-V PR after 4.0.
>
> Alistair
>
>>
>> Jonathan
>>
>> On Wed, Apr 3, 2019 at 7:11 PM Alistair Francis <alistair23@gmail.com> wrote:
>>>
>>> On Mon, Apr 1, 2019 at 1:39 PM Jonathan Behrens <fintelia@gmail.com> wrote:
>>> >
>>> > The 'sfence.vma' instruction is privileged, and should only ever be allowed
>>> > when executing in supervisor mode or higher.
>>> >
>>> > Jonathan
>>> >
>>> > Signed-off-by: Jonathan Behrens <fintelia@gmail.com>
>>>
>>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>>>
>>> Alistair
>>>
>>> > ---
>>> >  target/riscv/op_helper.c | 7 ++++---
>>> >  1 file changed, 4 insertions(+), 3 deletions(-)
>>> >
>>> > diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
>>> > index b7dc18a41e..644d0fb35f 100644
>>> > --- a/target/riscv/op_helper.c
>>> > +++ b/target/riscv/op_helper.c
>>> > @@ -145,9 +145,10 @@ void helper_tlb_flush(CPURISCVState *env)
>>> >  {
>>> >      RISCVCPU *cpu = riscv_env_get_cpu(env);
>>> >      CPUState *cs = CPU(cpu);
>>> > -    if (env->priv == PRV_S &&
>>> > -        env->priv_ver >= PRIV_VERSION_1_10_0 &&
>>> > -        get_field(env->mstatus, MSTATUS_TVM)) {
>>> > +    if (!(env->priv >= PRV_S) ||
>>> > +        (env->priv == PRV_S &&
>>> > +         env->priv_ver >= PRIV_VERSION_1_10_0 &&
>>> > +         get_field(env->mstatus, MSTATUS_TVM))) {
>>> >          riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
>>> >      } else {
>>> >          tlb_flush(cs);
>>> > --
>>> > 2.20.1

