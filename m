Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h4qj8-0000jy-VP
	for mharc-qemu-riscv@gnu.org; Fri, 15 Mar 2019 13:34:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51875)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1h4qj5-0000hj-VF
	for qemu-riscv@nongnu.org; Fri, 15 Mar 2019 13:34:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1h4qj4-0003oZ-Nh
	for qemu-riscv@nongnu.org; Fri, 15 Mar 2019 13:34:35 -0400
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130]:45171)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1h4qj4-0003mW-9H; Fri, 15 Mar 2019 13:34:34 -0400
Received: by mail-lf1-x130.google.com with SMTP id f16so7405209lfk.12;
	Fri, 15 Mar 2019 10:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=u0SntflN8mPyW8/akYF7zgj8eVA8k10Et5Bx0qlL+Oo=;
	b=cTi4sLWb4cavqzfdEipJ/BLqrwADfCToZ89etcyPcA+IMz8sD0HsELMkxnfjR7ZhjI
	I2H8wwryKbVJBOaLt3B+tjbO8AimuUebB7YyppR139BXyWic0NP297lm3wOxSGy+iA8h
	EIVMZliDbiLlLJ0rnF1q6o9bNoeMxfBFae7ETwBhXjz3U6R9fTaH2jFqZuU8krG2xCzl
	vDiyieQ6OHBho93zgqJWfkxEd4vrWhjEJx3iIcO0IXzwBE3clUayqXVJK6TBCziqmYdK
	FiZW4YiUgdT4bI1/FUyjAU1gnYO3doaecrzBuBdCH2GTBvcAjD65Aq/aTA2fiVsaBwor
	EP9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=u0SntflN8mPyW8/akYF7zgj8eVA8k10Et5Bx0qlL+Oo=;
	b=T6j0pJUY5BcQjT/Flak7QnQ2lRkfDc5hdgY1TUmXYWy/w8CafK3QsrjR+JWlGH+wlk
	0mCBE/Bk+VULwE69xj3IByK4/Bg6qIJ8/znvSTcYJyrn0ZWMXCp9gUdFrXqZ1QZ+d+wx
	PWt21hVXZiN7qDi8OqCgIWEwyPweIf8EP8THSWwyxV6HcJ80G67ptmvWJwhwtbmGFN+V
	lLW40X4BjnEFkvQMDPI5ETRIKgTb4M0j4vrCvDFIlCyFVhgNOSjF9Hol+j0f3ytvg/SA
	QRmMaFT4yFdbKQ4A80JAaqMm9s8mKv7zVnlS8RVwZbVYCyDdcqjgaVHdghIIxFYU8npO
	oyFw==
X-Gm-Message-State: APjAAAW7ZzGGgErJf1lVYLalxnihzGedZA33pS3Yzk8JHjjJqMPr5atm
	2bLBF+ZrYRKDllEaJkezWQGoxzsjT2XbInrUHYU=
X-Google-Smtp-Source: APXvYqzjHXGL632Bjy6X9lJRm8FoEHNPOp17pgbXWnSTu9sqqo78py/VBuaZ1s5WejVdkEKfd/WzsEGLF1XKLlwdfVY=
X-Received: by 2002:a19:40cc:: with SMTP id n195mr2968561lfa.150.1552671270438;
	Fri, 15 Mar 2019 10:34:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190315135140.10507-1-kbastian@mail.uni-paderborn.de>
In-Reply-To: <20190315135140.10507-1-kbastian@mail.uni-paderborn.de>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 15 Mar 2019 10:33:19 -0700
Message-ID: <CAKmqyKPdeCiFpr4hpj7cgoA4+rRHSwOsvbu8xbnU0w1KahrcbA@mail.gmail.com>
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>, 
	Palmer Dabbelt <palmer@sifive.com>,
	"open list:RISC-V" <qemu-riscv@nongnu.org>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::130
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] target/riscv: Fix manually
 parsed 16 bit insn
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
X-List-Received-Date: Fri, 15 Mar 2019 17:34:37 -0000

On Fri, Mar 15, 2019 at 7:15 AM Bastian Koppelmann
<kbastian@mail.uni-paderborn.de> wrote:
>
> during the refactor to decodetree we removed the manual decoding that is
> necessary for c.jal/c.addiw and removed the translation of c.flw/c.ld
> and c.fsw/c.sd. This reintroduces the manual parsing and the
> omited implementation.
>
> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Tested-by: Alistair Francis <alistair.francis@wdc.com>

This fixes the 32-bit failures I was seeing.

Alistair

> ---
>  target/riscv/insn_trans/trans_rvc.inc.c | 30 ++++++++++++++++++++-----
>  1 file changed, 25 insertions(+), 5 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvc.inc.c b/target/riscv/insn_trans/trans_rvc.inc.c
> index bcdf64d3b7..5819f53f90 100644
> --- a/target/riscv/insn_trans/trans_rvc.inc.c
> +++ b/target/riscv/insn_trans/trans_rvc.inc.c
> @@ -44,10 +44,19 @@ static bool trans_c_flw_ld(DisasContext *ctx, arg_c_flw_ld *a)
>  {
>  #ifdef TARGET_RISCV32
>      /* C.FLW ( RV32FC-only ) */
> -    return false;
> +    REQUIRE_FPU;
> +    REQUIRE_EXT(ctx, RVF);
> +
> +    arg_c_lw tmp;
> +    decode_insn16_extract_cl_w(&tmp, ctx->opcode);
> +    arg_flw arg = { .rd = tmp.rd, .rs1 = tmp.rs1, .imm = tmp.uimm };
> +    return trans_flw(ctx, &arg);
>  #else
>      /* C.LD ( RV64C/RV128C-only ) */
> -    return false;
> +    arg_c_fld tmp;
> +    decode_insn16_extract_cl_d(&tmp, ctx->opcode);
> +    arg_ld arg = { .rd = tmp.rd, .rs1 = tmp.rs1, .imm = tmp.uimm };
> +    return trans_ld(ctx, &arg);
>  #endif
>  }
>
> @@ -67,10 +76,19 @@ static bool trans_c_fsw_sd(DisasContext *ctx, arg_c_fsw_sd *a)
>  {
>  #ifdef TARGET_RISCV32
>      /* C.FSW ( RV32FC-only ) */
> -    return false;
> +    REQUIRE_FPU;
> +    REQUIRE_EXT(ctx, RVF);
> +
> +    arg_c_sw tmp;
> +    decode_insn16_extract_cs_w(&tmp, ctx->opcode);
> +    arg_fsw arg = { .rs1 = tmp.rs1, .rs2 = tmp.rs2, .imm = tmp.uimm };
> +    return trans_fsw(ctx, &arg);
>  #else
>      /* C.SD ( RV64C/RV128C-only ) */
> -    return false;
> +    arg_c_fsd tmp;
> +    decode_insn16_extract_cs_d(&tmp, ctx->opcode);
> +    arg_sd arg = { .rs1 = tmp.rs1, .rs2 = tmp.rs2, .imm = tmp.uimm };
> +    return trans_sd(ctx, &arg);
>  #endif
>  }
>
> @@ -88,7 +106,9 @@ static bool trans_c_jal_addiw(DisasContext *ctx, arg_c_jal_addiw *a)
>  {
>  #ifdef TARGET_RISCV32
>      /* C.JAL */
> -    arg_jal arg = { .rd = 1, .imm = a->imm };
> +    arg_c_j tmp;
> +    decode_insn16_extract_cj(&tmp, ctx->opcode);
> +    arg_jal arg = { .rd = 1, .imm = tmp.imm };
>      return trans_jal(ctx, &arg);
>  #else
>      /* C.ADDIW */
> --
> 2.21.0
>
>

