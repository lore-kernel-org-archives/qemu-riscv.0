Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPNGC-0001IP-Nv
	for mharc-qemu-riscv@gnu.org; Wed, 21 Nov 2018 02:49:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36884)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gPNGA-0001Al-KJ
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 02:49:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gPN7P-0008KD-6Z
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 02:40:18 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:39015)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gPN7P-0008I2-07
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 02:40:15 -0500
Received: by mail-wm1-x341.google.com with SMTP id u13-v6so4672385wmc.4
	for <qemu-riscv@nongnu.org>; Tue, 20 Nov 2018 23:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=sU1OPb9YZEheyNv36D02QOyTR6Xw73ZN+mKj808Mv2Y=;
	b=cp7xYvgZUH9k5ZpyoZhW2fcKdx7yM0N2WR6pvkMhRIK1aYYO571hJDrCyoGaF3Cy1A
	sU0+0f0NQmleROCJ/y65/fxyX3H2Vjeyn2aHNb2ow0YglGYuICUO5mS2Z83A4fEaPMy/
	o4kgS5oyB8RTCfB+HoLiq4MSUNxt5bdARfsM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=sU1OPb9YZEheyNv36D02QOyTR6Xw73ZN+mKj808Mv2Y=;
	b=F4SAkZNw5ayCITodDnljGZFbp9aNkj093AG0RIoJ6/cuk7MFpSAXft8ZFeoNon5srP
	XbRAfRM4CRlgqs9H+bZ/wjXJ/VwW+z+HECH/FrOqfLOuLrU7oRFLz52B2ALl6EMfmIMY
	hst8v7Ch6XsoOvmZ4r1RpiB1Iw0Z9NT4eIHZvBBa7MFD7nD55sziFwqw9e4A5vlhFG/L
	NXQ+f7JcysYR2qs/9Rnp4rKtyY9CkroGRD7HNW94pf3mleXbrmlF5xovRWsAaa6in+Y7
	IJAUkcgBPl43AADiHYxqIudK11TCli3ppciNkzS5ieliKqh9aivcYYnPMaAngGC6zCSo
	k77A==
X-Gm-Message-State: AA+aEWau9Y5kdMSWX8jWlIIXtcXiCaN6uGZLBi9mJvYBo0KfJuQOT49l
	bKyJfgh5ZYHmr+QSr4uUIXX+A7ljs6L56A==
X-Google-Smtp-Source: AFSGD/UTvzfVALnGTev1j/EyVufjhVJTF21daxVd8N0RYJCobVsTPme7pVCQspy3B8/fbGuvj6FKGA==
X-Received: by 2002:a1c:2d57:: with SMTP id t84-v6mr4982449wmt.9.1542786013708;
	Tue, 20 Nov 2018 23:40:13 -0800 (PST)
Received: from cloudburst.twiddle.net ([195.77.246.50])
	by smtp.gmail.com with ESMTPSA id
	j129-v6sm108324wmb.47.2018.11.20.23.40.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Nov 2018 23:40:13 -0800 (PST)
To: Alistair Francis <alistair23@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-riscv@nongnu.org
References: <cover.1542321076.git.alistair.francis@wdc.com>
	<f1a7d2617c26c1745fafe13bbe3bc3b042c14217.1542321076.git.alistair.francis@wdc.com>
	<23831afc-0ebf-5802-e8e2-6ce48dd340f9@linaro.org>
	<CAKmqyKP5cCRZujTm+OvoNZWNwPhJirPLA7PjurbovnN8RYCcgQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <8bacdaca-94c2-d2c7-3af7-b98517a98b64@linaro.org>
Date: Wed, 21 Nov 2018 08:40:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKP5cCRZujTm+OvoNZWNwPhJirPLA7PjurbovnN8RYCcgQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: Re: [Qemu-riscv] [Qemu-devel] [RFC v1 15/23] riscv: tcg-target: Add
 branch and jump instructions
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
X-List-Received-Date: Wed, 21 Nov 2018 07:49:19 -0000

On 11/21/18 12:49 AM, Alistair Francis wrote:
> On Fri, Nov 16, 2018 at 1:14 AM Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 11/15/18 11:36 PM, Alistair Francis wrote:
>>> +static void tcg_out_brcond(TCGContext *s, TCGCond cond, TCGReg arg1,
>>> +                           TCGReg arg2, TCGLabel *l)
>>> +{
>>> +    RISCVInsn op = tcg_brcond_to_riscv[cond].op;
>>> +    bool swap = tcg_brcond_to_riscv[cond].swap;
>>> +
>>> +    tcg_out_opc_branch(s, op, swap ? arg2 : arg1, swap ? arg1 : arg2, 0);
>>
>> You might want to tcg_debug_assert(op != 0) here.
>>
>>> +    if (l->has_value) {
>>> +        reloc_sbimm12(s->code_ptr - 1, l->u.value_ptr);
>>
>> I'm concerned about the conditional branch range.  +-4K isn't much to work
>> with.  The minimum we have for other hosts is +-32K.
>>
>> We have two options: (1) greatly reduce the max size of the TB for this host;
>> (2) be prepared to emit a 2 insn sequence: conditional branch across
>> unconditional branch, with forward branches that turn out to be small patched
>> with a nop.
>>
>> FWIW, the first case would be done via modification of tcg_op_buf_full.  You
>> might have to go as low as 500 opcodes, I'm not sure.
> 
> How do we do option 2?

If l->has_value, just check the actual range.  But of course backward branching
isn't that common in tcg generated code.  Most branches within the TB are short
forward branches, but we also don't know how short is short.

But every TB begins with a test of env->exit_code and a conditional branch to
the end of the block, where we place some code to return to the main loop and
return the pointer to the TB at which we exited.  Thus every TB has a branch
that spans the size of the entire TB.

So, invent (or repurpose) an R_RISCV_FOO value.  It doesn't matter which
because it's private within tcg/riscv/.  Just add some commentary.  (See e.g.
tcg/sparc/ and its use of R_SPARC_13.)

While generating code, emit the conditional branch as normal; leave the unknown
destination 0 for now.  Emit a nop as the second insn.

When resolving R_RISCV_FOO, if the conditional branch is in range, great!  Just
patch it.  If it is out of range, then you need to edit the conditional branch
to reverse the condition (insn ^ (1 << 12)) and branch to pc+8, i.e. over the
next instruction.  Which was a nop during generation, but you will now install
jal r0,dest going to the real destination.


r~

