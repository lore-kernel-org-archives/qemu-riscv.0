Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 214BCC7EE29
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 May 2023 01:36:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q2MN0-0004aT-WC; Thu, 25 May 2023 21:35:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q2MMz-0004ZO-Fx; Thu, 25 May 2023 21:35:53 -0400
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q2MMy-0006Qd-0Y; Thu, 25 May 2023 21:35:53 -0400
Received: by mail-vk1-xa2c.google.com with SMTP id
 71dfb90a1353d-456ea0974bcso277105e0c.1; 
 Thu, 25 May 2023 18:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685064950; x=1687656950;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rA1uOLCgwkYcky3uFAD/xjQaM0KOVsofpv3atvKMB+w=;
 b=L0y4zKLAb0qbFJOrXwFJAwtaMVWs0Wpsklq1r9Lk/LO76eICipMIWVqTtJLpHXlZLP
 ut4UGwSw+bg55YYxXIfz4C+kdzuAeSHjBTjOyMyT0oXtqxiz/DaKs/OkrUlIFp9EgzFm
 FCErrSz2BI0dnFYgA7MW3yvx3qku6jz7/VEGdgeQ1J6mEKsF6e0yZidxGxVnmJ2AFs6X
 gwFk6TzKu8UPIFd7dnOw1ubRoca6ukdQF2fEtYiaaweiEd3wQq3NxxuMrACqGGehWzyC
 qtT27H7GEnmBofvh0mkDIagGifgfW4wwfRXkH+DBUZj92brpqUByE0icsV3zbsXdzOXd
 pf5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685064950; x=1687656950;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rA1uOLCgwkYcky3uFAD/xjQaM0KOVsofpv3atvKMB+w=;
 b=I1+bnHUz3KibzHLoXANJyb4JqQDM7q4Pitct9TJd/3jwrrw7bT4zPMfz99zKs/pXfa
 /a7xTQCJLqFAYGZSBGM0EZb0m8x2++EFzzjyZYjbF/uTPRDj9dDuiRaJEiyUX0dHbQFy
 B0OTXAe7mEfyrGeqNkm63W63sprpdRw6hkxhk2+7jURm09UBoryzArx+HCDwZFvZDWQw
 b+DwO7UxdBD9wtuEQXlo+TXHNLY1fNF23xHwpKePpcCvR+SuE9WdAZD09XSF843YjJzx
 gmk7UIZAKtjjWcdC46tHalj99EhtFV+nC3UzKJHfqfPoiLfHeUM/+hFboz39rNkkfbXK
 KNgQ==
X-Gm-Message-State: AC+VfDxuIw3wBVEbw26YHlkZstkXvKOhA0XL7tdR+8jnMdenHGiz2lEo
 icfM4YQmg74OLGMJD45BXKIEHlUE1kGHhfQMv0k=
X-Google-Smtp-Source: ACHHUZ53ac34gZA1T7eFF9nX4x/R8RrNSQxJzYKyHUOq99V4PtO5xGOa+ZZWX1/7tyTLz31bOwVu9Lcyy2FuCgEjBqo=
X-Received: by 2002:a1f:4390:0:b0:43f:e623:952 with SMTP id
 q138-20020a1f4390000000b0043fe6230952mr57455vka.2.1685064950508; Thu, 25 May
 2023 18:35:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230523093539.203909-1-liweiwei@iscas.ac.cn>
In-Reply-To: <20230523093539.203909-1-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 26 May 2023 11:35:24 +1000
Message-ID: <CAKmqyKNzDdjgHO+ytzpZ6S+nsLZue7OFvfucQzpburevTthB_A@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] Add support for extension specific disas
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2c;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2c.google.com
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

On Tue, May 23, 2023 at 7:38=E2=80=AFPM Weiwei Li <liweiwei@iscas.ac.cn> wr=
ote:
>
> Some extensions have conflict encodings, such as
>  * Z*inx reuse the same encodings as normal float point extensions.
>  * Zcm* reuse the some encodings of Zcd.
>  * Custom extensions from different vendors may share the same encodings.
> To resolve this problem, this patchset tries to pass RISCVCPUConfig as di=
sasemble_info.target_info to support extension specific disas, which means =
that the disas for this extensions is supported only when the related exten=
sion is supported.
> This patchset also fixes some style problems in disas/riscv.c.
>
> The port is available here:
> https://github.com/plctlab/plct-qemu/tree/plct-disas-upstream-v2
>
> v2:
>  * Split the RISCVCPUCfg declarations from cpu.h into the new cpu_cfg.h h=
eader
> in a separated patch 2 and add a 2023 copyright (Suggested-by: Daniel Hen=
rique Barboza)
>  * Check Zcm* and avoid changing the other lines in patch 4 (Suggested-by=
: Daniel Henrique Barboza)
>
> Weiwei Li (8):
>   disas: Change type of disassemble_info.target_info to pointer
>   target/riscv: Split RISCVCPUConfig declarations from cpu.h into
>     cpu_cfg.h
>   target/riscv: Pass RISCVCPUConfig as target_info to disassemble_info
>   disas/riscv.c: Support disas for Zcm* extensions
>   disas/riscv.c: Support disas for Z*inx extensions
>   disas/riscv.c: Remove unused decomp_rv32/64 value for vector
>     instructions
>   disas/riscv.c: Fix lines with over 80 characters
>   disas/riscv.c: Remove redundant parentheses

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  disas/riscv.c           | 1194 +++++++++++++++++++++------------------
>  include/disas/dis-asm.h |    2 +-
>  target/riscv/cpu.c      |    1 +
>  target/riscv/cpu.h      |  114 +---
>  target/riscv/cpu_cfg.h  |  136 +++++
>  5 files changed, 785 insertions(+), 662 deletions(-)
>  create mode 100644 target/riscv/cpu_cfg.h
>
> --
> 2.25.1
>
>

