Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNZZm-0007bq-Rl
	for mharc-qemu-riscv@gnu.org; Fri, 16 Nov 2018 03:34:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40430)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gNZZk-0007bA-AO
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 03:34:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gNZZi-0008N2-Tj
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 03:34:04 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:37358)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gNZZg-0008Iv-Pd
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 03:34:02 -0500
Received: by mail-wm1-x333.google.com with SMTP id p2-v6so20195509wmc.2
	for <qemu-riscv@nongnu.org>; Fri, 16 Nov 2018 00:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Gy9en7p9RZgcNqN005OkUlEOraf/gerU0BuB/Y1ngeU=;
	b=H/RkkbM8pAqAqSXpFXA2IB0E2w6Uh7htWedtj0m2nzmf/1oahoBMgQVNqAcaijlGCP
	aIf7E+LEVWxL0+mCvov643anYQb47mnzqneYvMlOVz5AoQrpy1pdXWcb5f6LqI5EFlU5
	ePdrpngYbYGTIUl8QpM18SQZmD7iNycHx9tcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Gy9en7p9RZgcNqN005OkUlEOraf/gerU0BuB/Y1ngeU=;
	b=hoZhP/9xyf+vjHaggDjhj6ZBM3tIlY1CFBdwiymN3PSuEmweTtCE7e3pmaAGjknr3O
	MLV12GyKqGCsAZ5j/fDkcDOvq7GqumV4fUFjOiZlm2f65LlI8OpLGFYs3KlX2CylLv6/
	iHiHmxlsw6V1nyAsTEL5IV3ua8olm7kR/WLs/ESgeHKg1WJ8iWomT2HgF0vUrK/OunUz
	ctnTtRQaYN7OAI3DbC2DSOKkc0ixSCS9fZBrAMPG8x9frRF26AWPMb0NXWY9X6zIUx6O
	OusS96k1MUyo1WMOJro8sWVFaLNZe9Fqmf5N8VEjmkwEv4VfLlW69CrjvSH/KIDmnDB0
	ahsA==
X-Gm-Message-State: AGRZ1gLjN8ExZ0oc3Q3jwC+3obg3VEtKGAr519lYfiTK+kbZEDqpO9SQ
	C237K3HBzOpUgncPdmhcskTIRw==
X-Google-Smtp-Source: AJdET5dv6zZzbbfHM5aq9CWjk/4aF9/i7nb+c9IOMT4ISoF4DWHd6ZiqS0qo30DuCwlOdrSf+sHvdA==
X-Received: by 2002:a1c:8b14:: with SMTP id
	n20-v6mr1718296wmd.34.1542357234375; 
	Fri, 16 Nov 2018 00:33:54 -0800 (PST)
Received: from cloudburst.twiddle.net
	(74.red-37-10-255.dynamicip.rima-tde.net. [37.10.255.74])
	by smtp.gmail.com with ESMTPSA id 133sm2171785wme.9.2018.11.16.00.33.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Nov 2018 00:33:53 -0800 (PST)
To: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Cc: "alistair23@gmail.com" <alistair23@gmail.com>
References: <cover.1542321076.git.alistair.francis@wdc.com>
	<1fe9630dd4ad73b8581684cd0ed6d5fa2918390f.1542321076.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <34cb4780-f35f-9bd5-7980-fae18e3e93dd@linaro.org>
Date: Fri, 16 Nov 2018 09:33:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <1fe9630dd4ad73b8581684cd0ed6d5fa2918390f.1542321076.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::333
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
X-List-Received-Date: Fri, 16 Nov 2018 08:34:05 -0000

On 11/15/18 11:35 PM, Alistair Francis wrote:
> +static void reloc_sbimm12(tcg_insn_unit *code_ptr, tcg_insn_unit *target)
> +{
> +    intptr_t offset = (intptr_t)target - (intptr_t)code_ptr;
> +    tcg_debug_assert(offset == sextract32(offset, 1, 12) << 1);
> +
> +    code_ptr[0] |= encode_sbimm12(offset);
> +}

FYI, I have an in-flight patch for 4.0 that will make patch_reloc return a bool
for relocation success, which will move these asserts.

http://lists.nongnu.org/archive/html/qemu-devel/2018-11/msg02237.html


> +static void reloc_call(tcg_insn_unit *code_ptr, tcg_insn_unit *target)
> +{
> +    intptr_t offset = (intptr_t)target - (intptr_t)code_ptr;
> +    tcg_debug_assert(offset == (int32_t)offset);
> +
> +    int32_t hi20 = ((offset + 0x800) >> 12) << 12;
> +    int32_t lo12 = offset - hi20;
> +
> +    code_ptr[0] |= encode_uimm20(hi20);
> +    code_ptr[1] |= encode_imm12(lo12);
> +}
> +

This is ok for patching during generation, but it is not ok for
tb_target_set_jmp_target from patch 9.

Will the riscv-32 compiler use a FSTD insn to implement atomic_set for 64-bit?
 If not, you may be just better off using the indirect method.


r~

