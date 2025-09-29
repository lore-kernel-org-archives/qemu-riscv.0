Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08628CAC5BB
	for <qemu-riscv@archiver.kernel.org>; Mon, 29 Sep 2025 01:59:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v33AZ-0004r6-5u; Sun, 28 Sep 2025 21:59:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1v33AW-0004qf-9J
 for qemu-riscv@nongnu.org; Sun, 28 Sep 2025 21:59:12 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1v33AN-0004SN-39
 for qemu-riscv@nongnu.org; Sun, 28 Sep 2025 21:59:11 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-71d5fb5e34cso55112077b3.0
 for <qemu-riscv@nongnu.org>; Sun, 28 Sep 2025 18:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1759111130; x=1759715930; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oBRSwU2WOmNwCjrisL5v0G626eavWnfdYQVnY8GX1U8=;
 b=RGkbN0MhSP+sXDDQdcYLOLIRWMMfPcARCk44whFoTAb4CWGA0QcBoaxO88IpnlklSm
 102bgdY+yOvQ778jEsXBKFISZw7GhQJrNfCGIQ1UR2FwSzik4I+tKlcdGpS2jDQLRNhW
 G7jjY5p5aH9bvN9nANVQop1DiVOI4Xj2AKlqA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759111130; x=1759715930;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oBRSwU2WOmNwCjrisL5v0G626eavWnfdYQVnY8GX1U8=;
 b=gB6Wg7spaDYq+oO17bvjiw0+rZ7Bdeb/AWffJpkDtbokLrrnBveH6Z8+vBc0a/rIib
 erq3wZ9dfYme0q8x5WZhmnyXC1JxSxcwFOynCax9FOg76gAOTUvCmcvH/Tn7O6Vuu5x2
 khaRZ0KxlgvMH+G06KswC9oW2vk476VHgwMGbo6eD3gY739gJ9OspwNjnLf64jxWHzD1
 uWHzBFAa/GAMNClSUix5L7QcBhcRTBeyQNPEDQOKFDtTN2gj/oyyGCUMGt7dsNH0bNRe
 J3XnhB1BXdeH2Yw/Fh0fOLbe4vpsCwDxyUMn2AwpuQKLDmFzhtiNagXtYeg4wpu94eqv
 gaEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIWLdsz8Um6ZgkTn6uXRo90vKExqFlwTvV//7vZXGun4J5d/4pM1KwAEQRH1HoIDYCxTA4KjztS16n@nongnu.org
X-Gm-Message-State: AOJu0Yz/qfDhTWLz+GnwMJdPG2E6L/2Yd6kOWz6HUzb3xvg2Bfg+/fW6
 kuhRSmOv8VMtYCkSh5YUhc4IbjZGWWgtFG+CIpxWI6AsA12qgB8UqJXLV9/Y2zVG5q3eYOVP/rk
 ZzET8Jh0XxX9fMLCRyygamwku+4RWhlM=
X-Gm-Gg: ASbGncsIWE5qqVE6N+Nha54ZF2D9fLDAculsGZFjMNv66uQmHYJJrmGkScJDC7/B5Su
 29MKdICSbHeLcNxa33KkmI9g7KudXbgN7LBCKKdcv4MXUvmICBEcvypbifNihqs03moGvSaTfpL
 ABAlzt5Aycw12HKjnWQ/3BeWi1LXCqZzAdRknbmFEv9TZfVEw2pccDx4enBRGq2YQdWNTeG/LKP
 gatz6M=
X-Google-Smtp-Source: AGHT+IGGFBHPhUwP3BxBDC3POYPOC1gcI82/PjWjcdNHDTYdKWPNNgW7JUwIas56A4SsMvs0Byh2ozOQVYHU16uyhT4=
X-Received: by 2002:a05:690c:6606:b0:723:b1b8:fb94 with SMTP id
 00721157ae682-7722419b304mr86418697b3.10.1759111130551; Sun, 28 Sep 2025
 18:58:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250723094213.2975268-1-dbarboza@ventanamicro.com>
 <20250723094213.2975268-2-dbarboza@ventanamicro.com>
 <CAKmqyKP_iM0GAM4cZFQsTcvMvi3DjCS6h7_60EPSBnh-UQsb7A@mail.gmail.com>
In-Reply-To: <CAKmqyKP_iM0GAM4cZFQsTcvMvi3DjCS6h7_60EPSBnh-UQsb7A@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 29 Sep 2025 11:28:39 +0930
X-Gm-Features: AS18NWAVnoi2Nh6zW-t_8d6L0EMSmEafpUP-dp3pk1W0F-Vasd7OO78CL_TjQ0M
Message-ID: <CACPK8Xc=P8cNfx=x4wpt2zYL9gr5B-NoP742OhRPTuSAeAmHaw@mail.gmail.com>
Subject: Re: [PATCH for-10.1 1/1] roms/opensbi: Update to v1.7
To: Alistair Francis <alistair23@gmail.com>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, 
 alistair.francis@wdc.com, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@dabbelt.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=joel.stan@gmail.com; helo=mail-yw1-x112e.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
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

On Mon, 15 Sept 2025 at 12:57, Alistair Francis <alistair23@gmail.com> wrot=
e:
>
> On Wed, Jul 23, 2025 at 7:43=E2=80=AFPM Daniel Henrique Barboza
> <dbarboza@ventanamicro.com> wrote:
> >
> > Update OpenSBI and the pre-built opensbi32 and opensbi64 images to
> > version 1.7.
> >
> > It has been almost an year since we last updated OpenSBI (at the time,
> > up to v1.5.1) and we're missing a lot of good stuff from both v1.6 and
> > v1.7, including SBI 3.0 and RPMI 1.0.
> >
> > The changelog is too large and tedious to post in the commit msg so I
> > encourage referring to [1] and [2] to see the new features we're adding
> > into the QEMU roms.
> >
> > [1] https://github.com/riscv-software-src/opensbi/releases/tag/v1.6
> > [2] https://github.com/riscv-software-src/opensbi/releases/tag/v1.7
> >
> > Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

I noticed we have .gitlab-ci.d/opensbi.yml and
.gitlab-ci.d/opensbi/Dockerfile. It looks like they are unused?
Certainly the docker file looks out of date:

#
# Docker image to cross-compile OpenSBI firmware binaries
#
FROM ubuntu:18.04
...
RUN wget -O - \
    https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/x86_64/8.=
3.0/x86_64-gcc-8.3.0-nolibc-riscv32-linux.tar.xz
\
    | tar -C /opt -xJ

Cheers,

Joel

