Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 762CDEE49A4
	for <qemu-riscv@archiver.kernel.org>; Mon, 11 Sep 2023 02:35:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qfWlp-0006Fy-OW; Sun, 10 Sep 2023 22:35:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qfWln-00068x-R1; Sun, 10 Sep 2023 22:35:23 -0400
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qfWll-0004C7-Ey; Sun, 10 Sep 2023 22:35:23 -0400
Received: by mail-vk1-xa2c.google.com with SMTP id
 71dfb90a1353d-49059b1ca83so1291787e0c.2; 
 Sun, 10 Sep 2023 19:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694399720; x=1695004520; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zrtHV1AlGtL/pSceG5ncefEMU1KPGtIzX0EgrEmjWw8=;
 b=D1mK8CJ7h7vlF8lR3zbHsf+eE/jupD8AVYhE55WZ9U2wop9qIF56Ts2AUyqdFgY4VK
 mF0Mzsh/99f95k2f0osPH8xvSsF8jgIHwxJQnLDWKDmENGBCzQBWRsVn9kheUxbKxcRH
 MjrGBxIKSy7nwNGe7zVLAX97Cz/KMUJWiMV6Ii8HzRuKY2TzNUt2SM3bK5AYNSmLKeZk
 34M2eP/+1/WEmsJGhw7/f9N1sd45p8ZS7LyTEc9W1z44yY11+g23QgzJ8/KP5D1D104q
 yVfxM5/UnTYtvoz9X8R4A1HAyZ4iAFZTraBLGzB9mGB3mgpx1pagXCeboAB12EZI4clr
 +3IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694399720; x=1695004520;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zrtHV1AlGtL/pSceG5ncefEMU1KPGtIzX0EgrEmjWw8=;
 b=q8CoTmpfJL8pVss8bxHvs/cFC4Eh/Q/yS63cojiHAh7evMWwUQZIN8XDxT38I5ArKt
 u4ZWM/gPSjGc5mH71XzYpStuXjEG9AYHO/nYjd+WC2CozalJfK6lJrMoc/o9z/S46Y9t
 25/N/9kWFDnJ3SqRB//gGT+q/LAe4hly5dR1xNSMhl+emMdmYf7QWE/xwg0DGwuS1s1k
 ZnhItc9jbPqdVhZX2U8KTqFmhTzc6SXKzMFeTo6U0KCw4Zi85/n+1Qpx9Ghivh/pDLEO
 X8ErHfSllB2PipXeiPIXMZCX3kBt5cIvdQlkkRJMsZVzs+zWnB0Ha3sicW1voTSxA6xS
 klqg==
X-Gm-Message-State: AOJu0Yz7+yaOkpaMQaVkCIS2JF2IdhdikE0bN8ONrXsed4ZrFVT1zeDa
 hzbVY2rhoq9F71FRje9DhHmCVFOa8FHq1cvcS58=
X-Google-Smtp-Source: AGHT+IGqaMKblIau5v/BxA659Sdv13F7gvQUzr1Pq8iZBwxPQrj/0Ot5FadVP1jkwH8v6nPoPhz+FZYdHnP8/GWUeYo=
X-Received: by 2002:a1f:4a41:0:b0:48f:8f80:8bf4 with SMTP id
 x62-20020a1f4a41000000b0048f8f808bf4mr5262141vka.16.1694399720086; Sun, 10
 Sep 2023 19:35:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230901194627.1214811-1-dbarboza@ventanamicro.com>
In-Reply-To: <20230901194627.1214811-1-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 11 Sep 2023 12:34:53 +1000
Message-ID: <CAKmqyKO3FX7tooTMeOh7ENVh+ca3eAYwqC-QV9h+r7615scXSQ@mail.gmail.com>
Subject: Re: [PATCH v9 00/20] riscv: 'max' CPU, detect user choice in TCG
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2c;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2c.google.com
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

On Sat, Sep 2, 2023 at 5:48=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Hi,
>
> This new version contains suggestions made by Andrew Jones in v8.
>
> Most notable change is the removal of the opensbi.py test in patch 11,
> which was replaced by a TuxBoot test. It's more suitable to test the
> integrity of all the extensions enabled by the 'max' CPU.
>
> The series is available in this branch:
>
> https://gitlab.com/danielhb/qemu/-/tree/max_cpu_user_choice_v9
>
> Patches missing acks: 11, 15
>
> Changes from v8:
> - patch 7:
>   - add g_assert(array) at the start of riscv_cpu_add_qdev_prop_array()
> - patch 8:
>   - add g_assert(array) at the start of riscv_cpu_add_kvm_unavail_prop_ar=
ray()
> - patch 11:
>   - removed both opensbi.py tests
>   - added 2 'max' cpu tuxboot tests in tuxrun_baselines.py
> - patch 12:
>   - fixed typos in deprecated.rst
> - patch 15:
>   - use g_assert_not_reached() at the end of cpu_cfg_ext_get_min_version(=
)
> - patch 19:
>   - added comment on top of riscv_cpu_add_misa_properties() explaining wh=
y
>     we're not implementing user choice support for MISA properties
> - patch 20:
>   - warn_report() is now called after the G error conditions
> - v8 link: https://lore.kernel.org/qemu-riscv/20230824221440.484675-1-dba=
rboza@ventanamicro.com/
>
>
>
> Daniel Henrique Barboza (20):
>   target/riscv/cpu.c: split CPU options from riscv_cpu_extensions[]
>   target/riscv/cpu.c: skip 'bool' check when filtering KVM props
>   target/riscv/cpu.c: split kvm prop handling to its own helper
>   target/riscv: add DEFINE_PROP_END_OF_LIST() to riscv_cpu_options[]
>   target/riscv/cpu.c: split non-ratified exts from
>     riscv_cpu_extensions[]
>   target/riscv/cpu.c: split vendor exts from riscv_cpu_extensions[]
>   target/riscv/cpu.c: add riscv_cpu_add_qdev_prop_array()
>   target/riscv/cpu.c: add riscv_cpu_add_kvm_unavail_prop_array()
>   target/riscv/cpu.c: limit cfg->vext_spec log message
>   target/riscv: add 'max' CPU type
>   avocado, risc-v: add tuxboot tests for 'max' CPU
>   target/riscv: deprecate the 'any' CPU type
>   target/riscv/cpu.c: use offset in isa_ext_is_enabled/update_enabled
>   target/riscv: make CPUCFG() macro public
>   target/riscv/cpu.c: introduce cpu_cfg_ext_auto_update()
>   target/riscv/cpu.c: use cpu_cfg_ext_auto_update() during realize()
>   target/riscv/cpu.c: introduce RISCVCPUMultiExtConfig
>   target/riscv: use isa_ext_update_enabled() in
>     init_max_cpu_extensions()
>   target/riscv/cpu.c: honor user choice in cpu_cfg_ext_auto_update()
>   target/riscv/cpu.c: consider user option with RVG

This series has some build issues. I was hoping a few simple #ifdef
changes would fix it, but it's a little more complex than that
unfortunately.

I'm going to drop this series, do you mind sending a new version which
fixes this and any other build failures:
https://gitlab.com/qemu-project/qemu/-/jobs/5045998521

Alistair

>
>  docs/about/deprecated.rst         |  12 +
>  target/riscv/cpu-qom.h            |   1 +
>  target/riscv/cpu.c                | 564 +++++++++++++++++++++---------
>  target/riscv/cpu.h                |   2 +
>  target/riscv/kvm.c                |   8 +-
>  tests/avocado/tuxrun_baselines.py |  32 ++
>  6 files changed, 450 insertions(+), 169 deletions(-)
>
> --
> 2.41.0
>
>

