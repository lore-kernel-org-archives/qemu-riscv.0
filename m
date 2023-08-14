Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0360DC001DB
	for <qemu-riscv@archiver.kernel.org>; Mon, 14 Aug 2023 15:35:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qVZas-0004Dy-Qt; Mon, 14 Aug 2023 11:34:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qVZam-0004Cm-OE
 for qemu-riscv@nongnu.org; Mon, 14 Aug 2023 11:34:56 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qVZak-0004K2-6N
 for qemu-riscv@nongnu.org; Mon, 14 Aug 2023 11:34:52 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3fe4cdb727cso45442645e9.0
 for <qemu-riscv@nongnu.org>; Mon, 14 Aug 2023 08:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692027288; x=1692632088;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f4wrOsVR1IYr28e2rGLXssLRPSZYCC8zvYvmEmn+J2M=;
 b=J1rMyRCCbo1b+x9BG7rlcDjxtlK/iRM8IdMSHVeyNgzGBNMpojQGU996AVxn2gu2j1
 xKtz6PpfP/TBDomo7tSivaX/ouwCvrCKHdYszoA7ZcXf0h/HgpN7Ys7vSy3oqfZBpSaK
 txdeg/hDvSjxY0oJGptdAFwjwP4p5c+Z/xL3Hu2rUvobTDgG7llqfPbymxrxPhrwLA3v
 BgXCQ+0n/+dn3rlD5odhYrNWaoQZxK6WuVhm2Nx+2uhMX7UHxoWDufqEHpuBDotuNRPB
 IJfCsBQEXdcoVmK39PBJ6ZHy72deCu67IDCpum8oWOUDsW0F3c0YNhchp/GjqaWQwNUg
 3P/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692027288; x=1692632088;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=f4wrOsVR1IYr28e2rGLXssLRPSZYCC8zvYvmEmn+J2M=;
 b=BvhO6rG2NWMJ5EAQSusTjA6PLG/yghmvEaPqdqarHnm8X68HPLYSgo/NmKjYITXCEj
 656XKquj9C9pnL+EfcyhEexrS229gG0oIhK5EipSIrVOT5NMZkGpD42jcsw+idxRqrJ7
 TonF+QHtrLEIwT5yhXIFPxv+SAXuBkmhD6w6UouPKSFU3F2T/be7+Ew1tNQFcUL2c2Pz
 ay0R1Ex4XT5cmfCFJiyGf+n8GrD2jRBZ8LYnh8LCzrr5lFfB2Pt6MIa6G68HP8ubaBuH
 OGvwgxqOWQ7rbIT+hjtL6SWQbFSMKmPZ0uc8wfgZ+2RAEEHynX/ck2g4QhvYLyKehPyy
 Mb0Q==
X-Gm-Message-State: AOJu0YyvkriCJMgVBE1slMwWjx9i8DvCTXeuEhmlI9g0YqVQ6m44aebv
 UQoFqfeDt3Ss3Z3kBhLD9NOy4g==
X-Google-Smtp-Source: AGHT+IH0kTI13oPE4lub7MbgHrieqPfFd8Ev/4y/qzoT6sHfrOZCGD+Yz1M21biYe5PzGfUKwci/VQ==
X-Received: by 2002:a7b:c449:0:b0:3f8:fc96:6bfd with SMTP id
 l9-20020a7bc449000000b003f8fc966bfdmr8217988wmi.17.1692027288076; 
 Mon, 14 Aug 2023 08:34:48 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 h18-20020a1ccc12000000b003fbd9e390e1sm17767620wmb.47.2023.08.14.08.34.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Aug 2023 08:34:47 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 19B5F1FFBB;
 Mon, 14 Aug 2023 16:34:47 +0100 (BST)
References: <20230731084354.115015-1-akihiko.odaki@daynix.com>
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
Subject: Re: [RFC PATCH 00/24] plugins: Allow to read registers
Date: Mon, 14 Aug 2023 16:27:46 +0100
In-reply-to: <20230731084354.115015-1-akihiko.odaki@daynix.com>
Message-ID: <87leedprhl.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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

> I and other people in the University of Tokyo, where I research processor
> design, found TCG plugins are very useful for processor design
> exploration.

Thanks for the submission - I've finished my initial review pass.

I think introducing register introspection into the plugins subsystem is
a very worthwhile addition. I'm also happy (for now) to use the
underlying gdb support for it in lieu of a greater refactoring of QEMU's
multiple register introspection features.

> The feature we find missing is the capability to read registers from
> plugins. In this series, I propose to add such a capability by reusing
> gdbstub code.
>
> The reuse of gdbstub code ensures the long-term stability of the TCG plug=
in
> interface for register access without incurring a burden to maintain yet
> another interface for register access.

However I don't want to expose the gdb detail to plugins to leave us a
free hand in further internal clean-ups later on.

> This process to add TCG plugin involves four major changes. The first one
> is to add GDBFeature structure that represents a GDB feature, which usual=
ly
> includes registers. GDBFeature can be generated from static XML files or
> dynamically generated by architecture-specific code. In fact, this is a
> refactoring independent of the feature this series adds, and potentially
> it's benefitial even without the plugin feature. The plugin feature will
> utilize this new structure to describe registers exposed to plugins.

I think we can get cleanups to this handling in ahead of the wider
plugin feature. Ideally it would be nice to push the XML generation into
gdbstub itself but that might be more of a refactor than you are willing
to pursue for the time being.

> The second one is to make gdb_read_register/gdb_write_register usable
> outside of gdbstub context.
>
> The third one is to actually make registers readable for plugins.

Modulo isolating the plugin API from gdb specifics I'm happy with this
approach.

> The last one is to allow to implement a QEMU plugin in C++. A plugin that
> I'll describe later is written in C++.

I would want a more compelling reason that a hello world plugin for
this. Only because QEMU has removed a bunch of C++ dependency over the
last few years so I don't think we are in a rush to re-introduce it.=20

Are you OK to do a re-spin addressing the comments so far?

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

