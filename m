Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 793F2C001DB
	for <qemu-riscv@archiver.kernel.org>; Mon, 14 Aug 2023 15:26:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qVZSq-0001hV-UL; Mon, 14 Aug 2023 11:26:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qVZSp-0001h8-CV
 for qemu-riscv@nongnu.org; Mon, 14 Aug 2023 11:26:39 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qVZSn-0002v2-MU
 for qemu-riscv@nongnu.org; Mon, 14 Aug 2023 11:26:39 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3fe1e1142caso44136025e9.0
 for <qemu-riscv@nongnu.org>; Mon, 14 Aug 2023 08:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692026796; x=1692631596;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9O05BxKyDrr7bmrS0J4Smir2XTDQKVk17AzYT+PHKcg=;
 b=nAj2wmH66hwiTXu3XlGIl4MP2VlzYIUdjc043fZgFaUhIq4im2OgOMcFv2V7nUvd0f
 VG1br+/o2gXFuBBO15tdOIxccvCl0o6REN80F2UoDSV+AjWgq2ZdeICd4APpBHH/6cpf
 N+2+BSQohIGnN9ypMP6gfsmKOqL9cAlSKVAeiJ+pNYkBcgWlABxkgwI8Pywha3ibd1l2
 1BR9DAsS4Aj5oQFmiQ29I1Pl+EhqSGmkgEPdRha4dVC9Civ9AULn4VFm0t0kTRMJ8t2d
 f0IOJn31iJKQ1srbFprlbRbMz8JR2r9hICdkKzsWY20Nf+lcmRzD594pSIrhj9OjIv2w
 FTcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692026796; x=1692631596;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9O05BxKyDrr7bmrS0J4Smir2XTDQKVk17AzYT+PHKcg=;
 b=Dlfx0pc4sQWdvG1TrIu1TO7wRNpdcuUGh+E+9IZDCXlreGEb+78sBeekhcnEawBCPb
 D1W/dvK5mBLoe9SMVU8qQn3wLIzW+b2HYnzvzbnCrGXjCf2yQJw6X54m7/5Z5qvvQPZy
 c5/UOlBVk7DRRkCDBMUj0Ctv6c4HDlQI6LWgndCz1VEdLpjceLJYeGlYBv3liWrDWk/b
 4FWkkpdPP147Lm6ODGVU95MRDezNNVU2U0/pCN/f3UP5skn4qCz1Y1lrNr4TF112/jyM
 DIiN7C5eacgvLPSd7wzv0WmiibHLYjVPwWN8XOPsDOk5K+WDh+inUWRmAp6W+0cxeKwH
 GbWw==
X-Gm-Message-State: AOJu0YyUne7DcEHWkzAdkWQi4aZ2IgW/hotAKr/wp/VnWJnMFJZGBJSS
 q6hBskwc2mcsHLxxKvAfMHR8kg==
X-Google-Smtp-Source: AGHT+IE9dFZ39pFs+Ru+tBeEEvBHr++LNUbGuoSTPSjUwOiBmLwgtFz7FfC9hjl1L5EnG4J+WQvKSw==
X-Received: by 2002:a7b:c4d0:0:b0:3fe:173e:4a54 with SMTP id
 g16-20020a7bc4d0000000b003fe173e4a54mr8163211wmk.17.1692026796170; 
 Mon, 14 Aug 2023 08:26:36 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 k1-20020a05600c0b4100b003fbb5506e54sm14644302wmr.29.2023.08.14.08.26.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Aug 2023 08:26:35 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 648451FFBB;
 Mon, 14 Aug 2023 16:26:35 +0100 (BST)
References: <20230731084354.115015-1-akihiko.odaki@daynix.com>
 <20230731084354.115015-25-akihiko.odaki@daynix.com>
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
Subject: Re: [RFC PATCH 24/24] contrib/plugins: Add cc plugin
Date: Mon, 14 Aug 2023 16:23:57 +0100
In-reply-to: <20230731084354.115015-25-akihiko.odaki@daynix.com>
Message-ID: <87pm3pprv8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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


Akihiko Odaki <akihiko.odaki@daynix.com> writes:

> This demonstrates how to write a plugin in C++.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>  docs/devel/tcg-plugins.rst |  8 ++++++++
>  configure                  | 15 ++++++++++++---
>  contrib/plugins/Makefile   |  5 +++++
>  contrib/plugins/cc.cc      | 15 +++++++++++++++
>  tests/tcg/Makefile.target  |  3 +++
>  5 files changed, 43 insertions(+), 3 deletions(-)
>  create mode 100644 contrib/plugins/cc.cc
>
> diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
> index c9f8b27590..0a11f8036c 100644
> --- a/docs/devel/tcg-plugins.rst
> +++ b/docs/devel/tcg-plugins.rst
> @@ -584,6 +584,14 @@ The plugin has a number of arguments, all of them ar=
e optional:
>    configuration arguments implies ``l2=3Don``.
>    (default: N =3D 2097152 (2MB), B =3D 64, A =3D 16)
>=20=20
> +- contrib/plugins/cc.cc
> +
> +cc plugin demonstrates how to write a plugin in C++. It simply outputs
> +"hello, world" to the plugin log::
> +
> +  $ qemu-system-arm $(QEMU_ARGS) \
> +    -plugin ./contrib/plugins/libcc.so -d plugin
> +

I'm going to assume this is useful because you have some out of tree C++
plugins? I'd drop the last two patches for now until there is a slightly
more compelling use case.

The C++ compiler detection moved into meson in b485458e00 (configure,
meson: move C++ compiler detection to meson.build) so I don't think
there is currently a compelling reason to bring this back into
configure.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

