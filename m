Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7131AC47DD3
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 05:37:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rRmz5-0003cc-Jh; Mon, 22 Jan 2024 00:36:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRmz4-0003a1-0Y; Mon, 22 Jan 2024 00:36:34 -0500
Received: from mail-vk1-xa2f.google.com ([2607:f8b0:4864:20::a2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRmz2-0002vY-82; Mon, 22 Jan 2024 00:36:33 -0500
Received: by mail-vk1-xa2f.google.com with SMTP id
 71dfb90a1353d-4bb27800a02so372350e0c.3; 
 Sun, 21 Jan 2024 21:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705901790; x=1706506590; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xqD5zxL0e5UaXflKsevbduwbytcsyi/DU9gP+F8sehM=;
 b=mg1SyUd32Pl75R3hWwLJUegAmMCmB72dEkIzi02BzShkGFxdDWKsBF+ZlvVz9hkF0F
 xLIT/UvZBGbkccH5dlr2ONj4NMx9Ea6dMwWF48jIwzulnXe2+QXzq5L+TPrOP1m8MwpL
 t5Y+5hF1jbXj558m+/LGK2KygWTo40sy2Hn4cBFAqpgOPf1rmDOf0QuDYi9vd+OfeGms
 xelCKm97M820q7+xlsw4W80f+FOYGbVZjMcRD2Pvg9cGgafBCysYfqpkDlY8sO1yzL4A
 nW64XxHGRbkYL06erp1lyZZfF5LPsRPwzHajQKsR4XVy/s5UVRwTdKTeq6DEcarMuosx
 9j7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705901790; x=1706506590;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xqD5zxL0e5UaXflKsevbduwbytcsyi/DU9gP+F8sehM=;
 b=QTyIBc4zvPb1e/WtOrjhVkHt8F5M9nyema6H2uVBpf5A9TancyTOZZn80ZkVNNrVwt
 idv7N3ujp8VYy8+YqgoxRMAXHJluSsitQiQaDAdZBCPYSeJDcUj3ObPxezxtOBTM8Gpx
 Qmayi4eFr51lvc82gLSXCO+vMLRjnJY68w1bUaEABmfN4DPUfiiJ3muri7yJKKXYy+lp
 0sTytDGyqUnr7Gxdo6tG7+lZHsk042I64c5d4AGh4yudbITd3eTfVqQfh7vjX7Mjax4I
 ZlloJSwsYrYGKxfDy2m0ImfKuyEkOuZDUdjxg6eti+5eUFeijCMulfE3hqjgJYeZlkNK
 gUdQ==
X-Gm-Message-State: AOJu0YwZ0eg6cLGwHb+/EAoo0D+tvRHQGxLTJGypo58zO+QOitQHEzMk
 asvIbLiKni8ENAbOkKLUcwUf44+pzuaKRPbmPIdzubaS2wKYcG/ArKtf//yaPJ+H8DZ48laN9UJ
 V51ce3ZppVWdEUnImHps/ArR3TA9vqhRyzH0=
X-Google-Smtp-Source: AGHT+IHJuPs5OWy9zkNhGtTE5R7DgojWddJQ+n3AollkCHsq2MJ+ET7WX9iwS0+twE1NH50tblrDjxqUVRXhCarYs7c=
X-Received: by 2002:ac5:c957:0:b0:4b6:b867:c83f with SMTP id
 s23-20020ac5c957000000b004b6b867c83fmr890268vkm.22.1705901790511; Sun, 21 Jan
 2024 21:36:30 -0800 (PST)
MIME-Version: 1.0
References: <20240117142412.1615505-1-hchauhan@ventanamicro.com>
 <20240117142412.1615505-2-hchauhan@ventanamicro.com>
In-Reply-To: <20240117142412.1615505-2-hchauhan@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Jan 2024 15:36:04 +1000
Message-ID: <CAKmqyKN_A8OyHgh0XditVbGr3WH4W1Pn4ohgbkhi28y-c9pCWQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] target/riscv: Convert sdtrig functionality from
 property to an extension
To: Himanshu Chauhan <hchauhan@ventanamicro.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
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

On Thu, Jan 18, 2024 at 12:25=E2=80=AFAM Himanshu Chauhan
<hchauhan@ventanamicro.com> wrote:
>
> The debug trigger (sdtrig) capability is controlled using the debug prope=
rty.
> The sdtrig is an ISA extension and should be treated so. The sdtrig exten=
sion
> may or may not be implemented in a system. Therefore, it must raise an il=
legal
> instruction exception when it is disabled and its CSRs are accessed.
>
> This patch removes the "debug" property and replaces it with ext_sdtrig e=
xtension.
> It also raises an illegal instruction exception when the extension is dis=
abled and
> its CSRs are accessed.
>
> Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
> ---
>  target/riscv/cpu.c        | 7 +++----
>  target/riscv/cpu_cfg.h    | 2 +-
>  target/riscv/cpu_helper.c | 2 +-
>  target/riscv/csr.c        | 2 +-
>  target/riscv/machine.c    | 2 +-
>  5 files changed, 7 insertions(+), 8 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index b07a76ef6b..c770a7e506 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -909,7 +909,7 @@ static void riscv_cpu_reset_hold(Object *obj)
>      set_default_nan_mode(1, &env->fp_status);
>
>  #ifndef CONFIG_USER_ONLY
> -    if (cpu->cfg.debug) {
> +    if (cpu->cfg.ext_sdtrig) {
>          riscv_trigger_reset_hold(env);
>      }
>
> @@ -1068,7 +1068,7 @@ static void riscv_cpu_realize(DeviceState *dev, Err=
or **errp)
>      riscv_cpu_register_gdb_regs_for_features(cs);
>
>  #ifndef CONFIG_USER_ONLY
> -    if (cpu->cfg.debug) {
> +    if (cpu->cfg.ext_sdtrig) {
>          riscv_trigger_realize(&cpu->env);
>      }
>  #endif
> @@ -1393,6 +1393,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_vendor_exts[=
] =3D {
>
>  /* These are experimental so mark with 'x-' */
>  const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] =3D {
> +    MULTI_EXT_CFG_BOOL("x-sdtrig", ext_sdtrig, true),
>      MULTI_EXT_CFG_BOOL("x-smaia", ext_smaia, false),
>      MULTI_EXT_CFG_BOOL("x-ssaia", ext_ssaia, false),
>
> @@ -1480,8 +1481,6 @@ Property riscv_cpu_options[] =3D {
>  };
>
>  static Property riscv_cpu_properties[] =3D {
> -    DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),

We can't do this. We have users of the debug spec already. It is a
ratified spec, we can't drop support for it either.

The debug working group has really backed us into a corner here. The
simplest approach is probably to just implement sdtrig (debug 1.0) and
the original debug (0.13) separately and support both. Then users can
enable which one they prefer

Alistair

> -
>  #ifndef CONFIG_USER_ONLY
>      DEFINE_PROP_UINT64("resetvec", RISCVCPU, env.resetvec, DEFAULT_RSTVE=
C),
>  #endif
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index f4605fb190..341ebf726a 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -109,6 +109,7 @@ struct RISCVCPUConfig {
>      bool ext_zvfbfwma;
>      bool ext_zvfh;
>      bool ext_zvfhmin;
> +    bool ext_sdtrig;
>      bool ext_smaia;
>      bool ext_ssaia;
>      bool ext_sscofpmf;
> @@ -145,7 +146,6 @@ struct RISCVCPUConfig {
>      uint16_t cboz_blocksize;
>      bool mmu;
>      bool pmp;
> -    bool debug;
>      bool misa_w;
>
>      bool short_isa_string;
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index e7e23b34f4..3f7c2f1315 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -126,7 +126,7 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, vaddr *=
pc,
>               ? EXT_STATUS_DIRTY : EXT_STATUS_DISABLED;
>      }
>
> -    if (cpu->cfg.debug && !icount_enabled()) {
> +    if (cpu->cfg.ext_sdtrig && !icount_enabled()) {
>          flags =3D FIELD_DP32(flags, TB_FLAGS, ITRIGGER, env->itrigger_en=
abled);
>      }
>  #endif
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index c50a33397c..8dbb49aa88 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -543,7 +543,7 @@ static RISCVException have_mseccfg(CPURISCVState *env=
, int csrno)
>
>  static RISCVException debug(CPURISCVState *env, int csrno)
>  {
> -    if (riscv_cpu_cfg(env)->debug) {
> +    if (riscv_cpu_cfg(env)->ext_sdtrig) {
>          return RISCV_EXCP_NONE;
>      }
>
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index 72fe2374dc..8f9787a30f 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -231,7 +231,7 @@ static bool debug_needed(void *opaque)
>  {
>      RISCVCPU *cpu =3D opaque;
>
> -    return cpu->cfg.debug;
> +    return cpu->cfg.ext_sdtrig;
>  }
>
>  static int debug_post_load(void *opaque, int version_id)
> --
> 2.34.1
>
>

