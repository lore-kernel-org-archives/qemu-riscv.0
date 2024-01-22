Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01020C47DD9
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 02:56:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rRkUZ-000194-Q2; Sun, 21 Jan 2024 21:56:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRkUX-00017y-V2; Sun, 21 Jan 2024 21:56:53 -0500
Received: from mail-vk1-xa2f.google.com ([2607:f8b0:4864:20::a2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRkUW-0003Gj-F5; Sun, 21 Jan 2024 21:56:53 -0500
Received: by mail-vk1-xa2f.google.com with SMTP id
 71dfb90a1353d-4b72e63821eso2172667e0c.1; 
 Sun, 21 Jan 2024 18:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705892211; x=1706497011; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nTbR40hU+Tj9xgHvu3bznXrsZhKdFVs4mv4Eov5Unbg=;
 b=O+siOyLGlugFnNyt4s7N9+5DuoMEV/G5bMf90B1v4c12gH0VqEBJGZb8AnJhEYw0D0
 /XU5Ig87EVdCEYMO7jM39SmCE1k5No1WitDM9vV3t2qVnpfojFq8wQLDrI3NWG3f7roX
 0zJWVm2qvTCdFueM+TlED6+zXotFUFyQow1pPokjEMymRAgISBof4+dRFw0MJ4fTtHGF
 UBfc6N/c9hgHJgjuceXLJR7mjm4kDL7oRMZd/7i4HDHXq74Jt9dYodjX1Q1Z+gp5+6Fn
 zPMbLFeIr+N9s6HPsBABbqaiYnDLDCN7qLtJ5LiUgs2pdtN6B6Bxoyu3iPf/MrpoFCMt
 2Y4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705892211; x=1706497011;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nTbR40hU+Tj9xgHvu3bznXrsZhKdFVs4mv4Eov5Unbg=;
 b=ClIIfl0xbKWoJJo77f1hwoNMcAQfILz/A2jGTVnNNUJx9QNrkIZAYYs7eRkQQRBfKN
 HlhkeIzskMjDrbwS35ZDi7D1kwpwJbsMiSueDlPB8vfLa5VenmaOG4Fua7VI+dp1jeKo
 WhAORNDLCvtUscoyNmnXndVDiUhaPq13VdJ49weys6z2tLW/6oSTL6jUaEkXfgLRhoHC
 wOZbHRbuUPY/IyPWqe6bR6ev75DCOSGXW1+ErgSpOA7d+7IveJI8DnQXw/Dpu4NL3IVH
 pyo4oPGqu+/kiPZqkfzobhmmYarW1woK0jmGUZ5FIqAXeFevAKwVwFBrU5a9BUC2Mvl/
 NRsA==
X-Gm-Message-State: AOJu0YwikCcbCB663T5pOc8V3P05CXnkTBPNcpPhvv0a5fhfviH4VxHo
 u/U5noxIZpNz/EFZRF9NXcDOPRYQvR27Xy8Q4w9pOr1CRjeGcVROQN8WwH4GDI20JPYGtmaiB1N
 E3ByoMWvJIS4t3VAUMCQFS8Ajrvw=
X-Google-Smtp-Source: AGHT+IEwN1q6duFDMQt2VIxFjQ0t53vAYRP9ebHstRcWIFC+Igcun1vwxiCMyUMzwaOC9VPdYE7nN+T4IUe/dtSAVjM=
X-Received: by 2002:ac5:cdeb:0:b0:4b7:3b27:7c78 with SMTP id
 v11-20020ac5cdeb000000b004b73b277c78mr2318712vkn.15.1705892211207; Sun, 21
 Jan 2024 18:56:51 -0800 (PST)
MIME-Version: 1.0
References: <20240116205817.344178-1-dbarboza@ventanamicro.com>
 <20240116205817.344178-5-dbarboza@ventanamicro.com>
In-Reply-To: <20240116205817.344178-5-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Jan 2024 12:56:25 +1000
Message-ID: <CAKmqyKPqCOHKvtDX+YFNBWFHO8e8E4jPa=KLG=LGPtK-Kafqyg@mail.gmail.com>
Subject: Re: [PATCH v3 04/13] target/riscv/insn_trans/trans_rvbf16.c.inc: use
 cpu->cfg.vlenb
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, richard.henderson@linaro.org, max.chou@sifive.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2f;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2f.google.com
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

On Wed, Jan 17, 2024 at 8:17=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Use ctx->cfg_ptr->vlenb instead of ctx->cfg_ptr->vlen / 8.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvbf16.c.inc | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvbf16.c.inc b/target/riscv/in=
sn_trans/trans_rvbf16.c.inc
> index 4e39c00884..8ee99df3f3 100644
> --- a/target/riscv/insn_trans/trans_rvbf16.c.inc
> +++ b/target/riscv/insn_trans/trans_rvbf16.c.inc
> @@ -83,8 +83,8 @@ static bool trans_vfncvtbf16_f_f_w(DisasContext *ctx, a=
rg_vfncvtbf16_f_f_w *a)
>          data =3D FIELD_DP32(data, VDATA, VMA, ctx->vma);
>          tcg_gen_gvec_3_ptr(vreg_ofs(ctx, a->rd), vreg_ofs(ctx, 0),
>                             vreg_ofs(ctx, a->rs2), tcg_env,
> -                           ctx->cfg_ptr->vlen / 8,
> -                           ctx->cfg_ptr->vlen / 8, data,
> +                           ctx->cfg_ptr->vlenb,
> +                           ctx->cfg_ptr->vlenb, data,
>                             gen_helper_vfncvtbf16_f_f_w);
>          mark_vs_dirty(ctx);
>          gen_set_label(over);
> @@ -112,8 +112,8 @@ static bool trans_vfwcvtbf16_f_f_v(DisasContext *ctx,=
 arg_vfwcvtbf16_f_f_v *a)
>          data =3D FIELD_DP32(data, VDATA, VMA, ctx->vma);
>          tcg_gen_gvec_3_ptr(vreg_ofs(ctx, a->rd), vreg_ofs(ctx, 0),
>                             vreg_ofs(ctx, a->rs2), tcg_env,
> -                           ctx->cfg_ptr->vlen / 8,
> -                           ctx->cfg_ptr->vlen / 8, data,
> +                           ctx->cfg_ptr->vlenb,
> +                           ctx->cfg_ptr->vlenb, data,
>                             gen_helper_vfwcvtbf16_f_f_v);
>          mark_vs_dirty(ctx);
>          gen_set_label(over);
> @@ -143,8 +143,8 @@ static bool trans_vfwmaccbf16_vv(DisasContext *ctx, a=
rg_vfwmaccbf16_vv *a)
>          tcg_gen_gvec_4_ptr(vreg_ofs(ctx, a->rd), vreg_ofs(ctx, 0),
>                             vreg_ofs(ctx, a->rs1),
>                             vreg_ofs(ctx, a->rs2), tcg_env,
> -                           ctx->cfg_ptr->vlen / 8,
> -                           ctx->cfg_ptr->vlen / 8, data,
> +                           ctx->cfg_ptr->vlenb,
> +                           ctx->cfg_ptr->vlenb, data,
>                             gen_helper_vfwmaccbf16_vv);
>          mark_vs_dirty(ctx);
>          gen_set_label(over);
> --
> 2.43.0
>
>

