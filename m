Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA86C46CA2
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 04:47:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rF5WK-00027M-Qv; Sun, 17 Dec 2023 23:46:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rF5WJ-00026a-3v; Sun, 17 Dec 2023 23:46:23 -0500
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rF5WH-0004ZL-A3; Sun, 17 Dec 2023 23:46:22 -0500
Received: by mail-ua1-x935.google.com with SMTP id
 a1e0cc1a2514c-7cb029c41e4so532626241.1; 
 Sun, 17 Dec 2023 20:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702874780; x=1703479580; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TUefVNGeHRMzAC1YJsqaPBriyFUzCVkRC8w6rUVQ30M=;
 b=ETEIMkkAXuuHpeS5v45jdQAmo88EnAmrvDwKKR/ACWtuRdiPddV78LbvK1cZcvSQI/
 hNOL7MpywKjt93m/3VR8ESsC4UbYRR7o8GLashdP6yMRhiqmFW9sMsi32tvGdYWRR37E
 Z8xhdF+xTZ0TPpKXcfgzJY7xTkbrPVnpw5vgm+3vJG7r+z7Iv7TIZ1+2rFH9Rx4hxq8W
 v+vEbrBXDNOuVHdfbmat8iLN2p1paIiLwpW/R5kMQyvcQVfrZgNKeiasGHZCiZ2mELFB
 us0yrpfd5MmY3UyN3wkOHAphbf7WS/dMobqCHW1iV4xXDJ916QAPf2kxFzDO3PIkVlfk
 1FdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702874780; x=1703479580;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TUefVNGeHRMzAC1YJsqaPBriyFUzCVkRC8w6rUVQ30M=;
 b=Huhy9WU4uC2RRk2E5lAz64gkpgKbcXH2/uDZ32TW0QgNTN43enWtavBQJcYYXiwNAP
 obRe+8kDkaUBcZCcZBPW/8dxheYiExMsgC49vlVVfB3Wsn5XVz2WoZbWuekA9RWAl+1p
 yZDIyW4TA9BE2OMNfb1dOXuuNLc2fgoZ4pK6apSWMMmcfxgzQ8kBDCvWgXd+9nyuzu50
 RJz24KbyiE42XD9MNWOjfIZnfoUcZcVw8foEQhRiDkNpcFZCu44woevVKDRUmXgsJtEB
 SKGQLM7TMOw2N8YdEMK82cnRbUNgyIlUgBVk71Kj5AFsx4+FKmDtMUVLEUXApGKQoTTg
 p55g==
X-Gm-Message-State: AOJu0YzKet/G9pdxGvGyRfmSE/f2/fRvt/spIHgQ/c+BWSR/Dfo9P4+p
 xypzTK57fvOBRkH2R7hCbU9jA/0DazCDK1LFCes=
X-Google-Smtp-Source: AGHT+IHp8K8vTILrzzczzIkoSNT9WtwEvFR2e/7qflzwG/wtdyslf60Nfe6pzlU2NkimWGIUzZXd/idwawTI5jKkbLA=
X-Received: by 2002:a05:6122:4688:b0:4ac:2316:5afa with SMTP id
 di8-20020a056122468800b004ac23165afamr12649537vkb.12.1702874779714; Sun, 17
 Dec 2023 20:46:19 -0800 (PST)
MIME-Version: 1.0
References: <20231217071628.151599-1-alvinga@andestech.com>
In-Reply-To: <20231217071628.151599-1-alvinga@andestech.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 Dec 2023 14:45:53 +1000
Message-ID: <CAKmqyKO5U6biAAEjuLjoOiUnC+3BHvHTVCSEnY69b0t69=qtDg@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Implement optional CSR mcontext of debug
 Sdtrig extension
To: Alvin Chang <alvinga@andestech.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, alistair.francis@wdc.com, 
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::935;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x935.google.com
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

On Sun, Dec 17, 2023 at 5:17=E2=80=AFPM Alvin Chang via <qemu-devel@nongnu.=
org> wrote:
>
> The debug Sdtrig extension defines an optional CSR "mcontext". Since it
> is optional, this commit adds new CPU configuration
> "ext_sdtrig_mcontext" and uses property "sdtrig_mcontext" to control
> whether it is implemented or not. Its predicate and read/write
> operations are also implemented into CSR table. Its value is reset as 0
> when the trigger module is reset.

We don't support the Sdtrig extension though. I'm guessing it's all
packaged up as part of the "debug" extension but should we expose
Sdtrig before we expose options for it?

Also, why can't we just always implement mcontext if Sdtrig exists? Is
there a reason to gate it behind a config?

Alistair

>
> Signed-off-by: Alvin Chang <alvinga@andestech.com>
> ---
>  target/riscv/cpu.c      |  4 ++++
>  target/riscv/cpu.h      |  1 +
>  target/riscv/cpu_bits.h |  7 +++++++
>  target/riscv/cpu_cfg.h  |  1 +
>  target/riscv/csr.c      | 36 ++++++++++++++++++++++++++++++++++++
>  target/riscv/debug.c    |  2 ++
>  6 files changed, 51 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 83c7c0c..dff757f 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1479,6 +1479,10 @@ Property riscv_cpu_options[] =3D {
>      DEFINE_PROP_UINT16("cbom_blocksize", RISCVCPU, cfg.cbom_blocksize, 6=
4),
>      DEFINE_PROP_UINT16("cboz_blocksize", RISCVCPU, cfg.cboz_blocksize, 6=
4),
>
> +    /* Optional CSR of debug Sdtrig extension */
> +    DEFINE_PROP_BOOL("sdtrig_mcontext", RISCVCPU, cfg.ext_sdtrig_mcontex=
t,
> +                     false),
> +
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index d74b361..e117641 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -345,6 +345,7 @@ struct CPUArchState {
>      target_ulong tdata1[RV_MAX_TRIGGERS];
>      target_ulong tdata2[RV_MAX_TRIGGERS];
>      target_ulong tdata3[RV_MAX_TRIGGERS];
> +    target_ulong mcontext;
>      struct CPUBreakpoint *cpu_breakpoint[RV_MAX_TRIGGERS];
>      struct CPUWatchpoint *cpu_watchpoint[RV_MAX_TRIGGERS];
>      QEMUTimer *itrigger_timer[RV_MAX_TRIGGERS];
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index ebd7917..3296648 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -361,6 +361,7 @@
>  #define CSR_TDATA2          0x7a2
>  #define CSR_TDATA3          0x7a3
>  #define CSR_TINFO           0x7a4
> +#define CSR_MCONTEXT        0x7a8
>
>  /* Debug Mode Registers */
>  #define CSR_DCSR            0x7b0
> @@ -905,4 +906,10 @@ typedef enum RISCVException {
>  /* JVT CSR bits */
>  #define JVT_MODE                           0x3F
>  #define JVT_BASE                           (~0x3F)
> +
> +/* Debug Sdtrig CSR masks */
> +#define MCONTEXT32                         0x0000003F
> +#define MCONTEXT64                         0x0000000000001FFFULL
> +#define MCONTEXT32_HCONTEXT                0x0000007F
> +#define MCONTEXT64_HCONTEXT                0x0000000000003FFFULL
>  #endif
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index f4605fb..4f1cb04 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -147,6 +147,7 @@ struct RISCVCPUConfig {
>      bool pmp;
>      bool debug;
>      bool misa_w;
> +    bool ext_sdtrig_mcontext;
>
>      bool short_isa_string;
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index fde7ce1..0b68787 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -549,6 +549,15 @@ static RISCVException debug(CPURISCVState *env, int =
csrno)
>
>      return RISCV_EXCP_ILLEGAL_INST;
>  }
> +
> +static RISCVException sdtrig_mcontext(CPURISCVState *env, int csrno)
> +{
> +    if (riscv_cpu_cfg(env)->debug && riscv_cpu_cfg(env)->ext_sdtrig_mcon=
text) {
> +        return RISCV_EXCP_NONE;
> +    }
> +
> +    return RISCV_EXCP_ILLEGAL_INST;
> +}
>  #endif
>
>  static RISCVException seed(CPURISCVState *env, int csrno)
> @@ -3900,6 +3909,31 @@ static RISCVException read_tinfo(CPURISCVState *en=
v, int csrno,
>      return RISCV_EXCP_NONE;
>  }
>
> +static RISCVException read_mcontext(CPURISCVState *env, int csrno,
> +                                    target_ulong *val)
> +{
> +    *val =3D env->mcontext;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_mcontext(CPURISCVState *env, int csrno,
> +                                     target_ulong val)
> +{
> +    bool rv32 =3D riscv_cpu_mxl(env) =3D=3D MXL_RV32 ? true : false;
> +    int32_t mask;
> +
> +    if (riscv_has_ext(env, RVH)) {
> +        /* Spec suggest 7-bit for RV32 and 14-bit for RV64 w/ H extensio=
n */
> +        mask =3D rv32 ? MCONTEXT32_HCONTEXT : MCONTEXT64_HCONTEXT;
> +    } else {
> +        /* Spec suggest 6-bit for RV32 and 13-bit for RV64 w/o H extensi=
on */
> +        mask =3D rv32 ? MCONTEXT32 : MCONTEXT64;
> +    }
> +
> +    env->mcontext =3D val & mask;
> +    return RISCV_EXCP_NONE;
> +}
> +
>  /*
>   * Functions to access Pointer Masking feature registers
>   * We have to check if current priv lvl could modify
> @@ -4799,6 +4833,8 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
>      [CSR_TDATA2]    =3D  { "tdata2",  debug, read_tdata,   write_tdata  =
 },
>      [CSR_TDATA3]    =3D  { "tdata3",  debug, read_tdata,   write_tdata  =
 },
>      [CSR_TINFO]     =3D  { "tinfo",   debug, read_tinfo,   write_ignore =
 },
> +    [CSR_MCONTEXT]  =3D  { "mcontext", sdtrig_mcontext,    read_mcontext=
,
> +                         write_mcontext                                }=
,
>
>      /* User Pointer Masking */
>      [CSR_UMTE]    =3D    { "umte",    pointer_masking, read_umte,  write=
_umte },
> diff --git a/target/riscv/debug.c b/target/riscv/debug.c
> index 4945d1a..e30d99c 100644
> --- a/target/riscv/debug.c
> +++ b/target/riscv/debug.c
> @@ -940,4 +940,6 @@ void riscv_trigger_reset_hold(CPURISCVState *env)
>          env->cpu_watchpoint[i] =3D NULL;
>          timer_del(env->itrigger_timer[i]);
>      }
> +
> +    env->mcontext =3D 0;
>  }
> --
> 2.34.1
>
>

