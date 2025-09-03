Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D5BDCA0FF2
	for <qemu-riscv@archiver.kernel.org>; Wed,  3 Sep 2025 05:04:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1utfet-0003AR-S0; Wed, 03 Sep 2025 01:03:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cjchen@igel.co.jp>) id 1utfer-00038o-1H
 for qemu-riscv@nongnu.org; Wed, 03 Sep 2025 01:03:45 -0400
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cjchen@igel.co.jp>) id 1utfen-000555-Js
 for qemu-riscv@nongnu.org; Wed, 03 Sep 2025 01:03:44 -0400
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-337cc414358so19817591fa.3
 for <qemu-riscv@nongnu.org>; Tue, 02 Sep 2025 22:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20230601.gappssmtp.com; s=20230601; t=1756875818; x=1757480618;
 darn=nongnu.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gGqtiuEAP+uxQoSASrzRQRLPFJmgkt08hGHwHuet5+g=;
 b=etVkU9njZoYTzM0C57lUe4E48AEtbBYvqKYZP0K+JMk+9fiqpbL3q0d1JYl9lMfIjz
 AbQz/wXKjOw73T3dBSHCchygAeB9HAylm6O3XEyJxzr057Bs2uUyCgIfaf9lQHMhUBfv
 8/Hzta8W2WSh2wnZr1KZlntDAuZzA8IsD/zsKW8OTVqORiQn9pORfV1LoQPxx6x0kNgo
 aaygpl02uf3DIpmuemmhS0j7ioviOiADY+EQxBZSBVCa/e2NWfoLyeOx0Fh2Z8Nttyzr
 UFhMOg/6yyYNE+YvHvn1BSXNtIEDSzASw2MA7kD0tBW2qGZNr77yhtz6YwmB5vra5sll
 kkrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756875818; x=1757480618;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gGqtiuEAP+uxQoSASrzRQRLPFJmgkt08hGHwHuet5+g=;
 b=bXPqcOuBxGFFuUC6bKYcEULGyV+W7WjKmAh0XrXT+ukdc6X1x1DleNVlIkT6Mk25s8
 8Osf6ZOpddRXubAS9eRS/d0r5wWLyBeB6YQk/3zLoedLsFqhLrKD/Kk9gaxLSu87jYok
 kCiq/3NAcROf7eajEMF+pV7GFlp83oT0Qqdc5b3cGwzv7Wk0scAo4x5D0tpoN4MWDs1i
 1EJw7XPFLPTXvrN5jAGCc2i8UaqvJkoWV2IYifuj+nJDR/VKO6t5lxsyvQicBkcAawMO
 bqWPyVR9zV0SVyUEmoETLetU2OO0Vu3oHSfUsMbO5i07Os3Fn//eeYbAGhTGtAxxP0SX
 YuWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmfsM3bP8OIHblOT7tlUgMRFjlVm7oLWkZtU/7AWXzbJvSgyptKMTwtxQVnmXzlpR0c4Rme6ZLFeDa@nongnu.org
X-Gm-Message-State: AOJu0Yz4qnhG8OjUCBdkbZTTxwpCV/90TWGwFvSqdCbGoWSlUGWdBCT6
 wZal22oB5aGX7a3ISgLD51nJiNkkX5s4IfeJ0JlE4F1bM2rZ00lh4nH8iUhiq+fe3B0RIKU7nep
 oZLwFlA0i5FVEfU0kbIjOhD9DMi2YD75hfY6HK7OZ0g==
X-Gm-Gg: ASbGncsa6sYwJcVdecuHmOernOTQksYb5oe6YQIrBGsL9SNMyWDv8HrZIVdpXbfZUi0
 Jsu2QstyDCat4RlE9/PDbUgDLUYtMU6nq8vD1INHy6BZc01zV44Ky6p1pyqnLgy5fomXRWk/zkb
 Re53AjWgqY3vbKu5/kl0qmXcUCadeA0FW/erBA8le5wl57XPJq4ajrOrAoOGAd2nffC6Rr4eOdQ
 dJq9QjCvQ==
X-Google-Smtp-Source: AGHT+IHgvmDWiRNlAU0x/ZNMDf/VXIkfstbQZVdMadk2hxAvOhszwx8IWk48q8KBhMkhpACL6dstTR8FBLliNAHGkVI=
X-Received: by 2002:a05:651c:e17:b0:336:5e1f:b1ec with SMTP id
 38308e7fff4ca-336cad33ce6mr33492931fa.31.1756875817531; Tue, 02 Sep 2025
 22:03:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250822092410.25833-1-cjchen@igel.co.jp>
In-Reply-To: <20250822092410.25833-1-cjchen@igel.co.jp>
From: chen CJ <cjchen@igel.co.jp>
Date: Wed, 3 Sep 2025 14:03:26 +0900
X-Gm-Features: Ac12FXzX5MnvIZz1nu08VYCcewIvouzU9-UuZXku9q5iR9ysqtEfhyhENL7sNWo
Message-ID: <CAAMq-Y86UY7LNe-p2P_d8mw7FgTqLm=HQdqbMvV8xxTdsZmx1A@mail.gmail.com>
Subject: [Withdrawn] [RFC PATCH v2 0/9] support unaligned access to xHCI
 Capability
To: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-arm@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Keith Busch <kbusch@kernel.org>, 
 Klaus Jensen <its@irrelevant.dk>, Jesper Devantier <foss@defmacro.it>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Tyrone Ting <kfting@nuvoton.com>, 
 Hao Wu <wuhaotsh@google.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>, 
 Tomoyuki Hirose <hrstmyk811m@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=cjchen@igel.co.jp; helo=mail-lj1-x229.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

I would like to withdraw this patch series.

Sorry for the inconvenience, and thank you for your understanding.

CJ Chen <cjchen@igel.co.jp> =E6=96=BC 2025=E5=B9=B48=E6=9C=8822=E6=97=A5 =
=E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=886:25=E5=AF=AB=E9=81=93=EF=BC=9A
>
> This patch set aims to support unaligned access to xHCI Capability
> Registers.
>
> To achieve this, we introduce the emulation of an unaligned access
> through multiple aligned accesses. This patch set also adds a test
> device and several tests using this device to verify that the
> emulation functions correctly.
>
> Using these changes, unaligned access to xHCI Capability Registers is
> now supported.
>
> During development, I required a lot of 'MemoryRegionOps' structs with
> its own read/write functions for tests. In the QEMU project, a large
> number of similar functions or structs are often written in '.inc'
> files. I followed this approach for the test functions but would
> appreciate feedback on whether this is appropriate.
>
> ---
> v1 ... v2:
>    - Fix the typo of ops size of big-l-valid.
>    - Replaced the huge macro blocks with dynamic loops that fill in
>      the `MemoryRegionOps` arrays at runtime.
>    - Remove test cases valid.unaligned =3D false,impl.unaligned =3D true.
>    - Modification to the memory document about the alignment issue.
>    - Update the npcm7xx_fiu, mx_pic and risc-v-iommu configuration
>      to align with the unaligned-access policy.
>    - Document memory.rst clarify that .valid=3Dtrue,.impl=3Dfalse causes
>      split unaligned accesses (may have side effects); forbid
>          .valid=3Dfalse,.impl=3Dtrue via assertion.
>
> ---
>  CJ Chen (4):
>   doc/devel/memory.rst: additional explanation for unaligned access
>   hw/riscv: iommu-trap: remove .impl.unaligned =3D true
>   hw: npcm7xx_fiu and mx_pic change .impl.unaligned =3D true
>   system/memory: assert on invalid unaligned combo
>
> Tomoyuki Hirose (5):
>   hw/nvme/ctrl: specify the 'valid' field in MemoryRegionOps
>   system/memory: support unaligned access
>   hw/usb/hcd-xhci: allow unaligned access to Capability Registers
>   hw/misc: add test device for memory access
>   tests/qtest: add test for memory region access
>
>  docs/devel/memory.rst               |  18 +
>  hw/misc/Kconfig                     |   4 +
>  hw/misc/memaccess-testdev.c         | 331 +++++++++++++++
>  hw/misc/meson.build                 |   1 +
>  hw/nvme/ctrl.c                      |   5 +
>  hw/riscv/riscv-iommu.c              |   1 -
>  hw/ssi/npcm7xx_fiu.c                |   3 +
>  hw/usb/hcd-xhci.c                   |   4 +-
>  hw/xtensa/mx_pic.c                  |   3 +
>  include/hw/misc/memaccess-testdev.h | 104 +++++
>  system/memory.c                     | 148 +++++--
>  system/physmem.c                    |   8 -
>  tests/qtest/memaccess-test.c        | 597 ++++++++++++++++++++++++++++
>  tests/qtest/meson.build             |   9 +
>  14 files changed, 1198 insertions(+), 38 deletions(-)
>  create mode 100644 hw/misc/memaccess-testdev.c
>  create mode 100644 include/hw/misc/memaccess-testdev.h
>  create mode 100644 tests/qtest/memaccess-test.c
>
> base-commit: 5836af0783213b9355a6bbf85d9e6bc4c9c9363f
> --
> 2.25.1

