Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42092C47258
	for <qemu-riscv@archiver.kernel.org>; Tue, 23 Jan 2024 05:47:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rS9cT-0006DT-TZ; Tue, 23 Jan 2024 00:46:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rS9cO-00067P-VF; Tue, 23 Jan 2024 00:46:41 -0500
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rS9cL-00084Q-QH; Tue, 23 Jan 2024 00:46:39 -0500
Received: by mail-vs1-xe33.google.com with SMTP id
 ada2fe7eead31-46705557756so604660137.1; 
 Mon, 22 Jan 2024 21:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705988792; x=1706593592; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a3rXgWn5IuDB6M8Y07Gvb4DD+m5fCBo9w+t0lkMafAw=;
 b=BuvDEEyRudhy8NG9gDD3EmuVBxRkQZpYzqXTb0kSaK76GvF9mLF+hj7r7Gf98JMhcR
 JcK37Z8vWl6mryaVl/LYsZf4tq5kxcExyQXtLQVP3+VFYuTDtGpMeJP3Qln/kv7jHu/a
 3B6ZaZ4lhDZx3qiB0HFZD60i5Qc3MKnRcKhGV3dED2zo20pniw9IsE45QVWPTkaGegSj
 cka+bTE1XYgb0AjM+us8vb/6JR5XLQw6YILVMSXmO2N+gw6OF+oPdWyWUml3Zzoa6xwj
 vmgUeo/sglRTShnz2S1dnehTrQ9YSZ53WGC4bQwjgkl90e26yBBEQ+NCRVFPlP+blil8
 TVgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705988792; x=1706593592;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a3rXgWn5IuDB6M8Y07Gvb4DD+m5fCBo9w+t0lkMafAw=;
 b=llxQjxxYe7XmWFvfCihBcubFbRA7jPdSwZzRJAfV+SeG4v7nO7tK1+bsljblKVuhpA
 hD8sGiXlZoJi+TLXfotKXi+O530oM70zqQT3GbHojgtMjTosoy3oZkLkXcta1CgKtvop
 S5tw/b5Bhr/IYA74ME1+kt3+DxhVliRShSyuOStdIBnaYV7bIEP5ZsGpiwYDDTEXAQW9
 X3PzCqz18aZkQKgAEJ8m1mi+yYPq3B2B0fkR8TZlFa597ZEWXIlBcITYwXIDQGyl9qbc
 Rvc1vzgNjO0OvRnPjYtWQ7iZuxrxFUUJ+pxZXFe+KhHneWN3LmslYe6a3uDBcjj7VJ8X
 wytQ==
X-Gm-Message-State: AOJu0YxkzAP+wAJB4TwcBaW5NlgEiACQNS88JZ/kp/Su5RfP/sDDE+uK
 q+A28OWsc7Lwg9+QSNNkzWwrytz9hidOfTiNsZSuBWRuL5EiW0kwfn6MbuB8nCQqlTpsXIDP2RH
 kY/+oaF4Z+eM1nTTzfFu9kMYwslI=
X-Google-Smtp-Source: AGHT+IGSQpKwr2g9P4TVonnCxVhAYoHwBDe1Jmon6jo6A1ELbnQZphFcZBvSK5yncih4WZlDZsbvl6GE5gB/QVapbSQ=
X-Received: by 2002:a67:ff02:0:b0:469:b799:45ac with SMTP id
 v2-20020a67ff02000000b00469b79945acmr1311475vsp.27.1705988792343; Mon, 22 Jan
 2024 21:46:32 -0800 (PST)
MIME-Version: 1.0
References: <20240122161107.26737-1-dbarboza@ventanamicro.com>
In-Reply-To: <20240122161107.26737-1-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 23 Jan 2024 15:46:06 +1000
Message-ID: <CAKmqyKNrL3dwzKwERtu3+sjVAHM1nOT8VDMVv-9H-oavEiYuPg@mail.gmail.com>
Subject: Re: [PATCH v4 00/13] target/riscv: add 'cpu->cfg.vlenb', remove
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e33;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe33.google.com
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

On Tue, Jan 23, 2024 at 2:11=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Hi,
>
> This new version is rebased with a newer riscv-to-apply.next branch
> (@ 096b6b0729). No other changes made.
>
> All patches acked.
>
> v4 link: https://lore.kernel.org/qemu-riscv/20240116205817.344178-1-dbarb=
oza@ventanamicro.com/
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

Thanks!

Applied to riscv-to-apply.next

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

