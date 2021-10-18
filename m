Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcKHH-0002AK-Li
	for mharc-qemu-riscv@gnu.org; Mon, 18 Oct 2021 00:29:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mcKHB-00026I-Uz; Mon, 18 Oct 2021 00:29:30 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:39675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mcKH7-0004NS-RS; Mon, 18 Oct 2021 00:29:29 -0400
Received: by mail-io1-xd35.google.com with SMTP id o184so2710536iof.6;
 Sun, 17 Oct 2021 21:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nIA6GDnC6ela4UzwoghPJ57TCbHnZkjqRaWm5ffXHms=;
 b=d3Gtz+IUXQDImfd8KiAA5AHPnMmaknGWdY8SegAphrTR+0Pcyr5clKCTH3r2z4Bbmx
 r5Gf+xQXcXT3Liw55xl+0ssiBYA3XyosE+1MYYP14CfusXVdTa6HvQZSXRYD6jUsk0WB
 benCmArC3e5lYZoAioJsu5ZdLkyZySaJ4Jj85+dYyNZxmfpcSAcTjHC679LhWUbFddb3
 tfGKHY2Cokm3Ye4K/dA91a5e/d/Tj98PFnnjRpvBOSm5jlqGzFl56WCHweK/CoqyAMLq
 mHrIW2W/yiiVSDYlhiKw5AiyGbpKO5O3kkgqKo/NNwIUHqcFPXTchQWGDIxvbZTlP9r9
 N4fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nIA6GDnC6ela4UzwoghPJ57TCbHnZkjqRaWm5ffXHms=;
 b=n6dwBLECCRQz0QWNwriklTNykJr0JBGojpwfyKUrs6EIOa6t1zDAooAvVz+xI/0Bri
 4HsnTHWi36UrKWQF+YN3vV8y6cSnO20mc2abHIdPHZTIwkkwCJAu9afBd2+KeiGeXB5L
 j6ukGEbIyKnw+D7VTRKOLmny+FRRsmkhp6TZnu19PfTJ8g5CpNzYmlVGnT5eagj0vHSC
 DZx23tpoQ8tbiiss+TucamtuybyAxPCmw37rNSKBWlF/ir/Xb/Kt3L/eo19KhBOtvSV+
 6pHOJETpj0cucGYuaSahyn1QpCfx9ehk5wIq6oMLeigkjG6IfD737ljtaB5QXDuDESfC
 NQCA==
X-Gm-Message-State: AOAM530ClF5MoS3LD/c8AgHvshhw8Oa/wcVVkjTvW9+A8aAjYzg8ZvLB
 VGUt98kRap60NmLJt2t/OMfag9rD+g9IiXqW+xA=
X-Google-Smtp-Source: ABdhPJzFEThjCsRNNYFdrjI8QRO0JJuzAhDUPwzQ781bS6OaT/NHIYJUV2uLw4n1NbUAGO+T0tOC4gHmlHa6Gllqhig=
X-Received: by 2002:a6b:8d4a:: with SMTP id p71mr12785105iod.16.1634531363098; 
 Sun, 17 Oct 2021 21:29:23 -0700 (PDT)
MIME-Version: 1.0
References: <20211016090742.3034669-1-frank.chang@sifive.com>
 <20211016090742.3034669-2-frank.chang@sifive.com>
 <CAKmqyKNoHJj=W8L-KP+MohddNmzj1qquiEJ6bTQG4GwCSoa1xg@mail.gmail.com>
 <CAE_xrPigcg96SvHdnSRSL+EU+USVtkv+pbfOVj1Spg7K2eXFPA@mail.gmail.com>
In-Reply-To: <CAE_xrPigcg96SvHdnSRSL+EU+USVtkv+pbfOVj1Spg7K2eXFPA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 Oct 2021 14:28:55 +1000
Message-ID: <CAKmqyKM6rNx1XrZuAYXSLur7f+JXrodEdP5uHa_o+F82minpOQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] target/riscv: zfh: half-precision load and store
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Chih-Min Chao <chihmin.chao@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Kito Cheng <kito.cheng@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd35.google.com
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
X-List-Received-Date: Mon, 18 Oct 2021 04:29:30 -0000

On Mon, Oct 18, 2021 at 12:15 PM Frank Chang <frank.chang@sifive.com> wrote:
>
> On Mon, Oct 18, 2021 at 8:03 AM Alistair Francis <alistair23@gmail.com> wrote:
>>
>> On Sat, Oct 16, 2021 at 7:08 PM <frank.chang@sifive.com> wrote:
>> >
>> > From: Kito Cheng <kito.cheng@sifive.com>
>> >
>> > Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
>> > Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com>
>> > Signed-off-by: Frank Chang <frank.chang@sifive.com>
>> > Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> > ---
>> >  target/riscv/cpu.c                        |  1 +
>> >  target/riscv/cpu.h                        |  1 +
>> >  target/riscv/insn32.decode                |  4 ++
>> >  target/riscv/insn_trans/trans_rvzfh.c.inc | 65 +++++++++++++++++++++++
>> >  target/riscv/translate.c                  |  8 +++
>> >  5 files changed, 79 insertions(+)
>> >  create mode 100644 target/riscv/insn_trans/trans_rvzfh.c.inc
>> >
>> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> > index 1d69d1887e6..8c579dc297b 100644
>> > --- a/target/riscv/cpu.c
>> > +++ b/target/riscv/cpu.c
>> > @@ -601,6 +601,7 @@ static Property riscv_cpu_properties[] = {
>> >      DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
>> >      DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
>> >      DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
>> > +    DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
>>
>> This change should be after patch 5. The idea is that we add the
>> functionality and then allow users to enable it.
>>
>> Otherwise:
>>
>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>>
>> Alistair
>
>
> The reason why I put here is because REQUIRE_ZFH() uses ctx->zfh.
> I can separate ext_zfh field in DisasContext into this patch,
> and add cfg.ext_zfh in RISCVCPU after patch 5 in my next patchset.

You can still add cfg.ext_zfh, it's just this public PROP that should be last.

Alistair

>
> Thanks,
> Frank Chang
>
>>
>>
>> >      DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
>> >      DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
>> >      DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
>> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> > index 9e55b2f5b17..88684e72be1 100644
>> > --- a/target/riscv/cpu.h
>> > +++ b/target/riscv/cpu.h
>> > @@ -297,6 +297,7 @@ struct RISCVCPU {
>> >          bool ext_counters;
>> >          bool ext_ifencei;
>> >          bool ext_icsr;
>> > +        bool ext_zfh;
>> >
>> >          char *priv_spec;
>> >          char *user_spec;
>> > diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
>> > index 2f251dac1bb..b36a3d8dbf8 100644
>> > --- a/target/riscv/insn32.decode
>> > +++ b/target/riscv/insn32.decode
>> > @@ -726,3 +726,7 @@ binv       0110100 .......... 001 ..... 0110011 @r
>> >  binvi      01101. ........... 001 ..... 0010011 @sh
>> >  bset       0010100 .......... 001 ..... 0110011 @r
>> >  bseti      00101. ........... 001 ..... 0010011 @sh
>> > +
>> > +# *** RV32 Zfh Extension ***
>> > +flh        ............   ..... 001 ..... 0000111 @i
>> > +fsh        .......  ..... ..... 001 ..... 0100111 @s
>> > diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/insn_trans/trans_rvzfh.c.inc
>> > new file mode 100644
>> > index 00000000000..dad1d703d72
>> > --- /dev/null
>> > +++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
>> > @@ -0,0 +1,65 @@
>> > +/*
>> > + * RISC-V translation routines for the RV64Zfh Standard Extension.
>> > + *
>> > + * Copyright (c) 2020 Chih-Min Chao, chihmin.chao@sifive.com
>> > + *
>> > + * This program is free software; you can redistribute it and/or modify it
>> > + * under the terms and conditions of the GNU General Public License,
>> > + * version 2 or later, as published by the Free Software Foundation.
>> > + *
>> > + * This program is distributed in the hope it will be useful, but WITHOUT
>> > + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
>> > + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
>> > + * more details.
>> > + *
>> > + * You should have received a copy of the GNU General Public License along with
>> > + * this program.  If not, see <http://www.gnu.org/licenses/>.
>> > + */
>> > +
>> > +#define REQUIRE_ZFH(ctx) do { \
>> > +    if (!ctx->ext_zfh) {      \
>> > +        return false;         \
>> > +    }                         \
>> > +} while (0)
>> > +
>> > +static bool trans_flh(DisasContext *ctx, arg_flh *a)
>> > +{
>> > +    TCGv_i64 dest;
>> > +    TCGv t0;
>> > +
>> > +    REQUIRE_FPU;
>> > +    REQUIRE_ZFH(ctx);
>> > +
>> > +    t0 = get_gpr(ctx, a->rs1, EXT_NONE);
>> > +    if (a->imm) {
>> > +        TCGv temp = temp_new(ctx);
>> > +        tcg_gen_addi_tl(temp, t0, a->imm);
>> > +        t0 = temp;
>> > +    }
>> > +
>> > +    dest = cpu_fpr[a->rd];
>> > +    tcg_gen_qemu_ld_i64(dest, t0, ctx->mem_idx, MO_TEUW);
>> > +    gen_nanbox_h(dest, dest);
>> > +
>> > +    mark_fs_dirty(ctx);
>> > +    return true;
>> > +}
>> > +
>> > +static bool trans_fsh(DisasContext *ctx, arg_fsh *a)
>> > +{
>> > +    TCGv t0;
>> > +
>> > +    REQUIRE_FPU;
>> > +    REQUIRE_ZFH(ctx);
>> > +
>> > +    t0 = get_gpr(ctx, a->rs1, EXT_NONE);
>> > +    if (a->imm) {
>> > +        TCGv temp = tcg_temp_new();
>> > +        tcg_gen_addi_tl(temp, t0, a->imm);
>> > +        t0 = temp;
>> > +    }
>> > +
>> > +    tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], t0, ctx->mem_idx, MO_TEUW);
>> > +
>> > +    return true;
>> > +}
>> > diff --git a/target/riscv/translate.c b/target/riscv/translate.c
>> > index d2442f0cf5d..75048149f5a 100644
>> > --- a/target/riscv/translate.c
>> > +++ b/target/riscv/translate.c
>> > @@ -69,6 +69,7 @@ typedef struct DisasContext {
>> >      bool w;
>> >      bool virt_enabled;
>> >      bool ext_ifencei;
>> > +    bool ext_zfh;
>> >      bool hlsx;
>> >      /* vector extension */
>> >      bool vill;
>> > @@ -118,6 +119,11 @@ static void gen_nanbox_s(TCGv_i64 out, TCGv_i64 in)
>> >      tcg_gen_ori_i64(out, in, MAKE_64BIT_MASK(32, 32));
>> >  }
>> >
>> > +static void gen_nanbox_h(TCGv_i64 out, TCGv_i64 in)
>> > +{
>> > +    tcg_gen_ori_i64(out, in, MAKE_64BIT_MASK(16, 48));
>> > +}
>> > +
>> >  /*
>> >   * A narrow n-bit operation, where n < FLEN, checks that input operands
>> >   * are correctly Nan-boxed, i.e., all upper FLEN - n bits are 1.
>> > @@ -489,6 +495,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
>> >  #include "insn_trans/trans_rvh.c.inc"
>> >  #include "insn_trans/trans_rvv.c.inc"
>> >  #include "insn_trans/trans_rvb.c.inc"
>> > +#include "insn_trans/trans_rvzfh.c.inc"
>> >  #include "insn_trans/trans_privileged.c.inc"
>> >
>> >  /* Include the auto-generated decoder for 16 bit insn */
>> > @@ -541,6 +548,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>> >      ctx->misa = env->misa;
>> >      ctx->frm = -1;  /* unknown rounding mode */
>> >      ctx->ext_ifencei = cpu->cfg.ext_ifencei;
>> > +    ctx->ext_zfh = cpu->cfg.ext_zfh;
>> >      ctx->vlen = cpu->cfg.vlen;
>> >      ctx->mstatus_hs_fs = FIELD_EX32(tb_flags, TB_FLAGS, MSTATUS_HS_FS);
>> >      ctx->hlsx = FIELD_EX32(tb_flags, TB_FLAGS, HLSX);
>> > --
>> > 2.25.1
>> >
>> >

