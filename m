Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C587EE7FF4
	for <qemu-riscv@archiver.kernel.org>; Mon, 11 Sep 2023 10:55:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qfeZg-0000gT-KS; Mon, 11 Sep 2023 06:55:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1qfeZc-0000fC-6c
 for qemu-riscv@nongnu.org; Mon, 11 Sep 2023 06:55:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1qfeZZ-0000rS-Jc
 for qemu-riscv@nongnu.org; Mon, 11 Sep 2023 06:55:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694429716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rpj3vXkLNCBkhNcQhbef3qMsGqpi6zFgSDgCgf2BD+A=;
 b=iBSxLF/1gsdcxX5mQCVDw5/4YOZgeUS0J4bFeS9Umx+tHV7f8H3BN77axOF8FEC2LLzEHY
 xGhVqSH4kl3RiH/hQA0RtAEwb9wgKFVeK93yEWGe/DCt8hKOGMsuG43FP69DdXUAcxlayV
 U6EX81zwmQzEgv2lNekrZXnXyKVneLk=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-256-tA00a21qMZSa7yxeMR7Ysg-1; Mon, 11 Sep 2023 06:55:15 -0400
X-MC-Unique: tA00a21qMZSa7yxeMR7Ysg-1
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-501c7c4059aso4418961e87.1
 for <qemu-riscv@nongnu.org>; Mon, 11 Sep 2023 03:55:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694429714; x=1695034514;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kYXAmuCRsdrg8DQks9+o3qAzQpABt14mLc8Pw/UEPw0=;
 b=K9MPQp1bDsRsjQ8W65S3gmi4La2K5Jwe8wR97P1YNfzndrM5gUMCZweb0Y3VbaOsLt
 67bGH/fs7z+uq0Dvn3qpyakee1sz1IqzC+qkZmsEQ3iz+MAaoVGhzzmxhLHYOBmKbrxQ
 QVxXUOQfTlFDYn2kRfK/66LhstMySutS9ZS1yOufoDsImxICK4LF+4Op0UXS6AvMVFn+
 eyZSkaa79YBzpCvmcEITRAbMsQZD9MCn9SQNiIVY0kMmsY0PZn5UO8hk3DycnckUzl4f
 aCuGKJr4C8+awN1zUnDxwwqqNvcph/tozF3IwYxHC9+nRTgxmbtQpjQSc7jzfK7GX0Ku
 lV3A==
X-Gm-Message-State: AOJu0YyqZzIxb3DXiO1MUJci0otLqpASaYv0OkhZyvo0fsF/QgDB/UdI
 ViXGlFLvLfrgBQDVvkxje4VpMnQ0tjdtCt3RQDwEiNxuyXLiMpfFrWfJUBd166CP8Rd6DUre7PO
 LZYn0sUFKtzmMmtY=
X-Received: by 2002:a05:6512:3f12:b0:500:bf33:3add with SMTP id
 y18-20020a0565123f1200b00500bf333addmr8926640lfa.47.1694429714014; 
 Mon, 11 Sep 2023 03:55:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGaocsmAB7r6E3mKjo+F1xrAATL9Xy0zux+AjBqK5iBt4zhAHPogaaos6jTOrk/CDfus4hPug==
X-Received: by 2002:a05:6512:3f12:b0:500:bf33:3add with SMTP id
 y18-20020a0565123f1200b00500bf333addmr8926592lfa.47.1694429713633; 
 Mon, 11 Sep 2023 03:55:13 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id
 lz5-20020a170906fb0500b0098e78ff1a87sm5150410ejb.120.2023.09.11.03.55.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Sep 2023 03:55:12 -0700 (PDT)
Date: Mon, 11 Sep 2023 12:55:10 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>
Cc: Gavin Shan <gshan@redhat.com>, qemu-devel@nongnu.org, David Hildenbrand
 <david@redhat.com>, Chris Wulff <crwulff@gmail.com>, David Gibson
 <david@gibson.dropbear.id.au>, qemu-s390x@nongnu.org, Weiwei Li
 <liweiwei@iscas.ac.cn>, qemu-arm@nongnu.org, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Richard Henderson
 <richard.henderson@linaro.org>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, Nicholas
 Piggin <npiggin@gmail.com>, Eduardo Habkost <eduardo@habkost.net>, Ilya
 Leoshkevich <iii@linux.ibm.com>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, Greg Kurz <groug@kaod.org>, "Edgar E.
 Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org, Daniel Henrique
 Barboza <dbarboza@ventanamicro.com>, Marek Vasut <marex@denx.de>, Palmer
 Dabbelt <palmer@dabbelt.com>, Michael Rolnik <mrolnik@gmail.com>, Laurent
 Vivier <laurent@vivier.eu>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-riscv@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>, Bin Meng
 <bin.meng@windriver.com>, Xiaojuan Yang <yangxiaojuan@loongson.cn>, Daniel
 Henrique Barboza <danielhb413@gmail.com>, Aleksandar Rikalo
 <aleksandar.rikalo@syrmia.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Song Gao <gaosong@loongson.cn>, Stafford Horne <shorne@gmail.com>, Yanan
 Wang <wangyanan55@huawei.com>, Alistair Francis <alistair.francis@wdc.com>,
 Brian Cain <bcain@quicinc.com>, =?UTF-8?B?Q8OpZHJpYw==?= Le Goater
 <clg@kaod.org>, Thomas Huth <thuth@redhat.com>, Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>
Subject: Re: [PATCH 3/4] hw/cpu: Introduce CPUClass::cpu_resolving_type field
Message-ID: <20230911125510.52bc27d1@imammedo.users.ipa.redhat.com>
In-Reply-To: <af78b6c9-14e5-3256-9670-c106f4942140@linaro.org>
References: <20230908112235.75914-1-philmd@linaro.org>
 <20230908112235.75914-4-philmd@linaro.org>
 <87cb0174-c652-aa44-be7c-49e78e0a5003@redhat.com>
 <af78b6c9-14e5-3256-9670-c106f4942140@linaro.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, 11 Sep 2023 11:43:00 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:

> On 11/9/23 01:28, Gavin Shan wrote:
> > Hi Philippe,
> >=20
> > On 9/8/23 21:22, Philippe Mathieu-Daud=C3=A9 wrote: =20
> >> Add a field to return the QOM type name of a CPU class.
> >>
> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> >> ---
> >> =C2=A0 include/hw/core/cpu.h=C2=A0=C2=A0 | 2 ++
> >> =C2=A0 hw/core/cpu-common.c=C2=A0=C2=A0=C2=A0 | 2 +-
> >> =C2=A0 target/alpha/cpu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> >> =C2=A0 target/arm/cpu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 =
+
> >> =C2=A0 target/avr/cpu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 =
+
> >> =C2=A0 target/cris/cpu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> >> =C2=A0 target/hexagon/cpu.c=C2=A0=C2=A0=C2=A0 | 1 +
> >> =C2=A0 target/hppa/cpu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> >> =C2=A0 target/i386/cpu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> >> =C2=A0 target/loongarch/cpu.c=C2=A0 | 1 +
> >> =C2=A0 target/m68k/cpu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> >> =C2=A0 target/microblaze/cpu.c | 1 +
> >> =C2=A0 target/mips/cpu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> >> =C2=A0 target/nios2/cpu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> >> =C2=A0 target/openrisc/cpu.c=C2=A0=C2=A0 | 1 +
> >> =C2=A0 target/ppc/cpu_init.c=C2=A0=C2=A0 | 1 +
> >> =C2=A0 target/riscv/cpu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> >> =C2=A0 target/rx/cpu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 1 +
> >> =C2=A0 target/s390x/cpu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> >> =C2=A0 target/sh4/cpu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 =
+
> >> =C2=A0 target/sparc/cpu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> >> =C2=A0 target/tricore/cpu.c=C2=A0=C2=A0=C2=A0 | 1 +
> >> =C2=A0 target/xtensa/cpu.c=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> >> =C2=A0 23 files changed, 24 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> >> index 129d179937..e469efd409 100644
> >> --- a/include/hw/core/cpu.h
> >> +++ b/include/hw/core/cpu.h
> >> @@ -100,6 +100,7 @@ struct SysemuCPUOps;
> >> =C2=A0 /**
> >> =C2=A0=C2=A0 * CPUClass:
> >> + * @cpu_resolving_type: CPU QOM type name
> >> =C2=A0=C2=A0 * @class_by_name: Callback to map -cpu command line model=
 name to an
> >> =C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 instantiatable CPU type.
> >> =C2=A0=C2=A0 * @parse_features: Callback to parse command line argumen=
ts.
> >> @@ -148,6 +149,7 @@ struct CPUClass {
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DeviceClass parent_class;
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*< public >*/
> >> +=C2=A0=C2=A0=C2=A0 const char *cpu_resolving_type;
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ObjectClass *(*class_by_name)(const cha=
r *cpu_model);
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*parse_features)(const char *type=
name, char *str, Error=20
> >> **errp); =20
> >=20
> > The question is why not use CPU_RESOLVING_TYPE directly? It seems=20
> > CPU_RESOLVING_TYPE
> > is exactly what you want here. =20
>=20
> Unfortunately CPU_RESOLVING_TYPE is target-specific, we want
> hw/core/cpu-common.c to be target-agnostic (build once for all
> targets). This is particularly important in the context of
> heterogeneous QEMU, where a single binary will be able to create
> CPUs from different targets.

Well cpu model resolving ain't going to work with heterogeneous env.
But otherwise it's argument towards dropping CPU model and use
cpu types directly (then we can get rid all this resolving nonsense).

Though for Gavin's purposes, given existing cpu type naming convention
it's sufficient to just cut of the last 2 '-' from typename to get
cpumodel (target independent and no need for resolving type).=20


>=20
> > Besides, I guess the changes can be=20
> > squeezed into two
> > patches (commits) as below:
> >=20
> > PATCH[1] target/alpha: Tidy up alpha_cpu_class_by_name()
> > PATCH[2] Move the checks (oc =3D=3D NULL || object_class_is_abstract() =
||=20
> > !object_class_dynamic_cast())
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from individual targe=
ts to=20
> > hw/core/cpu-common.c::cpu_class_by_name()
> >=20
> > I rebase my series of '[PATCH v3 00/32] Unified CPU type check' on top=
=20
> > of yours. Please
> > let me know if I need to include your patch into my v4 series for=20
> > review. In that case,
> > I can include your patches with above changes applied.
> >=20
> > Thanks,
> > Gavin
> >  =20
> >> diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
> >> index c6a0c9390c..2d24261a6a 100644
> >> --- a/hw/core/cpu-common.c
> >> +++ b/hw/core/cpu-common.c
> >> @@ -155,7 +155,7 @@ ObjectClass *cpu_class_by_name(const char=20
> >> *typename, const char *cpu_model)
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 assert(cpu_model);
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 oc =3D object_class_by_name(typename);
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cc =3D CPU_CLASS(oc);
> >> -=C2=A0=C2=A0=C2=A0 assert(cc->class_by_name);
> >> +=C2=A0=C2=A0=C2=A0 assert(cc->cpu_resolving_type && cc->class_by_name=
);
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 oc =3D cc->class_by_name(cpu_model);
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (oc =3D=3D NULL || object_class_is_a=
bstract(oc)) {
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NULL; =
=20
>=20
>=20


