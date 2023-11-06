Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9BB4C4332F
	for <qemu-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 01:16:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qzoDP-00059R-PO; Sun, 05 Nov 2023 20:15:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qzoDO-00058j-4s; Sun, 05 Nov 2023 20:15:42 -0500
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qzoDM-0004Xv-Mv; Sun, 05 Nov 2023 20:15:41 -0500
Received: by mail-vk1-xa2b.google.com with SMTP id
 71dfb90a1353d-49d9ef118a5so1462187e0c.1; 
 Sun, 05 Nov 2023 17:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699233338; x=1699838138; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qJSYsuxX/SD4RHGOFav4WAact6ov/ErY57Vm7mELOzI=;
 b=a/LRc3W4x5fdNA7wbwVfU91skCRBsV3Cek2rru0qx7wymlsZT7S6BqYOiezyjKeVNe
 q0+A7cjiASU0lP1e5K0f5M6RaajsyHnIUfU0+KcENuduxqmTAK+h4xgKHikjvg451OWz
 7BA7lPNFopsLTiIuvyqlKNLnFGxBMuu8drXCeM77DS/qPDIqibbB4C0jTkZp04DB9kM2
 JNo/xc7HHMui32pJIwqzKbuDMMcLOQqOyYSKLmzpNC3gfj0BnZQTpWZ50/Wu+AvrvPPC
 Qvla8GC9LWoJ5RTdbM+kKiP7m/4R0hjxD25ccNyFsKpwwQ3zyCt587UNM2O1pY4HOpMP
 RLbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699233338; x=1699838138;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qJSYsuxX/SD4RHGOFav4WAact6ov/ErY57Vm7mELOzI=;
 b=W/HmYW/ErQCgucba4N3VOGauwVdFWYlkBA4DE7S68xlKUr5oXsXg6/g7zPhDoh3PTV
 z+/pYhmD/i276nW99S28fmqxo7YqtZYTT6mSG0a+sAmxITIrKBPlH2uJ5SKYo2o1xJWb
 wQOm5PATQbX04aPsf1Hznq78/4PYVzpSvwYwYeZm4MTb9USZMtuVY1ZiZaPRckdVWqlr
 /zt+5BrmwYhUqvWHk5Pt8qYvsbt/V+uPtlozndrcf+VAKrqvmaM+asUS0CkWCKwYkMN6
 owtk11ySXB+1AsCEN7H4kbkX3L3nLFc+4DINmAaCZkUoMb4mRa4FsvY/xw0X/+s4DCSP
 TEUQ==
X-Gm-Message-State: AOJu0YxIgKaQj9DI0INKVbtU4Drg3B0Jz1yBunZdcEeyMWQo52Ny1R6f
 g5bQGW6NoluNmA8D4UiON6wUlKiEASpbmCl/5YA=
X-Google-Smtp-Source: AGHT+IF0DIItm5DCPx3oBDxhycwchnzB4ctqQZWZ1P8/77Df98pZd8Hj8VUl+F6yrkkH1JkJDb6e3zPmHSPFM3QYr8E=
X-Received: by 2002:a1f:a807:0:b0:496:b3b7:5d4c with SMTP id
 r7-20020a1fa807000000b00496b3b75d4cmr17122015vke.16.1699233337855; Sun, 05
 Nov 2023 17:15:37 -0800 (PST)
MIME-Version: 1.0
References: <20231031154000.18134-1-rbradford@rivosinc.com>
In-Reply-To: <20231031154000.18134-1-rbradford@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Nov 2023 11:15:00 +1000
Message-ID: <CAKmqyKNydzPeGy2nkUFHGHkMNMiuga2ZBwxKPOcEpse7EDYEZg@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] Support discontinuous PMU counters
To: Rob Bradford <rbradford@rivosinc.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, atishp@rivosinc.com, 
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com, 
 liwei1518@gmail.com, dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2b;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, Nov 1, 2023 at 1:41=E2=80=AFAM Rob Bradford <rbradford@rivosinc.com=
> wrote:
>
> Currently the available PMU counters start at HPM3 and run through to
> the number specified by the "pmu-num" property. There is no
> requirement in the specification that the available counters be
> continously numbered. This series add suppport for specifying a
> discountinuous range of counters though a "pmu-mask" property.
>
> v5:
>
> * Added more R-B tags
> * Make "pmu-num" property directly update "pmu-mask" removing the need
>   to store that value.
>
> v4:
>
> * Added more R-B tags (just missing from 4 & 5)
> * Added details on how to calculate mask
> * Use custom property for "pmu-num" in order to give deprecation warning
> * Special case a zero value for "pmu-num"
>
> v3:
>
> * Use env_archcpu() in csr.c
> * Re-added check to enforce deprectated "pmu-num" below limit
> * Check that standard counters are not included in mask
> * Remove use of MAKE_32BIT_MASK()
>
> v2:
>
> * Use cfg.pmu_mask wherever cfg.pmu_num was used previously
> * Deprecate pmu_num property (warning, comment & updated documentation)
> * Override default pmu_mask value iff pmu_num changed from default
>
> Rob Bradford (5):
>   target/riscv: Propagate error from PMU setup
>   target/riscv: Don't assume PMU counters are continuous
>   target/riscv: Use existing PMU counter mask in FDT generation
>   target/riscv: Add "pmu-mask" property to replace "pmu-num"
>   docs/about/deprecated: Document RISC-V "pmu-num" deprecation

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  docs/about/deprecated.rst  | 12 ++++++++++++
>  hw/riscv/virt.c            |  2 +-
>  target/riscv/cpu.c         | 40 +++++++++++++++++++++++++++++++++++++-
>  target/riscv/cpu_cfg.h     |  2 +-
>  target/riscv/csr.c         |  5 +++--
>  target/riscv/machine.c     |  2 +-
>  target/riscv/pmu.c         | 34 ++++++++++++++------------------
>  target/riscv/pmu.h         |  5 +++--
>  target/riscv/tcg/tcg-cpu.c | 10 ++++++++--
>  9 files changed, 83 insertions(+), 29 deletions(-)
>
> --
> 2.41.0
>
>

