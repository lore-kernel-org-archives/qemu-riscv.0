Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPMtR-00042I-B3
	for mharc-qemu-riscv@gnu.org; Wed, 21 Nov 2018 02:25:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59578)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gPMtO-00041t-Vb
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 02:25:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gPMtK-0002pm-Rn
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 02:25:46 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:40723)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gPMtK-0002mp-J5
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 02:25:42 -0500
Received: by mail-wr1-x431.google.com with SMTP id p4so4489652wrt.7
	for <qemu-riscv@nongnu.org>; Tue, 20 Nov 2018 23:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=oLma4m7U4Q+cLpxZ6lB97OFmlRvRn8Yh0Ficp1mEozA=;
	b=NivWt+g1DcVOx33KxJF2LfrfBZnohEdNe8rDTLoeMEjne7uxAM00PYhw+rgWgafRbY
	sdACAXC3+BCgktmwbulkOUKxRey8Xvy208ZXBs1zusr5yPJAsqMGD72RX7ZMkXk8gCBX
	0s6KTPzK3Um/eQdhyaQUCQQmxGg/jV/7hs3nk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=oLma4m7U4Q+cLpxZ6lB97OFmlRvRn8Yh0Ficp1mEozA=;
	b=daEHsTyDenUIaKfHAtV5UM6jblxAtaspS/PJTTMdYQrkq4IOyHorRu3qERke3YYDcI
	riC772bzeZxSPi2rB7T2QbXBk3rFpYb+nIiq2APKZe16rkgh+2NIKIynv+nAHHRo00y4
	+iXeG4z7xNRI8gcIjgtJsd6JhdXYwtFDs+mw5KENEY8WAmmdyM7E+Rk06d8nwIitCvEa
	bAbR6QODRPU3h01pdncYESR/RZwCg5VAms5Ri/cEFgBNM1N3CCZUxCXmF+hlZLEjhUAW
	uRAzYLwIPy6JPhkuzVt52J/LPfgykq2U7T+Ag+KXOtp+hsdpijCA+w0tbWhdlidMzIdt
	FQXA==
X-Gm-Message-State: AA+aEWbEP8vtWf165IG0U8gBhh/PpOqtkSPdyJQix+ciMs81VTSVRGOq
	k1oiQ+E/hgVNH9Q+KPt8TMp74iYzJN2u7w==
X-Google-Smtp-Source: AFSGD/VZrxjah54WSUIymUR/u/gIsVpME0X9nWZYn2jI2k7WHBAdv19cu+K+m0w0chFl8k8Jv33BjQ==
X-Received: by 2002:adf:f4c2:: with SMTP id h2mr4494553wrp.21.1542785140905;
	Tue, 20 Nov 2018 23:25:40 -0800 (PST)
Received: from cloudburst.twiddle.net ([195.77.246.50])
	by smtp.gmail.com with ESMTPSA id
	a204sm123208wmh.23.2018.11.20.23.25.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Nov 2018 23:25:40 -0800 (PST)
To: Alistair Francis <alistair23@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-riscv@nongnu.org
References: <cover.1542321076.git.alistair.francis@wdc.com>
	<1fe9630dd4ad73b8581684cd0ed6d5fa2918390f.1542321076.git.alistair.francis@wdc.com>
	<34cb4780-f35f-9bd5-7980-fae18e3e93dd@linaro.org>
	<CAKmqyKMh3T7w-NsP-i2HaRUHvR-0BhqeyTgd2mD0hnH9k8gZiQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <ec2b5e9c-0e46-c7b9-f123-decfbafe996b@linaro.org>
Date: Wed, 21 Nov 2018 08:25:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKMh3T7w-NsP-i2HaRUHvR-0BhqeyTgd2mD0hnH9k8gZiQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::431
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
X-List-Received-Date: Wed, 21 Nov 2018 07:25:47 -0000

On 11/21/18 2:15 AM, Alistair Francis wrote:
>> Will the riscv-32 compiler use a FSTD insn to implement atomic_set for 64-bit?
>>  If not, you may be just better off using the indirect method.
> 
> I'm not sure. Is the indirect method just using atomic set, because
> that is what I have now?

It's controlled by TCG_TARGET_HAS_direct_jump, and goes through here:

> +    case INDEX_op_goto_tb:
> +        if (s->tb_jmp_insn_offset) {
> +            /* direct jump method */
> +            s->tb_jmp_insn_offset[a0] = tcg_current_code_size(s);
> +            /* should align on 64-bit boundary for atomic patching */
> +            tcg_out_opc_upper(s, OPC_AUIPC, TCG_REG_TMP0, 0);
> +            tcg_out_opc_imm(s, OPC_JALR, TCG_REG_ZERO, TCG_REG_TMP0, 0);
> +        } else {
> +            /* indirect jump method */
> +            tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP0, TCG_REG_ZERO,
> +                       (uintptr_t)(s->tb_jmp_target_addr + a0));
> +            tcg_out_opc_imm(s, OPC_JALR, TCG_REG_ZERO, TCG_REG_TMP0, 0);
> +        }
> +        s->tb_jmp_reset_offset[a0] = tcg_current_code_size(s);
> +        break;

where as you've correctly implemented, the indirect jump loads a destination
from memory (atomically, via a single load insn), and then branches to it.

The direct jump method avoids the load from memory, but then one has to be able
to modify the insn(s) that perform the jump with a single atomic_set.  Which in
this case, means that the two insns must be aligned so that we can perform a
single aligned 64-bit store.

I recommend at least starting with the indirect method because it's easier.


r~

