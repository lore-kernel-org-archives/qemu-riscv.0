Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1poEs2-0006VO-Mi
	for mharc-qemu-riscv@gnu.org; Sun, 16 Apr 2023 22:45:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1poErw-0006TM-BE; Sun, 16 Apr 2023 22:45:33 -0400
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1poErt-0002UW-Sn; Sun, 16 Apr 2023 22:45:27 -0400
Received: by mail-vs1-xe32.google.com with SMTP id dl6so9263398vsb.7;
 Sun, 16 Apr 2023 19:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681699524; x=1684291524;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=231NR2wI22MBPIWqkBq+qYB/w95odCs3sjpV0bL+uBA=;
 b=b/5yT6F+cSPxessLECRiT1CPjdY4Dp/OUn/lmmjCaQIm57T2fqK1knbdDlrHYlp/JW
 svk+lfV2I/asMh6fk3UZ95Wm7O7IZY6ta472jShcgE9lpvUWH1tKlXEDzt74jGQtSuHW
 0Dfrc4FozRCDICZafNA5TZ03CJi82T2IfJyLGsRmaTjYknFTJwl2ufHrXpSBiMXUaAkv
 siWtftmLuxN4iSSe80UOb0hXDS5b/2Eyly6Ch04O2WdTUdeh0DPoj6OkyMuentA9KbHV
 vFssSPYLjQ1SQm4Ud/AFOPDlsOfWFped6TpnMLtKBYrk8bzAy5rUYBXPb7W4acyDRZWq
 imiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681699524; x=1684291524;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=231NR2wI22MBPIWqkBq+qYB/w95odCs3sjpV0bL+uBA=;
 b=XneBqsspwriDMtlF0SduCRu4QQfgAh/rJOQVlm+dNNszOrnw8upFEdOwVlXthCKPs9
 UGGd+/4SEkn7X3TvNt1ToPKjqqwW+1KlaJC/k/2PCWMipG2p5IP3Z0+tzhGV9M+v7p0j
 F/Aivw/i1proygHUMm4yC4kyJAvLh3aL8KQu/2ik64hcvnzRZUNWQRPI6pHhghe/5a6Q
 F4YrW29O2noGintDOpWDuFqwzrulHzsPjTapNrK/ryEnpjwgHL3efSZEvHWWEr4NjH8E
 VQ0Ntk2D+HuJkCqlkE23gJpKMgAQ/7SOuzqFdrlpERFzUiqyWmnuuC38hdFUP3XfMUQE
 hJDQ==
X-Gm-Message-State: AAQBX9cswdGqhreUp33rlSAtEM8WceLquw39oGN97lyU3yIkvzUIFpMK
 Sxfcimn5akughwhgtK+jC0sJoqTwk3eLyISGEsA=
X-Google-Smtp-Source: AKy350YKhbvllbslO32TGc7SvOylN1ZWw1IhZUjalWI1eAMf3ezStUhsP+StfW6bWnLYT9KliWRw6zdDSSnWE0VcrEE=
X-Received: by 2002:a67:c391:0:b0:42e:3c54:742b with SMTP id
 s17-20020a67c391000000b0042e3c54742bmr6453003vsj.0.1681699524150; Sun, 16 Apr
 2023 19:45:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230413141150.78029-1-liweiwei@iscas.ac.cn>
In-Reply-To: <20230413141150.78029-1-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 17 Apr 2023 12:44:58 +1000
Message-ID: <CAKmqyKOcR8uj49jXg6DLEpnAGaBaZzzdLoWUZeA5mMvj6hRMUQ@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: Update check for Zca/Zcf/Zcd
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e32;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe32.google.com
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
X-List-Received-Date: Mon, 17 Apr 2023 02:45:33 -0000

On Fri, Apr 14, 2023 at 12:13=E2=80=AFAM Weiwei Li <liweiwei@iscas.ac.cn> w=
rote:
>
> Even though Zca/Zcf/Zcd can be included by C/F/D, however, their priv
> version is higher than the priv version of C/F/D. So if we use check
> for them instead of check for C/F/D totally, it will trigger new
> problem when we try to disable the extensions based on the configured
> priv version.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> v2:
> * Fix code style errors
>
>  target/riscv/insn_trans/trans_rvd.c.inc | 12 +++++++-----
>  target/riscv/insn_trans/trans_rvf.c.inc | 14 ++++++++------
>  target/riscv/insn_trans/trans_rvi.c.inc |  5 +++--
>  target/riscv/translate.c                |  5 +++--
>  4 files changed, 21 insertions(+), 15 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvd.c.inc b/target/riscv/insn_=
trans/trans_rvd.c.inc
> index 2c51e01c40..6bdb55ef43 100644
> --- a/target/riscv/insn_trans/trans_rvd.c.inc
> +++ b/target/riscv/insn_trans/trans_rvd.c.inc
> @@ -31,9 +31,11 @@
>      } \
>  } while (0)
>
> -#define REQUIRE_ZCD(ctx) do { \
> -    if (!ctx->cfg_ptr->ext_zcd) {  \
> -        return false;     \
> +#define REQUIRE_ZCD_OR_DC(ctx) do { \
> +    if (!ctx->cfg_ptr->ext_zcd) { \
> +        if (!has_ext(ctx, RVD) || !has_ext(ctx, RVC)) { \
> +            return false; \
> +        } \
>      } \
>  } while (0)
>
> @@ -67,13 +69,13 @@ static bool trans_fsd(DisasContext *ctx, arg_fsd *a)
>
>  static bool trans_c_fld(DisasContext *ctx, arg_fld *a)
>  {
> -    REQUIRE_ZCD(ctx);
> +    REQUIRE_ZCD_OR_DC(ctx);
>      return trans_fld(ctx, a);
>  }
>
>  static bool trans_c_fsd(DisasContext *ctx, arg_fsd *a)
>  {
> -    REQUIRE_ZCD(ctx);
> +    REQUIRE_ZCD_OR_DC(ctx);
>      return trans_fsd(ctx, a);
>  }
>
> diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/insn_=
trans/trans_rvf.c.inc
> index 9e9fa2087a..593855e73a 100644
> --- a/target/riscv/insn_trans/trans_rvf.c.inc
> +++ b/target/riscv/insn_trans/trans_rvf.c.inc
> @@ -30,10 +30,12 @@
>      } \
>  } while (0)
>
> -#define REQUIRE_ZCF(ctx) do {                  \
> -    if (!ctx->cfg_ptr->ext_zcf) {              \
> -        return false;                          \
> -    }                                          \
> +#define REQUIRE_ZCF_OR_FC(ctx) do {                     \
> +    if (!ctx->cfg_ptr->ext_zcf) {                       \
> +        if (!has_ext(ctx, RVF) || !has_ext(ctx, RVC)) { \
> +            return false;                               \
> +        }                                               \
> +    }                                                   \
>  } while (0)
>
>  static bool trans_flw(DisasContext *ctx, arg_flw *a)
> @@ -69,13 +71,13 @@ static bool trans_fsw(DisasContext *ctx, arg_fsw *a)
>
>  static bool trans_c_flw(DisasContext *ctx, arg_flw *a)
>  {
> -    REQUIRE_ZCF(ctx);
> +    REQUIRE_ZCF_OR_FC(ctx);
>      return trans_flw(ctx, a);
>  }
>
>  static bool trans_c_fsw(DisasContext *ctx, arg_fsw *a)
>  {
> -    REQUIRE_ZCF(ctx);
> +    REQUIRE_ZCF_OR_FC(ctx);
>      return trans_fsw(ctx, a);
>  }
>
> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_=
trans/trans_rvi.c.inc
> index c70c495fc5..e33f63bea1 100644
> --- a/target/riscv/insn_trans/trans_rvi.c.inc
> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> @@ -56,7 +56,7 @@ static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
>      tcg_gen_andi_tl(cpu_pc, cpu_pc, (target_ulong)-2);
>
>      gen_set_pc(ctx, cpu_pc);
> -    if (!ctx->cfg_ptr->ext_zca) {
> +    if (!has_ext(ctx, RVC) && !ctx->cfg_ptr->ext_zca) {
>          TCGv t0 =3D tcg_temp_new();
>
>          misaligned =3D gen_new_label();
> @@ -169,7 +169,8 @@ static bool gen_branch(DisasContext *ctx, arg_b *a, T=
CGCond cond)
>
>      gen_set_label(l); /* branch taken */
>
> -    if (!ctx->cfg_ptr->ext_zca && ((ctx->base.pc_next + a->imm) & 0x3)) =
{
> +    if (!has_ext(ctx, RVC) && !ctx->cfg_ptr->ext_zca &&
> +        ((ctx->base.pc_next + a->imm) & 0x3)) {
>          /* misaligned */
>          gen_exception_inst_addr_mis(ctx);
>      } else {
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index d0094922b6..661e29ab39 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -551,7 +551,7 @@ static void gen_jal(DisasContext *ctx, int rd, target=
_ulong imm)
>
>      /* check misaligned: */
>      next_pc =3D ctx->base.pc_next + imm;
> -    if (!ctx->cfg_ptr->ext_zca) {
> +    if (!has_ext(ctx, RVC) && !ctx->cfg_ptr->ext_zca) {
>          if ((next_pc & 0x3) !=3D 0) {
>              gen_exception_inst_addr_mis(ctx);
>              return;
> @@ -1137,7 +1137,8 @@ static void decode_opc(CPURISCVState *env, DisasCon=
text *ctx, uint16_t opcode)
>           * The Zca extension is added as way to refer to instructions in=
 the C
>           * extension that do not include the floating-point loads and st=
ores
>           */
> -        if (ctx->cfg_ptr->ext_zca && decode_insn16(ctx, opcode)) {
> +        if ((has_ext(ctx, RVC) || ctx->cfg_ptr->ext_zca) &&
> +            decode_insn16(ctx, opcode)) {
>              return;
>          }
>      } else {
> --
> 2.25.1
>
>

