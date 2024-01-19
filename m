Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AEF1C47422
	for <qemu-riscv@archiver.kernel.org>; Fri, 19 Jan 2024 03:15:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rQfLa-0001OW-Tr; Thu, 18 Jan 2024 22:15:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1rQfLZ-0001O6-2x
 for qemu-riscv@nongnu.org; Thu, 18 Jan 2024 22:15:09 -0500
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1rQfLX-00079g-3r
 for qemu-riscv@nongnu.org; Thu, 18 Jan 2024 22:15:08 -0500
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-50e7c6f0487so303196e87.3
 for <qemu-riscv@nongnu.org>; Thu, 18 Jan 2024 19:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1705634104; x=1706238904; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ewYh7TiCnUJyWocuthrkYf85P3TaGK6aS5vdYzIN6cg=;
 b=FZIie0JIMjLVJgOkfh3UFqDvOt5osoLQQ66wYMFpksILJnQhH08wBydpPc8oWHvF7o
 cj3qbg7AcVE7vgeSkXEMDiAhr/DreuQHx8Iq5G1UkRHC5XZyefQ21l9mqFUt+dH8rI4g
 26AGW0IdixA9wQyhk+wy+WWjhtjLAGF5eOjFfwKLgauZlra+1Qo6ClVqxpieXV496uaH
 IQNL6jtW9VGanT9XRbGqsK20zm3YGYjqMJOZhdVUcOhEWwo7S/8ta9jiU6kmccOjC8RO
 USeupEsGdNr9L4lEQU902c3zl3jabdjqg/hM1kI6PjkkkGyN2MjwFHksG9aBavB5Xwxr
 hiDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705634104; x=1706238904;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ewYh7TiCnUJyWocuthrkYf85P3TaGK6aS5vdYzIN6cg=;
 b=bowReLoaVsSZptlRleXSjhDFO8np+wpOA2u6aYRrtZL0DtXaWIAe0IEH88Ug6qDBu1
 JFagrY/m8eYKMawsevfeqSPWS5vY7noftN8Y+3FyL3VqD0/eM4LGiiebfJeto68s+A20
 sJAD3+c5VTxPqQKNrCZqjJPTT4sylU24acQmy/vmW8ohRlKus+SxU8uuAFM+ihFwEFS7
 XLZr11T+2UYeadPVQiJo8ml1c2Fkd4cFCQZrlYjbeFnm2AQUEnMUjeeqIw1r/YCqvVCG
 KlmXu5d9xOiISHFkXl0YsufO+5hf3yD9N1/nvwI7ZlDxFZZhBhgZEAul9sibbgC6RCC/
 N/0Q==
X-Gm-Message-State: AOJu0Ywg9Edxn9jTM1EX88X891cbLti+yQAQDNtjQpoWKrXw+qCcBVeO
 n2kY8mEN47qPwyC63oY7JJerJ4fQpE455KVQ7R2opVNjxZx1helR/5Dj8RMNxZEz/w17jR2hYS2
 yY56HDxc8e7TnaGqltV86Q6NfWm2mm6nXfi/Q7Q==
X-Google-Smtp-Source: AGHT+IGg5vrItO7Mrtv1FiuG8brZqB5A9ijQA9teebxKNloUztm8KuALOyowBR0SskAdMgaF3rYg0KJHeyBZU/s3R1A=
X-Received: by 2002:a05:6512:3290:b0:50e:78dd:ef53 with SMTP id
 p16-20020a056512329000b0050e78ddef53mr153523lfe.89.1705634104414; Thu, 18 Jan
 2024 19:15:04 -0800 (PST)
MIME-Version: 1.0
References: <20240117142412.1615505-1-hchauhan@ventanamicro.com>
 <20240117142412.1615505-2-hchauhan@ventanamicro.com>
In-Reply-To: <20240117142412.1615505-2-hchauhan@ventanamicro.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 19 Jan 2024 08:44:51 +0530
Message-ID: <CAK9=C2U40FBJYk3FnW9rK2XJhqedVQyoN4vLVdpsnE_8nW-Ffw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] target/riscv: Convert sdtrig functionality from
 property to an extension
To: Himanshu Chauhan <hchauhan@ventanamicro.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=apatel@ventanamicro.com; helo=mail-lf1-x132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Wed, Jan 17, 2024 at 7:54=E2=80=AFPM Himanshu Chauhan
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

Drop the "x-" because Sdtrig is already frozen and public review has starte=
d.

>      MULTI_EXT_CFG_BOOL("x-smaia", ext_smaia, false),
>      MULTI_EXT_CFG_BOOL("x-ssaia", ext_ssaia, false),
>
> @@ -1480,8 +1481,6 @@ Property riscv_cpu_options[] =3D {
>  };
>
>  static Property riscv_cpu_properties[] =3D {
> -    DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
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

Regards,
Anup

