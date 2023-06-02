Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C06C77B7A
	for <qemu-riscv@archiver.kernel.org>; Fri,  2 Jun 2023 02:12:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q4uGc-0004pq-BM; Thu, 01 Jun 2023 22:11:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q4uGb-0004pW-7Y; Thu, 01 Jun 2023 22:11:49 -0400
Received: from mail-vk1-xa2f.google.com ([2607:f8b0:4864:20::a2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q4uGZ-0004A1-IW; Thu, 01 Jun 2023 22:11:48 -0400
Received: by mail-vk1-xa2f.google.com with SMTP id
 71dfb90a1353d-45d96e87b3dso409199e0c.2; 
 Thu, 01 Jun 2023 19:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685671899; x=1688263899;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YEL47QvFhZ0ETtVl8QeV+8RTY621ulBnFsV+sYHSTCs=;
 b=AgF8MEGgW5LChAIYnBr7f9ZFIiM9wv9DNC4vx1PDbSGVqjb70Y0vQBCJ0UmvfFsIC0
 XDk6seA0nbZXoGSLsDW759hw09lHwHvc0UN2OYyH6T67LbY4YH+50L4Ve/rOulRR9js9
 ASaiEmmsAZELfcuDs3HUOKdDWz6ixcByuanl3ljIqU/rFtgIG5Pjf6KoRECk7AEf3tlY
 rwyJ8bdAFGKbQaY0i0fKprZPBTfQ8GjmKSuP2r/N+5kipBni5V9HVIfkd14yGi66Jz6N
 Rds+emOW2rbZWOWRWLro+q51YpQvK1cPtxNjsAGByzxVpnGZVA8+gcqZILZcqffo4i7F
 OqVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685671899; x=1688263899;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YEL47QvFhZ0ETtVl8QeV+8RTY621ulBnFsV+sYHSTCs=;
 b=NgW+/mGgDuA//2hx+PT0UOYk6abAKVr+gw4JOsKd0vZdfapjSTN3cWk/NJl3S8Twce
 JZ9ktDc1099yBVxBKkWxjnMM/WnyZG3Smu0gwcO8ZLomCZo++i3eF5jeq9s6XOSMKQK4
 ITnkO0ON1384cJU6eMnNNXv5+/bqdsiVXHhWn8XgrNUMJxnFZP2wuRXuZodjKsUSK8Ot
 i7MQXPv6DYm8L0F5Eze+C2d1vPgeu1rA/L9eRxVzZOvwNricbvgdBLbsDrJk45HKovw7
 UACzi0N7ggsrtq53RXkuVtYu5O8izwa1060LUnplnsPYPfxRXQKnfVeDxnxh3Gi4qT4V
 YM1Q==
X-Gm-Message-State: AC+VfDw6q0WSAarIdLaj/S3wteoT7uUSwljNzEnDlgC5G5C9nJepECeS
 CzRDCT/TloBpRQdpgj5Izq7nKvbR9nEUmaW7uXnFvuUwe+D9SQ==
X-Google-Smtp-Source: ACHHUZ73OKJIMmjeJfeWeniaDzFQA2P8y1qVn0p9xpO3soyKQNPMhQs7jVsiGE8YZOZzfiUJzmp9OAGX5hStE3cwo20=
X-Received: by 2002:a1f:bf85:0:b0:456:d63e:c4ea with SMTP id
 p127-20020a1fbf85000000b00456d63ec4eamr2191757vkf.16.1685671898672; Thu, 01
 Jun 2023 19:11:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230601045910.18646-1-sunilvl@ventanamicro.com>
In-Reply-To: <20230601045910.18646-1-sunilvl@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 2 Jun 2023 12:11:12 +1000
Message-ID: <CAKmqyKOBDcUazrk=MeFjumzc=tWTOYvPPy7wQ=Nyn+ngOQdG+A@mail.gmail.com>
Subject: Re: [PATCH v7 0/3] hw/riscv/virt: pflash improvements
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Andrea Bolognani <abologna@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2f;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2f.google.com
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

On Thu, Jun 1, 2023 at 3:00=E2=80=AFPM Sunil V L <sunilvl@ventanamicro.com>=
 wrote:
>
> This series improves the pflash usage in RISC-V virt machine with solutio=
ns to
> below issues.
>
> 1) Currently the first pflash is reserved for ROM/M-mode firmware code. B=
ut S-mode
> payload firmware like EDK2 need both pflash devices to have separate code=
 and variable
> store so that OS distros can keep the FW code as read-only.
>
> The issue is reported at
> https://salsa.debian.org/qemu-team/edk2/-/commit/c345655a0149f64c5020bfc1=
e53c619ce60587f6
>
> 2) The latest way of using pflash devices in other architectures and libv=
irt
> is by using -blockdev and machine options. However, currently this method=
 is
> not working in RISC-V.
>
> With above issues fixed, added documentation on how to use pflash devices
> in RISC-V virt machine.
>
> This patch series is based on Alistair's riscv-to-apply.next branch.
>
> Changes since v6:
>         1) Updated the documentation patch as per text provided by Andrea=
.
>
> Changes since v5:
>         1) Added KVM use case as per feedback from Anup. Updated the docu=
mentation
>            patch that only S-mode payload is supported for KVM guests. Te=
sted with
>            KVM enabled.
>         2) Updated tags.
>
> Changes since v4:
>         1) Updated patch 2 to avoid accessing private field as per feedba=
ck from Philippe.
>         2) Updated documentation patch to add read-only for ROM usage.
>         3) Rebased to latest riscv-to-apply.next branch and updated tags.
>
> Changes since v3:
>         1) Converted single patch to a series with a cover letter since t=
here are
>            multiple patches now.
>         2) Added a new patch to enable pflash usage via -blockdev option.
>         3) Separated the documentation change into new patch and updated =
the
>            documentation to mention only -blockdev option which seems to =
be the
>            recommended way of using pflash.
>
> Changes since v2:
>         1) Reverted v2 changes and used v1 approach so that pflash0 can b=
e used
>            for code and pflash1 for variable store.
>         2) Rebased to latest riscv-to-apply.next branch.
>         3) Added documentation for pflash usage.
>
> Changes since v1:
>         1) Simplified the fix such that it doesn't break current EDK2.
>
> Sunil V L (3):
>   hw/riscv: virt: Assume M-mode FW in pflash0 only when "-bios none"
>   riscv/virt: Support using pflash via -blockdev option
>   docs/system: riscv: Add pflash usage details

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  docs/system/riscv/virt.rst | 31 ++++++++++++++++++++
>  hw/riscv/virt.c            | 59 ++++++++++++++++----------------------
>  2 files changed, 56 insertions(+), 34 deletions(-)
>
> --
> 2.34.1
>
>

