Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA70EE7716B
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Dec 2024 13:00:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tIozI-0004gu-1Y; Wed, 04 Dec 2024 08:00:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rkanwal@rivosinc.com>)
 id 1tIoyv-0004SF-JU
 for qemu-riscv@nongnu.org; Wed, 04 Dec 2024 07:59:54 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rkanwal@rivosinc.com>)
 id 1tIoyt-0002J8-Q6
 for qemu-riscv@nongnu.org; Wed, 04 Dec 2024 07:59:53 -0500
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-385f4a4093eso2330419f8f.1
 for <qemu-riscv@nongnu.org>; Wed, 04 Dec 2024 04:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1733317190; x=1733921990;
 darn=nongnu.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k+QHDoC12Vwk0MQD6cF5S0Ehwdz+Xb5Hq++uwOq5zZU=;
 b=ShnLHkJ0ohrElYxhS+gtoHzXlcm8wEoT1jDhGjhQw/9n/+rFRtmJtWkBe0GU0IGOPM
 RMe12c0RUISfbBi5kG0iFBzy6L/skdwRsgU8iL3qjjGglXG4Sk+yrqwmEZuayjhwm26s
 2zN8PmJPhAsrBHRN++5cpRusIHxrSFUx9K/dCN6kg9IMw2R94RMJPceofEcYKl6SBhaw
 1/rb23/MoBnJhjjACZ/zD6p+6L0Nrzlqm3D6MqIawtC1LbfBeExSzUcXvSOA5KkV4wNq
 IWkMqwLPhDVMWqmV/1KqJxsurfb2NZckdMMGqcNa9uPmHOr+NWTjAXl91Y8EHzsGb5zi
 sRJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733317190; x=1733921990;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k+QHDoC12Vwk0MQD6cF5S0Ehwdz+Xb5Hq++uwOq5zZU=;
 b=d7WBJ3YK8VwBbzHL/ljyxDq0xdoIAetcrlonjzC2ytsnKi2g4YcBSsOnrtkWrs4+sw
 8pHntpj8/tn9pisjtqeMTSr544fTQkgRtjVb7I0UZqwOImfgvNo23t1qBqqke+yx9lbx
 oemQwQyGV383gXJCB7mrNkhLccU1fz1h7VXUvemvO8UBQU/wyIvF6yZC+/iggkApy7FT
 qM8Y261qvHndfYDvhb/HrlG9iQkjaNqUQr35wHzHZsR4R6UQga4uuN5eShtgGPZpS3Fc
 +UOlYcZLSRQbj6HcklIFaECdf3k1rKZwv3uQeftQ86yGGUINDp2hSCm6+dlAJVQyy4wE
 KTjw==
X-Gm-Message-State: AOJu0Yy1+tS0Eh1BAXeRIx6UTTkio3aUr6ZClbNuqLlQflmOZ/fVhkT8
 c9Ybi+/wvd1pHxfRLSCC5IggGrXyYtCqTvSWKwQXdMJ6AVjax4HOO1edyah7i4stQ8ypcZbk1U5
 hu2yrpBj2Bj6Zdn4uumRH3FvxOJB2oRz5V4GLXA==
X-Gm-Gg: ASbGncs7YkRHs9dlanFDAy7gGX/xTYIjD1zA7rhJABoEqqrwu6SQAwDG9fAyliggkba
 1L8qI1tm1eK4hrUR7cBPQevR2svWGzbE=
X-Google-Smtp-Source: AGHT+IG2vTg2yoHVYewqAsj0u6YPtLlyjpnv16sTrDGYwpXiH9bDi82EeBa8v7aBu1AMMzzpIONuziBlZ4OcvUQyH/A=
X-Received: by 2002:a5d:6d0b:0:b0:386:857:cc54 with SMTP id
 ffacd0b85a97d-3860857cfecmr3108870f8f.9.1733317190243; Wed, 04 Dec 2024
 04:59:50 -0800 (PST)
MIME-Version: 1.0
References: <20241104-b4-ctr_upstream_v3-v3-0-32fd3c48205f@rivosinc.com>
 <12e5b415-a80a-49b3-b98a-33a398ebf56d@linaro.org>
In-Reply-To: <12e5b415-a80a-49b3-b98a-33a398ebf56d@linaro.org>
From: Rajnesh Kanwal <rkanwal@rivosinc.com>
Date: Wed, 4 Dec 2024 17:59:39 +0500
Message-ID: <CAECbVCviViVihuh=yCk5ADCZmM-447sdM3_BJ6y8_by0inq+2w@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] target/riscv: Add support for Control Transfer
 Records Ext.
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, alistair.francis@wdc.com, 
 bin.meng@windriver.com, liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, atishp@rivosinc.com, apatel@ventanamicro.com, 
 beeman@rivosinc.com, tech-control-transfer-records@lists.riscv.org, 
 jason.chien@sifive.com, frank.chang@sifive.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=rkanwal@rivosinc.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Tue, Nov 5, 2024 at 3:58=E2=80=AFPM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 11/4/24 21:51, Rajnesh Kanwal wrote:
> >   target/riscv/cpu.c                             |  26 ++-
> >   target/riscv/cpu.h                             |  13 ++
> >   target/riscv/cpu_bits.h                        |  94 ++++++++
> >   target/riscv/cpu_cfg.h                         |   2 +
> >   target/riscv/cpu_helper.c                      | 266 ++++++++++++++++=
++++++
> >   target/riscv/csr.c                             | 294 ++++++++++++++++=
++++++++-
> >   target/riscv/helper.h                          |   9 +-
> >   target/riscv/insn32.decode                     |   2 +-
> >   target/riscv/insn_trans/trans_privileged.c.inc |  22 +-
> >   target/riscv/insn_trans/trans_rvi.c.inc        |  31 +++
> >   target/riscv/insn_trans/trans_rvzce.c.inc      |  20 ++
> >   target/riscv/op_helper.c                       | 155 ++++++++++++-
> >   target/riscv/tcg/tcg-cpu.c                     |  11 +
> >   target/riscv/translate.c                       |  10 +
> >   14 files changed, 941 insertions(+), 14 deletions(-)
>
> You're missing code in machine.c to migrate the new state.
>

Nice catch. Thanks for your feedback Richard. I have fixed
all your feedback in v4.

- Rajnesh

>
> r~

