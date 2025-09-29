Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29B5CCAC5BB
	for <qemu-riscv@archiver.kernel.org>; Mon, 29 Sep 2025 01:17:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v32VE-00066W-N5; Sun, 28 Sep 2025 21:16:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v32Uz-0005zE-25
 for qemu-riscv@nongnu.org; Sun, 28 Sep 2025 21:16:18 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v32Uq-0001Yh-6V
 for qemu-riscv@nongnu.org; Sun, 28 Sep 2025 21:16:16 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b2e66a300cbso791552266b.3
 for <qemu-riscv@nongnu.org>; Sun, 28 Sep 2025 18:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759108562; x=1759713362; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ObILjRMrsNab+xqjpMD4f9za4qa5Rz6QLtjQRJRvq6w=;
 b=ikBMa2/t4LaXgonN0bwwd8rTySWtH9XWBIsihiS7hupa+OyRA6avq8ASHQavKdumGN
 gatbXsQ+OxAkcPuLn81ArMUIB+d5hHPBIsg/pf/DU7eJ0UQv7vg0IMIxTAdzeRGh14Vt
 1G5e0dWU+8gFyKvjVh4IoUessk38Fr2BuLPJiB4+/gCx6CCWtfQ1s/LHCw1jcHB5ICvs
 1U9RMRBAD7r0DK8PZOInVNgpqYufDQ/V/rI9gnsTnDDVK8Ye6/9gR1onSef462Agytjs
 Ekuohh7ZZSkF/P1GgKHovF2i6zKWOB6glbkQHjlNuFsWELgU53eDH5OINEvAAGcjp3wL
 Y0ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759108562; x=1759713362;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ObILjRMrsNab+xqjpMD4f9za4qa5Rz6QLtjQRJRvq6w=;
 b=df2mdYQi/B/Q9MOQT4GIJnXmWkI4gsk+tWO4tS7neuaDrc6bmiTaq1JsM2jh4gsPgs
 raHz7RLT2LWSqkxVQfRrRZy5ctyy7RR6vl9TPAVCo+Gg3Ih+GrAkSeoRGf49PnpY7tzC
 iNjL29upkYBDiMG487twwtcqebk6WJS4R0oD5z192k46CgnnQ7apr8oXNvHiG12ioMUv
 wlp7IJ7bFW7VwNrZmcQdEtQ1YuegujZq9yyyNmfz1gKkosj9jVlD6INuN/jyOnSLCMQt
 Y2vMi5hRBNQP98iNnbKJCnuPXSaLYPkPY55Oh+McKdKsiubtM0DKl/ZfrvWMhsuCzXAe
 y1jw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfx3hIcbrP3WLBgBxDSm4heJJ8VlZpunjyva0X1YxyhivssJ5aiOfFEu4BxUGiVB6iqZGcd0GUzK58@nongnu.org
X-Gm-Message-State: AOJu0YxSUQGa/UCIwh6uhdepZASku150z1jFOXdOLKb7dyhlD4U8CmY/
 5kdgWmWLxGVAPHW6WyFAi8sjL3xHjyQLlPwew+2io39RZ37Gc0N1RzOKcfTM8SWqzfigTdCiDVj
 y/FuADnXNeAIfMUj7bhQEdS+i9IZi9c4=
X-Gm-Gg: ASbGncs8HL/eOAtrzY/wZcCYkvBbn+ptuQSHRTqW9qUOtdJZij8IxqAviEsc1p/luzQ
 OdKzScABC+hVROBt17ScvlxYB+kcUD9wa92tK4Tw+FgH7j05Sv+ozPvarzh/Byo3mHSphZGIpVI
 6JuD39OqjMDsZr9fTYgnstAbnv34EbVve2iMwTvNjjLk9GbN4vBPuy+gS7TYJAkocK+36JM0P+G
 uN59MXwq7/KJnDGM9o8s7BYMldt3L5px6ehYjnG4EscdOHq
X-Google-Smtp-Source: AGHT+IGaeWNCtVTfkkyzRllyeKtAmhaCzW7+NvkpWEO4vFSrr7DZ4sCmR7kHRoPEcLKibu4OCNYVPYpeyJTkAbh+cI8=
X-Received: by 2002:a17:907:7e84:b0:b29:e717:f0af with SMTP id
 a640c23a62f3a-b34b9f4fc52mr1731364466b.18.1759108562396; Sun, 28 Sep 2025
 18:16:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250923090729.1887406-1-max.chou@sifive.com>
In-Reply-To: <20250923090729.1887406-1-max.chou@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 29 Sep 2025 11:15:35 +1000
X-Gm-Features: AS18NWB1D_z02BlRVKfFwTSqVahBQP2wSGktfjrAsRYstezIIsj0Nw0NKXa2gUI
Message-ID: <CAKmqyKP+Cqph7ADC+EBYgGeGtHcO2hc=JLQ_zaT-E0ffa+sT7w@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] riscv: Modify minimum VLEN rule
To: Max Chou <max.chou@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=alistair23@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Tue, Sep 23, 2025 at 7:09=E2=80=AFPM Max Chou <max.chou@sifive.com> wrot=
e:
>
> According to the RISC-V unprivileged specification, the VLEN should be gr=
eater
> or equal to the ELEN. This patchset provides following modifications:
>
> * Replace the checkings of standard V with the checkings of Zve32x
> * Introduces a check rule for VLEN and ELEN
> * Modifies the minimum VLEN based on the vector extensions
>
> Extension     Minimum VLEN
> V                      128
> Zve64[d|f|x]            64
> Zve32[f|x]              32
>
> v1: 20250627132156.440214-1-max.chou@sifive.com
> - Rebase to riscv-to-apply.next branch
> - Add patch 1 to replace checking RVV by checking Zve32x
>
> Max Chou (2):
>   target/riscv: rvv: Replace checking V by checking Zve32x
>   target/riscv: rvv: Modify minimum VLEN according to enabled vector
>     extensions

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  target/riscv/cpu.c            |  2 +-
>  target/riscv/csr.c            |  3 ++-
>  target/riscv/machine.c        |  3 ++-
>  target/riscv/riscv-qmp-cmds.c |  2 +-
>  target/riscv/tcg/tcg-cpu.c    | 21 ++++++++++++++++++---
>  5 files changed, 24 insertions(+), 7 deletions(-)
>
> --
> 2.43.0
>
>

