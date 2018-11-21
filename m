Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPUoe-0000gG-H7
	for mharc-qemu-riscv@gnu.org; Wed, 21 Nov 2018 10:53:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33187)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gPUoc-0000Vl-A4
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 10:53:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gPUoZ-00046r-L6
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 10:53:22 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:37340)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gPUoZ-00045U-70
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 10:53:19 -0500
Received: by mail-pl1-x644.google.com with SMTP id b5so6101799plr.4
	for <qemu-riscv@nongnu.org>; Wed, 21 Nov 2018 07:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=BY53voaCDhNy+vkSnkYwoqUt1m3QqWcv2/fZRpYXDrY=;
	b=WDQReoZn4AjIbkF2dQoM6IPP4uVeO0jVWAtDpCt9KcbOLWs5cztDUYpfegKEhdvCa1
	PzIbDNcLgknHhKTcoIhw6i+JKuUlGmLQ0awUSBgHWw71LL0yRdszdfFMXLHuxBpz/pRE
	twTzO0c/9UoCpoPoNe1F6pZa3azC/VOvNDFNAb3l1QPbhoZHUWvyRNZvqrwmYslQX1+j
	XH0LXNNqcyQ24IuxJHm1/EGBuv4iPfz2ohnTzJiI08eudLAa4TRSqL8CKuVSxyE9HjJd
	XFxs9LOsT5ScQiFsT4aXy7HeqEeEX/1x76IOrQQLM8FGU7GQsm6T53EAQotMP/f/YWtE
	+Dlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=BY53voaCDhNy+vkSnkYwoqUt1m3QqWcv2/fZRpYXDrY=;
	b=XT2G1y9H1Hstcm7UQz3bJwAHfdUwj70WUsTwKzAsN3mkLR6yI6xzVPn55WI4+3Erxv
	c1e1Xrpg2mnJrEO7SsKh8kxwxxy9maMkOzt1DQFHWT1P9QwRYQO0Ltig58mmL1uwovV2
	C6etCsGkLounA1SKlRO0q2f0XKf6jb6i+4lLdovpp08i4WZvl48vZCx9aLauBecKW2NQ
	AAFt7M2cAsyn2rXQ+ryoecyUfj+ixiTC6pKErVIfuGWlnby7jrSUCN8SIbmahUYXGp/g
	VID38Qo+KoLGHm40gL5ZmGXkPkQTwp2HSQdRBZ7afHSflfG0bNC8Q8ahujK9q0D7ATLE
	JjYw==
X-Gm-Message-State: AA+aEWagqFwk+m3vMpEpBgGu9owsAqLaakilupGn+l5Llu0avnevxxZv
	hylm49R70+ECqXwRc74mPTsXOg==
X-Google-Smtp-Source: AFSGD/WkQ5bNCYL5dIb95A51jPVbjZU3AlTQZsSBUSwM957bcZ4vJdJAiaHFQutaD+I1DUA1gL288g==
X-Received: by 2002:a17:902:7783:: with SMTP id
	o3mr6412316pll.118.1542815598079; 
	Wed, 21 Nov 2018 07:53:18 -0800 (PST)
Received: from localhost ([12.206.222.5])
	by smtp.gmail.com with ESMTPSA id b2sm72589888pfm.3.2018.11.21.07.53.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Nov 2018 07:53:17 -0800 (PST)
Date: Wed, 21 Nov 2018 07:53:17 -0800 (PST)
X-Google-Original-Date: Wed, 21 Nov 2018 07:53:11 PST (-0800)
In-Reply-To: <CAKmqyKMh3T7w-NsP-i2HaRUHvR-0BhqeyTgd2mD0hnH9k8gZiQ@mail.gmail.com>
CC: richard.henderson@linaro.org, qemu-riscv@nongnu.org,
	Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: alistair23@gmail.com
Message-ID: <mhng-995d2bae-d043-45c1-872d-7639baafd856@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: Re: [Qemu-riscv] [Qemu-devel] [RFC v1 11/23] riscv: tcg-target: Add
 the relocation functions
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
X-List-Received-Date: Wed, 21 Nov 2018 15:53:23 -0000

On Tue, 20 Nov 2018 17:15:11 PST (-0800), alistair23@gmail.com wrote:
> On Fri, Nov 16, 2018 at 12:33 AM Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 11/15/18 11:35 PM, Alistair Francis wrote:
>> > +static void reloc_sbimm12(tcg_insn_unit *code_ptr, tcg_insn_unit *target)
>> > +{
>> > +    intptr_t offset = (intptr_t)target - (intptr_t)code_ptr;
>> > +    tcg_debug_assert(offset == sextract32(offset, 1, 12) << 1);
>> > +
>> > +    code_ptr[0] |= encode_sbimm12(offset);
>> > +}
>>
>> FYI, I have an in-flight patch for 4.0 that will make patch_reloc return a bool
>> for relocation success, which will move these asserts.
>>
>> http://lists.nongnu.org/archive/html/qemu-devel/2018-11/msg02237.html
>
> Thanks, I'll keep an eye on this.
>
>>
>>
>> > +static void reloc_call(tcg_insn_unit *code_ptr, tcg_insn_unit *target)
>> > +{
>> > +    intptr_t offset = (intptr_t)target - (intptr_t)code_ptr;
>> > +    tcg_debug_assert(offset == (int32_t)offset);
>> > +
>> > +    int32_t hi20 = ((offset + 0x800) >> 12) << 12;
>> > +    int32_t lo12 = offset - hi20;
>> > +
>> > +    code_ptr[0] |= encode_uimm20(hi20);
>> > +    code_ptr[1] |= encode_imm12(lo12);
>> > +}
>> > +
>>
>> This is ok for patching during generation, but it is not ok for
>> tb_target_set_jmp_target from patch 9.
>>
>> Will the riscv-32 compiler use a FSTD insn to implement atomic_set for 64-bit?
>>  If not, you may be just better off using the indirect method.
>
> I'm not sure. Is the indirect method just using atomic set, because
> that is what I have now?

Per the memory model chapter (which is being ratified now), FSD is not atomic on rv32i:

    An FLD or FSD instruction for which XLEN<64 may also be decomposed into a 
    set of component memory operations of any granularity.

So they should not be used on RV32I hosts to provide atomicity, even if they 
may be atomic on some microarchitectures.

