Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mpOyG-0005pp-M3
	for mharc-qemu-riscv@gnu.org; Tue, 23 Nov 2021 01:08:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mpOyE-0005np-Kc; Tue, 23 Nov 2021 01:07:58 -0500
Received: from [2607:f8b0:4864:20::12a] (port=47004
 helo=mail-il1-x12a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mpOyB-0005EW-SC; Tue, 23 Nov 2021 01:07:58 -0500
Received: by mail-il1-x12a.google.com with SMTP id j7so13257229ilk.13;
 Mon, 22 Nov 2021 22:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SDxUEZKjxNQXcZxWs2Qk3lTmVW9etnWjj1357P232a0=;
 b=dp3ivqXmQoj4RllK+MPp7tnYzwgsTkrB5LoizD353GfcDrJVPlG+dzzlLFByE2BXBv
 HWTf6nrU7KLRrGuGPgBySU1ZPvznMk6IagylimlCReAM/s9oF6Nu0mDNz+GAgbF02/SF
 lCRJ7exmsTnRWW3Kt5tsC+qT36G1P+F3VNdsoQmR8oSEabOqHxgQEnZdsk8BzG5S9b45
 HujWI5jvuV4D2fHo4FJfqaoQi8sJPFvCQMEzrGePwUpgkUdxVWJ6lHlJg2/yNgCf2xNH
 ADuynH/Pv1cCaOoqkYzqKVOqabilx1AbvHoLzrPPSzb9Uz6QCTHhbowHSSjpAaQYS7u6
 ggSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SDxUEZKjxNQXcZxWs2Qk3lTmVW9etnWjj1357P232a0=;
 b=7KkajWgm83YW9ohoM/JZmUkPC4b1/XzU8tiy5raIcnkgQzDPygVGoKw45SlNx4e1JK
 Zn6dXRrB7i33nW1sV+N9z+ebLpIQrRVxFiCvPNi8P8gZ8tWokqjuBONl7Y/W5p3Vkux2
 YYCNq/1dFTtv/uWwCcatOkmiujvZoHAtw7fOP4LydT+hYOlod6X4ZLR6Qq/xaz354Uq6
 XunnYhrbFNnOM2W3AfEYMx8ihmgeRDyEA4rVZ8JkqHcNXkUBFpsj8tIfEoAf5HJ39ldE
 ObUPTOHEcEMYqrhJmSO9jEobr9Di3Oh+rnhqbAU0zVqkNdIEM/YaFlapi+BEfxt6S7GP
 2NZQ==
X-Gm-Message-State: AOAM533EHJuwND/kgnRjzIkCyZOFLPAzR6kG9zH9by/MnGuH5XBT/Mju
 cPDWsPVi4IoUGTRRBMduNaH1fUGmSY5l8idQevc=
X-Google-Smtp-Source: ABdhPJxNU1okML4rV3HwHpllXiwtbqj/ulHcXfC7Wlk4gLYhqBWQqc278hWUhz63iCIV0HWeg8qu0LjyWauxKn+Bt8U=
X-Received: by 2002:a05:6e02:16c9:: with SMTP id
 9mr2837226ilx.221.1637647671941; 
 Mon, 22 Nov 2021 22:07:51 -0800 (PST)
MIME-Version: 1.0
References: <20211112145902.205131-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211112145902.205131-6-frederic.petrot@univ-grenoble-alpes.fr>
In-Reply-To: <20211112145902.205131-6-frederic.petrot@univ-grenoble-alpes.fr>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 23 Nov 2021 16:07:25 +1000
Message-ID: <CAKmqyKO9jdW27YrPQsqB=+0Eru+GuW+nt7Bx65rfXtr+b9gHWw@mail.gmail.com>
Subject: Re: [PATCH v5 05/18] target/riscv: separation of bitwise logic and
 arithmetic helpers
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Fabien Portas <fabien.portas@grenoble-inp.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::12a;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12a.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 23 Nov 2021 06:07:59 -0000

On Sat, Nov 13, 2021 at 1:11 AM Fr=C3=A9d=C3=A9ric P=C3=A9trot
<frederic.petrot@univ-grenoble-alpes.fr> wrote:
>
> Introduction of a gen_logic function for bitwise logic to implement
> instructions in which not propagation of information occurs between bits =
and
> use of this function on the bitwise instructions.
>
> Signed-off-by: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-greno=
ble-alpes.fr>
> Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/translate.c                | 27 +++++++++++++++++++++++++
>  target/riscv/insn_trans/trans_rvb.c.inc |  6 +++---
>  target/riscv/insn_trans/trans_rvi.c.inc | 12 +++++------
>  3 files changed, 36 insertions(+), 9 deletions(-)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index d98bde9b6b..b4278a6a92 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -400,6 +400,33 @@ static int ex_rvc_shifti(DisasContext *ctx, int imm)
>  /* Include the auto-generated decoder for 32 bit insn */
>  #include "decode-insn32.c.inc"
>
> +static bool gen_logic_imm_fn(DisasContext *ctx, arg_i *a,
> +                             void (*func)(TCGv, TCGv, target_long))
> +{
> +    TCGv dest =3D dest_gpr(ctx, a->rd);
> +    TCGv src1 =3D get_gpr(ctx, a->rs1, EXT_NONE);
> +
> +    func(dest, src1, a->imm);
> +
> +    gen_set_gpr(ctx, a->rd, dest);
> +
> +    return true;
> +}
> +
> +static bool gen_logic(DisasContext *ctx, arg_r *a,
> +                      void (*func)(TCGv, TCGv, TCGv))
> +{
> +    TCGv dest =3D dest_gpr(ctx, a->rd);
> +    TCGv src1 =3D get_gpr(ctx, a->rs1, EXT_NONE);
> +    TCGv src2 =3D get_gpr(ctx, a->rs2, EXT_NONE);
> +
> +    func(dest, src1, src2);
> +
> +    gen_set_gpr(ctx, a->rd, dest);
> +
> +    return true;
> +}
> +
>  static bool gen_arith_imm_fn(DisasContext *ctx, arg_i *a, DisasExtend ex=
t,
>                               void (*func)(TCGv, TCGv, target_long))
>  {
> diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_=
trans/trans_rvb.c.inc
> index c8d31907c5..de2cd613b1 100644
> --- a/target/riscv/insn_trans/trans_rvb.c.inc
> +++ b/target/riscv/insn_trans/trans_rvb.c.inc
> @@ -86,19 +86,19 @@ static bool trans_cpop(DisasContext *ctx, arg_cpop *a=
)
>  static bool trans_andn(DisasContext *ctx, arg_andn *a)
>  {
>      REQUIRE_ZBB(ctx);
> -    return gen_arith(ctx, a, EXT_NONE, tcg_gen_andc_tl);
> +    return gen_logic(ctx, a, tcg_gen_andc_tl);
>  }
>
>  static bool trans_orn(DisasContext *ctx, arg_orn *a)
>  {
>      REQUIRE_ZBB(ctx);
> -    return gen_arith(ctx, a, EXT_NONE, tcg_gen_orc_tl);
> +    return gen_logic(ctx, a, tcg_gen_orc_tl);
>  }
>
>  static bool trans_xnor(DisasContext *ctx, arg_xnor *a)
>  {
>      REQUIRE_ZBB(ctx);
> -    return gen_arith(ctx, a, EXT_NONE, tcg_gen_eqv_tl);
> +    return gen_logic(ctx, a, tcg_gen_eqv_tl);
>  }
>
>  static bool trans_min(DisasContext *ctx, arg_min *a)
> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_=
trans/trans_rvi.c.inc
> index 4a2aefe3a5..51607b3d40 100644
> --- a/target/riscv/insn_trans/trans_rvi.c.inc
> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> @@ -252,17 +252,17 @@ static bool trans_sltiu(DisasContext *ctx, arg_slti=
u *a)
>
>  static bool trans_xori(DisasContext *ctx, arg_xori *a)
>  {
> -    return gen_arith_imm_fn(ctx, a, EXT_NONE, tcg_gen_xori_tl);
> +    return gen_logic_imm_fn(ctx, a, tcg_gen_xori_tl);
>  }
>
>  static bool trans_ori(DisasContext *ctx, arg_ori *a)
>  {
> -    return gen_arith_imm_fn(ctx, a, EXT_NONE, tcg_gen_ori_tl);
> +    return gen_logic_imm_fn(ctx, a, tcg_gen_ori_tl);
>  }
>
>  static bool trans_andi(DisasContext *ctx, arg_andi *a)
>  {
> -    return gen_arith_imm_fn(ctx, a, EXT_NONE, tcg_gen_andi_tl);
> +    return gen_logic_imm_fn(ctx, a, tcg_gen_andi_tl);
>  }
>
>  static bool trans_slli(DisasContext *ctx, arg_slli *a)
> @@ -319,7 +319,7 @@ static bool trans_sltu(DisasContext *ctx, arg_sltu *a=
)
>
>  static bool trans_xor(DisasContext *ctx, arg_xor *a)
>  {
> -    return gen_arith(ctx, a, EXT_NONE, tcg_gen_xor_tl);
> +    return gen_logic(ctx, a, tcg_gen_xor_tl);
>  }
>
>  static bool trans_srl(DisasContext *ctx, arg_srl *a)
> @@ -334,12 +334,12 @@ static bool trans_sra(DisasContext *ctx, arg_sra *a=
)
>
>  static bool trans_or(DisasContext *ctx, arg_or *a)
>  {
> -    return gen_arith(ctx, a, EXT_NONE, tcg_gen_or_tl);
> +    return gen_logic(ctx, a, tcg_gen_or_tl);
>  }
>
>  static bool trans_and(DisasContext *ctx, arg_and *a)
>  {
> -    return gen_arith(ctx, a, EXT_NONE, tcg_gen_and_tl);
> +    return gen_logic(ctx, a, tcg_gen_and_tl);
>  }
>
>  static bool trans_addiw(DisasContext *ctx, arg_addiw *a)
> --
> 2.33.1
>
>

