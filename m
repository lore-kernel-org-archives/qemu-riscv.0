Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84E78C0032E
	for <qemu-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 02:05:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qukJ3-00018k-7s; Sun, 22 Oct 2023 22:04:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qukJ1-00018D-Oo; Sun, 22 Oct 2023 22:04:35 -0400
Received: from mail-vk1-xa36.google.com ([2607:f8b0:4864:20::a36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qukIw-0006dr-Vd; Sun, 22 Oct 2023 22:04:35 -0400
Received: by mail-vk1-xa36.google.com with SMTP id
 71dfb90a1353d-49dc95be8c3so974488e0c.0; 
 Sun, 22 Oct 2023 19:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698026669; x=1698631469; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RG+6MxWWN36xOSZuZSwxxIgt0oXyK8KKYYWAiQsYwrE=;
 b=D/BQJ5Ed16prgX3V7ab0hSYcZ1Kc3+N46XMOFr+hkZWaXvRlIKnGDE37KxJr7zSMS9
 VPciPVQd9rcGClIGgtMVmspivvpHGqR3qP/ZWGn0Oo4biHCL158Z2nUjnZ08j4IVshpU
 PUoLXSvJA6uHZ8y+jJ0osPlDFHLCfTlk7+dUFt8UPjthTDdX2IAN/5AC1oPVVQT5HoE7
 CtOIgFARLxm8ywHklxUy9s9lk7yFR2zKXOkQjXbJrg9zG+oZHSvK+zH7V8njTvfZ0tic
 VqxQhtJRRq+UcJzDbB9tP/N17zzf529n3STiO5VOxUIoIYPbZZWNPvzkZYpTJoRLgSEe
 j1nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698026669; x=1698631469;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RG+6MxWWN36xOSZuZSwxxIgt0oXyK8KKYYWAiQsYwrE=;
 b=JR+kS/obBXAMgCZd1uDQUPQh5DJeKuGjsKn+z4S+ipXrHcfMR5NSCwT8nWCTLk7eJW
 wirGHusKpowEZSQbz9gEDWmwh3OTcmPAa+oWDSc7NlZsS3hxyQ9ngZtSAaft3fCAcsHp
 oQyzPanyOy+RzEPPM6AOs1uBg9SFxGAKHCpjj2cU8j+2kyt7PYTquJXj12ZgLFUHIukB
 0aq+sfjktM4B71G9ebmqGHFhh2H3ZCbKuq+j6lYiBSKtzn6ZSJsImvhL7oTwDQshhBBx
 rWOlVGdpwO0W9M8PouXDCtqJX5r3DOB6jYOCZrlFcJG9r1KYyPTd6KsFcsyKTlofYhJs
 DzAQ==
X-Gm-Message-State: AOJu0Yy55ER8TjrtmALaiiQRfX0b/wW0OpKpNTEAvXyeHJzxuge2WXPF
 sKvIC9NLZBWvOi6AXKznDEOUOzTxjPzQ+4PKj5k=
X-Google-Smtp-Source: AGHT+IExImc6E3c9zSBMQbuSxneslVGQM9q+iFvI6Rf98bumizBB0Kd6tTdCn9FRWPD+AL48IGduhL6/wu8+l9k16Ak=
X-Received: by 2002:a1f:a241:0:b0:49d:d3dd:fa40 with SMTP id
 l62-20020a1fa241000000b0049dd3ddfa40mr4081144vke.5.1698026669546; Sun, 22 Oct
 2023 19:04:29 -0700 (PDT)
MIME-Version: 1.0
References: <20231018154434.17367-1-rbradford@rivosinc.com>
 <20231018154434.17367-6-rbradford@rivosinc.com>
In-Reply-To: <20231018154434.17367-6-rbradford@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 23 Oct 2023 12:04:02 +1000
Message-ID: <CAKmqyKPeyseoGFtpHefWvLWSjjpZaAbBbSoQZyvb5Ti3SiGKsw@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] docs/about/deprecated: Document RISC-V "pmu-num"
 deprecation
To: Rob Bradford <rbradford@rivosinc.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, atishp@rivosinc.com, 
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com, 
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, 
 "reviewer:Incompatible changes" <libvir-list@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a36;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa36.google.com
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

On Thu, Oct 19, 2023 at 1:47=E2=80=AFAM Rob Bradford <rbradford@rivosinc.co=
m> wrote:
>
> This has been replaced by a "pmu-mask" property that provides much more
> flexibility.
>
> Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
> Acked-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  docs/about/deprecated.rst | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 2febd2d12f..857b5d4fc4 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -405,6 +405,18 @@ Specifying the iSCSI password in plain text on the c=
ommand line using the
>  used instead, to refer to a ``--object secret...`` instance that provide=
s
>  a password via a file, or encrypted.
>
> +CPU device properties
> +'''''''''''''''''''''
> +
> +``pmu-num=3Dn`` on RISC-V CPUs (since 8.2)
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +In order to support more flexible counter configurations this has been r=
eplaced
> +by a ``pmu-mask`` property. If set of counters is continuous then the ma=
sk can
> +be calculated with ``((2 ^ n) - 1) << 3``. The least significant three b=
its
> +must be left clear.
> +
> +
>  Backwards compatibility
>  -----------------------
>
> --
> 2.41.0
>
>

