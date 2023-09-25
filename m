Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2953ECE7A8B
	for <qemu-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 02:01:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qkauJ-000513-81; Sun, 24 Sep 2023 22:01:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qkauI-00050W-6f; Sun, 24 Sep 2023 22:01:06 -0400
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qkauG-0001lb-Hu; Sun, 24 Sep 2023 22:01:05 -0400
Received: by mail-ua1-x934.google.com with SMTP id
 a1e0cc1a2514c-7ab30cee473so1149544241.2; 
 Sun, 24 Sep 2023 19:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695607263; x=1696212063; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jYM2ME35aALt+7qcdWzPbYdy777SvxGugGFiwVlEpko=;
 b=XSV8gnlqS3GZyRVL52siDZN36U/DAhTtKWu5mqQgCOIzx3Aypn8mbKFv2B9pF1zmM2
 ZgFuykPOGT5geHnbjyLjWh4stEpbod93syU3a3u4KqSMjZb6ibkObNY4ZyBOf/S/lmIq
 BAOvNGA9JbPiexEth9xF7KSuiHd3jBhBbgr2t9/v0WJQUfwgwOEVoh1Tz47y/58z9CVo
 XqfA2LFHrek1s/5DvxwbmVUFbnqMbgGIcHDVqrk+5rJ2ezI/iSWlhtt7VHLQk8NyOoVh
 tWi5aLxm+6wLBsR6cDC9Q2DDi7hp/z3bYmBOGnI6UK7FWl5vK+Tf4GiecLUQCtwyOCEe
 CvIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695607263; x=1696212063;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jYM2ME35aALt+7qcdWzPbYdy777SvxGugGFiwVlEpko=;
 b=Xy9T7p1H31E3ULUGBNJ3O4O7+g1Cf5Y27LI4ISW3Jtff5KVbdbzLZvY2LRtlCfUUTH
 ejLaMcWYw5ca9ApDNCGbtaoyx31tkWRixgICtS/cFbVCg+WM9w3W9VHdSm3TimQyz5Ls
 5kHmycgtwXCDGN0SAHBx3rdZnTgV44o7PXPjIQAOBZEfYQyU6z9pQDW1z62I6iRxTfgi
 dvUtpH1QK08xQUnh+lrZO5jL+crRM1h9w3jZunZQLViKrU0M5POAY57FsjCO2MSlHl2C
 qhFig4G7Zcax2/feMXXgRaCDD2BRCsAHznoZhwdqP0tDM728Knq1zj7+361Bo19fDNpY
 Xx/Q==
X-Gm-Message-State: AOJu0YzKjMcTyxVtsbg2wPm+4NFkfSmZt5/1RlOVI5Uz+6jk+ijHHrNW
 PIVv2h9v3Vgnzb1FUGyejxp2YAyTIrX4dgiC//k=
X-Google-Smtp-Source: AGHT+IFwfyxxnvzx97ectx6LH6HIfAcBw+hcRq0mT5B49zNNnk5ICH63TIHgfPeZTKVA821bOUqeQgOVA3wwtHobgoA=
X-Received: by 2002:a67:b447:0:b0:452:5f3f:b394 with SMTP id
 c7-20020a67b447000000b004525f3fb394mr1784445vsm.5.1695607263063; Sun, 24 Sep
 2023 19:01:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230920112020.651006-1-dbarboza@ventanamicro.com>
 <20230920112020.651006-20-dbarboza@ventanamicro.com>
In-Reply-To: <20230920112020.651006-20-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 25 Sep 2023 12:00:36 +1000
Message-ID: <CAKmqyKNt2YLpLEQHApxos_UnKpOx-36Z0oct-fjoG-6SO9Oo1g@mail.gmail.com>
Subject: Re: [PATCH v3 19/19] target/riscv/cpu: move priv spec functions to
 tcg-cpu.c
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, philmd@linaro.org, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::934;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x934.google.com
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

On Wed, Sep 20, 2023 at 9:24=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Priv spec validation is TCG specific. Move it to the TCG accel class.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c         | 38 --------------------------------------
>  target/riscv/cpu.h         |  2 --
>  target/riscv/tcg/tcg-cpu.c | 38 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 38 insertions(+), 40 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index e97ba3df93..eeeb08a35a 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -172,21 +172,6 @@ void isa_ext_update_enabled(RISCVCPU *cpu, uint32_t =
ext_offset, bool en)
>      *ext_enabled =3D en;
>  }
>
> -int cpu_cfg_ext_get_min_version(uint32_t ext_offset)
> -{
> -    const RISCVIsaExtData *edata;
> -
> -    for (edata =3D isa_edata_arr; edata && edata->name; edata++) {
> -        if (edata->ext_enable_offset !=3D ext_offset) {
> -            continue;
> -        }
> -
> -        return edata->min_version;
> -    }
> -
> -    g_assert_not_reached();
> -}
> -
>  const char * const riscv_int_regnames[] =3D {
>      "x0/zero", "x1/ra",  "x2/sp",  "x3/gp",  "x4/tp",  "x5/t0",   "x6/t1=
",
>      "x7/t2",   "x8/s0",  "x9/s1",  "x10/a0", "x11/a1", "x12/a2",  "x13/a=
3",
> @@ -925,29 +910,6 @@ static void riscv_cpu_disas_set_info(CPUState *s, di=
sassemble_info *info)
>      }
>  }
>
> -void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
> -{
> -    CPURISCVState *env =3D &cpu->env;
> -    const RISCVIsaExtData *edata;
> -
> -    /* Force disable extensions if priv spec version does not match */
> -    for (edata =3D isa_edata_arr; edata && edata->name; edata++) {
> -        if (isa_ext_is_enabled(cpu, edata->ext_enable_offset) &&
> -            (env->priv_ver < edata->min_version)) {
> -            isa_ext_update_enabled(cpu, edata->ext_enable_offset, false)=
;
> -#ifndef CONFIG_USER_ONLY
> -            warn_report("disabling %s extension for hart 0x" TARGET_FMT_=
lx
> -                        " because privilege spec version does not match"=
,
> -                        edata->name, env->mhartid);
> -#else
> -            warn_report("disabling %s extension because "
> -                        "privilege spec version does not match",
> -                        edata->name);
> -#endif
> -        }
> -    }
> -}
> -
>  #ifndef CONFIG_USER_ONLY
>  static void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp)
>  {
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 3dfcd0732f..219fe2e9b5 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -711,9 +711,7 @@ enum riscv_pmu_event_idx {
>  /* used by tcg/tcg-cpu.c*/
>  void isa_ext_update_enabled(RISCVCPU *cpu, uint32_t ext_offset, bool en)=
;
>  bool isa_ext_is_enabled(RISCVCPU *cpu, uint32_t ext_offset);
> -int cpu_cfg_ext_get_min_version(uint32_t ext_offset);
>  void riscv_cpu_set_misa(CPURISCVState *env, RISCVMXL mxl, uint32_t ext);
> -void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu);
>
>  typedef struct RISCVCPUMultiExtConfig {
>      const char *name;
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index c326ab37a2..8c052d6fcd 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -99,6 +99,21 @@ static const struct TCGCPUOps riscv_tcg_ops =3D {
>  #endif /* !CONFIG_USER_ONLY */
>  };
>
> +static int cpu_cfg_ext_get_min_version(uint32_t ext_offset)
> +{
> +    const RISCVIsaExtData *edata;
> +
> +    for (edata =3D isa_edata_arr; edata && edata->name; edata++) {
> +        if (edata->ext_enable_offset !=3D ext_offset) {
> +            continue;
> +        }
> +
> +        return edata->min_version;
> +    }
> +
> +    g_assert_not_reached();
> +}
> +
>  static void cpu_cfg_ext_auto_update(RISCVCPU *cpu, uint32_t ext_offset,
>                                      bool value)
>  {
> @@ -226,6 +241,29 @@ static void riscv_cpu_validate_v(CPURISCVState *env,=
 RISCVCPUConfig *cfg,
>      }
>  }
>
> +static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
> +{
> +    CPURISCVState *env =3D &cpu->env;
> +    const RISCVIsaExtData *edata;
> +
> +    /* Force disable extensions if priv spec version does not match */
> +    for (edata =3D isa_edata_arr; edata && edata->name; edata++) {
> +        if (isa_ext_is_enabled(cpu, edata->ext_enable_offset) &&
> +            (env->priv_ver < edata->min_version)) {
> +            isa_ext_update_enabled(cpu, edata->ext_enable_offset, false)=
;
> +#ifndef CONFIG_USER_ONLY
> +            warn_report("disabling %s extension for hart 0x" TARGET_FMT_=
lx
> +                        " because privilege spec version does not match"=
,
> +                        edata->name, env->mhartid);
> +#else
> +            warn_report("disabling %s extension because "
> +                        "privilege spec version does not match",
> +                        edata->name);
> +#endif
> +        }
> +    }
> +}
> +
>  /*
>   * Check consistency between chosen extensions while setting
>   * cpu->cfg accordingly.
> --
> 2.41.0
>
>

