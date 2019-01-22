Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gm5lx-0007nk-63
	for mharc-qemu-riscv@gnu.org; Tue, 22 Jan 2019 18:48:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35541)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gm5lt-0007jm-6w
	for qemu-riscv@nongnu.org; Tue, 22 Jan 2019 18:48:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gm5cs-0003OJ-Ao
	for qemu-riscv@nongnu.org; Tue, 22 Jan 2019 18:38:39 -0500
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:45464)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gm5cq-0003A2-C9; Tue, 22 Jan 2019 18:38:38 -0500
Received: by mail-lf1-x142.google.com with SMTP id b20so199464lfa.12;
	Tue, 22 Jan 2019 15:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OFROHUa+ovk85hF9092kzBgRxSvKcvLF2gkrIvfTuWs=;
	b=d4u4/Pbw1cYO/wMc/KIJbQT5QWetsEvaR8oF94g7B52nrC+3OeyvN1f4GwqTUDHjcr
	olaZK+WdSxJDEnOseBEfAZErwtcBaY0zEzOZC32emYU56WnZwO5AYfwTtTgmA7PwMK0f
	hCSettPSkwkbhM+uy/8YBh/mt+Ae0UMwDyO04aAdzreh+3DNjCqQxTfDbudpv8xZx2rk
	lcKeswEcrO4qq0oxOlgBgHJ7L0Byzr/k168H9PN5DBd21X/rdVd+qsZnHRhAVi985yw1
	fZfy7jNJq/jQXPmvWwXA63yvnkD7adxxkJXnLkCVvrbYVYVBvBzVF70UUOJ3SCYHnK7/
	71JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OFROHUa+ovk85hF9092kzBgRxSvKcvLF2gkrIvfTuWs=;
	b=gUE0hJGEpN/sUgZD4RCe5mBZvAcguri08Zw3qkrkiJPPpbjEFgp7iT/JhO4rqr6CRO
	JwaefxR11/+PeW26E8G+Q/pXGZdl3P8ME5m6158gznJ7Q4vjpTSYpANXnYRAiRzGIpQM
	mVsfrnkrDvxV69+xv+9slj9EnwVSEj1SHpH243tU9JftMtNqvljaXAx47VAlivnx4hhH
	EfRhYoakoVEUZuGgwDbtfqIsbE9tfi1E5MXQO3XnueMfCJD+XfeVTfHFVcie3PHt45U5
	mDOYry1FYKjMPBCpvzM5zpE/boYgry7J9JRzlAPqFCqhmUAuY02qGlekqL9vZjanUv7a
	fmKA==
X-Gm-Message-State: AJcUukcGSHEw1WOQ+guweng1brc7Sf3iGCrBAjq4ZsFepWup4OKAUJLT
	SYUJ1Int5K8WDNjvzu/yGuExvvCELZTfEHRSyeo=
X-Google-Smtp-Source: ALg8bN74WNo6hTQQClb2iwmg9yVYC/AAZW9iaU1cql+8Td/khziWVqwq97yklROLiVXCcZ3tmGX6IaU0m5vMCI4v8Uo=
X-Received: by 2002:a19:c954:: with SMTP id z81mr21449438lff.150.1548200309335;
	Tue, 22 Jan 2019 15:38:29 -0800 (PST)
MIME-Version: 1.0
References: <20190122092909.5341-1-kbastian@mail.uni-paderborn.de>
	<20190122092909.5341-5-kbastian@mail.uni-paderborn.de>
In-Reply-To: <20190122092909.5341-5-kbastian@mail.uni-paderborn.de>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 22 Jan 2019 15:38:02 -0800
Message-ID: <CAKmqyKOL02Fw64BU7QX0VBxYxrHpHcEr_ZzHYDGGzsRwPdb_0Q@mail.gmail.com>
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@sifive.com>, qemu-riscv@nongnu.org, 
	peer.adelt@hni.uni-paderborn.de, 
	Richard Henderson <richard.henderson@linaro.org>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::142
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v5 04/35] target/riscv:
 Convert RV32I load/store insns to decodetree
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
X-List-Received-Date: Tue, 22 Jan 2019 23:48:00 -0000

On Tue, Jan 22, 2019 at 2:07 AM Bastian Koppelmann
<kbastian@mail.uni-paderborn.de> wrote:
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn32.decode              | 10 ++++++
>  target/riscv/insn_trans/trans_rvi.inc.c | 48 +++++++++++++++++++++++++
>  2 files changed, 58 insertions(+)
>
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 81f56c16b4..076de873c4 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -23,6 +23,7 @@
>
>  # immediates:
>  %imm_i    20:s12
> +%imm_s    25:s7 7:5
>  %imm_b    31:s1 7:1 25:6 8:4     !function=ex_shift_1
>  %imm_j    31:s1 12:8 20:1 21:10  !function=ex_shift_1
>  %imm_u    12:s20                 !function=ex_shift_12
> @@ -33,6 +34,7 @@
>  # Formats 32:
>  @i       ............    ..... ... ..... .......         imm=%imm_i     %rs1 %rd
>  @b       .......   ..... ..... ... ..... ....... &b      imm=%imm_b %rs2 %rs1
> +@s       .......   ..... ..... ... ..... .......         imm=%imm_s %rs2 %rs1
>  @u       ....................      ..... .......         imm=%imm_u          %rd
>  @j       ....................      ..... .......         imm=%imm_j          %rd
>
> @@ -47,3 +49,11 @@ blt      ....... .....    ..... 100 ..... 1100011 @b
>  bge      ....... .....    ..... 101 ..... 1100011 @b
>  bltu     ....... .....    ..... 110 ..... 1100011 @b
>  bgeu     ....... .....    ..... 111 ..... 1100011 @b
> +lb       ............     ..... 000 ..... 0000011 @i
> +lh       ............     ..... 001 ..... 0000011 @i
> +lw       ............     ..... 010 ..... 0000011 @i
> +lbu      ............     ..... 100 ..... 0000011 @i
> +lhu      ............     ..... 101 ..... 0000011 @i
> +sb       .......  .....   ..... 000 ..... 0100011 @s
> +sh       .......  .....   ..... 001 ..... 0100011 @s
> +sw       .......  .....   ..... 010 ..... 0100011 @s
> diff --git a/target/riscv/insn_trans/trans_rvi.inc.c b/target/riscv/insn_trans/trans_rvi.inc.c
> index 0347461ee6..f3b88ebb69 100644
> --- a/target/riscv/insn_trans/trans_rvi.inc.c
> +++ b/target/riscv/insn_trans/trans_rvi.inc.c
> @@ -82,3 +82,51 @@ static bool trans_bgeu(DisasContext *ctx, arg_bgeu *a)
>      gen_branch(ctx->env, ctx, OPC_RISC_BGEU, a->rs1, a->rs2, a->imm);
>      return true;
>  }
> +
> +static bool trans_lb(DisasContext *ctx, arg_lb *a)
> +{
> +    gen_load(ctx, OPC_RISC_LB, a->rd, a->rs1, a->imm);
> +    return true;
> +}
> +
> +static bool trans_lh(DisasContext *ctx, arg_lh *a)
> +{
> +    gen_load(ctx, OPC_RISC_LH, a->rd, a->rs1, a->imm);
> +    return true;
> +}
> +
> +static bool trans_lw(DisasContext *ctx, arg_lw *a)
> +{
> +    gen_load(ctx, OPC_RISC_LW, a->rd, a->rs1, a->imm);
> +    return true;
> +}
> +
> +static bool trans_lbu(DisasContext *ctx, arg_lbu *a)
> +{
> +    gen_load(ctx, OPC_RISC_LBU, a->rd, a->rs1, a->imm);
> +    return true;
> +}
> +
> +static bool trans_lhu(DisasContext *ctx, arg_lhu *a)
> +{
> +    gen_load(ctx, OPC_RISC_LHU, a->rd, a->rs1, a->imm);
> +    return true;
> +}
> +
> +static bool trans_sb(DisasContext *ctx, arg_sb *a)
> +{
> +    gen_store(ctx, OPC_RISC_SB, a->rs1, a->rs2, a->imm);
> +    return true;
> +}
> +
> +static bool trans_sh(DisasContext *ctx, arg_sh *a)
> +{
> +    gen_store(ctx, OPC_RISC_SH, a->rs1, a->rs2, a->imm);
> +    return true;
> +}
> +
> +static bool trans_sw(DisasContext *ctx, arg_sw *a)
> +{
> +    gen_store(ctx, OPC_RISC_SW, a->rs1, a->rs2, a->imm);
> +    return true;
> +}
> --
> 2.20.1
>
>

