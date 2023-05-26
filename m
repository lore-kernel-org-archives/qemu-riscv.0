Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0128C77B7A
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 May 2023 01:13:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q2M0c-0001uO-HR; Thu, 25 May 2023 21:12:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q2M0a-0001th-Tj; Thu, 25 May 2023 21:12:44 -0400
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q2M0X-0002SL-0y; Thu, 25 May 2023 21:12:44 -0400
Received: by mail-vk1-xa2d.google.com with SMTP id
 71dfb90a1353d-456d534f403so124713e0c.2; 
 Thu, 25 May 2023 18:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685063559; x=1687655559;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H4Pg6aqOycgxjb268YS+DNDVyz+mepB2fp3XmDVgTJs=;
 b=lg42V+2FK0yYgKLM5/38Gtj4TJuINrK8ha/savNoqCeFJcqqP24Yg2PxxPtG+7zZVt
 AA1Rb+Z4j30NL82zHsiiON17VMdxuD0xfW/jOG/lj0uk+UO7Wt7YCJbPm8Bi/n6/FRD6
 d7cIwpbijoSZqGPcoHXB3gV43cNOmiIiNpDgXZ31o+4D7tD3276A5Pkltu0r6JMG6r4I
 RVov7nl/IQ66G9i1AB9O8aI0foceVBAyhdB40CY+Gh3d1oqmKqBF4D9ijrsspGIwIWpI
 h3T/WaJe6IEbqH1LUjCD2RxaNB8AN9t/JahWSsJHyO6IRYoSAneJrx+ZTuBmUuibc3Zr
 R8VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685063559; x=1687655559;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H4Pg6aqOycgxjb268YS+DNDVyz+mepB2fp3XmDVgTJs=;
 b=PciC6rPm3qqN01eZIXEIX2fy0GKAGI6JtIRv63jTa2c5UvCMon7Yl+dc0P0I7eDix/
 lEEtp9w9ulcbUtYht3gjx0Svkb7BZjDE7PcRpj0g8HXY+PkR/01HATJVqKO5QIU8Jxvv
 4KnKqrntzDgWtB+xHQu8en+ku4PLsPEIlnoCa8TDaEQOUzZM46jOrllgu4mQkeE722Ka
 Q2q4FZGgbgj1KzXrpdKavPujPOxlLYRrM92IF599sEyzB4yRDU362h3j/8pI4VzFum7r
 ErcbB78kyb4E7elV42+R6mjLhGeg/dUJ2UvZwOr3mg/XxJmjaKIfAIwv9R3oqLLNdXiZ
 zs2g==
X-Gm-Message-State: AC+VfDwjqhnXe+r8DNTntqUYfo7mYAQkisONLUupbhF8abwjg4cV2yXM
 jKIscFjX+QcAp6a0hziOS51boKU/f40icelcXKDbutrSQXG318OV
X-Google-Smtp-Source: ACHHUZ72Ngta8QtFVCEztpcVOCj3HdAxhKe19y6mULl1O6GHxlCA5g06c8yRae3+QAtcxmr5l0zk2oQw9bZL0Ue43Xs=
X-Received: by 2002:a67:ee12:0:b0:436:e3:f6de with SMTP id
 f18-20020a67ee12000000b0043600e3f6demr57044vsp.13.1685063559472; 
 Thu, 25 May 2023 18:12:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230518175058.2772506-1-mchitale@ventanamicro.com>
 <20230518175058.2772506-3-mchitale@ventanamicro.com>
In-Reply-To: <20230518175058.2772506-3-mchitale@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 26 May 2023 11:12:13 +1000
Message-ID: <CAKmqyKNj0Mp=9Fxo5q=o-4RM8rmh9p2xcaCXJomrRCGBsKe=tQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] target/riscv: Reuse tb->flags.FS
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 Daniel Barboza <dbarboza@ventanamicro.com>, liweiwei@iscas.ac.cn, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2d;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2d.google.com
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

On Fri, May 19, 2023 at 3:51=E2=80=AFAM Mayuresh Chitale
<mchitale@ventanamicro.com> wrote:
>
> When misa.F is 0 tb->flags.FS field is unused and can be used to save
> the current state of smstateen0.FCSR check which is needed by the
> floating point translation routines.
>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_helper.c               | 6 ++++++
>  target/riscv/insn_trans/trans_rvf.c.inc | 7 ++++---
>  2 files changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index b68dcfe7b6..695c189f96 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -119,6 +119,12 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target=
_ulong *pc,
>          vs =3D MIN(vs, get_field(env->mstatus_hs, MSTATUS_VS));
>      }
>
> +    /* With Zfinx, floating point is enabled/disabled by Smstateen. */
> +    if (!riscv_has_ext(env, RVF)) {
> +        fs =3D (smstateen_acc_ok(env, 0, SMSTATEEN0_FCSR) =3D=3D RISCV_E=
XCP_NONE)
> +             ? EXT_STATUS_DIRTY : EXT_STATUS_DISABLED;
> +    }
> +
>      if (cpu->cfg.debug && !icount_enabled()) {
>          flags =3D FIELD_DP32(flags, TB_FLAGS, ITRIGGER, env->itrigger_en=
abled);
>      }
> diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/insn_=
trans/trans_rvf.c.inc
> index b2de4fcf3f..509a6acffe 100644
> --- a/target/riscv/insn_trans/trans_rvf.c.inc
> +++ b/target/riscv/insn_trans/trans_rvf.c.inc
> @@ -19,9 +19,10 @@
>   */
>
>  #define REQUIRE_FPU do {\
> -    if (ctx->mstatus_fs =3D=3D EXT_STATUS_DISABLED) \
> -        if (!ctx->cfg_ptr->ext_zfinx) \
> -            return false; \
> +    if (ctx->mstatus_fs =3D=3D EXT_STATUS_DISABLED) {                   =
        \
> +        ctx->virt_inst_excp =3D ctx->virt_enabled && ctx->cfg_ptr->ext_z=
finx; \
> +        return false;                                                   =
    \
> +    }                                                                   =
    \
>  } while (0)
>
>  #define REQUIRE_ZFINX_OR_F(ctx) do {\
> --
> 2.34.1
>

