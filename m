Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkFTt-0008LA-St
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 22:36:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkFTr-0008JW-V4; Wed, 05 Apr 2023 22:36:08 -0400
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkFTq-0000Jm-4U; Wed, 05 Apr 2023 22:36:07 -0400
Received: by mail-ua1-x92a.google.com with SMTP id r21so1156989uaf.6;
 Wed, 05 Apr 2023 19:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680748564;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0WuSEfAZZ6VJncZ0TDs/AoDIqiw+TYmpwDkoGRiUxwA=;
 b=GU/2qoEHfmiJVqIFSCQ3squ4AJQBhsa0NPFEzRL7P3Nf7bfrK6xjcQLBuNfXOpA/As
 JLkE1zqSU0t9Qt7kjA0Bq3P6O1dFU89PJ1mnIaZHpA/vr7xMbjZ1HuCGDJRc2Gy+QavA
 KrMTKbkUiE9DzfVs+5Gz7IQAqGVyDweZWA/sfxLhGq0VP7yr+l5mIFAbeePGSjRz6h3Z
 aPaCKhjoV8XFcAQuie/NhYRFdxwNAtpThHXgN5bYEabZB0998wE/llU1uuI0/RAKxHRb
 UYXjh+Hr2DQ2g3aioX8PIzlPItJNiJb7csTILA9MFfFRq+QSx/zPcuFgnSdPbhNUugJ/
 v0TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680748564;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0WuSEfAZZ6VJncZ0TDs/AoDIqiw+TYmpwDkoGRiUxwA=;
 b=uxoBvRh7+UQHpZhKpy4+4xHJVwt/D+p5s/4dWztpZ4d/jPCsPaoaR5iE7GVvSfrGDC
 u2/ocblbMsvEH9inq30Ghr1DkWPrIpNHUIEEMrtfvZkB0oUhIES+QF3rHSR3LytbgqKg
 +eyTtjEE+jRARlC1lQcaxDa3gpGuEyWrP2w3S2QrfXhM5y/I25ViSK3X2DxMBw12JHhp
 Bys3afgEWx4vi+4iP20ge5YiRZlPVTm9gEYs93ryGNV+6PZJG5wv8EWuRqWb34paD+UT
 7ATonFOkg4VkrsezGtvcCN5xPbz9DgBrkshusECzhv01Kb70ZzTStXSrn41wfNlI8jsp
 z8Dg==
X-Gm-Message-State: AAQBX9focVbhfnFDJ2VOdqmUdDQ2C+LsuNsBJz4e9ypgYX0DxXuiMIK/
 fBOvcWEMfUIh8Vq84te3KaihySPLsjrOL/l7yGFjluVFb6Q=
X-Google-Smtp-Source: AKy350btYrpb7D/q+4NB239aHYxkxJlFiB5gDi6Lpu5xo4876DG40fK10K0gOHZf1tiSwYbxZ/hz8a+nR9oB6j6DDQQ=
X-Received: by 2002:ab0:474f:0:b0:688:c23f:c22f with SMTP id
 i15-20020ab0474f000000b00688c23fc22fmr6610910uac.1.1680748564605; Wed, 05 Apr
 2023 19:36:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
 <20230325105429.1142530-2-richard.henderson@linaro.org>
In-Reply-To: <20230325105429.1142530-2-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 6 Apr 2023 12:35:38 +1000
Message-ID: <CAKmqyKMMNGw-W1cUhmOnkKwj3KV5mi-iNMFdJ0o-Picm_T0efA@mail.gmail.com>
Subject: Re: [PATCH v6 01/25] target/riscv: Extract virt enabled state from tb
 flags
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 palmer@dabbelt.com, zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com, 
 Weiwei Li <liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92a;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92a.google.com
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
X-List-Received-Date: Thu, 06 Apr 2023 02:36:08 -0000

On Sat, Mar 25, 2023 at 9:58=E2=80=AFPM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
>
> Virt enabled state is not a constant. So we should put it into tb flags.
> Thus we can use it like a constant condition at translation phase.
>
> Reported-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Message-Id: <20230324143031.1093-2-zhiwei_liu@linux.alibaba.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.h        |  2 ++
>  target/riscv/cpu_helper.c |  2 ++
>  target/riscv/translate.c  | 10 +---------
>  3 files changed, 5 insertions(+), 9 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 638e47c75a..12fe8d8546 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -650,6 +650,8 @@ FIELD(TB_FLAGS, VTA, 24, 1)
>  FIELD(TB_FLAGS, VMA, 25, 1)
>  /* Native debug itrigger */
>  FIELD(TB_FLAGS, ITRIGGER, 26, 1)
> +/* Virtual mode enabled */
> +FIELD(TB_FLAGS, VIRT_ENABLED, 27, 1)
>
>  #ifdef TARGET_RISCV32
>  #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index f88c503cf4..9d50e7bbb6 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -104,6 +104,8 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_=
ulong *pc,
>
>          flags =3D FIELD_DP32(flags, TB_FLAGS, MSTATUS_HS_VS,
>                             get_field(env->mstatus_hs, MSTATUS_VS));
> +        flags =3D FIELD_DP32(flags, TB_FLAGS, VIRT_ENABLED,
> +                           get_field(env->virt, VIRT_ONOFF));
>      }
>      if (cpu->cfg.debug && !icount_enabled()) {
>          flags =3D FIELD_DP32(flags, TB_FLAGS, ITRIGGER, env->itrigger_en=
abled);
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 0ee8ee147d..880f6318aa 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -1156,15 +1156,7 @@ static void riscv_tr_init_disas_context(DisasConte=
xtBase *dcbase, CPUState *cs)
>      ctx->mstatus_fs =3D tb_flags & TB_FLAGS_MSTATUS_FS;
>      ctx->mstatus_vs =3D tb_flags & TB_FLAGS_MSTATUS_VS;
>      ctx->priv_ver =3D env->priv_ver;
> -#if !defined(CONFIG_USER_ONLY)
> -    if (riscv_has_ext(env, RVH)) {
> -        ctx->virt_enabled =3D riscv_cpu_virt_enabled(env);
> -    } else {
> -        ctx->virt_enabled =3D false;
> -    }
> -#else
> -    ctx->virt_enabled =3D false;
> -#endif
> +    ctx->virt_enabled =3D FIELD_EX32(tb_flags, TB_FLAGS, VIRT_ENABLED);
>      ctx->misa_ext =3D env->misa_ext;
>      ctx->frm =3D -1;  /* unknown rounding mode */
>      ctx->cfg_ptr =3D &(cpu->cfg);
> --
> 2.34.1
>
>

