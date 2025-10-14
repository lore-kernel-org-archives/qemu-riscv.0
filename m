Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 299A6CCD187
	for <qemu-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 05:13:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v8XKj-0007dV-GY; Tue, 14 Oct 2025 01:12:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v8XKh-0007cl-Vg
 for qemu-riscv@nongnu.org; Tue, 14 Oct 2025 01:12:23 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v8XKf-0004XJ-Lw
 for qemu-riscv@nongnu.org; Tue, 14 Oct 2025 01:12:23 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-634b774f135so7776776a12.2
 for <qemu-riscv@nongnu.org>; Mon, 13 Oct 2025 22:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760418740; x=1761023540; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=okWePvISmGAKARJD1Q3kAo3YHfsX6nHUk7o7nt+26H0=;
 b=DadU7n75lYCo5s2U+jNgYj9YPVb18sJdIikVRjgONvpQqk2amRwm0lpBJfZuih5PZd
 yvp2/pH2/4qxruazo8mksbTmQYDX9Kphs4N9uAHUAN99I0b5xI6I2HNWmkwThe5XwyXl
 XVkQ9zOG9INec/BRoTdmWCtIGy2lJ24NCnTutd87xZ3OI2FZuPpKNOKhQWQmiChO9qET
 32vXQqJKU3qSYAhOZhOI+Cbk+SR0tKdW3k/E+0lCpnJ4St1bAgkuaZu1vH+NGJ+6R+1C
 Cjv6FrcRk1sPlexE5pPrW6m4Q+mv4ThlrcLJo9QeAdkUKb2E9EAtmL9rF4UnLtknvyGB
 UsIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760418740; x=1761023540;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=okWePvISmGAKARJD1Q3kAo3YHfsX6nHUk7o7nt+26H0=;
 b=MoQ35/qeHS7CVNeDzDwK8ZFiAarugWfDTBW4ARx7gi0YJa8vLuI1tvAqs7x18bENDS
 ut2jk+FFIRJwa0crt6kg8HEOj6pOzL1/ZZ9BpsQFrLAjV1vzIg8xvDbkgMzzfggKBQQ2
 ZrF45cg8WXnal5vw3SItYydH5vpjojHkC03vgd3NHSpSM5YuvnTajcI4ucewq2lEHUyc
 htCId1h/VQ3dG6+pjxD7xTEFhu0q0xeUMUM4eX1KoDPFwxYJy7gmG/fx6okJR1X47fms
 6WD0Ip+Lbe3H78LllOUe6arXHmcgitWbjEM42fy+pfUudjqpsu0xETDiI3+480y6OKPC
 d3AQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOk5nsi0rF9THPF09kIBGLZRwmdohD1qb4ZdCnBTvmcFCKVadjZ5Q2lt9wgFPlgn8z539B2nkfMUxB@nongnu.org
X-Gm-Message-State: AOJu0YxYn2JMyJkUvdX3+QedpL+S/epfvHiCNJcL/LPoiiOIoYUeS/mW
 awUjAMH4hoqNXNHsB5/sjr4dM1DPX/K7m5l52L3y6mes/4PA3DIQoON5RpwFKlVVHYLGuKurBcB
 EhrxFIIIn/ZknxEZWcO7C+dCbHDvh8gg=
X-Gm-Gg: ASbGncuQsYu4EVxzo//RbNIR9XPyAqp5hLeaT2QpzAT6biqkSbblDS1gP84LbbYmQyl
 oWoxj1ZzxO8WvTPr5WY9dC1JG/8dh4t/sDkJv0p80oywiQO6ZvFHAm9nSUF2WLQI7ErCEwqfEOc
 NJTlRVbzg2Qt5euRUs6cOE6LjD2CnLnjHMV50ARLNPNFMcHgMUnfD5RETFd6NS0ABYF8a9D54vO
 02SYGwvegtZNFQpv7yXwU/HZ9W2f+3K5mlwUn3K8x+83jORXCTtk/F+SWmpw7kSTeE=
X-Google-Smtp-Source: AGHT+IG0ppBJ7uyqFn7BiIa+B2LThZyK8hSxgrDIywrLEgYUf/r/iV7MQyBoKxw4F3A4tHZ180HAqfWjH4thZaAV3cs=
X-Received: by 2002:aa7:df92:0:b0:637:d2d6:dddd with SMTP id
 4fb4d7f45d1cf-639d5c6f393mr15291175a12.36.1760418739911; Mon, 13 Oct 2025
 22:12:19 -0700 (PDT)
MIME-Version: 1.0
References: <20251010155045.78220-1-philmd@linaro.org>
 <20251010155045.78220-12-philmd@linaro.org>
In-Reply-To: <20251010155045.78220-12-philmd@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 14 Oct 2025 15:11:52 +1000
X-Gm-Features: AS18NWCnIWbd1-EbB8NHWal9pdIAStc8xXfz_Nc8xOepN9vNBqcUYLukKzzXnGY
Message-ID: <CAKmqyKPu-+U2-n2ELmqVbb5DkBerJWNA18mQ1MSQ7hJW9Lm-zw@mail.gmail.com>
Subject: Re: [PATCH 11/13] target/riscv: Factor MemOp variable out when MO_TE
 is set
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Christoph Muellner <christoph.muellner@vrull.eu>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Anton Johansson <anjo@rev.ng>, Richard Henderson <richard.henderson@linaro.org>,
 Valentin Haudiquet <valentin.haudiquet@canonical.com>,
 Weiwei Li <liwei1518@gmail.com>, 
 qemu-riscv@nongnu.org, Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Sat, Oct 11, 2025 at 1:54=E2=80=AFAM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> In preparation of automatically replacing the MO_TE flag
> in the next commit, use an local @memop variable.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvd.c.inc       |  6 ++++--
>  target/riscv/insn_trans/trans_rvf.c.inc       |  6 ++++--
>  target/riscv/insn_trans/trans_rvzacas.c.inc   |  5 +++--
>  target/riscv/insn_trans/trans_rvzce.c.inc     |  6 ++++--
>  target/riscv/insn_trans/trans_rvzfh.c.inc     |  8 ++++++--
>  target/riscv/insn_trans/trans_rvzicfiss.c.inc | 10 ++++++----
>  6 files changed, 27 insertions(+), 14 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvd.c.inc b/target/riscv/insn_=
trans/trans_rvd.c.inc
> index 33858206788..62b75358158 100644
> --- a/target/riscv/insn_trans/trans_rvd.c.inc
> +++ b/target/riscv/insn_trans/trans_rvd.c.inc
> @@ -42,7 +42,7 @@
>  static bool trans_fld(DisasContext *ctx, arg_fld *a)
>  {
>      TCGv addr;
> -    MemOp memop =3D MO_TE | MO_UQ;
> +    MemOp memop =3D MO_UQ;
>
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVD);
> @@ -60,6 +60,7 @@ static bool trans_fld(DisasContext *ctx, arg_fld *a)
>      } else {
>          memop |=3D MO_ATOM_IFALIGN;
>      }
> +    memop |=3D MO_TE;
>
>      decode_save_opc(ctx, 0);
>      addr =3D get_address(ctx, a->rs1, a->imm);
> @@ -72,7 +73,7 @@ static bool trans_fld(DisasContext *ctx, arg_fld *a)
>  static bool trans_fsd(DisasContext *ctx, arg_fsd *a)
>  {
>      TCGv addr;
> -    MemOp memop =3D MO_TE | MO_UQ;
> +    MemOp memop =3D MO_UQ;
>
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVD);
> @@ -84,6 +85,7 @@ static bool trans_fsd(DisasContext *ctx, arg_fsd *a)
>      } else {
>          memop |=3D MO_ATOM_IFALIGN;
>      }
> +    memop |=3D MO_TE;
>
>      decode_save_opc(ctx, 0);
>      addr =3D get_address(ctx, a->rs1, a->imm);
> diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/insn_=
trans/trans_rvf.c.inc
> index 150e2b9a7d4..878417eae92 100644
> --- a/target/riscv/insn_trans/trans_rvf.c.inc
> +++ b/target/riscv/insn_trans/trans_rvf.c.inc
> @@ -43,11 +43,12 @@ static bool trans_flw(DisasContext *ctx, arg_flw *a)
>  {
>      TCGv_i64 dest;
>      TCGv addr;
> -    MemOp memop =3D MO_TE | MO_UL;
> +    MemOp memop =3D MO_UL;
>
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVF);
>
> +    memop |=3D MO_TE;
>      if (ctx->cfg_ptr->ext_zama16b) {
>          memop |=3D MO_ATOM_WITHIN16;
>      }
> @@ -65,11 +66,12 @@ static bool trans_flw(DisasContext *ctx, arg_flw *a)
>  static bool trans_fsw(DisasContext *ctx, arg_fsw *a)
>  {
>      TCGv addr;
> -    MemOp memop =3D MO_TE | MO_UL;
> +    MemOp memop =3D MO_UL;
>
>      REQUIRE_FPU;
>      REQUIRE_EXT(ctx, RVF);
>
> +    memop |=3D MO_TE;
>      if (ctx->cfg_ptr->ext_zama16b) {
>          memop |=3D MO_ATOM_WITHIN16;
>      }
> diff --git a/target/riscv/insn_trans/trans_rvzacas.c.inc b/target/riscv/i=
nsn_trans/trans_rvzacas.c.inc
> index d850b142642..6458ac4f241 100644
> --- a/target/riscv/insn_trans/trans_rvzacas.c.inc
> +++ b/target/riscv/insn_trans/trans_rvzacas.c.inc
> @@ -119,12 +119,13 @@ static bool trans_amocas_q(DisasContext *ctx, arg_a=
mocas_q *a)
>      TCGv_i64 src2h =3D get_gpr(ctx, a->rs2 =3D=3D 0 ? 0 : a->rs2 + 1, EX=
T_NONE);
>      TCGv_i64 destl =3D get_gpr(ctx, a->rd, EXT_NONE);
>      TCGv_i64 desth =3D get_gpr(ctx, a->rd =3D=3D 0 ? 0 : a->rd + 1, EXT_=
NONE);
> +    MemOp memop =3D MO_ALIGN | MO_UO;
>
> +    memop |=3D MO_TE;
>      tcg_gen_concat_i64_i128(src2, src2l, src2h);
>      tcg_gen_concat_i64_i128(dest, destl, desth);
>      decode_save_opc(ctx, RISCV_UW2_ALWAYS_STORE_AMO);
> -    tcg_gen_atomic_cmpxchg_i128(dest, src1, dest, src2, ctx->mem_idx,
> -                                (MO_ALIGN | MO_TE | MO_UO));
> +    tcg_gen_atomic_cmpxchg_i128(dest, src1, dest, src2, ctx->mem_idx, me=
mop);
>
>      tcg_gen_extr_i128_i64(destl, desth, dest);
>
> diff --git a/target/riscv/insn_trans/trans_rvzce.c.inc b/target/riscv/ins=
n_trans/trans_rvzce.c.inc
> index c8dc102c8e3..172c2c19c17 100644
> --- a/target/riscv/insn_trans/trans_rvzce.c.inc
> +++ b/target/riscv/insn_trans/trans_rvzce.c.inc
> @@ -175,7 +175,7 @@ static bool gen_pop(DisasContext *ctx, arg_cmpp *a, b=
ool ret, bool ret_val)
>          return false;
>      }
>
> -    MemOp memop =3D get_ol(ctx) =3D=3D MXL_RV32 ? MO_TE | MO_UL : MO_TE =
| MO_UQ;
> +    MemOp memop =3D get_ol(ctx) =3D=3D MXL_RV32 ? MO_UL : MO_UQ;
>      int reg_size =3D memop_size(memop);
>      target_ulong stack_adj =3D ROUND_UP(ctpop32(reg_bitmap) * reg_size, =
16) +
>                               a->spimm;
> @@ -185,6 +185,7 @@ static bool gen_pop(DisasContext *ctx, arg_cmpp *a, b=
ool ret, bool ret_val)
>
>      tcg_gen_addi_tl(addr, sp, stack_adj - reg_size);
>
> +    memop |=3D MO_TE;
>      for (i =3D X_Sn + 11; i >=3D 0; i--) {
>          if (reg_bitmap & (1 << i)) {
>              TCGv dest =3D dest_gpr(ctx, i);
> @@ -228,7 +229,7 @@ static bool trans_cm_push(DisasContext *ctx, arg_cm_p=
ush *a)
>          return false;
>      }
>
> -    MemOp memop =3D get_ol(ctx) =3D=3D MXL_RV32 ? MO_TE | MO_UL : MO_TE =
| MO_UQ;
> +    MemOp memop =3D get_ol(ctx) =3D=3D MXL_RV32 ? MO_UL : MO_UQ;
>      int reg_size =3D memop_size(memop);
>      target_ulong stack_adj =3D ROUND_UP(ctpop32(reg_bitmap) * reg_size, =
16) +
>                               a->spimm;
> @@ -238,6 +239,7 @@ static bool trans_cm_push(DisasContext *ctx, arg_cm_p=
ush *a)
>
>      tcg_gen_subi_tl(addr, sp, reg_size);
>
> +    memop |=3D MO_TE;
>      for (i =3D X_Sn + 11; i >=3D 0; i--) {
>          if (reg_bitmap & (1 << i)) {
>              TCGv val =3D get_gpr(ctx, i, EXT_NONE);
> diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/ins=
n_trans/trans_rvzfh.c.inc
> index eec478afcb0..5355cd46c3d 100644
> --- a/target/riscv/insn_trans/trans_rvzfh.c.inc
> +++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
> @@ -42,12 +42,14 @@
>
>  static bool trans_flh(DisasContext *ctx, arg_flh *a)
>  {
> +    MemOp memop =3D MO_UW;
>      TCGv_i64 dest;
>      TCGv t0;
>
>      REQUIRE_FPU;
>      REQUIRE_ZFHMIN_OR_ZFBFMIN(ctx);
>
> +    memop |=3D MO_TE;
>      decode_save_opc(ctx, 0);
>      t0 =3D get_gpr(ctx, a->rs1, EXT_NONE);
>      if (a->imm) {
> @@ -57,7 +59,7 @@ static bool trans_flh(DisasContext *ctx, arg_flh *a)
>      }
>
>      dest =3D cpu_fpr[a->rd];
> -    tcg_gen_qemu_ld_i64(dest, t0, ctx->mem_idx, MO_TE | MO_UW);
> +    tcg_gen_qemu_ld_i64(dest, t0, ctx->mem_idx, memop);
>      gen_nanbox_h(dest, dest);
>
>      mark_fs_dirty(ctx);
> @@ -66,11 +68,13 @@ static bool trans_flh(DisasContext *ctx, arg_flh *a)
>
>  static bool trans_fsh(DisasContext *ctx, arg_fsh *a)
>  {
> +    MemOp memop =3D MO_UW;
>      TCGv t0;
>
>      REQUIRE_FPU;
>      REQUIRE_ZFHMIN_OR_ZFBFMIN(ctx);
>
> +    memop |=3D MO_TE;
>      decode_save_opc(ctx, 0);
>      t0 =3D get_gpr(ctx, a->rs1, EXT_NONE);
>      if (a->imm) {
> @@ -79,7 +83,7 @@ static bool trans_fsh(DisasContext *ctx, arg_fsh *a)
>          t0 =3D temp;
>      }
>
> -    tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], t0, ctx->mem_idx, MO_TE | MO_UW=
);
> +    tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], t0, ctx->mem_idx, memop);
>
>      return true;
>  }
> diff --git a/target/riscv/insn_trans/trans_rvzicfiss.c.inc b/target/riscv=
/insn_trans/trans_rvzicfiss.c.inc
> index c5555966175..89eed007587 100644
> --- a/target/riscv/insn_trans/trans_rvzicfiss.c.inc
> +++ b/target/riscv/insn_trans/trans_rvzicfiss.c.inc
> @@ -100,12 +100,13 @@ static bool trans_ssamoswap_w(DisasContext *ctx, ar=
g_amoswap_w *a)
>
>      TCGv dest =3D dest_gpr(ctx, a->rd);
>      TCGv src1, src2 =3D get_gpr(ctx, a->rs2, EXT_NONE);
> +    MemOp memop =3D MO_ALIGN | MO_SL;
>
>      decode_save_opc(ctx, RISCV_UW2_ALWAYS_STORE_AMO);
>      src1 =3D get_address(ctx, a->rs1, 0);
>
> -    tcg_gen_atomic_xchg_tl(dest, src1, src2, SS_MMU_INDEX(ctx),
> -                           (MO_ALIGN | MO_TE | MO_SL));
> +    memop |=3D MO_TE;
> +    tcg_gen_atomic_xchg_tl(dest, src1, src2, SS_MMU_INDEX(ctx), memop);
>      gen_set_gpr(ctx, a->rd, dest);
>      return true;
>  }
> @@ -129,12 +130,13 @@ static bool trans_ssamoswap_d(DisasContext *ctx, ar=
g_amoswap_w *a)
>
>      TCGv dest =3D dest_gpr(ctx, a->rd);
>      TCGv src1, src2 =3D get_gpr(ctx, a->rs2, EXT_NONE);
> +    MemOp memop =3D MO_ALIGN | MO_SQ;
>
>      decode_save_opc(ctx, RISCV_UW2_ALWAYS_STORE_AMO);
>      src1 =3D get_address(ctx, a->rs1, 0);
>
> -    tcg_gen_atomic_xchg_tl(dest, src1, src2, SS_MMU_INDEX(ctx),
> -                           (MO_ALIGN | MO_TE | MO_SQ));
> +    memop |=3D MO_TE;
> +    tcg_gen_atomic_xchg_tl(dest, src1, src2, SS_MMU_INDEX(ctx), memop);
>      gen_set_gpr(ctx, a->rd, dest);
>      return true;
>  }
> --
> 2.51.0
>
>

