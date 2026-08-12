Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 012BFC5CFDB
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 12:35:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wu8Am-0008N5-1m; Wed, 12 Aug 2026 08:35:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1wu8Aj-0008GF-Rs
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 08:35:05 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1wu8Ah-0004no-6b
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 08:35:05 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-82011c59e66so14328467b3.0
 for <qemu-riscv@nongnu.org>; Wed, 12 Aug 2026 05:35:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786538102; cv=none;
 d=google.com; s=arc-20260327;
 b=osq2AuXoMJEir5aOykV06elOlNOuWFfWY3wke+etDGoAION8fRw8lcgWaycJrRDWnV
 xYTs+BOw7C8aoksj9QapT++bzkKJDXQxQP4EkX0ZusPleTqAGHh9fBdYLr6tN36Wk3x+
 2vwPPWnaKaF0gtUjVqWQvshbwjqufZHVllRpqwmo6iCMa7UnevRMnH9Cm5cybpV4DMY/
 L3T1lnvu+CTFTr/T9Xml8kGDg6d25uQfDtJaA5KxVrrrPeFSvFjugfwofXr0bEWYj0d7
 9iK6HxQ9QF4o9GESX8g3dK4yEnvRtV1m/D2IU78Kc00rTXnvYzyTVRoFG2+3whQUxx5r
 qU6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=ilnmWIgivWLzbRZEb6hNTrn/OAgof699jqHIBj8E7io=;
 fh=mM/Y24fS0beNcaTb703h3IIBYizm0S+9Du5xFSid6Zw=;
 b=kdU76inbdhJ2rmSblTecJkxC+Vr7slO1Y/YQY+1shMXmrsjDackVsDUD+MfyAYmH75
 M7+j1ruWe3IlLDChoi+DgenveLN7t/AnkZ5xxZm9l5FTJcNr8M7FLZ0OqgR7vjucI00P
 s2kqW6x4swLTJGrUQsRWlsULuvTHrp32lsswE3meGEP1woc/ROqQwyUWhNNFjoqxACgQ
 ArM10740FuRMl533OlyoLuV/wkeyWK6AAF4ivu7jfCJEr+/6DAdjvYgmUzlcudfC4m2G
 s8lKJq1LtZuhEl7cPLHkVVWnwZZRcpZ+cwi1V0rxr3eIPLsQ+7kedx608Yu6n9HnDHls
 fvog==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786538102; x=1787142902; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=ilnmWIgivWLzbRZEb6hNTrn/OAgof699jqHIBj8E7io=;
 b=TcfACfbZuR1VqH0dlL/+qnlfcuCfV7lBuwKxe9gjAP21LmMDlJKgYF+EDIilg3pSV7
 8TRAKb3DThYXxBwAQdo5RfrbUwige1T/jZIk/iGskVYQmj2eGgbYEg9/n3vadY2JJGsw
 ZQ3axQ4RjnRtMnx7fne228/hMZJ6VReqXP3sqEVrriqsz8YMrU76zjJCWm1NjlcxeUyp
 TK9jHp5ZmS2hPWWsuaXvDiZFU1ZTyF4vErdlz/cSS9lSgL1gvylS2dxIgVuURF0p+rvW
 niPE26AglC1iUfyZltko66Mrj8ryQfjSNKhxXo9J2k2pUJ1mtLdTepQ70tjg5Jh0qhY1
 6q4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786538102; x=1787142902;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ilnmWIgivWLzbRZEb6hNTrn/OAgof699jqHIBj8E7io=;
 b=OWkXLshL63MpHGuaYN4PdCoyc7Nvj5Qf9bu1mLYRZ9OYgkiSKLrdWhBIhnO/euYA52
 ZnG1jcr26h5GHIlmANQHtyi0ciaEywrmPMyJXCTv5ovmWMc+EK7C19rlz4PVnjH9xL/I
 SsHOOh/2S9zkW6YVhiisZI0GyWt3toXgdC0bckX9OX+foGZFx8+j1nNNoPGoM3EIYT2q
 p7GpIUxep4YgbH0Eje//xm2vO4F4/ADQBlf+mksvynoAo9kDzbucwvwihw2P9TGCJkNz
 S9Uj7R7zy5sSrBh0D3JB1hMy+csjjyy2GJc8mivdHpHZeB/oxTWU7DsfrRaqFnQOyfOW
 bWlA==
X-Forwarded-Encrypted: i=1;
 AHgh+RoJ+4sBbpBI26r64EtnPbmApb2k7bSZlD65WKgaWbPUEsBs9PZ0FfhMucAVFcV1xMl+Cq081/Oa4i0H@nongnu.org
X-Gm-Message-State: AOJu0YzzjYd6XKzzDDJVxcu1Et/CNNveJ9Knw4o5U/6juGNemBH+VPE+
 xUoQsTolY0oAqEnI4DqRXAeBRyK7aoCbrLWFe98FYWAiwj2ucp2UOwvg89HkH3BAopFqkxCoxtb
 FbdzTBrmB7FTDKlyomCPUuG1zo14NlfY=
X-Gm-Gg: AR+sD11ZtojJoULUehECzjBgAL0VKhLEDzjMQX6ucn0o+QnuCIWzY1wumHlD/Grd6Mh
 HD2knbjzjOOzZACMUsLNbocEuz7o1jHOWS02R9Wv372z7LBqOT7FoVbW7LpiJwYe0rcrvJz56ti
 dDjXsJzYZZUAdzJ6VVyFiallc3xBusNlojk0TsZ8eri0wqtWMRgWc09hnfjFf4hZS2+P0nEJXcV
 9mjdlGW9dRrkaABzYADf7EJoleIY8stEQCEZcIyLzY4MEu4aMbOXHhrdWKu6QbcaAWbXKAsVOmm
 UkLnuEmEViapg9WUUtGDnMK7dg3bSyn+PG6kEb2vJ3apAQ==
X-Received: by 2002:a05:690c:c677:b0:814:47f2:1ff with SMTP id
 00721157ae682-83109640302mr19236817b3.27.1786538101798; Wed, 12 Aug 2026
 05:35:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260723151853.2143177-1-bin.meng@processmission.com>
In-Reply-To: <20260723151853.2143177-1-bin.meng@processmission.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 12 Aug 2026 20:34:50 +0800
X-Gm-Features: AUfX_myKMVmA-5yyBHrhxFU4lK-2tMn4mcgUZi-E9i46v6AgpDMR0EX9mh11wAg
Message-ID: <CAEUhbmU4myFTEA9NeGVcBpkW+195=N8YBX=gj+sScZUOfhWSBg@mail.gmail.com>
Subject: Re: [PATCH 00/26] hw/riscv: Restore Microchip PolarFire SoC Icicle
 Kit firmware boot
To: Bin Meng <bin.meng@processmission.com>
Cc: QEMU <qemu-devel@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>, 
 Alistair Francis <alistair@alistair23.me>,
 Chao Liu <chao.liu@processmission.com>, Conor Dooley <conor@kernel.org>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Markus Armbruster <armbru@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Sebastian Huber <sebastian.huber@embedded-brains.de>,
 Thomas Huth <th.huth@posteo.eu>, 
 Weiwei Li <liwei1518@gmail.com>, qemu-arm@nongnu.org, qemu-block@nongnu.org, 
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yw1-x112f.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Fri, Jul 24, 2026 at 10:03=E2=80=AFAM Bin Meng <bin.meng@processmission.=
com> wrote:
>
>
> The microchip-icicle-kit machine was originally validated with an older
> Hart Software Services (HSS) firmware stack. HSS v2024.06 cannot boot
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
> This series restores the complete firmware boot flow. With these changes,
> QEMU boots the HSS v2024.06 eNVM image, loads its U-Boot payload from an
> SD card, and reaches the Buildroot 2026.05 Linux login prompt.
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
> This series assumes that the following generic SDHCI prerequisite series
> has already been applied:
>
> - Message ID <20260715160731.29969-2-dingtao0430@163.com>
>
> Testing performed:
>
> * Built qemu-system-riscv64 and the documentation.
> * Passed various newly added qtests.
> * Booted HSS v2024.06, U-Boot, and Buildroot 2026.05 Linux to the login
>   prompt using the functional-test image.
>
> The functional test downloads this versioned image archive:
>
> https://github.com/processmission/qemu-machine-images/releases/download/
> v1.0.0/riscv64-microchip-icicle-kit-v1.0.0.tar.zst
>
> When restoring the HSS boot support, 3 potential bugs were identified in
> the upstream HSS source codes that either blocks the DDR training from
> succeed or traps in a multi-core race at the very beginning or after
> a succesfully DDR training but stuck at OpenSBI/U-Boot hand-off. There
> are already bug reports filed aginst various upstream projects.
>
>

I see the RISC-V parts have been reviewed. How about other patches?

REgards,
Bin

