Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18915CD6E4A
	for <qemu-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 03:04:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wUyN0-0001E0-C0; Wed, 03 Jun 2026 23:03:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wUyMz-0001Dk-Cg
 for qemu-riscv@nongnu.org; Wed, 03 Jun 2026 23:03:45 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wUyMw-0007jn-E8
 for qemu-riscv@nongnu.org; Wed, 03 Jun 2026 23:03:45 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-7ea16f090b4so3586327b3.2
 for <qemu-riscv@nongnu.org>; Wed, 03 Jun 2026 20:03:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780542219; cv=none;
 d=google.com; s=arc-20240605;
 b=AQjZF0EQ61ozSRw6QRN8C+18gYDaRJx6fbElr8wyHkQbBTQlubCEeOHhnW2/+P6W0/
 0y2/xE4vlntZhXW+rqI44JpBrKFDQgl2QzymVjK5q94WGETL1/VZtD6nF2F6spN3OLNK
 yJduKpXsS+S5AubBIIRfzNAch1lbYcsezzmy0RDq1OCsxg5bhDuU7nUHBRQgktNVHDxL
 b7lW0DuIL8SgxjETWxhrYklHXQMGBc5xpS+vB3szGH3F1EAmf8WbIz+BSnxCFfsVqGqS
 K/H52PIbFoXxcM1djeveniXSb4+ppizT3QUE9iWAjH8luMe0v118Na5K/ZFhSVnryI6Z
 1oTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=EJ/7cbNnLAl3O3LPfWL/LtTNZVrE9ReRYjyLbX5TjZQ=;
 fh=Kg8bbc/Tdm+3aFUCZEGK67fy+bXPhqlvC1LKleNOuOI=;
 b=dbQB3/h8y0Kn7ocYzklkMwhsHbX4DlT41aJdeStsV9TD06oa4htIdOg5hr69wlRoaD
 gA93H3aX1KJlvqbNgT4RYLnWTvaK/IXVlIEjA05d1tmG7+cTl8Q0iUVkZDgmb/YRjh1M
 cF+eYCEs4d1NwmvxRWPxjifcxFgyPwxDApiT6Er7YN+IOQ1noxmuhy+lHPAr5dNlb3Eo
 L9av/evYlNgPCuD/ozCGMe3s8rcfjl6+TkXMEfLy3AgpTt/0yZdeGMsweRwX3llkE0VI
 Age3ftzJ0Qp7jtqKzGkrtOPpOUTN7R3G8Ny5HqkK52bwJqt+PtQiEcXPa5fuvnppQNob
 TsqA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1780542219; x=1781147019; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EJ/7cbNnLAl3O3LPfWL/LtTNZVrE9ReRYjyLbX5TjZQ=;
 b=eMc64BfzehTUA138pQTqtSX/Er9L8oa0kbmgOIWO4PPyOZALKEwyyO8TAzGRy/2Jtv
 IY1Flr1y7VDMHP/paNEHqart7xZVatMfReFdFvRGY6R6fmprvXkvDMZ9xQ1SR/C6oeyM
 7TOlf4TL//peJmINY6/cLdXlwS8N4SR2Soo5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780542219; x=1781147019;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=EJ/7cbNnLAl3O3LPfWL/LtTNZVrE9ReRYjyLbX5TjZQ=;
 b=n+nI46CbVjEBonWNBDHezoHY5TorBe6PNlTnbbynck/spGvlvE+KVXut6wZrh7RnUI
 qHhyYBBm7VE7MWgZZdpVGFX3vPJ1nSIJMMHiKZKVdDuMBHzJpFqZ29hj6zHFc5MozKI0
 Kp899T7W1Vd5jspFXTA/R9z3KipRPe8LL4+pZTi/bfLlzb8rgI9rmeKwQlDRkGr2MPI9
 Yjeestm1Zu6qzDSEQ2Y0pemz8bFKCyl10BNF6cPV+fqqRbdIlenRhG1o+dlztg1R30m5
 XhflkEIFjSZ6H4rI3BZ+YdC2czlkLnek5B6LUfJLbLCAqmEL0bXCDZ7uZQf8tZUaKk09
 UtAA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8a7WDaDwjlcptklPoxfYuyzu3qsbqVf1JicLrELnbMbTBRjhr1OmbhKs7ShrXGL4BunL4OlnqNQuAc@nongnu.org
X-Gm-Message-State: AOJu0YxDjESgMz7bqmwoJ/gJUo2Sc+0voTnqgGonmiWJcQJIqwrtcenk
 g0EjK2Zy4ncXg/A95PkN2rRucpE+yyFcRjblW4ZS2sTAnpXlL1uUL28ywyjefhktoftm2902NUj
 ++3/aY4ARBdeCV/go7JVur1s536kL56k=
X-Gm-Gg: Acq92OG/ewUI7+GZQwZ6kX4rj25CJC6wHtBw6BTSjmQ5bFihC6KeOfjqd9Cl/PQNZnr
 nh4M256FyP+8W4JKO1swVyIXOHIGNwoknSWbg2QwUxKaXbIRoUv0CFApFONgIf4vU1bKO+FOzQ2
 FvRsyiY11bP02QufL3ZvvhufNOqsiGEJe75/qoP1CSY8d8ZFnmd7ECDFH/3V9INzdmt4l363v72
 zFjxqoLAGChjlBnvuVlRL9w2NhTl1wK5UfqCrKZrcRCZxyTXHVPin7+a5ZwxMezlxWUzLfnpJXB
 /CUftq/ESE/5B58l9oD9F73QcYgMRRoXT5P+4KMjZCAZKxG7GJd7RAgvfj7iEiGm6UHq9Ze997u
 VpUZbQN2L2cfcRSVgqsmPHHmazarr4bT3bHjJDmjdEFHYmA==
X-Received: by 2002:a05:690c:c22c:b0:7dc:a5a8:8b9 with SMTP id
 00721157ae682-7ea46d27046mr60132337b3.10.1780542219351; Wed, 03 Jun 2026
 20:03:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260603065859.592063-1-joel@jms.id.au>
 <20260603065859.592063-6-joel@jms.id.au>
 <876dbf23-c7ec-46f4-9232-816a3d0bf16c@mailo.com>
In-Reply-To: <876dbf23-c7ec-46f4-9232-816a3d0bf16c@mailo.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 4 Jun 2026 12:33:27 +0930
X-Gm-Features: AVHnY4Kt8-7101iy7BvqOSpSETeScdndUz42ZR-kpCQwSfcycZ40Fa2SBoy016M
Message-ID: <CACPK8XeJX2s3-mvpsrCeOLsMyZXYN7fxiMCiitKTtN84Ntxvvw@mail.gmail.com>
Subject: Re: [PATCH v8 05/12] hw/riscv/aia: Configure stride for the M-mode
 IMSIC
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Nicholas Piggin <npiggin@gmail.com>, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, 
 Michael Ellerman <mpe@kernel.org>, Joel Stanley <jms@oss.tenstorrent.com>, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
 Portia Stephens <portias@oss.tenstorrent.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=joel.stan@gmail.com; helo=mail-yw1-x1133.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Wed, 3 Jun 2026 at 17:41, Philippe Mathieu-Daud=C3=A9 <philmd@mailo.com>=
 wrote:
> > --- a/hw/riscv/aia.h
> > +++ b/hw/riscv/aia.h
> > @@ -14,6 +14,7 @@
> >   uint32_t imsic_num_bits(uint32_t count);
> >
> >   DeviceState *riscv_create_aia(bool msimode, int aia_guests,
> > +                             hwaddr m_imsic_stride,
>
> hw/riscv/virt-acpi-build.c:74:    uint64_t imsic_socket_addr, imsic_addr;
> hw/riscv/virt.c:532:    uint32_t imsic_max_hart_per_socket, imsic_addr,
> imsic_size;
> target/riscv/kvm/kvm-cpu.c:1829:    uint64_t socket, base_hart,
> hart_count, socket_imsic_base, imsic_addr;
>
> Why choose hwaddr for a stride (region size)?

Brain fart.

> Using uint64_t:
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@mailo.com>

uint32_t would be more than sufficient too, do you agree?

