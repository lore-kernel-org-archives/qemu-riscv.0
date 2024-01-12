Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF128C47077
	for <qemu-riscv@archiver.kernel.org>; Fri, 12 Jan 2024 01:23:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rO6Fy-00038D-Kh; Thu, 11 Jan 2024 20:22:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rO6Fx-00037h-5H; Thu, 11 Jan 2024 20:22:45 -0500
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rO6Fv-0007kp-G5; Thu, 11 Jan 2024 20:22:44 -0500
Received: by mail-vs1-xe36.google.com with SMTP id
 ada2fe7eead31-46771fc85cdso1188473137.2; 
 Thu, 11 Jan 2024 17:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705022562; x=1705627362; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LkF9/1VdPlJF5YGzOoY0fbmY7AjaH0tcrXCeTR73l+E=;
 b=JFV7hEJurIsG4Xv8n1yUuKu8uENlRC9ye0tCfAB/DVpHICplB49dzBY/Cho0tNLGqA
 RKbbbiDVLuZN9GliRj40Rlgj87neyZfxiVkTJBAWI5Ob2W5Obyv0J4UuNkaRDknJuSSH
 9jgdCM6YJSnTXsTPtUKhTrscSfbqWtZC9yG2671KSAl6VkHR4sc0J+Z0uDd2IU9gvRbq
 +HAz6RekLCFkPmpFg2AJJVdTXW5TZXF5hIa6voXb4uYJB6kycrhrqux409fRoDXzVkfl
 MyT1NUJzWA7HbY2ELRcvrLWFZbNO3Aurv40O4cdjwy036dopSGHz5Njq4T7JDVRRkdrS
 qFmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705022562; x=1705627362;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LkF9/1VdPlJF5YGzOoY0fbmY7AjaH0tcrXCeTR73l+E=;
 b=B9S681T8hAcrsYhaz+p3unDiFacFHKk18jck8f87mCfJYxjh5ssG1RDbmRp7RqqawB
 Z7l9roEEJM9HjPmkMfQZYK2JZb4AkL8TuA/vVNwRe8JmAdi8Ujlmco3/Nbg7UavYaVUd
 0lkMWXjaorHdpvaXq+b6le3fO9rLhnuB4d5HRgtUX8QFd0827tgWX0CECy7zxW/4KuUd
 jG8eJTaoReoCpAE28hfwnbZNVuWSaZHn9gE+HG1XjrFGYegdB2jI6dWyBSS1vDf0brg4
 rBIpu8ML6YIurGpFDPAINtVwTP1UrA9l13Bzx45tStMWaWj05tNpREw2AJc063rIzoSg
 Lk2w==
X-Gm-Message-State: AOJu0YwIrgskRKupEKD2o6nOJCiW3+YoxF2gmSQRIumympB71kW2Onlb
 0HBAE2+cgKTrVgRDOcublEFf8efwbXvECfex0u8=
X-Google-Smtp-Source: AGHT+IF+YzVu391rSoFAj94jLf4ea9VyRy+wq20vPLB9n87PCwu5bLAztpHrUc8eYs8kZP9PRtrx9NB5mn4+lGSY+xc=
X-Received: by 2002:a67:f710:0:b0:467:c4d0:921d with SMTP id
 m16-20020a67f710000000b00467c4d0921dmr909582vso.25.1705022561825; Thu, 11 Jan
 2024 17:22:41 -0800 (PST)
MIME-Version: 1.0
References: <20240111161644.33630-1-rbradford@rivosinc.com>
In-Reply-To: <20240111161644.33630-1-rbradford@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 12 Jan 2024 11:22:15 +1000
Message-ID: <CAKmqyKNFABtEKtcUCcD1LSaSLpMFT15oGJoysK-v7LckS3uP=A@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] target/riscv: Add support for 'B' extension
To: Rob Bradford <rbradford@rivosinc.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, atishp@rivosinc.com, 
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com, 
 liwei1518@gmail.com, dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e36;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe36.google.com
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

On Fri, Jan 12, 2024 at 2:17=E2=80=AFAM Rob Bradford <rbradford@rivosinc.co=
m> wrote:
>
> Add support for the new (fast track) 'B' extension [1] this extension
> uses the misa.B bit to indicate that the Zba, Zbb and Zbs extensions are
> present.
>
> Since this extension is not yet frozen it is exposed via the 'x-b' cpu
> option. The validation logic is based on the new approach taken for the
> 'G' extension.
>
> The specification handles backward compatability: The misa.B bit may be
> set if Zba, Zbb and Zbs are present but in order to not break existing
> systems the bit is not required to be set if they are present. As such
> even though Zba, Zbb and Zbs default to on in QEMU this extension is not
> enabled by default in any cpu.
>
> Cheers,
>
> Rob
>
> [1] - https://github.com/riscv/riscv-b
>
> Changes since V1:
> - Rebased on master after latest riscv updates
> - All patches have R-B tags
> - Array formatting fix to make future diffs clean (Daniel)
> - Dropped enabling for max CPU variant as misa.B is reserved until
>   spec is at least frozen (Daniel & Drew)
>
> Rob Bradford (2):
>   target/riscv: Add infrastructure for 'B' MISA extension
>   target/riscv: Add step to validate 'B' extension

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  target/riscv/cpu.c         |  5 +++--
>  target/riscv/cpu.h         |  1 +
>  target/riscv/tcg/tcg-cpu.c | 33 +++++++++++++++++++++++++++++++++
>  3 files changed, 37 insertions(+), 2 deletions(-)
>
> --
> 2.43.0
>
>

