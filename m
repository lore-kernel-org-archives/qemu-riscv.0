Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gS5p3-0008Az-LN
	for mharc-qemu-riscv@gnu.org; Wed, 28 Nov 2018 14:48:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59698)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gS5oz-00086c-TV
	for qemu-riscv@nongnu.org; Wed, 28 Nov 2018 14:48:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gS5ou-00046T-Vo
	for qemu-riscv@nongnu.org; Wed, 28 Nov 2018 14:48:29 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:44935)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gS5ou-00045R-LA
	for qemu-riscv@nongnu.org; Wed, 28 Nov 2018 14:48:24 -0500
Received: by mail-pg1-x52c.google.com with SMTP id t13so9946271pgr.11
	for <qemu-riscv@nongnu.org>; Wed, 28 Nov 2018 11:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=7QhKpK6qxCR4xO5xDzXYBNeDZoP14yX05/DKHVlfsEU=;
	b=PQo2dDBQh0S69TBZ41m+R/DfqgRdtEzP08p8ySyNKAU93rLWSRcyA66g3BU0xjY1xp
	AXM5nBAnMI0qaMHzTCpOuZo3XG9G+gZSn8TuZLQ16uVG8Twjs31+qs/0+NuQYguZrK2O
	fFN8mniC9LwVo4hA/O932mDCpZ/dUGkh1E/wU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=7QhKpK6qxCR4xO5xDzXYBNeDZoP14yX05/DKHVlfsEU=;
	b=sqy6D70lbO6jezb6OyR9c1OTx+tFth0VAMdQ0sj0fpIC+Zr7wMgoiXNWK/tL2Qawa9
	nwz8vjKawxQHTaThCXR05nmA2TY6AfoxY273RQHJApvBCSol1qSbfVs23gTG2BlMhy7d
	bsAbNhtelzgg7eXbGKlakDW+aYc2jgbifjfV7n/waWOEEezcZ0AYI/9+sCBdLiX1HMF6
	D/EKGYx2K7cHXaf7WiUto8qOpF4FPld3Ls354Cs+h7uVG/6nz+8BRJXRKgjMTkDJFI0S
	vBS4NYpTSwKO63IFffYqm+JAQfJEwrDmEAq+bQdiSb9cct/nR3M1e4n9K7LvgvKZNcOE
	Hk1Q==
X-Gm-Message-State: AA+aEWYli+/mhzsiCPHrOIWL2XXSISu6xmc1VqVpiQzUPMSXjtyidauF
	qUhnQ1ufs+us88KFochQcXolVQ==
X-Google-Smtp-Source: AFSGD/Wovsj54vdrb/qkWqdKUYq1yTIMO6RWEcECxgrKhVWAhKidSWicXX0Mjrif3gMB8iH1xbAnXQ==
X-Received: by 2002:a62:32c4:: with SMTP id y187mr2014879pfy.195.1543434502411;
	Wed, 28 Nov 2018 11:48:22 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-170-180.tukw.qwest.net.
	[97.113.170.180]) by smtp.gmail.com with ESMTPSA id
	r130sm13869040pfr.48.2018.11.28.11.48.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Nov 2018 11:48:21 -0800 (PST)
To: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Cc: "alistair23@gmail.com" <alistair23@gmail.com>
References: <cover.1543352682.git.alistair.francis@wdc.com>
	<51221791beb40b25309805b1c76db0004f26f64e.1543352682.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <111ab594-64d4-efbd-2ce9-cda600a47abc@linaro.org>
Date: Wed, 28 Nov 2018 11:48:19 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <51221791beb40b25309805b1c76db0004f26f64e.1543352682.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::52c
Subject: Re: [Qemu-riscv] [RFC v2 11/24] riscv: tcg-target: Add the mov and
 movi instruction
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
X-List-Received-Date: Wed, 28 Nov 2018 19:48:31 -0000

On 11/27/18 1:08 PM, Alistair Francis wrote:
> +static void tcg_out_movi(TCGContext *s, TCGType type, TCGReg rd,
> +                         tcg_target_long val)
> +{
> +#if TCG_TARGET_REG_BITS == 64
> +    tcg_target_long lo = sextract64(val, 0, 12);
> +#else
> +    tcg_target_long lo = sextract32(val, 0, 12);
> +#endif

I really think this ifdef should be moved into a helper function.  There are
quite a number of copies of it throughout.

> +    tcg_target_long hi = val - lo;
> +    int shift;
> +    tcg_target_long tmp;
> +
> +    RISCVInsn add32_op = TCG_TARGET_REG_BITS == 64 ? OPC_ADDIW : OPC_ADDI;
> +
> +#if TCG_TARGET_REG_BITS == 64
> +    ptrdiff_t offset = tcg_pcrel_diff(s, (void *)val);
> +#endif
> +
> +    if (TCG_TARGET_REG_BITS == 32 || val == (int32_t)val) {
> +        tcg_out_opc_upper(s, OPC_LUI, rd, hi);
> +        if (lo != 0) {
> +            tcg_out_opc_imm(s, add32_op, rd, rd, lo);
> +        }
> +
> +        return;
> +    }

Your reorg has failed to keep the single insn ADDI(W) case.

> +    /* We can only be here if TCG_TARGET_REG_BITS != 32 */
> +    if (offset == sextract64(offset, 1, 31) << 1) {

The ifdef above won't compile for rv32, because offset is used unconditionally
here.  Remove the ifdef and allow that to be removed as dead code by the compiler.

> +        tcg_out_opc_upper(s, OPC_AUIPC, rd, 0);
> +        tcg_out_opc_imm(s, OPC_ADDI, rd, rd, 0);
> +        reloc_call(s->code_ptr - 2, (tcg_insn_unit *)val);
> +        return;
> +    }
> +
> +    shift = ctz64(val);
> +    tmp = val >> shift;
> +
> +    if (tmp == sextract64(tmp, 0, 12)) {
> +        tcg_out_opc_imm(s, OPC_ADDI, rd, TCG_REG_ZERO, 1);

s/1/tmp/

> +        tcg_out_opc_imm(s, OPC_SLLI, rd, rd, ctz64(val));
> +    } else if (!(val >> 31 == 0 || val >> 31 == -1)) {
> +        shift = ctz64(hi);
> +        hi >>= shift;
> +        tcg_out_movi(s, type, rd, hi);
> +        tcg_out_opc_imm(s, OPC_SLLI, rd, rd, shift);
> +        if (lo != 0) {
> +            tcg_out_opc_imm(s, OPC_ADDI, rd, rd, lo);
> +        }
> +    } else {
> +        if (hi != 0) {
> +            tcg_out_opc_upper(s, OPC_LUI, rd, hi);
> +        }
> +        if (lo != 0) {
> +            tcg_out_opc_imm(s, add32_op, rd, hi == 0 ? TCG_REG_ZERO : rd, lo);
> +        }
> +    }

The final else case is identical with the first if.


r~

