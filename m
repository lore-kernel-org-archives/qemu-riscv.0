Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EA15C77B7E
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 May 2023 02:24:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q2N7D-0007CN-Np; Thu, 25 May 2023 22:23:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q2N7C-0007C1-K1; Thu, 25 May 2023 22:23:38 -0400
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q2N7A-0006hL-UB; Thu, 25 May 2023 22:23:38 -0400
Received: by mail-ua1-x92b.google.com with SMTP id
 a1e0cc1a2514c-783f17f0a00so80334241.2; 
 Thu, 25 May 2023 19:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685067815; x=1687659815;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nqVBZKSkwgyWMG2w6N37MzLg/Cj8P84B9PQ8NX42QUk=;
 b=a53UT1hZgA14Vhk8SjMYMYC84A4Z0rHIwWQQADsRPJDEpmTHKAmHnY6ATAS89fpaIw
 OTKRlUOs4TYUR9MI1pNS+bQ6eDuN/tI8kmDlVnCbJwrFtPhriXSE6rT9oh+y6m+ghlZH
 ZoeZj8WnZYXlONfhdrsP/Kp9w5M8emC819Ynt20PJ6bq2U1mOFFw3+Y28fRab3rD/pxh
 d0Wd1/34SXdCuKEHG1rQqfxmfWoe3bLktfHHDD7Fy1RoOxQJXBVivx0e9rLgmZQfDP1b
 dqQM1TsREWCG1h4UQKIhxBEXayeiFObK25mpYYDhgYubBsGQwaMIiG6SlyCtd76PuaZr
 aPpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685067815; x=1687659815;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nqVBZKSkwgyWMG2w6N37MzLg/Cj8P84B9PQ8NX42QUk=;
 b=UMIvXgjy/QyAOatVAagjqkDe5R4aGtbYPnG7H885eX2jcfcFAmYUrweF7BVQWkR0sL
 lGHNM7ipTyGNjX465EJY3DkNwAJUQdHvsmY/LJC39QJ1NLkq3MqQu9ZrEvzCQQ/Rz+Fi
 anRiWE/43sorKSDNulen2U3Gqcme4iuCTur7j0wKWUBNctYdpk+e/yB0muDkYmTqNPsu
 LpKBzpu1zzJ2cgN7j851MMdNe8ZHYYd0WfvKArRghBTwkMyIZ5nH6m4lC6kvHvRHqrQj
 pPZ/AiytAlDP/FUkdnlQXfylm9NTStjdbJ9tD0keCziPDCggTcZQe4LBYNmZpNso3tJR
 jrHA==
X-Gm-Message-State: AC+VfDyliGxdPOa/nvxt1UskabvgSfC6Vg3Q0KNxnXFFBEqhVI0jBEGg
 218JKW3HdjvP517L5+YlhEAcRd6vXgFoqaLNwUs=
X-Google-Smtp-Source: ACHHUZ59fwh1Hx9scR5oq7UpaSTdZ+KKHHDL3NMDHkWcCNrMxJv9NE0Hc0SF8nV28gt8/gqkYrpn6iAcXzfSqNKiNi4=
X-Received: by 2002:a67:fbda:0:b0:435:84bc:805a with SMTP id
 o26-20020a67fbda000000b0043584bc805amr76613vsr.25.1685067815360; Thu, 25 May
 2023 19:23:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230523135939.299246-1-liweiwei@iscas.ac.cn>
 <20230523135939.299246-6-liweiwei@iscas.ac.cn>
In-Reply-To: <20230523135939.299246-6-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 26 May 2023 12:23:09 +1000
Message-ID: <CAKmqyKOAo=NW+r0cHtt=Pr=766wZg1NGUFRCFBW4qQ0LaTfYVw@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] target/riscv: Use true diff for gen_pc_plus_diff
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92b;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92b.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Wed, May 24, 2023 at 12:14=E2=80=AFAM Weiwei Li <liweiwei@iscas.ac.cn> w=
rote:
>
> Reduce reliance on absolute values by using true pc difference for
> gen_pc_plus_diff() to prepare for PC-relative translation.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvi.c.inc   |  6 ++----
>  target/riscv/insn_trans/trans_rvzce.c.inc |  2 +-
>  target/riscv/translate.c                  | 13 ++++++-------
>  3 files changed, 9 insertions(+), 12 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_=
trans/trans_rvi.c.inc
> index f9f4d25cda..d6eef67b45 100644
> --- a/target/riscv/insn_trans/trans_rvi.c.inc
> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> @@ -158,7 +158,6 @@ static bool gen_branch(DisasContext *ctx, arg_b *a, T=
CGCond cond)
>      TCGLabel *l =3D gen_new_label();
>      TCGv src1 =3D get_gpr(ctx, a->rs1, EXT_SIGN);
>      TCGv src2 =3D get_gpr(ctx, a->rs2, EXT_SIGN);
> -    target_ulong next_pc;
>
>      if (get_xl(ctx) =3D=3D MXL_RV128) {
>          TCGv src1h =3D get_gprh(ctx, a->rs1);
> @@ -175,11 +174,10 @@ static bool gen_branch(DisasContext *ctx, arg_b *a,=
 TCGCond cond)
>
>      gen_set_label(l); /* branch taken */
>
> -    next_pc =3D ctx->base.pc_next + a->imm;
> -    if (!ctx->cfg_ptr->ext_zca && (next_pc & 0x3)) {
> +    if (!ctx->cfg_ptr->ext_zca && (a->imm & 0x3)) {
>          /* misaligned */
>          TCGv target_pc =3D tcg_temp_new();
> -        gen_pc_plus_diff(target_pc, ctx, next_pc);
> +        gen_pc_plus_diff(target_pc, ctx, a->imm);
>          gen_exception_inst_addr_mis(ctx, target_pc);
>      } else {
>          gen_goto_tb(ctx, 0, a->imm);
> diff --git a/target/riscv/insn_trans/trans_rvzce.c.inc b/target/riscv/ins=
n_trans/trans_rvzce.c.inc
> index 5732d782f7..450b79dcbc 100644
> --- a/target/riscv/insn_trans/trans_rvzce.c.inc
> +++ b/target/riscv/insn_trans/trans_rvzce.c.inc
> @@ -297,7 +297,7 @@ static bool trans_cm_jalt(DisasContext *ctx, arg_cm_j=
alt *a)
>       * Update pc to current for the non-unwinding exception
>       * that might come from cpu_ld*_code() in the helper.
>       */
> -    tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
> +    gen_update_pc(ctx, 0);
>      gen_helper_cm_jalt(cpu_pc, cpu_env, tcg_constant_i32(a->index));
>
>      /* c.jt vs c.jalt depends on the index. */
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index b01aa48f04..c6ae489788 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -224,8 +224,10 @@ static void decode_save_opc(DisasContext *ctx)
>  }
>
>  static void gen_pc_plus_diff(TCGv target, DisasContext *ctx,
> -                             target_ulong dest)
> +                             target_long diff)
>  {
> +    target_ulong dest =3D ctx->base.pc_next + diff;
> +
>      if (get_xl(ctx) =3D=3D MXL_RV32) {
>          dest =3D (int32_t)dest;
>      }
> @@ -234,7 +236,7 @@ static void gen_pc_plus_diff(TCGv target, DisasContex=
t *ctx,
>
>  static void gen_update_pc(DisasContext *ctx, target_long diff)
>  {
> -    gen_pc_plus_diff(cpu_pc, ctx, ctx->base.pc_next + diff);
> +    gen_pc_plus_diff(cpu_pc, ctx, diff);
>  }
>
>  static void generate_exception(DisasContext *ctx, int excp)
> @@ -545,14 +547,11 @@ static void gen_set_fpr_d(DisasContext *ctx, int re=
g_num, TCGv_i64 t)
>
>  static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
>  {
> -    target_ulong next_pc;
> -
>      /* check misaligned: */
> -    next_pc =3D ctx->base.pc_next + imm;
>      if (!ctx->cfg_ptr->ext_zca) {
> -        if ((next_pc & 0x3) !=3D 0) {
> +        if ((imm & 0x3) !=3D 0) {
>              TCGv target_pc =3D tcg_temp_new();
> -            gen_pc_plus_diff(target_pc, ctx, next_pc);
> +            gen_pc_plus_diff(target_pc, ctx, imm);
>              gen_exception_inst_addr_mis(ctx, target_pc);
>              return;
>          }
> --
> 2.25.1
>
>

