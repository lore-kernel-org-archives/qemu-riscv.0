Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gmpdE-0000LG-72
	for mharc-qemu-riscv@gnu.org; Thu, 24 Jan 2019 19:46:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59563)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gmpd2-0007s8-9t
	for qemu-riscv@nongnu.org; Thu, 24 Jan 2019 19:45:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gmpUU-0000BQ-A3
	for qemu-riscv@nongnu.org; Thu, 24 Jan 2019 19:37:03 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:44344)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gmpUU-0000Ao-1m
	for qemu-riscv@nongnu.org; Thu, 24 Jan 2019 19:37:02 -0500
Received: by mail-pg1-x543.google.com with SMTP id t13so3411828pgr.11
	for <qemu-riscv@nongnu.org>; Thu, 24 Jan 2019 16:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=ndiBmp6DiS6iEnfDHNjkZmf98AE3xyYQsZFTHhDgh3c=;
	b=ct8ZzjLsjXe2Q0HndtvlWNYA5s9ssIgW69ZoO6XCMgTPm8xFGz6/KmCtwzfDWkusYC
	EqB4ceZ1P6NKQp0bgzvfaiNojXk22PuH1GWyfLF1Md3zmE3ocsiPEhHgRgMv65jd5VSK
	1l+OA5pFh6wjrx2QUZQ2/jVqL8ZPNOcBZ5H9DbGbqrqHXzListhAO3hHXlnSJ4R2+xJw
	VR0Eg6b2mZw1Mngfi1MG7DUg54hSdRYBDLvvqEMgSLUqXMTwO2jApQGUrAumtwvqjRIy
	ac3bD793+gAnplt+Ltg3QK3W4+3vQxZ8fZa5y7fFaZcf2oYddeuki2gbh97g/Gq5ohp6
	wN/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=ndiBmp6DiS6iEnfDHNjkZmf98AE3xyYQsZFTHhDgh3c=;
	b=GxyhbTy0ppN2gxPsvHYYqoAfksFHY/pdeE/nPoB551crGGZOXuXBlT+8JR9HDZ8cMY
	lE8S0JpQecDwddr7+QhxQcCcfrXeOq0BlaYTKVwTh+btUS0J96bOIc/PJodWICT+HEDf
	sG37BbkdSAYbWMT/rFcq0LKswxsTlVxNZsmchWnKHjm9Sh88M+zEDO4tvRcPIWdOE9Qt
	6bqdP2fE4dSF/wuVO73iRqEyICDlyYHAdy0N/YnSRCIxQ57rCIbU4IOEA+V4pr0EXUtC
	J1ujy5RZ+Q0NVoPRrRJJkL2+uKXi3E0M3J0OE0VR9ZprNfkkOki+KqFHNc/s6x5AcCLo
	oKlA==
X-Gm-Message-State: AJcUukfCcV1yj+qo9iguFmmdM7CXEz/zicWGijZ1w07Rom4yDECOYpEr
	chqdSV3tohdAOCXXNbMS+gDMqw==
X-Google-Smtp-Source: ALg8bN5jow7wsGWzUsM9gGeoz3m14710k0vbWXP65pPsCAIt4OQl7PtWqTdLWBrekk4Pmg6SdvThtw==
X-Received: by 2002:a63:9749:: with SMTP id d9mr7821594pgo.415.1548376620446; 
	Thu, 24 Jan 2019 16:37:00 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	h64sm37695367pfc.142.2019.01.24.16.36.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Jan 2019 16:36:59 -0800 (PST)
Date: Thu, 24 Jan 2019 16:36:59 -0800 (PST)
X-Google-Original-Date: Thu, 24 Jan 2019 16:28:56 PST (-0800)
In-Reply-To: <CAKmqyKOgQLX3Feh=g2ytdiSbFaedWdExpVVjMt6v+SUqxRYhzQ@mail.gmail.com>
CC: richard.henderson@linaro.org, qemu-riscv@nongnu.org,
	Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: alistair23@gmail.com
Message-ID: <mhng-8ea8314c-74f3-485d-a128-9fe9418ba593@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v1 5/8] RISC-V: Add priv_ver
 to DisasContext
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
X-List-Received-Date: Fri, 25 Jan 2019 00:45:53 -0000

On Tue, 15 Jan 2019 14:25:44 PST (-0800), alistair23@gmail.com wrote:
> On Tue, Jan 15, 2019 at 2:24 PM Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 1/15/19 10:58 AM, Alistair Francis wrote:
>> > -static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>> > +static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
>>
>> Why change this?  I know there is variation in the naming, but my
>> preferred default mapping is CPUState *cs, RISCVCPU *cpu.
>
> Good point, I have changed it back to cs.

I don't see a v2, so I'm just going to go ahead and squash in

    diff --git a/target/riscv/translate.c b/target/riscv/translate.c
    index 8593c2170af4..b7176cbf98e1 100644
    --- a/target/riscv/translate.c
    +++ b/target/riscv/translate.c
    @@ -2015,10 +2015,10 @@ static void decode_opc(DisasContext *ctx)
         }
     }
    
    -static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
    +static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     {
         DisasContext *ctx = container_of(dcbase, DisasContext, base);
    -    CPURISCVState *env = cpu->env_ptr;
    +    CPURISCVState *env = cs->env_ptr;
    
         ctx->pc_succ_insn = ctx->base.pc_first;
         ctx->mem_idx = ctx->base.tb->flags & TB_FLAGS_MMU_MASK;

and add Richard's tag.

>
> Alistair
>
>>
>> Otherwise,
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

