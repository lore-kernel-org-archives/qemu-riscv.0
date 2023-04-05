Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkCoP-0007Xx-U4
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 19:45:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkCoN-0007X2-8M; Wed, 05 Apr 2023 19:45:07 -0400
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkCoG-0001A0-0H; Wed, 05 Apr 2023 19:45:06 -0400
Received: by mail-vs1-xe36.google.com with SMTP id d2so32980178vso.9;
 Wed, 05 Apr 2023 16:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680738298;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=62ZPQTpbL0wwrJU00MvyjlSkDmrLGZOYdTh70Kr+1dw=;
 b=X4BvEKEAPOBpNLrypJKqbuBNkmPFtQ9DWSkWFIqGkZ8seZ3lL68ehcg/i3Zdo910S6
 LfuPca04MQOnsxpZl8xElPAWslzZj+1znaTx/gRbyKX3MVaZ/ELOuBC4257nBQ9Hh2W1
 /5acTX8PLUImYvYLI/kdM9yTOJZMWhs25JoH089p9x+yH2uIUzCOtQ2YKazO1WELlUaV
 EEIa4WonA2rCJSI2uu+eTjKgurTqsz3P3RIcavLg4OV9oDS2GHa4qslaRNP0bZPvk+17
 eCbrG9NtcizDboqGne7topTbHn1ZkpYm0e9Mm18rbATyS0FAjovQb57osjbCatrqM3oX
 JZXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680738298;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=62ZPQTpbL0wwrJU00MvyjlSkDmrLGZOYdTh70Kr+1dw=;
 b=vPy7ObP3jMsODUOaklHR2Ct4w4VydCctYuDLfjg5SF8EKXxI77Ub+GqCkvXQp41i2H
 /4atbTfTPK6JPGDKElOYQommCLqAN/7MAg/D+K4tNVaxDb5LOh5AD3cMgvyA2ncQltjU
 JvkME3/ltK3QwFj+DzHmicTEwuZeo/B/qmdAZqpZxKApVj3k+xRJmufleFRYfjIqtkLe
 Vp+xNQBOthd7bnPrejWlgJRayqnVM25C7x+0ueALdiFc1YOuQWz/7AY8zlZZNE2CfhOm
 Q6ue8oK02m4M+RxLL6Bl35T+7VNw0VdAB/hGUcfKS8EPIESqM9QamKr8RgoVxUmkHi9q
 vKUQ==
X-Gm-Message-State: AAQBX9dc5hzj0OiuZqwdj6DULFSKUsK3RPDpoiatA9icph0QZlvJl+00
 g15Oh0lBiTUMnVQmEO6nMWNbB5Q/1AbCGZslAVc=
X-Google-Smtp-Source: AKy350ZHgtl6228nwNJ4F5YVO2Rx19v2DO0W85d6pXtuJLGaBqtxAJhTL+sCoTB5sjYJkWZW2tTE82YeAAbCGDh0I9Y=
X-Received: by 2002:a67:c181:0:b0:42a:eb6:6c51 with SMTP id
 h1-20020a67c181000000b0042a0eb66c51mr6172113vsj.3.1680738298133; Wed, 05 Apr
 2023 16:44:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230329172903.636383-1-dbarboza@ventanamicro.com>
 <20230329172903.636383-5-dbarboza@ventanamicro.com>
In-Reply-To: <20230329172903.636383-5-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 6 Apr 2023 09:44:32 +1000
Message-ID: <CAKmqyKOhPsixqH0VmhDtR14WeFw3WrjR4S190uaM0vctDrL=eg@mail.gmail.com>
Subject: Re: [PATCH v3 04/20] target/riscv: introduce
 riscv_cpu_add_misa_properties()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e36;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe36.google.com
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
X-List-Received-Date: Wed, 05 Apr 2023 23:45:07 -0000

On Thu, Mar 30, 2023 at 3:29=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Ever since RISCVCPUConfig got introduced users are able to set CPU extens=
ions
> in the command line. User settings are reflected in the cpu->cfg object
> for later use. These properties are used in the target/riscv/cpu.c code,
> most notably in riscv_cpu_validate_set_extensions(), where most of our
> realize time validations are made.
>
> And then there's env->misa_ext, the field where the MISA extensions are
> set, that is read everywhere else. We need to keep env->misa_ext updated
> with cpu->cfg settings, since our validations rely on it, forcing us to
> make register_cpu_props() write cpu->cfg.ext_N flags to cover for named
> CPUs that aren't used named properties but also needs to go through the
> same validation steps. Failing to so will make those name CPUs fail
> validation (see c66ffcd5358b for more info). Not only that, but we also
> need to sync env->misa_ext with cpu->cfg again during realize() time to
> catch any change the user might have done, since the rest of the code
> relies on that.
>
> Making cpu->cfg.ext_N and env->misa_ext reflect each other is not
> needed. What we want is a way for users to enable/disable MISA extensions=
,
> and there's nothing stopping us from letting the user write env->misa_ext
> directly. Here are the artifacts that will enable us to do that:
>
> - RISCVCPUMisaExtConfig will declare each MISA property;
>
> - cpu_set_misa_ext_cfg() is the setter for each property. We'll write
>   env->misa_ext and env->misa_ext_mask with the appropriate misa_bit;
>   cutting off cpu->cfg.ext_N from the logic;
>
> - cpu_get_misa_ext_cfg() is a getter that will retrieve the current val
>   of the property based on env->misa_ext;
>
> - riscv_cpu_add_misa_properties() will be called in register_cpu_props()
>   to init all MISA properties from the misa_ext_cfgs[] array.
>
> With this infrastructure we'll start to get rid of each cpu->cfg.ext_N
> attribute in the next patches.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 65 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 5ae9440aee..d7763ecfa9 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1393,6 +1393,69 @@ static void riscv_cpu_init(Object *obj)
>  #endif /* CONFIG_USER_ONLY */
>  }
>
> +typedef struct RISCVCPUMisaExtConfig {
> +    const char *name;
> +    const char *description;
> +    target_ulong misa_bit;
> +    bool enabled;
> +} RISCVCPUMisaExtConfig;
> +
> +static void cpu_set_misa_ext_cfg(Object *obj, Visitor *v, const char *na=
me,
> +                                 void *opaque, Error **errp)
> +{
> +    const RISCVCPUMisaExtConfig *misa_ext_cfg =3D opaque;
> +    target_ulong misa_bit =3D misa_ext_cfg->misa_bit;
> +    RISCVCPU *cpu =3D RISCV_CPU(obj);
> +    CPURISCVState *env =3D &cpu->env;
> +    bool value;
> +
> +    if (!visit_type_bool(v, name, &value, errp)) {
> +        return;
> +    }
> +
> +    if (value) {
> +        env->misa_ext |=3D misa_bit;
> +        env->misa_ext_mask |=3D misa_bit;
> +    } else {
> +        env->misa_ext &=3D ~misa_bit;
> +        env->misa_ext_mask &=3D ~misa_bit;
> +    }
> +}
> +
> +static void cpu_get_misa_ext_cfg(Object *obj, Visitor *v, const char *na=
me,
> +                                 void *opaque, Error **errp)
> +{
> +    const RISCVCPUMisaExtConfig *misa_ext_cfg =3D opaque;
> +    target_ulong misa_bit =3D misa_ext_cfg->misa_bit;
> +    RISCVCPU *cpu =3D RISCV_CPU(obj);
> +    CPURISCVState *env =3D &cpu->env;
> +    bool value;
> +
> +    value =3D env->misa_ext & misa_bit;
> +
> +    visit_type_bool(v, name, &value, errp);
> +}
> +
> +static const RISCVCPUMisaExtConfig misa_ext_cfgs[] =3D {};
> +
> +static void riscv_cpu_add_misa_properties(Object *cpu_obj)
> +{
> +    int i;
> +
> +    for (i =3D 0; i < ARRAY_SIZE(misa_ext_cfgs); i++) {
> +        const RISCVCPUMisaExtConfig *misa_cfg =3D &misa_ext_cfgs[i];
> +
> +        object_property_add(cpu_obj, misa_cfg->name, "bool",
> +                            cpu_get_misa_ext_cfg,
> +                            cpu_set_misa_ext_cfg,
> +                            NULL, (void *)misa_cfg);
> +        object_property_set_description(cpu_obj, misa_cfg->name,
> +                                        misa_cfg->description);
> +        object_property_set_bool(cpu_obj, misa_cfg->name,
> +                                 misa_cfg->enabled, NULL);
> +    }
> +}
> +
>  static Property riscv_cpu_extensions[] =3D {
>      /* Defaults for standard extensions */
>      DEFINE_PROP_BOOL("i", RISCVCPU, cfg.ext_i, true),
> @@ -1530,6 +1593,8 @@ static void register_cpu_props(Object *obj)
>          return;
>      }
>
> +    riscv_cpu_add_misa_properties(obj);
> +
>      for (prop =3D riscv_cpu_extensions; prop && prop->name; prop++) {
>          qdev_property_add_static(dev, prop);
>      }
> --
> 2.39.2
>
>

