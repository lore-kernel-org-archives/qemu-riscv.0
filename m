Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F11C4706F
	for <qemu-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 06:32:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLHGa-0005v1-IG; Thu, 04 Jan 2024 01:31:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLHGY-0005uR-Ht; Thu, 04 Jan 2024 01:31:42 -0500
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLHGW-00013O-Ou; Thu, 04 Jan 2024 01:31:42 -0500
Received: by mail-vk1-xa2d.google.com with SMTP id
 71dfb90a1353d-4b78b813dd0so54046e0c.3; 
 Wed, 03 Jan 2024 22:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704349899; x=1704954699; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5DgNiaJnpMr38ezaTxgsgMqudpjOk1sQ7uYuhKw+moU=;
 b=IkFGilBxSzH3LXZNC5c4ixDvOUZ5CWd/TmKWrT6S6fR1O/BLbMiZDNyyj6ODJdTdeW
 5LN3tiuxjf7Vl9TIsYcoHjrhzHmlUZbOWa3+3vE0B+fn2Em7pb9rqnMl/S1UXff2U7JX
 5VO16uHPhqq+l+MtwTsxiQMgbysePsishzzBm9tlgwcNPaNd6rNlkdY3Gg5jmA5blCsF
 rgZ1zGGE9yTca9gO45tz4waTi3kBfeRMbx6RJHoYb7hVQtHrwQCeakZBZjT4gIOJjQTY
 ZUW9HvqlL8gEwDsrEzVXMfZghVXJTETGjntbcHEYJoBP7wZEGUna/+YjUrTyVOvMxDBT
 Iotw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704349899; x=1704954699;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5DgNiaJnpMr38ezaTxgsgMqudpjOk1sQ7uYuhKw+moU=;
 b=O7BXToUAqKCQCEQmNZC3yAG0o8kyevkDOnnwPMfxqSk2r4pEOx2S0IhwKnj1n1DJfQ
 FV3AzIGSgMCP9DHuRbMsW8YqbZzT8lvkkXZCUOKdCC7Flp9V3E0AE7SZoFaEPUFr5thB
 N38w/C82NGWe+v+3VTbhapwqJ5U3e68oGT0d4hOPu8vCaHpea6f8E2/NLX9GZP+6s2nX
 uM0gID+zoF9xDx8gKKSsUSEFDnt1MY+k4/ydHOpqvuVmfikWTanGFnTuZkG46oAtlre4
 N6fZHdaaGh8nAPr/xK7OQR6Rym4aJsyFFhOP4LzLHy7jKGgIpGRNA6G5MGrPrhZkbadb
 JXIQ==
X-Gm-Message-State: AOJu0YyPmGoRB3dELVl6Ol0gaTnvWqM9BIbm54oTUCmuDz3Q1hbbGUVi
 RyxCTegqYLg3f/1uaNrf1s9GvNG9LTXiXhvwBWzX/B8t
X-Google-Smtp-Source: AGHT+IGQELwMxjTm3zeYh1jkcVB4GXQYTz23C87ECblQU4foS7I3pHpFHc/mkztdNZhjjGMVoARE6oj+43Xg0Zgnbd8=
X-Received: by 2002:ac5:c90b:0:b0:4b7:97b9:527d with SMTP id
 t11-20020ac5c90b000000b004b797b9527dmr87039vkl.26.1704349899180; Wed, 03 Jan
 2024 22:31:39 -0800 (PST)
MIME-Version: 1.0
References: <20231218125334.37184-1-dbarboza@ventanamicro.com>
 <20231218125334.37184-19-dbarboza@ventanamicro.com>
In-Reply-To: <20231218125334.37184-19-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 4 Jan 2024 16:31:13 +1000
Message-ID: <CAKmqyKMtmS+i2b6uQM9fXz=i89r0Zp3U0XBZ2mcuhmtbYBf=YA@mail.gmail.com>
Subject: Re: [PATCH v13 18/26] target/riscv: add 'rva22u64' CPU
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com
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

On Mon, Dec 18, 2023 at 10:56=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> This CPU was suggested by Alistair [1] and others during the profile
> design discussions. It consists of the bare 'rv64i' CPU with rva22u64
> enabled by default, like an alias of '-cpu rv64i,rva22u64=3Dtrue'.
>
> Users now have an even easier way of consuming this user-mode profile by
> doing '-cpu rva22u64'. Extensions can be enabled/disabled at will on top
> of it.
>
> We can boot Linux with this "user-mode" CPU by doing:
>
> -cpu rva22u64,sv39=3Dtrue,s=3Dtrue,zifencei=3Dtrue
>
> [1] https://lore.kernel.org/qemu-riscv/CAKmqyKP7xzZ9Sx=3D-Lbx2Ob0qCfB7Z+J=
O944FQ2TQ+49mqo0q_Q@mail.gmail.com/
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu-qom.h     |  1 +
>  target/riscv/cpu.c         | 17 +++++++++++++++++
>  target/riscv/tcg/tcg-cpu.c |  9 +++++++++
>  3 files changed, 27 insertions(+)
>
> diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
> index 4d1aa54311..12fe78fc52 100644
> --- a/target/riscv/cpu-qom.h
> +++ b/target/riscv/cpu-qom.h
> @@ -35,6 +35,7 @@
>  #define TYPE_RISCV_CPU_BASE64           RISCV_CPU_TYPE_NAME("rv64")
>  #define TYPE_RISCV_CPU_BASE128          RISCV_CPU_TYPE_NAME("x-rv128")
>  #define TYPE_RISCV_CPU_RV64I            RISCV_CPU_TYPE_NAME("rv64i")
> +#define TYPE_RISCV_CPU_RVA22U64         RISCV_CPU_TYPE_NAME("rva22u64")
>  #define TYPE_RISCV_CPU_IBEX             RISCV_CPU_TYPE_NAME("lowrisc-ibe=
x")
>  #define TYPE_RISCV_CPU_SHAKTI_C         RISCV_CPU_TYPE_NAME("shakti-c")
>  #define TYPE_RISCV_CPU_SIFIVE_E31       RISCV_CPU_TYPE_NAME("sifive-e31"=
)
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index b9057c8da2..a38d78b2d6 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1576,6 +1576,15 @@ static Property riscv_cpu_properties[] =3D {
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> +#if defined(TARGET_RISCV64)
> +static void rva22u64_profile_cpu_init(Object *obj)
> +{
> +    rv64i_bare_cpu_init(obj);
> +
> +    RVA22U64.enabled =3D true;
> +}
> +#endif
> +
>  static const gchar *riscv_gdb_arch_name(CPUState *cs)
>  {
>      RISCVCPU *cpu =3D RISCV_CPU(cs);
> @@ -1866,6 +1875,13 @@ void riscv_cpu_list(void)
>          .instance_init =3D initfn            \
>      }
>
> +#define DEFINE_PROFILE_CPU(type_name, initfn) \
> +    {                                         \
> +        .name =3D type_name,                    \
> +        .parent =3D TYPE_RISCV_BARE_CPU,        \
> +        .instance_init =3D initfn               \
> +    }
> +
>  static const TypeInfo riscv_cpu_type_infos[] =3D {
>      {
>          .name =3D TYPE_RISCV_CPU,
> @@ -1910,6 +1926,7 @@ static const TypeInfo riscv_cpu_type_infos[] =3D {
>      DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_VEYRON_V1,   rv64_veyron_v1_cpu_ini=
t),
>      DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_BASE128,  rv128_base_cpu_init),
>      DEFINE_BARE_CPU(TYPE_RISCV_CPU_RV64I, rv64i_bare_cpu_init),
> +    DEFINE_PROFILE_CPU(TYPE_RISCV_CPU_RVA22U64, rva22u64_profile_cpu_ini=
t),
>  #endif
>  };
>
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 005d8be26b..04aedf3840 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -1095,6 +1095,15 @@ static void riscv_cpu_add_profiles(Object *cpu_obj=
)
>          object_property_add(cpu_obj, profile->name, "bool",
>                              cpu_get_profile, cpu_set_profile,
>                              NULL, (void *)profile);
> +
> +        /*
> +         * CPUs might enable a profile right from the start.
> +         * Enable its mandatory extensions right away in this
> +         * case.
> +         */
> +        if (profile->enabled) {
> +            object_property_set_bool(cpu_obj, profile->name, true, NULL)=
;
> +        }
>      }
>  }
>
> --
> 2.43.0
>
>

