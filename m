Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE2EBC4725D
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 06:53:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rRoBG-0001t1-Cx; Mon, 22 Jan 2024 01:53:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRoBF-0001so-8B; Mon, 22 Jan 2024 01:53:13 -0500
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRoBD-00011Q-Lj; Mon, 22 Jan 2024 01:53:13 -0500
Received: by mail-vs1-xe2a.google.com with SMTP id
 ada2fe7eead31-46777099deeso385738137.0; 
 Sun, 21 Jan 2024 22:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705906390; x=1706511190; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E8REJkew4LagY2rTEWrTU8d9T5j7ISmZiOk9Othppc8=;
 b=TGPP/y9mWjM7H23Ro7pKBK2HygdI6VoWkbpK0ztDSKHGsRAgOSdh9S4IpE13FzexZE
 sfZ+jEzi+DvJqLwruXIyxmLFhnXyrnuUeJPuNhdTZveTymnzYB6y6EU6X7IgB5P8uG7r
 BvHSi4J67rw22vqJarQv0uqPKGBHRj5OykgN396YHFuRs9vefWnU0K+zBcDDhc2owXYY
 ySHvEkDe/Q8kyzOPODXLuPNTFMpvtza0tcO/qY5016kUizXMkHZ4hWD5jOoGYflrl/qH
 ItWYq6GYnottMpPKawPV0vM6WeHuY/QVbl4Crugzmxs2pk+/OMBWt1ENE7ekvolBtW+H
 9GPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705906390; x=1706511190;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E8REJkew4LagY2rTEWrTU8d9T5j7ISmZiOk9Othppc8=;
 b=PFDbU4Yu0cJzv7fY4c86+G+8Gn65A3I7Q5Msh9s5j/TSkGAcvSRQArA/CzXLxjRvhs
 n1UlNR1sxYirrBKrXv8VuJerv3IRiQqXCEo32dhPdXUFeXZZp/dpPBDqjKNn3JqDHldP
 1cTUFCCNCgX9OI2+/TUiBTcB1GrCSAZYj5FBmEw/3GNhuYrswULLd4+lIE/m21Jn6241
 GduDUOPoq1fWuEi01MdpisPOhTdAP+sYe7cGKIzEg6YTBWq9DWlnulobEA+SaB16Bhl/
 TEEcTwxxSipENNOMEhKu9wDNL6+JnZLBbmfnhP0DYFtMVGm2eDwTo3DQcjvJHkK74vzA
 wJdw==
X-Gm-Message-State: AOJu0Yyu5o1fhfZjRm0R2Hbpj9Fs5YJ9+U59TOoZqYlADGvUjojRZiCq
 HXBQbu1l0jbD0fYRyowV3UYndMNnOLQxegYhH7eGyUhL3UwvwtZY5yaJVpXNVPqdofV2MZv08hE
 Io8ZZlYyd+go2muXu6CU8BrcbYOo=
X-Google-Smtp-Source: AGHT+IEL5c6bdzgE5u+mdjDrjwxVSOF1lkDpFBxTeU1o3zdkR9RnMOBCOngjwl6ZTMp+U41f4Zd0jWJLhdbBkSgBTRk=
X-Received: by 2002:a67:b448:0:b0:469:a69e:1f12 with SMTP id
 c8-20020a67b448000000b00469a69e1f12mr990622vsm.1.1705906390298; Sun, 21 Jan
 2024 22:53:10 -0800 (PST)
MIME-Version: 1.0
References: <20240109102930.405323-1-me@deliversmonkey.space>
In-Reply-To: <20240109102930.405323-1-me@deliversmonkey.space>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Jan 2024 16:52:44 +1000
Message-ID: <CAKmqyKMDxtqsNTBqVZFaHO8XusyD+vXO6=mJ0QZpAaAUTKbvcA@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] Pointer Masking update for Zjpm v0.8
To: Alexey Baturo <baturo.alexey@gmail.com>
Cc: richard.henderson@linaro.org, zhiwei_liu@linux.alibaba.com, 
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu, 
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2a;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2a.google.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 TVD_PH_BODY_ACCOUNTS_POST=0.001, TVD_PH_BODY_META_ALL=1.587,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On Tue, Jan 9, 2024 at 8:31=E2=80=AFPM Alexey Baturo <baturo.alexey@gmail.c=
om> wrote:
>
> From: Alexey Baturo <baturo.alexey@gmail.com>
>
> Hi,
>

Do you mind including a pointer to the exact spec (a Github link with
the SHA or tag is great) that you are targeting? We are having issues
with a different spec, so it will be helpful in future to know exactly
what the developer was targeting in the cover letter

Alistair

> Patch series updated after the suggested comments:
> - removed J-letter extension as it's unused
> - renamed and fixed function to detect if address should be sign-extended
> - zeroed unused context variables and moved computation logic to another =
patch
> - bumped pointer masking version_id and minimum_version_id by 1
>
> Thanks
>
> [v3]:
> There patches are updated after Richard's comments:
> - moved new tb flags to the end
> - used tcg_gen_(s)extract to get the final address
> - properly handle CONFIG_USER_ONLY
>
> Thanks
>
> [v2]:
> As per Richard's suggestion I made pmm field part of tb_flags.
> It allowed to get rid of global variable to store pmlen.
> Also it allowed to simplify all the machinery around it.
>
> Thanks
>
> [v1]:
> Hi all,
>
> It looks like Zjpm v0.8 is almost frozen and we don't expect it change dr=
astically anymore.
> Compared to the original implementation with explicit base and mask CSRs,=
 we now only have
> several fixed options for number of masked bits which are set using exist=
ing CSRs.
> The changes have been tested with handwritten assembly tests and LLVM HWA=
SAN
> test suite.
>
> Thanks
>
> Alexey Baturo (6):
>   target/riscv: Remove obsolete pointer masking extension code.
>   target/riscv: Add new CSR fields for S{sn,mn,m}pm extensions as part
>     of Zjpm v0.8
>   target/riscv: Add helper functions to calculate current number of
>     masked bits for pointer masking
>   target/riscv: Add pointer masking tb flags
>   target/riscv: Update address modify functions to take into account
>     pointer masking
>   target/riscv: Enable updates for pointer masking variables and thus
>     enable pointer masking extension
>
>  target/riscv/cpu.c           |  21 +--
>  target/riscv/cpu.h           |  46 +++--
>  target/riscv/cpu_bits.h      |  90 +---------
>  target/riscv/cpu_cfg.h       |   3 +
>  target/riscv/cpu_helper.c    |  96 +++++-----
>  target/riscv/csr.c           | 337 ++---------------------------------
>  target/riscv/machine.c       |  16 +-
>  target/riscv/pmp.c           |  13 +-
>  target/riscv/pmp.h           |  11 +-
>  target/riscv/tcg/tcg-cpu.c   |   5 +-
>  target/riscv/translate.c     |  46 ++---
>  target/riscv/vector_helper.c |  14 +-
>  12 files changed, 153 insertions(+), 545 deletions(-)
>
> --
> 2.34.1
>
>

