Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHu2b-0005yE-9D
	for mharc-qemu-riscv@gnu.org; Wed, 31 Oct 2018 13:12:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34093)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gHu1a-000575-Ub
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 13:11:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gHu1X-0003va-MR
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 13:11:22 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:35968)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gHu1X-0003sL-Cu
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 13:11:19 -0400
Received: by mail-wr1-x443.google.com with SMTP id y16so17351549wrw.3
	for <qemu-riscv@nongnu.org>; Wed, 31 Oct 2018 10:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=TUXPb7kLLKnc0rPP5FmoYHeqfmLgLfWUGDLEhom1Bw8=;
	b=PJPltwWDkcKmJMW+MPIuapDxtvBde19GcSkYS2UiQpfn5joljvHGGtev7uOY/8CgZ1
	KYaxV0yYBF7FacxzB00iba15RDUkUw3ua4WAXfnubAWc+g86AhrGbpvMaWHAMiPJCo0V
	+Wffg1ARwXZgO458gi/23cI71tFcp3rg4xfiA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=TUXPb7kLLKnc0rPP5FmoYHeqfmLgLfWUGDLEhom1Bw8=;
	b=gNRYL0FRoyC5jwhY9o9z3rMOVGp0BGDgTwBFVcSJ3AKiLfQYpgVVCA3KPvxCQpZIgu
	5tR7Ju26lddA+mbRnmQim1qpO7kpeSzah5WD1byKoV48P74uZ1Vb/xSGgFJ/tFiFxOVX
	F7zF2+oDGDy3wLfg4c5h6+gbD/XfFOtiRRATp3Lz+0UasMFhjhYYWvjPGTiN42jEOfUO
	t/ra3bFYnq0R6kbJZMlrzrKEKxf3v+0lzdOTTPBU8JIeeSw5o7WGQ5rE2SgZo9FrlU5L
	Jynnwn+pUuLSx1OsQIS8AL1IomydOQN+f9YS4Hiy6JLISpXoUwIStEjxQvxnq08F5/MR
	zMPQ==
X-Gm-Message-State: AGRZ1gKu3ZEXFDPxv8p6RBspVe1end7JwHGZjfLQP7ZGDs7v1972Y+rN
	HcXnB4SSzJjJBAu8QS9EfCkGUh6cHFw=
X-Google-Smtp-Source: AJdET5frMu+5o2u/x7UHmOJ13o5th8LYOZDjI4g4WnjIaEf2kpvp9sBNf0LMF7OBJDRuX/E9L16psA==
X-Received: by 2002:a5d:52ce:: with SMTP id
	r14-v6mr3420674wrv.123.1541005876486; 
	Wed, 31 Oct 2018 10:11:16 -0700 (PDT)
Received: from cloudburst.twiddle.net (79-69-241-110.dynamic.dsl.as9105.com.
	[79.69.241.110]) by smtp.gmail.com with ESMTPSA id
	d11sm2596009wrx.78.2018.10.31.10.11.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 31 Oct 2018 10:11:15 -0700 (PDT)
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, mjc@sifive.com,
	sagark@eecs.berkeley.edu, palmer@sifive.com, Alistair.Francis@wdc.com
Cc: peer.adelt@hni.uni-paderborn.de, qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
References: <20181031132029.4887-1-kbastian@mail.uni-paderborn.de>
	<20181031132029.4887-4-kbastian@mail.uni-paderborn.de>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <ff860811-e5f6-54ea-d351-11e49b60f541@linaro.org>
Date: Wed, 31 Oct 2018 17:11:14 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181031132029.4887-4-kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::443
X-Mailman-Approved-At: Wed, 31 Oct 2018 13:12:24 -0400
Subject: Re: [Qemu-riscv] [PATCH v3 03/35] target/riscv: Convert RVXI branch
 insns to decodetree
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
X-List-Received-Date: Wed, 31 Oct 2018 17:11:23 -0000

On 10/31/18 1:19 PM, Bastian Koppelmann wrote:
> +static bool trans_jal(DisasContext *ctx, arg_jal *a, uint32_t insn)
> +{
> +    gen_jal(ctx->env, ctx, a->rd, a->imm);
> +    return true;
> +}

This patch didn't get updated properly.  It looks like the removal of the insn
parameter got squashed into patch 4 instead.


r~

