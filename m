Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNaDA-0003VB-Ta
	for mharc-qemu-riscv@gnu.org; Fri, 16 Nov 2018 04:14:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56132)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gNaD8-0003Up-0M
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 04:14:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gNaCx-0004YT-2m
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 04:14:40 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:33724)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gNaCw-0004XY-CN
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 04:14:34 -0500
Received: by mail-wr1-x443.google.com with SMTP id u9-v6so24073626wrr.0
	for <qemu-riscv@nongnu.org>; Fri, 16 Nov 2018 01:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=/bl6g5ND0Jue7Zq1ZDnvreCby1Tn/56BsFrd+ZezYHE=;
	b=ae4EXgo8LvkL+8jC9rLco9QAxKt9MC/skpx2I427ZRbShjoLCondSbhJxRiFKzk7eN
	Ro94tuddxNhxlPcui8VNMLyXz11XxEJhLmcwx2wxoLzmyntUAaX348S4+QLJJKRXyk1l
	7VNbtLKOVoVwyeW8VZPWjCrxUVHOQ7e9VRNxw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=/bl6g5ND0Jue7Zq1ZDnvreCby1Tn/56BsFrd+ZezYHE=;
	b=EZNLxGsv+02ULpkl+cEUyk2Km3OYW9i4WWiuklVscUzdHw6IcN2eHacSMExvopUL0L
	iIC0G5wi8nUPPum7ZhHM7WGy4JZfhc5dyrImdJIWQZAUaKbyNdfP/7xXmhZGDEi94pat
	fh4g93cNHC2oGWxk2N5mAS7TiVLeBiqhDZVi2aMsz/soooBZ7lENOlxHnv5zJM4miOJx
	u53qrjEKIqmkScW+8BVi956vVldW/seRVg8zuHaKAwueN/Y13Tx2xrXD/TvH3XdblnKB
	VXC0bD4rTRD9Y5GTR7K5zihDZz0h7OiyFor259NEXiOWRH/UEu5+Ja892aI4xoNcZfHj
	3JnQ==
X-Gm-Message-State: AA+aEWZcVYK8dgNKtcQ0NgUWyUOJFlzrP44YEJt+vsxmeGIkwicivtg8
	ng0nTBkkBnlWi0+yAmmaKN1+UQ==
X-Google-Smtp-Source: AFSGD/Xt8t+0yNTf1Xs3GVH10twm1KwpmjMwlxv0n6oEdHnmEEGHnxBjph5cRZHkH/DAoZFmzV5ABA==
X-Received: by 2002:adf:e951:: with SMTP id
	m17-v6mr1370481wrn.126.1542359671865; 
	Fri, 16 Nov 2018 01:14:31 -0800 (PST)
Received: from cloudburst.twiddle.net
	(74.red-37-10-255.dynamicip.rima-tde.net. [37.10.255.74])
	by smtp.gmail.com with ESMTPSA id
	j199sm2354611wmf.13.2018.11.16.01.14.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Nov 2018 01:14:31 -0800 (PST)
To: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Cc: "alistair23@gmail.com" <alistair23@gmail.com>
References: <cover.1542321076.git.alistair.francis@wdc.com>
	<f1a7d2617c26c1745fafe13bbe3bc3b042c14217.1542321076.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <23831afc-0ebf-5802-e8e2-6ce48dd340f9@linaro.org>
Date: Fri, 16 Nov 2018 10:14:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <f1a7d2617c26c1745fafe13bbe3bc3b042c14217.1542321076.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::443
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
X-List-Received-Date: Fri, 16 Nov 2018 09:14:47 -0000

On 11/15/18 11:36 PM, Alistair Francis wrote:
> +static void tcg_out_brcond(TCGContext *s, TCGCond cond, TCGReg arg1,
> +                           TCGReg arg2, TCGLabel *l)
> +{
> +    RISCVInsn op = tcg_brcond_to_riscv[cond].op;
> +    bool swap = tcg_brcond_to_riscv[cond].swap;
> +
> +    tcg_out_opc_branch(s, op, swap ? arg2 : arg1, swap ? arg1 : arg2, 0);

You might want to tcg_debug_assert(op != 0) here.

> +    if (l->has_value) {
> +        reloc_sbimm12(s->code_ptr - 1, l->u.value_ptr);

I'm concerned about the conditional branch range.  +-4K isn't much to work
with.  The minimum we have for other hosts is +-32K.

We have two options: (1) greatly reduce the max size of the TB for this host;
(2) be prepared to emit a 2 insn sequence: conditional branch across
unconditional branch, with forward branches that turn out to be small patched
with a nop.

FWIW, the first case would be done via modification of tcg_op_buf_full.  You
might have to go as low as 500 opcodes, I'm not sure.

> +static inline void tcg_out_goto(TCGContext *s, tcg_insn_unit *target)
> +{
> +    ptrdiff_t offset = tcg_pcrel_diff(s, target);
> +    tcg_debug_assert(offset == sextract64(offset, 0, 26));
> +    tcg_out_opc_jump(s, OPC_JAL, TCG_REG_ZERO, offset);
> +}
> +
> +static inline void tcg_out_goto_long(TCGContext *s, tcg_insn_unit *target)
> +{
> +    ptrdiff_t offset = tcg_pcrel_diff(s, target);
> +
> +    if (offset == sextract64(offset, 0, 26)) {
> +        tcg_out_opc_jump(s, OPC_JAL, TCG_REG_ZERO, offset);
> +    } else {
> +        tcg_out_movi(s, TCG_TYPE_I64, TCG_REG_TMP0, (intptr_t)target);
> +        tcg_out_opc_jump(s, OPC_JAL, TCG_REG_TMP0, 0);
> +    }
> +}

How are these to be used?  I guess I'll find out...

> +static void tcg_out_call_int(TCGContext *s, tcg_insn_unit *arg, bool tail)
> +{
> +    TCGReg link = tail ? TCG_REG_ZERO : TCG_REG_RA;
> +    ptrdiff_t offset = tcg_pcrel_diff(s, arg);
> +    if (offset == sextract32(offset, 1, 20) << 1) {

sextract64.

> +        /* short jump: -2097150 to 2097152 */
> +        tcg_out_opc_jump(s, OPC_JAL, link, offset);
> +    } else if (TCG_TARGET_REG_BITS == 32 ||
> +        offset == sextract32(offset, 1, 31) << 1) {

sextract64.

> +        /* long jump: -2147483646 to 2147483648 */
> +        tcg_out_opc_upper(s, OPC_AUIPC, TCG_REG_TMP0, 0);
> +        tcg_out_opc_imm(s, OPC_JALR, link, TCG_REG_TMP0, 0);
> +        reloc_call(s->code_ptr - 2, arg);
> +    } else if (TCG_TARGET_REG_BITS == 64) {
> +        /* far jump: 64-bit */
> +        tcg_target_long imm = sextract32((tcg_target_long)arg, 0, 12);
> +        tcg_target_long base = (tcg_target_long)arg - imm;
> +        tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_TMP0, base);
> +        tcg_out_opc_imm(s, OPC_JALR, link, TCG_REG_TMP0, imm);


r~

