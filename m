Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B324CCF9F0
	for <qemu-riscv@archiver.kernel.org>; Fri, 31 Oct 2025 02:57:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vEfKF-0006sS-Vk; Thu, 30 Oct 2025 22:57:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1vEfK9-0006q7-AT
 for qemu-riscv@nongnu.org; Thu, 30 Oct 2025 22:57:11 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1vEfK3-0003sD-F3
 for qemu-riscv@nongnu.org; Thu, 30 Oct 2025 22:57:08 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-6399328ff1fso3127271a12.0
 for <qemu-riscv@nongnu.org>; Thu, 30 Oct 2025 19:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761879415; x=1762484215; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QLCVyFebGB3VVELRjgo/101ee4yNENm8DxiWhtPTw8U=;
 b=Fmk3c2OJidF7VHEVyx6Nk7mP1EUbuKZyN1qDUcvggWcvbpj+8SbzvQNcZOv/wmEc58
 siT8Oko6Op6Hh6Quc0YSXUcLv2TaLlEVb4WFK+gt5sTGe1m5ddMYLI0trrDrh+CrL6d0
 va0uNM08IlRLs4F4F2l27/eerhgQaJACSmJ4OSiiEOJaIOAs5bnP4r7lqOodLUCARr5I
 DXWDbLP6eE4aMoTZCyWpQTJV4/SRvbsKxwhSq6AA7BXZ1u0+2VxmRwBbBnHLPg3loJfs
 KoBMpEN68on0zCGpCcFjPXwjouR9CUSI3hhyMKY01a6GxGiCI8jugzbY3eQ2cuJ1iVOl
 UiQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761879415; x=1762484215;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QLCVyFebGB3VVELRjgo/101ee4yNENm8DxiWhtPTw8U=;
 b=DDPo6ECUTSKJKGNhuncWbZ/7KTjnm310KDUlb3Y3FGuvMTkpsS1hcv8ylRzFHduUNO
 12YBpSD6Fs1LOVy6jgz5LgT3GiuLCf0JbeVyguZHsPPD83Ptd2xmQh41aoydONcHmc31
 ooWkHz4bjv5XzTTJuPz4u9e1jsYB9C2eHs35uqecfGUbF7KTalMmvJoBFpuxql4N8Pac
 7I9Vab3wLhWW0tegk0lLIWj2V1Ym0uaYV/f+R6DI3+mQyyT+l+jTOb2iwlVJV7000hMM
 VJBvOSvaMJxk6nRwLDRjJc0gbCVPofnk5MhbnIEzMNVHSNiaf5eOWWywMWXRQAdBiFs/
 17Cg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNj5uwk7TP6NpyFhnMlG2sGQ773foHMboBOr7ttCvC7JGjzaxXXTuUvedj1QKlwsK0T7qtMW1T2xF4@nongnu.org
X-Gm-Message-State: AOJu0YwcPAAVbtBNaCLyMRq9qysFOfBFtT2miyLu3enPglLVSPbaAzF8
 ObrYXBuBTjjj30WKg25XU5bBzYjp2167mA6N+crdEyi00aUu6mue5NXhoqU7AT1nOvTdMB1ReYD
 rEtGDcSWmVZ9QGc3zg/lhWsLmDbma9i4=
X-Gm-Gg: ASbGncsE364pqilGyxTOeh+MqCGw/85B5kKgYYR5YwdtnPsziW7hKy0rOIT56NzDJVD
 crF77aY4PTqTYCB61pGz8i6O2a7A7Aq13ngyB58/e2Gi0cddyM34c15vktf31zmpA0gueqOLEb3
 4QMS/28dy9OzXBsAqSuL24Xe7mkRBPuQqOrr/hEYvLzPI9/3tTHMBpVmr1cgNCpYrc9r5IcY78J
 BKYGHHuxDpa/uUiNfDcLV0og5u0Zaq7cWvDOrt4zhpCPCuEyAE3J4EhwBf+0hZ/CR60xT9uJnVv
 vXvPLj+yTmFrYjg=
X-Google-Smtp-Source: AGHT+IFKhLGoYqQfu0E23jjsz0Kx17Ekitl6Ao53u1kk4PrTxvrrgEF1+6v+KvDpLXgDaI7vATcFngk9axZZy3FbD1I=
X-Received: by 2002:a05:6402:2714:b0:640:7402:477b with SMTP id
 4fb4d7f45d1cf-64077024adbmr1534092a12.26.1761879415059; Thu, 30 Oct 2025
 19:56:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250319061342.26435-1-sebastian.huber@embedded-brains.de>
 <20250319061342.26435-4-sebastian.huber@embedded-brains.de>
 <38528707-3d28-4be8-8b58-60269cb1db1b@roeck-us.net>
 <788527663.312.1759727663914.JavaMail.zimbra@embedded-brains.de>
 <67097d9c-ec3c-420c-b5b3-e2f3595a0612@roeck-us.net>
In-Reply-To: <67097d9c-ec3c-420c-b5b3-e2f3595a0612@roeck-us.net>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 31 Oct 2025 12:56:28 +1000
X-Gm-Features: AWmQ_bnIRC7weJDQY4HzQtkxDehE7QhEdMzxAQZug_kN4eI6g5zaWaXC8LJxARY
Message-ID: <CAKmqyKNkJiK_8UkJ6AqvmCbtkj=amzJvrV1CUx2EXCdUvD_jCw@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] hw/riscv: Make FDT optional for MPFS
To: Guenter Roeck <linux@roeck-us.net>
Cc: Sebastian Huber <sebastian.huber@embedded-brains.de>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-riscv <qemu-riscv@nongnu.org>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Tue, Oct 7, 2025 at 6:34=E2=80=AFAM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> On 10/5/25 22:14, Sebastian Huber wrote:
> > Hello Guenter,
> >
> > thanks for the report. Do you have a Linux image and a Qemu command lin=
e so that I can test this?
> >
> See http://server.roeck-us.net/qemu/riscv64/
>
> run.sh executed with qemu 10.1 or later should trigger the problem
> (the command line is not passed to the kernel).

Any updates here?

Alistair

>
> Guenter
>
>

