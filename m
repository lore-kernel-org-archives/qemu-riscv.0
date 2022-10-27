Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ontYW-0000Bz-QP
	for mharc-qemu-riscv@gnu.org; Wed, 26 Oct 2022 23:27:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ontYU-0000Ba-Hh; Wed, 26 Oct 2022 23:27:42 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ontYS-0003WD-F3; Wed, 26 Oct 2022 23:27:42 -0400
Received: by mail-pg1-x534.google.com with SMTP id f9so37243pgj.2;
 Wed, 26 Oct 2022 20:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=30/CWtZumxL8cO3B69tDETNOttBFlSjbDfPjujGfQ6U=;
 b=HvJtuALOL2ppHXnCl7e9ikEhsG9j5BhYyjrgkp5QN0R7ewKvrhNANRHNDlr9HBvsNA
 1Y1TLRgtqsE4ezZh0TRTQVJ5CRHHQBuGmoeG6Ei4ShigW2KAWn1WJtapi2JvxL1jUY99
 chEF4Kn5Co61jpo3OrcLQgTZpoNbwdyW5O2U685RpHPoHt9gtTOCAun4WzSsnOQMWyoN
 OZ3hKrEMH881KxHn/370M4pLib6sOPoVcL5tA8o98s+OQYgumYxJKSWZVtFz1H2TLt6p
 8iS5XqCIOXw6xZTlhmnyyaZOb1noKSyQRofTYWKiPTnV2+Wf7ot2CfhWCUwDKoBKkU6B
 a1Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=30/CWtZumxL8cO3B69tDETNOttBFlSjbDfPjujGfQ6U=;
 b=pj7Gz4W+SIuTkA83vLC+82cOnUOWXI2DmAyzoOvF669hiKMZ8ZQHl6HlMk86VZg2eE
 qg29TGnek/V0UDloINJNjjUApwhYN5pnd+fwmJx4NIhZNUwuVvnVRiGMij3MJme3xPWX
 gnCHg9WZ8nCovRDK3uUPjpyW5/xaNgJhacZBigWE8vSXObUb5C5hUV2dKRk00BzIExgQ
 Oc1ZbmO9xRKI0zsIJAA37pfn9TtQbPm6MiSD7GzeyegwIdnxiPKh+hqOsBWkVNCxyV2u
 aonBP1pKImUImVlQ2WVcf7U/Wf1husGBrxikVJIAOpyUp3CzPuVOVA++P/PNaTKRoBOT
 +iSA==
X-Gm-Message-State: ACrzQf3ZUZAoNV9UD84Dv+YC7OMtSsgdArfZg6LSzi8/4kVTFKi48ELx
 srXMSfRjuHlmxmzMo2pmvGue7eI+bp+gy8+qRuM=
X-Google-Smtp-Source: AMsMyM6UCzhwpSJrjctbvQ04BrW5NJXDn8oReZOWd9biYLBTq1E4vFe+IzEQNyenwz6f5SHBX089mWqdpMSUvc0J3As=
X-Received: by 2002:a63:ce43:0:b0:45b:d6ed:6c2 with SMTP id
 r3-20020a63ce43000000b0045bd6ed06c2mr40076715pgi.406.1666841258621; Wed, 26
 Oct 2022 20:27:38 -0700 (PDT)
MIME-Version: 1.0
References: <20221005144948.3421504-1-christoph.muellner@vrull.eu>
In-Reply-To: <20221005144948.3421504-1-christoph.muellner@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 27 Oct 2022 13:27:12 +1000
Message-ID: <CAKmqyKOEzE+jyp2bg+voLoBXzHK6yb-Pd166d22D5oTrmxB60g@mail.gmail.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x534.google.com
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
X-List-Received-Date: Thu, 27 Oct 2022 03:27:42 -0000

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

Thanks!

Applied to riscv-to-apply.next

Alistair

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

