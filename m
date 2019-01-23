Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gm669-0005ef-2L
	for mharc-qemu-riscv@gnu.org; Tue, 22 Jan 2019 19:08:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40687)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gm666-0005eL-Dg
	for qemu-riscv@nongnu.org; Tue, 22 Jan 2019 19:08:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gm664-00019I-C6
	for qemu-riscv@nongnu.org; Tue, 22 Jan 2019 19:08:49 -0500
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:38911)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gm664-0000xR-0B; Tue, 22 Jan 2019 19:08:48 -0500
Received: by mail-lj1-x244.google.com with SMTP id c19-v6so320662lja.5;
	Tue, 22 Jan 2019 16:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=r9Hb4MfZ9kNF9RPq39wodhau3Ahj/jqQU4dAtRvgQj4=;
	b=o/JY30k89YKb+9rH7PtMdQkqoxjxg7KZXDVA2ePVrz5n4Ow3R+PniqO314hO9v/s6F
	+94VVPiRi503gVYjOFeChhkPHIKvvuhB6i/kBkO7SjPFRH8Kf5iz3i304WNdxmAYqidS
	cJxQH53EdvxAD+roUNDQE9+O0slpHhYaemDQ83mseIthdiwipJK56vI0OK72p0FOlkX5
	RF+zjtDDdJ2UtliFTgUJJXeg5CefR3fVCvp6x/CIJB8Cwca0+SloIqVpjuYlWnfIRyhD
	xdLlguBzZs7OcwJiI6vsnk0kU/NnOw+7YVcEQTlSHcCWi+PhJsj6SvWKYVW0nO5OKcch
	oAmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=r9Hb4MfZ9kNF9RPq39wodhau3Ahj/jqQU4dAtRvgQj4=;
	b=RREOMmapjqJDzJDQ3JhAKvPg1YmvTNvOnm9T+lbrX3u6wNC6i0bC4GLNbk9DZ/lzzo
	pHnHCuMzibVTt4HgRkIR3q58+z+k0YmvdbenxMrnMyp39PhAYinQEb8h0EwFR9P2VIgP
	v3Gu+aipAkgYVyV4JzgJHfyea6gtoOQXegAF1c3lexlaYS3LsgTQAaCGaUjL6i114FmZ
	GNnj0ntbZodUYs/21UcICDLPONEsUtbwEQrXsocroSHROpeOe4WONnYci4Il+B27QOiX
	wvwV5bP/dHowuHtZqb7aL5w65YlLOAt13gkYxNfFf2w4NW1L3pe17H1cJwmhpMTYtb2V
	d77A==
X-Gm-Message-State: AJcUukex5Bn3NcbowBV2UuWD4w6QMG8rIvxtS1cwGW7B5+S9awSxvQk3
	nWn5l3ilEymszuS31y3Sguac7ST7Y9X+jXtokhc=
X-Google-Smtp-Source: ALg8bN7UuzB00rVGo4p8XWvhERYjhVnIsmNLFmZtq85MWx44mxxfLYTlIQTCUvpFK5CgkSjuUGzWVtBctK0PfEJnr50=
X-Received: by 2002:a2e:9e95:: with SMTP id f21-v6mr30748ljk.128.1548202120516;
	Tue, 22 Jan 2019 16:08:40 -0800 (PST)
MIME-Version: 1.0
References: <20190122092909.5341-1-kbastian@mail.uni-paderborn.de>
	<20190122092909.5341-14-kbastian@mail.uni-paderborn.de>
In-Reply-To: <20190122092909.5341-14-kbastian@mail.uni-paderborn.de>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 22 Jan 2019 16:08:13 -0800
Message-ID: <CAKmqyKNRKAO_YSo5V0cmm=hCrKoyAaJsj2wzG3gDqJTmwfKkMg@mail.gmail.com>
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@sifive.com>, qemu-riscv@nongnu.org, 
	peer.adelt@hni.uni-paderborn.de, 
	Richard Henderson <richard.henderson@linaro.org>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::244
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v5 13/35] target/riscv:
 Convert RV64F insns to decodetree
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
X-List-Received-Date: Wed, 23 Jan 2019 00:08:51 -0000

On Tue, Jan 22, 2019 at 1:49 AM Bastian Koppelmann
<kbastian@mail.uni-paderborn.de> wrote:
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn32-64.decode           |  6 +++
>  target/riscv/insn_trans/trans_rvf.inc.c | 54 +++++++++++++++++++++++++
>  2 files changed, 60 insertions(+)
>
> diff --git a/target/riscv/insn32-64.decode b/target/riscv/insn32-64.decode
> index 0bee95c984..6319f872ac 100644
> --- a/target/riscv/insn32-64.decode
> +++ b/target/riscv/insn32-64.decode
> @@ -56,3 +56,9 @@ amomin_d   10000 . . ..... ..... 011 ..... 0101111 @atom_st
>  amomax_d   10100 . . ..... ..... 011 ..... 0101111 @atom_st
>  amominu_d  11000 . . ..... ..... 011 ..... 0101111 @atom_st
>  amomaxu_d  11100 . . ..... ..... 011 ..... 0101111 @atom_st
> +
> +# *** RV64F Standard Extension (in addition to RV32F) ***
> +fcvt_l_s   1100000  00010 ..... ... ..... 1010011 @r2_rm
> +fcvt_lu_s  1100000  00011 ..... ... ..... 1010011 @r2_rm
> +fcvt_s_l   1101000  00010 ..... ... ..... 1010011 @r2_rm
> +fcvt_s_lu  1101000  00011 ..... ... ..... 1010011 @r2_rm
> diff --git a/target/riscv/insn_trans/trans_rvf.inc.c b/target/riscv/insn_trans/trans_rvf.inc.c
> index b101593ac4..b667c576d4 100644
> --- a/target/riscv/insn_trans/trans_rvf.inc.c
> +++ b/target/riscv/insn_trans/trans_rvf.inc.c
> @@ -332,3 +332,57 @@ static bool trans_fmv_w_x(DisasContext *ctx, arg_fmv_w_x *a)
>
>      return true;
>  }
> +
> +#ifdef TARGET_RISCV64
> +static bool trans_fcvt_l_s(DisasContext *ctx, arg_fcvt_l_s *a)
> +{
> +    REQUIRE_FPU;
> +
> +    TCGv t0 = tcg_temp_new();
> +    gen_set_rm(ctx, a->rm);
> +    gen_helper_fcvt_l_s(t0, cpu_env, cpu_fpr[a->rs1]);
> +    gen_set_gpr(a->rd, t0);
> +    tcg_temp_free(t0);
> +    return true;
> +}
> +
> +static bool trans_fcvt_lu_s(DisasContext *ctx, arg_fcvt_lu_s *a)
> +{
> +    REQUIRE_FPU;
> +
> +    TCGv t0 = tcg_temp_new();
> +    gen_set_rm(ctx, a->rm);
> +    gen_helper_fcvt_lu_s(t0, cpu_env, cpu_fpr[a->rs1]);
> +    gen_set_gpr(a->rd, t0);
> +    tcg_temp_free(t0);
> +    return true;
> +}
> +
> +static bool trans_fcvt_s_l(DisasContext *ctx, arg_fcvt_s_l *a)
> +{
> +    REQUIRE_FPU;
> +
> +    TCGv t0 = tcg_temp_new();
> +    gen_get_gpr(t0, a->rs1);
> +
> +    gen_set_rm(ctx, a->rm);
> +    gen_helper_fcvt_s_l(cpu_fpr[a->rd], cpu_env, t0);
> +
> +    tcg_temp_free(t0);
> +    return true;
> +}
> +
> +static bool trans_fcvt_s_lu(DisasContext *ctx, arg_fcvt_s_lu *a)
> +{
> +    REQUIRE_FPU;
> +
> +    TCGv t0 = tcg_temp_new();
> +    gen_get_gpr(t0, a->rs1);
> +
> +    gen_set_rm(ctx, a->rm);
> +    gen_helper_fcvt_s_lu(cpu_fpr[a->rd], cpu_env, t0);
> +
> +    tcg_temp_free(t0);
> +    return true;
> +}
> +#endif
> --
> 2.20.1
>
>

