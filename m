Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E9D2C4167D
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 01:49:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qyMfj-0005ZA-35; Wed, 01 Nov 2023 21:39:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qyMfX-0004o9-43; Wed, 01 Nov 2023 21:38:51 -0400
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qyMfU-0004Zo-Jm; Wed, 01 Nov 2023 21:38:45 -0400
Received: by mail-vk1-xa2e.google.com with SMTP id
 71dfb90a1353d-4a87f9a3961so184195e0c.3; 
 Wed, 01 Nov 2023 18:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698889123; x=1699493923; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dNH0CSikb5DVX2eH8UOGhyJ2YnRz7YvLD3jmrY6Jb6g=;
 b=mI10KDdwA946EmKCvnyPZ2MkbiQW5okM/YM4oDjq8fLehhvbCbUbWJfkchNV7B+3oQ
 yhLC62NeQAE+hOCwq9s7diQnRalZLUO/vgJy3nixcwcxSdeAuJ4BAwB2QwTkL2hwdo+g
 y1BBXg6qQq1twgDGpcBELLyJL94MuwV1mYcZnamKmp5GWh+c9e1X4ycgbOwK33VzBy0d
 FNC0rLk9gSDMp9SxeAB3ErsjWDBFvpt2vzVbZvXQVc9/IPjcm6VWGFJUv4s64TnlvwBX
 eSBYi7dL12UUBPIdL3Ht1phDRCnyMJwfGLnHl3BuoWH29kFTk2uzTQZ5QaR/GVu+bEe4
 r8zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698889123; x=1699493923;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dNH0CSikb5DVX2eH8UOGhyJ2YnRz7YvLD3jmrY6Jb6g=;
 b=qtMpLNEkltmSJ1ahfY9KPdk04r8A9JOd/9dEPjBG91vKm3XN8aVs7EN4RewN9czEEw
 /jYpgzz7usFwnGxCTmkS9EjePuYCJER7rNQtoSWS20LBqoQYZQ0litBfrt+NM+MGQWqI
 7yhRUdD7grUg5xu5cIn/K7SL+db/dPK/E45QbfxXBoe2zWYxk2vMTTVqDYCxifW/gVDV
 DNRMcjXzYIS70GSu2XTIGE1b850UeHqm4w89n4h8sbONtyJ7cLqK2MdrKTz66GAnKTDx
 1PEc1Zul7FghMFDIRLe319GJ80lL6LpcMIQRpB4PL3a6xJ9cCNdEREXLqkJ4LZk3mvcH
 Qrbg==
X-Gm-Message-State: AOJu0Yy7ZksMajtIu0mvrJGg7ldAFzZ7s0xgJmyNqSVkpNI6wrSSq9jK
 /wP8v36mbSMSWPT8mihe1dGcoml4EeUDVXct4KJfXQ8Dl4Y=
X-Google-Smtp-Source: AGHT+IGTxg4CKomgParDvZjvMS3P6gYEcnQY05VaMgBVH1SuVJYj36nE5Tarsk20BLNdkNy+klAw8PUVLQg8ubdH4Og=
X-Received: by 2002:a05:6122:71b:b0:48d:5be:2899 with SMTP id
 27-20020a056122071b00b0048d05be2899mr17603327vki.2.1698889122772; Wed, 01 Nov
 2023 18:38:42 -0700 (PDT)
MIME-Version: 1.0
References: <20231026151828.754279-1-max.chou@sifive.com>
In-Reply-To: <20231026151828.754279-1-max.chou@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 2 Nov 2023 11:38:16 +1000
Message-ID: <CAKmqyKML9f5x7_0pjmPfYkTZFZ4Fm=0hwA7QGezoxjWMosXjNQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/14] Update RISC-V vector crypto to ratified v1.0.0
To: Max Chou <max.chou@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2e;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2e.google.com
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

On Fri, Oct 27, 2023 at 1:19=E2=80=AFAM Max Chou <max.chou@sifive.com> wrot=
e:
>
> This patchset updates the RISC-V vector cryptography support to the
> ratified version v1.0.0 (commit 1769c26, released on 2023/10).
>
> v2:
>
> - Fixed the instruction order at disassembler part.
> - Fixed the vror.vi disassembler format.
> - Verified by code examples provided by vector crypto spec repository
>   (riscv-crypto).
> - Rebased to riscv-to-apply.next branch (1f910f3)
>
> v1:
>
> - Support Zvkb, Zvkt, and other shorthand extensions(Zvkn, Zvknc, Zvkng,
>   Zvks, Zvksc, Zvksg).
> - Support the disassembler for vector crypto extensions.
> - Moved vector crypto extensions from experimental extensions to ratified
>   extensions.
> - Replaced TAB indentations with spaces in disas/riscv.c.
>
>
> Max Chou (14):
>   target/riscv: Add cfg property for Zvkt extension
>   target/riscv: Expose Zvkt extension property
>   target/riscv: Add cfg property for Zvkb extension
>   target/riscv: Replace Zvbb checking by Zvkb
>   target/riscv: Expose Zvkb extension property
>   target/riscv: Add cfg properties for Zvkn[c|g] extensions
>   target/riscv: Expose Zvkn[c|g] extnesion properties
>   target/riscv: Add cfg properties for Zvks[c|g] extensions
>   target/riscv: Expose Zvks[c|g] extnesion properties
>   target/riscv: Move vector crypto extensions to riscv_cpu_extensions
>   disas/riscv: Add rv_fmt_vd_vs2_uimm format
>   disas/riscv: Add rv_codec_vror_vi for vror.vi
>   disas/riscv: Add support for vector crypto extensions
>   disas/riscv: Replace TABs with space

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  disas/riscv.c                            | 157 ++++++++++++++++++++++-
>  disas/riscv.h                            |   2 +
>  target/riscv/cpu.c                       |  36 ++++--
>  target/riscv/cpu_cfg.h                   |   8 ++
>  target/riscv/insn_trans/trans_rvvk.c.inc |  37 ++++--
>  target/riscv/tcg/tcg-cpu.c               |  48 ++++++-
>  6 files changed, 258 insertions(+), 30 deletions(-)
>
> --
> 2.34.1
>
>

