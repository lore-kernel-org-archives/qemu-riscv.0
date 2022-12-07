Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p2kh0-0002kT-8X
	for mharc-qemu-riscv@gnu.org; Tue, 06 Dec 2022 22:01:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p2kgx-0002k2-Qn; Tue, 06 Dec 2022 22:01:52 -0500
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p2kgu-0005uM-K1; Tue, 06 Dec 2022 22:01:51 -0500
Received: by mail-vk1-xa2c.google.com with SMTP id z23so3730235vkb.12;
 Tue, 06 Dec 2022 19:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+kAoj9+b9Bei6CkQx7dHqGcMrkv0+Fo/GyNEGpuH0ts=;
 b=Rpl2pNKjuqLWNl2JMplpHSoPBh7e3E8m/3y7/im3YRclwSNwMF8Kof+CEHZFzD1xAC
 wVL9U9+bvRhn0s7sx+Ek4V7rQYZRaKs9dC3kdmJmW2cqd0cifwmy3CJpfRlsMpMB0ktC
 i0gz6b5D8U3SS1OatY3kdaVmzHOR0+IQCyb1j/XJGneKhvLjQh9w8OE/TKH1v6fihQ8E
 1obSg5fnqbJkFI155epCqI9mUL0iIOgD6JwlCz/rRZEvah4gJIu6cRW97TfZCw+xUCBh
 faxwDoOvWDi2RKVIAS7XyHdSl0FJAO4WvUeXQt/Qktx5A/R3kduCN5JxxOVr0RxGd1yK
 5T7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+kAoj9+b9Bei6CkQx7dHqGcMrkv0+Fo/GyNEGpuH0ts=;
 b=gSjGisED8HojIoZYKpj8SD7WBKWVOlh/grckblSC0RTKkY3BBBc7GrfvbX0B7t7UL1
 MPqlTCS8asSuXoC/up4eMM5uwM+dzCVHpv4zxYNgMqE3NEJKEYS/10bjapLz2JgWyYSa
 +n0MU0kmCbNO+SIoqj/HAVc0Sve9RRbksF4fLOdoRElB8mGDSETTHS3yrXY/6SatYr+1
 CgHkP/rlmvS61WBiGie8yLuP396Fgn/HEB9bHIZMOKRMSHEx9f5Kem58hY4UO5aMgm1d
 ZQoMEWF0K6Y1KG8zUBBtbT4jFJf4bSS0fGPmZSJcj58XwR8+CueR6st/bG0ar4cUqbk9
 anag==
X-Gm-Message-State: ANoB5pmCB4yJBfo2LUFB1GVLofP4ai5wN1aBqnsxW6/mxdTqRRXSLjBh
 hyxI+RGqNKUjh1D0oXA4JHVp8XYWpa/y9jnRWtUm/f7DlxI=
X-Google-Smtp-Source: AA0mqf4++ijZ+GfFVZIz+dlWwAf4DXY6MaRKyAXWe56RKQ+MnOpqPUM4PBu2djIprGW2GZyLA90RrCWe4INfPtqMQX4=
X-Received: by 2002:a1f:5e06:0:b0:3bd:3aeb:3006 with SMTP id
 s6-20020a1f5e06000000b003bd3aeb3006mr15356166vkb.26.1670382107121; Tue, 06
 Dec 2022 19:01:47 -0800 (PST)
MIME-Version: 1.0
References: <20221005144948.3421504-1-christoph.muellner@vrull.eu>
In-Reply-To: <20221005144948.3421504-1-christoph.muellner@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 7 Dec 2022 13:01:20 +1000
Message-ID: <CAKmqyKOMn5SkAM+T1OJN_nVHtFWUyHK2FMtdZPKOtHAzz2i-MQ@mail.gmail.com>
Subject: Re: [PATCH v4] RISC-V: Add Zawrs ISA extension support
To: Christoph Muellner <christoph.muellner@vrull.eu>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko.stuebner@vrull.eu>, 
 Aaron Durbin <adurbin@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2c;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2c.google.com
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
X-List-Received-Date: Wed, 07 Dec 2022 03:01:52 -0000

On Thu, Oct 6, 2022 at 12:52 AM Christoph Muellner
<christoph.muellner@vrull.eu> wrote:
>
> This patch adds support for the Zawrs ISA extension.
> Given the current (incomplete) implementation of reservation sets
> there seems to be no way to provide a full emulation of the WRS
> instruction (wake on reservation set invalidation or timeout or
> interrupt). Therefore, we just exit the TB and return to the main loop.
>
> The specification can be found here:
>   https://github.com/riscv/riscv-zawrs/blob/main/zawrs.adoc
>
> Note, that the Zawrs extension is frozen, but not ratified yet.
>
> Changes since v3:
> * Remove "RFC" since the extension is frozen
> * Rebase on master and fix integration issues
> * Fix entry ordering in extension list
>
> Changes since v2:
> * Rebase on master and resolve conflicts
> * Adjustments according to a specification change
> * Inline REQUIRE_ZAWRS() since it has only one user
>
> Changes since v1:
> * Adding zawrs to the ISA string that is passed to the kernel
>
> Signed-off-by: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
> ---
>  target/riscv/cpu.c                          |  7 +++
>  target/riscv/cpu.h                          |  1 +
>  target/riscv/insn32.decode                  |  4 ++
>  target/riscv/insn_trans/trans_rvzawrs.c.inc | 51 +++++++++++++++++++++
>  target/riscv/translate.c                    |  1 +
>  5 files changed, 64 insertions(+)
>  create mode 100644 target/riscv/insn_trans/trans_rvzawrs.c.inc
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index b29c88b9f0..b08ce94ba6 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -76,6 +76,7 @@ static const struct isa_ext_data isa_edata_arr[] =3D {
>      ISA_EXT_DATA_ENTRY(zicsr, true, PRIV_VERSION_1_10_0, ext_icsr),
>      ISA_EXT_DATA_ENTRY(zifencei, true, PRIV_VERSION_1_10_0, ext_ifencei)=
,
>      ISA_EXT_DATA_ENTRY(zihintpause, true, PRIV_VERSION_1_10_0, ext_zihin=
tpause),
> +    ISA_EXT_DATA_ENTRY(zawrs, true, PRIV_VERSION_1_12_0, ext_zawrs),
>      ISA_EXT_DATA_ENTRY(zfh, true, PRIV_VERSION_1_12_0, ext_zfh),
>      ISA_EXT_DATA_ENTRY(zfhmin, true, PRIV_VERSION_1_12_0, ext_zfhmin),
>      ISA_EXT_DATA_ENTRY(zfinx, true, PRIV_VERSION_1_12_0, ext_zfinx),
> @@ -744,6 +745,11 @@ static void riscv_cpu_realize(DeviceState *dev, Erro=
r **errp)
>              return;
>          }
>
> +        if ((cpu->cfg.ext_zawrs) && !cpu->cfg.ext_a) {
> +            error_setg(errp, "Zawrs extension requires A extension");
> +            return;
> +        }
> +
>          if ((cpu->cfg.ext_zfh || cpu->cfg.ext_zfhmin) && !cpu->cfg.ext_f=
) {
>              error_setg(errp, "Zfh/Zfhmin extensions require F extension"=
);
>              return;
> @@ -999,6 +1005,7 @@ static Property riscv_cpu_extensions[] =3D {
>      DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
>      DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
>      DEFINE_PROP_BOOL("Zihintpause", RISCVCPU, cfg.ext_zihintpause, true)=
,
> +    DEFINE_PROP_BOOL("Zawrs", RISCVCPU, cfg.ext_zawrs, true),
>      DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
>      DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
>      DEFINE_PROP_BOOL("Zve32f", RISCVCPU, cfg.ext_zve32f, false),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index b131fa8c8e..2b87966373 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -446,6 +446,7 @@ struct RISCVCPUConfig {
>      bool ext_svnapot;
>      bool ext_svpbmt;
>      bool ext_zdinx;
> +    bool ext_zawrs;
>      bool ext_zfh;
>      bool ext_zfhmin;
>      bool ext_zfinx;
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index d0253b8104..b7e7613ea2 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -718,6 +718,10 @@ vsetvli         0 ........... ..... 111 ..... 101011=
1  @r2_zimm11
>  vsetivli        11 .......... ..... 111 ..... 1010111  @r2_zimm10
>  vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
>
> +# *** Zawrs Standard Extension ***
> +wrs_nto    000000001101 00000 000 00000 1110011
> +wrs_sto    000000011101 00000 000 00000 1110011
> +
>  # *** RV32 Zba Standard Extension ***
>  sh1add     0010000 .......... 010 ..... 0110011 @r
>  sh2add     0010000 .......... 100 ..... 0110011 @r
> diff --git a/target/riscv/insn_trans/trans_rvzawrs.c.inc b/target/riscv/i=
nsn_trans/trans_rvzawrs.c.inc
> new file mode 100644
> index 0000000000..f0da2fe50a
> --- /dev/null
> +++ b/target/riscv/insn_trans/trans_rvzawrs.c.inc
> @@ -0,0 +1,51 @@
> +/*
> + * RISC-V translation routines for the RISC-V Zawrs Extension.
> + *
> + * Copyright (c) 2022 Christoph Muellner, christoph.muellner@vrull.io
> + *
> + * This program is free software; you can redistribute it and/or modify =
it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOU=
T
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License=
 for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License alo=
ng with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +static bool trans_wrs(DisasContext *ctx)
> +{
> +    if (!ctx->cfg_ptr->ext_zawrs) {
> +        return false;
> +    }
> +
> +    /*
> +     * The specification says:
> +     * While stalled, an implementation is permitted to occasionally
> +     * terminate the stall and complete execution for any reason.
> +     *
> +     * So let's just exit TB and return to the main loop.
> +     */
> +
> +    /* Clear the load reservation  (if any).  */
> +    tcg_gen_movi_tl(load_res, -1);
> +
> +    gen_set_pc_imm(ctx, ctx->pc_succ_insn);
> +    tcg_gen_exit_tb(NULL, 0);
> +    ctx->base.is_jmp =3D DISAS_NORETURN;
> +
> +    return true;
> +}
> +
> +#define GEN_TRANS_WRS(insn)                                            \
> +static bool trans_ ## insn(DisasContext *ctx, arg_ ## insn *a)         \
> +{                                                                      \
> +       (void)a;                                                        \
> +       return trans_wrs(ctx);                                          \
> +}

There are tabs here picked up by checkpatch. I have replaced them with spac=
es

Alistair

> +
> +GEN_TRANS_WRS(wrs_nto)
> +GEN_TRANS_WRS(wrs_sto)
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index db123da5ec..e22de88e97 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -1029,6 +1029,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase,=
 target_ulong pc)
>  #include "insn_trans/trans_rvh.c.inc"
>  #include "insn_trans/trans_rvv.c.inc"
>  #include "insn_trans/trans_rvb.c.inc"
> +#include "insn_trans/trans_rvzawrs.c.inc"
>  #include "insn_trans/trans_rvzfh.c.inc"
>  #include "insn_trans/trans_rvk.c.inc"
>  #include "insn_trans/trans_privileged.c.inc"
> --
> 2.37.3
>
>

