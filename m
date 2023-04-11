Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pm38v-00021f-WD
	for mharc-qemu-riscv@gnu.org; Mon, 10 Apr 2023 21:49:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pm38u-000215-M4; Mon, 10 Apr 2023 21:49:56 -0400
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pm38s-0003uv-RY; Mon, 10 Apr 2023 21:49:56 -0400
Received: by mail-ua1-x92a.google.com with SMTP id ba16so4586880uab.4;
 Mon, 10 Apr 2023 18:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681177793; x=1683769793;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MmKXKynUQezMwAlTkDyGH3vSiztCoTlEXeYfu9yMFWg=;
 b=gEAPBI+iqLQMUEFDYwYx5jEqxT0zOYck+24iQUVgpAD+IkxXnPSFtOQhb/D2mChZTv
 UMlJn+K70IFXLEGMvSDqWWE4L+cQoRhE5turFFwKtmyyn8Su8LLxeCE+5EITRWM+OQtZ
 MX30T76qYkB+Xa74ss8WfTWa8G1Xm+LAeelJJxgJVfR5sCJmzWdvvghBiJPeCaytfbdT
 dyxAxMtCWRjuFk09UwgribTu0DzBHllJhS8TL0S6RsxXyTX2gV4J+tkPWm1Lg4p4bRoL
 rkJdeGhvW3YRnzew5mSDi0XV02w+Turb8SdYDEQ6g516f6OCnX4w5K4JCwwPSRPTT0dc
 1CxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681177793; x=1683769793;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MmKXKynUQezMwAlTkDyGH3vSiztCoTlEXeYfu9yMFWg=;
 b=iIVR7TvNsG37bbfXouTUOVPlKtW3XNO3Oyw+kSBugpBG66bMh0PlWnVeQX5tzE2Vx2
 9wpZ5noSJCLtRIfIIAOLTHI0WZVwb7ZyQuLyLseT5Fqvg3D084rqla2WvsT81eHhXSz5
 SudSoAaMa72KhtETYUFfXxyauZW7rYuWEOtyLwCIRxep5sudZ6MEem5UkAUP8css71lt
 Pi4AkBzwVMABwhTunTS+DWzjTIrFDginzNF/6jpzRDA7vjBem+wDes6TF5fBvk6hTi5f
 9dyoybCKva0XuPmsT/zC98r+67ApOkOCo6C0JqEkulZWnjksqxAVk02meOb65GhqqFU8
 Cp0Q==
X-Gm-Message-State: AAQBX9cWJnhnZLe1ice6jQAvpzPmslDNl0J5GQSCaDI51Ss3XZ7c6PcB
 x5Js/elIuzBkPVrdmorWJFRpMM9Tm/YSlxK+IJ8=
X-Google-Smtp-Source: AKy350b4rQ16/5Rsl/B5w6E6fv3j/GBKxDpzeEbKvCkz197y6rNnaAporOCiu3u7evis046NfKFZwZ+N2fmvU/KK4wg=
X-Received: by 2002:a1f:a64b:0:b0:43c:6ef1:84d3 with SMTP id
 p72-20020a1fa64b000000b0043c6ef184d3mr657632vke.0.1681177793119; Mon, 10 Apr
 2023 18:49:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230407014743.18779-1-liweiwei@iscas.ac.cn>
 <20230407014743.18779-3-liweiwei@iscas.ac.cn>
In-Reply-To: <20230407014743.18779-3-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 11 Apr 2023 11:49:26 +1000
Message-ID: <CAKmqyKO3ruUy_2KmMczL+-s50f43j+=+Ce7R_SuLje05Q_210Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] target/riscv: Use PRV_RESERVED instead of PRV_H
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
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
X-List-Received-Date: Tue, 11 Apr 2023 01:49:56 -0000

On Fri, Apr 7, 2023 at 11:49=E2=80=AFAM Weiwei Li <liweiwei@iscas.ac.cn> wr=
ote:
>
> PRV_H has no real meaning, but just a reserved privilege mode currently.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.h       | 2 +-
>  target/riscv/cpu_bits.h  | 2 +-
>  target/riscv/gdbstub.c   | 2 +-
>  target/riscv/op_helper.c | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index cbf3de2708..4af8ebc558 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -699,7 +699,7 @@ static inline RISCVMXL cpu_recompute_xl(CPURISCVState=
 *env)
>          case PRV_U:
>              xl =3D get_field(env->mstatus, MSTATUS64_UXL);
>              break;
> -        default: /* PRV_S | PRV_H */
> +        default: /* PRV_S */
>              xl =3D get_field(env->mstatus, MSTATUS64_SXL);
>              break;
>          }
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 101702cb4a..a16bfaf43f 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -608,7 +608,7 @@ typedef enum {
>  /* Privilege modes */
>  #define PRV_U 0
>  #define PRV_S 1
> -#define PRV_H 2 /* Reserved */
> +#define PRV_RESERVED 2
>  #define PRV_M 3
>
>  /* RV32 satp CSR field masks */
> diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
> index fa537aed74..524bede865 100644
> --- a/target/riscv/gdbstub.c
> +++ b/target/riscv/gdbstub.c
> @@ -203,7 +203,7 @@ static int riscv_gdb_set_virtual(CPURISCVState *cs, u=
int8_t *mem_buf, int n)
>      if (n =3D=3D 0) {
>  #ifndef CONFIG_USER_ONLY
>          cs->priv =3D ldtul_p(mem_buf) & 0x3;
> -        if (cs->priv =3D=3D PRV_H) {
> +        if (cs->priv =3D=3D PRV_RESERVED) {
>              cs->priv =3D PRV_S;
>          }
>  #endif
> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> index b8a03afebb..bd21c6eeef 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -141,7 +141,7 @@ static void check_zicbo_envcfg(CPURISCVState *env, ta=
rget_ulong envbits,
>      }
>
>      if (env->virt_enabled &&
> -        (((env->priv < PRV_H) && !get_field(env->henvcfg, envbits)) ||
> +        (((env->priv <=3D PRV_S) && !get_field(env->henvcfg, envbits)) |=
|
>           ((env->priv < PRV_S) && !get_field(env->senvcfg, envbits)))) {
>          riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, ra=
);
>      }
> --
> 2.25.1
>
>

