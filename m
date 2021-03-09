Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lJd3J-0001Jb-Fl
	for mharc-qemu-riscv@gnu.org; Tue, 09 Mar 2021 09:09:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lJd3H-0001EF-8G; Tue, 09 Mar 2021 09:09:35 -0500
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:36554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lJd3F-0006Rh-A0; Tue, 09 Mar 2021 09:09:34 -0500
Received: by mail-io1-xd32.google.com with SMTP id n14so14046292iog.3;
 Tue, 09 Mar 2021 06:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Mg7f6S3hgyM0etM3rGcj4N6RNXXuK0yZ3qf8DfzYumk=;
 b=uar9IfyvmDSKp1P5UFrBho8Kp2bv4Sv0OujCynzdLvoxLxK2DTmlSNYPqKzHvDQSYg
 bLlpm2fd0HWSIRpl0Nggfa+cGUCjNmO/IOrfOw+impxNLUz9fzprrDBo6TrFy/9Qf9HL
 Zpm/D8ZzsQOwCUaBLVzRA0GAduE+/HLaqKi52lbMpWrj1LRC7gDIALJL7qHVx1561yrf
 PuD3HLpUvcns4ZM3Oys9wurvIQJDPaPNMgIrxEtgfJdOuq12HE0qtlYMdNYcHtJG5zM+
 iH/wHCTkYGt1mD8EBzSlX4qjBzqFPMnSbF4XJRmnDin0dnhmbqjNtUTSbQAPOulwDY3y
 Tm8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Mg7f6S3hgyM0etM3rGcj4N6RNXXuK0yZ3qf8DfzYumk=;
 b=KkuDZr9///kxC1T5ygCQ3Wq7VxhZUWP1pRhoBFjB31FF9LAgvMPuwzp3g/AhPdEarR
 pYhUV901bJWmYjN6E+0oMOlv725vHtc7dDhv6a6A1UuyHDRtC0+4WcXY6ELVrtLrQ4Eh
 gbAhIsF6fnjYN/pw7QlKKgDBtITZ02QwVsGN2DxS6Mpl3eHUGz6vKLwvftOSj+HgDJv2
 NbtIN3Ix39dbaweL/kFEzMvNPdMkbsW41Kgu8QOenegWO3UQnthY6rxY0Pm3vj+YVzLE
 cNr4KjsGWeIcniiUNZXyobLTbo3YLY/FvN31jXbTInmbXSCXWU0pRjCYwjUpZU3bWBIi
 mVZg==
X-Gm-Message-State: AOAM533Yc7Sc4gm+8287lZbHN53mA69CSeGtQ/MNzraB2AINYZ7YOiZS
 j2QiT6+4AtGG029ZTcbRgiNrz2tDaq2r9ISZTUg=
X-Google-Smtp-Source: ABdhPJwN4AZv/wINW1ETs4E6Pz+MZZyQJNn30izrxqoL0UqP+POuCk3mZUs0POfDBFb0jHl/MILnGR93uaBgeACoRYU=
X-Received: by 2002:a05:6602:14cb:: with SMTP id
 b11mr23466225iow.175.1615298971267; 
 Tue, 09 Mar 2021 06:09:31 -0800 (PST)
MIME-Version: 1.0
References: <20210212150256.885-1-zhiwei_liu@c-sky.com>
 <20210212150256.885-2-zhiwei_liu@c-sky.com>
In-Reply-To: <20210212150256.885-2-zhiwei_liu@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 9 Mar 2021 09:08:09 -0500
Message-ID: <CAKmqyKN8hL6+wjiMUHcmbVsNgy9LRU+ah5LQmS1wU-=miTfvTg@mail.gmail.com>
Subject: Re: [PATCH 01/38] target/riscv: implementation-defined constant
 parameters
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d32;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd32.google.com
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
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Mar 2021 14:09:35 -0000

On Fri, Feb 12, 2021 at 10:05 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> ext_p64 is whether to support Zp64 extension in RV32, default value is true.
> pext_ver is the packed specification version, default value is v0.9.2.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c       | 29 +++++++++++++++++++++++++++++
>  target/riscv/cpu.h       |  6 ++++++
>  target/riscv/translate.c |  2 ++
>  3 files changed, 37 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 16f1a34238..1b99f629ec 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -132,6 +132,11 @@ static void set_vext_version(CPURISCVState *env, int vext_ver)
>      env->vext_ver = vext_ver;
>  }
>
> +static void set_pext_version(CPURISCVState *env, int pext_ver)
> +{
> +    env->pext_ver = pext_ver;
> +}
> +
>  static void set_feature(CPURISCVState *env, int feature)
>  {
>      env->features |= (1ULL << feature);
> @@ -380,6 +385,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>      RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
>      int priv_version = PRIV_VERSION_1_11_0;
>      int vext_version = VEXT_VERSION_0_07_1;
> +    int pext_version = PEXT_VERSION_0_09_2;
>      target_ulong target_misa = env->misa;
>      Error *local_err = NULL;
>
> @@ -404,6 +410,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>
>      set_priv_version(env, priv_version);
>      set_vext_version(env, vext_version);
> +    set_pext_version(env, pext_version);
>
>      if (cpu->cfg.mmu) {
>          set_feature(env, RISCV_FEATURE_MMU);
> @@ -511,6 +518,28 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>              }
>              set_vext_version(env, vext_version);
>          }
> +        if (cpu->cfg.ext_p) {
> +            target_misa |= RVP;
> +            if (cpu->cfg.pext_spec) {
> +                if (!g_strcmp0(cpu->cfg.pext_spec, "v0.9.2")) {
> +                    pext_version = PEXT_VERSION_0_09_2;
> +                } else {
> +                    error_setg(errp,
> +                               "Unsupported packed spec version '%s'",
> +                               cpu->cfg.pext_spec);
> +                    return;
> +                }
> +            } else {
> +                qemu_log("packed verison is not specified, "
> +                         "use the default value v0.9.2\n");
> +            }
> +            if (!cpu->cfg.ext_p64 && env->misa == RV64) {
> +                error_setg(errp, "For RV64, the Zp64 instructions will be "
> +                                 "included in the baseline P extension.");
> +                return;
> +            }
> +            set_pext_version(env, pext_version);
> +        }
>
>          set_misa(env, target_misa);
>      }
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 02758ae0eb..f458722646 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -68,6 +68,7 @@
>  #define RVF RV('F')
>  #define RVD RV('D')
>  #define RVV RV('V')
> +#define RVP RV('P')
>  #define RVC RV('C')
>  #define RVS RV('S')
>  #define RVU RV('U')
> @@ -87,6 +88,7 @@ enum {
>  #define PRIV_VERSION_1_11_0 0x00011100
>
>  #define VEXT_VERSION_0_07_1 0x00000701
> +#define PEXT_VERSION_0_09_2 0x00000902
>
>  enum {
>      TRANSLATE_SUCCESS,
> @@ -134,6 +136,7 @@ struct CPURISCVState {
>
>      target_ulong priv_ver;
>      target_ulong vext_ver;
> +    target_ulong pext_ver;
>      target_ulong misa;
>      target_ulong misa_mask;
>
> @@ -288,13 +291,16 @@ struct RISCVCPU {
>          bool ext_u;
>          bool ext_h;
>          bool ext_v;
> +        bool ext_p;
>          bool ext_counters;
>          bool ext_ifencei;
>          bool ext_icsr;
> +        bool ext_p64;
>
>          char *priv_spec;
>          char *user_spec;
>          char *vext_spec;
> +        char *pext_spec;
>          uint16_t vlen;
>          uint16_t elen;
>          bool mmu;
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 0f28b5f41e..eb810efec6 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -56,6 +56,7 @@ typedef struct DisasContext {
>         to reset this known value.  */
>      int frm;
>      bool ext_ifencei;
> +    bool ext_p64;
>      bool hlsx;
>      /* vector extension */
>      bool vill;
> @@ -824,6 +825,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>      ctx->lmul = FIELD_EX32(tb_flags, TB_FLAGS, LMUL);
>      ctx->mlen = 1 << (ctx->sew  + 3 - ctx->lmul);
>      ctx->vl_eq_vlmax = FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
> +    ctx->ext_p64 = cpu->cfg.ext_p64;
>      ctx->cs = cs;
>  }
>
> --
> 2.17.1
>

