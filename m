Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D298FCA5FFF
	for <qemu-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 09:07:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xENbr-0001Lv-2d; Wed, 07 Oct 2026 05:06:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xEM2d-0001ke-S4
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2026 03:26:40 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xEM2Z-0008MW-C5
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2026 03:26:19 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-6af8620a7d2so2282106a12.0
 for <qemu-riscv@nongnu.org>; Wed, 07 Oct 2026 00:26:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791357971; cv=none;
 d=google.com; s=arc-20260327;
 b=stGpDx5PLMDfSKXhcMf1xudXL7quyOnHjb5zFW+zlGaAaBt0g9L4CANNC4rFfphLR9
 sSlJjZt3JgCFkCpRPFuvZr2Zhu3JnNA6ZbZYgMN2CQv45LKn7AJpZH8I7jUJ+YJ3Tfco
 r29fRbFPIuDQmNMifDAhJIN+SYUHmNEoCGfATug19mqxNyBljHryBzVbhsXtEM6nzVay
 Nzhi8A2o26V3YTYLIWs5wqpxoIgEj8/JGglKd28RkKKHxxFmqi6DsBPXS1p+btUihhPw
 qgtZCMLahfVKjvCyvsX0Wxc2rJoT4PomizlH2HhPJ3udbl9a1KI4DXbDcv4aZtw4hWGc
 roPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=IYJ4GEz8V0Itcmv+R83YQloRwoIsKUUFi4LazpxdnMw=;
 fh=lZ5hDQNJRpXKlwu1QVQKIM+xUIairs8+hjgOM42x/cA=;
 b=eCaSqILYhbovMpR5r+SOeXBvHJ7keXTBxMlQFUvV9D+vCcseoy+Rl7b9smoaVuTvOk
 k8wRoAq6DqfSHP//aOq8jFjVAsoX+9NO8QfMMMjJc88F4YZ4kbLyAh7RCUDPO+7Lz/Px
 E+PPJJ8586D4Dv7twNnjPLEW3k9Asq3OJosyrG3uBWF8d91mUcu8fx8gclhH+1lXPRE5
 TXx/UZtxA1AtPXSi7WGlWDg5TybFPX587frw7MEVbEY8pdPrLZ7NHpNJ0BwSjXCktzjb
 U4qHdh4c9s5otFqCbWXSTgFvGZrT/MahOMkd96v0sqxCLrH7z1w9cSae2IDJnGaYk7PU
 gXPw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791357971; x=1791962771; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=IYJ4GEz8V0Itcmv+R83YQloRwoIsKUUFi4LazpxdnMw=;
 b=ianK6LOcbpECbEbSkThnK2DJ2oa4OFVT53N05U8YY0UyxF3ZXeTxEvG+QiSnYWa3H8
 ao8UW0p8T0IuTMgIe4SPqOZF2mVsHOROqB6ypz6ciWbNeKIzfcaHQlsEO7HzbgSxacBX
 tPyB109Ae5V6Y6WDpFXJXwMOu3UDh+Y+SK8hMOFGAC1IOowDXkngGkQPHPcBN4WFqRNx
 vr/fWd9RsKXiXYC/VJDoJr4cWgRhv4q/61YCDUXp2W1+defR1/Vqmskxn4hyUzFN9gK8
 MYMKWkXXSCAThVClmsvIjccmJcK/hwRLpRDRx0X3O2vmPcp/zOzdX37tmyQQ9G0Wzz2p
 GLMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791357971; x=1791962771;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=IYJ4GEz8V0Itcmv+R83YQloRwoIsKUUFi4LazpxdnMw=;
 b=bzugohIIcVpzHgh03Stc76DGNOpEwemoAB7TjfNbmOzFGGUOwcWYizqLhd5uuom/1d
 aM4J3ZntCjSmzQLIs4v09cSNSpQt6LWvo06WWx13MG8MXeZfg2HmuRnAsuXE4ppZzbgr
 /1pl8N3PhOu/niTV+Pr1w81GtUU1crtmXCCJcJHhUtpp9+gjiMNdyKWvecYb52JFNW49
 SxvKWTmc6TMoL889pUYXVenD64KqQRFxwUTZi1kxMZiqvSLAXa4zGhedvjhmSig3Fq8x
 0vIxQDUgq6QqJFiCVqSy94r/J0KiI2R1nmc1y5G7GstaJ5ZC4h8hTa/a9LEri5RbXpVM
 hXDg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxhAStLvLNuR7bUABqcYcV9x7m7cuAQXCHvF7jfLy+AKB0YtiRzPj7uavvBEi6DwANtgJfazJbBsrZK@nongnu.org
X-Gm-Message-State: AFq9FYJAenuACxcp3/condNVFkxnufMchwwt6yfaYkPJiktUHFNJcudN
 NOc2geMHJPEZRpzGnS7wPVC1Mfumbr0BsGmWIHnt8ik9EBb4RJYNslc6yZQDbuY9prQY496SUQE
 /TI55ZfBSqnXu1ePnwlO9hWSsvatfB1E=
X-Gm-Gg: AYBFou1lHw1kXVSWrdd1KUo1rbe5fBInIzMYkQCJCbi0SoRgKez96Oaw5sRFSS3NJTz
 m7fGM8WX5g9Qsxr3P1HyhpyRDDnlfms+Xqq2HLMAI4BBc3cvL+Snthwp2asHy5jB97WNLtX5jL3
 wg6UmIsr8udcSSUxTptaNSSdjrvxZxGU4ZeBZoQho8tTCIX2Jb2hmUpkTgk1cyiG+Yom6r0oX1f
 kSz+Foqltk43h52P0dxFeCfIh5IIBmZOvbiM19b/PkHPM+qqJ8Ng+zrB37bC2ZRXnoggDdA8VCm
 jv5hvYvyVF8w8re8g0NQ6BwjQy5GS6FL0LJSp2Gta9xJVwBGsg9a13vK4k/HVp8CtA==
X-Received: by 2002:a05:6402:a0d2:b0:6ae:1504:5ba with SMTP id
 4fb4d7f45d1cf-6aff47a0e11mr957925a12.30.1791357971342; Wed, 07 Oct 2026
 00:26:11 -0700 (PDT)
MIME-Version: 1.0
References: <20261001-rv-dedup-v1-0-ea69b07afd31@rev.ng>
 <20261001-rv-dedup-v1-7-ea69b07afd31@rev.ng>
 <CAE2XoE_ag1RR_JFwgcg+9zPed+qpO2skf7W1_kiqvwB=Vf9aAQ@mail.gmail.com>
 <f8f27bc3-83ce-4ccf-ae38-a43188b2ebc5@oss.qualcomm.com>
 <ar_AzEWpF9XDGNdg@hive.localdomain>
 <CAE2XoE_vsVDXH2qggECnqHC8dMpo7zyTTg9w64uvjnPeXE9y6A@mail.gmail.com>
 <asUMlHlLI7j5MTUf@hive.localdomain>
In-Reply-To: <asUMlHlLI7j5MTUf@hive.localdomain>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Wed, 7 Oct 2026 15:25:58 +0800
X-Gm-Features: AclHuK_thFqASHhBOvSen0wo0Vp3n6bY-7YzlPzrdQmxY0HHxzfAPrmlZ2w80LQ
Message-ID: <CAE2XoE9G1tOrWXcpf240woCF-==a4YcxTZ4pS9o5WxtPExWFjw@mail.gmail.com>
Subject: Re: [PATCH 07/18] target/riscv: Runtime register MAX and BARE CPUs
To: Anton Johansson <anjo@rev.ng>
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, daniel.barboza@oss.qualcomm.com, 
 philmd@oss.qualcomm.com, palmer@dabbelt.com, alistair.francis@wdc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=luoyonggang@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Reply-To: luoyonggang@gmail.com
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Wed, Oct 7, 2026 at 7:09=E2=80=AFAM Anton Johansson <anjo@rev.ng> wrote:
>
> On 02/10/26, Yonggang Luo wrote:
> > target/riscv: resolve target-dependent CPU definition fields
> >
> > The class-base initializer later reads def->misa_mxl_max and passes
> > def->cfg to riscv_cpu_cfg_merge(), which merges max_satp_mode. Resolve
> > both chooser results in a mutable copy so those steps use the selected
> > values without modifying the const TypeInfo class data.
> >
> >
> > defer riscv_cpu_validate_misa_mxl is not enough, mainly
> > def->misa_mxl_max is accessed in
> > riscv_cpu_class_base_init, for exactly match previous behavior, add
> > two callback for each value
>
> Right, we would have to move more stuff to instance init which isn't the
> best idea.  Personally I'm still not keen on adding more callbacks to
> initialize two fields for two cpus, surely this is solvable with the
> current machinery.  I'll submit a v2 and try defining two tables for
> MAX/BARE instead, similar to ARM.


Make sense, thanks

>
> >
> > On Fri, Oct 2, 2026 at 11:36=E2=80=AFPM Anton Johansson <anjo@rev.ng> w=
rote:
> > >
> > > On 02/10/26, Pierrick Bouvier wrote:
> > > > On 10/1/2026 9:28 AM, Yonggang Luo wrote:
> > > > > On Thu, Oct 1, 2026 at 11:55=E2=80=AFPM Anton Johansson via qemu =
development
> > > > > <qemu-devel@nongnu.org> wrote:
> > > > >>
> > > > >> Moves initialization of satp and mxl fields to a class initializ=
ation
> > > > >> function that checks target_riscv64().
> > > > >>
> > > > >> Note: I'm aware the current iteration of this patch is rather ha=
cky, I
> > > > >> don't like the introduction of runtime_misa_mxl_max, but I'm kee=
ping
> > > > >> this in to get the series out there and collect feedback.
> > > > >>
> > > > >> Signed-off-by: Anton Johansson <anjo@rev.ng>
> > > > >> ---
> > > > >>  target/riscv/cpu.h |  1 +
> > > > >>  target/riscv/cpu.c | 90 +++++++++++++++++++++++++++++++++++----=
---------------
> > > > >>  2 files changed, 59 insertions(+), 32 deletions(-)
> > > > >>
> > > > >
> > > > > This patch is how I handle these, just for reference, not a revie=
w.
> > > >
> > > > Yonggang approach looks cleaner, I would favor this one.
> > >
> > > I'm personally not a huge fan, it still feels rather hacky. Why add a
> > > completely new RISCVCPUDef::target_init just to make sure fields are
> > > initialized before riscv_cpu_validate_misa_mxl()? Wouldn't moving the
> > > check to a later point, maybe .instance_init, be better? Then for
> > > riscv_cpu_init() we get
> > >
> > >   riscv_cpu_validate_misa_mxl(mcc);
> > >   env->misa_mxl =3D mcc->def->misa_mxl_max;
> > >
> > > misa_mxl_max would be verified only during instance rather than
> > > class initialization, which seems like a decent tradeoff for a simple=
r
> > > solution.
> > >
> > > --
> > > Anton Johansson
> > > rev.ng Labs Srl.
> >
> >
> >
> > --
> >          =E6=AD=A4=E8=87=B4
> > =E7=A4=BC
> > =E7=BD=97=E5=8B=87=E5=88=9A
> > Yours
> >     sincerely,
> > Yonggang Luo
>
> > From 31138892fe5cf878da9818cf93535ce10b125cb0 Mon Sep 17 00:00:00 2001
> > From: Yonggang Luo <luoyonggang@gmail.com>
> > Date: Sat, 3 Oct 2026 01:54:52 +0800
> > Subject: [PATCH] target/riscv: resolve target-dependent CPU definition =
fields
> >
> > The class-base initializer later reads def->misa_mxl_max and passes
> > def->cfg to riscv_cpu_cfg_merge(), which merges max_satp_mode. Resolve
> > both chooser results in a mutable copy so those steps use the selected
> > values without modifying the const TypeInfo class data.
> >
> > Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> > ---
> >  target/riscv/cpu.c | 40 +++++++++++++++++++++++++++-------------
> >  target/riscv/cpu.h |  2 ++
> >  2 files changed, 29 insertions(+), 13 deletions(-)
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index c6f1739075..754f158250 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -3092,6 +3092,8 @@ static void riscv_cpu_class_base_init(ObjectClass=
 *c, const void *data)
> >
> >      if (pcc->def) {
> >          mcc->def =3D g_memdup2(pcc->def, sizeof(*pcc->def));
> > +        mcc->def->max_satp_mode_choose =3D NULL;
> > +        mcc->def->misa_mxl_max_choose =3D NULL;
> >      } else {
> >          mcc->def =3D g_new0(RISCVCPUDef, 1);
> >      }
> > @@ -3108,7 +3110,16 @@ static void riscv_cpu_class_base_init(ObjectClas=
s *c, const void *data)
> >  #endif
> >
> >      if (data) {
> > -        const RISCVCPUDef *def =3D data;
> > +        RISCVCPUDef def_data =3D *(const RISCVCPUDef *)data;
> > +        RISCVCPUDef *def =3D &def_data;
> > +
> > +        if (def->max_satp_mode_choose) {
> > +            def->cfg.max_satp_mode =3D def->max_satp_mode_choose(def);
> > +        }
> > +        if (def->misa_mxl_max_choose) {
> > +            def->misa_mxl_max =3D def->misa_mxl_max_choose(def);
> > +        }
> > +
> >          mcc->def->bare |=3D def->bare;
> >          if (def->profile) {
> >              assert(profile_extends(def->profile, mcc->def->profile));
> > @@ -3299,6 +3310,18 @@ static void riscv_cpu_instance_finalize(Object *=
obj)
> >      g_clear_pointer(&cpu->multi_ext_user_opts, g_hash_table_destroy);
> >  }
> >
> > +static int8_t riscv_cpu_max_satp_mode_choose(const RISCVCPUDef *def)
> > +{
> > +    (void)def;
> > +    return target_riscv32() ? VM_1_10_SV32 : VM_1_10_SV57;
> > +}
> > +
> > +static RISCVMXL riscv_cpu_misa_mxl_max_choose(const RISCVCPUDef *def)
> > +{
> > +    (void)def;
> > +    return target_riscv32() ? MXL_RV32 : MXL_RV64;
> > +}
> > +
> >  static const TypeInfo riscv_cpu_type_infos[] =3D {
> >      {
> >          .name =3D TYPE_RISCV_CPU,
> > @@ -3339,21 +3362,12 @@ static const TypeInfo riscv_cpu_type_infos[] =
=3D {
> >           * only MBARE will be available if the user doesn't enable
> >           * a mode manually (see riscv_cpu_satp_mode_finalize()).
> >           */
> > -#ifdef TARGET_RISCV32
> > -        .cfg.max_satp_mode =3D VM_1_10_SV32,
> > -#else
> > -        .cfg.max_satp_mode =3D VM_1_10_SV57,
> > -#endif
> > +        .max_satp_mode_choose =3D riscv_cpu_max_satp_mode_choose,
> >      ),
> >
> >      DEFINE_RISCV_CPU(TYPE_RISCV_CPU_MAX, TYPE_RISCV_DYNAMIC_CPU,
> > -#if defined(TARGET_RISCV32)
> > -        .misa_mxl_max =3D MXL_RV32,
> > -        .cfg.max_satp_mode =3D VM_1_10_SV32,
> > -#elif defined(TARGET_RISCV64)
> > -        .misa_mxl_max =3D MXL_RV64,
> > -        .cfg.max_satp_mode =3D VM_1_10_SV57,
> > -#endif
> > +        .max_satp_mode_choose =3D riscv_cpu_max_satp_mode_choose,
> > +        .misa_mxl_max_choose =3D riscv_cpu_misa_mxl_max_choose,
> >      ),
> >
> >      DEFINE_ABSTRACT_RISCV_CPU(TYPE_RISCV_CPU_SIFIVE_E, TYPE_RISCV_VEND=
OR_CPU,
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index 034d7e96c4..b6b5f679c9 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -597,6 +597,8 @@ typedef struct RISCVCPUDef {
> >  #endif
> >      /* This is just a setter for env->num_triggers.  */
> >      uint32_t num_triggers;
> > +    int8_t (*max_satp_mode_choose)(const struct RISCVCPUDef *def);
> > +    RISCVMXL (*misa_mxl_max_choose)(const struct RISCVCPUDef *def);
> >  } RISCVCPUDef;
> >
> >  /**
> > --
> > 2.55.0.windows.3
> >



--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

