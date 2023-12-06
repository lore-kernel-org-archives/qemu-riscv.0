Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30C05C4167B
	for <qemu-riscv@archiver.kernel.org>; Wed,  6 Dec 2023 00:54:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rAgAz-0004uZ-UN; Tue, 05 Dec 2023 19:54:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rAgAy-0004sT-4v; Tue, 05 Dec 2023 19:54:08 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rAgAw-0000IH-Dp; Tue, 05 Dec 2023 19:54:07 -0500
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-54c671acd2eso5763012a12.1; 
 Tue, 05 Dec 2023 16:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701824044; x=1702428844; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gZ/3Ui2YLExDZlzu3rb+WYG8IxT3rYMEuJa5rYx119Y=;
 b=fLZewPGcL36Vm+K/cUC3NT/MUzMPx4UsWyDSrw2+PBdzNozPDwRBxi/yv5iuMmvmF2
 cZcynYqhfrdJYk0Y8XejoUdhBsig8LhMGxKO2l0wWxnHCMO0sM0xP7iaSbnpUtIs0R29
 PswJaiyZC/wQWs8YNSZ7FB/gcwcs7k+17urc2E+iZAxzUHQu8XCmzmsHU/cFtd6eQ/RO
 dXZiPS6iRYr511ODAr6idDO++cQKIzxW0+yUsmbbHA6ew+Sxk20vZkSqPHwmlYQ6Ht65
 TW7ldOK6LmuSEx89OaithSqBYEs3hUMgCEmgHW7eXVssHekwWqzn4qo04xoxWAQwWW6j
 jzSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701824044; x=1702428844;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gZ/3Ui2YLExDZlzu3rb+WYG8IxT3rYMEuJa5rYx119Y=;
 b=OiA67AuWhxGDHRiP9K5IUb48NUzLq9cpkgW5Q3hljvxKepl9cU75C3STWw15TkpOi1
 e5MTKitsnfpS02n7MMjWUgsidTnB1L5uBCd3qN7h6JczqudhAzFqU2UyECwj6vqe4aEY
 w5Hfih8JbZQKNUwAbVYG1Tpn9BWYXBvZ2Hd+e3xwRjxwPvNywVTn+Py7lrP63QNR5OUP
 8JMMYJKyuI35ndBF7dh5U+YIFW7Z13fl7FW09IdWoisuvYoDQ7ca6qdDf2mRLECRyabF
 ly2cKmSNbrjRGNCAoIJmX1LZZ8P5+MOQW9XbSPOrbcsNHKwa8x8xgzQYRT0qWCMFE9l2
 FcOQ==
X-Gm-Message-State: AOJu0YyHV946JzIOIdh3IhFb5rrYo2YnlHS0oMenGNFTceEG4D44SoTM
 Q2furmOFXU8b6hW9HvgSVncfxYTAXcghkQc12Lc=
X-Google-Smtp-Source: AGHT+IEaxasVb5GN/IEK16+IlgDq5VVdpTJd+8MluJTe1QcsJ4yl9v+DU4Mc+cih+2k996v4oyzhs4irf3t7WQoS67c=
X-Received: by 2002:a05:6402:35c9:b0:548:55f0:b5f2 with SMTP id
 z9-20020a05640235c900b0054855f0b5f2mr90131edc.6.1701824044517; Tue, 05 Dec
 2023 16:54:04 -0800 (PST)
MIME-Version: 1.0
References: <20231123001709.64934-1-patrick@rivosinc.com>
 <50795130-6a02-4611-8da7-c06158fc9cff@linaro.org>
 <9eba31fa-74b3-4d35-97d4-632fbdd2666f@rivosinc.com>
In-Reply-To: <9eba31fa-74b3-4d35-97d4-632fbdd2666f@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 6 Dec 2023 10:53:37 +1000
Message-ID: <CAKmqyKPh6U5iDdXNcBbuo1as-jZw=SY1gXHOptiRjkMJCO-Aow@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Increase max vlen to 4096
To: "Patrick O'Neill" <patrick@rivosinc.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x52e.google.com
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

On Tue, Nov 28, 2023 at 3:09=E2=80=AFAM Patrick O'Neill <patrick@rivosinc.c=
om> wrote:
>
> Hi Phil,
>
> On 11/23/23 02:21, Philippe Mathieu-Daud=C3=A9 wrote:
> > Hi Patrick,
> >
> > On 23/11/23 01:17, Patrick O'Neill wrote:
> >> QEMU currently limits the max vlenb to 1024. GCC sets the upper bound
> >> to 4096 [1]. There doesn't seem to be an upper bound set by the spec [=
2]
> >> so this patch just changes QEMU to match GCC's upper bound.
> >>
> >> [1]
> >> https://github.com/gcc-mirror/gcc/blob/5d2a360f0a541646abb11efdbabc33c=
6a04de7ee/gcc/testsuite/gcc.target/riscv/rvv/base/zvl-unimplemented-2.c#L4
> >> [2] https://github.com/riscv/riscv-v-spec/issues/204
> >>
> >> Signed-off-by: Patrick O'Neill <patrick@rivosinc.com>
> >> ---
> >> Tested by applying to QEMU v8.1.2 and running the GCC testsuite in QEM=
U
> >> user mode with rv64gcv_zvl4096b. Failures are somewhat reasonable and =
on
> >> first inspection appear to be in the same ballpark as failures for
> >> rv64gcv_zvl1024b. Since I used tip-of-tree GCC I'm expecting those
> >> failures to be GCC-caused & from skimming the debug log they appear to
> >> be.
> >> ---
> >>   target/riscv/cpu.h | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> >> index 6ea22e0eea..2ff3a72fc0 100644
> >> --- a/target/riscv/cpu.h
> >> +++ b/target/riscv/cpu.h
> >> @@ -97,7 +97,7 @@ typedef enum {
> >>   #include "debug.h"
> >>   #endif
> >>
> >> -#define RV_VLEN_MAX 1024
> >> +#define RV_VLEN_MAX 4096
> >
> > This seems to break the "cpu/vector" field migration. Maybe we don't
> > care, but this should be clarified in the commit description.
> I wasn't aware of that (this is actually my first patch to qemu!). Do
> you have a pointer to more information about the migration so I can
> write an appropriate blurb/understand what the migration was/did?

If you increase the version_id and minimum_version_id in this struct
that should handle it:

static const VMStateDescription vmstate_vector =3D {
    .name =3D "cpu/vector",
    .version_id =3D 2,
    .minimum_version_id =3D 2,
    .needed =3D vector_needed,
    .fields =3D (VMStateField[]) {
        VMSTATE_UINT64_ARRAY(env.vreg, RISCVCPU, 32 * RV_VLEN_MAX / 64),
        VMSTATE_UINTTL(env.vxrm, RISCVCPU),
        VMSTATE_UINTTL(env.vxsat, RISCVCPU),
        VMSTATE_UINTTL(env.vl, RISCVCPU),
        VMSTATE_UINTTL(env.vstart, RISCVCPU),
        VMSTATE_UINTTL(env.vtype, RISCVCPU),
        VMSTATE_BOOL(env.vill, RISCVCPU),
        VMSTATE_END_OF_LIST()
    }
};

Alistair

>
> Thanks,
> Patrick
> >
> > Regards,
> >
> > Phil.
> >
>

