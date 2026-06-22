Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B481CCD98F0
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 00:25:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wbSSs-0005NE-J3; Sun, 21 Jun 2026 20:24:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wbSSq-0005My-Sj
 for qemu-riscv@nongnu.org; Sun, 21 Jun 2026 20:24:37 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wbSSp-0001Wm-B4
 for qemu-riscv@nongnu.org; Sun, 21 Jun 2026 20:24:36 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-696bf0e7c9cso5812324a12.1
 for <qemu-riscv@nongnu.org>; Sun, 21 Jun 2026 17:24:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782087873; cv=none;
 d=google.com; s=arc-20240605;
 b=WPWIe142vd1HxLjGSuGpYqzVmZBTVi8wN8MU+Xkm8guho2bdBgOIpsNkALCHYoksrj
 bgr80dS43rs9cC8Go2plJZKdZ9bPnqnv3quyg/z1oC4uKLKiZXq2ARBS14Cvhm69mtEr
 F6LQYwZ68ATaIVCv8OBmpDJDQDfU62toamFgcyn3V0mTMKLXJUbBv4W+7Je3l1idpuOd
 960GA1CI0NjkX95kDdXlWGn4tmzeBf83UvS1unLOEnD+P9bTnDsP/XXdSYcIVZSBr1Av
 NJ+ANuf6GsfHtBtaZqCS+4evIo6SR3tqjeYoedRm+73zl0eGo1iKkKWgmDBsOz5fKoNR
 lxuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=0yHC8rdsAiU+IbMB1rh8N/25F56NnW1Izx4WmzTKgWY=;
 fh=8tA/sDGpfZGcQIsc5KXWhJSNNkFh/R59oJ3G23qeGzA=;
 b=fhbKCUCpIDn1aDBHRipDsigPguAq4bMcTVXNnr3x9BC0A27Cj+jP/IbQNKXNpCnrWr
 P9bhuZMJFsfIoU1KS5lezMO+9D5GjONy4bpKAClgHlSUzXUnoV1dOi8x3iPgQI1Iq8HT
 pF3OSrF2pUl2BzUWzdvhIvhyuuVZl3o3lYby/MIsdpAiWpkuwmZzP4vu4K/uIuy9Wi9z
 ZpHtjR+kmWILFW6gpnt7+Eg8XPDWJ/167n1LSuJX2wGgd25oJtj0E7rKvTlgJIqZ7zAz
 vCTrP/EDKb3WtEJlC+BvmbNRfzvvbZi8QYfKVb7R6gpCj89KumxyqWgnyQsFfpfNZnFN
 qe9Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782087873; x=1782692673; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0yHC8rdsAiU+IbMB1rh8N/25F56NnW1Izx4WmzTKgWY=;
 b=Tyq6INQ2s73kFWvcpgXOXuVOde6q6gekAZGepjq2YO4gCwEpspZ7ZVvC+FJ2LhjsUj
 /KWIxtMqOm5LouAWlHQXvRwRTmtfKRKwy0BRb4AefP/lvGOnwJoK3pJrmtZX2l2RF3um
 +pSCtJ0+f9I6ZsJW8Ov7x606Q5FbjTgnZO4nwzl0OBocuq+JsNJs6H7cCyeWecqbF7Jn
 /OPhEmc6BcP0a7cnfFkvQ7qs7gs/l2GinWZKCbTHVT57tnItYJwh8A1kDMg8Bf+tvFV+
 kp4wWQosTw/A/nX87d8WX3c0KDAQHI/5RS3JYSsIT0u1KBfa0AQRSNFZT2uSs+qeohOA
 /bYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782087873; x=1782692673;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0yHC8rdsAiU+IbMB1rh8N/25F56NnW1Izx4WmzTKgWY=;
 b=rAoz5gzXj6QI+EzjeuugfYIVqwRWb6waxO9hM8q7334wNknuLfCNhkAADz2mFme7TK
 aCw8vBUFfy3H4R5rMJZMfZ0JWePF6YYbdoigxTlrzmTM2uB/Xk81+jYcOIseHjAhX8yz
 iUZ+bqHB3v/d2rvgoCyKGc6UuHK+v9m20S8ByGnZiZiev6XO55g1JYzKr24xPKJD3P7L
 kRO3P4EH0VlaLipKoh/V/gqQDl+NGHXrk6JSHCuxv14cJrCbwO5XfA16OibzwlIl+M2o
 MGGtmYMbBf+R/R+AGETZh3HnCe4OX2NYN4aNbrrDOTLy05iijvh0MIIsTRa4omZy2K/q
 GauA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+LG5kDnhEZEe97HoMTe4oZRyihgWo729sybL0AeWIIw6GPM96uZrE8LVKBJAe+POKgbeW5eLOm0YZy@nongnu.org
X-Gm-Message-State: AOJu0YwLeoIHrWlJ09FcQ4WUf9rf513mMZqimCkd/vR3wOWn+Gxr89Kt
 Pv4MSr6dkeKmycv/C9SX9HwkcQhH5zBj2tA1/IAEEd/uIDsm50OOV3AKNl2X+nPaquTAwBPBcln
 7q02BJHILV2KxW1WB04zNH9L78BOisQE=
X-Gm-Gg: AfdE7cn1qGJ3YyRj9ZrUzYFYqnij7biJtpiLdUevgJdfSR5VNCXmKF0a2lgm3kMf5hi
 lUP0DT5pXlWOp41EJ3plsJ14hcSPDPQ9Cct2qPJNysQ/qlQO7pAIw3nxRzQaF8FMlFDxZXvTRBL
 K6jt4s/yg92K/9o5xpqQkG7qnq0T7KzIOsSQ3fgfJ/k1xe3pNIIezCGVpnbbhIYa2BagpQe1Hf6
 NmyWdxI2vAotgXgoHtf865zjlyuqyFSPocV4/soVQTRIyJhlixftVJA9wmRXI72fKOhVsQkeaRw
 NBSMsMzfTELK1IIenbvaRH/wTcY=
X-Received: by 2002:a05:6402:3548:b0:670:d548:62a1 with SMTP id
 4fb4d7f45d1cf-6973b0ccebdmr5204449a12.3.1782087873441; Sun, 21 Jun 2026
 17:24:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260617054034.1020724-1-joel@jms.id.au>
In-Reply-To: <20260617054034.1020724-1-joel@jms.id.au>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Jun 2026 10:24:06 +1000
X-Gm-Features: AVVi8Ce2EpB78JbfMWB9Gg9CBCgWuuvP829BGVusIMqUrF9jlz2804ObfJQ0Oj4
Message-ID: <CAKmqyKO4y2QK6HGGQc=8MsO5wdODjyTGA728mkRyXWctQBQzmQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] riscv: Fix IMSIC CSR write and add tests
To: Joel Stanley <joel@jms.id.au>
Cc: alistair.francis@wdc.com, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Anton Johansson <anjo@rev.ng>, qemu-riscv@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x536.google.com
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

On Wed, Jun 17, 2026 at 3:42=E2=80=AFPM Joel Stanley <joel@jms.id.au> wrote=
:
>
> This fixes a segfault in master with any machine that uses the imsic.
> A test using the virt machine is added to catch this in the future.
>
> Joel Stanley (3):
>   target/riscv: Avoid NULL deref in IMSIC CSR write
>   tests/functional/riscv64: Use newer kernel for tuxrun boot
>   tests/functional/riscv64: Add virt machine AIA boot test

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  target/riscv/csr.c                      |  8 ++++++--
>  tests/functional/riscv64/test_tuxrun.py | 11 +++++++++--
>  2 files changed, 15 insertions(+), 4 deletions(-)
>
> --
> 2.47.3
>
>

