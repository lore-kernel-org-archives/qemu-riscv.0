Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gIFNm-0004IH-MW
	for mharc-qemu-riscv@gnu.org; Thu, 01 Nov 2018 11:59:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41668)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gIFNj-0004Ff-BI
	for qemu-riscv@nongnu.org; Thu, 01 Nov 2018 11:59:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gIFNf-0002Fg-HY
	for qemu-riscv@nongnu.org; Thu, 01 Nov 2018 11:59:39 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:45613)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gIFNc-0002Dy-3c
	for qemu-riscv@nongnu.org; Thu, 01 Nov 2018 11:59:33 -0400
Received: by mail-pg1-x542.google.com with SMTP id s3-v6so9213392pga.12
	for <qemu-riscv@nongnu.org>; Thu, 01 Nov 2018 08:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=aHJT6Fx9NeZPJOMut7DcvGVc/GA5wi13cymiH6NzmX0=;
	b=LdZ2iGpFg+gQxUsbgIGm0jBbQVayD50haz4YEzDxOHZcFcWL6kjfUniS71y4VtGmTk
	Y+e5i7czNxqclrcCF/iEt/6cHj0p4AqZX4Bv/kwWBA1F3FvgXmMC/L2bM5Td3Asbv/aI
	Cy3SSCHiA37uZHdnNhE52DE9xbXMhXEMYA3Cjxs+Ba8mMoNvkUfU33ALeH7QvOokuGB6
	tnZONxGDS4+/onCnXaUpiu/UjLcqL2J2l2TmMDuvppA9hIVfwhOI9bcmEjUDhqJID63x
	lbrJyZNB7+pj0ae3YVeUBnpS03pHbjVFSXF6AlVjwojNaE8HLs2SS3A+wZZVN8tADyLC
	vanA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=aHJT6Fx9NeZPJOMut7DcvGVc/GA5wi13cymiH6NzmX0=;
	b=Tg/vlNJri5WaKQWxEzb4SPNh8DugfMxeu1Aebr9DwlaDzspDDzNvYQlBwsVsQ1sQNA
	vsW4yi6SfHSJHVKs1z0OAO27x7Fn85TjRx4hTh7PYD6OiZK2tg7LB9eyvHGvGIfucN0P
	SxSSpn0XHv8HTxpKDFiEZkMryfyjxdJKuFLoH14PzFrG8YI8O8YEjeYzVDIrHuFhV+4V
	5VqAH43wnRpxfgNrma5S2ZXdK/p6mjywffPChQwWDGtVZQ1Yi8w4KJsw0o26FJCfnmQA
	LvMUEcDZ1ylUACod5OjlDmYdWrB3/rt6UBLjaSz9drnbXFwrWynbV/ugPgoRQDu2UDTt
	DBbw==
X-Gm-Message-State: AGRZ1gIbpLireQY2/Vppy7S6A5N7alFJyAaWOMUo0MAUZBZBbHqV707C
	m4d+C0bl2fwPlmG5AbZudKrXzw==
X-Google-Smtp-Source: AJdET5d+i3gcJ6/ME8SMvUf7y19Ypl8Q+lbC+urimK0fnr6HNqZe1ThnfY2GksPVxGhIMNqWu+PacA==
X-Received: by 2002:aa7:828a:: with SMTP id
	s10-v6mr8120708pfm.63.1541087966356; 
	Thu, 01 Nov 2018 08:59:26 -0700 (PDT)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	r76-v6sm55407298pgr.11.2018.11.01.08.59.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Nov 2018 08:59:25 -0700 (PDT)
Date: Thu, 01 Nov 2018 08:59:25 -0700 (PDT)
X-Google-Original-Date: Thu, 01 Nov 2018 08:58:35 PDT (-0700)
In-Reply-To: <8818c4f3-7ff5-44c6-abbe-67489519ccde@linaro.org>
CC: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Michael Clark <mjc@sifive.com>, sagark@eecs.berkeley.edu,
	Alistair Francis <Alistair.Francis@wdc.com>, 
	peer.adelt@hni.uni-paderborn.de, qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: richard.henderson@linaro.org
Message-ID: <mhng-3a3dd1f0-dbed-4b43-b21f-88ecea6f5fb1@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: Re: [Qemu-riscv] [PATCH v3 26/35] target/riscv: Remove shift and
 slt insn manual decoding
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
X-List-Received-Date: Thu, 01 Nov 2018 15:59:40 -0000

On Wed, 31 Oct 2018 15:38:08 PDT (-0700), richard.henderson@linaro.org wrote:
> On 10/31/18 1:20 PM, Bastian Koppelmann wrote:
>>  static bool trans_slt(DisasContext *ctx, arg_slt *a)
>>  {
>> -    gen_arith(ctx, OPC_RISC_SLT, a->rd, a->rs1, a->rs2);
>> +    TCGv source1 = tcg_temp_new();
>> +    TCGv source2 = tcg_temp_new();
>> +
>> +    gen_get_gpr(source1, a->rs1);
>> +    gen_get_gpr(source2, a->rs2);
>> +
>> +    tcg_gen_setcond_tl(TCG_COND_LT, source1, source1, source2);
>
> I do wonder about extracting this one line to gen_slt so that you can re-use
> gen_arith and gen_arithi.
>
>> +    tcg_gen_setcond_tl(TCG_COND_LTU, source1, source1, source2);
>
> Similarly.
>
>>  static bool trans_sllw(DisasContext *ctx, arg_sllw *a)
>>  {
>> -    gen_arith(ctx, OPC_RISC_SLLW, a->rd, a->rs1, a->rs2);
>> +    TCGv source1 = tcg_temp_new();
>> +    TCGv source2 = tcg_temp_new();
>> +
>> +    gen_get_gpr(source1, a->rs1);
>> +    gen_get_gpr(source2, a->rs2);
>> +
>> +    tcg_gen_andi_tl(source2, source2, 0x1F);
>> +    tcg_gen_shl_tl(source1, source1, source2);
>> +
>> +    gen_set_gpr(a->rd, source1);
>
> Missing the ext32s after the shift.
>
>>  static bool trans_srlw(DisasContext *ctx, arg_srlw *a)
>>  {
>> -    gen_arith(ctx, OPC_RISC_SRLW, a->rd, a->rs1, a->rs2);
>> +    TCGv source1 = tcg_temp_new();
>> +    TCGv source2 = tcg_temp_new();
>> +
>> +    gen_get_gpr(source1, a->rs1);
>> +    gen_get_gpr(source2, a->rs2);
>> +
>> +    /* clear upper 32 */
>> +    tcg_gen_ext32u_tl(source1, source1);
>> +    tcg_gen_andi_tl(source2, source2, 0x1F);
>> +    tcg_gen_shr_tl(source1, source1, source2);
>
> Likewise.  (Consider source2 == 0.)
>
>> -    case OPC_RISC_SRL:
>> -        tcg_gen_andi_tl(source2, source2, TARGET_LONG_BITS - 1);
>> -        tcg_gen_shr_tl(source1, source1, source2);
>> -        break;
> ...
>> -    case OPC_RISC_SRA:
>> -        tcg_gen_andi_tl(source2, source2, TARGET_LONG_BITS - 1);
>> -        tcg_gen_sar_tl(source1, source1, source2);
>> -        break;
>
> I see that the bugs are in the original though, so fixing them in a separate
> patch is certainly ok.

Since we're in the soft freeze now, I think it would be great to get the bug 
fixes broken out as separate patches at the start of this series that we can 
pick up for this release.  It would be great if the decodetree conversion was a 
non-functional change, as that will make it easier to review.

Sorry for adding a bunch of work for you, Bastian :)

