Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E5EC47DD3
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 03:39:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rRl9z-0000Zo-VP; Sun, 21 Jan 2024 22:39:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRl9x-0000Yv-CO; Sun, 21 Jan 2024 22:39:41 -0500
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRl9v-0003Zl-IL; Sun, 21 Jan 2024 22:39:41 -0500
Received: by mail-ua1-x92d.google.com with SMTP id
 a1e0cc1a2514c-7d2ded146cbso393912241.2; 
 Sun, 21 Jan 2024 19:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705894777; x=1706499577; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hY72BxvzmiGSGQtkAGOHlAHwL7oboFqjI4NfFTHI4YI=;
 b=jxspjG45i3tz8+dJnBrYEaRPdow4kNXiglt007l0RyIUCtwyxpugkIA/NqyGHIMu6O
 mPLwSrPDF3/rI8vCTLdsIvDtESGAfmpQi9qCommtKUwwaDgonwZ5jxqm+6xo36Vy1inU
 mBnLKTnZmkS8HY4ag6uybxydBjujrFP9aIXeORhzy6iYUoyOETiCcTNHw5xGp3+SWcoZ
 5jLV1401NwD7+rGz58EqzF1CBBFmVLPRtrmWVC33FsgM50hVgxR3q/wqrKWApEHbZ8kw
 BTtgR3kT213BqOXEKwT+wknnhVBv2j278asTqXRTkgJNGr1/6qF6oOi+NLPK1qGe553X
 R3Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705894777; x=1706499577;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hY72BxvzmiGSGQtkAGOHlAHwL7oboFqjI4NfFTHI4YI=;
 b=UEHsZohsBbCU3+37P6yiM4vJQZ1wpYt9i4lHJF1gkzVrpyILTs0kJd/XogdiSOEEXq
 p6u4Y3XPsWbA70l27LwCpjndLoJKTJRyThpjZy/NU6GsV8DHOs76sUtj25oZ2LaeyjWn
 3od7pcG7Nyb1Dqv9/4UagyD3y4DfkADTSod+GdHeyO/4cFO3TGwRO+qHtLMoeM0xfRwF
 CwewQd/etTX3iUOwYVnQNLUA7VBFiuDojl1PIUlJD1ucuXEt7PUsBbJoKxfqtAPc14/I
 +IsVp/TXzB+5xXU4gFtZlMMxfIAqbeNG5quI/ii+l5s43yoYWKwo9WDjNrwx4X0wvCPd
 alkg==
X-Gm-Message-State: AOJu0Yx4XTqK95kLIkUl9NHkxVpBxXAz07Y7g8YhMfJIs3qJNY4ZHSYD
 z1feFfrEN2gixON/bIR8G5S8ZFzspqzeLnu5LhAEc6jt1o2ahx0f6JhMIql1ZaOR1+QpN16dxxq
 4eZrYvK3mXtl++E05+DbYqi5Eb04=
X-Google-Smtp-Source: AGHT+IE+/OxfWU9v8nJL7Hep4g62dFUxePVW+lw4IshWSsmB4WemLyP9+8pqY2A6UdnCzzMAVjYcNSD2LN+YWt/oxhA=
X-Received: by 2002:a05:6122:ca0:b0:4b6:dc25:3d53 with SMTP id
 ba32-20020a0561220ca000b004b6dc253d53mr1118936vkb.16.1705894777401; Sun, 21
 Jan 2024 19:39:37 -0800 (PST)
MIME-Version: 1.0
References: <20240116205817.344178-1-dbarboza@ventanamicro.com>
In-Reply-To: <20240116205817.344178-1-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Jan 2024 13:39:11 +1000
Message-ID: <CAKmqyKOeYV6_Li8Q6L2gvWjYsZqQC+CiCOiFhiwti+_4X_7qqg@mail.gmail.com>
Subject: Re: [PATCH v3 00/13] target/riscv: add 'cpu->cfg.vlenb',
 remove 'cpu->cfg.vlen'
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, richard.henderson@linaro.org, max.chou@sifive.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92d;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92d.google.com
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

On Wed, Jan 17, 2024 at 7:41=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Hi,
>
> In this v3 the most significant change is with vext_get_vlmax() from
> cpu.h. The logic used in this function is also used in at least two
> other places, trans_vrgather_vi() and trans_vrgather_vx(), and we need
> to make changes in them to remove 'vlen' occurrences.
>
> Instead, we're adding an extra patch (11) to rework vext_get_vlmax()
> arguments to make the function usable in trans_vrgather_v*(). This
> rework includes some naming changes in local variables - we're using
> 'vsew' and 'vlmul' more often to be less ambiguous when reading code.
>
> Series based on Alistair's riscv-to-apply.next.
>
> Patches missing review: patches 10, 11, 12.
>
> Changes from v3:
> - patch 8:
>   - changed fractional LMUL comment to show the expansion
> - patches 9 and 10: switched places
> - patch 10 (former 9):
>   - use 'vlen' in vext_get_vlmax() to avoid a negative shift
> - patch 11 (new):
>   - change vext_get_vlmax() to use 'vlenb', 'vsew' and 'lmul'
> - patch 12 (former 11):
>   - use vext_get_vlmax() instead of calculating vlmax manually
> - v2 link: https://lore.kernel.org/qemu-riscv/20240115222528.257342-1-dba=
rboza@ventanamicro.com/
>
>
> Daniel Henrique Barboza (13):
>   target/riscv: add 'vlenb' field in cpu->cfg
>   target/riscv/csr.c: use 'vlenb' instead of 'vlen'
>   target/riscv/gdbstub.c: use 'vlenb' instead of shifting 'vlen'
>   target/riscv/insn_trans/trans_rvbf16.c.inc: use cpu->cfg.vlenb
>   target/riscv/insn_trans/trans_rvv.c.inc: use 'vlenb'
>   target/riscv/insn_trans/trans_rvvk.c.inc: use 'vlenb'
>   target/riscv/vector_helper.c: use 'vlenb'
>   target/riscv/vector_helper.c: use vlenb in HELPER(vsetvl)
>   target/riscv/insn_trans/trans_rvv.c.inc: use 'vlenb' in MAXSZ()
>   target/riscv/cpu.h: use 'vlenb' in vext_get_vlmax()
>   target/riscv: change vext_get_vlmax() arguments
>   trans_rvv.c.inc: use vext_get_vlmax() in trans_vrgather_v*()
>   target/riscv/cpu.c: remove cpu->cfg.vlen

Do you mind rebasing this on
https://github.com/alistair23/qemu/tree/riscv-to-apply.next ?

Alistair

>
>  target/riscv/cpu.c                         |  12 +-
>  target/riscv/cpu.h                         |  14 +-
>  target/riscv/cpu_cfg.h                     |   2 +-
>  target/riscv/cpu_helper.c                  |  11 +-
>  target/riscv/csr.c                         |   4 +-
>  target/riscv/gdbstub.c                     |   6 +-
>  target/riscv/insn_trans/trans_rvbf16.c.inc |  12 +-
>  target/riscv/insn_trans/trans_rvv.c.inc    | 152 ++++++++++-----------
>  target/riscv/insn_trans/trans_rvvk.c.inc   |  16 +--
>  target/riscv/tcg/tcg-cpu.c                 |   4 +-
>  target/riscv/vector_helper.c               |  43 +++---
>  11 files changed, 148 insertions(+), 128 deletions(-)
>
> --
> 2.43.0
>
>

