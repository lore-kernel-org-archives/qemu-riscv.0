Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2781BC4332F
	for <qemu-riscv@archiver.kernel.org>; Mon, 30 Oct 2023 03:51:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qxJJ0-0000nc-T5; Sun, 29 Oct 2023 23:51:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qxJIz-0000nD-Bn; Sun, 29 Oct 2023 23:51:09 -0400
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qxJIw-0002V6-Vb; Sun, 29 Oct 2023 23:51:08 -0400
Received: by mail-vs1-xe2e.google.com with SMTP id
 ada2fe7eead31-457c25de456so1447377137.2; 
 Sun, 29 Oct 2023 20:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698637865; x=1699242665; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FNgm9KmeEktE0mUC0petXRXZglKDqWNm9v5NyP2exDA=;
 b=jE2+kzWYfCTkmAiJTqkPx1Om28TPgLK1vptf6IGYeomPiY1x4OExXcEWSyTm+JF04q
 7+DJAoVif5SPgdIhHjv5/SP1NFHMNPSLNsmsJvKdO0jNMlFOnOCLfuDPFPaEuhb/WOsW
 K0tTpzWpW313bnxsrEKEvRYhIHy0ZAn8Ta8VZmPIfeDxtJvjJzEwxjX8it+StMO+CBai
 f9PHWHLfDjOrGkrJgFQ1Mdk6MJusohHnNX3hWiR/7Yx+6dwDda64UoTPkbPflRkKfKjG
 nqoDafrXmG28ILI8rsbW6At3wU/LvKO+3ed0c1WMElJb3/Hc8TIcHUEGheM5x+CuONyg
 WzSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698637865; x=1699242665;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FNgm9KmeEktE0mUC0petXRXZglKDqWNm9v5NyP2exDA=;
 b=VC131TtIk4gQvY0+USits3tpST4OgcLBb1Bvbjz0btOpToVaEgPIF+ItETvXo7WFYl
 sCCLctL3wRMTstWfPyVElxK/n+aXficdMhtjqILd/HSkNeiLjP4Rnjfceb1cqqGPE6lq
 sVgMN2iOeZSwP9YKSzytGA9veiSULC8XfeAbazyhhIqKODdyQ3/mGM/oyL9w/3RX0Tgz
 gl39A13ztJiX6djyC6WggGkcKvIeQ+6IUfJSMI5WcTEgNshH3F0aS8UFBDYO3UDspcuj
 LW9PH5DH0m3aAC5Wq4AYy+Qhnk7Xifym3RvhoTSdHzRYvUIMuvdVYPmBzXQMz1Hsfr7x
 5eIg==
X-Gm-Message-State: AOJu0YzYq9TSG522x6TUy/mIcPrZ9Qs97u901PTr9nCjGI7HFXR0KvNT
 PoWJo0k/eDVS9SAJbw0dPG9h9QLyT8TyLVio460=
X-Google-Smtp-Source: AGHT+IH3z0Pgd9jF0y7vm1tZ5u+H60fubHBxmKrpJ3HpSpSJuy7ZRL9bnbbgjjKTD98vwx52EHXnfnughpGueDFLgxQ=
X-Received: by 2002:a67:e045:0:b0:457:ca74:a3d9 with SMTP id
 n5-20020a67e045000000b00457ca74a3d9mr4423826vsl.4.1698637865497; Sun, 29 Oct
 2023 20:51:05 -0700 (PDT)
MIME-Version: 1.0
References: <20231028085427.707060-1-dbarboza@ventanamicro.com>
 <20231028085427.707060-12-dbarboza@ventanamicro.com>
In-Reply-To: <20231028085427.707060-12-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 30 Oct 2023 13:50:38 +1000
Message-ID: <CAKmqyKOAzdJ9gPfauVVDep3Enuac4cM3On0=fewkpmzGpMuhPA@mail.gmail.com>
Subject: Re: [PATCH v6 11/12] target/riscv/tcg: honor user choice for G MISA
 bits
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2e;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2e.google.com
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

On Sat, Oct 28, 2023 at 6:56=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> RVG behaves like a profile: a single flag enables a set of bits. Right
> now we're considering user choice when handling RVG and zicsr/zifencei
> and ignoring user choice on MISA bits.
>
> We'll add user warnings for profiles when the user disables its
> mandatory extensions in the next patch. We'll do the same thing with RVG
> now to keep consistency between RVG and profile handling.
>
> First and foremost, create a new RVG only helper to avoid clogging
> riscv_cpu_validate_set_extensions(). We do not want to annoy users with
> RVG warnings like we did in the past (see 9b9741c38f), thus we'll only
> warn if RVG was user set and the user disabled a RVG extension in the
> command line.
>
> For every RVG MISA bit (IMAFD), zicsr and zifencei, the logic then
> becomes:
>
> - if enabled, do nothing;
> - if disabled and not user set, enable it;
> - if disabled and user set, throw a warning that it's a RVG mandatory
>   extension.
>
> This same logic will be used for profiles in the next patch.
>
> Note that this is a behavior change, where we would error out if the
> user disabled either zicsr or zifencei. As long as users are explicitly
> disabling things in the command line we'll let them have a go at it, at
> least in this step. We'll error out later in the validation if needed.
>
> Other notable changes from the previous RVG code:
>
> - use riscv_cpu_write_misa_bit() instead of manually updating both
>   env->misa_ext and env->misa_ext_mask;
>
> - set zicsr and zifencei directly. We're already checking if they
>   were user set and priv version will never fail for these
>   extensions, making cpu_cfg_ext_auto_update() redundant.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/tcg/tcg-cpu.c | 73 +++++++++++++++++++++++++-------------
>  1 file changed, 48 insertions(+), 25 deletions(-)
>
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 3a96b1f476..953e8432d6 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -42,6 +42,12 @@ static bool cpu_cfg_ext_is_user_set(uint32_t ext_offse=
t)
>                                   GUINT_TO_POINTER(ext_offset));
>  }
>
> +static bool cpu_misa_ext_is_user_set(uint32_t misa_bit)
> +{
> +    return g_hash_table_contains(misa_ext_user_opts,
> +                                 GUINT_TO_POINTER(misa_bit));
> +}
> +
>  static void cpu_cfg_ext_add_user_opt(uint32_t ext_offset, bool value)
>  {
>      g_hash_table_insert(multi_ext_user_opts, GUINT_TO_POINTER(ext_offset=
),
> @@ -303,6 +309,46 @@ static void riscv_cpu_validate_named_features(RISCVC=
PU *cpu)
>      riscv_cpu_validate_zic64b(cpu);
>  }
>
> +static void riscv_cpu_validate_g(RISCVCPU *cpu)
> +{
> +    const char *warn_msg =3D "RVG mandates disabled extension %s";
> +    uint32_t g_misa_bits[] =3D {RVI, RVM, RVA, RVF, RVD};
> +    bool send_warn =3D cpu_misa_ext_is_user_set(RVG);
> +
> +    for (int i =3D 0; i < ARRAY_SIZE(g_misa_bits); i++) {
> +        uint32_t bit =3D g_misa_bits[i];
> +
> +        if (riscv_has_ext(&cpu->env, bit)) {
> +            continue;
> +        }
> +
> +        if (!cpu_misa_ext_is_user_set(bit)) {
> +            riscv_cpu_write_misa_bit(cpu, bit, true);
> +            continue;
> +        }
> +
> +        if (send_warn) {
> +            warn_report(warn_msg, riscv_get_misa_ext_name(bit));
> +        }
> +    }
> +
> +    if (!cpu->cfg.ext_zicsr) {
> +        if (!cpu_cfg_ext_is_user_set(CPU_CFG_OFFSET(ext_zicsr))) {
> +            cpu->cfg.ext_zicsr =3D true;
> +        } else if (send_warn) {
> +            warn_report(warn_msg, "zicsr");
> +        }
> +    }
> +
> +    if (!cpu->cfg.ext_zifencei) {
> +        if (!cpu_cfg_ext_is_user_set(CPU_CFG_OFFSET(ext_zifencei))) {
> +            cpu->cfg.ext_zifencei =3D true;
> +        } else if (send_warn) {
> +            warn_report(warn_msg, "zifencei");
> +        }
> +    }
> +}
> +
>  /*
>   * Check consistency between chosen extensions while setting
>   * cpu->cfg accordingly.
> @@ -312,31 +358,8 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu=
, Error **errp)
>      CPURISCVState *env =3D &cpu->env;
>      Error *local_err =3D NULL;
>
> -    /* Do some ISA extension error checking */
> -    if (riscv_has_ext(env, RVG) &&
> -        !(riscv_has_ext(env, RVI) && riscv_has_ext(env, RVM) &&
> -          riscv_has_ext(env, RVA) && riscv_has_ext(env, RVF) &&
> -          riscv_has_ext(env, RVD) &&
> -          cpu->cfg.ext_zicsr && cpu->cfg.ext_zifencei)) {
> -
> -        if (cpu_cfg_ext_is_user_set(CPU_CFG_OFFSET(ext_zicsr)) &&
> -            !cpu->cfg.ext_zicsr) {
> -            error_setg(errp, "RVG requires Zicsr but user set Zicsr to f=
alse");
> -            return;
> -        }
> -
> -        if (cpu_cfg_ext_is_user_set(CPU_CFG_OFFSET(ext_zifencei)) &&
> -            !cpu->cfg.ext_zifencei) {
> -            error_setg(errp, "RVG requires Zifencei but user set "
> -                       "Zifencei to false");
> -            return;
> -        }
> -
> -        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zicsr), true);
> -        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zifencei), true)=
;
> -
> -        env->misa_ext |=3D RVI | RVM | RVA | RVF | RVD;
> -        env->misa_ext_mask |=3D RVI | RVM | RVA | RVF | RVD;
> +    if (riscv_has_ext(env, RVG)) {
> +        riscv_cpu_validate_g(cpu);
>      }
>
>      if (riscv_has_ext(env, RVI) && riscv_has_ext(env, RVE)) {
> --
> 2.41.0
>
>

