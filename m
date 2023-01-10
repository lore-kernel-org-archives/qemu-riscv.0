Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pFNV9-0001Ta-OU
	for mharc-qemu-riscv@gnu.org; Tue, 10 Jan 2023 17:53:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pFNV8-0001St-6h; Tue, 10 Jan 2023 17:53:50 -0500
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pFNV5-0004AP-UE; Tue, 10 Jan 2023 17:53:49 -0500
Received: by mail-vs1-xe2e.google.com with SMTP id a64so13920558vsc.2;
 Tue, 10 Jan 2023 14:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6MlfeehrVCzTdNgMw2QDi+A7t8HunRX1R5yrL51Cwds=;
 b=CgTzjKgBmLqT6ysG9Nnu7y2CLX8dPrnwcuwXLmjM9DA1gvDZwCEa5LifYD6NDw9Zxd
 WDzJepNuK0TRl9LTE72wkNZVx7IUAw07l2YGQJfe7bYnQS1ZaxtVoreLwT+NmgX5MCoP
 lcgacjeD4bMaSqT7Vercv7yXienkK9Fxd21mg7i00FZJLxfx1myNmhEGNzHCKTW8PHjQ
 RkqUCh7aPxj92KgAG8DBlZxKdI7/sDfC6mBixhdHu5hN58ZnVHqmzRXHY7/VZbQQKuF+
 7+J1MdILa4f7vx3do20OTw9F1HCjL6EVoRZbeIOxJqtPNGy4/jT0qboK5rXByerL51ju
 CVqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6MlfeehrVCzTdNgMw2QDi+A7t8HunRX1R5yrL51Cwds=;
 b=LQdIPoSNASMggK95JTu8oee4rdu5TF+I+N4/UCtt+Eaivu2jiwrzRBACmf3vYlzNsh
 Ya2ShDA2077IQNHSMZNVRWucfv3e49+LrDZ6BT6/oT6xmJPwQmXiHghy9Dqo+w2dGOiV
 1duDprHoDB5e64+LjCf6TadbZe9+D2tFzZcp7ZKztTw507L3B1ViHNl6ZiRKbaHly/a2
 cbbP2HqwmSpl/yfZYimfChQta9MFVyQdNG9sHxCkwVrvCM5wlryz13O/pCvT8JwulmNV
 XCqREWeWjN3WRnsDUHDwtDAMV97AtP/UU5CtONKoTdLcuEPNoCRdMk/pWqJkww3h5yD9
 z7fQ==
X-Gm-Message-State: AFqh2kro6k/tMjLdqYjovoYRYn3Dl3T2iJjwd+XTBFXYvPxiffHuS6By
 JtyiSbG5mp7CuHmmmXYidLGNCRZRPNee9VEEkBU=
X-Google-Smtp-Source: AMrXdXvtryAMpalE6nEzQ1FDoux1/fmc2ro8QPqTZV81G87ozjKukLy3F69OaKyOBn0BD/49tA1qawz2lHozZaD/Ty8=
X-Received: by 2002:a05:6102:510e:b0:3b1:2b83:1861 with SMTP id
 bm14-20020a056102510e00b003b12b831861mr9286044vsb.10.1673391226307; Tue, 10
 Jan 2023 14:53:46 -0800 (PST)
MIME-Version: 1.0
References: <20230110201405.247785-1-dbarboza@ventanamicro.com>
 <20230110201405.247785-3-dbarboza@ventanamicro.com>
In-Reply-To: <20230110201405.247785-3-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 11 Jan 2023 08:53:20 +1000
Message-ID: <CAKmqyKMSW1UKUZ-bV4imu+QyOX=h3eEw+wNvwf=QVG=muE5LzA@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/riscv/cpu.c: do not skip misa logic in
 riscv_cpu_realize()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Tue, 10 Jan 2023 22:53:50 -0000

On Wed, Jan 11, 2023 at 6:17 AM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> All RISCV CPUs are setting cpu->cfg during their cpu_init() functions,
> meaning that there's no reason to skip all the misa validation and setup
> if misa_ext was set beforehand - especially since we're setting an
> updated value in set_misa() in the end.
>
> Put this code chunk into a new riscv_cpu_validate_set_extensions()
> helper and always execute it regardless of what the board set in
> env->misa_ext.
>
> This will put more responsibility in how each board is going to init
> their attributes and extensions if they're not using the defaults.
> It'll also allow realize() to do its job looking only at the extensions
> enabled per se, not corner cases that some CPUs might have, and we won't
> have to change multiple code paths to fix or change how extensions work.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 485 +++++++++++++++++++++++----------------------
>  1 file changed, 248 insertions(+), 237 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index b8c1edb7c2..33ed59a1b6 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -631,6 +631,250 @@ static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
>      }
>  }
>
> +/*
> + * Check consistency between chosen extensions while setting
> + * cpu->cfg accordingly, doing a set_misa() in the end.
> + */
> +static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
> +{
> +    CPURISCVState *env = &cpu->env;
> +    uint32_t ext = 0;
> +
> +    /* Do some ISA extension error checking */
> +    if (cpu->cfg.ext_g && !(cpu->cfg.ext_i && cpu->cfg.ext_m &&
> +                            cpu->cfg.ext_a && cpu->cfg.ext_f &&
> +                            cpu->cfg.ext_d &&
> +                            cpu->cfg.ext_icsr && cpu->cfg.ext_ifencei)) {
> +        warn_report("Setting G will also set IMAFD_Zicsr_Zifencei");
> +        cpu->cfg.ext_i = true;
> +        cpu->cfg.ext_m = true;
> +        cpu->cfg.ext_a = true;
> +        cpu->cfg.ext_f = true;
> +        cpu->cfg.ext_d = true;
> +        cpu->cfg.ext_icsr = true;
> +        cpu->cfg.ext_ifencei = true;
> +    }
> +
> +    if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
> +        error_setg(errp,
> +                   "I and E extensions are incompatible");
> +        return;
> +    }
> +
> +    if (!cpu->cfg.ext_i && !cpu->cfg.ext_e) {
> +        error_setg(errp,
> +                   "Either I or E extension must be set");
> +        return;
> +    }
> +
> +    if (cpu->cfg.ext_s && !cpu->cfg.ext_u) {
> +        error_setg(errp,
> +                   "Setting S extension without U extension is illegal");
> +        return;
> +    }
> +
> +    if (cpu->cfg.ext_h && !cpu->cfg.ext_i) {
> +        error_setg(errp,
> +                   "H depends on an I base integer ISA with 32 x registers");
> +        return;
> +    }
> +
> +    if (cpu->cfg.ext_h && !cpu->cfg.ext_s) {
> +        error_setg(errp, "H extension implicitly requires S-mode");
> +        return;
> +    }
> +
> +    if (cpu->cfg.ext_f && !cpu->cfg.ext_icsr) {
> +        error_setg(errp, "F extension requires Zicsr");
> +        return;
> +    }
> +
> +    if ((cpu->cfg.ext_zawrs) && !cpu->cfg.ext_a) {
> +        error_setg(errp, "Zawrs extension requires A extension");
> +        return;
> +    }
> +
> +    if ((cpu->cfg.ext_zfh || cpu->cfg.ext_zfhmin) && !cpu->cfg.ext_f) {
> +        error_setg(errp, "Zfh/Zfhmin extensions require F extension");
> +        return;
> +    }
> +
> +    if (cpu->cfg.ext_d && !cpu->cfg.ext_f) {
> +        error_setg(errp, "D extension requires F extension");
> +        return;
> +    }
> +
> +    if (cpu->cfg.ext_v && !cpu->cfg.ext_d) {
> +        error_setg(errp, "V extension requires D extension");
> +        return;
> +    }
> +
> +    if ((cpu->cfg.ext_zve32f || cpu->cfg.ext_zve64f) && !cpu->cfg.ext_f) {
> +        error_setg(errp, "Zve32f/Zve64f extensions require F extension");
> +        return;
> +    }
> +
> +    /* Set the ISA extensions, checks should have happened above */
> +    if (cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinx ||
> +        cpu->cfg.ext_zhinxmin) {
> +        cpu->cfg.ext_zfinx = true;
> +    }
> +
> +    if (cpu->cfg.ext_zfinx) {
> +        if (!cpu->cfg.ext_icsr) {
> +            error_setg(errp, "Zfinx extension requires Zicsr");
> +            return;
> +        }
> +        if (cpu->cfg.ext_f) {
> +            error_setg(errp,
> +                "Zfinx cannot be supported together with F extension");
> +            return;
> +        }
> +    }
> +
> +    if (cpu->cfg.ext_c) {
> +        cpu->cfg.ext_zca = true;
> +        if (cpu->cfg.ext_f && env->misa_mxl_max == MXL_RV32) {
> +            cpu->cfg.ext_zcf = true;
> +        }
> +        if (cpu->cfg.ext_d) {
> +            cpu->cfg.ext_zcd = true;
> +        }
> +    }
> +
> +    if (env->misa_mxl_max != MXL_RV32 && cpu->cfg.ext_zcf) {
> +        error_setg(errp, "Zcf extension is only relevant to RV32");
> +        return;
> +    }
> +
> +    if (!cpu->cfg.ext_f && cpu->cfg.ext_zcf) {
> +        error_setg(errp, "Zcf extension requires F extension");
> +        return;
> +    }
> +
> +    if (!cpu->cfg.ext_d && cpu->cfg.ext_zcd) {
> +        error_setg(errp, "Zcd extension requires D extension");
> +        return;
> +    }
> +
> +    if ((cpu->cfg.ext_zcf || cpu->cfg.ext_zcd || cpu->cfg.ext_zcb ||
> +         cpu->cfg.ext_zcmp || cpu->cfg.ext_zcmt) && !cpu->cfg.ext_zca) {
> +        error_setg(errp, "Zcf/Zcd/Zcb/Zcmp/Zcmt extensions require Zca "
> +                         "extension");
> +        return;
> +    }
> +
> +    if (cpu->cfg.ext_zcd && (cpu->cfg.ext_zcmp || cpu->cfg.ext_zcmt)) {
> +        error_setg(errp, "Zcmp/Zcmt extensions are incompatible with "
> +                         "Zcd extension");
> +        return;
> +    }
> +
> +    if (cpu->cfg.ext_zcmt && !cpu->cfg.ext_icsr) {
> +        error_setg(errp, "Zcmt extension requires Zicsr extension");
> +        return;
> +    }
> +
> +    if (cpu->cfg.ext_zk) {
> +        cpu->cfg.ext_zkn = true;
> +        cpu->cfg.ext_zkr = true;
> +        cpu->cfg.ext_zkt = true;
> +    }
> +
> +    if (cpu->cfg.ext_zkn) {
> +        cpu->cfg.ext_zbkb = true;
> +        cpu->cfg.ext_zbkc = true;
> +        cpu->cfg.ext_zbkx = true;
> +        cpu->cfg.ext_zkne = true;
> +        cpu->cfg.ext_zknd = true;
> +        cpu->cfg.ext_zknh = true;
> +    }
> +
> +    if (cpu->cfg.ext_zks) {
> +        cpu->cfg.ext_zbkb = true;
> +        cpu->cfg.ext_zbkc = true;
> +        cpu->cfg.ext_zbkx = true;
> +        cpu->cfg.ext_zksed = true;
> +        cpu->cfg.ext_zksh = true;
> +    }
> +
> +    if (cpu->cfg.ext_i) {
> +        ext |= RVI;
> +    }
> +    if (cpu->cfg.ext_e) {
> +        ext |= RVE;
> +    }
> +    if (cpu->cfg.ext_m) {
> +        ext |= RVM;
> +    }
> +    if (cpu->cfg.ext_a) {
> +        ext |= RVA;
> +    }
> +    if (cpu->cfg.ext_f) {
> +        ext |= RVF;
> +    }
> +    if (cpu->cfg.ext_d) {
> +        ext |= RVD;
> +    }
> +    if (cpu->cfg.ext_c) {
> +        ext |= RVC;
> +    }
> +    if (cpu->cfg.ext_s) {
> +        ext |= RVS;
> +    }
> +    if (cpu->cfg.ext_u) {
> +        ext |= RVU;
> +    }
> +    if (cpu->cfg.ext_h) {
> +        ext |= RVH;
> +    }
> +    if (cpu->cfg.ext_v) {
> +        int vext_version = VEXT_VERSION_1_00_0;
> +        ext |= RVV;
> +        if (!is_power_of_2(cpu->cfg.vlen)) {
> +            error_setg(errp,
> +                    "Vector extension VLEN must be power of 2");
> +            return;
> +        }
> +        if (cpu->cfg.vlen > RV_VLEN_MAX || cpu->cfg.vlen < 128) {
> +            error_setg(errp,
> +                    "Vector extension implementation only supports VLEN "
> +                    "in the range [128, %d]", RV_VLEN_MAX);
> +            return;
> +        }
> +        if (!is_power_of_2(cpu->cfg.elen)) {
> +            error_setg(errp,
> +                    "Vector extension ELEN must be power of 2");
> +            return;
> +        }
> +    if (cpu->cfg.elen > 64 || cpu->cfg.elen < 8) {
> +        error_setg(errp,
> +                "Vector extension implementation only supports ELEN "
> +                "in the range [8, 64]");
> +        return;
> +    }
> +    if (cpu->cfg.vext_spec) {
> +        if (!g_strcmp0(cpu->cfg.vext_spec, "v1.0")) {
> +            vext_version = VEXT_VERSION_1_00_0;
> +        } else {
> +            error_setg(errp,
> +                   "Unsupported vector spec version '%s'",
> +                   cpu->cfg.vext_spec);
> +            return;
> +        }
> +    } else {
> +        qemu_log("vector version is not specified, "
> +                 "use the default value v1.0\n");
> +    }
> +    set_vext_version(env, vext_version);
> +    }
> +    if (cpu->cfg.ext_j) {
> +        ext |= RVJ;
> +    }
> +
> +    set_misa(env, env->misa_mxl, ext);
> +}
> +
>  static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>  {
>      CPUState *cs = CPU(dev);
> @@ -726,243 +970,10 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>      }
>      assert(env->misa_mxl_max == env->misa_mxl);
>
> -    /* If only MISA_EXT is unset for misa, then set it from properties */
> -    if (env->misa_ext == 0) {
> -        uint32_t ext = 0;
> -
> -        /* Do some ISA extension error checking */
> -        if (cpu->cfg.ext_g && !(cpu->cfg.ext_i && cpu->cfg.ext_m &&
> -                                cpu->cfg.ext_a && cpu->cfg.ext_f &&
> -                                cpu->cfg.ext_d &&
> -                                cpu->cfg.ext_icsr && cpu->cfg.ext_ifencei)) {
> -            warn_report("Setting G will also set IMAFD_Zicsr_Zifencei");
> -            cpu->cfg.ext_i = true;
> -            cpu->cfg.ext_m = true;
> -            cpu->cfg.ext_a = true;
> -            cpu->cfg.ext_f = true;
> -            cpu->cfg.ext_d = true;
> -            cpu->cfg.ext_icsr = true;
> -            cpu->cfg.ext_ifencei = true;
> -        }
> -
> -        if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
> -            error_setg(errp,
> -                       "I and E extensions are incompatible");
> -            return;
> -        }
> -
> -        if (!cpu->cfg.ext_i && !cpu->cfg.ext_e) {
> -            error_setg(errp,
> -                       "Either I or E extension must be set");
> -            return;
> -        }
> -
> -        if (cpu->cfg.ext_s && !cpu->cfg.ext_u) {
> -            error_setg(errp,
> -                       "Setting S extension without U extension is illegal");
> -            return;
> -        }
> -
> -        if (cpu->cfg.ext_h && !cpu->cfg.ext_i) {
> -            error_setg(errp,
> -                       "H depends on an I base integer ISA with 32 x registers");
> -            return;
> -        }
> -
> -        if (cpu->cfg.ext_h && !cpu->cfg.ext_s) {
> -            error_setg(errp, "H extension implicitly requires S-mode");
> -            return;
> -        }
> -
> -        if (cpu->cfg.ext_f && !cpu->cfg.ext_icsr) {
> -            error_setg(errp, "F extension requires Zicsr");
> -            return;
> -        }
> -
> -        if ((cpu->cfg.ext_zawrs) && !cpu->cfg.ext_a) {
> -            error_setg(errp, "Zawrs extension requires A extension");
> -            return;
> -        }
> -
> -        if ((cpu->cfg.ext_zfh || cpu->cfg.ext_zfhmin) && !cpu->cfg.ext_f) {
> -            error_setg(errp, "Zfh/Zfhmin extensions require F extension");
> -            return;
> -        }
> -
> -        if (cpu->cfg.ext_d && !cpu->cfg.ext_f) {
> -            error_setg(errp, "D extension requires F extension");
> -            return;
> -        }
> -
> -        if (cpu->cfg.ext_v && !cpu->cfg.ext_d) {
> -            error_setg(errp, "V extension requires D extension");
> -            return;
> -        }
> -
> -        if ((cpu->cfg.ext_zve32f || cpu->cfg.ext_zve64f) && !cpu->cfg.ext_f) {
> -            error_setg(errp, "Zve32f/Zve64f extensions require F extension");
> -            return;
> -        }
> -
> -        /* Set the ISA extensions, checks should have happened above */
> -        if (cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinx ||
> -            cpu->cfg.ext_zhinxmin) {
> -            cpu->cfg.ext_zfinx = true;
> -        }
> -
> -        if (cpu->cfg.ext_zfinx) {
> -            if (!cpu->cfg.ext_icsr) {
> -                error_setg(errp, "Zfinx extension requires Zicsr");
> -                return;
> -            }
> -            if (cpu->cfg.ext_f) {
> -                error_setg(errp,
> -                    "Zfinx cannot be supported together with F extension");
> -                return;
> -            }
> -        }
> -
> -        if (cpu->cfg.ext_c) {
> -            cpu->cfg.ext_zca = true;
> -            if (cpu->cfg.ext_f && env->misa_mxl_max == MXL_RV32) {
> -                cpu->cfg.ext_zcf = true;
> -            }
> -            if (cpu->cfg.ext_d) {
> -                cpu->cfg.ext_zcd = true;
> -            }
> -        }
> -
> -        if (env->misa_mxl_max != MXL_RV32 && cpu->cfg.ext_zcf) {
> -            error_setg(errp, "Zcf extension is only relevant to RV32");
> -            return;
> -        }
> -
> -        if (!cpu->cfg.ext_f && cpu->cfg.ext_zcf) {
> -            error_setg(errp, "Zcf extension requires F extension");
> -            return;
> -        }
> -
> -        if (!cpu->cfg.ext_d && cpu->cfg.ext_zcd) {
> -            error_setg(errp, "Zcd extension requires D extension");
> -            return;
> -        }
> -
> -        if ((cpu->cfg.ext_zcf || cpu->cfg.ext_zcd || cpu->cfg.ext_zcb ||
> -             cpu->cfg.ext_zcmp || cpu->cfg.ext_zcmt) && !cpu->cfg.ext_zca) {
> -            error_setg(errp, "Zcf/Zcd/Zcb/Zcmp/Zcmt extensions require Zca "
> -                             "extension");
> -            return;
> -        }
> -
> -        if (cpu->cfg.ext_zcd && (cpu->cfg.ext_zcmp || cpu->cfg.ext_zcmt)) {
> -            error_setg(errp, "Zcmp/Zcmt extensions are incompatible with "
> -                             "Zcd extension");
> -            return;
> -        }
> -
> -        if (cpu->cfg.ext_zcmt && !cpu->cfg.ext_icsr) {
> -            error_setg(errp, "Zcmt extension requires Zicsr extension");
> -            return;
> -        }
> -
> -        if (cpu->cfg.ext_zk) {
> -            cpu->cfg.ext_zkn = true;
> -            cpu->cfg.ext_zkr = true;
> -            cpu->cfg.ext_zkt = true;
> -        }
> -
> -        if (cpu->cfg.ext_zkn) {
> -            cpu->cfg.ext_zbkb = true;
> -            cpu->cfg.ext_zbkc = true;
> -            cpu->cfg.ext_zbkx = true;
> -            cpu->cfg.ext_zkne = true;
> -            cpu->cfg.ext_zknd = true;
> -            cpu->cfg.ext_zknh = true;
> -        }
> -
> -        if (cpu->cfg.ext_zks) {
> -            cpu->cfg.ext_zbkb = true;
> -            cpu->cfg.ext_zbkc = true;
> -            cpu->cfg.ext_zbkx = true;
> -            cpu->cfg.ext_zksed = true;
> -            cpu->cfg.ext_zksh = true;
> -        }
> -
> -        if (cpu->cfg.ext_i) {
> -            ext |= RVI;
> -        }
> -        if (cpu->cfg.ext_e) {
> -            ext |= RVE;
> -        }
> -        if (cpu->cfg.ext_m) {
> -            ext |= RVM;
> -        }
> -        if (cpu->cfg.ext_a) {
> -            ext |= RVA;
> -        }
> -        if (cpu->cfg.ext_f) {
> -            ext |= RVF;
> -        }
> -        if (cpu->cfg.ext_d) {
> -            ext |= RVD;
> -        }
> -        if (cpu->cfg.ext_c) {
> -            ext |= RVC;
> -        }
> -        if (cpu->cfg.ext_s) {
> -            ext |= RVS;
> -        }
> -        if (cpu->cfg.ext_u) {
> -            ext |= RVU;
> -        }
> -        if (cpu->cfg.ext_h) {
> -            ext |= RVH;
> -        }
> -        if (cpu->cfg.ext_v) {
> -            int vext_version = VEXT_VERSION_1_00_0;
> -            ext |= RVV;
> -            if (!is_power_of_2(cpu->cfg.vlen)) {
> -                error_setg(errp,
> -                        "Vector extension VLEN must be power of 2");
> -                return;
> -            }
> -            if (cpu->cfg.vlen > RV_VLEN_MAX || cpu->cfg.vlen < 128) {
> -                error_setg(errp,
> -                        "Vector extension implementation only supports VLEN "
> -                        "in the range [128, %d]", RV_VLEN_MAX);
> -                return;
> -            }
> -            if (!is_power_of_2(cpu->cfg.elen)) {
> -                error_setg(errp,
> -                        "Vector extension ELEN must be power of 2");
> -                return;
> -            }
> -            if (cpu->cfg.elen > 64 || cpu->cfg.elen < 8) {
> -                error_setg(errp,
> -                        "Vector extension implementation only supports ELEN "
> -                        "in the range [8, 64]");
> -                return;
> -            }
> -            if (cpu->cfg.vext_spec) {
> -                if (!g_strcmp0(cpu->cfg.vext_spec, "v1.0")) {
> -                    vext_version = VEXT_VERSION_1_00_0;
> -                } else {
> -                    error_setg(errp,
> -                           "Unsupported vector spec version '%s'",
> -                           cpu->cfg.vext_spec);
> -                    return;
> -                }
> -            } else {
> -                qemu_log("vector version is not specified, "
> -                         "use the default value v1.0\n");
> -            }
> -            set_vext_version(env, vext_version);
> -        }
> -        if (cpu->cfg.ext_j) {
> -            ext |= RVJ;
> -        }
> -
> -        set_misa(env, env->misa_mxl, ext);
> +    riscv_cpu_validate_set_extensions(cpu, &local_err);
> +    if (local_err != NULL) {
> +        error_propagate(errp, local_err);
> +        return;
>      }
>
>  #ifndef CONFIG_USER_ONLY
> --
> 2.39.0
>
>

