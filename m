Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPGF3-0001R2-KO
	for mharc-qemu-riscv@gnu.org; Tue, 20 Nov 2018 19:19:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58702)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gPGF1-0001QK-8c
	for qemu-riscv@nongnu.org; Tue, 20 Nov 2018 19:19:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gPGE9-0003fU-2V
	for qemu-riscv@nongnu.org; Tue, 20 Nov 2018 19:18:46 -0500
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:43622)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gPGE7-0003Wh-3M; Tue, 20 Nov 2018 19:18:43 -0500
Received: by mail-lf1-x144.google.com with SMTP id u18so2660776lff.10;
	Tue, 20 Nov 2018 16:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=whAAT35/I3EQMgKkh0gL6naUvXf83bapA7Okcu//Z68=;
	b=k64CcNWv5TXQPtJJaVKIM0k4IE0sPJXsOOI84MG6cYl/n0RlNTXik9UkwHD8DJtnLE
	XHbE5D6Jos/3TwysKNiEa5t0y9o3mJPjppFAqdhs+e4nf9ERb2da6KMH/zKYWzMe4qqY
	5pV1UcFyIiiIuPbiBVFL6uu4u1OAOLAwrzt4TJYjKDEG8XLmOrhGOoiyyb5AEQuzf81E
	KZgfZGulhFfWxcKb1WaOcGEipe5I8i/SaF6rjv/p1n6XseOVGx5Hg4ZV8Qf7LJSN8fND
	6iHUoiO5bQqcZhzsRz6PpxcQ+v7xcv+oEXjDc0iuxyDm9SW3zVkiV9huJsbaEBi/yUk8
	q1kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=whAAT35/I3EQMgKkh0gL6naUvXf83bapA7Okcu//Z68=;
	b=h5+X0Pcjs2BKfFVoU4AsZ96UVW9z8Cafsgez1Fz6rbJsSPFxrUCmZyG4GagpHEqkqV
	1e6K8WUtH2Wwg25gvEo7EteKcKGQZ/wiHTdIc+3xfAkYmv3Zwi9OPHCT/Ovi5UH9WNE7
	wOBsXR1PKon8fCoJ0vINov23GpZwBemvDV2KCGylTz/7/6mw357+/NjtVGHATq5NNO7+
	GiEkvTTFwD3rJuVU+zBeHFsBCpJafIRoLyjyZ3rHN2GhtcJVeJqQiDnTdJIJ6UTLWQsG
	iQqqkdVI2TQluh8HGWM0duKkM6rpVtp92Mmh75DoSKOjaPFgAOxMdIuLuX9qVxqwMDkQ
	BTKw==
X-Gm-Message-State: AGRZ1gJrPyrxnNXDxTfjGyd10pdEZ4b0fwphzLre+kU6UHyFPymwIOc1
	Dye+ZFykwy5txioMKZXisrya0HsaPzH43wQQWpU=
X-Google-Smtp-Source: AJdET5fJrZYU0fKiXAHdnIdJMTThFgbtgIEcqN0R9hDo+fXqG/B93xqsfofBKMyS1GrqZqBKpZSkcw9ovIyWRrcGn9I=
X-Received: by 2002:a19:5059:: with SMTP id z25mr2271080lfj.120.1542759519147; 
	Tue, 20 Nov 2018 16:18:39 -0800 (PST)
MIME-Version: 1.0
References: <cover.1542321076.git.alistair.francis@wdc.com>
	<bd8f5c781f7086c5b26e1bd4c8e6570b5534b22d.1542321076.git.alistair.francis@wdc.com>
	<f56a1b1c-8cc8-7e85-c88b-3894e4628d6b@linaro.org>
In-Reply-To: <f56a1b1c-8cc8-7e85-c88b-3894e4628d6b@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 20 Nov 2018 16:18:12 -0800
Message-ID: <CAKmqyKMJm-hcBLeP5-hWW-0Sru8ggFVWFZRCiHhZ4romx-ej4g@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::144
Subject: Re: [Qemu-riscv] [Qemu-devel] [RFC v1 16/23] riscv: tcg-target: Add
 slowpath load and store instructions
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
X-List-Received-Date: Wed, 21 Nov 2018 00:19:40 -0000

On Fri, Nov 16, 2018 at 1:24 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 11/15/18 11:36 PM, Alistair Francis wrote:
> > +static void tcg_out_mb(TCGContext *s, TCGArg a0)
> > +{
> > +    static const RISCVInsn fence[] = {
> > +        [0 ... TCG_MO_ALL] = OPC_FENCE_RW_RW,
> > +        [TCG_MO_LD_LD]     = OPC_FENCE_R_R,
> > +        [TCG_MO_ST_LD]     = OPC_FENCE_W_R,
> > +        [TCG_MO_LD_ST]     = OPC_FENCE_R_W,
> > +        [TCG_MO_ST_ST]     = OPC_FENCE_W_W,
> > +        [TCG_BAR_LDAQ]     = OPC_FENCE_R_RW,
> > +        [TCG_BAR_STRL]     = OPC_FENCE_RW_W,
> > +        [TCG_BAR_SC]       = OPC_FENCE_RW_RW,
> > +    };
> > +    tcg_out32(s, fence[a0 & TCG_MO_ALL]);
> > +}
> > +
>
> TCG_MO_* and TCG_BAR_* are two different bitmasks, or'ed together.
> Which you've separated by "& TCG_MO_ALL".  Thus the TCG_BAR_* constants should
> not appear in this table.
>
>
> > +static void * const qemu_ld_helpers[16] = {
> > +    [MO_UB]   = helper_ret_ldub_mmu,
> > +    [MO_SB]   = helper_ret_ldsb_mmu,
> > +    [MO_LEUW] = helper_le_lduw_mmu,
> > +    [MO_LESW] = helper_le_ldsw_mmu,
> > +    [MO_LEUL] = helper_le_ldul_mmu,
> > +    [MO_LESL] = helper_le_ldsl_mmu,
> > +    [MO_LEQ]  = helper_le_ldq_mmu,
> > +    [MO_BEUW] = helper_be_lduw_mmu,
> > +    [MO_BESW] = helper_be_ldsw_mmu,
> > +    [MO_BEUL] = helper_be_ldul_mmu,
> > +    [MO_BESL] = helper_be_ldsl_mmu,
> > +    [MO_BEQ]  = helper_be_ldq_mmu,
> > +};
>
> The LESL and BESL functions will not be present for rv32 -> link error.  Here
> you do need an ifdef.
>
> > +        } else {
> > +            adj = cmp_off - sextract32(cmp_off, 0, 12);
> > +            tcg_debug_assert(add_off - adj >= -0x1000
> > +                             && add_off - adj < 0x1000);
> > +
> > +            tcg_out_opc_upper(s, OPC_LUI, base, adj);
> > +            tcg_out_opc_reg(s, OPC_ADD, base, TCG_REG_ZERO, TCG_AREG0);
>
> base, base, TCG_AREG0.
>
> > +    /* Compare masked address with the TLB entry. */
> > +    label_ptr[0] = s->code_ptr;
> > +    tcg_out_opc_branch(s, OPC_BNE, TCG_REG_TMP0, TCG_REG_TMP1, 0);
>
> Another case of a potential out-of-range branch.
>
> It might be worthwhile to move all of this out-of-line from the start, where
> that branch will always be short.  See
>
> http://lists.nongnu.org/archive/html/qemu-devel/2018-11/msg02234.html

That does look cool, but it's not in the tree yet.

Otherwise can we directly just call tcg_out_brcond()?

PS: Thanks for your review. I have gone through most of your comments.
I now don't see any segfaults when running. My guest still doesn't
boot, but it's getting further then it used to :)

Alistair

>
>
> r~

