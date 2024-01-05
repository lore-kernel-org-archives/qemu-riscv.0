Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B647C47073
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 02:22:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLZqn-00047a-3m; Thu, 04 Jan 2024 21:22:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLZql-00046z-7x; Thu, 04 Jan 2024 21:22:19 -0500
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLZqj-0007Zm-H4; Thu, 04 Jan 2024 21:22:19 -0500
Received: by mail-vs1-xe2a.google.com with SMTP id
 ada2fe7eead31-4676dc16009so315433137.2; 
 Thu, 04 Jan 2024 18:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704421335; x=1705026135; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c7LTEIdFXgljpim3sgFtJtjZaBaJhf1rt+QsM+DgEAU=;
 b=DGuh5B50FFbsjcQo8tu6Qldrs2ROglnqiF7xSXazgBwnn4L4MKsUzpqW4+5dtejiCt
 Oyli+W17Tbqg2L3H47ro8iD1VvQd1lsAy3k9ve1QlT50Svq+nAYLfppFfDxIinTfOQSB
 O35A/lrmCZbnOWFFdmE923g3TpzZOcEVAAHpSc5sX6PuwJsXAxcBYdKw//qOmc0kC6xh
 dn6xo0N63ryf6V0z11k33fQrcuntbZrcZLltdLh0v69c3jqmcCIkmiyed5q5Coo+FW62
 2IbHDVUvW6R14zUr6ixnCdWTqJGvwi/MxlUfvJo2bbF2dLDV1mz+M5GsBb+73Bu2ngoh
 g/MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704421335; x=1705026135;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c7LTEIdFXgljpim3sgFtJtjZaBaJhf1rt+QsM+DgEAU=;
 b=r3Q3CsW2WR2hEX51A/BsmkSWh7EybiEwoTenCJ9K3U/zuWWo9aLCJyMi4XbiCHkTJG
 ir18uoEGIOr+P0koOOaRHNY2U+DL78rPyAsHfScsRQhP4HCZttwDD9CnqkI0q+ydCwNf
 bDHv5e21AaaVhC8V95KFAxn4rhZo+1uvhe7CuQkcqJglUjaL6osouOMpNTX5ad3kpjzm
 +KxMunKB9iuAK4xe0Q485rOG2ldmjaH2wUyjEdR8zigPR5z0qZNpj3zSGM+GeK3mot+l
 lcUrcgzDsStBGRKiz+A/IXRYTt4+rkyioBz+opIQTZpXuZb5v3w/dUU+bUYYDPPCUlhU
 EDvQ==
X-Gm-Message-State: AOJu0YyizDeFXalQ37qKf+VFsjFRwMxwC3SCtYic1Sq1HgjuLagife5W
 K5zORFT3uTiMa5DezcNPa2QcoFfYzsABdCE2lSA=
X-Google-Smtp-Source: AGHT+IHReZaLIS0UZgmYMR/u90ZLljcdL4QXdaDZIsCtMuLChSp2rxVssS+0sMFFB0T066yYLnx/JpjSp4mSCpmSjao=
X-Received: by 2002:a05:6122:1294:b0:4b6:d112:7025 with SMTP id
 i20-20020a056122129400b004b6d1127025mr868931vkp.6.1704421335375; Thu, 04 Jan
 2024 18:22:15 -0800 (PST)
MIME-Version: 1.0
References: <20231218125334.37184-1-dbarboza@ventanamicro.com>
 <20231218125334.37184-25-dbarboza@ventanamicro.com>
In-Reply-To: <20231218125334.37184-25-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 5 Jan 2024 12:21:49 +1000
Message-ID: <CAKmqyKMv=mPXrB1wRV43GnUCQy0wjSif089dVzAvMX-b1N4pVQ@mail.gmail.com>
Subject: Re: [PATCH v13 24/26] target/riscv: add 'parent' in profile
 description
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2a;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2a.google.com
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

On Mon, Dec 18, 2023 at 11:00=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Certain S-mode profiles, like RVA22S64 and RVA23S64, mandate all the
> mandatory extensions of their respective U-mode profiles. RVA22S64
> includes all mandatory extensions of RVA22U64, and the same happens with
> RVA23 profiles.
>
> Add a 'parent' field to allow profiles to enable other profiles. This
> will allow us to describe S-mode profiles by specifying their parent
> U-mode profile, then adding just the S-mode specific extensions.
>
> We're naming the field 'parent' to consider the possibility of other
> uses (e.g. a s-mode profile including a previous s-mode profile) in the
> future.
>
> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c         |  1 +
>  target/riscv/cpu.h         |  1 +
>  target/riscv/tcg/tcg-cpu.c | 14 +++++++++++++-
>  3 files changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 6795f5da41..aa33e7a1cf 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1540,6 +1540,7 @@ Property riscv_cpu_options[] =3D {
>   * having a cfg offset) at this moment.
>   */
>  static RISCVCPUProfile RVA22U64 =3D {
> +    .parent =3D NULL,
>      .name =3D "rva22u64",
>      .misa_ext =3D RVI | RVM | RVA | RVF | RVD | RVC | RVU,
>      .priv_spec =3D RISCV_PROFILE_ATTR_UNUSED,
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 6c5fceb5f5..44fb0a9ca8 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -77,6 +77,7 @@ const char *riscv_get_misa_ext_description(uint32_t bit=
);
>  #define CPU_CFG_OFFSET(_prop) offsetof(struct RISCVCPUConfig, _prop)
>
>  typedef struct riscv_cpu_profile {
> +    struct riscv_cpu_profile *parent;
>      const char *name;
>      uint32_t misa_ext;
>      bool enabled;
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 152f95718b..6284d36809 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -797,7 +797,7 @@ static void riscv_cpu_validate_profile(RISCVCPU *cpu,
>      CPURISCVState *env =3D &cpu->env;
>      const char *warn_msg =3D "Profile %s mandates disabled extension %s"=
;
>      bool send_warn =3D profile->user_set && profile->enabled;
> -    bool profile_impl =3D true;
> +    bool parent_enabled, profile_impl =3D true;
>      int i;
>
>  #ifndef CONFIG_USER_ONLY
> @@ -850,6 +850,13 @@ static void riscv_cpu_validate_profile(RISCVCPU *cpu=
,
>      }
>
>      profile->enabled =3D profile_impl;
> +
> +    if (profile->parent !=3D NULL) {
> +        parent_enabled =3D object_property_get_bool(OBJECT(cpu),
> +                                                  profile->parent->name,
> +                                                  NULL);
> +        profile->enabled =3D profile->enabled && parent_enabled;
> +    }
>  }
>
>  static void riscv_cpu_validate_profiles(RISCVCPU *cpu)
> @@ -1107,6 +1114,11 @@ static void cpu_set_profile(Object *obj, Visitor *=
v, const char *name,
>      profile->user_set =3D true;
>      profile->enabled =3D value;
>
> +    if (profile->parent !=3D NULL) {
> +        object_property_set_bool(obj, profile->parent->name,
> +                                 profile->enabled, NULL);
> +    }
> +
>      if (profile->enabled) {
>          cpu->env.priv_ver =3D profile->priv_spec;
>      }
> --
> 2.43.0
>
>

