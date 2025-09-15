Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC1EFCA101F
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 05:07:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uy1QX-0001EK-CZ; Mon, 15 Sep 2025 01:06:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1uy1QT-0001Dv-Jz
 for qemu-riscv@nongnu.org; Mon, 15 Sep 2025 01:06:53 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1uy1QM-0002DJ-Rf
 for qemu-riscv@nongnu.org; Mon, 15 Sep 2025 01:06:53 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b07d4d24d09so387644266b.2
 for <qemu-riscv@nongnu.org>; Sun, 14 Sep 2025 22:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757912803; x=1758517603; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d4mxnX93sxVltgwLPrlDOvOXUv0zxLe/o5zISseAaXQ=;
 b=fFiPITCR3MoOqV5fu9cKLiGR4SydXj0c5vTuEOydXjnhqQ2RWtf3QzqrBOLIIJfJq/
 wtYkCmdcVHq7IbONrSiaGM1wPwfSpN01Z4EF+G4XnBOXMt1WX2ZSRHypIC5keopJDDOh
 BukmvQAOBuRZvWc3MtPweSxsj2uF8F1pIO2/OGXow6ThFYUmJkFFfIC4STJBkzLKvVLE
 sq3MMHm0Q0aFup2SiBnqN9pxZ3KvIQsfST5427eE97cJyPOjh8PiC9m6c2D+beqBDPzo
 TwBSnbExdi0/XphULtvhUWNKLY9Wkx1hh8+VjDndCLCUiCaPaT4zlcUSWOr/3QC2TVly
 GZSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757912803; x=1758517603;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d4mxnX93sxVltgwLPrlDOvOXUv0zxLe/o5zISseAaXQ=;
 b=w52iVLUMYs47Z87Oek/jtPla7e6nj48jAWHtX2KUOODonrG3e7Si3JL4h30o1GTyAR
 bxFzNjEtAG5ErMbGMDGNqRE1kvQLHOrTepafbQUlkoBnHF3oLZMBB3yCxFT9sao5fJ5i
 u485DQ8kZCY5omRLlk4/tNPA0huxTnAUMVwgT52hoipKMp6hiAg30Og8vGKhLohRd5ry
 RVr1n0CkyksUHg1k0fvtWCY6Ab3D0b4A7fgGtC1tgc1TT+aQlEWE5W47HXFDcxg37u0s
 Vhw5PWWZFcnQrdW4sfE+WWvhmzBJWeTuT2Sm1dNiGShpwfrRcehFAfzJo/wfaRrvR5BZ
 C5jA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxjU0MHDxJS4q+n5W2Nn2W6R+MNbSCm6gjpIGn7aW2C6VctZUwuQ3syVhzxTgD1OI02Fas/28Ib/1Q@nongnu.org
X-Gm-Message-State: AOJu0YyGTt/+BL7cIXCLw8hM4VqD5YG+db1KYuDDpXG/BN+5KkgzPVoa
 bgeKeuRZoCcf+XfF/uTt6TDihVQrHzbN3zCOvbxTznCPPt40qh1OABxescNwpUXQ/iPgAsq2VWp
 sJYBsih7JOePRT+EKS9OHeBCWkGiU0ww=
X-Gm-Gg: ASbGncsXJMIxPgpTVuLaCeT/FZdUyBoPGn6FMUsXEXJ+n5idB3nMW5XlcPIXUICOyI7
 F65Ptl6lQiyPgann0Sma96kv/F6Tu6/6KWuZ4BeTADiqsU1qA4iqt4IBREnAFmiytiI46Fs5Usi
 ViQ/eotfe34yYGT7Ihgzz60Gt4kTRHf1b1kz1eKic7HGi2a1e0txs8ChwmcIzbn7btxaP6VLW20
 Hob4JUx/68q6gGF51PMlqIt0VwzSLG8ryU3WeMGhsomXE//Y8JPRO/vUAI=
X-Google-Smtp-Source: AGHT+IEB4xf1dufoLMbPrxZlj2+lwGLELqaN9P5AG6AGY/B+s4p17guODIe2wuF0M2Wq9tp0YYjdjagPjszvSH3ZkZ8=
X-Received: by 2002:a17:907:9710:b0:b0c:6cae:51e3 with SMTP id
 a640c23a62f3a-b0c6cae688fmr531574866b.35.1757912802690; Sun, 14 Sep 2025
 22:06:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250912085535.1649347-1-xb@ultrarisc.com>
In-Reply-To: <20250912085535.1649347-1-xb@ultrarisc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 15 Sep 2025 15:06:16 +1000
X-Gm-Features: AS18NWAOAH6kFhTj-SfOJoxNDIX44u9uTMmdNgyVbeScHsQYJPVZbUbRA_TXY1c
Message-ID: <CAKmqyKN80GDakc6MzBcPur2BtLJCMFMg39fLTgKBh1W8GfZ-AA@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5BPATCH_v8_for_v10=2E0=2E0_0=2F2=5D_target=2Friscv=EF=BC=9AFix_ri?=
 =?UTF-8?Q?scv64_kvm_migration?=
To: Xie Bo <xb@ultrarisc.com>
Cc: qemu-devel@nongnu.org, ajones@ventanamicro.com, qemu-riscv@nongnu.org, 
 mjt@tls.msk.ru, pbonzini@redhat.com, anup@brainfault.org, 
 alistair.francis@wdc.com, rkrcmar@ventanamicro.com, palmer@dabbelt.com, 
 xiamy@ultrarisc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=alistair23@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, Sep 12, 2025 at 6:56=E2=80=AFPM Xie Bo <xb@ultrarisc.com> wrote:
>
> This series(v8) replaces the earlier series patch"[PATCH v7 for v10.0.0 0=
/2]
> target/riscv: Fix riscv64 kvm migration".
>
> Changes since v7:
> - Patch 1: unchanged; keep Reviewed-by from Andrew Jones <ajones@ventanam=
icro.com>
> - Patch 2: add Reviewed-by from Andrew Jones <ajones@ventanamicro.com>
> - No other changes (code is the same as v7)
>
> Xie Bo (2):
>   Set KVM initial privilege mode and mp_state
>   Fix VM resume after QEMU+KVM migration

Can you add the following tag:

Cc: qemu-stable@nongnu.org

to each commit message. That way it will be picked up for stable.

Can you also rebase the series on:
https://github.com/alistair23/qemu/tree/riscv-to-apply.next

Alistair

>
>  target/riscv/cpu.c           | 17 +++++++++-
>  target/riscv/cpu.h           |  2 ++
>  target/riscv/kvm/kvm-cpu.c   | 60 ++++++++++++++++++++++++++++--------
>  target/riscv/kvm/kvm_riscv.h |  3 +-
>  target/riscv/machine.c       |  5 +--
>  5 files changed, 70 insertions(+), 17 deletions(-)
>
> --
> 2.43.0
>
>

