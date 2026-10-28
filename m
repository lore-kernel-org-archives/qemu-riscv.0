Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE86606A31A
	for <qemu-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 19:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nizUNiVo
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xM9Ay-0006Qy-S7; Wed, 28 Oct 2026 15:19:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xM9Av-0006Q9-V3
 for qemu-riscv@nongnu.org; Wed, 28 Oct 2026 15:19:05 -0400
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xM9Au-0005KX-7H
 for qemu-riscv@nongnu.org; Wed, 28 Oct 2026 15:19:05 -0400
Received: by mail-yx1-xb132.google.com with SMTP id
 956f58d0204a3-679e86015e2so1281d50.1
 for <qemu-riscv@nongnu.org>; Wed, 28 Oct 2026 12:19:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793215143; cv=none;
 d=google.com; s=arc-20260327;
 b=FubnGuzrvr9RewJNs6sjPU8ix4OKhvl6QbIi5syZC6AQ+unVJ9VKWozZFlfUt628oi
 d0Cxoai4Wa8ZMyqktZpwd8pAdXTex0LNpPde1Z42lv9tSOCwyWfblJKmcJqYVkgrU+ug
 wGj8Yy6CFI0J4IMQUjJhm/eK9yGpm9+4jYKq7ZiVaC5Pqe/xOpzcgc3NHJabelbgPvSQ
 Tyas4TDqNMYJ2PtnqUhMRK1GTXVOabhDwdNMTC0iUYalW2JhEHL805YlmQ2lxh91UEiM
 IxJ67CgmcM0clTnfdMTw33ERruWIT4pwdbhfSof4Wm+btfP8mqxFL+43x+U1/NX5HPKo
 pyxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=aTS+A681mIrnnETlSdM14Ivbll15fjA3/zVwCINUMmk=;
 fh=XaEqHlQQsgKkQ5I6aHWYufRHMjHDj3Sw6ObTthcQccU=;
 b=SPJuTrme7IrAQzBaQnzYM45OeId8jvm7wnmm3nS0lgHyXHzr+hXuyyS2Bd/Hj3GlQM
 BoDlchCorhmEfrBv/MFxa+z8E2I2plOS/pHBVNVs+1CDv209QlBLaP23jczdFjVbTuom
 toeBETkQRfnVwUOvB4BOwBiq+utk2aI7EpsHu1b4UroEnzCRAI/NPH5y1lOP2R0+05j2
 Lx6mb5qZd3qRqT3kWvPyU0fxEp5lKwhDAMJvK82gPeoJjcjLc1lwa3C8hA6BHTPlbvr/
 G0KFJdznB88gDlD50xaWauxd2qXvq7lOeP3gwwj7fFrdAfWzOjqbGw5R3hHPCPaswmBl
 Oztg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793215143; x=1793819943; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=aTS+A681mIrnnETlSdM14Ivbll15fjA3/zVwCINUMmk=;
 b=nizUNiVo/yPrRUurVl5MNBnMHT260i5nXXHKepx5FJJyG2H2sMn/E38cTOdvR44nQ5
 6fCDFJwIbWU3ECBP25E10vYZST/39E4PHMiDzy4LRveQRvSxHm09ELHHF3WlavgM+OZW
 a1jmDrXEgbJ3UPNZURp1kjwaIh7wIw4enJhBbZfK1kuJQGn5StwdHsra3/nSjYA1Q9yi
 uk/B0HVBj4d13hxCJZsqTDmFC1qHIJue8iptmMpDIyxi67Evudg0ymo4+qKwRdvD+X5I
 WesRCX8/eku0qAe8FO5O6+yFNts+N+RTZHUfldcM+S7/VkBGAFQwpbTkfI5PPVgF4Spd
 ghhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793215143; x=1793819943;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=aTS+A681mIrnnETlSdM14Ivbll15fjA3/zVwCINUMmk=;
 b=mPWOuo2V3Yh9q8H/jLQw/AR1FeOw+BvnWHAnyTPReBPn+W0qfXVaS1AwKrFJwaq6K1
 qTf9O2Grp4Girih7GnnRH7WGOIwjaY38U8Wm7JtfoTrObCXhH0A7N7doRfuof41fCWBr
 uOWQE2fUe4AK5U3mK+zqPnQlPIRjNcwd5gFXoxjP04q6TrsujJKWpdDq8bgSDV6Me/+L
 xjwd+y8YEReNzb4msCEWQ2qfdZUb7GvnLYl1cw3N3YtHOURzELE3/pIDfa/8AOeEUEsO
 XjYpaei/7AvZiR4s4Y+IzDHEktjo6OwUMJXuXBs7HcpW4RuSAyHkSvDGodnzy8aG+e6N
 cuhA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzJDnxIdaVF6RmXTXPdqseI61vYMwP2i37Xb8BywaICy0iNh0Dkv+uH63XKCZsLy/qij3Lf/FOeRB4l@nongnu.org
X-Gm-Message-State: AFq9FYKfshNxaM/re3aTxMLwdgiF4FUeH3sxaYfX16nF1GHjSF3n+rn/
 NKCjI7GE2h50LSGs197Vtbhaa/nQ46c05u4LrWpeoSG6VWprwycSs1joZ8jcOFXblw5T2Yjldw1
 rkeWglWqBHseIid1HgLbMftesks4cgy8=
X-Gm-Gg: AYBFou1nSizFfVaR4PJHI1JKjywE3so44WoC4+WFfBq5USX80ZNf9Izr8waE8sWsFhM
 Z8T1Xfbt2mn0zpupkbMGU8/qLOhNIzVNPRPsDdNDfnM62umq4LQtSzE2c09XRWDxLrgyq8pyM/L
 cVolKG0Lqq2QMytajGOi0zKABsTmTDOBPYAh93qevEciso3lGFYOoJ5q0nQnNs2oRgEnqzB70sn
 K3vNbIF9RLs20CeU5yHsci3gCHD/RIwU7JKdIG+0Mjpw6gjPIJuiZJPzeFnNeJeiTM3Ho5lz6dX
 tpWCwquif8HZLdPZrRsFdo0nLM67zHZHMHWOwg3D7+iFiA9Jzz2Yjff9+PUN+XuWX8ULYLUqALD
 lg94JaocWLx7sLRPb9M/0k0lwKRBZ3Ui5SZYq
X-Received: by 2002:a05:690e:128e:b0:677:d4de:21a9 with SMTP id
 956f58d0204a3-67a8d05856bmr397162d50.7.1793215142955; Wed, 28 Oct 2026
 12:19:02 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261028063049.2530-1-luoyonggang@gmail.com>
 <20261028063049.2530-2-luoyonggang@gmail.com>
 <bc5bad6e-fbc2-44e1-a4b4-41bdfd41d33a@oss.qualcomm.com>
 <CAE2XoE_r3gZXzS+TFUd+GRs-8ZtCTajsJK0wJpTHNoXx_Cf3dA@mail.gmail.com>
 <7bd5d577-63db-4356-a19e-4b7e030d58d9@oss.qualcomm.com>
In-Reply-To: <7bd5d577-63db-4356-a19e-4b7e030d58d9@oss.qualcomm.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Thu, 29 Oct 2026 03:18:48 +0800
X-Gm-Features: AclHuK-1VSED8TUJADZfn2zB4SG6R2RQ3vj2vsCONOKdXgBTJf-jtO5fpm--rR4
Message-ID: <CAE2XoE-0zECt6yYURkTbUDBWfG63r_6Dr1oxc5XUcUXr9Wk61g@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] accel: register CPU parent for each target
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, Chao Liu <chao.liu@processmission.com>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>, Weiwei Li <liwei1518@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b132;
 envelope-from=luoyonggang@gmail.com; helo=mail-yx1-xb132.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Reply-To: luoyonggang@gmail.com
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 29, 2026 at 3:06=E2=80=AFAM Pierrick Bouvier
<pierrick.bouvier@oss.qualcomm.com> wrote:
>
> On 10/28/2026 11:02 AM, Yonggang Luo wrote:
> > On Thu, Oct 29, 2026 at 2:25=E2=80=AFAM Pierrick Bouvier
> > <pierrick.bouvier@oss.qualcomm.com> wrote:
> >>
> >> On 10/27/2026 10:30 PM, Yonggang Luo wrote:
> >>> A multi-target binary registers one accel-$cpu_type parent per linked
> >>> target. accel-target.c is compiled once per target and calls
> >>> accel_register_cpu_type() with that target's target_arch and
> >>> CPU_RESOLVING_TYPE. A bool array keyed by SysEmuTarget records which
> >>> arch already registered. Targets that share one CPU_RESOLVING_TYPE
> >>> reuse the parent from the earlier arch.
> >>>
> >>> test-multi-target checks that each target's accel parent exists after
> >>> QOM init.
> >>>
> >>> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> >>> ---
> >>>  accel/accel-common.c           | 31 ++++++++++++++++++++++++++++---
> >>>  accel/accel-internal.h         |  2 ++
> >>>  accel/accel-target.c           | 21 +++++++++++++++++++++
> >>>  accel/meson.build              |  1 +
> >>>  tests/unit/test-multi-target.c | 22 ++++++++++++++++++++++
> >>>  5 files changed, 74 insertions(+), 3 deletions(-)
> >>>  create mode 100644 accel/accel-target.c
> >>>
> >>> diff --git a/accel/accel-common.c b/accel/accel-common.c
> >>> index 00a400243f0..0d04b8c5749 100644
> >>> --- a/accel/accel-common.c
> >>> +++ b/accel/accel-common.c
> >>> @@ -130,9 +130,9 @@ static const TypeInfo accel_types[] =3D {
> >>>
> >>>  DEFINE_TYPES(accel_types)
> >>>
> >>> -static void register_accel_target_type(void)
> >>> +static void register_accel_target_type(const char *cpu_type)
> >>>  {
> >>> -    g_autofree char *name =3D g_strconcat("accel-", target_cpu_type(=
), NULL);
> >>> +    g_autofree char *name =3D g_strconcat("accel-", cpu_type, NULL);
> >>>      const TypeInfo accel_cpu_type =3D {
> >>>          .name =3D name,
> >>>          .parent =3D TYPE_OBJECT,
> >>> @@ -143,4 +143,29 @@ static void register_accel_target_type(void)
> >>>      type_register_static(&accel_cpu_type);
> >>>  }
> >>>
> >>> -type_init(register_accel_target_type);
> >>> +void accel_register_cpu_type(SysEmuTarget arch, const char *cpu_type=
)
> >>> +{
> >>> +    static bool accel_cpu_registered[SYS_EMU_TARGET__MAX];
> >>> +    static const char *accel_cpu_types[SYS_EMU_TARGET__MAX];
> >>> +
> >>> +    if (accel_cpu_registered[arch]) {
> >>> +        return;
> >>> +    }
> >>> +
> >>> +    /*
> >>> +     * Keyed by target_arch. Targets that share CPU_RESOLVING_TYPE a=
lready
> >>> +     * have a parent from an earlier target_arch.
> >>> +     */
> >>> +    for (int i =3D 0; i < SYS_EMU_TARGET__MAX; i++) {
> >>> +        if (accel_cpu_registered[i] &&
> >>> +            g_str_equal(accel_cpu_types[i], cpu_type)) {
> >>> +            accel_cpu_registered[arch] =3D true;
> >>> +            accel_cpu_types[arch] =3D cpu_type;
> >>> +            return;
> >>> +        }
> >>> +    }
> >>> +
> >>> +    accel_cpu_registered[arch] =3D true;
> >>> +    accel_cpu_types[arch] =3D cpu_type;
> >>> +    register_accel_target_type(cpu_type);
> >>> +}
> >>
> >> No need to do this, just move the whole type registration in
> >> accel-target.c and type will be present at runtime for all present tar=
gets.
> >
> > The issue is that CPU_RESOLVING_TYPE is not unique for each
> > target_arch, you may not realize it.
> > for example:
> > arm/aarch64 sharing same
> > ```
> > #define TYPE_ARM_CPU "arm-cpu"
> > #define CPU_RESOLVING_TYPE TYPE_ARM_CPU
> > ```
> >
>
> Oh right. In this case, the accel-target has to be added once per base
> architecture (in each target/*/).

So you mean call register_accel_target_type at each target/$base/cpu.c?
too much duplicated code scattered.

>
> > And the same name can not be registered twice, that's why this
> > accel_register_cpu_type should be
> > in a global shared place. We need accel_cpu_registered/accel_cpu_types
> > for deduplication.
> >
> >>
> >> Regards,
> >> Pierrick
> >
> >
> >
>


--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

