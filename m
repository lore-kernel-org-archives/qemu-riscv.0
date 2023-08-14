Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFE19C001DB
	for <qemu-riscv@archiver.kernel.org>; Mon, 14 Aug 2023 11:34:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qVVpT-0002Hn-7g; Mon, 14 Aug 2023 07:33:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qVVpR-0002DZ-Nb
 for qemu-riscv@nongnu.org; Mon, 14 Aug 2023 07:33:45 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qVVpN-0002hu-8r
 for qemu-riscv@nongnu.org; Mon, 14 Aug 2023 07:33:45 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3fe4ad22eb0so41324025e9.3
 for <qemu-riscv@nongnu.org>; Mon, 14 Aug 2023 04:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692012819; x=1692617619;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XEAMLvLm/QGafb1baWyDmF4nCxSk4CBVzHW3q+MmcBs=;
 b=v54GtK1RJXF/m86pofd/o4jEIVlxz93s/8eHwvrzWGJlHEFyfmvAVmj9sHqsXpbpXk
 6zu0mMJK6rFiwzLT55dNkwMOk1hkFR7VE6vbFA7btJE0Wlv83LGFuR6q+xlbdehQMGtR
 GqPY+ULIP2B1aOnxNrcExzgSxDa0Lulrac+ZLd2v1gHJl3da0hX5P0dtXXgAwG8LpK3C
 MTcnktBsE3CJvRbfch4YjdG0FCy+u9wrVPwlKkJtpvMVjTGCtKQxC3UeSnvFgldwf8AA
 aD5Gmqyczp3Qv50uR2QSTWkcPBJNvhTKJV9CPHh7owam80eexkvWMU5Vtjz4a6kGFHLE
 d1QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692012819; x=1692617619;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=XEAMLvLm/QGafb1baWyDmF4nCxSk4CBVzHW3q+MmcBs=;
 b=f0CxE0Mb4V0DrS2/tQzbnSgC/eZiuoFOIrGyaBLB34NUhpIEMyBvVfD5n10QX0JzQZ
 wuEAyZVtSgh5OEoDnI6ep/ebOZ2AaWe12tAp7e1pMfXeoLbhCwXvVXtImzqFIF4tDyHm
 2RgL9fB05/MG275lGcFkqhavjNVt6xLTfOsnmLxFi6gTniQHsAxuNNDiV45mKGOyG/e6
 pledgBtZpghzu4msadbLuC9gwdlXmbQOoKP4wrPEc4vAdCDF5i3IysshpJvDy8k9gB0L
 jCE9x7ULuNCLRmGcLveE/ND59o7m47+EJH6SmS03mMIKjpVb+BfLx0Vxi8BG1/T7wLeV
 Dxkw==
X-Gm-Message-State: AOJu0YzQv/FKz1n4SwgF4KEHLRR+T/d2Mq6CYZmIvPBbytT+EUrQMG+6
 m4884JKNuAQRDUNJoSYt3iBfVA==
X-Google-Smtp-Source: AGHT+IHLFtAyBhJ6WE/UHd6BT/WzSJU/T1peIDJ+zjhYCSL1p6elo7duHN4RCAGeGMik2cL2GKLRRg==
X-Received: by 2002:a7b:c445:0:b0:3f7:4961:52ad with SMTP id
 l5-20020a7bc445000000b003f7496152admr7197217wmi.3.1692012818941; 
 Mon, 14 Aug 2023 04:33:38 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 q11-20020adff94b000000b00317c742ca9asm13915811wrr.43.2023.08.14.04.33.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Aug 2023 04:33:38 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1CE8F1FFBB;
 Mon, 14 Aug 2023 12:33:38 +0100 (BST)
References: <20230731084354.115015-1-akihiko.odaki@daynix.com>
 <20230731084354.115015-3-akihiko.odaki@daynix.com>
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
Subject: Re: [RFC PATCH 02/24] gdbstub: Introduce GDBFeature structure
Date: Mon, 14 Aug 2023 12:33:17 +0100
In-reply-to: <20230731084354.115015-3-akihiko.odaki@daynix.com>
Message-ID: <87h6p1svsd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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

> Before this change, the information from a XML file was stored in an
> array that is not descriptive. Introduce a dedicated structure type to
> make it easier to understand and to extend with more fields.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>

with Phillipe's suggested updates:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

