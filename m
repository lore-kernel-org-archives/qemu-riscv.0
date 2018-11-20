Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPFmN-0002nE-Rd
	for mharc-qemu-riscv@gnu.org; Tue, 20 Nov 2018 18:50:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41824)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gPFmL-0002lr-N7
	for qemu-riscv@nongnu.org; Tue, 20 Nov 2018 18:50:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gPFmK-0004OV-LQ
	for qemu-riscv@nongnu.org; Tue, 20 Nov 2018 18:50:01 -0500
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:37878)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gPFmI-0004Ig-5q; Tue, 20 Nov 2018 18:49:58 -0500
Received: by mail-lf1-x144.google.com with SMTP id p17so2638452lfh.4;
	Tue, 20 Nov 2018 15:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0wKPDDfEM8Kc5pclIo50mUtKU9tPvo715Yohr0EfQDw=;
	b=Xb5qJbJBsZD+K2t1UEJBqOjWbaSw+C36c5+CBXG182HY0XmuTHuwA1d9eVPpi/nAuC
	M2169AGhWcnXOy4rSwI2zNh0ay40WdMyJCXLTPMmY6uhEjorZkVd6BUAvqPjr1lBTYcv
	6tQgB1vqyOrVzBkuBDCbjeRkuabvrCvEG3SHWhtZ8d9WU6bUFC67pgCkj3uq/QiTsR1d
	DQZSldYQB7NGUrBKfHoullXS5DI7xyMv6Mp92VGO1ipeoQw1yF9b4lJsx86dLSqkaVOw
	O/8HN1/OMnA4h9NH97+p5gj9TeKalZ320IRCTvWEfjuDH55lJHJMGIYwpkUjFCsK79y9
	go0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0wKPDDfEM8Kc5pclIo50mUtKU9tPvo715Yohr0EfQDw=;
	b=lY1LO/pK9KhvgQ2jW3rtcP15g/tvg/RC/JIJNNPjmzh+Rl2QCnPZnRUZasyASSXRoW
	2a9qgQtzBXn5TpllZlgcr9QekzezS2GWlJxM10AHYcjxuiEj+72nP8Kluzq62aQx2iQk
	eXso/1QyX0k5/SGuoAkV2Hhj1mB/1Ugriu322AZIESJiTxQiJL5Xy6Otow5fGEUgq1uf
	sWs/kHfJPo9hZfy+VBvE7UIkNZpx6x5kDvk+exqgri2jpGgFAnGx9pc2o50ygv4a2gbE
	NH6fHOtQwJrQFfccDC5Il9YCnhu1Opzq+GF2DL8PxPhuFl470UP8bxIlfMe8GdjVUjVa
	qzdQ==
X-Gm-Message-State: AGRZ1gJInQah/xn3q5VaM51827Ea0WXCs0GVxemm6Q/aMPbQofVKDoPp
	EIgOQE2PnM+McMgll7jmFZxjsEhaqItMLeQLXHA=
X-Google-Smtp-Source: AJdET5d9FLk6U/ciu7GnaJ7235WmJDDJNAk8NNx3TM300mzX6UH6JB4acEgI7YXaKtWI77SXD8jrt21smQ17mDofSNg=
X-Received: by 2002:a19:ae03:: with SMTP id f3mr2418726lfc.86.1542757796761;
	Tue, 20 Nov 2018 15:49:56 -0800 (PST)
MIME-Version: 1.0
References: <cover.1542321076.git.alistair.francis@wdc.com>
	<f1a7d2617c26c1745fafe13bbe3bc3b042c14217.1542321076.git.alistair.francis@wdc.com>
	<23831afc-0ebf-5802-e8e2-6ce48dd340f9@linaro.org>
In-Reply-To: <23831afc-0ebf-5802-e8e2-6ce48dd340f9@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 20 Nov 2018 15:49:29 -0800
Message-ID: <CAKmqyKP5cCRZujTm+OvoNZWNwPhJirPLA7PjurbovnN8RYCcgQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::144
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
X-List-Received-Date: Tue, 20 Nov 2018 23:50:02 -0000

On Fri, Nov 16, 2018 at 1:14 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 11/15/18 11:36 PM, Alistair Francis wrote:
> > +static void tcg_out_brcond(TCGContext *s, TCGCond cond, TCGReg arg1,
> > +                           TCGReg arg2, TCGLabel *l)
> > +{
> > +    RISCVInsn op = tcg_brcond_to_riscv[cond].op;
> > +    bool swap = tcg_brcond_to_riscv[cond].swap;
> > +
> > +    tcg_out_opc_branch(s, op, swap ? arg2 : arg1, swap ? arg1 : arg2, 0);
>
> You might want to tcg_debug_assert(op != 0) here.
>
> > +    if (l->has_value) {
> > +        reloc_sbimm12(s->code_ptr - 1, l->u.value_ptr);
>
> I'm concerned about the conditional branch range.  +-4K isn't much to work
> with.  The minimum we have for other hosts is +-32K.
>
> We have two options: (1) greatly reduce the max size of the TB for this host;
> (2) be prepared to emit a 2 insn sequence: conditional branch across
> unconditional branch, with forward branches that turn out to be small patched
> with a nop.
>
> FWIW, the first case would be done via modification of tcg_op_buf_full.  You
> might have to go as low as 500 opcodes, I'm not sure.

How do we do option 2?

>
> > +static inline void tcg_out_goto(TCGContext *s, tcg_insn_unit *target)
> > +{
> > +    ptrdiff_t offset = tcg_pcrel_diff(s, target);
> > +    tcg_debug_assert(offset == sextract64(offset, 0, 26));
> > +    tcg_out_opc_jump(s, OPC_JAL, TCG_REG_ZERO, offset);
> > +}
> > +
> > +static inline void tcg_out_goto_long(TCGContext *s, tcg_insn_unit *target)
> > +{
> > +    ptrdiff_t offset = tcg_pcrel_diff(s, target);
> > +
> > +    if (offset == sextract64(offset, 0, 26)) {
> > +        tcg_out_opc_jump(s, OPC_JAL, TCG_REG_ZERO, offset);
> > +    } else {
> > +        tcg_out_movi(s, TCG_TYPE_I64, TCG_REG_TMP0, (intptr_t)target);
> > +        tcg_out_opc_jump(s, OPC_JAL, TCG_REG_TMP0, 0);
> > +    }
> > +}
>
> How are these to be used?  I guess I'll find out...

It's called on a exit TB op. I'm not sure if that's correct though.

Alistair

>
> > +static void tcg_out_call_int(TCGContext *s, tcg_insn_unit *arg, bool tail)
> > +{
> > +    TCGReg link = tail ? TCG_REG_ZERO : TCG_REG_RA;
> > +    ptrdiff_t offset = tcg_pcrel_diff(s, arg);
> > +    if (offset == sextract32(offset, 1, 20) << 1) {
>
> sextract64.
>
> > +        /* short jump: -2097150 to 2097152 */
> > +        tcg_out_opc_jump(s, OPC_JAL, link, offset);
> > +    } else if (TCG_TARGET_REG_BITS == 32 ||
> > +        offset == sextract32(offset, 1, 31) << 1) {
>
> sextract64.
>
> > +        /* long jump: -2147483646 to 2147483648 */
> > +        tcg_out_opc_upper(s, OPC_AUIPC, TCG_REG_TMP0, 0);
> > +        tcg_out_opc_imm(s, OPC_JALR, link, TCG_REG_TMP0, 0);
> > +        reloc_call(s->code_ptr - 2, arg);
> > +    } else if (TCG_TARGET_REG_BITS == 64) {
> > +        /* far jump: 64-bit */
> > +        tcg_target_long imm = sextract32((tcg_target_long)arg, 0, 12);
> > +        tcg_target_long base = (tcg_target_long)arg - imm;
> > +        tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_TMP0, base);
> > +        tcg_out_opc_imm(s, OPC_JALR, link, TCG_REG_TMP0, imm);
>
>
> r~

