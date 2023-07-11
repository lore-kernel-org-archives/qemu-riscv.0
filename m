Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F8AEB64D9
	for <qemu-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 03:16:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qJ3rU-0006iz-EL; Mon, 10 Jul 2023 23:16:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qJ3rS-0006iF-DP; Mon, 10 Jul 2023 23:16:22 -0400
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qJ3rQ-0001S9-2Z; Mon, 10 Jul 2023 23:16:22 -0400
Received: by mail-vs1-xe32.google.com with SMTP id
 ada2fe7eead31-440c368b4e2so1609472137.2; 
 Mon, 10 Jul 2023 20:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689045378; x=1691637378;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IeeWerrXbZriJ/eJOOog9XQClSHx8b4bawswCvDPmtM=;
 b=bMfnHHaENunwaWcGc91zGt/KlzgtVoGBZUyvXAEUDlwOAsTDl+ox18arBHO2sJny7a
 wYqchzooYaFNC3o9r65uSyCRQLcC/vMF+JUEgVm+FyHxzXQAFQK4AQLvTV6PROcVasYa
 vwZNsRfp1KTt0VcY8srq/lonU90AW6Gcq2RWvSFU699w34oUGeaKvI4RzNugGgnyhHm/
 i7Ggabcyw4BZxHFmDzZO+pk3hrN4iwFqigGEXauk30thTaw3NHIMxkCrbQwgSLLWou1t
 b2sEubkhSn0AeP5pacutDuxCsL0CHwwrZWIOcWrrYhiLXlZy5djk9diHvK9PrTGeX1iP
 yrIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689045378; x=1691637378;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IeeWerrXbZriJ/eJOOog9XQClSHx8b4bawswCvDPmtM=;
 b=JRpRK/95uhtpoGVT2/DB9cT8jDNvPOiGy7z7Xh9FytHz99nFPj3XSdYj8ZG2gVONWh
 iNExNs4m3iTjWKMDFPxwHha9nf/t/HHh0nhwHQ/US1k8JkpQ1iXFMPLDkMWfFYhbe60U
 /QoqKuktobY9WMDuYTm7XWHVtC+eiXiexXnnDEO1DlWJ6UYX+bGIU0cvk79uQ0LLHRNU
 st9fj19xs2BnoyRt9qkgMPXCYV9Miq8IoMwgAVvkrILfRi5MFKQuZkvsKZYO1VQPUUqy
 uhR3lsrdfm3X9dAH7rBpGx3Ca12jnHDnW3PCTwQmSWeHjx2ZWLNgEngQ+9qLV2ZS3nDA
 /5aQ==
X-Gm-Message-State: ABy/qLbDtWZ/UdQ7fjG6L1DJF80m/5yEoAzLSBlOECYZXIlRmHCsHGn2
 QPxNBqlksBGzFlU+UAEmW/IpYsJ5LhI7Gav3aus=
X-Google-Smtp-Source: APBJJlF671/N+78HbATC392NfAA/gGKeFu/4bPcGmO4QEZpjfmCoz+y9TwTp2ynDo78cWvbrO1/2CKK4b6r/Y6D4srM=
X-Received: by 2002:a67:fd4c:0:b0:443:6457:101 with SMTP id
 g12-20020a67fd4c000000b0044364570101mr7017573vsr.7.1689045378159; Mon, 10 Jul
 2023 20:16:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230702155354.2478495-1-max.chou@sifive.com>
 <20230702155354.2478495-13-max.chou@sifive.com>
 <f943fa94-d105-da53-28e0-04b7afeba165@ventanamicro.com>
 <9922287f-7852-1167-51ac-53b977c94a94@sifive.com>
In-Reply-To: <9922287f-7852-1167-51ac-53b977c94a94@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 11 Jul 2023 13:15:51 +1000
Message-ID: <CAKmqyKP4_oyqHD+dfBJmKX6nuJA4bfgRSi8LUWYOQG9FQ06DEg@mail.gmail.com>
Subject: Re: [PATCH v7 12/15] target/riscv: Add Zvkg ISA extension support
To: Max Chou <max.chou@sifive.com>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Nazar Kazakov <nazar.kazakov@codethink.co.uk>, 
 Lawrence Hunter <lawrence.hunter@codethink.co.uk>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Kiran Ostrolenk <kiran.ostrolenk@codethink.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e32;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe32.google.com
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

On Mon, Jul 10, 2023 at 6:37=E2=80=AFPM Max Chou <max.chou@sifive.com> wrot=
e:
>
> On 2023/7/8 5:25 PM, Daniel Henrique Barboza wrote:
>
> > Hi,
> >
> > This patch breaks some gitlab runners because of this:
> >
> > On 7/2/23 12:53, Max Chou wrote:
> >> From: Nazar Kazakov <nazar.kazakov@codethink.co.uk>
> >>
> >> This commit adds support for the Zvkg vector-crypto extension, which
> >> consists of the following instructions:
> >>
> >> * vgmul.vv
> >> * vghsh.vv
> >>
> >> Translation functions are defined in
> >> `target/riscv/insn_trans/trans_rvvk.c.inc` and helpers are defined in
> >> `target/riscv/vcrypto_helper.c`.
> >>
> >> Co-authored-by: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
> >> [max.chou@sifive.com: Replaced vstart checking by TCG op]
> >> Signed-off-by: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
> >> Signed-off-by: Nazar Kazakov <nazar.kazakov@codethink.co.uk>
> >> Signed-off-by: Max Chou <max.chou@sifive.com>
> >> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> >> [max.chou@sifive.com: Exposed x-zvkg property]
> >> ---
> >>   target/riscv/cpu.c                       |  6 +-
> >>   target/riscv/cpu_cfg.h                   |  1 +
> >>   target/riscv/helper.h                    |  3 +
> >>   target/riscv/insn32.decode               |  4 ++
> >>   target/riscv/insn_trans/trans_rvvk.c.inc | 30 ++++++++++
> >>   target/riscv/vcrypto_helper.c            | 72 ++++++++++++++++++++++=
++
> >>   6 files changed, 114 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> >> index 08b8355f52..699ab5e9fa 100644
> >> --- a/target/riscv/cpu.c
> >> +++ b/target/riscv/cpu.c
> >> @@ -118,6 +118,7 @@ static const struct isa_ext_data isa_edata_arr[] =
=3D {
> >>       ISA_EXT_DATA_ENTRY(zve64d, PRIV_VERSION_1_10_0, ext_zve64d),
> >>       ISA_EXT_DATA_ENTRY(zvfh, PRIV_VERSION_1_12_0, ext_zvfh),
> >>       ISA_EXT_DATA_ENTRY(zvfhmin, PRIV_VERSION_1_12_0, ext_zvfhmin),
> >> +    ISA_EXT_DATA_ENTRY(zvkg, PRIV_VERSION_1_12_0, ext_zvkg),
> >>       ISA_EXT_DATA_ENTRY(zvkned, PRIV_VERSION_1_12_0, ext_zvkned),
> >>       ISA_EXT_DATA_ENTRY(zvknha, PRIV_VERSION_1_12_0, ext_zvknha),
> >>       ISA_EXT_DATA_ENTRY(zvknhb, PRIV_VERSION_1_12_0, ext_zvknhb),
> >> @@ -1194,8 +1195,8 @@ void riscv_cpu_validate_set_extensions(RISCVCPU
> >> *cpu, Error **errp)
> >>        * In principle Zve*x would also suffice here, were they support=
ed
> >>        * in qemu
> >>        */
> >> -    if ((cpu->cfg.ext_zvbb || cpu->cfg.ext_zvkned ||
> >> cpu->cfg.ext_zvknha ||
> >> -         cpu->cfg.ext_zvksh) && !cpu->cfg.ext_zve32f) {
> >> +    if ((cpu->cfg.ext_zvbb || cpu->cfg.ext_zvkg ||
> >> cpu->cfg.ext_zvkned ||
> >> +         cpu->cfg.ext_zvknha || cpu->cfg.ext_zvksh) &&
> >> !cpu->cfg.ext_zve32f) {
> >>           error_setg(errp,
> >>                      "Vector crypto extensions require V or Zve*
> >> extensions");
> >>           return;
> >> @@ -1710,6 +1711,7 @@ static Property riscv_cpu_extensions[] =3D {
> >>       /* Vector cryptography extensions */
> >>       DEFINE_PROP_BOOL("x-zvbb", RISCVCPU, cfg.ext_zvbb, false),
> >>       DEFINE_PROP_BOOL("x-zvbc", RISCVCPU, cfg.ext_zvbc, false),
> >> +    DEFINE_PROP_BOOL("x-zvkg", RISCVCPU, cfg.ext_zvkg, false),
> >>       DEFINE_PROP_BOOL("x-zvkned", RISCVCPU, cfg.ext_zvkned, false),
> >>       DEFINE_PROP_BOOL("x-zvknha", RISCVCPU, cfg.ext_zvknha, false),
> >>       DEFINE_PROP_BOOL("x-zvknhb", RISCVCPU, cfg.ext_zvknhb, false),
> >> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> >> index 27062b12a8..960761c479 100644
> >> --- a/target/riscv/cpu_cfg.h
> >> +++ b/target/riscv/cpu_cfg.h
> >> @@ -85,6 +85,7 @@ struct RISCVCPUConfig {
> >>       bool ext_zve64d;
> >>       bool ext_zvbb;
> >>       bool ext_zvbc;
> >> +    bool ext_zvkg;
> >>       bool ext_zvkned;
> >>       bool ext_zvknha;
> >>       bool ext_zvknhb;
> >> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> >> index 172c91c65c..238343cb42 100644
> >> --- a/target/riscv/helper.h
> >> +++ b/target/riscv/helper.h
> >> @@ -1244,3 +1244,6 @@ DEF_HELPER_5(vsha2cl64_vv, void, ptr, ptr, ptr,
> >> env, i32)
> >>     DEF_HELPER_5(vsm3me_vv, void, ptr, ptr, ptr, env, i32)
> >>   DEF_HELPER_5(vsm3c_vi, void, ptr, ptr, i32, env, i32)
> >> +
> >> +DEF_HELPER_5(vghsh_vv, void, ptr, ptr, ptr, env, i32)
> >> +DEF_HELPER_4(vgmul_vv, void, ptr, ptr, env, i32)
> >> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> >> index 5ca83e8462..b10497afd3 100644
> >> --- a/target/riscv/insn32.decode
> >> +++ b/target/riscv/insn32.decode
> >> @@ -957,3 +957,7 @@ vsha2cl_vv  101111 1 ..... ..... 010 .....
> >> 1110111 @r_vm_1
> >>   # *** Zvksh vector crypto extension ***
> >>   vsm3me_vv   100000 1 ..... ..... 010 ..... 1110111 @r_vm_1
> >>   vsm3c_vi    101011 1 ..... ..... 010 ..... 1110111 @r_vm_1
> >> +
> >> +# *** Zvkg vector crypto extension ***
> >> +vghsh_vv    101100 1 ..... ..... 010 ..... 1110111 @r_vm_1
> >> +vgmul_vv    101000 1 ..... 10001 010 ..... 1110111 @r2_vm_1
> >> diff --git a/target/riscv/insn_trans/trans_rvvk.c.inc
> >> b/target/riscv/insn_trans/trans_rvvk.c.inc
> >> index 6469dd2f02..af7cd62e7d 100644
> >> --- a/target/riscv/insn_trans/trans_rvvk.c.inc
> >> +++ b/target/riscv/insn_trans/trans_rvvk.c.inc
> >> @@ -531,3 +531,33 @@ static inline bool vsm3c_check(DisasContext *s,
> >> arg_rmrr *a)
> >>     GEN_VV_UNMASKED_TRANS(vsm3me_vv, vsm3me_check, ZVKSH_EGS)
> >>   GEN_VI_UNMASKED_TRANS(vsm3c_vi, vsm3c_check, ZVKSH_EGS)
> >> +
> >> +/*
> >> + * Zvkg
> >> + */
> >> +
> >> +#define ZVKG_EGS 4
> >> +
> >> +static bool vgmul_check(DisasContext *s, arg_rmr *a)
> >> +{
> >> +    int egw_bytes =3D ZVKG_EGS << s->sew;
> >> +    return s->cfg_ptr->ext_zvkg =3D=3D true &&
> >> +           vext_check_isa_ill(s) &&
> >> +           require_rvv(s) &&
> >> +           MAXSZ(s) >=3D egw_bytes &&
> >> +           vext_check_ss(s, a->rd, a->rs2, a->vm) &&
> >> +           s->sew =3D=3D MO_32;
> >> +}
> >> +
> >> +GEN_V_UNMASKED_TRANS(vgmul_vv, vgmul_check, ZVKG_EGS)
> >> +
> >> +static bool vghsh_check(DisasContext *s, arg_rmrr *a)
> >> +{
> >> +    int egw_bytes =3D ZVKG_EGS << s->sew;
> >> +    return s->cfg_ptr->ext_zvkg =3D=3D true &&
> >> +           opivv_check(s, a) &&
> >> +           MAXSZ(s) >=3D egw_bytes &&
> >> +           s->sew =3D=3D MO_32;
> >> +}
> >> +
> >> +GEN_VV_UNMASKED_TRANS(vghsh_vv, vghsh_check, ZVKG_EGS)
> >> diff --git a/target/riscv/vcrypto_helper.c
> >> b/target/riscv/vcrypto_helper.c
> >> index ff7fb11928..f127fc0d3a 100644
> >> --- a/target/riscv/vcrypto_helper.c
> >> +++ b/target/riscv/vcrypto_helper.c
> >> @@ -769,3 +769,75 @@ void HELPER(vsm3c_vi)(void *vd_vptr, void
> >> *vs2_vptr, uint32_t uimm,
> >>       vext_set_elems_1s(vd_vptr, vta, env->vl * esz, total_elems * esz=
);
> >>       env->vstart =3D 0;
> >>   }
> >> +
> >> +void HELPER(vghsh_vv)(void *vd_vptr, void *vs1_vptr, void *vs2_vptr,
> >> +                      CPURISCVState *env, uint32_t desc)
> >> +{
> >> +    uint64_t *vd =3D vd_vptr;
> >> +    uint64_t *vs1 =3D vs1_vptr;
> >> +    uint64_t *vs2 =3D vs2_vptr;
> >> +    uint32_t vta =3D vext_vta(desc);
> >> +    uint32_t total_elems =3D vext_get_total_elems(env, desc, 4);
> >> +
> >> +    for (uint32_t i =3D env->vstart / 4; i < env->vl / 4; i++) {
> >> +        uint64_t Y[2] =3D {vd[i * 2 + 0], vd[i * 2 + 1]};
> >> +        uint64_t H[2] =3D {brev8(vs2[i * 2 + 0]), brev8(vs2[i * 2 + 1=
])};
> >> +        uint64_t X[2] =3D {vs1[i * 2 + 0], vs1[i * 2 + 1]};
> >> +        uint64_t Z[2] =3D {0, 0};
> >> +
> >> +        uint64_t S[2] =3D {brev8(Y[0] ^ X[0]), brev8(Y[1] ^ X[1])};
> >> +
> >> +        for (uint j =3D 0; j < 128; j++) {
> >
> > ^
> >
> > and this
> >
> >     FAILED:
> >     libqemu-riscv64-softmmu.fa.p/target_riscv_vcrypto_helper.c.obj
> >     i686-w64-mingw32-gcc -m32 -Ilibqemu-riscv64-softmmu.fa.p -I. -I..
> >     -Itarget/riscv -I../target/riscv -Isubprojects/dtc/libfdt
> >     -I../subprojects/dtc/libfdt -Iqapi -Itrace -Iui -Iui/shader
> >     -I/usr/i686-w64-mingw32/sys-root/mingw/include/pixman-1
> >     -I/usr/i686-w64-mingw32/sys-root/mingw/include/glib-2.0
> >     -I/usr/i686-w64-mingw32/sys-root/mingw/lib/glib-2.0/include
> >     -fdiagnostics-color=3Dauto -Wall -Winvalid-pch -Werror -std=3Dgnu11
> > -O2 -g
> >     -fstack-protector-strong -Wundef -Wwrite-strings -Wmissing-prototyp=
es
> >     -Wstrict-prototypes -Wredundant-decls -Wold-style-declaration
> >     -Wold-style-definition -Wtype-limits -Wformat-security -Wformat-y2k
> >     -Winit-self -Wignored-qualifiers -Wempty-body -Wnested-externs
> >     -Wendif-labels -Wexpansion-to-defined -Wimplicit-fallthrough=3D2
> >     -Wmissing-format-attribute -Wno-missing-include-dirs
> >     -Wno-shift-negative-value -Wno-psabi -iquote . -iquote
> >     /builds/danielhb/qemu -iquote /builds/danielhb/qemu/include -iquote
> >     /builds/danielhb/qemu/host/include/i386 -iquote
> >     /builds/danielhb/qemu/host/include/generic -iquote
> >     /builds/danielhb/qemu/tcg/i386 -mms-bitfields -D_GNU_SOURCE
> >     -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -fno-strict-aliasing
> >     -fno-common -fwrapv -fno-pie -no-pie -DNEED_CPU_H
> >     '-DCONFIG_TARGET=3D"riscv64-softmmu-config-target.h"'
> >     '-DCONFIG_DEVICES=3D"riscv64-softmmu-config-devices.h"' -MD -MQ
> >     libqemu-riscv64-softmmu.fa.p/target_riscv_vcrypto_helper.c.obj -MF
> > libqemu-riscv64-softmmu.fa.p/target_riscv_vcrypto_helper.c.obj.d -o
> >     libqemu-riscv64-softmmu.fa.p/target_riscv_vcrypto_helper.c.obj -c
> >     ../target/riscv/vcrypto_helper.c
> >     ../target/riscv/vcrypto_helper.c: In function 'helper_vghsh_vv':
> >     ../target/riscv/vcrypto_helper.c:791:14: error: unknown type name
> >     'uint'; did you mean 'u_int'?
> >       791 |         for (uint j =3D 0; j < 128; j++) {
> >           |              ^~~~
> >           |              u_int
> >     ../target/riscv/vcrypto_helper.c: In function 'helper_vgmul_vv':
> >     ../target/riscv/vcrypto_helper.c:825:14: error: unknown type name
> >     'uint'; did you mean 'u_int'?
> >       825 |         for (uint j =3D 0; j < 128; j++) {
> >           |              ^~~~
> >           |              u_int
> >     [2503/3700] Compiling C object
> >     libqemu-riscv64-softmmu.fa.p/target_riscv_vector_helper.c.obj
> >
> >
> > If you want to take a look yourself:
> >
> > https://gitlab.com/danielhb/qemu/-/jobs/4615946161
> >
> > The fix is to use 'int' instead of 'uint' in both cases.
> >
> > I apologize for noticing the error this late. I haven't had the chance
> > to run
> > Gitlab runners in these patches until now.
> >
> > Alistair, in case you decide to take this series you'll have to amend
> > this
> > in-tree I'm afraid. It's too late to ask for another review.
> >
> >
> > Thanks,
> >
> >
> > Daniel
>
> Hi Daniel,
>
> Thanks you for the testing and notification.
> If this series are not be taken at the 8.1 feature freeze (July 11th),
> I'll provide the next version with the fix.

Hey Max,

Thanks for the patches. Unfortunately they won't make the feature
freeze. They depend on other patches and I haven't gotten a chance to
look at them yet. If you can send a new version I can start reviewing
and apply them to my tree in preparation of the next release

Alistair

>
> Thanks,
>
> Max
>
> >
> >> +            if ((S[j / 64] >> (j % 64)) & 1) {
> >> +                Z[0] ^=3D H[0];
> >> +                Z[1] ^=3D H[1];
> >> +            }
> >> +            bool reduce =3D ((H[1] >> 63) & 1);
> >> +            H[1] =3D H[1] << 1 | H[0] >> 63;
> >> +            H[0] =3D H[0] << 1;
> >> +            if (reduce) {
> >> +                H[0] ^=3D 0x87;
> >> +            }
> >> +        }
> >> +
> >> +        vd[i * 2 + 0] =3D brev8(Z[0]);
> >> +        vd[i * 2 + 1] =3D brev8(Z[1]);
> >> +    }
> >> +    /* set tail elements to 1s */
> >> +    vext_set_elems_1s(vd, vta, env->vl * 4, total_elems * 4);
> >> +    env->vstart =3D 0;
> >> +}
> >> +
> >> +void HELPER(vgmul_vv)(void *vd_vptr, void *vs2_vptr, CPURISCVState
> >> *env,
> >> +                      uint32_t desc)
> >> +{
> >> +    uint64_t *vd =3D vd_vptr;
> >> +    uint64_t *vs2 =3D vs2_vptr;
> >> +    uint32_t vta =3D vext_vta(desc);
> >> +    uint32_t total_elems =3D vext_get_total_elems(env, desc, 4);
> >> +
> >> +    for (uint32_t i =3D env->vstart / 4; i < env->vl / 4; i++) {
> >> +        uint64_t Y[2] =3D {brev8(vd[i * 2 + 0]), brev8(vd[i * 2 + 1])=
};
> >> +        uint64_t H[2] =3D {brev8(vs2[i * 2 + 0]), brev8(vs2[i * 2 + 1=
])};
> >> +        uint64_t Z[2] =3D {0, 0};
> >> +
> >> +        for (uint j =3D 0; j < 128; j++) {
> >
> > ^
> >
> > The error being thrown:
> >
> >     FAILED:
> >     libqemu-riscv64-softmmu.fa.p/target_riscv_vcrypto_helper.c.obj
> >     i686-w64-mingw32-gcc -m32 -Ilibqemu-riscv64-softmmu.fa.p -I. -I..
> >     -Itarget/riscv -I../target/riscv -Isubprojects/dtc/libfdt
> >     -I../subprojects/dtc/libfdt -Iqapi -Itrace -Iui -Iui/shader
> >     -I/usr/i686-w64-mingw32/sys-root/mingw/include/pixman-1
> >     -I/usr/i686-w64-mingw32/sys-root/mingw/include/glib-2.0
> >     -I/usr/i686-w64-mingw32/sys-root/mingw/lib/glib-2.0/include
> >     -fdiagnostics-color=3Dauto -Wall -Winvalid-pch -Werror -std=3Dgnu11
> > -O2 -g
> >     -fstack-protector-strong -Wundef -Wwrite-strings -Wmissing-prototyp=
es
> >     -Wstrict-prototypes -Wredundant-decls -Wold-style-declaration
> >     -Wold-style-definition -Wtype-limits -Wformat-security -Wformat-y2k
> >     -Winit-self -Wignored-qualifiers -Wempty-body -Wnested-externs
> >     -Wendif-labels -Wexpansion-to-defined -Wimplicit-fallthrough=3D2
> >     -Wmissing-format-attribute -Wno-missing-include-dirs
> >     -Wno-shift-negative-value -Wno-psabi -iquote . -iquote
> >     /builds/danielhb/qemu -iquote /builds/danielhb/qemu/include -iquote
> >     /builds/danielhb/qemu/host/include/i386 -iquote
> >     /builds/danielhb/qemu/host/include/generic -iquote
> >     /builds/danielhb/qemu/tcg/i386 -mms-bitfields -D_GNU_SOURCE
> >     -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -fno-strict-aliasing
> >     -fno-common -fwrapv -fno-pie -no-pie -DNEED_CPU_H
> >     '-DCONFIG_TARGET=3D"riscv64-softmmu-config-target.h"'
> >     '-DCONFIG_DEVICES=3D"riscv64-softmmu-config-devices.h"' -MD -MQ
> >     libqemu-riscv64-softmmu.fa.p/target_riscv_vcrypto_helper.c.obj -MF
> > libqemu-riscv64-softmmu.fa.p/target_riscv_vcrypto_helper.c.obj.d -o
> >     libqemu-riscv64-softmmu.fa.p/target_riscv_vcrypto_helper.c.obj -c
> >     ../target/riscv/vcrypto_helper.c
> >     ../target/riscv/vcrypto_helper.c: In function 'helper_vghsh_vv':
> >     ../target/riscv/vcrypto_helper.c:791:14: error: unknown type name
> >     'uint'; did you mean 'u_int'?
> >       791 |         for (uint j =3D 0; j < 128; j++) {
> >           |              ^~~~
> >           |              u_int
> >     ../target/riscv/vcrypto_helper.c: In function 'helper_vgmul_vv':
> >     ../target/riscv/vcrypto_helper.c:825:14: error: unknown type name
> >     'uint'; did you mean 'u_int'?
> >       825 |         for (uint j =3D 0; j < 128; j++) {
> >           |              ^~~~
> >           |              u_int
> >     [2503/3700] Compiling C object
> >     libqemu-riscv64-softmmu.fa.p/target_riscv_vector_helper.c.obj
> >
> >
> >> +            if ((Y[j / 64] >> (j % 64)) & 1) {
> >> +                Z[0] ^=3D H[0];
> >> +                Z[1] ^=3D H[1];
> >> +            }
> >> +            bool reduce =3D ((H[1] >> 63) & 1);
> >> +            H[1] =3D H[1] << 1 | H[0] >> 63;
> >> +            H[0] =3D H[0] << 1;
> >> +            if (reduce) {
> >> +                H[0] ^=3D 0x87;
> >> +            }
> >> +        }
> >> +
> >> +        vd[i * 2 + 0] =3D brev8(Z[0]);
> >> +        vd[i * 2 + 1] =3D brev8(Z[1]);
> >> +    }
> >> +    /* set tail elements to 1s */
> >> +    vext_set_elems_1s(vd, vta, env->vl * 4, total_elems * 4);
> >> +    env->vstart =3D 0;
> >> +}
>

