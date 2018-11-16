Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNZus-0006Eg-Gk
	for mharc-qemu-riscv@gnu.org; Fri, 16 Nov 2018 03:55:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50927)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gNZuq-0006EL-QX
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 03:55:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gNZuo-0004ku-17
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 03:55:52 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:39292)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gNZum-0004eb-0O
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 03:55:49 -0500
Received: by mail-wm1-x343.google.com with SMTP id u13-v6so20383240wmc.4
	for <qemu-riscv@nongnu.org>; Fri, 16 Nov 2018 00:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=7wzXtM3JxniMkMzpcNBaQHoXRrpaKsOIGujBW+cyFQ8=;
	b=K9BYWY0IRjLVnOrZL6FrU420E40IRV62yz04QO5qFmHMPQcawo9zeDOFHJgaiKxp3L
	mrBYRLQJvFYqCbO99d5B0g4cOC6dL9X8yLDe/LiOUiXBSXiauIo9rHcTb6ZpbpO9HXlb
	T3NSPeSKCERt+1sePfPzL5G1qwWuEVtYkw4FA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=7wzXtM3JxniMkMzpcNBaQHoXRrpaKsOIGujBW+cyFQ8=;
	b=ttb9zkrnHaW+4Cfa1Geic88GHun/a9tNFP6QnB1qMWd2Pl42CSN91/KRmCn779/OVo
	KJC9pRl9l3iqFs3EmdW9Z3FDmJBtQdee0QT38rZ0ErnAdJ0haTYOfsAoh2TPnrGEYMTn
	l29lipc1rWLR1mvKEzLPAHxP0hu8CqkNIh7KpE39uumFQP0SJL5iitN5bo28NPOclnKJ
	hntYBEV9Zh0b9jzw4ys4km+LQyjVv3obnyKDPZ6fhT5qOybwj20o2DTGks2c/go/0NAs
	deefuuznnuU8Q3TbNSl+yKLFhvQks/b+ojXt8QUrgyIpmveffia3ibnOxKj61vZO7xV+
	D8RA==
X-Gm-Message-State: AGRZ1gKRqlQYejNYDmpYRqJ2UHZ6J7bh/PpjwRHW1D74ONf+TQBd9JcS
	E5UGDPdqHu37o6+qGp2Dnx5QMA==
X-Google-Smtp-Source: AJdET5cKpVGWGlysd4czMTlvlX8MB/ppnNgw/EVdg6Rm9CM3iDmLRXqZmnptGNRHqNh74lzScdngzA==
X-Received: by 2002:a1c:8a11:: with SMTP id
	m17-v6mr1770658wmd.15.1542358545637; 
	Fri, 16 Nov 2018 00:55:45 -0800 (PST)
Received: from cloudburst.twiddle.net
	(74.red-37-10-255.dynamicip.rima-tde.net. [37.10.255.74])
	by smtp.gmail.com with ESMTPSA id t5sm3154252wmd.15.2018.11.16.00.55.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Nov 2018 00:55:45 -0800 (PST)
To: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Cc: "alistair23@gmail.com" <alistair23@gmail.com>
References: <cover.1542321076.git.alistair.francis@wdc.com>
	<51aa21df48c5d80484bf396b82d9e3943daf1e0c.1542321076.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <a9f58e8f-0cba-57fa-59ed-415b58ae2f2c@linaro.org>
Date: Fri, 16 Nov 2018 09:55:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <51aa21df48c5d80484bf396b82d9e3943daf1e0c.1542321076.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: Re: [Qemu-riscv] [Qemu-devel] [RFC v1 12/23] riscv: tcg-target: Add
 the mov and movi instruction
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
X-List-Received-Date: Fri, 16 Nov 2018 08:55:53 -0000

On 11/15/18 11:35 PM, Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Michael Clark <mjc@sifive.com>
> ---
>  tcg/riscv/tcg-target.inc.c | 62 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
> 
> diff --git a/tcg/riscv/tcg-target.inc.c b/tcg/riscv/tcg-target.inc.c
> index 475feca906..0e891e24c9 100644
> --- a/tcg/riscv/tcg-target.inc.c
> +++ b/tcg/riscv/tcg-target.inc.c
> @@ -422,6 +422,68 @@ static void patch_reloc(tcg_insn_unit *code_ptr, int type,
>      }
>  }
>  
> +/*
> + * TCG intrinsics
> + */
> +
> +static void tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
> +{
> +    if (ret == arg) {
> +        return;
> +    }
> +    switch (type) {
> +    case TCG_TYPE_I32:
> +    case TCG_TYPE_I64:
> +        tcg_out_opc_imm(s, OPC_ADDI, ret, arg, 0);
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +}
> +
> +static void tcg_out_movi(TCGContext *s, TCGType type, TCGReg rd,
> +                         tcg_target_long val)
> +{
> +    tcg_target_long lo = sextract32(val, 0, 12);

sextract64, otherwise you'll make wrong decisions for rv64.
(Although it might be worthwhile to add a local alias so that rv32 doesn't do
more work than necessary.)

> +    tcg_target_long hi = val - lo;
> +
> +    RISCVInsn add32_op = TCG_TARGET_REG_BITS == 64 ? OPC_ADDIW : OPC_ADDI;
> +
> +#if TCG_TARGET_REG_BITS == 64
> +    ptrdiff_t offset = tcg_pcrel_diff(s, (void *)val);
> +#endif
> +
> +    if (val == lo) {
> +        tcg_out_opc_imm(s, OPC_ADDI, rd, TCG_REG_ZERO, val);
           return;
       }

Should match

    if (TCG_TARGET_REG_BITS == 32 || val == (int32_t)val) {
        tcg_out_opc_upper(s, OPC_LUI, rd, hi);
        if (lo != 0) {
            tcg_out_opc_imm(s, add32_op, rd, rd, lo);
        }
        return;
    }

here.

(1) Almost all values requested are 32-bit constants, so check the most common
cases first.  (2) You know hi != 0 because you just eliminated val == lo.  (3)
This handles the cases where LUI alone can load the constant, e.g. 0x1000,
which would otherwise have been matched by your power-of-two test.


> +    } else if (val && !(val & (val - 1))) {
> +        /* power of 2 */
> +        tcg_out_opc_imm(s, OPC_ADDI, rd, TCG_REG_ZERO, 1);
> +        tcg_out_opc_imm(s, OPC_SLLI, rd, rd, ctz64(val));

There's no reason to restrict this to powers of 2 and a shift of the constant 1:

    shift = ctz64(val);
    tmp = val >> shift;
    if (tmp == sextract64(tmp, 0, 12))

> +    } else if (TCG_TARGET_REG_BITS == 64 &&
> +               !(val >> 31 == 0 || val >> 31 == -1)) {
> +        int shift = 12 + ctz64(hi >> 12);

This is just ctz64(hi), since you've already cleared the lo 12 bits.

> +        hi >>= shift;
> +        tcg_out_movi(s, type, rd, hi);
> +        tcg_out_opc_imm(s, OPC_SLLI, rd, rd, shift);
> +        if (lo != 0) {
> +            tcg_out_opc_imm(s, OPC_ADDI, rd, rd, lo);
> +        }
> +#if TCG_TARGET_REG_BITS == 64
> +    } else if (offset == sextract32(offset, 1, 31) << 1) {

sextract64.

> +        tcg_out_opc_upper(s, OPC_AUIPC, rd, 0);
> +        tcg_out_opc_imm(s, OPC_ADDI, rd, rd, 0);
> +        reloc_call(s->code_ptr - 2, (tcg_insn_unit *)val);
> +#endif

Move this pc-rel case above the fully general case and then you can make the
fully general case unconditional.  Also, that preserves an invariant of
increasing order of complexity of the cases.  No need for the ifdef, since this
code should be removed as dead for rv32 (which saw the lui+addi case as
unconditional).


r~

