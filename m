Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D28CD5BD1
	for <qemu-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 03:17:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wTt8u-0000CO-Nz; Sun, 31 May 2026 23:16:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wTt8s-0000Bh-EW
 for qemu-riscv@nongnu.org; Sun, 31 May 2026 23:16:42 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wTt8q-0007sj-V2
 for qemu-riscv@nongnu.org; Sun, 31 May 2026 23:16:42 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-bd8f9725b30so1837765066b.3
 for <qemu-riscv@nongnu.org>; Sun, 31 May 2026 20:16:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780283799; cv=none;
 d=google.com; s=arc-20240605;
 b=R8EseyTS+OozgpK3pvupR1K9s/CydMFJvKF3xBpZxjZhEaZSoCqLBu3g1GNW3ColWk
 DHEPYnHxascBtNLj7QTY0/wrmH0VAm7DintuaEPJrTW+aX9RInGP+T8ZattsyK6eBQmR
 ZttRpmTR42D0AT+YR1HXgKpgKK3QM07+hk70g6U1ZgxuoQ85TSdU7thd3G51k5pIB3J2
 aB39fEDyuoR0Q29xRAWOtdyWAJ7txM2JSuDMAhkU5P3lqhml2KnCNgZTU6jhgBAKAqHc
 9Oo8psZ6MmpbChtMNwKo4sDZa65KW50V0CS1qCVTDxALhM+GiXmsIocaOSOmMhq4DiO2
 TMTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=RXoDANf3J8QHeoQGdRR8wDPh6TPDX0vUUUjR7ERULJI=;
 fh=mh1RBHzoBdzOFBpIvNtI88myan01OCU2Jy6eKs7pW+I=;
 b=RUXtSEm7ONYuwF+5r1CVPnpa6jeH0TmEbQkdKwEguKjFEVNq8oXjJQP4/bOoEsO9QF
 6BDP7khrJ/35ti2Bl/LaWwkQLrsrhF54sOE6dqRDnEUmbVx9R9NhEI3M9ud0pQAyBXly
 zAlbirGewCj+zEf/treWJk7H8jy7H9pv6Wbdc7DDh4pqjrEo1mgyvwO2jC4+eIUFQmhg
 NM9fd/OI5P1J02k0KaXPVBSzB1zAT8yF+B5DLZe9Gy2U9t85Uu+AcKwHKtP6foDqm1Ez
 OEbTxYQbY0FMRY+U/bHpKuZ81mja3WCqrIwXjpYQLsNyZs4urKJuKnDhDBl1L3qxLXE8
 PsfA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780283799; x=1780888599; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RXoDANf3J8QHeoQGdRR8wDPh6TPDX0vUUUjR7ERULJI=;
 b=FaCTwBcNud5SGplPN2/zYCngaJ26aKnjL/elVEG1nnoWsi2kaSb8W3+GRr1/Vg0vqc
 GOmIDJc2es+iOOyY7/tkx82L4SA6MDlYLLqreK1ORgGq5Z3OCZRJBebn6EJLGSTAdIYA
 lepsfXa0wmqmYU6VpPvf7+X9ZyXlCqSOe/Drxfxys4yT/deTB6EIXZdvOIL5RSb5DBgi
 I028YQlFuF/FO6jTzmAeNj/HVBZg4EwNap988bQO8IPaqJGnpNjYHD9buz1gj4x/kTV/
 6WTopb12E3ZPSWzBj9qaDxqomO93oL4yUvDfvHWVlV71kilbXjjsTtzK6gLD9+My9Zby
 qXRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780283799; x=1780888599;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RXoDANf3J8QHeoQGdRR8wDPh6TPDX0vUUUjR7ERULJI=;
 b=n8pB1guzudN2NjGGBYk+B6k3GLK7VoecdWWUNXLosgwBI3gGjIZhI6gkSngVMZF0Kq
 B2a8F0Kcb1wpgWI0fYCLEdmWa2YAH8+ctqwFNQlML2JTmJzacfNciodV/aVOWhsX4eLY
 3+jzeXIH7QliN11qVwbS/VCSkGGlEqxKyEsVdVsx7uvsZLoHmTQge9TIDnm5VTDj5kNf
 FdpzgNYucDU2dfoXvOq+UgLQb8iAGygbo7MGZrXDdpR+uuJlQJFw/gAtSRCdF2zT3up8
 h9T3SVD1Dn3WfO9VYyktr5TML9DSQAgXbt8A9j0SYXPGNiP1BP7Gox6Xh62KONtU+hiV
 1uSg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8gE8Ydu6aYPWzNOILuYOWua4TrKE6/WkHNg35wBWc3pCqkZ5zi9LiC8OUheYP3dzKeDIFwsqq6dCZY@nongnu.org
X-Gm-Message-State: AOJu0YwLr9SN9YEl6z5GLCEln9F9nPXiHSbF9HiKZvbJrGSkJ3n9DDgj
 0iimvyjGke2h04Hfo455tuSUIeWRrZ9HQmS0UrDt+7nlaRS0TsMZcC6aMLbbLcalqyFCqWyo9xI
 01oaFEvroBqkVgu+cOwZGKMhhjHOStsZQf2Gmkyg=
X-Gm-Gg: Acq92OG7BUgOmtbP1DC6+ETlDXUYiRvbcddWwqd3rUTBHcgsIpeZHOGW16b4W5Wdp7o
 cC9hXknkUcU2N7RREEn2Ufg/nBwCTUcJVGRl79zCVyPvbJG4tHuSCgsCIbkuvdqAbV9rrA7wflZ
 CxXHi6zfTYbdFbhvzHC/0q700WRjhF36wiiEV43TFKAFW8UQFrR+XEv/tx6A3QANDmpVPWga63L
 K0pOWN8lA+ecbZZNfGEIc0C+5cwM0QsW1Q5xE/sjG0uN4rxk3PrS4EW0GlFQrHa4aDlVEZfQUR2
 krOcsOg11rp7+oH6MT124PmqVsL8fKCKUbI//Jqe09hcbP6I
X-Received: by 2002:a17:907:a2c8:b0:bda:916b:c87e with SMTP id
 a640c23a62f3a-beab01dcaf3mr396407566b.12.1780283798490; Sun, 31 May 2026
 20:16:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260527200355.2068879-1-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260527200355.2068879-1-daniel.barboza@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 1 Jun 2026 13:16:11 +1000
X-Gm-Features: AVHnY4Krq8bZIPAXGudAgWrN43R-V_ISpZtF5RdXU3hB2BspUz2YL-LdUR-f2fE
Message-ID: <CAKmqyKOA7oD6AmwgxiwPjV9R4NBVXv+4bgAHeUECiqiLQv+dhA@mail.gmail.com>
Subject: Re: [PATCH v2 0/1] disas/riscv.c: fix inst_length()
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=alistair23@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Thu, May 28, 2026 at 6:05=E2=80=AFAM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> Hello,
>
>
> In this new version we're fixing the disas function by reducing the
> encodings we support, which is super fine.  Thanks to Alistair for
> pointing this out in the v1 review.
>
>
> Changes from v1:
> - support only 16 and 32 bit inst length as specified in the RISC-V
>   unpriv ISA
> - v1 link: https://lore.kernel.org/qemu-devel/20260520173522.1794433-1-da=
niel.barboza@oss.qualcomm.com/

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>
> Daniel Henrique Barboza (1):
>   disas/riscv.c: fix inst_length()
>
>  disas/riscv.c | 20 ++------------------
>  1 file changed, 2 insertions(+), 18 deletions(-)
>
> --
> 2.43.0
>
>

