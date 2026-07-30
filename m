Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46BD2C55165
	for <qemu-riscv@archiver.kernel.org>; Thu, 30 Jul 2026 14:05:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wpRO5-0006wE-HG; Thu, 30 Jul 2026 10:05:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1wpRO3-0006vl-9M
 for qemu-riscv@nongnu.org; Thu, 30 Jul 2026 10:05:27 -0400
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1wpRO0-0002dY-PB
 for qemu-riscv@nongnu.org; Thu, 30 Jul 2026 10:05:25 -0400
Received: by mail-yx1-xb133.google.com with SMTP id
 956f58d0204a3-664a09bc459so2938038d50.1
 for <qemu-riscv@nongnu.org>; Thu, 30 Jul 2026 07:05:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785420322; cv=none;
 d=google.com; s=arc-20260327;
 b=KerVZPMSuxRh2OyEQ+O531zfKZUlk6CSqiDFcjAXN78CFyzcERXXZPB2wnbhJwLBs7
 eL0QSMwBNhc8lJCxTiguD5ouexha0MIGh4KXylU1GkO3NRiwmEIa5lHKeAxjP9FyqwOb
 +VG03A7ByLh6Ax1Kd8s/yMfTkDqdE/j20BNo7nY7J4YROo6g1hmuBj2kivs1swOBION8
 kKoUX1mtSpq0/+GohJIFQr7op8NGMSqwgtH5W7Z7x6/474GpwBChfQse9aK9xxNkoEGR
 f5eR8Ey4qB0NFcfDn6hwcfdyrZOANlAkZdDu0jPwa9u7+3jgsN+ra1+2C5fX8Ty2aSaY
 plYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=ztBV9fK6s30mFcelzOXD2BxiXOeYvKlD95q+mLnvIkw=;
 fh=2BLxPgHeTnEiHrCtYlysOtoTJkdCygZKKEyuA5jad2Y=;
 b=iVGn/Tq3RWGBMZ4wPyVVt874IdakGmy0FamQjjv5lcIH6xBkaY0GRMvwJor/vL872G
 FroWi0iGylixbk7MX/6vtXKaHGND2/69CIpPZNoWoLnethyf2FeDlRcWnUAUbG+qrTXY
 smvd+N73Qe0p9GUY5u6OA/LfPys/3KSXpJkiJxbpMWjlE3+eamdeBF/REpXto1R4qpVQ
 XJ95TS/YwGiIZh7crlw/IG7/RxTjx+o+aHw3QJbzlamb60doBT2FYM8KvJsLLJNsUfgG
 vxirUhLJPthRess4mhuknwp+uEHOBbIKvqq7iMfGQJPxg+Jo7dqWZ/JE8mejdCJY0NMA
 IWuA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785420322; x=1786025122; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=ztBV9fK6s30mFcelzOXD2BxiXOeYvKlD95q+mLnvIkw=;
 b=KotCigtzMBOZEtF33pwTwDfFPM7cg+quDrUfiX3t9xPpCv7X82Yj31X+w5dRfiEdAD
 5JMz2HHrXXnKxQ37Ire4cblze3bEo8xHU5KbzzE1hVuOJqDWeo1PYWWFNNmAJb2a7Ytk
 GikEN+25xs+YXU5UwFQtMJfRwomeZ4FCdPCM7MjZHPPFFm8bO9qwBujql6+SENuiVof5
 DbPUqmJeHdP2ktVTkK4iXbAoR/w/yC4L4zREECBDxLXuf9CDd3pqikRT6cnnUksLS5hS
 vVJ81cSMfq0PUeakdBIjdzECsDoxJJ+MA94m4wuoHVY/vVHoNnfOVViz18LETpyJihPE
 bNQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785420322; x=1786025122;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ztBV9fK6s30mFcelzOXD2BxiXOeYvKlD95q+mLnvIkw=;
 b=pv4+flTc66dzWvx6YL0comAUmY8J/G6Ce4tf3eHJnMKPf9qg52XvNjLe64PgK62SUn
 kJD4oDP/6TocYNOPBwXYBR3tOb69z1xhcjOuTl0PeAPvTVNsVJ0Ta5gH25444UKiDJdp
 heKFi7N0BLzfe8teMXvYIBrszKygcdM9FUrpEzWY1Rci60FLBoQNR5TE+yayCJZVUDf9
 VxkLDPqNgj5M+b8/q2sGNa4RBvcWKQq8EMZUb7XkNDNhcKoHIq2CTFwYqfGJ+QF4fiba
 /fBpMSX740lx63f9/e0MGD+qZcu9UYJHhOrpFYPdSPfZiiSer97OE2gSm65Jq8erezWa
 DtsA==
X-Forwarded-Encrypted: i=1;
 AHgh+RoXjV+z/dOhshG+2b4hnrx8M/tAEMCQlbwLMbBFxeaUJc+/fDUACYzCKEZ7HlQ0hVbnR2e535hn4DAJ@nongnu.org
X-Gm-Message-State: AOJu0YxH8NBQy+E6Cqw3PuFni+mWHsNHctDr4MotmAaPdgY9BYMP2cPL
 xEZvKExVQl7G4YMpyAFjPQE7n+AFaE76TCws3Z4gwAduRv7Rgmuz9kx+ETtanDboQnihIwgW1PR
 j6Nh4HZ43P+5xdneLxQsjWoNVG7zCxYk=
X-Gm-Gg: AR+sD11KiWogeaoa5AHHRIdiAr1tL5pmiVpvXWgaJWBIf2xbdAqGLmpbT+rCYQ5MiQn
 JE4YqIUE5dd2bfs7MpP6MGdZJ4ZSOYahdUTW+n9a/qKosks/H/hajykJcn2KTdXejGK2o/yaYxE
 LAH6+ODHtIxN8f+me/ZdgQqpVG9dYJn3kOohfp3O55x4GQgywLcPRqd3e8ZOV07Qliaii1xtvpw
 GOMfhpuvN8vMgwBn2yqyzNPXTtddmaHQF4s0rOLaE5ueLYU33S3xYFwGpCurWlu307HfORzbDvA
 4uTt1G8ls3/jfpY0QvpXgFrxhT1uf8nLTVwODlP0RXqH
X-Received: by 2002:a05:690e:4594:10b0:667:b314:aead with SMTP id
 956f58d0204a3-6692f514451mr1319734d50.6.1785420322284; Thu, 30 Jul 2026
 07:05:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260730133713.3253-1-rao232328@gmail.com>
In-Reply-To: <20260730133713.3253-1-rao232328@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 30 Jul 2026 22:05:11 +0800
X-Gm-Features: AUfX_myWdQ-Bu682AP3pd0NcXhlP03Tuy9zregw4JaLAB-3Egrc_BJwsQEdScYk
Message-ID: <CAEUhbmUCna18qnDgPk2=xHVq=77T7eaLNYBMSfdmYm3MSeQWsQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] hw/timer: add k230 dwapb timer
To: raoyi <rao232328@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com, 
 palmer@dabbelt.com, alistair.francis@wdc.com, liwei1518@gmail.com, 
 daniel.barboza@oss.qualcomm.com, zhiwei_liu@linux.alibaba.com, 
 chao.liu@processmission.com, farosas@suse.de, lvivier@redhat.com, 
 caojunze424@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b133;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yx1-xb133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Thu, Jul 30, 2026 at 9:38=E2=80=AFPM raoyi <rao232328@gmail.com> wrote:
>
> Add DesignWare APB timer peripheral for K230 machine.
> The timer uses the Clock framework for frequency input,
> preparing for future CMU integration.
>
> Changes since v1:
> - Split into 3 patches: model, board integration, tests
> - Remove goto pattern from read/write handlers
> - Fix include order, add explicit bitops.h include
> - Add QOM <private>/<public> markers in struct
> - Fix copyright headers
>
> raoyi (3):
>   hw/timer: add k230 dwapb timer model
>   hw/riscv: integrate k230 dwapb timer into k230 board
>   tests/qtest: add k230 dwapb timer test
>
>  MAINTAINERS                         |   3 +
>  hw/riscv/Kconfig                    |   1 +
>  hw/riscv/k230.c                     |  23 +-
>  hw/timer/Kconfig                    |   4 +
>  hw/timer/k230_dwapb_timer.c         | 317 ++++++++++++++++++++++++++++

This one should be modeled as a generic DesignWare APB Timer, then
optionally a K230 customized wrapper model.

>  hw/timer/meson.build                |   1 +
>  hw/timer/trace-events               |   9 +
>  include/hw/riscv/k230.h             |   8 +
>  include/hw/timer/k230_dwapb_timer.h |  72 +++++++
>  tests/qtest/k230-dwapb-timer-test.c | 227 ++++++++++++++++++++
>  tests/qtest/meson.build             |   2 +-
>  11 files changed, 663 insertions(+), 4 deletions(-)
>  create mode 100644 hw/timer/k230_dwapb_timer.c
>  create mode 100644 include/hw/timer/k230_dwapb_timer.h
>  create mode 100644 tests/qtest/k230-dwapb-timer-test.c
>
> --

Regards,
Bin

