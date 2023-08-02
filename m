Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91D1DC001E0
	for <qemu-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 14:39:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qRD0A-0001aJ-JF; Wed, 02 Aug 2023 10:39:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qRD06-0001Hp-Ez; Wed, 02 Aug 2023 10:38:58 -0400
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qRD02-0008Tj-5u; Wed, 02 Aug 2023 10:38:58 -0400
Received: by mail-vk1-xa2b.google.com with SMTP id
 71dfb90a1353d-486519e5e19so2499985e0c.0; 
 Wed, 02 Aug 2023 07:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690987129; x=1691591929;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0AgpEoJ2bSA8zuGBMso9ULxETfX6x1naxF9qu+4/9Xs=;
 b=SHJw1S2E5YyFaGfcwvA2KAzOentc4GS3bXK6zbvNqkinpDWFuVqbZemOQhz+5WusfB
 qVI/W1g/UdILUCG6qLQK6Ib1MPJPiK+/qR3XBcWLpHedw6o3DajerElguV+zJZIMM4kr
 7z/m5ES51KcSYOAdKQIIemJNS672RQc6bZdNZnJXn3H6CXI1YFB3KyzF8DCyAsEr5ufV
 8duOpw7tIk98vlTMbpGX9b3dfAvJEjz7O8x5ZUOw8nbg5jWjB+hnfMQ8mAxNHBEXWehq
 6l48qfS9P+64qpWiUVitaYRiWHFuuie9JCORiyX5GkctrC2z6speP6GE9UlEEsS/2pcA
 adKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690987129; x=1691591929;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0AgpEoJ2bSA8zuGBMso9ULxETfX6x1naxF9qu+4/9Xs=;
 b=Vh1X91HGk5neCgROGfcGa32hy9zshPkNwc6N4BEVTsQuqAn7MRsdcLNORjJqCGctM5
 plWQB+f5Oycc3/AD6SVzwa0J4QuI3WLPO4bE+n52rJo4fp5/agVNRVsclN8XYyxUUXtK
 H5F4D6c7Sj1Q356n6jYW3ZZoJ+nsqFr8RHpPFbzOMpFc3Mm1mjqbvI4Ig875Oy4mM2b4
 fiYI/FUljLX3CgHa9AdRFAQuURAue4ouMOEQwYjdBdUn6vkGVRKTDOJMnohdxL+3hi/x
 DHmQ4ykK/d/bdbYc5ic5T9EAQebIS99Au/kLEii9hHp/zBkvd0TdA9z1/KArSesB/+MV
 utow==
X-Gm-Message-State: ABy/qLarRReSh6loexTu1+7c9JmQulQ/A40RxuDu3KECz5IComYH3p2u
 uwVlpAIGE4wzLdNRibKj8Y24aciSM8i+GiY/QYI=
X-Google-Smtp-Source: APBJJlFtDn6+LPBgSTDDrcVWwI2IiNjbZa36CZyTBamtCCxZLdD+tKd5yYnnt6FGB/35UqQhfnW2QTm29oONYh7kGac=
X-Received: by 2002:a1f:e004:0:b0:486:3cc7:5435 with SMTP id
 x4-20020a1fe004000000b004863cc75435mr4374110vkg.1.1690987127152; Wed, 02 Aug
 2023 07:38:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230711165917.2629866-1-max.chou@sifive.com>
 <20230711165917.2629866-9-max.chou@sifive.com>
In-Reply-To: <20230711165917.2629866-9-max.chou@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 2 Aug 2023 10:38:21 -0400
Message-ID: <CAKmqyKMwm8=waYq8R72hOFmCifXzkxMJ6REyPqhzOxO3D8rHrA@mail.gmail.com>
Subject: Re: [PATCH v8 08/15] target/riscv: Add Zvbb ISA extension support
To: Max Chou <max.chou@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, dbarboza@ventanamicro.com, 
 Dickon Hood <dickon.hood@codethink.co.uk>,
 Nazar Kazakov <nazar.kazakov@codethink.co.uk>, 
 William Salmon <will.salmon@codethink.co.uk>, 
 Kiran Ostrolenk <kiran.ostrolenk@codethink.co.uk>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Lawrence Hunter <lawrence.hunter@codethink.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2b;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2b.google.com
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

On Tue, Jul 11, 2023 at 1:00=E2=80=AFPM Max Chou <max.chou@sifive.com> wrot=
e:
>
> From: Dickon Hood <dickon.hood@codethink.co.uk>
>
> This commit adds support for the Zvbb vector-crypto extension, which
> consists of the following instructions:
>
> * vrol.[vv,vx]
> * vror.[vv,vx,vi]
> * vbrev8.v
> * vrev8.v
> * vandn.[vv,vx]
> * vbrev.v
> * vclz.v
> * vctz.v
> * vcpop.v
> * vwsll.[vv,vx,vi]
>
> Translation functions are defined in
> `target/riscv/insn_trans/trans_rvvk.c.inc` and helpers are defined in
> `target/riscv/vcrypto_helper.c`.
>
> Co-authored-by: Nazar Kazakov <nazar.kazakov@codethink.co.uk>
> Co-authored-by: William Salmon <will.salmon@codethink.co.uk>
> Co-authored-by: Kiran Ostrolenk <kiran.ostrolenk@codethink.co.uk>
> [max.chou@sifive.com: Fix imm mode of vror.vi]
> Signed-off-by: Nazar Kazakov <nazar.kazakov@codethink.co.uk>
> Signed-off-by: William Salmon <will.salmon@codethink.co.uk>
> Signed-off-by: Kiran Ostrolenk <kiran.ostrolenk@codethink.co.uk>
> Signed-off-by: Dickon Hood <dickon.hood@codethink.co.uk>
> Signed-off-by: Max Chou <max.chou@sifive.com>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> [max.chou@sifive.com: Exposed x-zvbb property]

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c                       |  12 ++
>  target/riscv/cpu_cfg.h                   |   1 +
>  target/riscv/helper.h                    |  62 +++++++++
>  target/riscv/insn32.decode               |  20 +++
>  target/riscv/insn_trans/trans_rvvk.c.inc | 164 +++++++++++++++++++++++
>  target/riscv/vcrypto_helper.c            | 138 +++++++++++++++++++
>  6 files changed, 397 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index d1dc78d483f..e39a6118bbc 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -119,6 +119,7 @@ static const struct isa_ext_data isa_edata_arr[] =3D =
{
>      ISA_EXT_DATA_ENTRY(zksed, PRIV_VERSION_1_12_0, ext_zksed),
>      ISA_EXT_DATA_ENTRY(zksh, PRIV_VERSION_1_12_0, ext_zksh),
>      ISA_EXT_DATA_ENTRY(zkt, PRIV_VERSION_1_12_0, ext_zkt),
> +    ISA_EXT_DATA_ENTRY(zvbb, PRIV_VERSION_1_12_0, ext_zvbb),
>      ISA_EXT_DATA_ENTRY(zvbc, PRIV_VERSION_1_12_0, ext_zvbc),
>      ISA_EXT_DATA_ENTRY(zve32f, PRIV_VERSION_1_10_0, ext_zve32f),
>      ISA_EXT_DATA_ENTRY(zve64f, PRIV_VERSION_1_10_0, ext_zve64f),
> @@ -1269,6 +1270,16 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *c=
pu, Error **errp)
>          return;
>      }
>
> +    /*
> +     * In principle Zve*x would also suffice here, were they supported
> +     * in qemu
> +     */
> +    if (cpu->cfg.ext_zvbb && !cpu->cfg.ext_zve32f) {
> +        error_setg(errp,
> +                   "Vector crypto extensions require V or Zve* extension=
s");
> +        return;
> +    }
> +
>      if (cpu->cfg.ext_zvbc && !cpu->cfg.ext_zve64f) {
>          error_setg(errp, "Zvbc extension requires V or Zve64{f,d} extens=
ions");
>          return;
> @@ -1852,6 +1863,7 @@ static Property riscv_cpu_extensions[] =3D {
>      DEFINE_PROP_BOOL("x-zvfbfwma", RISCVCPU, cfg.ext_zvfbfwma, false),
>
>      /* Vector cryptography extensions */
> +    DEFINE_PROP_BOOL("x-zvbb", RISCVCPU, cfg.ext_zvbb, false),
>      DEFINE_PROP_BOOL("x-zvbc", RISCVCPU, cfg.ext_zvbc, false),
>
>      DEFINE_PROP_END_OF_LIST(),
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index d25b36a5128..0e31ebeed93 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -85,6 +85,7 @@ struct RISCVCPUConfig {
>      bool ext_zve32f;
>      bool ext_zve64f;
>      bool ext_zve64d;
> +    bool ext_zvbb;
>      bool ext_zvbc;
>      bool ext_zmmul;
>      bool ext_zvfbfmin;
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index 6776777c4eb..3db25ed2a20 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -1188,3 +1188,65 @@ DEF_HELPER_6(vclmul_vv, void, ptr, ptr, ptr, ptr, =
env, i32)
>  DEF_HELPER_6(vclmul_vx, void, ptr, ptr, tl, ptr, env, i32)
>  DEF_HELPER_6(vclmulh_vv, void, ptr, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_6(vclmulh_vx, void, ptr, ptr, tl, ptr, env, i32)
> +
> +DEF_HELPER_6(vror_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vror_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vror_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vror_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
> +
> +DEF_HELPER_6(vror_vx_b, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vror_vx_h, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vror_vx_w, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vror_vx_d, void, ptr, ptr, tl, ptr, env, i32)
> +
> +DEF_HELPER_6(vrol_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vrol_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vrol_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vrol_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
> +
> +DEF_HELPER_6(vrol_vx_b, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vrol_vx_h, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vrol_vx_w, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vrol_vx_d, void, ptr, ptr, tl, ptr, env, i32)
> +
> +DEF_HELPER_5(vrev8_v_b, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vrev8_v_h, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vrev8_v_w, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vrev8_v_d, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vbrev8_v_b, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vbrev8_v_h, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vbrev8_v_w, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vbrev8_v_d, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vbrev_v_b, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vbrev_v_h, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vbrev_v_w, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vbrev_v_d, void, ptr, ptr, ptr, env, i32)
> +
> +DEF_HELPER_5(vclz_v_b, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vclz_v_h, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vclz_v_w, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vclz_v_d, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vctz_v_b, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vctz_v_h, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vctz_v_w, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vctz_v_d, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vcpop_v_b, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vcpop_v_h, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vcpop_v_w, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vcpop_v_d, void, ptr, ptr, ptr, env, i32)
> +
> +DEF_HELPER_6(vwsll_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vwsll_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vwsll_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vwsll_vx_b, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vwsll_vx_h, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vwsll_vx_w, void, ptr, ptr, tl, ptr, env, i32)
> +
> +DEF_HELPER_6(vandn_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vandn_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vandn_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vandn_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vandn_vx_b, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vandn_vx_h, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vandn_vx_w, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vandn_vx_d, void, ptr, ptr, tl, ptr, env, i32)
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index dd50d5a48c7..b982a8325bb 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -37,6 +37,7 @@
>  %imm_u    12:s20                 !function=3Dex_shift_12
>  %imm_bs   30:2                   !function=3Dex_shift_3
>  %imm_rnum 20:4
> +%imm_z6   26:1 15:5
>
>  # Argument sets:
>  &empty
> @@ -82,6 +83,7 @@
>  @r_vm    ...... vm:1 ..... ..... ... ..... ....... &rmrr %rs2 %rs1 %rd
>  @r_vm_1  ...... . ..... ..... ... ..... .......    &rmrr vm=3D1 %rs2 %rs=
1 %rd
>  @r_vm_0  ...... . ..... ..... ... ..... .......    &rmrr vm=3D0 %rs2 %rs=
1 %rd
> +@r2_zimm6  ..... . vm:1 ..... ..... ... ..... .......  &rmrr %rs2 rs1=3D=
%imm_z6 %rd
>  @r2_zimm11 . zimm:11  ..... ... ..... ....... %rs1 %rd
>  @r2_zimm10 .. zimm:10  ..... ... ..... ....... %rs1 %rd
>  @r2_s    .......   ..... ..... ... ..... ....... %rs2 %rs1
> @@ -952,3 +954,21 @@ vclmul_vv   001100 . ..... ..... 010 ..... 1010111 @=
r_vm
>  vclmul_vx   001100 . ..... ..... 110 ..... 1010111 @r_vm
>  vclmulh_vv  001101 . ..... ..... 010 ..... 1010111 @r_vm
>  vclmulh_vx  001101 . ..... ..... 110 ..... 1010111 @r_vm
> +
> +# *** Zvbb vector crypto extension ***
> +vrol_vv     010101 . ..... ..... 000 ..... 1010111 @r_vm
> +vrol_vx     010101 . ..... ..... 100 ..... 1010111 @r_vm
> +vror_vv     010100 . ..... ..... 000 ..... 1010111 @r_vm
> +vror_vx     010100 . ..... ..... 100 ..... 1010111 @r_vm
> +vror_vi     01010. . ..... ..... 011 ..... 1010111 @r2_zimm6
> +vbrev8_v    010010 . ..... 01000 010 ..... 1010111 @r2_vm
> +vrev8_v     010010 . ..... 01001 010 ..... 1010111 @r2_vm
> +vandn_vv    000001 . ..... ..... 000 ..... 1010111 @r_vm
> +vandn_vx    000001 . ..... ..... 100 ..... 1010111 @r_vm
> +vbrev_v     010010 . ..... 01010 010 ..... 1010111 @r2_vm
> +vclz_v      010010 . ..... 01100 010 ..... 1010111 @r2_vm
> +vctz_v      010010 . ..... 01101 010 ..... 1010111 @r2_vm
> +vcpop_v     010010 . ..... 01110 010 ..... 1010111 @r2_vm
> +vwsll_vv    110101 . ..... ..... 000 ..... 1010111 @r_vm
> +vwsll_vx    110101 . ..... ..... 100 ..... 1010111 @r_vm
> +vwsll_vi    110101 . ..... ..... 011 ..... 1010111 @r_vm
> diff --git a/target/riscv/insn_trans/trans_rvvk.c.inc b/target/riscv/insn=
_trans/trans_rvvk.c.inc
> index 552b08a2fd1..0e4b3376134 100644
> --- a/target/riscv/insn_trans/trans_rvvk.c.inc
> +++ b/target/riscv/insn_trans/trans_rvvk.c.inc
> @@ -60,3 +60,167 @@ static bool vclmul_vx_check(DisasContext *s, arg_rmrr=
 *a)
>
>  GEN_VX_MASKED_TRANS(vclmul_vx, vclmul_vx_check)
>  GEN_VX_MASKED_TRANS(vclmulh_vx, vclmul_vx_check)
> +
> +/*
> + * Zvbb
> + */
> +
> +#define GEN_OPIVI_GVEC_TRANS_CHECK(NAME, IMM_MODE, OPIVX, SUF, CHECK)   =
\
> +    static bool trans_##NAME(DisasContext *s, arg_rmrr *a)              =
\
> +    {                                                                   =
\
> +        if (CHECK(s, a)) {                                              =
\
> +            static gen_helper_opivx *const fns[4] =3D {                 =
  \
> +                gen_helper_##OPIVX##_b,                                 =
\
> +                gen_helper_##OPIVX##_h,                                 =
\
> +                gen_helper_##OPIVX##_w,                                 =
\
> +                gen_helper_##OPIVX##_d,                                 =
\
> +            };                                                          =
\
> +            return do_opivi_gvec(s, a, tcg_gen_gvec_##SUF, fns[s->sew], =
\
> +                                 IMM_MODE);                             =
\
> +        }                                                               =
\
> +        return false;                                                   =
\
> +    }
> +
> +#define GEN_OPIVV_GVEC_TRANS_CHECK(NAME, SUF, CHECK)                    =
 \
> +    static bool trans_##NAME(DisasContext *s, arg_rmrr *a)              =
 \
> +    {                                                                   =
 \
> +        if (CHECK(s, a)) {                                              =
 \
> +            static gen_helper_gvec_4_ptr *const fns[4] =3D {            =
   \
> +                gen_helper_##NAME##_b,                                  =
 \
> +                gen_helper_##NAME##_h,                                  =
 \
> +                gen_helper_##NAME##_w,                                  =
 \
> +                gen_helper_##NAME##_d,                                  =
 \
> +            };                                                          =
 \
> +            return do_opivv_gvec(s, a, tcg_gen_gvec_##SUF, fns[s->sew]);=
 \
> +        }                                                               =
 \
> +        return false;                                                   =
 \
> +    }
> +
> +#define GEN_OPIVX_GVEC_SHIFT_TRANS_CHECK(NAME, SUF, CHECK)       \
> +    static bool trans_##NAME(DisasContext *s, arg_rmrr *a)       \
> +    {                                                            \
> +        if (CHECK(s, a)) {                                       \
> +            static gen_helper_opivx *const fns[4] =3D {            \
> +                gen_helper_##NAME##_b,                           \
> +                gen_helper_##NAME##_h,                           \
> +                gen_helper_##NAME##_w,                           \
> +                gen_helper_##NAME##_d,                           \
> +            };                                                   \
> +            return do_opivx_gvec_shift(s, a, tcg_gen_gvec_##SUF, \
> +                                       fns[s->sew]);             \
> +        }                                                        \
> +        return false;                                            \
> +    }
> +
> +static bool zvbb_vv_check(DisasContext *s, arg_rmrr *a)
> +{
> +    return opivv_check(s, a) && s->cfg_ptr->ext_zvbb =3D=3D true;
> +}
> +
> +static bool zvbb_vx_check(DisasContext *s, arg_rmrr *a)
> +{
> +    return opivx_check(s, a) && s->cfg_ptr->ext_zvbb =3D=3D true;
> +}
> +
> +/* vrol.v[vx] */
> +GEN_OPIVV_GVEC_TRANS_CHECK(vrol_vv, rotlv, zvbb_vv_check)
> +GEN_OPIVX_GVEC_SHIFT_TRANS_CHECK(vrol_vx, rotls, zvbb_vx_check)
> +
> +/* vror.v[vxi] */
> +GEN_OPIVV_GVEC_TRANS_CHECK(vror_vv, rotrv, zvbb_vv_check)
> +GEN_OPIVX_GVEC_SHIFT_TRANS_CHECK(vror_vx, rotrs, zvbb_vx_check)
> +GEN_OPIVI_GVEC_TRANS_CHECK(vror_vi, IMM_TRUNC_SEW, vror_vx, rotri, zvbb_=
vx_check)
> +
> +#define GEN_OPIVX_GVEC_TRANS_CHECK(NAME, SUF, CHECK)                    =
 \
> +    static bool trans_##NAME(DisasContext *s, arg_rmrr *a)              =
 \
> +    {                                                                   =
 \
> +        if (CHECK(s, a)) {                                              =
 \
> +            static gen_helper_opivx *const fns[4] =3D {                 =
   \
> +                gen_helper_##NAME##_b,                                  =
 \
> +                gen_helper_##NAME##_h,                                  =
 \
> +                gen_helper_##NAME##_w,                                  =
 \
> +                gen_helper_##NAME##_d,                                  =
 \
> +            };                                                          =
 \
> +            return do_opivx_gvec(s, a, tcg_gen_gvec_##SUF, fns[s->sew]);=
 \
> +        }                                                               =
 \
> +        return false;                                                   =
 \
> +    }
> +
> +/* vandn.v[vx] */
> +GEN_OPIVV_GVEC_TRANS_CHECK(vandn_vv, andc, zvbb_vv_check)
> +GEN_OPIVX_GVEC_TRANS_CHECK(vandn_vx, andcs, zvbb_vx_check)
> +
> +#define GEN_OPIV_TRANS(NAME, CHECK)                                     =
   \
> +    static bool trans_##NAME(DisasContext *s, arg_rmr *a)               =
   \
> +    {                                                                   =
   \
> +        if (CHECK(s, a)) {                                              =
   \
> +            uint32_t data =3D 0;                                        =
     \
> +            static gen_helper_gvec_3_ptr *const fns[4] =3D {            =
     \
> +                gen_helper_##NAME##_b,                                  =
   \
> +                gen_helper_##NAME##_h,                                  =
   \
> +                gen_helper_##NAME##_w,                                  =
   \
> +                gen_helper_##NAME##_d,                                  =
   \
> +            };                                                          =
   \
> +            TCGLabel *over =3D gen_new_label();                         =
     \
> +            tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);  =
   \
> +                                                                        =
   \
> +            data =3D FIELD_DP32(data, VDATA, VM, a->vm);                =
     \
> +            data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);            =
     \
> +            data =3D FIELD_DP32(data, VDATA, VTA, s->vta);              =
     \
> +            data =3D FIELD_DP32(data, VDATA, VTA_ALL_1S, s->cfg_vta_all_=
1s); \
> +            data =3D FIELD_DP32(data, VDATA, VMA, s->vma);              =
     \
> +            tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),      =
   \
> +                               vreg_ofs(s, a->rs2), cpu_env,            =
   \
> +                               s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / =
8, \
> +                               data, fns[s->sew]);                      =
   \
> +            mark_vs_dirty(s);                                           =
   \
> +            gen_set_label(over);                                        =
   \
> +            return true;                                                =
   \
> +        }                                                               =
   \
> +        return false;                                                   =
   \
> +    }
> +
> +static bool zvbb_opiv_check(DisasContext *s, arg_rmr *a)
> +{
> +    return s->cfg_ptr->ext_zvbb =3D=3D true &&
> +           require_rvv(s) &&
> +           vext_check_isa_ill(s) &&
> +           vext_check_ss(s, a->rd, a->rs2, a->vm);
> +}
> +
> +GEN_OPIV_TRANS(vbrev8_v, zvbb_opiv_check)
> +GEN_OPIV_TRANS(vrev8_v, zvbb_opiv_check)
> +GEN_OPIV_TRANS(vbrev_v, zvbb_opiv_check)
> +GEN_OPIV_TRANS(vclz_v, zvbb_opiv_check)
> +GEN_OPIV_TRANS(vctz_v, zvbb_opiv_check)
> +GEN_OPIV_TRANS(vcpop_v, zvbb_opiv_check)
> +
> +static bool vwsll_vv_check(DisasContext *s, arg_rmrr *a)
> +{
> +    return s->cfg_ptr->ext_zvbb && opivv_widen_check(s, a);
> +}
> +
> +static bool vwsll_vx_check(DisasContext *s, arg_rmrr *a)
> +{
> +    return s->cfg_ptr->ext_zvbb && opivx_widen_check(s, a);
> +}
> +
> +/* OPIVI without GVEC IR */
> +#define GEN_OPIVI_WIDEN_TRANS(NAME, IMM_MODE, OPIVX, CHECK)             =
     \
> +    static bool trans_##NAME(DisasContext *s, arg_rmrr *a)              =
     \
> +    {                                                                   =
     \
> +        if (CHECK(s, a)) {                                              =
     \
> +            static gen_helper_opivx *const fns[3] =3D {                 =
       \
> +                gen_helper_##OPIVX##_b,                                 =
     \
> +                gen_helper_##OPIVX##_h,                                 =
     \
> +                gen_helper_##OPIVX##_w,                                 =
     \
> +            };                                                          =
     \
> +            return opivi_trans(a->rd, a->rs1, a->rs2, a->vm, fns[s->sew]=
, s, \
> +                               IMM_MODE);                               =
     \
> +        }                                                               =
     \
> +        return false;                                                   =
     \
> +    }
> +
> +GEN_OPIVV_WIDEN_TRANS(vwsll_vv, vwsll_vv_check)
> +GEN_OPIVX_WIDEN_TRANS(vwsll_vx, vwsll_vx_check)
> +GEN_OPIVI_WIDEN_TRANS(vwsll_vi, IMM_ZX, vwsll_vx, vwsll_vx_check)
> diff --git a/target/riscv/vcrypto_helper.c b/target/riscv/vcrypto_helper.=
c
> index 8b7c63d4997..11239b59d6f 100644
> --- a/target/riscv/vcrypto_helper.c
> +++ b/target/riscv/vcrypto_helper.c
> @@ -20,6 +20,7 @@
>  #include "qemu/osdep.h"
>  #include "qemu/host-utils.h"
>  #include "qemu/bitops.h"
> +#include "qemu/bswap.h"
>  #include "cpu.h"
>  #include "exec/memop.h"
>  #include "exec/exec-all.h"
> @@ -57,3 +58,140 @@ RVVCALL(OPIVV2, vclmulh_vv, OP_UUU_D, H8, H8, H8, clm=
ulh64)
>  GEN_VEXT_VV(vclmulh_vv, 8)
>  RVVCALL(OPIVX2, vclmulh_vx, OP_UUU_D, H8, H8, clmulh64)
>  GEN_VEXT_VX(vclmulh_vx, 8)
> +
> +RVVCALL(OPIVV2, vror_vv_b, OP_UUU_B, H1, H1, H1, ror8)
> +RVVCALL(OPIVV2, vror_vv_h, OP_UUU_H, H2, H2, H2, ror16)
> +RVVCALL(OPIVV2, vror_vv_w, OP_UUU_W, H4, H4, H4, ror32)
> +RVVCALL(OPIVV2, vror_vv_d, OP_UUU_D, H8, H8, H8, ror64)
> +GEN_VEXT_VV(vror_vv_b, 1)
> +GEN_VEXT_VV(vror_vv_h, 2)
> +GEN_VEXT_VV(vror_vv_w, 4)
> +GEN_VEXT_VV(vror_vv_d, 8)
> +
> +RVVCALL(OPIVX2, vror_vx_b, OP_UUU_B, H1, H1, ror8)
> +RVVCALL(OPIVX2, vror_vx_h, OP_UUU_H, H2, H2, ror16)
> +RVVCALL(OPIVX2, vror_vx_w, OP_UUU_W, H4, H4, ror32)
> +RVVCALL(OPIVX2, vror_vx_d, OP_UUU_D, H8, H8, ror64)
> +GEN_VEXT_VX(vror_vx_b, 1)
> +GEN_VEXT_VX(vror_vx_h, 2)
> +GEN_VEXT_VX(vror_vx_w, 4)
> +GEN_VEXT_VX(vror_vx_d, 8)
> +
> +RVVCALL(OPIVV2, vrol_vv_b, OP_UUU_B, H1, H1, H1, rol8)
> +RVVCALL(OPIVV2, vrol_vv_h, OP_UUU_H, H2, H2, H2, rol16)
> +RVVCALL(OPIVV2, vrol_vv_w, OP_UUU_W, H4, H4, H4, rol32)
> +RVVCALL(OPIVV2, vrol_vv_d, OP_UUU_D, H8, H8, H8, rol64)
> +GEN_VEXT_VV(vrol_vv_b, 1)
> +GEN_VEXT_VV(vrol_vv_h, 2)
> +GEN_VEXT_VV(vrol_vv_w, 4)
> +GEN_VEXT_VV(vrol_vv_d, 8)
> +
> +RVVCALL(OPIVX2, vrol_vx_b, OP_UUU_B, H1, H1, rol8)
> +RVVCALL(OPIVX2, vrol_vx_h, OP_UUU_H, H2, H2, rol16)
> +RVVCALL(OPIVX2, vrol_vx_w, OP_UUU_W, H4, H4, rol32)
> +RVVCALL(OPIVX2, vrol_vx_d, OP_UUU_D, H8, H8, rol64)
> +GEN_VEXT_VX(vrol_vx_b, 1)
> +GEN_VEXT_VX(vrol_vx_h, 2)
> +GEN_VEXT_VX(vrol_vx_w, 4)
> +GEN_VEXT_VX(vrol_vx_d, 8)
> +
> +static uint64_t brev8(uint64_t val)
> +{
> +    val =3D ((val & 0x5555555555555555ull) << 1) |
> +          ((val & 0xAAAAAAAAAAAAAAAAull) >> 1);
> +    val =3D ((val & 0x3333333333333333ull) << 2) |
> +          ((val & 0xCCCCCCCCCCCCCCCCull) >> 2);
> +    val =3D ((val & 0x0F0F0F0F0F0F0F0Full) << 4) |
> +          ((val & 0xF0F0F0F0F0F0F0F0ull) >> 4);
> +
> +    return val;
> +}
> +
> +RVVCALL(OPIVV1, vbrev8_v_b, OP_UU_B, H1, H1, brev8)
> +RVVCALL(OPIVV1, vbrev8_v_h, OP_UU_H, H2, H2, brev8)
> +RVVCALL(OPIVV1, vbrev8_v_w, OP_UU_W, H4, H4, brev8)
> +RVVCALL(OPIVV1, vbrev8_v_d, OP_UU_D, H8, H8, brev8)
> +GEN_VEXT_V(vbrev8_v_b, 1)
> +GEN_VEXT_V(vbrev8_v_h, 2)
> +GEN_VEXT_V(vbrev8_v_w, 4)
> +GEN_VEXT_V(vbrev8_v_d, 8)
> +
> +#define DO_IDENTITY(a) (a)
> +RVVCALL(OPIVV1, vrev8_v_b, OP_UU_B, H1, H1, DO_IDENTITY)
> +RVVCALL(OPIVV1, vrev8_v_h, OP_UU_H, H2, H2, bswap16)
> +RVVCALL(OPIVV1, vrev8_v_w, OP_UU_W, H4, H4, bswap32)
> +RVVCALL(OPIVV1, vrev8_v_d, OP_UU_D, H8, H8, bswap64)
> +GEN_VEXT_V(vrev8_v_b, 1)
> +GEN_VEXT_V(vrev8_v_h, 2)
> +GEN_VEXT_V(vrev8_v_w, 4)
> +GEN_VEXT_V(vrev8_v_d, 8)
> +
> +#define DO_ANDN(a, b) ((a) & ~(b))
> +RVVCALL(OPIVV2, vandn_vv_b, OP_UUU_B, H1, H1, H1, DO_ANDN)
> +RVVCALL(OPIVV2, vandn_vv_h, OP_UUU_H, H2, H2, H2, DO_ANDN)
> +RVVCALL(OPIVV2, vandn_vv_w, OP_UUU_W, H4, H4, H4, DO_ANDN)
> +RVVCALL(OPIVV2, vandn_vv_d, OP_UUU_D, H8, H8, H8, DO_ANDN)
> +GEN_VEXT_VV(vandn_vv_b, 1)
> +GEN_VEXT_VV(vandn_vv_h, 2)
> +GEN_VEXT_VV(vandn_vv_w, 4)
> +GEN_VEXT_VV(vandn_vv_d, 8)
> +
> +RVVCALL(OPIVX2, vandn_vx_b, OP_UUU_B, H1, H1, DO_ANDN)
> +RVVCALL(OPIVX2, vandn_vx_h, OP_UUU_H, H2, H2, DO_ANDN)
> +RVVCALL(OPIVX2, vandn_vx_w, OP_UUU_W, H4, H4, DO_ANDN)
> +RVVCALL(OPIVX2, vandn_vx_d, OP_UUU_D, H8, H8, DO_ANDN)
> +GEN_VEXT_VX(vandn_vx_b, 1)
> +GEN_VEXT_VX(vandn_vx_h, 2)
> +GEN_VEXT_VX(vandn_vx_w, 4)
> +GEN_VEXT_VX(vandn_vx_d, 8)
> +
> +RVVCALL(OPIVV1, vbrev_v_b, OP_UU_B, H1, H1, revbit8)
> +RVVCALL(OPIVV1, vbrev_v_h, OP_UU_H, H2, H2, revbit16)
> +RVVCALL(OPIVV1, vbrev_v_w, OP_UU_W, H4, H4, revbit32)
> +RVVCALL(OPIVV1, vbrev_v_d, OP_UU_D, H8, H8, revbit64)
> +GEN_VEXT_V(vbrev_v_b, 1)
> +GEN_VEXT_V(vbrev_v_h, 2)
> +GEN_VEXT_V(vbrev_v_w, 4)
> +GEN_VEXT_V(vbrev_v_d, 8)
> +
> +RVVCALL(OPIVV1, vclz_v_b, OP_UU_B, H1, H1, clz8)
> +RVVCALL(OPIVV1, vclz_v_h, OP_UU_H, H2, H2, clz16)
> +RVVCALL(OPIVV1, vclz_v_w, OP_UU_W, H4, H4, clz32)
> +RVVCALL(OPIVV1, vclz_v_d, OP_UU_D, H8, H8, clz64)
> +GEN_VEXT_V(vclz_v_b, 1)
> +GEN_VEXT_V(vclz_v_h, 2)
> +GEN_VEXT_V(vclz_v_w, 4)
> +GEN_VEXT_V(vclz_v_d, 8)
> +
> +RVVCALL(OPIVV1, vctz_v_b, OP_UU_B, H1, H1, ctz8)
> +RVVCALL(OPIVV1, vctz_v_h, OP_UU_H, H2, H2, ctz16)
> +RVVCALL(OPIVV1, vctz_v_w, OP_UU_W, H4, H4, ctz32)
> +RVVCALL(OPIVV1, vctz_v_d, OP_UU_D, H8, H8, ctz64)
> +GEN_VEXT_V(vctz_v_b, 1)
> +GEN_VEXT_V(vctz_v_h, 2)
> +GEN_VEXT_V(vctz_v_w, 4)
> +GEN_VEXT_V(vctz_v_d, 8)
> +
> +RVVCALL(OPIVV1, vcpop_v_b, OP_UU_B, H1, H1, ctpop8)
> +RVVCALL(OPIVV1, vcpop_v_h, OP_UU_H, H2, H2, ctpop16)
> +RVVCALL(OPIVV1, vcpop_v_w, OP_UU_W, H4, H4, ctpop32)
> +RVVCALL(OPIVV1, vcpop_v_d, OP_UU_D, H8, H8, ctpop64)
> +GEN_VEXT_V(vcpop_v_b, 1)
> +GEN_VEXT_V(vcpop_v_h, 2)
> +GEN_VEXT_V(vcpop_v_w, 4)
> +GEN_VEXT_V(vcpop_v_d, 8)
> +
> +#define DO_SLL(N, M) (N << (M & (sizeof(N) * 8 - 1)))
> +RVVCALL(OPIVV2, vwsll_vv_b, WOP_UUU_B, H2, H1, H1, DO_SLL)
> +RVVCALL(OPIVV2, vwsll_vv_h, WOP_UUU_H, H4, H2, H2, DO_SLL)
> +RVVCALL(OPIVV2, vwsll_vv_w, WOP_UUU_W, H8, H4, H4, DO_SLL)
> +GEN_VEXT_VV(vwsll_vv_b, 2)
> +GEN_VEXT_VV(vwsll_vv_h, 4)
> +GEN_VEXT_VV(vwsll_vv_w, 8)
> +
> +RVVCALL(OPIVX2, vwsll_vx_b, WOP_UUU_B, H2, H1, DO_SLL)
> +RVVCALL(OPIVX2, vwsll_vx_h, WOP_UUU_H, H4, H2, DO_SLL)
> +RVVCALL(OPIVX2, vwsll_vx_w, WOP_UUU_W, H8, H4, DO_SLL)
> +GEN_VEXT_VX(vwsll_vx_b, 2)
> +GEN_VEXT_VX(vwsll_vx_h, 4)
> +GEN_VEXT_VX(vwsll_vx_w, 8)
> --
> 2.34.1
>

