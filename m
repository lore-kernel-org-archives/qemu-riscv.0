Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB4E606A324
	for <qemu-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 09:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dgrqDUa9
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJSkD-0000mb-H9; Wed, 21 Oct 2026 05:36:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xJSk7-0000lN-4S
 for qemu-riscv@nongnu.org; Wed, 21 Oct 2026 05:36:19 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xJSk5-0006Fx-Ab
 for qemu-riscv@nongnu.org; Wed, 21 Oct 2026 05:36:18 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-8b0a28a720aso4779567b3.2
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 02:36:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792575375; cv=none;
 d=google.com; s=arc-20260327;
 b=jiB27iQZ6WuwJRDZpA2dHyPDqmBBgw5eP47EZNU7iDzrukKAktMd3Gd6AE3QV7E0Ns
 jhurJRh8oDcB6B5uP2zYEgT/7ZHgpEMpffapHlNXgVEgAoN7t3PwF2yZ1fM1P6EwS6t/
 dZ6Ue9Os3o2EqeQkKVMAvTVOitHaJeAdnyNqbdk7AWUFF1l4SFGc3u8D9oxB6LmwERTv
 VtR5myT3KGCcxuwPO8x26g/TMQI+eHMvsrisD/N1g3NS70E9ejHU8o47kJAwMkRXF6HI
 Mp/mDf2U9kCPsr2tcjkNHN2V+UsVdzqBkQvZt9UDBtSI1QGt/liFQqfRdxwyG7dEqx13
 TPMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=0osC1y0GY2PfGebCDc0STpXZVu7DCU6L9/k8k4hX1nY=;
 fh=xoGN1Sb5Uecm56uZuZf0537ebhMqWJ5qlgVrn0kN/QE=;
 b=RXHYoQ1Uz1FG1ZSRZJUGEOwjjBjglbCMmO3UH8A3GGpwmIQ4Sj8Je8fJPTfkL3rrKi
 /Seu49PyBSFtbVv+OiljyeYE4uEjy/debHIF8uQSbHsKZKqbmtikywNPMpZwaz0xpbJz
 SXy61vRgsePPBUCkdQ3jECuNW0e6L2wZzxYhlDlZbpuHn0ZSzR2ciiZGKlX6yOT9gq5/
 Riq8rFMECqx8fPmrWC+JXUJYoAX5S4wjDwzErCSDRZPWCgwl/XPJ6ZR6lbESzmn14g8V
 eH91x5DoQaBYYV1kXBW4gq+5UHf5TaaWp9V0Dp6i5LEO/UYBcmVOuDyj3LmkE/rZRtm2
 VXQA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792575375; x=1793180175; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=0osC1y0GY2PfGebCDc0STpXZVu7DCU6L9/k8k4hX1nY=;
 b=dgrqDUa99pDLK3NGpkqlRQs6Jty+2q4r+yMgV9R5ZtTpXe3ouzKpH35NDhpfrG9DW5
 COl6ynEan4uXeVkr0/1s7Ae1FLzyZ6si6KXpY8TuKdD/oOu1RiHZ4fTvLdl39ZYwkjJe
 m1Mfh8YVPFln/ztmb6OdcB+Py3+0K7HQ++FJnuqM83y4NTh8Uuv4K/MhHlE+GEaWM7r2
 /DrNRXOLXhZcnaObnlFqOGZihJy9my3W1RWnr2GGSxbqsD0OewerkKhcildLzoaZViDt
 DPvTEKG3Tge5lbmlTDVOXfouNhKv99Uj2JoC38LMBz1fLihR2mqBchDZi+DOUb+IEDHv
 cdJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792575375; x=1793180175;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=0osC1y0GY2PfGebCDc0STpXZVu7DCU6L9/k8k4hX1nY=;
 b=jpWkzeR8yz8WIDrYYgX4Ho1rgncpB3Y7JQZ2Gh97ScKXvYTvq5TysVJB6rCGDt+Bqb
 n/6akK6+EcGgy7lR7nk6Q6ZsJc4butuXl1ZEA9OthGuSEWzlVp68s9vASPSNrZKPxxCh
 SyFy3oqL50u62ZnPO7dbbsAhV0umIIaqlCn5AaoRdWpnjI06f4pfFzC3EnjFurMbf7o+
 AsZDmSmfaaN54Byt4zHTPuRu7oAeriO4RKokTzoBvVSnMYwQv8tFlxWY7g5Ri8EpFGO/
 wFrs+ECDaYGkK4b1jpcKHuNFf/O1rtkTt0eKD9oekVpviyys3CLNcLj6FbDe2Ng4syE+
 BKCw==
X-Forwarded-Encrypted: i=1;
 AKwUvByfer1ppRLKQHyZouCbredF5mm/KVCoSWxESjS0XkroOL+vWKwBNGPNVkuLRSIfUYayct2TtrGoBD4i@nongnu.org
X-Gm-Message-State: AFq9FYLzTl1bjOLXkv906Nwqk2/CxSk0sXI39+jCeOmjJcC6mEDSqelw
 viwh/Oda+JiKnu1OeWdRm6sJ/QNwkmM/uzlOFixc0F9MdEPCWZn3BzRz0WIrmcxHhFHKZ5x3EUW
 eMRfdcIb5/JTpAnCAdBIzRQJkylrUKCE=
X-Gm-Gg: AYBFou1IOOHefWDOeEuKnxIwwQs+Cknm3ISSN9R5ziQQ82ZhIuOIdz0d7182HhoGj3w
 fd9h2xSfR1NvAel04yonrd+OWwFgdQIMvn1vEWpXvhJ9ijoyNSC7S2HkNfdAo+ragv2fW+4wffE
 xq7ktkD3MAFmNbNp4VudT4ZbY79EATtv+arunlzdyZWrkGywwG26Mo24YrbJKEah0Za9+pv/kCG
 S3JbPzekPK2jqSgnjPJxaImBXyfqkZqqa1BHs+r58jS7mnmeNiYI+Q5eSb/UHlcsGuYqj5qzqmy
 X458eQCScItL96R3vfCVjGMUE9Yq+6gZ94y+KDk2RF/VmqYw8O21niGnw9pdwonPVFegWoNtUZE
 Lew9qAUYs3b4as3NefVCNLcItHR0sPAIK9GMcxQaFF8xWGG5lICgI3n3mb3YWzcxDssvjQRLf54
 booWGVHYjxx+BNjkLcUsU=
X-Received: by 2002:a05:690c:e1c4:20b0:8b1:9c2:87d6 with SMTP id
 00721157ae682-8b133e4a8d1mr4988887b3.17.1792575375375; Wed, 21 Oct 2026
 02:36:15 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261014012323.322790-1-bin.meng@processmission.com>
In-Reply-To: <20261014012323.322790-1-bin.meng@processmission.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 21 Oct 2026 17:36:02 +0800
X-Gm-Features: AclHuK9JtP5Y1mbTTftwyHmrDTrRyPLvJfGqAGzJ680MeJpCOHJ2ZVE-5-4ap3I
Message-ID: <CAEUhbmWVuSF9KicCjd1fyFycgR7sLErsW7x_wk4HO0ZJPtwquQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/27] hw/riscv: Restore Microchip PolarFire SoC Icicle
 Kit firmware boot
To: Bin Meng <bin.meng@processmission.com>
Cc: QEMU <qemu-devel@nongnu.org>, Alistair Francis <Alistair.Francis@wdc.com>, 
 Alistair Francis <alistair@alistair23.me>,
 Chao Liu <chao.liu@processmission.com>, Conor Dooley <conor@kernel.org>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Markus Armbruster <armbru@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Sebastian Huber <sebastian.huber@embedded-brains.de>,
 Thomas Huth <th.huth@posteo.eu>, 
 Weiwei Li <liwei1518@gmail.com>, qemu-arm@nongnu.org, qemu-block@nongnu.org, 
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_PASS,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 14, 2026 at 9:23=E2=80=AFAM Bin Meng <bin.meng@processmission.c=
om> wrote:
>
> The microchip-icicle-kit machine was originally validated with an older
> Hart Software Services (HSS) firmware stack. HSS v2026.04.1 cannot boot
> through U-Boot to Linux because several firmware-visible parts of the
> PolarFire SoC are missing or incomplete.
>
> The first failure occurs before the UART is initialized because the L2
> zero window is not mapped. HSS then needs additional L2 cache controller
> and DDR training behavior. Later boot stages exercise system services,
> the RTC, SDHC version 4 DMA, and high-capacity SD card block sizing,
> along with the complete DDR aliases. The existing models ither reject
> these accesses or expose behavior that does not match the hardware
> specifications.
>
> This series restores the complete firmware boot flow. With these
> changes, QEMU boots the HSS v2026.04.1 eNVM image, loads its U-Boot
> payload from an SD card, and reaches the Buildroot 2026.05 Linux
> login prompt.
>
> The changes are organized around the firmware boot sequence:
>
> * Correct the L2-LIM size, map the L2 zero window, and provide the DMC
>   status transitions required by HSS DDR initialization.
> * Model the documented L2CC Config, WayEnable, and WayMask registers,
>   and resize L2-LIM as cache ways are enabled.
> * Complete SDHCI version 4 support used by the Cadence controller,
>   including Host Control 2, SDMA system addressing, 64-bit ADMA2
>   descriptors, and SDMA boundary continuation.
> * Run ADMA from a bounded timer-driven engine instead of performing work
>   from command or unrelated MMIO accesses.  This keeps DMA progress
>   independent of guest register traffic and avoids consuming a polling
>   deadline inside the command write.
> * Keep SDHC and SDXC memory transfers at their fixed 512-byte block
>   size, and advertise the Cadence controller's 64-bit system bus
>   support.
> * Add the PolarFire SoC serial-number system service and RTC, and honor
>   the system-service notification control bit.
> * Correct the DDR aliases and fix the board topology at its physical
>   configuration of 2 GiB of RAM and five harts.
> * Document direct and HSS boot, add focused qtests and a full firmware
>   functional test, and restore the machine's Supported maintainer
>   status.
>
> Testing performed:
>
> * Built qemu-system-riscv64 and the documentation.
> * Passed various newly added qtests.
> * Booted HSS v2026.04.1, U-Boot, and Buildroot 2026.05 Linux to
>   the login prompt using the functional-test image.
>
> The functional test uses the processmission/qemu-machine-images release
> v1.1.1 tarball:
>
> https://github.com/processmission/qemu-machine-images/releases/download/
> v1.1.1/riscv64-microchip-icicle-kit-v1.1.1.tar.zst
>
> When restoring the HSS boot support, 3 potential bugs were identified in
> the upstream HSS source codes that either blocks the DDR training from
> succeed or traps in a multi-core race at the very beginning or after
> a succesfully DDR training but stuck at OpenSBI/U-Boot hand-off. There
> are already bug reports filed aginst various upstream projects.
>
> Changes in v4:
> - Drop the unused ADMA callback forward declaration
> - Move helper definitions before the data-transfer declaration
> - Merge the ADMA timer callback and batch routine
> - Use HSS v2026.04.1 and the v1.1.1 test-image recipe
> - Select the SoftConsole toolchain explicitly
> - Use the generated complete boot-mode-1 eNVM binary
> - Use the v1.1.1 test images with HSS v2026.04.1
> - Add the execution bit to the python script
> - Collect Conor Dooley's Tested-by for the complete series
> - Collect Bernhard Beschow's Tested-by for the ADMA patch
>

Ping for review?

