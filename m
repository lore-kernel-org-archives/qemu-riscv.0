Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECBCCCA5FDD
	for <qemu-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 15:47:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xCfTC-0007PG-Iy; Fri, 02 Oct 2026 11:46:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xCfT6-0007Oe-N1
 for qemu-riscv@nongnu.org; Fri, 02 Oct 2026 11:46:41 -0400
Received: from mail-ed2-x0e.google.com ([2a00:1450:4864:33::e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xCfT0-0001bM-Q7
 for qemu-riscv@nongnu.org; Fri, 02 Oct 2026 11:46:37 -0400
Received: by mail-ed2-x0e.google.com with SMTP id
 4fb4d7f45d1cf-6aae359e2c0so12174268a12.3
 for <qemu-riscv@nongnu.org>; Fri, 02 Oct 2026 08:46:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790955992; cv=none;
 d=google.com; s=arc-20260327;
 b=UA+cG2Tk0u8p05dRVTaAs0nL4vmr6Gc1zZlsXP4jJk8e3JkejfGG6oGjP9LWxO1Lr6
 sOhYx8ya8A0KGrqLm8cXp3jMAUZbJq9UPTgM0zttypq7f4S5iSsp33QgLyc9Nk2u84Pf
 GZUa61YcYJ/DCR49fCoMvfOMCcWrfQkI09mTYqJjHbV4Ps2vsZtH/5bpVq1fGfNnK2BP
 DXwV0p7fGOBs4LwQ/eO6NcUqgcPcTc7CJ9vLoZcD1+bw2A8+cn82Y+wTE23vbxt1oSbB
 wtNyCQyjD/+wdXgmJ571sHc2EVAvFGApgvJ4/NxyZEp619JkBUfR0UvSYn9kW3+mTE3Q
 p9VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=DcmBuQgOQuAEhXZY1VVxRnodJZmxTBNA4BXr+UWH02Q=;
 fh=Gl5rnp7YzVJxZOIWZCKcB6r9BNPvakWC7xjd47ev+a8=;
 b=lpI6aTM7XQDK5Swe5grnAhLF7n7LRIEVv9fD0E5F8R0zoHmw4Fgf4FIeINguK4mZGQ
 CnHy5Go3+a6vKQHezz7LBIogSrCnQQp0T1RJfCI6XVUPQpGRHQFbagWHI0+0L3lnP0+d
 uSZPBHb50nZeJi3NctuItpoCLCMWcBdooTxcElfxCNfMDyJ+9sXrj3vpLCRb6nRMfftw
 5/1f8F/fQmbTNz63d+Z++DY9bXfdZshtVwdLFZguThjBQ7mplrIxjG5/KfAqBRgucfxi
 V5vXOolZZyxJ5IwVCmiRFAkTO1XNiziKERt6bDSm239RBXku87iXfPX6zGoWm3AlVtK+
 rv2Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790955992; x=1791560792; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=DcmBuQgOQuAEhXZY1VVxRnodJZmxTBNA4BXr+UWH02Q=;
 b=E7hr1CfvuxgmW8LmKkJJ2vAm10ywO/jHeMQ5xoz8/wrIKUALYVITke73sObuuU74X8
 osH01ZG5UXZ73dg07hi8tLo+eI0981ZFZj8/WUwP+Fe67++BdFoAfAlMJwGKcMRQCngL
 xac/K1asdnp3X+y57r47SzITVHhv870zKCy7Bbc8s5YIXaTQ2shKYLxPkVtQ/+rbQRRQ
 hA7xNnIaYp4ioWNrvskru9oNUW3orPCxJvEwWa9R2mxsbHjjdRxqu5frvWV2a8xXH66L
 9bMk1PRlqbYZSR/MTwuvgBtE9G5yyL2whOJ3UkuushPdTBlAwGaNtI7X4yZ9sqnYsZXd
 8NcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790955992; x=1791560792;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=DcmBuQgOQuAEhXZY1VVxRnodJZmxTBNA4BXr+UWH02Q=;
 b=SG9f13ccDCqUdbEJx7A3gEHiiK+KvBMwG8KobHM5IJ3c4pMUfrGdijbabQkXQLEOjw
 kKh9nhxEgRgtE5CQnfNKtHHGif9ffvS1yh5EGY3fiRYXZPqI8Mw9TQMpC5wMM6Mz6zqW
 UVmLAvcYNVe7kQHuqWcHlqopVJB8AB9b15gJEb+AnDwJ0z5cnb2ZiWOtLtJ+Fl7OsRFr
 YyIxEibXHOGflMWyuAVeVW3GjnBSEq6BQY3MDnYsHfMyHQY9cQuKoO0Iw5AaGuwdPgm1
 n9Df6cjn55Ky1slVScG0FOb4YwqA3+uw/CCU9hupdkkrjf8wPJz90azNTmb48mniQKLR
 Q0vw==
X-Forwarded-Encrypted: i=1;
 AKwUvByp/rm0FjYY0aIGqPZS6mpgXc2KhKsS3gCla6vt56Cv4mT/WMb83Y9D/pppLf5uH4dwJ/9XiKn8ZZdA@nongnu.org
X-Gm-Message-State: AFq9FYJcZN/3yFmefnDOBmwQsvRM+K2rmvycwdm10C0W35UZWfJZqRu3
 NPToy/sqRaY23JvTPvb02hzM3TBoQ4D3j2xTXcjJjOq17mZHfhtdbG9PmF5yA+649CGx+tAIXmR
 peJUCRxLay5fida8URq4eeIIltuHQW/Q=
X-Gm-Gg: AYBFou39w8BvqC1MVq/ge9ANIOEdhy/Feprfd4lLBq0ACLh95Lbt2+NnkK0TK+TSEn7
 Nx3RE8iWkKJWjmfUP/oHUydtkzRo/c/ZrVlGEb+4YZMTmWhbPhX7v4QVJCILqh95kwF3MWSYPEt
 Y9EjGaMr1mkhGoaA5nx1Q2Z7rhyAQMFd6f2wFfSMP6n0eJodj01M0HwO+9YMLAp5XGf7QeB1RvV
 tuY5GvXbomh5LY8ngo27PsRfdxHtNPKYK1+h1HqqZceGC0oOdmnlWeZeg4RJi5x7VdT7fi0BNlm
 dE4FsfAaJBJ2OgQYtSX5hwCGO9TCTzFM/zqXaV3H8JBMNGi1AyoIlJU=
X-Received: by 2002:a05:6402:1ec7:b0:6ab:81e:e812 with SMTP id
 4fb4d7f45d1cf-6af9e36ca95mr2181563a12.34.1790955992041; Fri, 02 Oct 2026
 08:46:32 -0700 (PDT)
MIME-Version: 1.0
References: <20261001-rv-dedup-v1-0-ea69b07afd31@rev.ng>
 <20261001-rv-dedup-v1-7-ea69b07afd31@rev.ng>
 <CAE2XoE_ag1RR_JFwgcg+9zPed+qpO2skf7W1_kiqvwB=Vf9aAQ@mail.gmail.com>
 <f8f27bc3-83ce-4ccf-ae38-a43188b2ebc5@oss.qualcomm.com>
 <ar_AzEWpF9XDGNdg@hive.localdomain>
In-Reply-To: <ar_AzEWpF9XDGNdg@hive.localdomain>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Fri, 2 Oct 2026 23:46:19 +0800
X-Gm-Features: AclHuK8D0gFkig897zC0TtaIrSv_CPgbUV-lanFSIxvUTjdMTlOY2kU-ZaeUwcI
Message-ID: <CAE2XoE-ove_cvoSZ8h_A8yw4d6YE9BS0VHc4SQ-mQ7JM1uqMvg@mail.gmail.com>
Subject: Re: [PATCH 07/18] target/riscv: Runtime register MAX and BARE CPUs
To: Anton Johansson <anjo@rev.ng>
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, daniel.barboza@oss.qualcomm.com, 
 philmd@oss.qualcomm.com, palmer@dabbelt.com, alistair.francis@wdc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:33::e;
 envelope-from=luoyonggang@gmail.com; helo=mail-ed2-x0e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, Oct 2, 2026 at 11:36=E2=80=AFPM Anton Johansson <anjo@rev.ng> wrote=
:
>
> On 02/10/26, Pierrick Bouvier wrote:
> > On 10/1/2026 9:28 AM, Yonggang Luo wrote:
> > > On Thu, Oct 1, 2026 at 11:55=E2=80=AFPM Anton Johansson via qemu deve=
lopment
> > > <qemu-devel@nongnu.org> wrote:
> > >>
> > >> Moves initialization of satp and mxl fields to a class initializatio=
n
> > >> function that checks target_riscv64().
> > >>
> > >> Note: I'm aware the current iteration of this patch is rather hacky,=
 I
> > >> don't like the introduction of runtime_misa_mxl_max, but I'm keeping
> > >> this in to get the series out there and collect feedback.
> > >>
> > >> Signed-off-by: Anton Johansson <anjo@rev.ng>
> > >> ---
> > >>  target/riscv/cpu.h |  1 +
> > >>  target/riscv/cpu.c | 90 +++++++++++++++++++++++++++++++++++--------=
-----------
> > >>  2 files changed, 59 insertions(+), 32 deletions(-)
> > >>
> > >
> > > This patch is how I handle these, just for reference, not a review.
> >
> > Yonggang approach looks cleaner, I would favor this one.
>
> I'm personally not a huge fan, it still feels rather hacky. Why add a
> completely new RISCVCPUDef::target_init just to make sure fields are
> initialized before riscv_cpu_validate_misa_mxl()? Wouldn't moving the
> check to a later point, maybe .instance_init, be better? Then for
> riscv_cpu_init() we get
>
>   riscv_cpu_validate_misa_mxl(mcc);
>   env->misa_mxl =3D mcc->def->misa_mxl_max;
>

Yeap I also tried instance_init but it's too generic, that needs if else in
riscv_cpu_init guard which CPU name from(that's not explicitly related).

    if (target_riscv32()) {
        if (mcc->def->misa_mxl_max > MXL_RV32) {
            mcc->def->misa_mxl_max =3D MXL_RV32;
            mcc->def->cfg.max_satp_mode =3D VM_1_10_SV32;
        }
        if (mcc->def->bare) {
            mcc->def->cfg.max_satp_mode =3D VM_1_10_SV32;
        }
#ifndef CONFIG_USER_ONLY
        if (mcc->def->misa_mxl_max =3D=3D MXL_RV32 &&
            !valid_vm_1_10_32[mcc->def->cfg.max_satp_mode]) {
            mcc->def->cfg.max_satp_mode =3D VM_1_10_SV32;
        }
#endif
    }
That would be something like this.
Maybe another option is get max_satp_mode to be a function instead?
Indeed "max_satp_mode" depends on the chosen target.

> misa_mxl_max would be verified only during instance rather than
> class initialization, which seems like a decent tradeoff for a simpler
> solution.
>
> --
> Anton Johansson
> rev.ng Labs Srl.



--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

