Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5913ACCF9EA
	for <qemu-riscv@archiver.kernel.org>; Thu, 30 Oct 2025 03:58:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vEJoH-0004bP-Il; Wed, 29 Oct 2025 23:58:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1vEJoF-0004bG-75
 for qemu-riscv@nongnu.org; Wed, 29 Oct 2025 23:58:47 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1vEJoB-0002IZ-L0
 for qemu-riscv@nongnu.org; Wed, 29 Oct 2025 23:58:45 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-63c3d7e2217so855295a12.3
 for <qemu-riscv@nongnu.org>; Wed, 29 Oct 2025 20:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761796718; x=1762401518; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ra9qUgDea4oKl33xzGequJ4DqMuIUibU+BNR0ZsASRw=;
 b=VgLhX3SRdO4xxwGTk1sWvPIIhBdOEVSVG6r3tjsM9SxIKDGvXmxVpQanCE/wXHzIDZ
 YV+oOXR6K9QGzISJi7SZFzXr/o3YNXM/e8yhaBU+7LtC4Qflz06gkWbjLx042DaQCXXq
 pXUpvvOvMKImv9SMBKsbYeuhingTBv1WrNMFtjTRI9S2UXkfm/gtTd5xB2UFC0Fzj19s
 54D8sqBjCVYgHMbh56i9qa261MBc+NSeXOll7OLHClwMereqzUxEDvT7sc7073bb/7D/
 qJS32669ynM9ns+A74prRZ0yLBLLtnm313lCW7TpeE+yx6yjSFWng2/g8TyUQPUbsJF5
 AZ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761796718; x=1762401518;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ra9qUgDea4oKl33xzGequJ4DqMuIUibU+BNR0ZsASRw=;
 b=HMKy5va2ZCMRnHSSaRA9nyusbpzB0JWqquCPTQhJ1EZFuwPqIKGvuNob++LCVpWUj1
 quxMtV8IlpkJ2NPLfOdOoUuf7kJwfkep/uvGcAslCB3ICJZAn9Ed0XdEeee4bjRcowT/
 mN1qXQ2BOwkyLoaHQo476uTeySV1C8nE8VEC7Xz/VIqHfUmfy0rpP10DAFaNZVOpCx/7
 VFJAHeJnNkJqIzlxPdW7esAyRI6XpxyKpzrplHFcvGPbivOuBf4wvYeexNvwnxGnO+yA
 N+wp3iUPmbmmDdcHZ1WOxShf5UWBznH+IEJF405bHkPPr6qsr90c2C1eofs5E+HLg7y2
 /9rQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2nIVnSBmVYr9JQICDiLIwwTMNFuGP+p4WZUlji8+6h5/X9ez8II2lyzBPfGTDpXXiz1xuMDiF4h9R@nongnu.org
X-Gm-Message-State: AOJu0YzvWHCt+LFkrWkhqN+10QEJQEx8y5ibbyeWgq7ABkOy8QWH1qg+
 z/tGq6XJBOZhLvK0EayFNZdm/bPY8jR5fJgcsSFFddbdkuuKvAWNOiqA3biZ3S/R+QdlkU1S92J
 uI8QL4YmjYqStVdN24yEBmETTcXQbo1M=
X-Gm-Gg: ASbGncsOlXwJQ+HRXtvorh37m13C9yp+vz1wAT6oBN9G7cd1It9XHASyJYpBoj/++ql
 NXzy+bv71JT+6sYYy5IFu4ZghXCGL9/f/J+3iBBTU4HG3DRH2aitdzo5bLz5JKID/3CsiJ9a+9E
 3KISWZuBkUwrjKGaAEtEH8GK7M/h2v4J8QWNkAySiOKSnzTAwZQRo4t1Z1jAqGHQmslSsgDuInk
 RiIWc+FyZ2bXlPQoc1pomq0faiwp9jkzpgtkKMwd4T5dunYaTvk6ERoA8HgTXIN5oGvHuBpSsM6
 LRSNXFKd5Fbf6H8=
X-Google-Smtp-Source: AGHT+IGBH2jQwtWAlZi4rqnhfwr2g/dPAQ5s/91fRWHSqEbW75AfIDkYYia+0A1bPyeh1At2J+rryca10xRj94cTppo=
X-Received: by 2002:a17:906:6a2a:b0:b0a:aa7e:a191 with SMTP id
 a640c23a62f3a-b703d5fa89dmr602228466b.57.1761796718073; Wed, 29 Oct 2025
 20:58:38 -0700 (PDT)
MIME-Version: 1.0
References: <20251027112803.54564-1-thuth@redhat.com>
In-Reply-To: <20251027112803.54564-1-thuth@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 30 Oct 2025 13:58:11 +1000
X-Gm-Features: AWmQ_bkXDcw830nZ8jomMV8HJqeeNF80oI26AZ6r3ccjkfiO2M2H2yDsJuPgAq8
Message-ID: <CAKmqyKONHJBpfCi-C6KUFOXmNG2N4gOSLTTwPhou38YS2C+miQ@mail.gmail.com>
Subject: Re: [PATCH] tests/functional/riscv64/test_sifive_u: Remove unused
 import statement
To: Thomas Huth <thuth@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x52c.google.com
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

On Mon, Oct 27, 2025 at 9:29=E2=80=AFPM Thomas Huth <thuth@redhat.com> wrot=
e:
>
> From: Thomas Huth <thuth@redhat.com>
>
> skipIfMissingCommands is not used here, remove the import to silence
> a pylint warning for this file.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  tests/functional/riscv64/test_sifive_u.py | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/tests/functional/riscv64/test_sifive_u.py b/tests/functional=
/riscv64/test_sifive_u.py
> index 358ff0d1f60..847f709da12 100755
> --- a/tests/functional/riscv64/test_sifive_u.py
> +++ b/tests/functional/riscv64/test_sifive_u.py
> @@ -13,7 +13,6 @@
>  import os
>
>  from qemu_test import Asset, LinuxKernelTest
> -from qemu_test import skipIfMissingCommands
>
>
>  class SifiveU(LinuxKernelTest):
> --
> 2.51.0
>
>

