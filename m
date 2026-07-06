Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB2AC43458
	for <qemu-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 02:41:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wgZGD-0002Uu-FQ; Sun, 05 Jul 2026 22:40:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wgZGB-0002S6-6v
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 22:40:39 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wgZG9-0007sO-Kx
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 22:40:38 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-698b558a792so2628929a12.1
 for <qemu-riscv@nongnu.org>; Sun, 05 Jul 2026 19:40:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783305636; cv=none;
 d=google.com; s=arc-20260327;
 b=F+/zqrzpQyTiZVEaQBnKcfOyxfueBi2Q/6UC3CqlT2zMYLGblOIq2aY77ziuPQ1Y5b
 zygxwGNOSljD8kBDl31fMHs68QtifTg+mquRwqcNCPEffR65mQDPGTtMaqXoLfxBXtz4
 4xr8Q5dBoRnrHVnKlXy0rQMl5mcyBuXpfUlLMYsJC/4tyo2x651/AezoQkvs0Dq78pvy
 z+vcTuAEuufwBhRbSLVXej9+3zd1j/HkLS8peiDaUJgc10CA5feVQO0M8URUfVQgT7jW
 dG2ilRmwPn5HMK1j84tn3aVh6OyPFLqp8/+rc44u6pvVkcLvGBapNIcZpSwEEEnM1tGS
 6kAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=TjWdQKwOQpOYEu0iBnBkOGVpSpN1dx6eBdCbU/HeHYI=;
 fh=A9BAHf4JEsS4GjBhn0BEjMx9+PvVkl0Fi8pFkW9wpO0=;
 b=SCT38UhPy4jj6N7rikWzNwnc2a4f8arR4Qux9SyhtWwNEvkv97qCneyjDmIGpuY7f4
 Iug7He2Rk+YYBKsL11rlQFwDnyu/k4BM1ENiKccNifpIhDBpjmMWhoUdvu9diKaw9zYl
 SjlxPH+VXSVwu5tJ6lU35HjM0mkMlwIgpVtDu3xp0ts0K2Ogz1vcSCvzcTip7iBl6ycC
 gPVFbAhNjDlCbibSe7SjX48RogkLo3YrLchEIjCGrjzUiTe1TVmAUfwpcg52YN5jUmMj
 i9voSAgIxkNgQIVzdt8Hx75us1KUHXojtg9Ok6wrvstdgAEilQ747MMBF07vevhzDFUS
 iaBg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783305636; x=1783910436; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TjWdQKwOQpOYEu0iBnBkOGVpSpN1dx6eBdCbU/HeHYI=;
 b=aGJrCLzoRaqnRQ0ogj+9HESSPBy/6UxjvOjLOFq2QARgDUBz7na3VuOau9A05380/u
 wGSarE8QDrp4eV9lYo92XdGXgt5hT/CxqJCP7uEplO+0flfGJmcXNPXPr77cbAxfjRqg
 QXQkYWxF5v9uFOw09AE/+/8ylmoo9LtQGgjfok4jiU/jO6ICZPadvym29okjKrwqDtde
 jypkUnxGo95ft6VmH7+uKqe+T1bfO4w24Cx6e1PvCZPhY80DmG5Bz62Cm0AOos/3u4Vs
 siuVWlzRekQ9QW77erFMAVOl8HzOBL0fQWxV+RQ2VsZryzS3tYLPFycsm8AB3daALjt9
 9AMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783305636; x=1783910436;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TjWdQKwOQpOYEu0iBnBkOGVpSpN1dx6eBdCbU/HeHYI=;
 b=FgCFJIZUXnXJghkh6yR6NkRqDdBF4dmQGeW2t6SF4cEIRJsHFWml+EhRa59u+aTbUQ
 7fDMYIezMquiUyXTkH+Iodqksw+JNxJt7c2U75NO/g8ZslQQN9iw037O4d0qMSsxL/TX
 Lmod2I6f67qEHLydqn96OpqkQDjKdtKhAmHVoTotFT9inXHajaHRamiAP+aPKc3mW1YX
 F9iFAVexdtCQM4cV36wXWuCTd1fkWEJcyMMyx24XPbKLiqOKcIpaXr4Xv1ydZFGGxGl9
 s77i48NvZsk9R1WlZV6O8IcL3EWX6JSbB1K9hPhYlLTyRiG0rTv6NIFTxRoCEI6/hIte
 C8Hg==
X-Forwarded-Encrypted: i=1;
 AHgh+RohbPgRhQCuRt+cRB6o6pLdLzzD7x1zuKBYnmHoA78zr0UAKTt3GFQ3cn/M/K4ps33aN2byaCRw/cj3@nongnu.org
X-Gm-Message-State: AOJu0YwMJKkrbNHeFsCq4Tg1uOCVCFTxeyuaU8QKb8uyU8MR1qZQitTR
 WwQcQRsFcijwbcnH0CvZqjX7Uipwv9rf39mRBoE4aNGi07XqaPXs9k5MUHo5HhvYDezgmxriL6l
 ZpADpTeQ78FmF9+px2sEbYlr5tB12WrVx89Pa
X-Gm-Gg: AfdE7ckMdjhA81eSq+ww1dkkSc/PKzb0haVTppJ5r/mv6jYhopcOswLt3dRGWRVP9r7
 9gIRD/vlfGA7IUPSFgiHrf4dVTGSEMMkGXOXOo7xlzbaIsQmNTBvfmQRUTH+yPFzj3DMAtnGA33
 KyMvQnEo7jpDOD/TZpB7+5Mlu82Evmg341rS8Q1V/JSS2BWZBVJ01JcuPUCV6O2LVONCztOcmqD
 xwYjCHv9UmBWNFNMTE/0xiaRpxaTmXJow9ULXOjLT6TGXfLa9z0KKdG1wAExG2OCaEHT4/zhafa
 DrVDITTXNZ5rh6NqpnT7eSlSX1iy5QZd/8RNYA==
X-Received: by 2002:a05:6402:34c6:b0:699:fbe4:16d5 with SMTP id
 4fb4d7f45d1cf-69a1a24b446mr2603213a12.1.1783305636446; Sun, 05 Jul 2026
 19:40:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260630104350.748267-1-frank.chang@sifive.com>
 <20260630104350.748267-5-frank.chang@sifive.com>
In-Reply-To: <20260630104350.748267-5-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Jul 2026 12:40:10 +1000
X-Gm-Features: AVVi8Cf8Yx6Q4VFdK-gMpWpoaUEYbUOUGcA9_lyTEc1IFQkJLnSORh0HL9RWTQ8
Message-ID: <CAKmqyKPwQ_TgTNF=k6h_H+o9EE9F+97gyDDuPFY1hXnNdq7_OQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] target/riscv: Enable Zicclsm for the compatible
 CPUs
To: frank.chang@sifive.com
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu.zevorn@gmail.com>, 
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x533.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Tue, Jun 30, 2026 at 8:46=E2=80=AFPM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Now that Zicclsm is supported, let's enable it for the following
> compatible CPUs:
>
> - Base 32 CPU (to be backward compatible)
> - Base 64 CPU (to be backward compatible)
> - XuanTie (T-Head) C908
> - Tenstorrent Ascalon
> - Ventana Veyron V1
> - XiangShan Kunminghu
> - MIPS P8700 (ISA doesn't include Zicclsm, but their datasheet claims tha=
t
>   it has unaligned load/store support in hardware)
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index bff3ed5de14..a3cccdfed3c 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -3021,6 +3021,7 @@ static const TypeInfo riscv_cpu_type_infos[] =3D {
>          .cfg.ext_zicbom =3D true,
>          .cfg.ext_zicbop =3D true,
>          .cfg.ext_zicboz =3D true,
> +        .cfg.ext_zicclsm =3D true,
>          .cfg.ext_zicntr =3D true,
>          .cfg.ext_zicsr =3D true,
>          .cfg.ext_zifencei =3D true,
> @@ -3093,6 +3094,7 @@ static const TypeInfo riscv_cpu_type_infos[] =3D {
>          .cfg.ext_zicbom =3D true,
>          .cfg.ext_zicbop =3D true,
>          .cfg.ext_zicboz =3D true,
> +        .cfg.ext_zicclsm =3D true,
>          .cfg.ext_zicntr =3D true,
>          .cfg.ext_zicsr =3D true,
>          .cfg.ext_zifencei =3D true,
> @@ -3179,6 +3181,7 @@ static const TypeInfo riscv_cpu_type_infos[] =3D {
>          .cfg.ext_zbs =3D true,
>          .cfg.ext_zkt =3D true,
>          .cfg.ext_zbkc =3D true,
> +        .cfg.ext_zicclsm =3D true,
>          .cfg.ext_zicsr =3D true,
>          .cfg.ext_zifencei =3D true,
>          .cfg.ext_zihintpause =3D true,
> @@ -3222,6 +3225,7 @@ static const TypeInfo riscv_cpu_type_infos[] =3D {
>          .cfg.ext_zicbom =3D true,
>          .cfg.ext_zicbop =3D true,
>          .cfg.ext_zicboz =3D true,
> +        .cfg.ext_zicclsm =3D true,
>          .cfg.ext_zicntr =3D true,
>          .cfg.ext_zicond =3D true,
>          .cfg.ext_zicsr =3D true,
> @@ -3270,6 +3274,7 @@ static const TypeInfo riscv_cpu_type_infos[] =3D {
>
>          /* ISA extensions */
>          .cfg.mmu =3D true,
> +        .cfg.ext_zicclsm =3D true,
>          .cfg.ext_zifencei =3D true,
>          .cfg.ext_zicsr =3D true,
>          .cfg.pmp =3D true,
> @@ -3329,6 +3334,7 @@ static const TypeInfo riscv_cpu_type_infos[] =3D {
>       * The RISC-V Instruction Set Manual: Volume I
>       * Unprivileged Architecture
>       */
> +    .cfg.ext_zicclsm =3D true,
>      .cfg.ext_zicntr =3D true,
>      .cfg.ext_zihpm =3D true,
>      .cfg.ext_zihintntl =3D true,
> @@ -3385,6 +3391,7 @@ static const TypeInfo riscv_cpu_type_infos[] =3D {
>          .misa_ext =3D RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU,
>          .priv_spec =3D PRIV_VERSION_1_12_0,
>          .cfg.max_satp_mode =3D VM_1_10_SV48,
> +        .cfg.ext_zicclsm =3D true,
>          .cfg.ext_zifencei =3D true,
>          .cfg.ext_zicsr =3D true,
>          .cfg.mmu =3D true,
> --
> 2.43.0
>
>

