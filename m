Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNhdc-0004iE-K3
	for mharc-qemu-riscv@gnu.org; Fri, 16 Nov 2018 12:10:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51957)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gNhda-0004i0-68
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 12:10:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gNhdW-0006bR-IR
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 12:10:33 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:42483)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gNhdR-0006Su-UY
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 12:10:27 -0500
Received: by mail-oi1-x244.google.com with SMTP id w13so7622117oiw.9
	for <qemu-riscv@nongnu.org>; Fri, 16 Nov 2018 09:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Li9AF1PsuULe/c7V/+r7ghhp8Gm7dcqiWR9Wis/iz00=;
	b=hUcJ9516gwDNfe0zU4gzA6cP4OVq18QO1dLFw9g9EDikkbPfz0L7gQBPgE0H4pTUxk
	rmnmfMt7HqhgRIyEwq7hTRRfWrN2UrHCIKQVjNKkDUfUVBWOZo9mDynWHqcnnNzxRFXa
	/QOZOEVYIwlVfx34kLQ/LnfvXZ+S5Yp6Gjlic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Li9AF1PsuULe/c7V/+r7ghhp8Gm7dcqiWR9Wis/iz00=;
	b=ch65T7yghdP9gXNMl/wSxzuA3kef3wH4hTxG26cqosGrYumMktDfztUkioAP+mcSdd
	1EbrGiEAKOU01xtgW8WgNb6jAzzbJUyOBeUndYUXqkLU/35ANuE5FS1WvMuR4606K7wf
	8ZDLvMYMd+ST4Nfxzr7cI/mKI2aLmqkJdDo0+SIWwGUP3xV6WGmHGoTCDdkHIVjCyCrL
	mgUvlO4RuYt0Ifmhc7ttK5ZN8Ttwtl+BVGKFm4sHWYe2UOMrkc6LH4EeORfRMxqDxvgh
	24VoPq4217QBvCUvMLSTdlHKR3nXPlKWrYGlYigMGBrgPiO25ndQkR9X5CT58AIndprW
	8hWw==
X-Gm-Message-State: AGRZ1gJbjmLPhKiKazQG0n9WnA7pBPN/k7eJm3QCJyJgJQZahZp+nAJ/
	A2/eHIWDAdgeA7QyNRoLqzzF6w==
X-Google-Smtp-Source: AJdET5cB2R5NI5aHhM+TwG0M3mA/Sa2ELmb5y6yHcL8MOflDfTEkIBJPensxtgJawEdm3HOL1+lNQQ==
X-Received: by 2002:aca:c752:: with SMTP id
	x79-v6mr1343759oif.139.1542388221594; 
	Fri, 16 Nov 2018 09:10:21 -0800 (PST)
Received: from cloudburst.twiddle.net ([172.56.13.118])
	by smtp.gmail.com with ESMTPSA id
	g132-v6sm15711914oif.9.2018.11.16.09.10.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Nov 2018 09:10:20 -0800 (PST)
To: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Cc: "alistair23@gmail.com" <alistair23@gmail.com>
References: <cover.1542321076.git.alistair.francis@wdc.com>
	<ccb312eb986d846b1b0aa0be062833e5ae1bb5f4.1542321076.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <687076b9-a5ca-2821-3e24-8b08363f1b5c@linaro.org>
Date: Fri, 16 Nov 2018 18:10:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <ccb312eb986d846b1b0aa0be062833e5ae1bb5f4.1542321076.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-riscv] [Qemu-devel] [RFC v1 17/23] riscv: tcg-target: Add
 direct load and store instructions
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
X-List-Received-Date: Fri, 16 Nov 2018 17:10:35 -0000

On 11/15/18 11:36 PM, Alistair Francis wrote:
> +    tcg_out_opc_reg(s, OPC_ADD, base, TCG_GUEST_BASE_REG, addr_regl);

Should avoid this when guest_base == 0, which happens fairly regularly for a
64-bit guest.

> +        /* Prefer to load from offset 0 first, but allow for overlap.  */
> +        if (TCG_TARGET_REG_BITS == 64) {
> +            tcg_out_opc_imm(s, OPC_LD, lo, base, 0);
> +        } else {
> +            tcg_out_opc_imm(s, OPC_LW, lo, base, 0);
> +            tcg_out_opc_imm(s, OPC_LW, hi, base, 4);
> +        }

Comment sounds like two lines of code that's missing.

> +    const TCGMemOp bswap = opc & MO_BSWAP;
> +
> +    /* TODO: Handle byte swapping */

Should assert rather than emit bad code.

I do still plan to change tcg to allow backends to *not* handle byte swapping
if they don't want.  This will make the i386 and arm32 backends less icky.


r~

