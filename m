Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdgc0-000887-PM
	for mharc-qemu-riscv@gnu.org; Thu, 21 Oct 2021 18:32:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mdgbt-00080C-6z; Thu, 21 Oct 2021 18:32:29 -0400
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:33313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mdgbq-0005yh-Q0; Thu, 21 Oct 2021 18:32:28 -0400
Received: by mail-io1-xd2f.google.com with SMTP id p142so3041149iod.0;
 Thu, 21 Oct 2021 15:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/bazKAhRtRM7qW8kUik5ovIY950koShWzeTSwApm4UU=;
 b=JKay/rWCFkDyYlQ2LyboUmjn5RiCaEtzWsksUHWg9fgy9ZlgMT0suJKH5cZ2inYQAV
 01lLgy69Pk7qzFpD+/aVSf2ghl9rdlt+mq2bCAoFw8o1op+Xfmfqdvi2DxD9h4mUFZa4
 iBqq8vYZr8D4v9RsXhNJPrTFFSj6KCv5rIKGhZ6jsXi4YFxpUqRvofiijE50gGQF3ljG
 VFcRioGECuSZAKrbtMFn2AlZpWNNeAzeYnuyGJEx9dkJ5Yt4NTBK6gPJSTcIsx9sByvh
 MUikKFzjJiEQU1V9Wdlkg15udoY8ytanNmhvCsZBJ9GZwHVsUJaMrh36v6QAM7aWvbDv
 X/ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/bazKAhRtRM7qW8kUik5ovIY950koShWzeTSwApm4UU=;
 b=MdO5x+jiLAa9eLsvewAnmpwbQ5/EeTlYd+BcMvv5vJDCIgK+cFXEpKMG1gwND0erbN
 XcItVH2U3DZanmjM1DS4ybS/GLoEeHB4RLhKspPXS2ofUuUJ4Lpd6rfyaMXA80TR6mj2
 1KMYfaAW76XwodQk/i3XCaZJ16oOLN0qelFSeoWx1iRFSFOZ7JWidLsCv89S1CiU1pht
 vulB+1eLmgD4YWb8E2zotSZgtaEOeAAaqWNjuqLkLEbyB3o3kLoUzP7/rKJ/NoTFjdl9
 nwjH6nwXweyeTQY3h48myL4i6I06GK/NORKNhEO6FW4x5j/N2/Fjn70Md9FpqdYK8Ej+
 8UiA==
X-Gm-Message-State: AOAM5326lKhWEhWKBw9qGngzJCPPv/B/uT3/QUO4mZTyOA7v+Mn0piVM
 tM0xvzJFx04KqVuhTteggaPYfOMoPXggr36D5wQ=
X-Google-Smtp-Source: ABdhPJx3QVYLnodSrZwWymAEyPtPO3uuXnwXJI+ATJBNhuV283oxOSTaiZU5/0+Db7rUdHpX88n0huFYibqmxMoFC1s=
X-Received: by 2002:a05:6638:1192:: with SMTP id
 f18mr5650871jas.114.1634855544956; 
 Thu, 21 Oct 2021 15:32:24 -0700 (PDT)
MIME-Version: 1.0
References: <20211021162956.2772656-1-frank.chang@sifive.com>
 <20211021162956.2772656-2-frank.chang@sifive.com>
In-Reply-To: <20211021162956.2772656-2-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 22 Oct 2021 08:31:58 +1000
Message-ID: <CAKmqyKM7kf7mFrh6i33ZSbLtf6tLC=qSUmzRTvwk=H_rFYs3ZA@mail.gmail.com>
Subject: Re: [PATCH v5 1/8] target/riscv: zfh: half-precision load and store
To: Frank Chang <frank.chang@sifive.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Chih-Min Chao <chihmin.chao@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Kito Cheng <kito.cheng@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2f.google.com
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
X-List-Received-Date: Thu, 21 Oct 2021 22:32:29 -0000

On Fri, Oct 22, 2021 at 2:30 AM <frank.chang@sifive.com> wrote:
>
> From: Kito Cheng <kito.cheng@sifive.com>
>
> Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
> Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

It doesn't look like this made it through to the list. I only see v3
on patchew: https://patchew.org/QEMU/20211016090742.3034669-1-frank.chang@sifive.com/

Can you rebase this on
https://github.com/alistair23/qemu/tree/riscv-to-apply.next when you
re-send it?

Alistair

> ---
>  target/riscv/cpu.h                        |  1 +
>  target/riscv/insn32.decode                |  4 ++
>  target/riscv/insn_trans/trans_rvzfh.c.inc | 65 +++++++++++++++++++++++
>  target/riscv/translate.c                  |  8 +++
>  4 files changed, 78 insertions(+)
>  create mode 100644 target/riscv/insn_trans/trans_rvzfh.c.inc
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index a33dc30be81..da3c436987c 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -299,6 +299,7 @@ struct RISCVCPU {
>          bool ext_counters;
>          bool ext_ifencei;
>          bool ext_icsr;
> +        bool ext_zfh;
>
>          char *priv_spec;
>          char *user_spec;
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 2f251dac1bb..b36a3d8dbf8 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -726,3 +726,7 @@ binv       0110100 .......... 001 ..... 0110011 @r
>  binvi      01101. ........... 001 ..... 0010011 @sh
>  bset       0010100 .......... 001 ..... 0110011 @r
>  bseti      00101. ........... 001 ..... 0010011 @sh
> +
> +# *** RV32 Zfh Extension ***
> +flh        ............   ..... 001 ..... 0000111 @i
> +fsh        .......  ..... ..... 001 ..... 0100111 @s
> diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/insn_trans/trans_rvzfh.c.inc
> new file mode 100644
> index 00000000000..dad1d703d72
> --- /dev/null
> +++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
> @@ -0,0 +1,65 @@
> +/*
> + * RISC-V translation routines for the RV64Zfh Standard Extension.
> + *
> + * Copyright (c) 2020 Chih-Min Chao, chihmin.chao@sifive.com
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#define REQUIRE_ZFH(ctx) do { \
> +    if (!ctx->ext_zfh) {      \
> +        return false;         \
> +    }                         \
> +} while (0)
> +
> +static bool trans_flh(DisasContext *ctx, arg_flh *a)
> +{
> +    TCGv_i64 dest;
> +    TCGv t0;
> +
> +    REQUIRE_FPU;
> +    REQUIRE_ZFH(ctx);
> +
> +    t0 = get_gpr(ctx, a->rs1, EXT_NONE);
> +    if (a->imm) {
> +        TCGv temp = temp_new(ctx);
> +        tcg_gen_addi_tl(temp, t0, a->imm);
> +        t0 = temp;
> +    }
> +
> +    dest = cpu_fpr[a->rd];
> +    tcg_gen_qemu_ld_i64(dest, t0, ctx->mem_idx, MO_TEUW);
> +    gen_nanbox_h(dest, dest);
> +
> +    mark_fs_dirty(ctx);
> +    return true;
> +}
> +
> +static bool trans_fsh(DisasContext *ctx, arg_fsh *a)
> +{
> +    TCGv t0;
> +
> +    REQUIRE_FPU;
> +    REQUIRE_ZFH(ctx);
> +
> +    t0 = get_gpr(ctx, a->rs1, EXT_NONE);
> +    if (a->imm) {
> +        TCGv temp = tcg_temp_new();
> +        tcg_gen_addi_tl(temp, t0, a->imm);
> +        t0 = temp;
> +    }
> +
> +    tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], t0, ctx->mem_idx, MO_TEUW);
> +
> +    return true;
> +}
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index d38f87d7188..ad963d1898f 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -70,6 +70,7 @@ typedef struct DisasContext {
>      RISCVMXL ol;
>      bool virt_enabled;
>      bool ext_ifencei;
> +    bool ext_zfh;
>      bool hlsx;
>      /* vector extension */
>      bool vill;
> @@ -127,6 +128,11 @@ static void gen_nanbox_s(TCGv_i64 out, TCGv_i64 in)
>      tcg_gen_ori_i64(out, in, MAKE_64BIT_MASK(32, 32));
>  }
>
> +static void gen_nanbox_h(TCGv_i64 out, TCGv_i64 in)
> +{
> +    tcg_gen_ori_i64(out, in, MAKE_64BIT_MASK(16, 48));
> +}
> +
>  /*
>   * A narrow n-bit operation, where n < FLEN, checks that input operands
>   * are correctly Nan-boxed, i.e., all upper FLEN - n bits are 1.
> @@ -550,6 +556,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
>  #include "insn_trans/trans_rvh.c.inc"
>  #include "insn_trans/trans_rvv.c.inc"
>  #include "insn_trans/trans_rvb.c.inc"
> +#include "insn_trans/trans_rvzfh.c.inc"
>  #include "insn_trans/trans_privileged.c.inc"
>
>  /* Include the auto-generated decoder for 16 bit insn */
> @@ -602,6 +609,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>      ctx->misa_ext = env->misa_ext;
>      ctx->frm = -1;  /* unknown rounding mode */
>      ctx->ext_ifencei = cpu->cfg.ext_ifencei;
> +    ctx->ext_zfh = cpu->cfg.ext_zfh;
>      ctx->vlen = cpu->cfg.vlen;
>      ctx->mstatus_hs_fs = FIELD_EX32(tb_flags, TB_FLAGS, MSTATUS_HS_FS);
>      ctx->hlsx = FIELD_EX32(tb_flags, TB_FLAGS, HLSX);
> --
> 2.25.1
>
>

