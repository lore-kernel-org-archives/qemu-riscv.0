Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5538DC4332F
	for <qemu-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 10:32:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r0JMh-0007DM-AT; Tue, 07 Nov 2023 05:31:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1r0JMd-00079r-2t
 for qemu-riscv@nongnu.org; Tue, 07 Nov 2023 05:31:19 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1r0JMa-0006hl-9y
 for qemu-riscv@nongnu.org; Tue, 07 Nov 2023 05:31:18 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40859c466efso39997715e9.3
 for <qemu-riscv@nongnu.org>; Tue, 07 Nov 2023 02:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699353074; x=1699957874; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ovNKojs4tcSm4Rxp81OUZlptHbEKBceYlHEM+s7x7do=;
 b=e9qAdpga46ERes/OdCiFQ/ZakRtSsdccsD9+z5Ce+IGM+XCG8+Dz455Zj20J/9WoCK
 b5q2ZStJnlbZZXSyvdHLpQvHOjXbe+7OKGmJRouQQyXIuudqIU8XKuYgZzcT7FYVDblz
 SaAP0DN6vzs+6gPdIJtPVEg84p/KJjypJKPVAnlu0S7Ru1/E1htPO9VIAgjzPkO1hxV4
 ska6OMGsKipCjsJD5/CZOk5KpZZYqMjKSIt49/QbhyswHDS2RjLVZROLYSjhQ+CzHmJY
 aNaO7rUtkwcLoEC3oyBrEepCWcSuxm/0iN4Q0SnWOueEgODxSN8af5lucrRxg3eE+4da
 HfKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699353074; x=1699957874;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ovNKojs4tcSm4Rxp81OUZlptHbEKBceYlHEM+s7x7do=;
 b=ow3KJTbZu+nB4z+3Q/nLfsOlQG4mfnwLSzOUwJd1scxm6Evl9EVhkUmBlzEsttmsrV
 jX1i+JUM2TMeiq9DYU2QL+gBrI7wGwMJ+FDPY0LgeRdpn6DpSoGC+9gyIXJcidY0KUy+
 ytUf3CrgxXL/Cl+V+DXSRgSouYO3WQBqqPrSXlfw0VK2tQiZTJLke3nNuwVbAWXOQRuZ
 b6nKrwhS9lNEnpdB+zVDUlG/LqLtqMZiXB58oT20vGWW658C0U9lxnrecHL6xBf3nIAW
 oj4BbtgbkFJrsdxzjhSCRJuljXvrgOv4mECB7iHr6wvQ9wlXFDK+O5lcTLOVniZbBIO3
 J4Ng==
X-Gm-Message-State: AOJu0YyAG/PmLM65Yg/sLh2Pt/RWfKCzyxkZfS27z3JTBZpJyiXmg7CG
 pqPeO1o1aMqo5OzYdGuOmjw1+w==
X-Google-Smtp-Source: AGHT+IE4dFgAEWqHccgIMlWYxItcyqrpDfWTANsXmcNjicQKrTLwnSFS9LjsleiIboRRuk4nyhTsAQ==
X-Received: by 2002:a05:600c:470e:b0:408:55f8:7de with SMTP id
 v14-20020a05600c470e00b0040855f807demr1947023wmo.28.1699353074392; 
 Tue, 07 Nov 2023 02:31:14 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 j19-20020a05600c191300b004090ca6d785sm15361908wmq.2.2023.11.07.02.31.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Nov 2023 02:31:13 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 5E5045F790;
 Tue,  7 Nov 2023 10:31:13 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Cc: qemu-devel@nongnu.org,  Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,  Song Gao
 <gaosong@loongson.cn>,  qemu-arm@nongnu.org,  =?utf-8?Q?Marc-Andr=C3=A9?=
 Lureau <marcandre.lureau@redhat.com>,  Wainer dos Santos Moschetta
 <wainersm@redhat.com>,  Weiwei Li <liweiwei@iscas.ac.cn>,  Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>,  Ilya Leoshkevich
 <iii@linux.ibm.com>,  Daniel Henrique Barboza <danielhb413@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,  =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@kaod.org>, Paolo Bonzini <pbonzini@redhat.com>,  David Hildenbrand
 <david@redhat.com>,  Brian Cain <bcain@quicinc.com>,  qemu-ppc@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,  qemu-riscv@nongnu.org,  Eduardo
 Habkost <eduardo@habkost.net>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,  Alistair Francis <alistair.francis@wdc.com>,  Liu
 Zhiwei <zhiwei_liu@linux.alibaba.com>,  Cleber Rosa <crosa@redhat.com>,
 qemu-s390x@nongnu.org,  Laurent Vivier <laurent@vivier.eu>,  Yoshinori
 Sato <ysato@users.sourceforge.jp>,  Nicholas Piggin <npiggin@gmail.com>,
 Thomas Huth <thuth@redhat.com>,  John Snow <jsnow@redhat.com>,  Alexandre
 Iooss <erdnaxe@crans.org>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,  Daniel Henrique Barboza
 <dbarboza@ventanamicro.com>,  Bin Meng <bin.meng@windriver.com>,  Beraldo
 Leal <bleal@redhat.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  Michael Rolnik <mrolnik@gmail.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: Re: [PATCH 17/29] gdbstub: Simplify XML lookup
In-Reply-To: <4659ec99-9b86-4c91-8ee8-116bff8b48c4@univ-grenoble-alpes.fr>
 (=?utf-8?Q?=22Fr=C3=A9d=C3=A9ric_P=C3=A9trot=22's?= message of "Tue, 7 Nov
 2023 09:46:21 +0100 (1 hour, 43 minutes, 15 seconds ago)")
References: <20231103195956.1998255-1-alex.bennee@linaro.org>
 <20231103195956.1998255-18-alex.bennee@linaro.org>
 <4659ec99-9b86-4c91-8ee8-116bff8b48c4@univ-grenoble-alpes.fr>
User-Agent: mu4e 1.11.24; emacs 29.1
Date: Tue, 07 Nov 2023 10:31:13 +0000
Message-ID: <8734xh7t3i.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-grenoble-alpes.fr> wri=
tes:

> Hello Alex and Akihiko,
>
> this patch introduces a regression for riscv.
> When connecting to gdb, gdb issues the infamous "Architecture rejected
> target-supplied description" warning.

I tracked it down to 13/29 when bisecting which I dropped from:

  Message-Id: <20231106185112.2755262-1-alex.bennee@linaro.org>
  Date: Mon,  6 Nov 2023 18:50:50 +0000
  Subject: [PATCH 00/22] Maintainer updates for 8.2 (gdbstub, tests, plugin=
s) pre-PR
  From: =3D?UTF-8?q?Alex=3D20Benn=3DC3=3DA9e?=3D <alex.bennee@linaro.org>

So if you can check that series doesn't regress RiscV (it passes the
tests) then we can at least get some of the stuff merged during freeze.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

