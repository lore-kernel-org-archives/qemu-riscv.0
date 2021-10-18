Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcG8A-0002N5-7D
	for mharc-qemu-riscv@gnu.org; Sun, 17 Oct 2021 20:03:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mcG86-0002I1-P7; Sun, 17 Oct 2021 20:03:52 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:40679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mcG84-00087D-Ne; Sun, 17 Oct 2021 20:03:50 -0400
Received: by mail-io1-xd2e.google.com with SMTP id x1so14199764iof.7;
 Sun, 17 Oct 2021 17:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gT7mIW9tXL5hebNU2cAXlm0HtIb3BMh4yZbqh64MIvo=;
 b=hy/seBh+1E1fbiettC69n17/3+D4q3SJ/GDbvmac8ZZWECFhJ7sW9hmNiJlxY7ZS76
 csM9rsQesehDGV6N77Dkn4plo9En5J62c0KdKUY9Kh9cpeknHlHR/cx2gdPF9unr+keY
 u6pPC1LT25yvYHpMo1JUShVBkEgPT0pUq8o/GeRvQ/bcqosYlSTFtQrYshxtirqTrNXV
 Ep5cZRHT94o8BKraIEGefHM+lVHML8NH3BCqphiTLPMNYtFCoZICyCxch2+wZFA7Ywsr
 YXeAgOiAHE81N4LQ3DtIPveuS34qejv4aWLojjbLAicKBmBWyAIip/LzRsp07oIf/2EP
 u8XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gT7mIW9tXL5hebNU2cAXlm0HtIb3BMh4yZbqh64MIvo=;
 b=6yCAhY/U77yFgqLfXsN4IdtAs7c0Gr8IDWtSdCTdt8/KIKDpLUSbg7o59xCal7su9Z
 yw+mH8FfRuwJuXOSXfZLRtQFpTHAZbBAgvk8Yv0xNDyOs6k2tzySYUqp3BcyVC+qKryc
 9mX58dU/CUCMrQa6Du+njPpkcClj718sxbqzz9kgLZV9bX4mhdt1W08gtoAPSQrEA7tj
 e8lFjSGyIZLHGhAwmLJVxUoO59LNv4Al7UbVFZ0+KEQEcsgyiF+1KG7a3mNZ4648eQOu
 DeXAfYNsWRi7CS7ynvhh1U6ORJN1Psz8yWbBGoDMZ9Mx/HEnjEMdhupmxTPVp3yiae32
 kJ6w==
X-Gm-Message-State: AOAM5338hEwb93Iz3W4aaufOCi86DLMSl+z5ObLzzUbDouz6a8zFY///
 h1Fk7DQSq2+QVtOu/VoZId6OP0TjI+qyhEIiJDc=
X-Google-Smtp-Source: ABdhPJziWAPe8LnDlsWLOQjV6krNh7PuuWhMYLXQlGQa20Lv+PjSUhP63R4ZzmaoDSLMrXQOw8sl+lpzPLfKf/hhKPo=
X-Received: by 2002:a05:6638:32a6:: with SMTP id
 f38mr13067290jav.63.1634515427187; 
 Sun, 17 Oct 2021 17:03:47 -0700 (PDT)
MIME-Version: 1.0
References: <20211016090742.3034669-1-frank.chang@sifive.com>
 <20211016090742.3034669-2-frank.chang@sifive.com>
In-Reply-To: <20211016090742.3034669-2-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 Oct 2021 10:03:20 +1000
Message-ID: <CAKmqyKNoHJj=W8L-KP+MohddNmzj1qquiEJ6bTQG4GwCSoa1xg@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] target/riscv: zfh: half-precision load and store
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Chih-Min Chao <chihmin.chao@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Kito Cheng <kito.cheng@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2e.google.com
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
X-List-Received-Date: Mon, 18 Oct 2021 00:03:52 -0000

On Sat, Oct 16, 2021 at 7:08 PM <frank.chang@sifive.com> wrote:
>
> From: Kito Cheng <kito.cheng@sifive.com>
>
> Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
> Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/riscv/cpu.c                        |  1 +
>  target/riscv/cpu.h                        |  1 +
>  target/riscv/insn32.decode                |  4 ++
>  target/riscv/insn_trans/trans_rvzfh.c.inc | 65 +++++++++++++++++++++++
>  target/riscv/translate.c                  |  8 +++
>  5 files changed, 79 insertions(+)
>  create mode 100644 target/riscv/insn_trans/trans_rvzfh.c.inc
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 1d69d1887e6..8c579dc297b 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -601,6 +601,7 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
>      DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
>      DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
> +    DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),

This change should be after patch 5. The idea is that we add the
functionality and then allow users to enable it.

Otherwise:

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>      DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
>      DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
>      DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 9e55b2f5b17..88684e72be1 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -297,6 +297,7 @@ struct RISCVCPU {
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
> index d2442f0cf5d..75048149f5a 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -69,6 +69,7 @@ typedef struct DisasContext {
>      bool w;
>      bool virt_enabled;
>      bool ext_ifencei;
> +    bool ext_zfh;
>      bool hlsx;
>      /* vector extension */
>      bool vill;
> @@ -118,6 +119,11 @@ static void gen_nanbox_s(TCGv_i64 out, TCGv_i64 in)
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
> @@ -489,6 +495,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
>  #include "insn_trans/trans_rvh.c.inc"
>  #include "insn_trans/trans_rvv.c.inc"
>  #include "insn_trans/trans_rvb.c.inc"
> +#include "insn_trans/trans_rvzfh.c.inc"
>  #include "insn_trans/trans_privileged.c.inc"
>
>  /* Include the auto-generated decoder for 16 bit insn */
> @@ -541,6 +548,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>      ctx->misa = env->misa;
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

