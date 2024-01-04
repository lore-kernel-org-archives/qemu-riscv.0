Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 814D2C47073
	for <qemu-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 04:04:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLEwz-0002u3-Ul; Wed, 03 Jan 2024 23:03:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLEwy-0002tA-3M; Wed, 03 Jan 2024 23:03:20 -0500
Received: from mail-vk1-xa29.google.com ([2607:f8b0:4864:20::a29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLEww-0001hd-Cv; Wed, 03 Jan 2024 23:03:19 -0500
Received: by mail-vk1-xa29.google.com with SMTP id
 71dfb90a1353d-4b7fc7642fcso8572e0c.0; 
 Wed, 03 Jan 2024 20:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704340997; x=1704945797; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LNNbrXW0IYytj6X/HiHMoOgnrAKBqcs28PZkNLzxkGc=;
 b=C5wBbPES/rfBdc2zQ6o2X/dzOu7ww4T77EynZtk6ElnIOCjqLYfB+AQZhD44oT5c8w
 tLVYdWTfn3Z9VKzn8Sy18/gg7kgLjBivafrknXmal+6oVMiQXGZdo5ww42RL/WtoMp4d
 EdpUlJpMrHtmXm1c+MRR+abOf5tuVRXlFUnX+H31Rtkquy0LOQbL1V2IThUoyjoQIwy3
 HCk13fvMpv7BLPmC+Kpg69U+oeR+XBWSgmEAA27afAMLgv2eosCwatYyCIpiUDT20ZLs
 NVkCoD8Z669Gvg0c7U5oYmQ+Svp4HLcWPp/KBQpxq3lWN+fmk/fZmUvbURCXPjKDIRBh
 ZZUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704340997; x=1704945797;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LNNbrXW0IYytj6X/HiHMoOgnrAKBqcs28PZkNLzxkGc=;
 b=PuIT0Bmmh+l3NAdOGJ5PUaMzc6bdQIBjd/q11X36sWxZuojsnXvacdJkMoBq7sIb+s
 NaTmqJugIWBNQCtgjql57AMWwcrrSPVsTBDb4UKQ5ZmkAOkLOtZUeKMgZRpenJE7Y0+t
 CYO2NmrNy626r3/4O9kaJt+4Ytqwbd8H6fEys78l07V3dx7Bs5DKEp4H8GmSLnldP2wz
 plE6CLPVPiNKZGiCqgZFL6zI4pdIXSopS72S53VcaD0RUnYVvrwn5hopyH7Jplrf5od4
 yb+8EN5Z71aA6qA+zKB44YV1T4X6sF3m2FM5ETnPyNevfHWIn3WGbwWa6YFcuP2t6yRr
 R1vA==
X-Gm-Message-State: AOJu0Yzq6SbMj+wsZpQftEu7ESrp5W64/TNFVrds6ArOZUR69w8i9ueR
 Xe+YuOI+e+dHXmg3Vu84xFUJIBoMijUIOvS0/eU=
X-Google-Smtp-Source: AGHT+IFvGECcoWqa20XU+z2Y/8Yq33H2SZyP9Jq3MbtxNzdR/yCBV2OYF2nbVMQEBafo0MxqW2iaQlN6ndo2PwKHIsI=
X-Received: by 2002:a05:6122:4d8a:b0:4b6:be99:4acb with SMTP id
 fj10-20020a0561224d8a00b004b6be994acbmr19660vkb.16.1704340996882; Wed, 03 Jan
 2024 20:03:16 -0800 (PST)
MIME-Version: 1.0
References: <20231218125334.37184-1-dbarboza@ventanamicro.com>
 <20231218125334.37184-4-dbarboza@ventanamicro.com>
In-Reply-To: <20231218125334.37184-4-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 4 Jan 2024 14:02:50 +1000
Message-ID: <CAKmqyKOt3SkOQHio5yt9aPyXbG_tjjDoMvvB5==tD54DJ95fSg@mail.gmail.com>
Subject: Re: [PATCH v13 03/26] target/riscv/tcg: update priv_ver on user_set
 extensions
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a29;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa29.google.com
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

On Mon, Dec 18, 2023 at 10:58=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> We'll add a new bare CPU type that won't have any default priv_ver. This
> means that the CPU will default to priv_ver =3D 0, i.e. 1.10.0.
>
> At the same we'll allow these CPUs to enable extensions at will, but
> then, if the extension has a priv_ver newer than 1.10, we'll end up
> disabling it. Users will then need to manually set priv_ver to something
> other than 1.10 to enable the extensions they want, which is not ideal.
>
> Change the setter() of extensions to allow user enabled extensions to
> bump the priv_ver of the CPU. This will make it convenient for users to
> enable extensions for CPUs that doesn't set a default priv_ver.
>
> This change does not affect any existing CPU: vendor CPUs does not allow
> extensions to be enabled, and generic CPUs are already set to priv_ver
> LATEST.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/tcg/tcg-cpu.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 7670120673..aee98db6f8 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -114,6 +114,26 @@ static int cpu_cfg_ext_get_min_version(uint32_t ext_=
offset)
>      g_assert_not_reached();
>  }
>
> +static void cpu_bump_multi_ext_priv_ver(CPURISCVState *env,
> +                                        uint32_t ext_offset)
> +{
> +    int ext_priv_ver;
> +
> +    if (env->priv_ver =3D=3D PRIV_VERSION_LATEST) {
> +        return;
> +    }
> +
> +    ext_priv_ver =3D cpu_cfg_ext_get_min_version(ext_offset);
> +
> +    if (env->priv_ver < ext_priv_ver) {
> +        /*
> +         * Note: the 'priv_spec' command line option, if present,
> +         * will take precedence over this priv_ver bump.
> +         */
> +        env->priv_ver =3D ext_priv_ver;
> +    }
> +}
> +
>  static void cpu_cfg_ext_auto_update(RISCVCPU *cpu, uint32_t ext_offset,
>                                      bool value)
>  {
> @@ -757,6 +777,14 @@ static void cpu_set_misa_ext_cfg(Object *obj, Visito=
r *v, const char *name,
>              return;
>          }
>
> +        if (misa_bit =3D=3D RVH && env->priv_ver < PRIV_VERSION_1_12_0) =
{
> +            /*
> +             * Note: the 'priv_spec' command line option, if present,
> +             * will take precedence over this priv_ver bump.
> +             */
> +            env->priv_ver =3D PRIV_VERSION_1_12_0;
> +        }
> +
>          env->misa_ext |=3D misa_bit;
>          env->misa_ext_mask |=3D misa_bit;
>      } else {
> @@ -886,6 +914,10 @@ static void cpu_set_multi_ext_cfg(Object *obj, Visit=
or *v, const char *name,
>          return;
>      }
>
> +    if (value) {
> +        cpu_bump_multi_ext_priv_ver(&cpu->env, multi_ext_cfg->offset);
> +    }
> +
>      isa_ext_update_enabled(cpu, multi_ext_cfg->offset, value);
>  }
>
> --
> 2.43.0
>
>

