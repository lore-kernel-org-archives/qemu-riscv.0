Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 240D1C001DB
	for <qemu-riscv@archiver.kernel.org>; Mon, 14 Aug 2023 13:22:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qVXWC-0007OI-IP; Mon, 14 Aug 2023 09:22:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qVXVX-0007Bz-Nb
 for qemu-riscv@nongnu.org; Mon, 14 Aug 2023 09:21:20 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qVXVV-00073r-EV
 for qemu-riscv@nongnu.org; Mon, 14 Aug 2023 09:21:19 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3fe4a89e7efso38723935e9.3
 for <qemu-riscv@nongnu.org>; Mon, 14 Aug 2023 06:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692019276; x=1692624076;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z4nJVgw3EKNj4eUFiyNtS/fu7ofeVBJbbuOt5lEFfwY=;
 b=SPtDEjQVrqfI4B3/X28mkB6k4EeJzqkL2ietC9cDXNkC20n5EuKbAM/hzo72cJtETI
 iQIwoNfa+Kno/dxZOquRxo2xMeMBKgNB7tozepw3Dv48JL4Icr+2wn9Sn1LbQ9LxgIkC
 dpp83y6zwoiCQSTvXu39Dvfk8i4dph8PKTsJHwOkTUQ6QFGgGT96B5jZhNHf/T3RCqVw
 qHCV/KtHW8CpE94Y17hs0/5BgbAkriRXSlAhH2/xbcm8Knhn+I7xpYez/fI0Q2HAi22+
 /k3ITNXkjnOzqfNDF4Mitj77zXE2q5bSWQkFVk7ILxLS9qV78jJ7q6WpiThNcMJPZZs4
 mVCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692019276; x=1692624076;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Z4nJVgw3EKNj4eUFiyNtS/fu7ofeVBJbbuOt5lEFfwY=;
 b=GOs2snurVUwOVXj5kt1MSIsPhqCH/SoK2zf+jXn2CUf4C5OxQmbK9/aLlhVRSHTo+n
 5ki+3+66Zf1KiPakaEWT6grqrLwf5/YCFJSgWmQcPNbQFMlm6/k+W4h+c4F/dzUuHv5X
 FRW7rrUyRxYZ3Sa5LeAzBm9Imyvqn/SI1fkqwLK0+I4/lYvu3g4Dbs+U9MfA5DGVhrf7
 UIGBnjja7XYnuAGthp7FtAzxxGdFAoL3v0JkBWi/HMguHw718A109d4x76lb2w+sMt/E
 4mTfgjqz8opjr1wbWZIuTb0YP7YgZuj28CEFkak9G1yEziJcDjjiEBRXBrMi7PTOep5v
 Pp/w==
X-Gm-Message-State: AOJu0YxA5kEA/tS3syl3E8MJ1T+l/5epIMdFyXYLvYG13SE4DfGRhy4W
 y/et4XGFYGRz/j1xJz9VnVUyyQ==
X-Google-Smtp-Source: AGHT+IGgreBaHMtZZun+d1o4/Q9asn7JwUVNlE4S6QMkpLLqqMWrzY9FvqUx1HsvXXmae4wsQuhbDA==
X-Received: by 2002:a1c:7c05:0:b0:3f8:fc2a:c7eb with SMTP id
 x5-20020a1c7c05000000b003f8fc2ac7ebmr7182761wmc.5.1692019275654; 
 Mon, 14 Aug 2023 06:21:15 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 q5-20020a7bce85000000b003fe17e04269sm14281629wmj.40.2023.08.14.06.21.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Aug 2023 06:21:15 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D93D21FFBB;
 Mon, 14 Aug 2023 14:21:14 +0100 (BST)
References: <20230731084354.115015-1-akihiko.odaki@daynix.com>
 <20230731084354.115015-7-akihiko.odaki@daynix.com>
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
Subject: Re: [RFC PATCH 06/24] hw/core/cpu: Replace gdb_core_xml_file with
 gdb_core_feature
Date: Mon, 14 Aug 2023 14:19:38 +0100
In-reply-to: <20230731084354.115015-7-akihiko.odaki@daynix.com>
Message-ID: <87o7j9rc8l.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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

> This is a tree-wide change to replace gdb_core_xml_file, the path to
> GDB XML file with gdb_core_feature, the pointer to GDBFeature. This
> also replaces the values assigned to gdb_num_core_regs with the
> num_regs member of GDBFeature where applicable to remove magic numbers.
>
> A following change will utilize additional information provided by
> GDBFeature to simplify XML file lookup.

re: other comment about assert(). Maybe gdb_find_static_feature() needs to =
assert
success because:

Thread 1 "qemu-loongarch6" received signal SIGSEGV, Segmentation fault.
loongarch_cpu_class_init (c=3D<optimized out>, data=3D<optimized out>) at .=
./../target/loongarch/cpu.c:726
726         cc->gdb_num_core_regs =3D cc->gdb_core_feature->num_regs;
(gdb) p/x cc->gdb_core_feature=20
$1 =3D 0x0
(gdb) l
721         cc->disas_set_info =3D loongarch_cpu_disas_set_info;
722         cc->gdb_read_register =3D loongarch_cpu_gdb_read_register;
723         cc->gdb_write_register =3D loongarch_cpu_gdb_write_register;
724         cc->disas_set_info =3D loongarch_cpu_disas_set_info;
725         cc->gdb_core_feature =3D gdb_find_static_feature("loongarch-bas=
e64.xml");
726         cc->gdb_num_core_regs =3D cc->gdb_core_feature->num_regs;
727         cc->gdb_stop_before_watchpoint =3D true;
728         cc->gdb_arch_name =3D loongarch_gdb_arch_name;
729
730     #ifdef CONFIG_TCG

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

