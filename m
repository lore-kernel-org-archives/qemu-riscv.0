Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF17F606A320
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 01:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CFixKUdK
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xQER8-0003jA-IR; Sun, 08 Nov 2026 20:44:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xQEQe-0003hK-O8
 for qemu-riscv@nongnu.org; Sun, 08 Nov 2026 20:44:12 -0500
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xQEQc-00036K-1V
 for qemu-riscv@nongnu.org; Sun, 08 Nov 2026 20:44:11 -0500
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-8b308fca7c3so2612807b3.2
 for <qemu-riscv@nongnu.org>; Sun, 08 Nov 2026 17:44:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794188648; cv=none;
 d=google.com; s=arc-20260327;
 b=Pp3Hf2grjK/63e3el+iLPnWfgOBsNA1gmjSaU1R94wQBJMyEIf1wf0+f0Gh+JBTcIn
 92lL1BvOADj4MN5A4k1Jee8Z9fE//6CZlp4fw9qz+mEiRNGVLnBhRd7BIXEurmZnjVti
 K8rZcYTLkwmChl2wvtkVcW6VuIbXks+YxhdErMxpDx5WkNkN628v3BnEWIiVnH/f9R+n
 2nCwn5msaY9Xt3VFkdqcwdl212jTNLzxi5XEo+6bohnSuCgdxXff1ozdwYXTKadNCpIm
 owSeFehYViweB+UbdQ1ovBUBgviwwPyCFN4sd6X88xD+bR0q5VECBcX8MjeK0CE8IRqx
 xeTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=PEeh2CDsEqZLdR2J8aqfy9cMB1NjNq2FSC7JA1ZKwf4=;
 fh=LM28YkpFYiVbYrObyD4JnclUtjerI01ySo0vmxLnGq4=;
 b=p3QIHaoQ1KMau2ao2CKN6IAniWz+KnSf6D/hnunMiULz0Ut9wD7ix0yClhqXYDwGn5
 fs1fj896MSp0M8C4R3RxD7sjapjI1WNZSBKztiCDxdYaNIVi1EjSrYncQFm+lU9zxWN6
 cTzpEoWkr5GSw/gvQYcEc+JyPShD2hBrNcAbpAi4Dh45UBypzHXqjI5PiDi9uC6xdfgd
 44ndkd1YDd5fSYw0sO3c0DRc6zf9evBcAoXjdXYEg/4gbW79CuebjSp/NZNzDVFgYXoB
 og8Cjrrx4qx7rZHPVA+K2jICItM3dSNczay042ayqZvvJNta26Tq3QTd7ClrOaT4G0fw
 Inwg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794188648; x=1794793448; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=PEeh2CDsEqZLdR2J8aqfy9cMB1NjNq2FSC7JA1ZKwf4=;
 b=CFixKUdK1afivPxcxk4mnpuUD5pdVIglmAi/D8TfP3JQTE5AoYPuVAB7PNCb9ELmba
 DjPPZZl5a/bFSWtHb5v4UPbtA4zBq+Uw7XB5DJJ+knVdaEMJnf9riOmbB/ZGv4CXgpuP
 vYw7ttCq+AdmVJeSuwKVwFPx8YM0/Kyic7iY2aVay9Kju6HA8B44bs5d+wnWdIu1xdcD
 fBeydXyyO1UFFp+ASwwFpwW7eph7g9F+oP7J166d269aPQgi9N9eCCkHND45YNmFMAsj
 YIzpx723khx//pXLVts2IezWsOy3L5WOj7gB9BYRDAg2O749yi1QelOXpGjL+NzINp+h
 ARHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794188648; x=1794793448;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=PEeh2CDsEqZLdR2J8aqfy9cMB1NjNq2FSC7JA1ZKwf4=;
 b=QgFrgIbIcBt5m/LaZucsg0oiZQ/V6BLj9vGynhCmhjrN9hoTEjyypWeKhCMBXd+LgZ
 0IqISR0l30GjQlFbDrxUYeov5Lgzpe+PXe0RM9tkmSCxP6I98x+M8df+6XG2M7Dyawja
 GK8o1cYbXawm690cRbwmLbTN3CG9sBJ8IBZ1J4FpqEm0dzEoPXSTyJThjHGgQCpQSixh
 UjCjf4Jfi2nrs6QFxmLhXDQfxbxzGXHp308ycWJYmNJOzyxNfVXbHwb+mNf/nljnoy5n
 szPPKVAUgAHwPfESs8Jcyaw9TI49LkvzHtS7oVAHW/WUinWxqZBjrWJEDqcmXW8AhvJq
 TLAg==
X-Forwarded-Encrypted: i=1;
 AL+hErETPOC1Qh5Gvd7cQYin0aKIOcxQQ8Czkj0hzL158QhVgzLffYsIPdpHua21ZvpCEPoe4ozclvsYvEMJ@nongnu.org
X-Gm-Message-State: APuU4Z8srsdWzsc8RUTotfcY+hS6tKRXX8cLl4AszKm+ZBHLJf2WC+4Z
 vJKgw1oclDc1xbQhe8/T/KBAUywXAnruS757qUKfUeObSwW//wwSwzGV/x3oonYrqYcJsh1M4oW
 6xWC3aoS0xlcSbI21FFDuS3qdBykqXTw=
X-Gm-Gg: AYBFou1BlJcmBZKmoWfJ/tqsbR04KqNQQXS4WEb4uR8/cripQhO7c5UO48CklZtsxuP
 RK7r2ovQbY5hDuBAmlIgTUvQW9ux30KTqMemgHyaiNc8bVlDDGDXPjCmJKO8kpxqFkjWEpToNuP
 W42UyA4KD7+NI2HUbCrUMNi7nrr4PxCDeUjXmeNV0fAQ4ZqTQJEjj8OUXAIgGVw53cZE11MALyz
 UVvlOdFEZ3pCdocGlqnd2L+LF/6PfYSa+7Zs8toJlzRwpzr2VjT7cnN0RzcgzMZ7NAs9M1jG55F
 O2rSmdFpP/4XnJMVh6E/25t8tlKfoI/dbKSMf4QuoH111RSUObmV1+Fx3abU+gYlfGd1SB3zeBc
 PVAociG6X1kQBYrmZuDk51vSadNwf4t603vzVQwvSDdcY8fGQVnE14rbWj5oJvnHAbWWsSG+mru
 5W
X-Received: by 2002:a05:690c:ec6:b0:8b3:4911:2da6 with SMTP id
 00721157ae682-8b36ca6b529mr16623277b3.37.1794188648414; Sun, 08 Nov 2026
 17:44:08 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261104154207.641511-1-bin.meng@processmission.com>
In-Reply-To: <20261104154207.641511-1-bin.meng@processmission.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 9 Nov 2026 09:43:56 +0800
X-Gm-Features: AclHuK-cM40wqtr9q-UU1fEM780aUlYFH5uJmxgHzV_fB2Bw4vRNitKkaB_AtyQ
Message-ID: <CAEUhbmW4u6sjkOtY_+Rm5SVz7Uxxx69=Q-5kSOWsSC=PfFLYfg@mail.gmail.com>
Subject: Re: [PATCH v5 00/26] hw/riscv: Restore Microchip PolarFire SoC Icicle
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
 Weiwei Li <liwei1518@gmail.com>, 
 qemu-arm@nongnu.org, qemu-block@nongnu.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, Nov 4, 2026 at 11:42=E2=80=AFPM Bin Meng <bin.meng@processmission.c=
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
> * Advertise the Cadence controller's 64-bit system bus support.
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
> Changes in v5:
> - Select REGISTER to fix riscv32-softmmu link failures
> - Rebase onto origin/master
> - Drop the high-capacity SD block-size fix already merged upstream
>

Patch 8/11/15/22/23 still doesn't have any RB/TB tags. Ping for review?

Regards,
Bin

