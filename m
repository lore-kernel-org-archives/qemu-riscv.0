Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A068FC35274
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 03:15:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rF45w-00012p-2w; Sun, 17 Dec 2023 22:15:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rF45t-00011y-9N; Sun, 17 Dec 2023 22:15:01 -0500
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rF45r-0007Q6-Gl; Sun, 17 Dec 2023 22:15:00 -0500
Received: by mail-qk1-x72b.google.com with SMTP id
 af79cd13be357-77f56750defso189794585a.1; 
 Sun, 17 Dec 2023 19:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702869298; x=1703474098; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W+3/LPl5400p6E2XLuoV+FxAc7JhmsVxdocARkuSuEk=;
 b=JAsA+nFigWZPsNRPahC70m1MmxPXa1tfOWBoARZKAqAMkAZLhmqhJKSFtgk4fJtVmy
 UTSmsYXrwtP+H/m3+Qc3CFGJdSVn2oAN9l0Aa/Do7lYe83R9gyFSt+1o8JSwCQLH0q0c
 Pn25XnVKPu3gvtcmpla3YlDndT9S84274Ju1zgAqiWXIaoAEK2PMkpDVo5u8QcaLMrdB
 k1RY54bNeJuJSqL4sUOBqRJ+G6VpnVTO8sCwNDkiaCPYD+oFSYCXgzMknkCsydNe58Sb
 s/dtjUQYMtypuBpAzwuLROhKX0D5kDuPRQXsyxTC9DBheip0GPhwIBSGiScy5NBr/7fa
 7UcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702869298; x=1703474098;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W+3/LPl5400p6E2XLuoV+FxAc7JhmsVxdocARkuSuEk=;
 b=sFwQ8w07skdpu3Sk1ybJlJmeGH+/LtyZwPkxcqIhD8CyTbDlbDnrh24l8ZAcyKswEB
 Rim05aP8yRo+goqPGk9c72xC+8LSAIlBNMwhh00Y3B0cklwwZ1cC8+uZa2OkV+CPInHD
 9UecPf8G3Dk2mFfm7kVRfMTUHcDTbzLtcLij9W2xXpJtRTrv+SDnALkyg0nDsHPZ1L98
 nxpwZnsij5/xeoltxRg+avmERmKr+VenmgrOouaAm1OQhUFznTJ8eFlGcBSXUGo9sf8V
 m35Gatf2BEphQ7EHMGWx0VQCBlY5ZCyXOVC2Zu5wlreGbzS/cgIbkIuphcjNXIxm87u/
 APLA==
X-Gm-Message-State: AOJu0Yy+0xlD6evIt9VuSWlv81S0bUZiC5cx+nT1aR1p6FZqYUJM5kC1
 YfR8/1meoG921Gfs7jqC74vWdWJx8uPFniA1Y+U=
X-Google-Smtp-Source: AGHT+IG6a9f1J/jCfPqQJe4MNL9QH7CKN9m8VR+TCMzHAhyim1nO+EgYpSl61+Qy2ucQoiE6ys0tJWZa53GTuFB4Hdk=
X-Received: by 2002:a05:620a:5311:b0:77f:25f5:36f2 with SMTP id
 oo17-20020a05620a531100b0077f25f536f2mr17101227qkn.143.1702869298129; Sun, 17
 Dec 2023 19:14:58 -0800 (PST)
MIME-Version: 1.0
References: <20231216135136.1597456-1-me@deliversmonkey.space>
In-Reply-To: <20231216135136.1597456-1-me@deliversmonkey.space>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 Dec 2023 13:14:31 +1000
Message-ID: <CAKmqyKPndzQS7F8h+M-_yd5j3_W4yzaHaHowH2qKyQ_bA7XLXw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/6] Pointer Masking update to Zjpm v0.6.1
To: Alexey Baturo <baturo.alexey@gmail.com>
Cc: zhiwei_liu@linux.alibaba.com, richard.henderson@linaro.org, 
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu, 
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=alistair23@gmail.com; helo=mail-qk1-x72b.google.com
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

On Sat, Dec 16, 2023 at 11:52=E2=80=AFPM Alexey Baturo <baturo.alexey@gmail=
.com> wrote:
>
> From: Alexey Baturo <baturo.alexey@gmail.com>
>
> Hi all,
>
> It looks like Zjpm v0.8 is almost frozen and we don't expect it change dr=
astically anymore.
> Compared to the original implementation with explicit base and mask CSRs,=
 we now only have
> several fixed options for number of masked bits which are set using exist=
ing CSRs.
>
> Thanks
>
> [previous:]
>
> This series of patches intends to update RISC-V Pointer Masking implement=
ation
> to the latest Zjpm v0.6.1 version.
> The Pointer Masking functionality is simplified compared to previous vers=
ion
> of spec.
> The changes have been tested with handwritten assembly tests and LLVM HWA=
SAN
> test suite.
>
> Thanks
>
> Alexey Baturo (6):
>   target/riscv: Remove obsolete pointer masking extension code.
>   target/riscv: Add new CSR fields for S{sn,mn,m}pm extensions as part
>     of Zjpm v0.8
>   target/riscv: Add pointer masking tb flags
>   target/riscv: Add functions to calculate current number of masked bits
>     for pointer masking
>   target/riscv: Update address modify functions to take into account
>     pointer masking
>   target/riscv: Enable updates for pointer masking variables and thus
>     enable pointer masking extension
>
>  target/riscv/cpu.c           |  17 +-
>  target/riscv/cpu.h           |  35 ++--
>  target/riscv/cpu_bits.h      |  85 +--------
>  target/riscv/cpu_cfg.h       |   3 +
>  target/riscv/cpu_helper.c    |  85 +++++----
>  target/riscv/csr.c           | 339 ++---------------------------------
>  target/riscv/machine.c       |  14 +-
>  target/riscv/pmp.c           |  14 +-
>  target/riscv/pmp.h           |  11 +-
>  target/riscv/translate.c     |  50 +++---
>  target/riscv/vector_helper.c |   9 +-
>  11 files changed, 143 insertions(+), 519 deletions(-)

Overall it looks good!

Alistair

>
> --
> 2.34.1
>
>

