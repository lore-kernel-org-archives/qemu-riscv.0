Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F45C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Tue,  9 Jan 2024 00:39:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rN09I-0001mB-LX; Mon, 08 Jan 2024 19:39:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rN09I-0001lz-3J; Mon, 08 Jan 2024 19:39:20 -0500
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rN09G-0001IX-KL; Mon, 08 Jan 2024 19:39:19 -0500
Received: by mail-ua1-x930.google.com with SMTP id
 a1e0cc1a2514c-7cdf4b99e7eso731468241.0; 
 Mon, 08 Jan 2024 16:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704760756; x=1705365556; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RH8d5xXWApxrnUiDrezTJHiQXsRT4pGk6cApCuoEh6c=;
 b=Rq7usSmgwXBOSz6kfNkKaMjvNafmImdvms/qxphF3t3eTAVhU66haosn4/onCu4KY3
 lvCgtWh98zazpSu8DDVPHFPVFJkgLOcRlnus7JzUzfjW4zHlWhyVi+wZN0vkRg9qWK+K
 7214ZeVM5l8yAESjAq4VbCe0Wtd8WS5oV5vKw2dPi3EgbcOefXU/354zmiLd3w5+rhMC
 P0WL4Q9ivwwIGIEe51it22nabGjeQZJDt2kiZ648LH1iReNZ2R9fBZb/8qeLhcGbRB7d
 kQogEVRH24PorL3Fq1+K5PusWHbkJ99YAk+KhdsmZqQUyAmIzFX7/hrSasMiMIyChh+o
 XFLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704760756; x=1705365556;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RH8d5xXWApxrnUiDrezTJHiQXsRT4pGk6cApCuoEh6c=;
 b=jTALSNYivi2Zw3GAmHy/V46cQwNj4MP3v5+6rx1scuu56ohe+Tw8gKzNJ9XbBV2VM7
 LwionVZRfOKF79+4HuZ02xO2ls5Lwsc819FI9+yeQXBsCy+IZKd5GvM3csEGqpuyTN/d
 kS8Nf+E0nq67IrEu5qW6e5JzoZenXK6LyfmypDUD1IaAc2BwKny62D0zAeIyoMerCcWU
 HFt38X+FEP6kE49nsSGj7xrVuc9xU2yahilfJEphEmpvHAgiG/yTP7HQhsKvZYnH6yqF
 9dhP4NQhBKSYr5YrsfrQOAPIWiol8UYnezt9B/Fy7XZNssbR7b2bBIyRIpIiOJ6fCgnC
 TYQA==
X-Gm-Message-State: AOJu0YzUJtdZQh8yhxs4r0xWNYJ/HaJEWeSciS2PF53sIyNPCStkB/RV
 JWA6skrvoQL7Ay131aeNJpwUdwDvkrICOyU4dTc=
X-Google-Smtp-Source: AGHT+IHzqfnAuRTAEHHPhUh4YBC8c3a7rnE6bvh5tIhVx3St5W4zJ23xw8Ih5pAk11dQRoQ7x/bIwCsNYT4YxLSxrpY=
X-Received: by 2002:a05:6102:b0e:b0:467:e698:775 with SMTP id
 b14-20020a0561020b0e00b00467e6980775mr175492vst.3.1704760756545; Mon, 08 Jan
 2024 16:39:16 -0800 (PST)
MIME-Version: 1.0
References: <20240108001328.280222-1-alistair.francis@wdc.com>
In-Reply-To: <20240108001328.280222-1-alistair.francis@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 9 Jan 2024 10:38:50 +1000
Message-ID: <CAKmqyKOEk9y4aunzJtuvuZLVgYpEgs-DKP66vmXpiUfbgzTbmg@mail.gmail.com>
Subject: Re: [PATCH 0/3] target/riscv: A few bug fixes and Coverity fix
To: zhiwei_liu@linux.alibaba.com, qemu-riscv@nongnu.org, palmer@dabbelt.com, 
 dbarboza@ventanamicro.com, bin.meng@windriver.com, qemu-devel@nongnu.org, 
 liwei1518@gmail.com
Cc: Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::930;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x930.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, Jan 8, 2024 at 10:13=E2=80=AFAM Alistair Francis <alistair23@gmail.=
com> wrote:
>
> A few bug fixes for some Gitlab issues and a Coverity fix
>
> Alistair Francis (3):
>   target/riscv: Assert that the CSR numbers will be correct
>   target/riscv: Don't adjust vscause for exceptions
>   target/riscv: Ensure mideleg is set correctly on reset

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  target/riscv/cpu.c        | 8 ++++++++
>  target/riscv/cpu_helper.c | 4 ++--
>  target/riscv/csr.c        | 5 ++++-
>  3 files changed, 14 insertions(+), 3 deletions(-)
>
> --
> 2.43.0
>

