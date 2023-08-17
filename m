Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BCE5C05052
	for <qemu-riscv@archiver.kernel.org>; Thu, 17 Aug 2023 03:31:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qWTiL-0003au-Vs; Wed, 16 Aug 2023 23:30:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qWTiJ-0003aV-Tt
 for qemu-riscv@nongnu.org; Wed, 16 Aug 2023 23:30:23 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qWTiF-0005yQ-Lk
 for qemu-riscv@nongnu.org; Wed, 16 Aug 2023 23:30:23 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1bdf4752c3cso21188775ad.2
 for <qemu-riscv@nongnu.org>; Wed, 16 Aug 2023 20:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1692243015; x=1692847815;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=da/XbM7V0w3vnnbBvgHoG8bDMtDm3bel7gEPQSFhkIk=;
 b=O/WCX6iChN0fluY6p+BAfYpH8N8hJrzm5+ZBtJKLbeS+RKJkkApkNiA0Y1c0P/JeiT
 4F0H2CJaPjloxCPtuKLUbX3dIV6VTdjHTU7mWkAVmWBLS/IBf7oXtD7TGVFxSXC1+t9R
 aUs+F8E4ISFzLoPNNYxcaGiwkvUeBp68mI470bfAXcajb2N6MKn2u+ZceN/8bPfgZsPr
 tD7SOHGwD7DJxZ8Nefwiz3PBuHiD7h/wNwMEpOA3tB+ybqBqebDtvv5gUP93+d6oq0ah
 vXDKOweWQLGsqUu/De8jxPaAgI5Tzbu7YiBZuOz0vDgdowEWqQX8D/qPK6Uf9pSWEe0V
 Vxng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692243015; x=1692847815;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=da/XbM7V0w3vnnbBvgHoG8bDMtDm3bel7gEPQSFhkIk=;
 b=T4e4ul02c+OQo0uSG1WY/EQrpJqf1fDwTn24VB7CgJi5uBBuUkLMsiaA1YaLnY/Pke
 T+FcTfShSL2+MdXHXJWpDWhLq7Kjr/3uXll8A7dpDI57EDHC2qBJYkcUEC7MQ1GgclD1
 oYOpGwEtDN9NwVa5D+c996dM8I9uoLTsHcrCf13Gu/wwwU6ChTF+08j4XVCCaYWAShBr
 Y+h4LetBabVhX9ZbahcKr+cwb8x7JMUgpgELVlwn0S43YZwdOSRbe7aJ7FjUGyksYBS1
 17he77sWuzJJ2qiir5wpo3nUTzK1908b9Sb8wYBbHAHeuBcXu1NTdNOI9tDSHjz7HRsk
 fPPw==
X-Gm-Message-State: AOJu0YzDaX6TG9pQyRxKDDE7sFJYB7/IuC/DDZk+YjjW3rykUWV4n31k
 u1X/Y1po9Ai3h3q6wYDcAnuCsQ==
X-Google-Smtp-Source: AGHT+IFKAMynRfi6DV0Hhz/Q3IivWGk2CXFvnITXxCeyCoIiSskynGowR8ceuFajX33IL8L5isZ+gw==
X-Received: by 2002:a17:903:26c2:b0:1bd:ed26:d2c6 with SMTP id
 jg2-20020a17090326c200b001bded26d2c6mr3415781plb.4.1692243015363; 
 Wed, 16 Aug 2023 20:30:15 -0700 (PDT)
Received: from sunil-laptop ([106.51.83.242]) by smtp.gmail.com with ESMTPSA id
 u15-20020a170902e5cf00b001b9d335223csm13860130plf.26.2023.08.16.20.30.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 20:30:14 -0700 (PDT)
Date: Thu, 17 Aug 2023 09:00:07 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH 01/10] hw/arm/virt-acpi-build.c: Move fw_cfg and virtio
 to common location
Message-ID: <ZN2UPwkpXez+uwMj@sunil-laptop>
References: <20230712163943.98994-1-sunilvl@ventanamicro.com>
 <20230712163943.98994-2-sunilvl@ventanamicro.com>
 <20230724171859.212fec62@imammedo.users.ipa.redhat.com>
 <ZL/9XO47yEnaNzyN@sunil-laptop>
 <20230726102546.1cad6113@imammedo.users.ipa.redhat.com>
 <badc96bf-821e-d769-ac40-39600f543e86@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <badc96bf-821e-d769-ac40-39600f543e86@ventanamicro.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Wed, Aug 16, 2023 at 03:51:58PM -0300, Daniel Henrique Barboza wrote:
>=20
>=20
> On 7/26/23 05:25, Igor Mammedov wrote:
> > On Tue, 25 Jul 2023 22:20:36 +0530
> > Sunil V L <sunilvl@ventanamicro.com> wrote:
> >=20
> > > On Mon, Jul 24, 2023 at 05:18:59PM +0200, Igor Mammedov wrote:
> > > > On Wed, 12 Jul 2023 22:09:34 +0530
> > > > Sunil V L <sunilvl@ventanamicro.com> wrote:
> > > > > The functions which add fw_cfg and virtio to DSDT are same for ARM
> > > > > and RISC-V. So, instead of duplicating in RISC-V, move them from
> > > > > hw/arm/virt-acpi-build.c to common aml-build.c.
> > > > >=20
> > > > > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > > > > ---
> > > > >   hw/acpi/aml-build.c         | 41 ++++++++++++++++++++++++++++++=
++++++
> > > > >   hw/arm/virt-acpi-build.c    | 42 ------------------------------=
-------
> > > > >   hw/riscv/virt-acpi-build.c  | 16 --------------
> > > > >   include/hw/acpi/aml-build.h |  6 ++++++
> > > > >   4 files changed, 47 insertions(+), 58 deletions(-)
> > > > >=20
> > > > > diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> > > >=20
> > > > patch looks fine modulo,
> > > > I'd put these into respective device files instead of generic
> > > > aml-build.c which was intended for basic AML primitives
> > > > (it 's got polluted over time with device specific functions
> > > > but that's not the reason to continue doing that).
> > > >=20
> > > > Also having those functions along with devices models
> > > > goes along with self enumerating ACPI devices (currently
> > > > it works for x86 PCI/ISA device but there is no reason
> > > > that it can't work with other types as well when
> > > > I get there)
> > > Thanks!, Igor. Let me add them to device specific files as per your
> > > recommendation.
> > just be careful and build test other targets (while disabling the rest)
> > at least no to regress them due to build deps. (I'd pick 2 with ACPI
> > support that use and not uses affected code) and 1 that  uses device
> > model but doesn't use ACPI at all (if such exists)
>=20
> Sunil is already aware of it but I'll also mention here since it seems re=
levant
> to Igor's point.
>=20
Thanks! Daniel. Yes, I am aware of the issue and will fix it along with
Igor's suggestion. I need to fix this irrespective of the approach.

Thanks,
Sunil
>=20
> This patch breaks i386-softmmu build:
>=20
>=20
> FAILED: libqemu-i386-softmmu.fa.p/hw_i386_acpi-microvm.c.o
> cc -m64 -mcx16 -Ilibqemu-i386-softmmu.fa.p -I. -I.. -Itarget/i386 -I../ta=
rget/i386 -Iqapi -Itrace -Iui -Iui/shader -I/usr/include/pixman-1 -I/usr/in=
clude/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/include/sysprof-4 -fdia=
gnostics-color=3Dauto -Wall -Winvalid-pch -Werror -std=3Dgnu11 -O2 -g -fsta=
ck-protector-strong -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=3D2 -Wundef -Wwrite=
-strings -Wmissing-prototypes -Wstrict-prototypes -Wredundant-decls -Wold-s=
tyle-declaration -Wold-style-definition -Wtype-limits -Wformat-security -Wf=
ormat-y2k -Winit-self -Wignored-qualifiers -Wempty-body -Wnested-externs -W=
endif-labels -Wexpansion-to-defined -Wimplicit-fallthrough=3D2 -Wmissing-fo=
rmat-attribute -Wno-missing-include-dirs -Wno-shift-negative-value -Wno-psa=
bi -isystem /home/danielhb/work/qemu/linux-headers -isystem linux-headers -=
iquote . -iquote /home/danielhb/work/qemu -iquote /home/danielhb/work/qemu/=
include -iquote /home/danielhb/work/qemu/host/include/x86_64 -iquote /home/=
danielhb/work/qemu/host/include/generic -iquote /home/danielhb/work/qemu/tc=
g/i386 -pthread -D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE =
-fno-strict-aliasing -fno-common -fwrapv -fPIE -isystem../linux-headers -is=
ystemlinux-headers -DNEED_CPU_H '-DCONFIG_TARGET=3D"i386-softmmu-config-tar=
get.h"' '-DCONFIG_DEVICES=3D"i386-softmmu-config-devices.h"' -MD -MQ libqem=
u-i386-softmmu.fa.p/hw_i386_acpi-microvm.c.o -MF libqemu-i386-softmmu.fa.p/=
hw_i386_acpi-microvm.c.o.d -o libqemu-i386-softmmu.fa.p/hw_i386_acpi-microv=
m.c.o -c ../hw/i386/acpi-microvm.c
> ../hw/i386/acpi-microvm.c:48:13: error: conflicting types for =E2=80=98ac=
pi_dsdt_add_virtio=E2=80=99; have =E2=80=98void(Aml *, MicrovmMachineState =
*)=E2=80=99
>    48 | static void acpi_dsdt_add_virtio(Aml *scope,
>       |             ^~~~~~~~~~~~~~~~~~~~
> In file included from /home/danielhb/work/qemu/include/hw/acpi/acpi_aml_i=
nterface.h:5,
>                  from ../hw/i386/acpi-microvm.c:29:
> /home/danielhb/work/qemu/include/hw/acpi/aml-build.h:503:6: note: previou=
s declaration of =E2=80=98acpi_dsdt_add_virtio=E2=80=99 with type =E2=80=98=
void(Aml *, const MemMapEntry *, uint32_t,  int)=E2=80=99 {aka =E2=80=98voi=
d(Aml *, const MemMapEntry *, unsigned int,  int)=E2=80=99}
>   503 | void acpi_dsdt_add_virtio(Aml *scope, const MemMapEntry *virtio_m=
mio_memmap,
>       |      ^~~~~~~~~~~~~~~~~~~~
> [5/714] Compiling C object libqemu-i386-softmmu.fa.p/hw_i386_kvm_clock.c.o
>=20
> This happens because the common 'acpi_dsdt_add_virtio' function matches a=
 local
> function with the same name in hw/i386/acpi-microvm.c. We would need to e=
ither
> rename the shared helper or rename the local acpi-microvm function or do =
something
> like Igor mentioned to avoid this name collision.
>=20
>=20
> Thanks,
>=20
> Daniel
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20
> >=20
> > >=20
> > > Thanks!
> > > Sunil
> > >=20
> >=20

