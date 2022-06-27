Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o5hB9-0001EY-De
	for mharc-qemu-riscv@gnu.org; Mon, 27 Jun 2022 01:20:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o5hB7-0001Cx-U6; Mon, 27 Jun 2022 01:20:53 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:43862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o5hB5-0006cw-UF; Mon, 27 Jun 2022 01:20:53 -0400
Received: by mail-pf1-x42f.google.com with SMTP id 136so2818135pfy.10;
 Sun, 26 Jun 2022 22:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pEUrN6F9zmhBj6NvAqH0fsLfDQ3evohGGYwEvBpMrPE=;
 b=JSN95Q7k66vBwBQV1aYzG9Hw5WWinM5INr3cj6H+yV+BZhJvcWgQ+z6TxDTp69EA79
 vtUdsULqhvrBZ/RZnZBKne2Or++OwNEURFAvI3hdeE5Aga8r5xxZ86SSAKpCQn2FFWfO
 vvi6cvXm6JGInEK43xsKRgGDYRsDhXdGjxJRHqxbB+1XDXTKj2shnMmfG2nTt7Z/YYYy
 dSXpQgCYxKfOKqO67fnbqp2Ny3GQo2Dt/jhJD6sQnELcPS/Jl1UeOEVJMCRBxwLRkGWs
 oZia559tCZz7c7LvjNV0Pbe3atxHDFiKUsK20RHKQ2eVdp+RyKiiwN88/3J/4+JPXS8v
 h2bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pEUrN6F9zmhBj6NvAqH0fsLfDQ3evohGGYwEvBpMrPE=;
 b=oB9ryvlzoCzFJPY9mMhfFOHGJWBnvSPVJJqsUd1BZycJMXwAvl1L5qe/SwYeS/GIEK
 m+NU3wJPyCyR0dVVKrBNktdNA+459hVHDPtLOxWiaSe+Wtrvlw6VYBiH8LjfecwN1nqu
 91TmJJaYddiGaMqC3EAlIPqAXqksz1eOCBowMVwxuIbAwq5Do1ZKNRHw+eJBm1S18PeK
 2aCsCF1ETnmfM1CNrsmvNfdfyxkAxIbMpzoXqmfCGvh1j+Hj0aC0rxVL40RXRbI5P2FV
 0dUbOABOoSGeijk+l7zwdTGrUrv2p//l0zb/iWbYQez0hBAnoe1ohmwAHc/GGfWzWix4
 miEg==
X-Gm-Message-State: AJIora9sC4UmhZYNOdvYiHMfS/+mlJBlZuzm/Z4cPo3b8wzO77zKTUuH
 kAD/rSQq5iNbKkvNGXZBsQRy4P3U4t1IkLTUVPg=
X-Google-Smtp-Source: AGRyM1vH/PpicgZdu8kfuj3WG3GmMrUiAhu/jgoGW7hF9HqZwnJLsioQ1DQZlkNI6vm1gTMRlaMZnC26eFAOaXpJUoA=
X-Received: by 2002:a65:6b8a:0:b0:3db:7dc5:fec2 with SMTP id
 d10-20020a656b8a000000b003db7dc5fec2mr11035524pgw.223.1656307250067; Sun, 26
 Jun 2022 22:20:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220623152907.1606964-1-christoph.muellner@vrull.eu>
In-Reply-To: <20220623152907.1606964-1-christoph.muellner@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 27 Jun 2022 15:20:23 +1000
Message-ID: <CAKmqyKN2A1kMNdNpDg0wy+1uC3cz0o7sc0SWt6m01jo4DZe6xQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3] RISC-V: Add Zawrs ISA extension support
To: Christoph Muellner <christoph.muellner@vrull.eu>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Philipp Tomsich <philipp.tomsich@vrull.eu>, 
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko.stuebner@vrull.eu>, 
 Aaron Durbin <adurbin@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Jun 2022 05:20:54 -0000

On Fri, Jun 24, 2022 at 1:31 AM Christoph Muellner
<christoph.muellner@vrull.eu> wrote:
>
> This patch adds support for the Zawrs ISA extension.
> Given the current (incomplete) implementation of reservation sets
> there seems to be no way to provide a full emulation of the WRS
> instruction (wake on reservation set invalidation or timeout or
> interrupt). Therefore, we just pretend that an interrupt occured,
> exit the execution loop and finally continue execution.
>
> The specification can be found here:
> https://github.com/riscv/riscv-zawrs/blob/main/zawrs.adoc
>
> Note, that the Zawrs extension is not frozen or ratified yet.
> Therefore this patch is an RFC and not intended to get merged.
>
> Changes since v2:
> * Adjustments according to a specification change
> * Inline REQUIRE_ZAWRS() since it has only one user
>
> Changes since v1:
> * Adding zawrs to the ISA string that is passed to the kernel
>
> Signed-off-by: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
> ---
>  target/riscv/cpu.c                          |  2 +
>  target/riscv/cpu.h                          |  1 +
>  target/riscv/insn32.decode                  |  4 ++
>  target/riscv/insn_trans/trans_rvzawrs.c.inc | 54 +++++++++++++++++++++
>  target/riscv/translate.c                    |  1 +
>  5 files changed, 62 insertions(+)
>  create mode 100644 target/riscv/insn_trans/trans_rvzawrs.c.inc
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 05e6521351..6cb00fadff 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -882,6 +882,7 @@ static Property riscv_cpu_extensions[] =3D {
>      DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
>      DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
>      DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
> +    DEFINE_PROP_BOOL("zawrs", RISCVCPU, cfg.ext_zawrs, true),

Would this be enabled by default?

>      DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
>      DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
>      DEFINE_PROP_BOOL("Zve32f", RISCVCPU, cfg.ext_zve32f, false),
> @@ -1075,6 +1076,7 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, cha=
r **isa_str, int max_str_len)
>          ISA_EDATA_ENTRY(zicsr, ext_icsr),
>          ISA_EDATA_ENTRY(zifencei, ext_ifencei),
>          ISA_EDATA_ENTRY(zmmul, ext_zmmul),
> +        ISA_EDATA_ENTRY(zawrs, ext_zawrs),
>          ISA_EDATA_ENTRY(zfh, ext_zfh),
>          ISA_EDATA_ENTRY(zfhmin, ext_zfhmin),
>          ISA_EDATA_ENTRY(zfinx, ext_zfinx),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 7d6397acdf..a22bc0fa09 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -380,6 +380,7 @@ struct RISCVCPUConfig {
>      bool ext_h;
>      bool ext_j;
>      bool ext_v;
> +    bool ext_zawrs;
>      bool ext_zba;
>      bool ext_zbb;
>      bool ext_zbc;
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 4033565393..513ea227fe 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -711,6 +711,10 @@ vsetvli         0 ........... ..... 111 ..... 101011=
1  @r2_zimm11
>  vsetivli        11 .......... ..... 111 ..... 1010111  @r2_zimm10
>  vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
>
> +# *** Zawrs Standard Extension ***
> +wrs_nto    000000001101 00000 000 00000 1110011
> +wrs_sto    000000011101 00000 000 00000 1110011
> +
>  # *** RV32 Zba Standard Extension ***
>  sh1add     0010000 .......... 010 ..... 0110011 @r
>  sh2add     0010000 .......... 100 ..... 0110011 @r
> diff --git a/target/riscv/insn_trans/trans_rvzawrs.c.inc b/target/riscv/i=
nsn_trans/trans_rvzawrs.c.inc
> new file mode 100644
> index 0000000000..d0df56378e
> --- /dev/null
> +++ b/target/riscv/insn_trans/trans_rvzawrs.c.inc
> @@ -0,0 +1,54 @@
> +/*
> + * RISC-V translation routines for the RISC-V Zawrs Extension.
> + *
> + * Copyright (c) 2022 Christoph Muellner, christoph.muellner@vrull.io
> + *
> + * This program is free software; you can redistribute it and/or modify =
it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOU=
T
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License=
 for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License alo=
ng with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +static bool trans_wrs(DisasContext *ctx)
> +{
> +    if (!ctx->cfg_ptr->ext_zawrs) {
> +        return false;
> +    }
> +
> +    /*
> +     * We may continue if one or more of the following conditions are me=
t:
> +     * a) The reservation set is invalid

Shouldn't this be valid?

> +     * b) If WRS.STO, a short time since start of stall has elapsed
> +     * c) An interrupt is observed
> +     *
> +     * A reservation set can be invalidated by any store to a reserved
> +     * memory location. However, that's currently not implemented in QEM=
U.
> +     * So let's just exit the CPU loop and pretend that an interrupt occ=
ured.

We don't actually pretend an interrupt occurs though. It seems like
it's valid to terminate the stall early, so we should just be able to
do that.

Alistair

> +     */
> +
> +    /* Clear the load reservation  (if any).  */
> +    tcg_gen_movi_tl(load_res, -1);
> +
> +    gen_set_pc_imm(ctx, ctx->pc_succ_insn);
> +    tcg_gen_exit_tb(NULL, 0);
> +    ctx->base.is_jmp =3D DISAS_NORETURN;
> +
> +    return true;
> +}
> +
> +#define GEN_TRANS_WRS(insn)                                            \
> +static bool trans_ ## insn(DisasContext *ctx, arg_ ## insn *a)         \
> +{                                                                      \
> +       (void)a;                                                        \
> +       return trans_wrs(ctx);                                          \
> +}
> +
> +GEN_TRANS_WRS(wrs_nto)
> +GEN_TRANS_WRS(wrs_sto)
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index b151c20674..a4f07d5166 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -1007,6 +1007,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase,=
 target_ulong pc)
>  #include "insn_trans/trans_rvh.c.inc"
>  #include "insn_trans/trans_rvv.c.inc"
>  #include "insn_trans/trans_rvb.c.inc"
> +#include "insn_trans/trans_rvzawrs.c.inc"
>  #include "insn_trans/trans_rvzfh.c.inc"
>  #include "insn_trans/trans_rvk.c.inc"
>  #include "insn_trans/trans_privileged.c.inc"
> --
> 2.35.3
>
>

