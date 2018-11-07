Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gKC9W-00032u-1M
	for mharc-qemu-riscv@gnu.org; Tue, 06 Nov 2018 19:57:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50576)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gKC9U-00032j-1a
	for qemu-riscv@nongnu.org; Tue, 06 Nov 2018 19:57:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gKC9P-0007G0-PX
	for qemu-riscv@nongnu.org; Tue, 06 Nov 2018 19:56:59 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:33068)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gKC9L-0006tX-TB
	for qemu-riscv@nongnu.org; Tue, 06 Nov 2018 19:56:52 -0500
Received: by mail-pl1-x644.google.com with SMTP id w22-v6so3718845plk.0
	for <qemu-riscv@nongnu.org>; Tue, 06 Nov 2018 16:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=FE+RBp5NkTRXFBWiq9dELBWs5RvOR3FpMjWG9qVxM/M=;
	b=lGAYuc1eeraTyne1rcrh1x9j4dBkHNEYaXzDTGi5Ije5xgmpPlAhpRFHcIpYU8d5lY
	1mA7ABmlZ8clgbW8Z+QJbDaOfszC9BPQ+Dmmsqy82HPeEO3OBJK0UoL3harb2xdXMlJL
	a4Ryeb32OtY/g2y37zpm/OU3NFvh38GnHofueFHcDHblNWFbZesdM0NZRanYU9UwK/Rt
	OiiZCLg3AwU72HHlyb6K8VCtb5ZiS3oFOWnh22T7zNXjqcWNkVQvrVJfi9SU4kA+8Y8S
	NsLgINEOrRMJv9hwDu9DPLVszEkEDMDdOUoNiJHY+aQZRalXrDIatQ9z1fwo3xG/e3Ww
	/hig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=FE+RBp5NkTRXFBWiq9dELBWs5RvOR3FpMjWG9qVxM/M=;
	b=BIQsqMSK0AncpqTngLmZicZ4xEMOJnoXnUWoaruleJf7sLP4AvUDafJRqZOO6lc24r
	QLuAGgMw6xTD3REJL4DYbti/GSsU8dTv7RtAF3JZCle3fh9UERJlUT/kytao2n4W9jdq
	jSRprH/Wax0rYyCZ5/JPbprTbaNoVYGWdMCAOEPUfMJmrBcm93mskV5dURKmd2mY0nhN
	QP2FQVkB38444sWt4PDZTiD0zCWCQl2+TrN4OOyMAmC6YJRqCj/GudgOQXTQG5H87KKA
	eQwFQp59aZ4kGyiPyZfjyfWSccQp2rC+Sprqo3wnfjip5bkDw7LWDTYN6A3ILm8A87q6
	v8Bw==
X-Gm-Message-State: AGRZ1gJLUdgb+wyyxBHIuJ4+tM2VAgs3ojG0z8jMjb8M7wo22XAvehy+
	fOgQJIzKfGnfIB7i9SwVhbl2sg==
X-Google-Smtp-Source: AJdET5frFUiCPA+eFnROtP4IqRYjRwijLuOoGCu1QG9Lkuwskh3O9cwCNnOZixTEGsTvCDqiW+nSbw==
X-Received: by 2002:a17:902:8646:: with SMTP id
	y6-v6mr28524880plt.86.1541552210256; 
	Tue, 06 Nov 2018 16:56:50 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	7-v6sm49315023pgk.31.2018.11.06.16.56.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Nov 2018 16:56:49 -0800 (PST)
Date: Tue, 06 Nov 2018 16:56:49 -0800 (PST)
X-Google-Original-Date: Tue, 06 Nov 2018 16:54:16 PST (-0800)
In-Reply-To: <8cede3dd-e348-639e-b528-3aa87abf1aae@mail.uni-paderborn.de>
CC: richard.henderson@linaro.org, qemu-riscv@nongnu.org,
	sagark@eecs.berkeley.edu, 
	qemu-devel@nongnu.org, peer.adelt@hni.uni-paderborn.de,
	Alistair Francis <Alistair.Francis@wdc.com>, 
	Michael Clark <mjc@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Message-ID: <mhng-29c2d3d1-ff38-423d-a20e-70870b1f2639@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v3 26/35] target/riscv: Remove
 shift and slt insn manual decoding
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
X-List-Received-Date: Wed, 07 Nov 2018 00:57:01 -0000

On Mon, 05 Nov 2018 09:00:10 PST (-0800), Bastian Koppelmann wrote:
>
> On 11/1/18 4:59 PM, Palmer Dabbelt wrote:
>> On Wed, 31 Oct 2018 15:38:08 PDT (-0700), richard.henderson@linaro.org
>> wrote:
>>> On 10/31/18 1:20 PM, Bastian Koppelmann wrote:
>>>>  static bool trans_slt(DisasContext *ctx, arg_slt *a)
>>>>  {
>>>> -    gen_arith(ctx, OPC_RISC_SLT, a->rd, a->rs1, a->rs2);
>>>> +    TCGv source1 = tcg_temp_new();
>>>> +    TCGv source2 = tcg_temp_new();
>>>> +
>>>> +    gen_get_gpr(source1, a->rs1);
>>>> +    gen_get_gpr(source2, a->rs2);
>>>> +
>>>> +    tcg_gen_setcond_tl(TCG_COND_LT, source1, source1, source2);
>>>
>>> I do wonder about extracting this one line to gen_slt so that you can
>>> re-use
>>> gen_arith and gen_arithi.
>>>
>>>> +    tcg_gen_setcond_tl(TCG_COND_LTU, source1, source1, source2);
>>>
>>> Similarly.
>>>
>>>>  static bool trans_sllw(DisasContext *ctx, arg_sllw *a)
>>>>  {
>>>> -    gen_arith(ctx, OPC_RISC_SLLW, a->rd, a->rs1, a->rs2);
>>>> +    TCGv source1 = tcg_temp_new();
>>>> +    TCGv source2 = tcg_temp_new();
>>>> +
>>>> +    gen_get_gpr(source1, a->rs1);
>>>> +    gen_get_gpr(source2, a->rs2);
>>>> +
>>>> +    tcg_gen_andi_tl(source2, source2, 0x1F);
>>>> +    tcg_gen_shl_tl(source1, source1, source2);
>>>> +
>>>> +    gen_set_gpr(a->rd, source1);
>>>
>>> Missing the ext32s after the shift.
>>>
>>>>  static bool trans_srlw(DisasContext *ctx, arg_srlw *a)
>>>>  {
>>>> -    gen_arith(ctx, OPC_RISC_SRLW, a->rd, a->rs1, a->rs2);
>>>> +    TCGv source1 = tcg_temp_new();
>>>> +    TCGv source2 = tcg_temp_new();
>>>> +
>>>> +    gen_get_gpr(source1, a->rs1);
>>>> +    gen_get_gpr(source2, a->rs2);
>>>> +
>>>> +    /* clear upper 32 */
>>>> +    tcg_gen_ext32u_tl(source1, source1);
>>>> +    tcg_gen_andi_tl(source2, source2, 0x1F);
>>>> +    tcg_gen_shr_tl(source1, source1, source2);
>>>
>>> Likewise.  (Consider source2 == 0.)
>>>
>>>> -    case OPC_RISC_SRL:
>>>> -        tcg_gen_andi_tl(source2, source2, TARGET_LONG_BITS - 1);
>>>> -        tcg_gen_shr_tl(source1, source1, source2);
>>>> -        break;
>>> ...
>>>> -    case OPC_RISC_SRA:
>>>> -        tcg_gen_andi_tl(source2, source2, TARGET_LONG_BITS - 1);
>>>> -        tcg_gen_sar_tl(source1, source1, source2);
>>>> -        break;
>>>
>>> I see that the bugs are in the original though, so fixing them in a
>>> separate
>>> patch is certainly ok.
>>
>> Since we're in the soft freeze now, I think it would be great to get
>> the bug fixes broken out as separate patches at the start of this
>> series that we can pick up for this release.  It would be great if the
>> decodetree conversion was a non-functional change, as that will make
>> it easier to review.
>
>
> Sounds good. Unfortunately, I don't have much time right now. I try at
> least to extract the bugfixes, such that they make it for this release.

Thanks.  You're welcome to just enumerate the bug fixes so I can dig them out 
if that's easier.

