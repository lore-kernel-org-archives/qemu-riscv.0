Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pKPKd-0004zf-7Y
	for mharc-qemu-riscv@gnu.org; Tue, 24 Jan 2023 14:51:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pKPKb-0004xS-0x
 for qemu-riscv@nongnu.org; Tue, 24 Jan 2023 14:51:45 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pKPKX-0001Nm-8R
 for qemu-riscv@nongnu.org; Tue, 24 Jan 2023 14:51:44 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 l41-20020a05600c1d2900b003daf986faaeso11775090wms.3
 for <qemu-riscv@nongnu.org>; Tue, 24 Jan 2023 11:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UgiukE0OAjoLaj85jz+oSg0dGfUM5feQ0Q6R1qPAZjo=;
 b=DyZZIK84Muc1Jcl2cKqFZXv/NQ1BZuHCc5HganZzLvO4gW3KAzqI7OGCbfmciIA1pW
 ae7AT8YiNjYl48dUZzatdZ7SfXhRDQrvh8XBEljK42oMDA9ZtHKviJSGVtEk/cXoToG/
 eeDwe3j0QUzfoUd+b3ldWz/tOrjzFYjqa+m7nreNWEouifvIqe64q6Px9xWrWrTqeZey
 LfJJ5htd8GL39wX1bqiTNblU6wj01CgN2AmCSJVVd6gkv8Cn6Mo16wgPP21QK4Qy5PsK
 f5fwDbBmhW4kMDQw8NN1F3tDpi/dsE5QaizABXPcZwYFi0C6ccOA2ZS4ghBAuVX/WQd1
 /4dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UgiukE0OAjoLaj85jz+oSg0dGfUM5feQ0Q6R1qPAZjo=;
 b=1PO8y9wFWg2m6qBkVZyAvozhzssMIyECblSV53FrEXmrznaxDQJiqlKsLNa74JQG+U
 ylaHUE14zNXNYCG3GZwCiCc3trj5rY3TV+wAZPXnIgm076kR0aQGdy8Y2FBvWQgwtI86
 wPRBmjRXXVfYBH+iOdUKEXfOBVj05BaG6j1dIfuzuqRukI3RxgSHIQ71mc4KsxrgrWBf
 MoO9eZLYH/+m4Zf/QtB/TZcHzuZoCmH4Hlue9ClR8U7jzMcA8lQ2OLt8F49JnxNHepJm
 m3NVoGD/HBnnhwe7qmcsNLBKGThxisgmXKoX5iZ7iydnhlo/xvZG6SkHKfGoITk1bTzO
 JduQ==
X-Gm-Message-State: AFqh2kpI+XhSEBJrTlSam/mzEGrWIc4XRzwKsbTEz6xozZ915Rqsnwq3
 1knxm0VGWgS4edia3r/4KfTzV2Y46ej8JwOJ6GWF4A==
X-Google-Smtp-Source: AMrXdXubt4NSjbfHDVYwjzEzoSJnXoakqHkQZtfF05l0xVhp/k6blkZfLzRjB3YYwxKIe330E7iir5kUpPqrNTbMk9Q=
X-Received: by 2002:a05:600c:5561:b0:3dc:c7d:53b3 with SMTP id
 ja1-20020a05600c556100b003dc0c7d53b3mr250027wmb.192.1674589899070; Tue, 24
 Jan 2023 11:51:39 -0800 (PST)
MIME-Version: 1.0
References: <20221223180016.2068508-1-christoph.muellner@vrull.eu>
 <20221223180016.2068508-2-christoph.muellner@vrull.eu>
 <CAKmqyKOXM2poHz5c1CbddvUBC-wQxQE3o_bm7bqrn+XTkqASrg@mail.gmail.com>
 <CAEg0e7jmWzOcTNOyKoBD19fsge_aCzfgizEg0WSto-a5SgzNeA@mail.gmail.com>
In-Reply-To: <CAEg0e7jmWzOcTNOyKoBD19fsge_aCzfgizEg0WSto-a5SgzNeA@mail.gmail.com>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>
Date: Tue, 24 Jan 2023 20:51:26 +0100
Message-ID: <CAEg0e7jQM+bFHQ4ZxRUs+RHuiSJ4==TpEVcJvyFxDFcXGAqPrg@mail.gmail.com>
Subject: Re: [PATCH v2 01/15] RISC-V: Adding XTheadCmo ISA extension
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko.stuebner@vrull.eu>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Nelson Chu <nelson@rivosinc.com>, Kito Cheng <kito.cheng@sifive.com>, 
 Cooper Qu <cooper.qu@linux.alibaba.com>,
 Lifang Xia <lifang_xia@linux.alibaba.com>, 
 Yunhai Shang <yunhai@linux.alibaba.com>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
Content-Type: multipart/alternative; boundary="0000000000001432e805f307d81a"
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
X-List-Received-Date: Tue, 24 Jan 2023 19:51:45 -0000

--0000000000001432e805f307d81a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 24, 2023 at 6:31 PM Christoph M=C3=BCllner <
christoph.muellner@vrull.eu> wrote:

>
>
> On Mon, Jan 23, 2023 at 11:50 PM Alistair Francis <alistair23@gmail.com>
> wrote:
>
>> On Sat, Dec 24, 2022 at 4:09 AM Christoph Muellner
>> <christoph.muellner@vrull.eu> wrote:
>> >
>> > From: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
>> >
>> > This patch adds support for the XTheadCmo ISA extension.
>> > To avoid interfering with standard extensions, decoder and translation
>> > are in its own xthead* specific files.
>> > Future patches should be able to easily add additional T-Head extensio=
n.
>> >
>> > The implementation does not have much functionality (besides accepting
>> > the instructions and not qualifying them as illegal instructions if
>> > the hart executes in the required privilege level for the instruction)=
,
>> > as QEMU does not model CPU caches and instructions are documented
>> > to not raise any exceptions.
>> >
>> > Changes in v2:
>> > - Add ISA_EXT_DATA_ENTRY()
>> > - Explicit test for PRV_U
>> > - Encapsule access to env-priv in inline function
>> > - Use single decoder for XThead extensions
>> >
>> > Co-developed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
>> > Signed-off-by: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
>> > ---
>> >  target/riscv/cpu.c                         |  2 +
>> >  target/riscv/cpu.h                         |  1 +
>> >  target/riscv/insn_trans/trans_xthead.c.inc | 89 +++++++++++++++++++++=
+
>> >  target/riscv/meson.build                   |  1 +
>> >  target/riscv/translate.c                   | 15 +++-
>> >  target/riscv/xthead.decode                 | 38 +++++++++
>> >  6 files changed, 143 insertions(+), 3 deletions(-)
>> >  create mode 100644 target/riscv/insn_trans/trans_xthead.c.inc
>> >  create mode 100644 target/riscv/xthead.decode
>> >
>> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> > index 6fe176e483..a90b82c5c5 100644
>> > --- a/target/riscv/cpu.c
>> > +++ b/target/riscv/cpu.c
>> > @@ -108,6 +108,7 @@ static const struct isa_ext_data isa_edata_arr[] =
=3D {
>> >      ISA_EXT_DATA_ENTRY(svinval, true, PRIV_VERSION_1_12_0,
>> ext_svinval),
>> >      ISA_EXT_DATA_ENTRY(svnapot, true, PRIV_VERSION_1_12_0,
>> ext_svnapot),
>> >      ISA_EXT_DATA_ENTRY(svpbmt, true, PRIV_VERSION_1_12_0, ext_svpbmt)=
,
>> > +    ISA_EXT_DATA_ENTRY(xtheadcmo, true, PRIV_VERSION_1_11_0,
>> ext_xtheadcmo),
>> >      ISA_EXT_DATA_ENTRY(xventanacondops, true, PRIV_VERSION_1_12_0,
>> ext_XVentanaCondOps),
>> >  };
>> >
>> > @@ -1060,6 +1061,7 @@ static Property riscv_cpu_extensions[] =3D {
>> >      DEFINE_PROP_BOOL("zmmul", RISCVCPU, cfg.ext_zmmul, false),
>> >
>> >      /* Vendor-specific custom extensions */
>> > +    DEFINE_PROP_BOOL("xtheadcmo", RISCVCPU, cfg.ext_xtheadcmo, false)=
,
>> >      DEFINE_PROP_BOOL("xventanacondops", RISCVCPU,
>> cfg.ext_XVentanaCondOps, false),
>> >
>> >      /* These are experimental so mark with 'x-' */
>> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> > index 443d15a47c..ad1c19f870 100644
>> > --- a/target/riscv/cpu.h
>> > +++ b/target/riscv/cpu.h
>> > @@ -465,6 +465,7 @@ struct RISCVCPUConfig {
>> >      uint64_t mimpid;
>> >
>> >      /* Vendor-specific custom extensions */
>> > +    bool ext_xtheadcmo;
>> >      bool ext_XVentanaCondOps;
>> >
>> >      uint8_t pmu_num;
>> > diff --git a/target/riscv/insn_trans/trans_xthead.c.inc
>> b/target/riscv/insn_trans/trans_xthead.c.inc
>> > new file mode 100644
>> > index 0000000000..00e75c7dca
>> > --- /dev/null
>> > +++ b/target/riscv/insn_trans/trans_xthead.c.inc
>> > @@ -0,0 +1,89 @@
>> > +/*
>> > + * RISC-V translation routines for the T-Head vendor extensions
>> (xthead*).
>> > + *
>> > + * Copyright (c) 2022 VRULL GmbH.
>> > + *
>> > + * This program is free software; you can redistribute it and/or
>> modify it
>> > + * under the terms and conditions of the GNU General Public License,
>> > + * version 2 or later, as published by the Free Software Foundation.
>> > + *
>> > + * This program is distributed in the hope it will be useful, but
>> WITHOUT
>> > + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
>> or
>> > + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public
>> License for
>> > + * more details.
>> > + *
>> > + * You should have received a copy of the GNU General Public License
>> along with
>> > + * this program.  If not, see <http://www.gnu.org/licenses/>.
>> > + */
>> > +
>> > +#define REQUIRE_XTHEADCMO(ctx) do {              \
>> > +    if (!ctx->cfg_ptr->ext_xtheadcmo) {          \
>> > +        return false;                            \
>> > +    }                                            \
>> > +} while (0)
>> > +
>> > +/* XTheadCmo */
>> > +
>> > +static inline int priv_level(DisasContext *ctx)
>> > +{
>> > +#ifdef CONFIG_USER_ONLY
>> > +    return PRV_U;
>> > +#else
>> > +     /* Priv level equals mem_idx -- see cpu_mmu_index. */
>> > +    return ctx->mem_idx;
>>
>> This should be ANDed with TB_FLAGS_PRIV_MMU_MASK as sometimes this can
>> include hypervisor priv access information
>>
>
> Ok.
>
>
>>
>> > +#endif
>> > +}
>> > +
>> > +#define REQUIRE_PRIV_MHSU(ctx)                                  \
>> > +do {                                                            \
>> > +    int priv =3D priv_level(ctx);                                 \
>> > +    if (!(priv =3D=3D PRV_M ||                                      \
>> > +          priv =3D=3D PRV_H ||                                      \
>>
>> PRV_H isn't used
>>
>> > +          priv =3D=3D PRV_S ||                                      \
>> > +          priv =3D=3D PRV_U)) {                                     \
>> > +        return false;                                           \
>>
>> When would this not be the case?
>>
>
> Ok, I will make this a macro that expands to nothing (and a comment).
>
>
>>
>> > +    }                                                           \
>> > +} while (0)
>> > +
>> > +#define REQUIRE_PRIV_MHS(ctx)                                   \
>> > +do {                                                            \
>> > +    int priv =3D priv_level(ctx);                                 \
>> > +    if (!(priv =3D=3D PRV_M ||                                      \
>> > +          priv =3D=3D PRV_H ||                                      \
>>
>> Also not used
>>
>
> Ok, I will remove the PRV_H.
>
>
>>
>> > +          priv =3D=3D PRV_S)) {                                     \
>> > +        return false;                                           \
>> > +    }                                                           \
>> > +} while (0)
>> > +
>> > +#define NOP_PRIVCHECK(insn, extcheck, privcheck)                \
>> > +static bool trans_ ## insn(DisasContext *ctx, arg_ ## insn * a) \
>> > +{                                                               \
>> > +    (void) a;                                                   \
>> > +    extcheck(ctx);                                              \
>> > +    privcheck(ctx);                                             \
>> > +    return true;                                                \
>> > +}
>> > +
>> > +NOP_PRIVCHECK(th_dcache_call, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
>> > +NOP_PRIVCHECK(th_dcache_ciall, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
>> > +NOP_PRIVCHECK(th_dcache_iall, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
>> > +NOP_PRIVCHECK(th_dcache_cpa, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
>> > +NOP_PRIVCHECK(th_dcache_cipa, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
>> > +NOP_PRIVCHECK(th_dcache_ipa, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
>> > +NOP_PRIVCHECK(th_dcache_cva, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHSU)
>> > +NOP_PRIVCHECK(th_dcache_civa, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHSU)
>> > +NOP_PRIVCHECK(th_dcache_iva, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHSU)
>> > +NOP_PRIVCHECK(th_dcache_csw, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
>> > +NOP_PRIVCHECK(th_dcache_cisw, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
>> > +NOP_PRIVCHECK(th_dcache_isw, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
>> > +NOP_PRIVCHECK(th_dcache_cpal1, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
>> > +NOP_PRIVCHECK(th_dcache_cval1, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
>> > +
>> > +NOP_PRIVCHECK(th_icache_iall, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
>> > +NOP_PRIVCHECK(th_icache_ialls, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
>> > +NOP_PRIVCHECK(th_icache_ipa, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
>> > +NOP_PRIVCHECK(th_icache_iva, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHSU)
>> > +
>> > +NOP_PRIVCHECK(th_l2cache_call, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
>> > +NOP_PRIVCHECK(th_l2cache_ciall, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
>> > +NOP_PRIVCHECK(th_l2cache_iall, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
>> > diff --git a/target/riscv/meson.build b/target/riscv/meson.build
>> > index ba25164d74..5dee37a242 100644
>> > --- a/target/riscv/meson.build
>> > +++ b/target/riscv/meson.build
>> > @@ -2,6 +2,7 @@
>> >  gen =3D [
>> >    decodetree.process('insn16.decode', extra_args:
>> ['--static-decode=3Ddecode_insn16', '--insnwidth=3D16']),
>> >    decodetree.process('insn32.decode', extra_args:
>> '--static-decode=3Ddecode_insn32'),
>> > +  decodetree.process('xthead.decode', extra_args:
>> '--static-decode=3Ddecode_xthead'),
>> >    decodetree.process('XVentanaCondOps.decode', extra_args:
>> '--static-decode=3Ddecode_XVentanaCodeOps'),
>> >  ]
>> >
>> > diff --git a/target/riscv/translate.c b/target/riscv/translate.c
>> > index db123da5ec..14d9116975 100644
>> > --- a/target/riscv/translate.c
>> > +++ b/target/riscv/translate.c
>> > @@ -125,13 +125,18 @@ static bool always_true_p(DisasContext *ctx
>> __attribute__((__unused__)))
>> >      return true;
>> >  }
>> >
>> > +static bool has_xthead_p(DisasContext *ctx
>> __attribute__((__unused__)))
>> > +{
>> > +    return ctx->cfg_ptr->ext_xtheadcmo;
>> > +}
>> > +
>> >  #define MATERIALISE_EXT_PREDICATE(ext)  \
>> >      static bool has_ ## ext ## _p(DisasContext *ctx)    \
>> >      { \
>> >          return ctx->cfg_ptr->ext_ ## ext ; \
>> >      }
>> >
>> > -MATERIALISE_EXT_PREDICATE(XVentanaCondOps);
>> > +MATERIALISE_EXT_PREDICATE(XVentanaCondOps)
>>
>> Do we need this change?
>>
>
> It is indeed a drive-by cleanup, that is not necessary.
> In v1 we were using this macro, therefore it made sense back then.
> Will be dropped.
>
>
>>
>> >
>> >  #ifdef TARGET_RISCV32
>> >  #define get_xl(ctx)    MXL_RV32
>> > @@ -732,6 +737,10 @@ static int ex_rvc_shiftri(DisasContext *ctx, int
>> imm)
>> >  /* Include the auto-generated decoder for 32 bit insn */
>> >  #include "decode-insn32.c.inc"
>> >
>> > +/* Include decoders for factored-out extensions */
>> > +#include "decode-xthead.c.inc"
>> > +#include "decode-XVentanaCondOps.c.inc"
>> > +
>> >  static bool gen_logic_imm_fn(DisasContext *ctx, arg_i *a,
>> >                               void (*func)(TCGv, TCGv, target_long))
>> >  {
>> > @@ -1033,12 +1042,11 @@ static uint32_t opcode_at(DisasContextBase
>> *dcbase, target_ulong pc)
>> >  #include "insn_trans/trans_rvk.c.inc"
>> >  #include "insn_trans/trans_privileged.c.inc"
>> >  #include "insn_trans/trans_svinval.c.inc"
>> > +#include "insn_trans/trans_xthead.c.inc"
>> >  #include "insn_trans/trans_xventanacondops.c.inc"
>> >
>> >  /* Include the auto-generated decoder for 16 bit insn */
>> >  #include "decode-insn16.c.inc"
>> > -/* Include decoders for factored-out extensions */
>> > -#include "decode-XVentanaCondOps.c.inc"
>>
>> Can we not leave these at the bottom?
>>
>
> Ok.
>

I got reminded again, why this is like it is:
The decoder code needs to be included before the translation functions,
because the translation functions use types that are defined in the
generated decoder code.
And I wanted to keep all vendor extensions together.
I think your concern is about touching other code. Therefore, I will not
touch the VT decoder position in the v3.
Let me know if you prefer another solution.

BR
Christoph



>
>
>> Alistair
>>
>> >
>> >  /* The specification allows for longer insns, but not supported by
>> qemu. */
>> >  #define MAX_INSN_LEN  4
>> > @@ -1059,6 +1067,7 @@ static void decode_opc(CPURISCVState *env,
>> DisasContext *ctx, uint16_t opcode)
>> >          bool (*decode_func)(DisasContext *, uint32_t);
>> >      } decoders[] =3D {
>> >          { always_true_p,  decode_insn32 },
>> > +        { has_xthead_p, decode_xthead },
>> >          { has_XVentanaCondOps_p,  decode_XVentanaCodeOps },
>> >      };
>> >
>> > diff --git a/target/riscv/xthead.decode b/target/riscv/xthead.decode
>> > new file mode 100644
>> > index 0000000000..30533a66f5
>> > --- /dev/null
>> > +++ b/target/riscv/xthead.decode
>> > @@ -0,0 +1,38 @@
>> > +#
>> > +# Translation routines for the instructions of the XThead* ISA
>> extensions
>> > +#
>> > +# Copyright (c) 2022 Christoph Muellner, christoph.muellner@vrull.eu
>> > +#
>> > +# SPDX-License-Identifier: LGPL-2.1-or-later
>> > +#
>> > +# The documentation of the ISA extensions can be found here:
>> > +#
>> https://github.com/T-head-Semi/thead-extension-spec/releases/latest
>> > +
>> > +# Fields:
>> > +%rs1       15:5
>> > +
>> > +# Formats
>> > +@sfence_vm  ....... ..... .....   ... ..... ....... %rs1
>> > +
>> > +# XTheadCmo
>> > +th_dcache_call   0000000 00001 00000 000 00000 0001011
>> > +th_dcache_ciall  0000000 00011 00000 000 00000 0001011
>> > +th_dcache_iall   0000000 00010 00000 000 00000 0001011
>> > +th_dcache_cpa    0000001 01001 ..... 000 00000 0001011 @sfence_vm
>> > +th_dcache_cipa   0000001 01011 ..... 000 00000 0001011 @sfence_vm
>> > +th_dcache_ipa    0000001 01010 ..... 000 00000 0001011 @sfence_vm
>> > +th_dcache_cva    0000001 00101 ..... 000 00000 0001011 @sfence_vm
>> > +th_dcache_civa   0000001 00111 ..... 000 00000 0001011 @sfence_vm
>> > +th_dcache_iva    0000001 00110 ..... 000 00000 0001011 @sfence_vm
>> > +th_dcache_csw    0000001 00001 ..... 000 00000 0001011 @sfence_vm
>> > +th_dcache_cisw   0000001 00011 ..... 000 00000 0001011 @sfence_vm
>> > +th_dcache_isw    0000001 00010 ..... 000 00000 0001011 @sfence_vm
>> > +th_dcache_cpal1  0000001 01000 ..... 000 00000 0001011 @sfence_vm
>> > +th_dcache_cval1  0000001 00100 ..... 000 00000 0001011 @sfence_vm
>> > +th_icache_iall   0000000 10000 00000 000 00000 0001011
>> > +th_icache_ialls  0000000 10001 00000 000 00000 0001011
>> > +th_icache_ipa    0000001 11000 ..... 000 00000 0001011 @sfence_vm
>> > +th_icache_iva    0000001 10000 ..... 000 00000 0001011 @sfence_vm
>> > +th_l2cache_call  0000000 10101 00000 000 00000 0001011
>> > +th_l2cache_ciall 0000000 10111 00000 000 00000 0001011
>> > +th_l2cache_iall  0000000 10110 00000 000 00000 0001011
>> > --
>> > 2.38.1
>> >
>> >
>>
>

--0000000000001432e805f307d81a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 24, 2023 at 6:31 PM Chris=
toph M=C3=BCllner &lt;<a href=3D"mailto:christoph.muellner@vrull.eu">christ=
oph.muellner@vrull.eu</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 23, =
2023 at 11:50 PM Alistair Francis &lt;<a href=3D"mailto:alistair23@gmail.co=
m" target=3D"_blank">alistair23@gmail.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">On Sat, Dec 24, 2022 at 4:09 AM Ch=
ristoph Muellner<br>
&lt;<a href=3D"mailto:christoph.muellner@vrull.eu" target=3D"_blank">christ=
oph.muellner@vrull.eu</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Christoph M=C3=BCllner &lt;<a href=3D"mailto:christoph.muellner@=
vrull.eu" target=3D"_blank">christoph.muellner@vrull.eu</a>&gt;<br>
&gt;<br>
&gt; This patch adds support for the XTheadCmo ISA extension.<br>
&gt; To avoid interfering with standard extensions, decoder and translation=
<br>
&gt; are in its own xthead* specific files.<br>
&gt; Future patches should be able to easily add additional T-Head extensio=
n.<br>
&gt;<br>
&gt; The implementation does not have much functionality (besides accepting=
<br>
&gt; the instructions and not qualifying them as illegal instructions if<br=
>
&gt; the hart executes in the required privilege level for the instruction)=
,<br>
&gt; as QEMU does not model CPU caches and instructions are documented<br>
&gt; to not raise any exceptions.<br>
&gt;<br>
&gt; Changes in v2:<br>
&gt; - Add ISA_EXT_DATA_ENTRY()<br>
&gt; - Explicit test for PRV_U<br>
&gt; - Encapsule access to env-priv in inline function<br>
&gt; - Use single decoder for XThead extensions<br>
&gt;<br>
&gt; Co-developed-by: LIU Zhiwei &lt;<a href=3D"mailto:zhiwei_liu@linux.ali=
baba.com" target=3D"_blank">zhiwei_liu@linux.alibaba.com</a>&gt;<br>
&gt; Signed-off-by: Christoph M=C3=BCllner &lt;<a href=3D"mailto:christoph.=
muellner@vrull.eu" target=3D"_blank">christoph.muellner@vrull.eu</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 target/riscv/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +<br>
&gt;=C2=A0 target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt;=C2=A0 target/riscv/insn_trans/trans_xthead.c.inc | 89 ++++++++++++++++=
++++++<br>
&gt;=C2=A0 target/riscv/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt;=C2=A0 target/riscv/translate.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 15 +++-<br>
&gt;=C2=A0 target/riscv/xthead.decode=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 38 +++++++++<br>
&gt;=C2=A0 6 files changed, 143 insertions(+), 3 deletions(-)<br>
&gt;=C2=A0 create mode 100644 target/riscv/insn_trans/trans_xthead.c.inc<br=
>
&gt;=C2=A0 create mode 100644 target/riscv/xthead.decode<br>
&gt;<br>
&gt; diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
&gt; index 6fe176e483..a90b82c5c5 100644<br>
&gt; --- a/target/riscv/cpu.c<br>
&gt; +++ b/target/riscv/cpu.c<br>
&gt; @@ -108,6 +108,7 @@ static const struct isa_ext_data isa_edata_arr[] =
=3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ISA_EXT_DATA_ENTRY(svinval, true, PRIV_VERSION_1_1=
2_0, ext_svinval),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ISA_EXT_DATA_ENTRY(svnapot, true, PRIV_VERSION_1_1=
2_0, ext_svnapot),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ISA_EXT_DATA_ENTRY(svpbmt, true, PRIV_VERSION_1_12=
_0, ext_svpbmt),<br>
&gt; +=C2=A0 =C2=A0 ISA_EXT_DATA_ENTRY(xtheadcmo, true, PRIV_VERSION_1_11_0=
, ext_xtheadcmo),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ISA_EXT_DATA_ENTRY(xventanacondops, true, PRIV_VER=
SION_1_12_0, ext_XVentanaCondOps),<br>
&gt;=C2=A0 };<br>
&gt;<br>
&gt; @@ -1060,6 +1061,7 @@ static Property riscv_cpu_extensions[] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;zmmul&quot;, RISCVCPU, cfg.=
ext_zmmul, false),<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* Vendor-specific custom extensions */<br>
&gt; +=C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;xtheadcmo&quot;, RISCVCPU, cfg.e=
xt_xtheadcmo, false),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;xventanacondops&quot;, RISC=
VCPU, cfg.ext_XVentanaCondOps, false),<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* These are experimental so mark with &#39;x-&#39=
; */<br>
&gt; diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
&gt; index 443d15a47c..ad1c19f870 100644<br>
&gt; --- a/target/riscv/cpu.h<br>
&gt; +++ b/target/riscv/cpu.h<br>
&gt; @@ -465,6 +465,7 @@ struct RISCVCPUConfig {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint64_t mimpid;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* Vendor-specific custom extensions */<br>
&gt; +=C2=A0 =C2=A0 bool ext_xtheadcmo;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 bool ext_XVentanaCondOps;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint8_t pmu_num;<br>
&gt; diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv=
/insn_trans/trans_xthead.c.inc<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..00e75c7dca<br>
&gt; --- /dev/null<br>
&gt; +++ b/target/riscv/insn_trans/trans_xthead.c.inc<br>
&gt; @@ -0,0 +1,89 @@<br>
&gt; +/*<br>
&gt; + * RISC-V translation routines for the T-Head vendor extensions (xthe=
ad*).<br>
&gt; + *<br>
&gt; + * Copyright (c) 2022 VRULL GmbH.<br>
&gt; + *<br>
&gt; + * This program is free software; you can redistribute it and/or modi=
fy it<br>
&gt; + * under the terms and conditions of the GNU General Public License,<=
br>
&gt; + * version 2 or later, as published by the Free Software Foundation.<=
br>
&gt; + *<br>
&gt; + * This program is distributed in the hope it will be useful, but WIT=
HOUT<br>
&gt; + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY=
 or<br>
&gt; + * FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the GNU General Public=
 License for<br>
&gt; + * more details.<br>
&gt; + *<br>
&gt; + * You should have received a copy of the GNU General Public License =
along with<br>
&gt; + * this program.=C2=A0 If not, see &lt;<a href=3D"http://www.gnu.org/=
licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.org/licenses=
/</a>&gt;.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#define REQUIRE_XTHEADCMO(ctx) do {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 \<br>
&gt; +=C2=A0 =C2=A0 if (!ctx-&gt;cfg_ptr-&gt;ext_xtheadcmo) {=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; +=C2=A0 =C2=A0 }=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; +} while (0)<br>
&gt; +<br>
&gt; +/* XTheadCmo */<br>
&gt; +<br>
&gt; +static inline int priv_level(DisasContext *ctx)<br>
&gt; +{<br>
&gt; +#ifdef CONFIG_USER_ONLY<br>
&gt; +=C2=A0 =C2=A0 return PRV_U;<br>
&gt; +#else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* Priv level equals mem_idx -- see cpu_mmu_index=
. */<br>
&gt; +=C2=A0 =C2=A0 return ctx-&gt;mem_idx;<br>
<br>
This should be ANDed with TB_FLAGS_PRIV_MMU_MASK as sometimes this can<br>
include hypervisor priv access information<br></blockquote><div><br></div><=
div>Ok.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
<br>
&gt; +#endif<br>
&gt; +}<br>
&gt; +<br>
&gt; +#define REQUIRE_PRIV_MHSU(ctx)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 \<br>
&gt; +do {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \=
<br>
&gt; +=C2=A0 =C2=A0 int priv =3D priv_level(ctx);=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0\<br>
&gt; +=C2=A0 =C2=A0 if (!(priv =3D=3D PRV_M ||=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 priv =3D=3D PRV_H ||=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
<br>
PRV_H isn&#39;t used<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 priv =3D=3D PRV_S ||=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 priv =3D=3D PRV_U)) {=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
<br>
When would this not be the case?<br></blockquote><div><br></div><div>Ok, I =
will make this a macro that expands to nothing (and a comment).</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 }=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0\<br>
&gt; +} while (0)<br>
&gt; +<br>
&gt; +#define REQUIRE_PRIV_MHS(ctx)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0\<br>
&gt; +do {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \=
<br>
&gt; +=C2=A0 =C2=A0 int priv =3D priv_level(ctx);=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0\<br>
&gt; +=C2=A0 =C2=A0 if (!(priv =3D=3D PRV_M ||=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 priv =3D=3D PRV_H ||=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
<br>
Also not used<br></blockquote><div><br></div><div>Ok, I will remove the PRV=
_H.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 priv =3D=3D PRV_S)) {=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; +=C2=A0 =C2=A0 }=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0\<br>
&gt; +} while (0)<br>
&gt; +<br>
&gt; +#define NOP_PRIVCHECK(insn, extcheck, privcheck)=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; +static bool trans_ ## insn(DisasContext *ctx, arg_ ## insn * a) \<br>
&gt; +{=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0\<br>
&gt; +=C2=A0 =C2=A0 (void) a;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; +=C2=A0 =C2=A0 extcheck(ctx);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; +=C2=A0 =C2=A0 privcheck(ctx);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; +=C2=A0 =C2=A0 return true;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; +}<br>
&gt; +<br>
&gt; +NOP_PRIVCHECK(th_dcache_call, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)<br=
>
&gt; +NOP_PRIVCHECK(th_dcache_ciall, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)<b=
r>
&gt; +NOP_PRIVCHECK(th_dcache_iall, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)<br=
>
&gt; +NOP_PRIVCHECK(th_dcache_cpa, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)<br>
&gt; +NOP_PRIVCHECK(th_dcache_cipa, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)<br=
>
&gt; +NOP_PRIVCHECK(th_dcache_ipa, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)<br>
&gt; +NOP_PRIVCHECK(th_dcache_cva, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHSU)<br=
>
&gt; +NOP_PRIVCHECK(th_dcache_civa, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHSU)<b=
r>
&gt; +NOP_PRIVCHECK(th_dcache_iva, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHSU)<br=
>
&gt; +NOP_PRIVCHECK(th_dcache_csw, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)<br>
&gt; +NOP_PRIVCHECK(th_dcache_cisw, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)<br=
>
&gt; +NOP_PRIVCHECK(th_dcache_isw, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)<br>
&gt; +NOP_PRIVCHECK(th_dcache_cpal1, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)<b=
r>
&gt; +NOP_PRIVCHECK(th_dcache_cval1, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)<b=
r>
&gt; +<br>
&gt; +NOP_PRIVCHECK(th_icache_iall, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)<br=
>
&gt; +NOP_PRIVCHECK(th_icache_ialls, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)<b=
r>
&gt; +NOP_PRIVCHECK(th_icache_ipa, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)<br>
&gt; +NOP_PRIVCHECK(th_icache_iva, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHSU)<br=
>
&gt; +<br>
&gt; +NOP_PRIVCHECK(th_l2cache_call, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)<b=
r>
&gt; +NOP_PRIVCHECK(th_l2cache_ciall, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)<=
br>
&gt; +NOP_PRIVCHECK(th_l2cache_iall, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)<b=
r>
&gt; diff --git a/target/riscv/meson.build b/target/riscv/meson.build<br>
&gt; index ba25164d74..5dee37a242 100644<br>
&gt; --- a/target/riscv/meson.build<br>
&gt; +++ b/target/riscv/meson.build<br>
&gt; @@ -2,6 +2,7 @@<br>
&gt;=C2=A0 gen =3D [<br>
&gt;=C2=A0 =C2=A0 decodetree.process(&#39;insn16.decode&#39;, extra_args: [=
&#39;--static-decode=3Ddecode_insn16&#39;, &#39;--insnwidth=3D16&#39;]),<br=
>
&gt;=C2=A0 =C2=A0 decodetree.process(&#39;insn32.decode&#39;, extra_args: &=
#39;--static-decode=3Ddecode_insn32&#39;),<br>
&gt; +=C2=A0 decodetree.process(&#39;xthead.decode&#39;, extra_args: &#39;-=
-static-decode=3Ddecode_xthead&#39;),<br>
&gt;=C2=A0 =C2=A0 decodetree.process(&#39;XVentanaCondOps.decode&#39;, extr=
a_args: &#39;--static-decode=3Ddecode_XVentanaCodeOps&#39;),<br>
&gt;=C2=A0 ]<br>
&gt;<br>
&gt; diff --git a/target/riscv/translate.c b/target/riscv/translate.c<br>
&gt; index db123da5ec..14d9116975 100644<br>
&gt; --- a/target/riscv/translate.c<br>
&gt; +++ b/target/riscv/translate.c<br>
&gt; @@ -125,13 +125,18 @@ static bool always_true_p(DisasContext *ctx=C2=
=A0 __attribute__((__unused__)))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return true;<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; +static bool has_xthead_p(DisasContext *ctx=C2=A0 __attribute__((__unu=
sed__)))<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 return ctx-&gt;cfg_ptr-&gt;ext_xtheadcmo;<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 #define MATERIALISE_EXT_PREDICATE(ext)=C2=A0 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 static bool has_ ## ext ## _p(DisasContext *ctx)=
=C2=A0 =C2=A0 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 { \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ctx-&gt;cfg_ptr-&gt;ext_ ## e=
xt ; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;<br>
&gt; -MATERIALISE_EXT_PREDICATE(XVentanaCondOps);<br>
&gt; +MATERIALISE_EXT_PREDICATE(XVentanaCondOps)<br>
<br>
Do we need this change?<br></blockquote><div><br></div><div>It is indeed a =
drive-by cleanup, that is not necessary.</div><div>In v1 we were using this=
 macro, therefore it made sense back then.</div><div>Will be dropped.</div>=
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;<br>
&gt;=C2=A0 #ifdef TARGET_RISCV32<br>
&gt;=C2=A0 #define get_xl(ctx)=C2=A0 =C2=A0 MXL_RV32<br>
&gt; @@ -732,6 +737,10 @@ static int ex_rvc_shiftri(DisasContext *ctx, int =
imm)<br>
&gt;=C2=A0 /* Include the auto-generated decoder for 32 bit insn */<br>
&gt;=C2=A0 #include &quot;decode-insn32.c.inc&quot;<br>
&gt;<br>
&gt; +/* Include decoders for factored-out extensions */<br>
&gt; +#include &quot;decode-xthead.c.inc&quot;<br>
&gt; +#include &quot;decode-XVentanaCondOps.c.inc&quot;<br>
&gt; +<br>
&gt;=C2=A0 static bool gen_logic_imm_fn(DisasContext *ctx, arg_i *a,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void (*func)(TCGv, TCGv, target_lo=
ng))<br>
&gt;=C2=A0 {<br>
&gt; @@ -1033,12 +1042,11 @@ static uint32_t opcode_at(DisasContextBase *dc=
base, target_ulong pc)<br>
&gt;=C2=A0 #include &quot;insn_trans/trans_rvk.c.inc&quot;<br>
&gt;=C2=A0 #include &quot;insn_trans/trans_privileged.c.inc&quot;<br>
&gt;=C2=A0 #include &quot;insn_trans/trans_svinval.c.inc&quot;<br>
&gt; +#include &quot;insn_trans/trans_xthead.c.inc&quot;<br>
&gt;=C2=A0 #include &quot;insn_trans/trans_xventanacondops.c.inc&quot;<br>
&gt;<br>
&gt;=C2=A0 /* Include the auto-generated decoder for 16 bit insn */<br>
&gt;=C2=A0 #include &quot;decode-insn16.c.inc&quot;<br>
&gt; -/* Include decoders for factored-out extensions */<br>
&gt; -#include &quot;decode-XVentanaCondOps.c.inc&quot;<br>
<br>
Can we not leave these at the bottom?<br></blockquote><div><br></div><div>O=
k.</div></div></div></blockquote><div><br></div><div>I got reminded again, =
why this is like it is:</div><div>The decoder code needs to be included bef=
ore the translation functions,</div><div>because the translation functions =
use types that are defined in the generated decoder code.</div><div>And I w=
anted=C2=A0to keep all vendor extensions together.</div><div>I think your c=
oncern is about touching other code. Therefore, I will not touch the VT dec=
oder position in the v3.</div><div>Let me know if you prefer another soluti=
on.</div><div><br></div><div>BR</div><div>Christoph</div><div><br></div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D=
"ltr"><div class=3D"gmail_quote"><div><br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
<br>
Alistair<br>
<br>
&gt;<br>
&gt;=C2=A0 /* The specification allows for longer insns, but not supported =
by qemu. */<br>
&gt;=C2=A0 #define MAX_INSN_LEN=C2=A0 4<br>
&gt; @@ -1059,6 +1067,7 @@ static void decode_opc(CPURISCVState *env, Disas=
Context *ctx, uint16_t opcode)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool (*decode_func)(DisasContext *, =
uint32_t);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 } decoders[] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { always_true_p,=C2=A0 decode_insn32=
 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 { has_xthead_p, decode_xthead },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { has_XVentanaCondOps_p,=C2=A0 decod=
e_XVentanaCodeOps },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 };<br>
&gt;<br>
&gt; diff --git a/target/riscv/xthead.decode b/target/riscv/xthead.decode<b=
r>
&gt; new file mode 100644<br>
&gt; index 0000000000..30533a66f5<br>
&gt; --- /dev/null<br>
&gt; +++ b/target/riscv/xthead.decode<br>
&gt; @@ -0,0 +1,38 @@<br>
&gt; +#<br>
&gt; +# Translation routines for the instructions of the XThead* ISA extens=
ions<br>
&gt; +#<br>
&gt; +# Copyright (c) 2022 Christoph Muellner, <a href=3D"mailto:christoph.=
muellner@vrull.eu" target=3D"_blank">christoph.muellner@vrull.eu</a><br>
&gt; +#<br>
&gt; +# SPDX-License-Identifier: LGPL-2.1-or-later<br>
&gt; +#<br>
&gt; +# The documentation of the ISA extensions can be found here:<br>
&gt; +#=C2=A0 =C2=A0<a href=3D"https://github.com/T-head-Semi/thead-extensi=
on-spec/releases/latest" rel=3D"noreferrer" target=3D"_blank">https://githu=
b.com/T-head-Semi/thead-extension-spec/releases/latest</a><br>
&gt; +<br>
&gt; +# Fields:<br>
&gt; +%rs1=C2=A0 =C2=A0 =C2=A0 =C2=A015:5<br>
&gt; +<br>
&gt; +# Formats<br>
&gt; +@sfence_vm=C2=A0 ....... ..... .....=C2=A0 =C2=A0... ..... ....... %r=
s1<br>
&gt; +<br>
&gt; +# XTheadCmo<br>
&gt; +th_dcache_call=C2=A0 =C2=A00000000 00001 00000 000 00000 0001011<br>
&gt; +th_dcache_ciall=C2=A0 0000000 00011 00000 000 00000 0001011<br>
&gt; +th_dcache_iall=C2=A0 =C2=A00000000 00010 00000 000 00000 0001011<br>
&gt; +th_dcache_cpa=C2=A0 =C2=A0 0000001 01001 ..... 000 00000 0001011 @sfe=
nce_vm<br>
&gt; +th_dcache_cipa=C2=A0 =C2=A00000001 01011 ..... 000 00000 0001011 @sfe=
nce_vm<br>
&gt; +th_dcache_ipa=C2=A0 =C2=A0 0000001 01010 ..... 000 00000 0001011 @sfe=
nce_vm<br>
&gt; +th_dcache_cva=C2=A0 =C2=A0 0000001 00101 ..... 000 00000 0001011 @sfe=
nce_vm<br>
&gt; +th_dcache_civa=C2=A0 =C2=A00000001 00111 ..... 000 00000 0001011 @sfe=
nce_vm<br>
&gt; +th_dcache_iva=C2=A0 =C2=A0 0000001 00110 ..... 000 00000 0001011 @sfe=
nce_vm<br>
&gt; +th_dcache_csw=C2=A0 =C2=A0 0000001 00001 ..... 000 00000 0001011 @sfe=
nce_vm<br>
&gt; +th_dcache_cisw=C2=A0 =C2=A00000001 00011 ..... 000 00000 0001011 @sfe=
nce_vm<br>
&gt; +th_dcache_isw=C2=A0 =C2=A0 0000001 00010 ..... 000 00000 0001011 @sfe=
nce_vm<br>
&gt; +th_dcache_cpal1=C2=A0 0000001 01000 ..... 000 00000 0001011 @sfence_v=
m<br>
&gt; +th_dcache_cval1=C2=A0 0000001 00100 ..... 000 00000 0001011 @sfence_v=
m<br>
&gt; +th_icache_iall=C2=A0 =C2=A00000000 10000 00000 000 00000 0001011<br>
&gt; +th_icache_ialls=C2=A0 0000000 10001 00000 000 00000 0001011<br>
&gt; +th_icache_ipa=C2=A0 =C2=A0 0000001 11000 ..... 000 00000 0001011 @sfe=
nce_vm<br>
&gt; +th_icache_iva=C2=A0 =C2=A0 0000001 10000 ..... 000 00000 0001011 @sfe=
nce_vm<br>
&gt; +th_l2cache_call=C2=A0 0000000 10101 00000 000 00000 0001011<br>
&gt; +th_l2cache_ciall 0000000 10111 00000 000 00000 0001011<br>
&gt; +th_l2cache_iall=C2=A0 0000000 10110 00000 000 00000 0001011<br>
&gt; --<br>
&gt; 2.38.1<br>
&gt;<br>
&gt;<br>
</blockquote></div></div>
</blockquote></div></div>

--0000000000001432e805f307d81a--

