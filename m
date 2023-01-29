Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pMGLt-0006gt-QG
	for mharc-qemu-riscv@gnu.org; Sun, 29 Jan 2023 17:40:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pMGLm-0006gW-31; Sun, 29 Jan 2023 17:40:38 -0500
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pMGLi-0000CV-GR; Sun, 29 Jan 2023 17:40:37 -0500
Received: by mail-vs1-xe33.google.com with SMTP id 187so10709084vsv.10;
 Sun, 29 Jan 2023 14:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OSwKpIP5ezzJqgiVTv9zeVCSDo3Tdo+tzRS53yI3oNM=;
 b=nuDmzE8h6iagFhIGMdUlAOeYGtRQS0yGiKjFmvCfCcUaOfNQCW+76rdNb2QrJyLRph
 Az4GH/5iOiHX6I0yNBoQpWSGVKOo6dAu3t/oQkrINVjyzIRqF//ugrRV2QfmfyXxiSww
 XXrS95izvCb9vSyVw62hL+i41MJ9MVMgVBO6N7Z8IYLTDDCunUhrq/9sIqtNOaudoAyK
 hOK+bABZl/TNqzfWRJZO2tRmt5u6K+gl4L6eVJBEp0mmv5swInWOBpAPgp+mi/pk262f
 DH6CpnvulK4swvyLF7nrq0Uax0L3jy8Lk1MLL1Qu5WyyREglvq9MZ1RnkenLfv2cID2u
 5krQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OSwKpIP5ezzJqgiVTv9zeVCSDo3Tdo+tzRS53yI3oNM=;
 b=xgZXJETDIrDVjMkNpgsSYd72qBcaOxqYYys9BMlv6tDjwySf5lHFvWHvWZ3VXhACam
 Dg3iiIWOp2BQeczME20Zg83Yo+xHgj+X50OC/YuIWS1pm0L0fyMO90H/9L/rGG2YttTK
 1kcYh8JbBAoyBqRiuOuEdCa+5YxVrzGs54XxIijgYA89ULvR2fZrNaQxtdJnC47YdTuX
 yLuEIIltbISVxp5Aqim/ESDbMDVUReEbBstoq2r/xbIxkQ55tQgsvZXEmyX3D5fkEEP9
 75vMasd80Fr0rOCylZ+vzYb3OfQCLis2pR+jbVX88+1Y5e/WaK75Y7CbYC5Bf+hwkHgN
 NAcg==
X-Gm-Message-State: AO0yUKViUbUZe5u5zvPzjAaTsvivzPKc7lYCWd/eMm1ZF6tJzJincF9a
 EmJeVER2FN7vVuva3npH0rhQN1sB4DaSQGMOAwA=
X-Google-Smtp-Source: AK7set/pY8mgGFvQpSwzqYFy12QCC7CsrgaaGrNfsNx0v0AC1yAlIT/GErdinIzLhrbaU0/mfBzEOYxCm8oYoYiBgDg=
X-Received: by 2002:a67:e184:0:b0:3eb:f205:2c08 with SMTP id
 e4-20020a67e184000000b003ebf2052c08mr1589258vsl.10.1675032032747; Sun, 29 Jan
 2023 14:40:32 -0800 (PST)
MIME-Version: 1.0
References: <20221223180016.2068508-1-christoph.muellner@vrull.eu>
 <20221223180016.2068508-2-christoph.muellner@vrull.eu>
 <CAKmqyKOXM2poHz5c1CbddvUBC-wQxQE3o_bm7bqrn+XTkqASrg@mail.gmail.com>
 <CAEg0e7jmWzOcTNOyKoBD19fsge_aCzfgizEg0WSto-a5SgzNeA@mail.gmail.com>
 <CAEg0e7jQM+bFHQ4ZxRUs+RHuiSJ4==TpEVcJvyFxDFcXGAqPrg@mail.gmail.com>
In-Reply-To: <CAEg0e7jQM+bFHQ4ZxRUs+RHuiSJ4==TpEVcJvyFxDFcXGAqPrg@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 30 Jan 2023 08:40:06 +1000
Message-ID: <CAKmqyKM3UqLziLgZN+UiKYiQw_bGY3eP4U4vyOEgSztCP5Ja9w@mail.gmail.com>
Subject: Re: [PATCH v2 01/15] RISC-V: Adding XTheadCmo ISA extension
To: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e33;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe33.google.com
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
X-List-Received-Date: Sun, 29 Jan 2023 22:40:38 -0000

On Wed, Jan 25, 2023 at 5:51 AM Christoph M=C3=BCllner
<christoph.muellner@vrull.eu> wrote:
>
>
>
> On Tue, Jan 24, 2023 at 6:31 PM Christoph M=C3=BCllner <christoph.muellne=
r@vrull.eu> wrote:
>>
>>
>>
>> On Mon, Jan 23, 2023 at 11:50 PM Alistair Francis <alistair23@gmail.com>=
 wrote:
>>>
>>> On Sat, Dec 24, 2022 at 4:09 AM Christoph Muellner
>>> <christoph.muellner@vrull.eu> wrote:
>>> >
>>> > From: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
>>> >
>>> > This patch adds support for the XTheadCmo ISA extension.
>>> > To avoid interfering with standard extensions, decoder and translatio=
n
>>> > are in its own xthead* specific files.
>>> > Future patches should be able to easily add additional T-Head extensi=
on.
>>> >
>>> > The implementation does not have much functionality (besides acceptin=
g
>>> > the instructions and not qualifying them as illegal instructions if
>>> > the hart executes in the required privilege level for the instruction=
),
>>> > as QEMU does not model CPU caches and instructions are documented
>>> > to not raise any exceptions.
>>> >
>>> > Changes in v2:
>>> > - Add ISA_EXT_DATA_ENTRY()
>>> > - Explicit test for PRV_U
>>> > - Encapsule access to env-priv in inline function
>>> > - Use single decoder for XThead extensions
>>> >
>>> > Co-developed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
>>> > Signed-off-by: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
>>> > ---
>>> >  target/riscv/cpu.c                         |  2 +
>>> >  target/riscv/cpu.h                         |  1 +
>>> >  target/riscv/insn_trans/trans_xthead.c.inc | 89 ++++++++++++++++++++=
++
>>> >  target/riscv/meson.build                   |  1 +
>>> >  target/riscv/translate.c                   | 15 +++-
>>> >  target/riscv/xthead.decode                 | 38 +++++++++
>>> >  6 files changed, 143 insertions(+), 3 deletions(-)
>>> >  create mode 100644 target/riscv/insn_trans/trans_xthead.c.inc
>>> >  create mode 100644 target/riscv/xthead.decode
>>> >
>>> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>>> > index 6fe176e483..a90b82c5c5 100644
>>> > --- a/target/riscv/cpu.c
>>> > +++ b/target/riscv/cpu.c
>>> > @@ -108,6 +108,7 @@ static const struct isa_ext_data isa_edata_arr[] =
=3D {
>>> >      ISA_EXT_DATA_ENTRY(svinval, true, PRIV_VERSION_1_12_0, ext_svinv=
al),
>>> >      ISA_EXT_DATA_ENTRY(svnapot, true, PRIV_VERSION_1_12_0, ext_svnap=
ot),
>>> >      ISA_EXT_DATA_ENTRY(svpbmt, true, PRIV_VERSION_1_12_0, ext_svpbmt=
),
>>> > +    ISA_EXT_DATA_ENTRY(xtheadcmo, true, PRIV_VERSION_1_11_0, ext_xth=
eadcmo),
>>> >      ISA_EXT_DATA_ENTRY(xventanacondops, true, PRIV_VERSION_1_12_0, e=
xt_XVentanaCondOps),
>>> >  };
>>> >
>>> > @@ -1060,6 +1061,7 @@ static Property riscv_cpu_extensions[] =3D {
>>> >      DEFINE_PROP_BOOL("zmmul", RISCVCPU, cfg.ext_zmmul, false),
>>> >
>>> >      /* Vendor-specific custom extensions */
>>> > +    DEFINE_PROP_BOOL("xtheadcmo", RISCVCPU, cfg.ext_xtheadcmo, false=
),
>>> >      DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCo=
ndOps, false),
>>> >
>>> >      /* These are experimental so mark with 'x-' */
>>> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>>> > index 443d15a47c..ad1c19f870 100644
>>> > --- a/target/riscv/cpu.h
>>> > +++ b/target/riscv/cpu.h
>>> > @@ -465,6 +465,7 @@ struct RISCVCPUConfig {
>>> >      uint64_t mimpid;
>>> >
>>> >      /* Vendor-specific custom extensions */
>>> > +    bool ext_xtheadcmo;
>>> >      bool ext_XVentanaCondOps;
>>> >
>>> >      uint8_t pmu_num;
>>> > diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/risc=
v/insn_trans/trans_xthead.c.inc
>>> > new file mode 100644
>>> > index 0000000000..00e75c7dca
>>> > --- /dev/null
>>> > +++ b/target/riscv/insn_trans/trans_xthead.c.inc
>>> > @@ -0,0 +1,89 @@
>>> > +/*
>>> > + * RISC-V translation routines for the T-Head vendor extensions (xth=
ead*).
>>> > + *
>>> > + * Copyright (c) 2022 VRULL GmbH.
>>> > + *
>>> > + * This program is free software; you can redistribute it and/or mod=
ify it
>>> > + * under the terms and conditions of the GNU General Public License,
>>> > + * version 2 or later, as published by the Free Software Foundation.
>>> > + *
>>> > + * This program is distributed in the hope it will be useful, but WI=
THOUT
>>> > + * ANY WARRANTY; without even the implied warranty of MERCHANTABILIT=
Y or
>>> > + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public Lic=
ense for
>>> > + * more details.
>>> > + *
>>> > + * You should have received a copy of the GNU General Public License=
 along with
>>> > + * this program.  If not, see <http://www.gnu.org/licenses/>.
>>> > + */
>>> > +
>>> > +#define REQUIRE_XTHEADCMO(ctx) do {              \
>>> > +    if (!ctx->cfg_ptr->ext_xtheadcmo) {          \
>>> > +        return false;                            \
>>> > +    }                                            \
>>> > +} while (0)
>>> > +
>>> > +/* XTheadCmo */
>>> > +
>>> > +static inline int priv_level(DisasContext *ctx)
>>> > +{
>>> > +#ifdef CONFIG_USER_ONLY
>>> > +    return PRV_U;
>>> > +#else
>>> > +     /* Priv level equals mem_idx -- see cpu_mmu_index. */
>>> > +    return ctx->mem_idx;
>>>
>>> This should be ANDed with TB_FLAGS_PRIV_MMU_MASK as sometimes this can
>>> include hypervisor priv access information
>>
>>
>> Ok.
>>
>>>
>>>
>>> > +#endif
>>> > +}
>>> > +
>>> > +#define REQUIRE_PRIV_MHSU(ctx)                                  \
>>> > +do {                                                            \
>>> > +    int priv =3D priv_level(ctx);                                 \
>>> > +    if (!(priv =3D=3D PRV_M ||                                      =
\
>>> > +          priv =3D=3D PRV_H ||                                      =
\
>>>
>>> PRV_H isn't used
>>>
>>> > +          priv =3D=3D PRV_S ||                                      =
\
>>> > +          priv =3D=3D PRV_U)) {                                     =
\
>>> > +        return false;                                           \
>>>
>>> When would this not be the case?
>>
>>
>> Ok, I will make this a macro that expands to nothing (and a comment).
>>
>>>
>>>
>>> > +    }                                                           \
>>> > +} while (0)
>>> > +
>>> > +#define REQUIRE_PRIV_MHS(ctx)                                   \
>>> > +do {                                                            \
>>> > +    int priv =3D priv_level(ctx);                                 \
>>> > +    if (!(priv =3D=3D PRV_M ||                                      =
\
>>> > +          priv =3D=3D PRV_H ||                                      =
\
>>>
>>> Also not used
>>
>>
>> Ok, I will remove the PRV_H.
>>
>>>
>>>
>>> > +          priv =3D=3D PRV_S)) {                                     =
\
>>> > +        return false;                                           \
>>> > +    }                                                           \
>>> > +} while (0)
>>> > +
>>> > +#define NOP_PRIVCHECK(insn, extcheck, privcheck)                \
>>> > +static bool trans_ ## insn(DisasContext *ctx, arg_ ## insn * a) \
>>> > +{                                                               \
>>> > +    (void) a;                                                   \
>>> > +    extcheck(ctx);                                              \
>>> > +    privcheck(ctx);                                             \
>>> > +    return true;                                                \
>>> > +}
>>> > +
>>> > +NOP_PRIVCHECK(th_dcache_call, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
>>> > +NOP_PRIVCHECK(th_dcache_ciall, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
>>> > +NOP_PRIVCHECK(th_dcache_iall, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
>>> > +NOP_PRIVCHECK(th_dcache_cpa, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
>>> > +NOP_PRIVCHECK(th_dcache_cipa, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
>>> > +NOP_PRIVCHECK(th_dcache_ipa, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
>>> > +NOP_PRIVCHECK(th_dcache_cva, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHSU)
>>> > +NOP_PRIVCHECK(th_dcache_civa, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHSU)
>>> > +NOP_PRIVCHECK(th_dcache_iva, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHSU)
>>> > +NOP_PRIVCHECK(th_dcache_csw, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
>>> > +NOP_PRIVCHECK(th_dcache_cisw, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
>>> > +NOP_PRIVCHECK(th_dcache_isw, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
>>> > +NOP_PRIVCHECK(th_dcache_cpal1, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
>>> > +NOP_PRIVCHECK(th_dcache_cval1, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
>>> > +
>>> > +NOP_PRIVCHECK(th_icache_iall, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
>>> > +NOP_PRIVCHECK(th_icache_ialls, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
>>> > +NOP_PRIVCHECK(th_icache_ipa, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
>>> > +NOP_PRIVCHECK(th_icache_iva, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHSU)
>>> > +
>>> > +NOP_PRIVCHECK(th_l2cache_call, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
>>> > +NOP_PRIVCHECK(th_l2cache_ciall, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
>>> > +NOP_PRIVCHECK(th_l2cache_iall, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
>>> > diff --git a/target/riscv/meson.build b/target/riscv/meson.build
>>> > index ba25164d74..5dee37a242 100644
>>> > --- a/target/riscv/meson.build
>>> > +++ b/target/riscv/meson.build
>>> > @@ -2,6 +2,7 @@
>>> >  gen =3D [
>>> >    decodetree.process('insn16.decode', extra_args: ['--static-decode=
=3Ddecode_insn16', '--insnwidth=3D16']),
>>> >    decodetree.process('insn32.decode', extra_args: '--static-decode=
=3Ddecode_insn32'),
>>> > +  decodetree.process('xthead.decode', extra_args: '--static-decode=
=3Ddecode_xthead'),
>>> >    decodetree.process('XVentanaCondOps.decode', extra_args: '--static=
-decode=3Ddecode_XVentanaCodeOps'),
>>> >  ]
>>> >
>>> > diff --git a/target/riscv/translate.c b/target/riscv/translate.c
>>> > index db123da5ec..14d9116975 100644
>>> > --- a/target/riscv/translate.c
>>> > +++ b/target/riscv/translate.c
>>> > @@ -125,13 +125,18 @@ static bool always_true_p(DisasContext *ctx  __=
attribute__((__unused__)))
>>> >      return true;
>>> >  }
>>> >
>>> > +static bool has_xthead_p(DisasContext *ctx  __attribute__((__unused_=
_)))
>>> > +{
>>> > +    return ctx->cfg_ptr->ext_xtheadcmo;
>>> > +}
>>> > +
>>> >  #define MATERIALISE_EXT_PREDICATE(ext)  \
>>> >      static bool has_ ## ext ## _p(DisasContext *ctx)    \
>>> >      { \
>>> >          return ctx->cfg_ptr->ext_ ## ext ; \
>>> >      }
>>> >
>>> > -MATERIALISE_EXT_PREDICATE(XVentanaCondOps);
>>> > +MATERIALISE_EXT_PREDICATE(XVentanaCondOps)
>>>
>>> Do we need this change?
>>
>>
>> It is indeed a drive-by cleanup, that is not necessary.
>> In v1 we were using this macro, therefore it made sense back then.
>> Will be dropped.
>>
>>>
>>>
>>> >
>>> >  #ifdef TARGET_RISCV32
>>> >  #define get_xl(ctx)    MXL_RV32
>>> > @@ -732,6 +737,10 @@ static int ex_rvc_shiftri(DisasContext *ctx, int=
 imm)
>>> >  /* Include the auto-generated decoder for 32 bit insn */
>>> >  #include "decode-insn32.c.inc"
>>> >
>>> > +/* Include decoders for factored-out extensions */
>>> > +#include "decode-xthead.c.inc"
>>> > +#include "decode-XVentanaCondOps.c.inc"
>>> > +
>>> >  static bool gen_logic_imm_fn(DisasContext *ctx, arg_i *a,
>>> >                               void (*func)(TCGv, TCGv, target_long))
>>> >  {
>>> > @@ -1033,12 +1042,11 @@ static uint32_t opcode_at(DisasContextBase *d=
cbase, target_ulong pc)
>>> >  #include "insn_trans/trans_rvk.c.inc"
>>> >  #include "insn_trans/trans_privileged.c.inc"
>>> >  #include "insn_trans/trans_svinval.c.inc"
>>> > +#include "insn_trans/trans_xthead.c.inc"
>>> >  #include "insn_trans/trans_xventanacondops.c.inc"
>>> >
>>> >  /* Include the auto-generated decoder for 16 bit insn */
>>> >  #include "decode-insn16.c.inc"
>>> > -/* Include decoders for factored-out extensions */
>>> > -#include "decode-XVentanaCondOps.c.inc"
>>>
>>> Can we not leave these at the bottom?
>>
>>
>> Ok.
>
>
> I got reminded again, why this is like it is:
> The decoder code needs to be included before the translation functions,
> because the translation functions use types that are defined in the gener=
ated decoder code.
> And I wanted to keep all vendor extensions together.

Ah ok, why not keep each extension together instead, like this:

#include "decode-xthead.c.inc"
#include "insn_trans/trans_xthead.c.inc"

#include "decode-XVentanaCondOps.c.inc"

Alistair

