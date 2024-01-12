Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD879C4707C
	for <qemu-riscv@archiver.kernel.org>; Fri, 12 Jan 2024 03:17:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rO82y-0005wf-6f; Thu, 11 Jan 2024 22:17:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rO82s-0005vk-DA; Thu, 11 Jan 2024 22:17:22 -0500
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rO82o-0000z2-MG; Thu, 11 Jan 2024 22:17:21 -0500
Received: by mail-vs1-xe2e.google.com with SMTP id
 ada2fe7eead31-46781bd40f8so1607305137.1; 
 Thu, 11 Jan 2024 19:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705029436; x=1705634236; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u/pwe2wWPAexi0csxHrxYNK4JSAgjVk8tHOplY1MLRc=;
 b=VlSBTrMSURfG+M8vSGjN3FrReChVJC9nt16BJ8AZEC2Mi3WN6YwxvM0wAcR2G77r5V
 3MetymdLmDFWPM6QpvWHyx4UPoQO9FpYFhYHsVRP2XBte1LytEeSLMEd7N5v4+SK5iTA
 oEBrZ60yMUwAnBfnTDa4qsJOE02UM+H1buPjWbYE5sTSGONxfgWpxSPSDNQRnyRTjigL
 qZOpBlXqlgzWmiLTP4U77/m7IB4JxSJAnE8FMJiRe977VeF5LSdoWriZPYSassYZ5xdo
 r+MRr1ie+xbVjbLszEi7WPdm/uMEV2rpr/pcS/K15UkoWkpp7Zd77h9VkJWmea368M8o
 TGPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705029436; x=1705634236;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u/pwe2wWPAexi0csxHrxYNK4JSAgjVk8tHOplY1MLRc=;
 b=aYw+sud7r2wNkbeIo++IH87CQYb8CL2doKczco4WjpFkT5UXZ3DFNfHcw9C98ahiQS
 CFTS6YoV59sPDUCntf0KbgOOeK7CjhWauqayt89dzweL3oVy0xVqZ5xCVxmymhsRWX16
 yO6ihZXtA20Eb5syuhsCHK2FEsS/Nd7/UwFxhu6LQe4zLN3f6Cc+oKXhRR+QCkKhJQw+
 y0j0fslw8l9eOuH75V34ToAnd5zZVXIrlaLgvRU8A9HHBX23k46YIUJtbHZqYWyBB4Pl
 g/P3+LVkHxJhoKnogZVB7UyfE/ychge2Upw8ZoQLkh1sZ011nQ1uWc+wFRP909KM+F3z
 AE/Q==
X-Gm-Message-State: AOJu0YzpBY2pQY0+lBuugIGzd3E+QMryS12DSaTCrdx90l0MFfPd/9fP
 90p7SxxKF2HO2XjVCPuF2SrUAUHkxYT0z1LbCoo=
X-Google-Smtp-Source: AGHT+IG6rILyGVmqUN5Z89ZnByKLegoPM5g5r3lQ/iOsdhI8RS35wO4PY6Fajuf16PxfI0qIzCcuks7LJoLx6/CnH2s=
X-Received: by 2002:a05:6102:3584:b0:468:9fb:6c06 with SMTP id
 h4-20020a056102358400b0046809fb6c06mr1156038vsu.25.1705029435861; Thu, 11 Jan
 2024 19:17:15 -0800 (PST)
MIME-Version: 1.0
References: <20240105230546.265053-1-dbarboza@ventanamicro.com>
In-Reply-To: <20240105230546.265053-1-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 12 Jan 2024 13:16:49 +1000
Message-ID: <CAKmqyKNv8BZPAbiKaio9KOUjUVL+o7faroRAsnv8EgnD0snivA@mail.gmail.com>
Subject: Re: [PATCH v4 00/17] target/riscv: deprecate riscv_cpu_options[]
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2e;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2e.google.com
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

On Sat, Jan 6, 2024 at 9:07=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Hi,
>
> This new version contains changes due to a rebase with current
> riscv-to-apply.next, after "[PATCH v13 00/26] riscv: RVA22 profiles
> support" was queued.
>
> Most notable change is a new patch (12) that was added to handle
> 'cbop_blocksize' - zicbop was added by the profile work that just got
> queued and was missing from v3.
>
> A wrong 'cbom_blocksize' reference in patch 10 was also fixed.
>
> Patches based on Alistair's riscv-to-apply.next.
>
> Patches missing acks: 10, 12, 15, 16, 17
>
> Changes from v3:
> - patch 10:
>   - changed wrong cbom_blocksize ref to cboz_blocksize
> - patch 12 (new):
>   - move cbop_blocksize to riscv_cpu_properties[]
> - v3 link: https://lore.kernel.org/qemu-riscv/20240103174013.147279-1-dba=
rboza@ventanamicro.com/
>
>
> Daniel Henrique Barboza (17):
>   target/riscv/cpu_cfg.h: remove unused fields
>   target/riscv: make riscv_cpu_is_vendor() public
>   target/riscv: move 'pmu-mask' and 'pmu-num' to riscv_cpu_properties[]
>   target/riscv: move 'mmu' to riscv_cpu_properties[]
>   target/riscv: move 'pmp' to riscv_cpu_properties[]
>   target/riscv: rework 'priv_spec'
>   target/riscv: rework 'vext_spec'
>   target/riscv: move 'vlen' to riscv_cpu_properties[]
>   target/riscv: move 'elen' to riscv_cpu_properties[]

I've applied the first few patches to the RISC-V tree, the others
don't apply. Do you mind rebasing them and sending them again?

Alistair

>   target/riscv: create finalize_features() for KVM
>   target/riscv: move 'cbom_blocksize' to riscv_cpu_properties[]
>   target/riscv: move 'cbop_blocksize' to riscv_cpu_properties[]
>   target/riscv: move 'cboz_blocksize' to riscv_cpu_properties[]
>   target/riscv: remove riscv_cpu_options[]
>   target/riscv/cpu.c: move 'mvendorid' to riscv_cpu_properties[]
>   target/riscv/cpu.c: move 'mimpid' to riscv_cpu_properties[]
>   target/riscv/cpu.c: move 'marchid' to riscv_cpu_properties[]
>
>  target/riscv/cpu.c           | 755 ++++++++++++++++++++++++++++-------
>  target/riscv/cpu.h           |   8 +-
>  target/riscv/cpu_cfg.h       |   4 -
>  target/riscv/kvm/kvm-cpu.c   |  94 +++--
>  target/riscv/kvm/kvm_riscv.h |   1 +
>  target/riscv/tcg/tcg-cpu.c   |  63 ---
>  6 files changed, 676 insertions(+), 249 deletions(-)
>
> --
> 2.43.0
>
>

