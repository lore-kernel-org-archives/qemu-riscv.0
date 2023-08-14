Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26775C10F1A
	for <qemu-riscv@archiver.kernel.org>; Mon, 14 Aug 2023 11:57:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qVWC9-0007Nh-7S; Mon, 14 Aug 2023 07:57:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qVWC7-0007Lu-H8
 for qemu-riscv@nongnu.org; Mon, 14 Aug 2023 07:57:11 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qVWC4-00006T-P0
 for qemu-riscv@nongnu.org; Mon, 14 Aug 2023 07:57:11 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3fe5695b180so37932335e9.2
 for <qemu-riscv@nongnu.org>; Mon, 14 Aug 2023 04:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692014227; x=1692619027;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RapFB08NRw3liAGm5BCvJ4FzoIfRnC+vfELaP/SRV98=;
 b=ETdIm6oGbLcqEsHe4FN8Zonk3xe471L1lYmB/OiBNzU7hv6o/hJhrXrlpji470dOLy
 BJHHB3B4UAfjnlAUwUyQibnX2T7Yp6pjJZBp8YHsOQEgncl46RzyWwbgDgbRHEJUB9nV
 jzJMpqsLpm21PtPI5WMLKELiXNedaK2tp8C2L6U1yB/mqyEHaZ/e8/7W59KPDeUDOLC9
 8i4kHI9BQ0IbgOe34H+w+1qkMorv1P7C0KT6iZN1adPf5rESzFcykW18P4vHHv5eqDm7
 dD/weOC8zj+ZgSLOWuyAVWGDYYmuUOYGAhyU+JT//i8gXXuDA8Bnc5yGtboSo/1r2WTe
 u4rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692014227; x=1692619027;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=RapFB08NRw3liAGm5BCvJ4FzoIfRnC+vfELaP/SRV98=;
 b=VWMyWgGq1aaGaP2V7ax33cnUptipi8Lzb/fVyZAT/Jx+ABeiKAxevv2pBUcknmpnLo
 V4vi/+xDR7q7CvbIm2ZjA8rGNmNImRj4pqqC2ecls+j7YyvteF6ZT/dNHZitHfY8BPZR
 nQ6oZuTtBLQaQJMmN+l53rybrc5OpLFME0feyrNbv2IklUDs1yopMsNuxhmA3sFNdTxO
 yTz+gBPjTzInMOSonX3wElwJy8+4F1Riq/fxE50qqypBEfUwmZ65HwCc5xWoH60BHdOy
 HTwCpP4GLq8awWzuBtZbyWc9uMbt4mS/2sOnLoKNt4f17NomA+L92vpTQ89gA5+8ktrx
 oz5Q==
X-Gm-Message-State: AOJu0YwAbgtu+GdGPHi1tx5x1r/ZBa0ADKUv3jZ3JGzUhgiPyBkpufi5
 JbeEuv7zPU9yzInCPzkG5OEygg==
X-Google-Smtp-Source: AGHT+IHMkXvW5Y6pUhQtcqSExZsCq2jcLbmqRfzXgCJMjsloQHXZbiRKNXCTZNHZqx/T21Uv3apPEw==
X-Received: by 2002:a1c:7c05:0:b0:3f8:fc2a:c7eb with SMTP id
 x5-20020a1c7c05000000b003f8fc2ac7ebmr7009053wmc.5.1692014226820; 
 Mon, 14 Aug 2023 04:57:06 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 v14-20020a1cf70e000000b003fe24441e23sm14095038wmh.24.2023.08.14.04.57.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Aug 2023 04:57:06 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 052581FFBB;
 Mon, 14 Aug 2023 12:57:06 +0100 (BST)
References: <20230731084354.115015-1-akihiko.odaki@daynix.com>
 <20230731084354.115015-5-akihiko.odaki@daynix.com>
User-agent: mu4e 1.11.14; emacs 29.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, Eduardo Habkost <eduardo@habkost.net>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Philippe =?utf-8?Q?Mathieu-Daud?=
 =?utf-8?Q?=C3=A9?=
 <philmd@linaro.org>, Yanan Wang <wangyanan55@huawei.com>, Richard
 Henderson <richard.henderson@linaro.org>, =?utf-8?Q?Marc-Andr=C3=A9?=
 Lureau <marcandre.lureau@redhat.com>, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>, Peter
 Maydell <peter.maydell@linaro.org>, Michael Rolnik <mrolnik@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Brian Cain
 <bcain@quicinc.com>, Song Gao <gaosong@loongson.cn>, Xiaojuan Yang
 <yangxiaojuan@loongson.cn>, Laurent Vivier <laurent@vivier.eu>, Aurelien
 Jarno <aurelien@aurel32.net>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Chris Wulff
 <crwulff@gmail.com>, Marek Vasut <marex@denx.de>, Stafford Horne
 <shorne@gmail.com>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, David Gibson
 <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>, Nicholas Piggin
 <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis
 <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>, Weiwei Li
 <liweiwei@iscas.ac.cn>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, David Hildenbrand
 <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, Max Filippov
 <jcmvbkbc@gmail.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: Re: [RFC PATCH 04/24] gdbstub: Introduce gdb_find_static_feature()
Date: Mon, 14 Aug 2023 12:56:38 +0100
In-reply-to: <20230731084354.115015-5-akihiko.odaki@daynix.com>
Message-ID: <878radsupa.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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


Akihiko Odaki <akihiko.odaki@daynix.com> writes:

> This function is useful to determine the number of registers exposed to
> GDB from the XML name.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>  include/exec/gdbstub.h |  2 ++
>  gdbstub/gdbstub.c      | 13 +++++++++++++
>  2 files changed, 15 insertions(+)
>
> diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
> index 22e5add5b1..3115dc21c0 100644
> --- a/include/exec/gdbstub.h
> +++ b/include/exec/gdbstub.h
> @@ -34,6 +34,8 @@ void gdb_register_coprocessor(CPUState *cpu,
>   */
>  int gdbserver_start(const char *port_or_device);
>=20=20
> +const GDBFeature *gdb_find_static_feature(const char *xmlname);
> +
>  void gdb_set_stop_cpu(CPUState *cpu);
>=20=20
>  /**
> diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
> index fad70200d8..6d9cef5b95 100644
> --- a/gdbstub/gdbstub.c
> +++ b/gdbstub/gdbstub.c
> @@ -414,6 +414,19 @@ static const char *get_feature_xml(const char *p, co=
nst char **newp,
>      return name ? gdb_features[i].xml : NULL;
>  }
>=20=20
> +const GDBFeature *gdb_find_static_feature(const char *xmlname)
> +{
> +    const GDBFeature *feature;
> +
> +    for (feature =3D gdb_features; feature->xmlname; feature++) {
> +        if (!strcmp(feature->xmlname, xmlname)) {

I'd prefer g_strcmp0(feature->xmlname, xmlname) =3D=3D 0 but either way:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

