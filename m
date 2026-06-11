Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30662CD8C9D
	for <qemu-riscv@archiver.kernel.org>; Thu, 11 Jun 2026 04:19:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wXWs4-0003dw-V7; Thu, 11 Jun 2026 00:18:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wXWs3-0003dn-Tl
 for qemu-riscv@nongnu.org; Thu, 11 Jun 2026 00:18:23 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wXWs1-0003jE-VB
 for qemu-riscv@nongnu.org; Thu, 11 Jun 2026 00:18:23 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-68c19f1f3ceso12081372a12.2
 for <qemu-riscv@nongnu.org>; Wed, 10 Jun 2026 21:18:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781151500; cv=none;
 d=google.com; s=arc-20240605;
 b=ORCYoh8DcgbG3k2+l4JF4FBGE7ZODHMgkgT9CTHacgPWET/ePRwtczubPwLnl0ZsW9
 AOCsrBgCe0hp9bMckqsleRx+ngc8K5/DkWPztcEK/NYm1SBU/522eXyZSn+JzBK8G/hW
 NLc/7CCoIvx2gYP4mUSC+RpNBp3Nt5SAo4MLLHZUrUD0SJx6vFV/wDLEo+l7rNHgS8mB
 MfI++V2q9cqEwGkY7oonNFf3ksoy7orbyRi7BL4pMpjspTCmh9qL9vG1Gen41YYzTFtu
 tiuvgQfDSAbGBfO/6nHOpE/XXqT/rLlPuFl3lIXmAH7Uq87asV92MF2d4OUxVvPJqHz+
 cC2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=wy+S6RRfCW9Ayyv0MaBvn9PEJAH1zd8qYVAPVxJvIqc=;
 fh=Xh44Eweznu3U/LRxViqSEOgIXtQq075GvbV0U+ynRDw=;
 b=JEg5vhJ0gh0fzGH8mA+fXSHKiqbgMVoRrP1EAI23MvNmYK+uipMPyHqS0iKHKc0iCv
 pijOFPAMHnNS0YPuZ/UNYSXowWR7xGvwigGBFrQCHQz+e6wWXyRycrwR1P0cmzvzB4zR
 L7JpYg08g4c2EHAmYivirolTAxukOKqtDnMcObkdbSsWlUTgXmfBdifSDuTZoYHt0hh3
 Y4uAO4hr6asuc6DetA4nsKm2drBXIb+osYnN7O1Znpc0ut5M21VxlYxgZWNS6FoAEYL/
 zjpe8/iamEhk04jqfxgEnlIg9BgkUgxTpbiY6/pwEtSMCho1Ltod39yze6FMc0Mme3DK
 bqBw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781151500; x=1781756300; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wy+S6RRfCW9Ayyv0MaBvn9PEJAH1zd8qYVAPVxJvIqc=;
 b=HFUx1xYq/0hU3vmarP1e4kuUGTS03gPyJn5h1shQhUbchGxCuSsiXeJ9GpEtcllmGf
 kTE1MECkb/GQmRu/kK2j3hPyTunwBjjLICnqzM/eun78q+2LVq5JAoew+I7UKx6mpWk+
 5T2wEc8Mmao45FuzZGLzXmYCtWMWpWQphAJutEgMDK+DiegcT53jf6oMcCqWS9AR8U8v
 WcA4GksKsvKPDFRudwSmq2twmYHZ0DDF5rj7AphqGRBL6CJTIuw9jDD2uzzhXUcuj9jE
 MKzUSGY6TT53NlU5TlZXneMzS+nqnsGiCUacCnpv515dBWKfr9As6OLKTf86NepEXa3t
 Ekbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781151500; x=1781756300;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wy+S6RRfCW9Ayyv0MaBvn9PEJAH1zd8qYVAPVxJvIqc=;
 b=et4Xl32ZaFkYbCZvUxwKdxf9HiKvfg6nvZU2CNcqiyX6j0rv4nAKRPpGI6F+L0VjBM
 kuHoTvzz44YNBN+55qjjxAgy00/FJtAPKBVJ2jsCLrdvOyhjFeeA0qJJz1nXJrWLaXFJ
 boCDjbpr6pp5xgjiIdocgIsWGwfevJaziNg4dBQSmOlgc5XOV31CXbIOTHC9gJ1SAADR
 D/XZmsLSIg5atRbSXai3jtT/WhltbQU6AC6CKjI0EGLOmSn/cscb79i17EbJBLEI6VKx
 RCbdebCfhhAqJ+tygFsapwwKMRrJ/IEBCoisriYyp12kVlmX/xyGdCxIL/uzuAyNRkxk
 vLuw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9ag32v9/EaJmb912KsHpIMJa/lhFNQKSBqK0KhJBIeqybopPXsmSVhNxwbSIwZmdgaFX10TWpA6bKJ@nongnu.org
X-Gm-Message-State: AOJu0YwVYp0x60ArxdUnrheWcIoZ8HTlfHQHVKwPttWzU/8zOeULE623
 OQ9g0jFl1YiEJ9iLi2x1gNL4Zezf9M5oN17Fon575+o/SUc3pWxKccWImausM51uNQyW5IL7eCu
 uM/FuSmQSQCWNLqrlgcsCEAvykKWtdl4=
X-Gm-Gg: Acq92OFOQfpPUadZtZVgrF80GBqzt5gzzWRr4dydj++wOUw0HLdgMJiJRNp8qfHNhHL
 ys2C9Mi4xX41MP/rpWlg/3axip1RIJTYOzmhPEGZ4cbIc4ainiTomUG1Z1NXB3SoOpR9GdtmVQW
 ouXbb7ytREzZ4tLCTU5EPjxH6YJa3x5Gy7vRqouX1CfQqLG3MaJoV3cr952g1TMo0j6HKKtuQ2o
 8jnieQodIGWzZaRqM6smjThlsb1dsAKdidd66zIHEgyT1/0TvNrffoI1AtkpK4tbk8xrfM/MFhw
 LSunpW3NK8QPyXf4t+wlNXOtFrn5RM9UDvSFM5lRaYr6yviD
X-Received: by 2002:a05:6402:1d52:b0:691:956a:cf6a with SMTP id
 4fb4d7f45d1cf-6930e28a84bmr409476a12.12.1781151499601; Wed, 10 Jun 2026
 21:18:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1778516731.git.chao.liu.zevorn@gmail.com>
In-Reply-To: <cover.1778516731.git.chao.liu.zevorn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 11 Jun 2026 14:17:53 +1000
X-Gm-Features: AVVi8CcAQajcjNwT7j5gxtDMrfqhYAUoUovU2yeoFkGRStNK6om151TRmZSGtIw
Message-ID: <CAKmqyKMU+hMjaevvKLNve3=wnWJXRGMasy4BThnfZ6o0CizTNA@mail.gmail.com>
Subject: Re: [PATCH v7 0/5] Add support for K230 board
To: Chao Liu <chao.liu.zevorn@gmail.com>
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Christoph Muellner <christoph.muellner@vrull.eu>, 
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Tue, May 12, 2026 at 2:32=E2=80=AFAM Chao Liu <chao.liu.zevorn@gmail.com=
> wrote:
>
> This patch series adds support for U-Boot + OpenSBI + standard Linux kern=
el on
> K230 board. Thanks to Peng Jiang, Mig Yang, Renzao Ren, Yao Zi for their =
help.
>
> The current patchset fixes some bug and tag errors, Thanks to Alistair an=
d
> Conor for the review.
>
> Test command with the direct Linux boot:
>
> ```
> $QEMU -M k230 \
>       -kernel [Image] \
>       -dtb [k230-qemu.dtb] \
>       -initrd [rootfs.cpio.gz] \
>       -nographic
> ```
>
> The k230-boot-assets repo [1] provides K230 Linux kernel images built wit=
h
> k230-sdk and Yocto.
>
> For more information, see docs/system/riscv/k230.rst.
>
> The GitLab CI result [2] passed all cases.
>
> PATCH v7 changelog:
> - Patchset: Removed invalid tags for patchset.
> - Patchset: Updated the K230 datasheet link in the patchset comment heade=
r.
> - Patch 2: Removed the unnecessary changes to MAINTAINERS.
> - Patch 2: Fixed an Oops caused by accesses to an unimpl UART MMIO addres=
s.
> - Patch 2: Adjusted the K230 machine hart count to 1.
> - Patch 2: Supported direct boot linux with `-kernel`.
> - Patch 3: Aligned the WDT interrupt number with the K230 datasheet.
> - Patch 5: Updated k230.rst Linux boot docs.
>
> PATCH v6 changelog:
> - Patchset: Rebased on the latest Alistair's riscv-to-apply.next branch [=
3].
> - Patch 4: Picked up Fabiano's Acked-by.
>
> PATCH v5 changelog:
> - Patchset: Rebased on Alistair's riscv-to-apply.next branch.
> - Patch 2: Fixed reset vector ROM jump to trap-handler bug.
>
> PATCH v4 changelog:
> - Patchset: Rebased on the latest master branch.
> - Patchset: No functional changes from v3.
>
> PATCH v3 changelog:
> - Patch 1: Align T-Head C908 CPU's RISC-V extension with XUANTIE-QEMU.
> - Patch 2: Adjust PLIC and CLINT addresses to match K230 datasheet.
>
> PATCH v2 changelog:
> - Patch 1: Add Svpbmt extension support for the T-Head C908 CPU.
> - Patch 2: Move the k230.rst definition from MAINTAINERS to Patch 5.
> - Patch 5: Apply Daniel's bugfix to build the k230 documentation successf=
ully.
>
> PATCH v1 changelog:
> - Patch 1: Add T-Head C908 and C908v CPU support.
> - Patch 2: Add K230 board initial support(big core is not supported yet).
> - Patch 3: Add Programmable Watchdog Timer (WDT) peripheral support.
> - Patch 4: Add QEMU test for K230 watchdog.
> - Patch 5: Add documentation for K230 machine.
>
> ---
>
> Link:
> [1] https://github.com/zevorn/k230-boot-assets
> [2] https://gitlab.com/chao23.liu/qemu/-/pipelines/2515556858
> [3] https://github.com/alistair23/qemu/tree/riscv-to-apply.next
>
> Thanks,
> Chao
>
> Chao Liu (5):
>   target/riscv: add thead-c908 cpu support
>   hw/riscv: add k230 board initial support
>   hw/watchdog: add k230 watchdog initial support
>   tests/qtest: add test for K230 watchdog
>   docs/system/riscv: add documentation for k230 machine

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  MAINTAINERS                    |  11 +
>  docs/system/riscv/k230.rst     | 113 +++++++
>  docs/system/target-riscv.rst   |   1 +
>  hw/riscv/Kconfig               |  11 +
>  hw/riscv/k230.c                | 524 +++++++++++++++++++++++++++++++++
>  hw/riscv/meson.build           |   2 +-
>  hw/watchdog/Kconfig            |   4 +
>  hw/watchdog/k230_wdt.c         | 296 +++++++++++++++++++
>  hw/watchdog/meson.build        |   1 +
>  hw/watchdog/trace-events       |   9 +
>  include/hw/riscv/k230.h        | 149 ++++++++++
>  include/hw/watchdog/k230_wdt.h | 121 ++++++++
>  target/riscv/cpu-qom.h         |   2 +
>  target/riscv/cpu.c             |  51 ++++
>  target/riscv/th_csr.c          | 380 +++++++++++++++++++++++-
>  tests/qtest/k230-wdt-test.c    | 189 ++++++++++++
>  tests/qtest/meson.build        |   3 +-
>  17 files changed, 1864 insertions(+), 3 deletions(-)
>  create mode 100644 docs/system/riscv/k230.rst
>  create mode 100644 hw/riscv/k230.c
>  create mode 100644 hw/watchdog/k230_wdt.c
>  create mode 100644 include/hw/riscv/k230.h
>  create mode 100644 include/hw/watchdog/k230_wdt.h
>  create mode 100644 tests/qtest/k230-wdt-test.c
>
>

