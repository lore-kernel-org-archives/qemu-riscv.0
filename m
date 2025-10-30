Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6797CCF9E5
	for <qemu-riscv@archiver.kernel.org>; Thu, 30 Oct 2025 03:55:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vEJkE-0003q3-Cf; Wed, 29 Oct 2025 23:54:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1vEJkC-0003pt-OO
 for qemu-riscv@nongnu.org; Wed, 29 Oct 2025 23:54:36 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1vEJk7-0001uG-PK
 for qemu-riscv@nongnu.org; Wed, 29 Oct 2025 23:54:35 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b6d855ca585so125784566b.0
 for <qemu-riscv@nongnu.org>; Wed, 29 Oct 2025 20:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761796469; x=1762401269; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ShhX2sq8w0jra+/cwSABqLGKI00lTmVW+K0qPlS9gpc=;
 b=aWpqgq37W0RWdX4zrPBDkmiTvkpsKrPqrV2ARbSkopxB80EyuyOWU/AXLVokxrOX8Z
 Xx2qLxCX/bniDjsuTpIweLeGS+MHJ47jr0aYdhStTCQAxTHawGc8WbCLf0ICJhehcjpV
 EbGnghOCah17D9WH/vJzQ0FS1o/Yxce0ZYGj8clgZcGfIZ3OzwodEDfqjW/uHpL4N/2F
 crg/7M5bNpDU1WyvyUysPK8QfAGpVb5go2Q1uefdhxqOhLcitvTrgp22++lrYZW7NdR2
 u991AenrfLedwYJKZ6N/T+iXY+yOsg0lISuVXGxq2EzLX+JZuy8pVv0FmJHu8f+7gKl8
 xhtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761796469; x=1762401269;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ShhX2sq8w0jra+/cwSABqLGKI00lTmVW+K0qPlS9gpc=;
 b=VPFHcb/KGza00DaGBDhkrGpFBOx+0hanysQhIGHNfzUD4Qg3vO34bfiBMHSjncxzo/
 4UOVqR3uMiLrDf61I1ev/8ZX1YjaQmuexSTQXTSyJBLK9+p9eoD959n6gh4jXsAFH4t7
 ns0pwETFSJMgcGwjE49qBJSDPdSUdDYGS/HOoANielgogtdv86C90WiZydg3Wn/zMpHf
 QF0HaM0ORuFxBeBpeOBgqyGQPtXFP85Ji8Q03EOE9xQAti4q7vPDYYaM/qb0vk7GVYI8
 WHtDm6JIEpWTdiPCnm6RHD2CUSJysKpbanmbCuwQNtSYT5dIyIw8t4XfvLkP8KZBWEER
 1N0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqOYXcOar3uYg1fM9WxNKj6BayXSJWFukaqBVH87qT034uwYpARQ6Dh7TZ4CU/Qr6LaTULEJw1Wru4@nongnu.org
X-Gm-Message-State: AOJu0YzPETQqHRgPVPc9ZzFVPZPp/Za5ifDE+JRjpmZbT+kUY+VRiivR
 8BO0MQwWbGWlueKpCdfsuqAT8j0tJUdBZF4VQLSHrxjeEWCIAXsTqbMRgc5trgr7BL1ub3pyUHv
 WC/wMW+4PnVucnE4VGiszLvoITXKH3Yg=
X-Gm-Gg: ASbGncsppmtIqgin7ml6zDIrPFPxHstSS8O3nRc6tIvH7U086YUKxtGHR9JB+R12+/V
 3KpDsq4s5Zzh5AOybK1nIRtrfL6salKEyB7Rrhvup+OtpCmO6cSE7pftp/5mN67k5kDzu1nvZXk
 Zbk+RCwFfX2USt5g8VUGAk9ht9sKL+fkNNnvDIWrxzEbD/0e1Z+NlCTjcUlD/N1PQxxOSzvZlAY
 GWzwZsZ5Q6TCj36WPwYyMjEg49q4jAQJVT2Gv+Y0v65/6PhyD/j+VvWh7K7t7AJ6PIcdEUvEwMT
 NlToEFZtCQo+bLxvfwI7h+x9DQ==
X-Google-Smtp-Source: AGHT+IEVzwwuEq6W73TsIxQezOqgHTGs5u0J2r+slRqJsOBoanfs09MaPfcFA6mPRThPbfK/dpkwDF8omSUgGyzqPEk=
X-Received: by 2002:a17:907:807:b0:b40:33ec:51ea with SMTP id
 a640c23a62f3a-b703d2ccff4mr431597966b.6.1761796468464; Wed, 29 Oct 2025
 20:54:28 -0700 (PDT)
MIME-Version: 1.0
References: <20251027112803.54564-1-thuth@redhat.com>
In-Reply-To: <20251027112803.54564-1-thuth@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 30 Oct 2025 13:54:02 +1000
X-Gm-Features: AWmQ_bn3zCGMMx2DLtnwzeAGLNhss0rkRyCVm5pa2wMHZNJXz5YZEBTYC6G_DiI
Message-ID: <CAKmqyKNnUNBmGsO1x-G=fFgOOZ3bNbKV2yNO6PZ-qExfWvcR9A@mail.gmail.com>
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
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=alistair23@gmail.com; helo=mail-ej1-x62b.google.com
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

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

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

