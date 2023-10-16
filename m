Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A264CDB465
	for <qemu-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 03:50:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qsEcW-0003zd-Tz; Sun, 15 Oct 2023 23:50:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qsEcU-0003yj-M8; Sun, 15 Oct 2023 23:50:18 -0400
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qsEcT-0006FJ-6T; Sun, 15 Oct 2023 23:50:18 -0400
Received: by mail-ua1-x934.google.com with SMTP id
 a1e0cc1a2514c-7ab5150a7b5so3503869241.0; 
 Sun, 15 Oct 2023 20:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697428215; x=1698033015; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tko2mzIux2MS6GKgsFFe42LvhDZXk7nai0rjdXSqA9I=;
 b=L8E1r/kPZvQB1FcL9NDwT08e92Py223U8v3Qjz+3Du1xZAsJQw/WcKqrcLYxDnOA5U
 28HgoQEc58w6psBbzI0rB2yXda9XosKo5zpfVNMokMfl2yjb+yf/iDp9DNFEzarfFFVF
 ITwOsFUwjdsoCtNOy6aNre0hevWmQ6l+2o2go+3Wvnq6ZofcmmqTqGPAcY30D8ha3u0G
 vk7U3PZBimUPUwDGLOBIl0NjlCD/NeMbhb0im2M1hVYHhQNOvvwZu5aygabHK0o06Bgk
 hJH0MTLQCZi5hMDelNGPtMR2IHQ3XdGP3xF+BTlUM02f7V+oNsTPI5OreggQIEzBq8aE
 WdEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697428215; x=1698033015;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tko2mzIux2MS6GKgsFFe42LvhDZXk7nai0rjdXSqA9I=;
 b=T0wfiGrQYr+U9zwcidY2lAWt+C5RgrillZW+wF9iHnLfbGN23zQrri0QrZx6jc9Kjp
 iJqLySdEnl8OC8SeOy0UhJG4vXuppzE5vdgQq3RVhMaB0PMIsCcU9UhnEI2abayxV1YY
 yyks8Mk4YZ0/s186krbmrzrR1wD7hAQbmnN33mQoCGj05rPQvi3Isksuf69Mh51e1YGY
 4PDLbIn529X/WVwXpn2gFh2GFum5K48zI0NAbAG7ldPE9kgkjhSLACW7SGzz1oQ06RR+
 vl9nC27KaNfhLxIlbLYUY5hQtHYOVFLy4S3WOWgVnHRLOOWEsTeK+HaCQwJmjQP1YhNK
 FUKQ==
X-Gm-Message-State: AOJu0YwE/0I8K5TRjdFzaJqgci7o1gYHIkJtv86FIYXe6XHET6wMs/L2
 +MHSQJOTrJwW1QZGV7aR0rFkPz6oRzeN4cWIpv8=
X-Google-Smtp-Source: AGHT+IGSKWmYKskRoW68zYKkltxRfWTidMoLscpgtYKw+9aMpADlggVx0gxJCUcTM6QBFoH7BIi2LRxE1uoT5mdbqAU=
X-Received: by 2002:a67:c19b:0:b0:454:4484:179c with SMTP id
 h27-20020a67c19b000000b004544484179cmr3439783vsj.7.1697428215580; Sun, 15 Oct
 2023 20:50:15 -0700 (PDT)
MIME-Version: 1.0
References: <20231011145032.81509-1-rbradford@rivosinc.com>
 <20231011145032.81509-7-rbradford@rivosinc.com>
In-Reply-To: <20231011145032.81509-7-rbradford@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 16 Oct 2023 13:49:49 +1000
Message-ID: <CAKmqyKNV_HWT0MoXOxeNf6VWasDZkpeawrrHtOUuexXmGJMJtA@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] docs/about/deprecated: Document RISC-V "pmu-num"
 deprecation
To: Rob Bradford <rbradford@rivosinc.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, atishp@rivosinc.com, 
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com, 
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, 
 "reviewer:Incompatible changes" <libvir-list@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::934;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x934.google.com
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

On Thu, Oct 12, 2023 at 12:52=E2=80=AFAM Rob Bradford <rbradford@rivosinc.c=
om> wrote:
>
> This has been replaced by a "pmu-mask" property that provides much more
> flexibility.
>
> Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
> ---
>  docs/about/deprecated.rst | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 8b136320e2..37f3414ef8 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -361,6 +361,16 @@ Specifying the iSCSI password in plain text on the c=
ommand line using the
>  used instead, to refer to a ``--object secret...`` instance that provide=
s
>  a password via a file, or encrypted.
>
> +CPU device properties
> +'''''''''''''''''''''
> +
> +``pmu-num=3Dx`` on RISC-V CPUs (since 8.2)
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +In order to support more flexible counter configurations this has been
> +replaced by a ``pmu-mask`` property

Can we give an example of how to migrate to pmu-mask?

Alistair

> +
> +
>  Backwards compatibility
>  -----------------------
>
> --
> 2.41.0
>
>

