Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B637CD37B4
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 01:02:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qi2eA-0006fI-Pb; Sun, 17 Sep 2023 21:01:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qi2e7-0006ea-EY; Sun, 17 Sep 2023 21:01:52 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qi2e5-0003sB-Dj; Sun, 17 Sep 2023 21:01:51 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-52a1ce52ef4so4897247a12.2; 
 Sun, 17 Sep 2023 18:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1694998907; x=1695603707; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NGuKLFi/4BzaOYJPaWuN4XNTCDl137JuUSO9loJW6L4=;
 b=Fm4r2NHSjkRtn4L7iHlCcbF0FgwvbnFDKrzD+o+x+5mHBzKdzHHS1PGp18Yk2p4+G2
 JnYxgCK6sRnPB/boRzW9MnviDLutb6Cu2/wnu2osmny4jBsVrvh7go0WxvjVrHg0to+h
 KIlfSeMwMd9jl2i3bwQZhQTEZARBXCsAoq/DAE7kmxRc3Z+qkrA8yGoeTkgMuJJrji3y
 6wpwl1DFD3EUbpM7o20HprZIVzPPE8AoxkAxNgu9Rr7N9+26hTekaHEnbSRM2EXOx6Z0
 szcLLPKNjoQ9fdcCSViPyJU4MSpqayFCMzQpQ/PYBI+VMtytE3hvriyhKpV2NtcKC3WT
 KKBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694998907; x=1695603707;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NGuKLFi/4BzaOYJPaWuN4XNTCDl137JuUSO9loJW6L4=;
 b=B7JQu9y1r5Ur9Gyw7OpujcQKihI3vNe1xQOl31Iy/Fv+Et9FVj1kIqqmCfNa3lvF7u
 pr8jnaM5wteYRVceBjgmXNIPQLZvYh2uH00sIzFUi12qc5mtPNFJbyR3ekRvqQAStshc
 anDtzSpIqJdeRPeiAypVQtz0ThL6PrqXiC/ck7hQ0WGHb+rbRynVmnaL1yRnxTWK9KlL
 EBW7kYpbJo/nL79xAGsbKQidPxy3NY98TOHytF7H+AoVgZgbtVU8JrpRKDzLFKNHSsWi
 S9gd4Chm6vx0dBvifsOzcVQLiGPHnWzH1XV9zmp4PMX+sFkiUqv+NCKn3H6jtjjbL3RG
 fOaQ==
X-Gm-Message-State: AOJu0YwtChuc2/uSxlPrzxBIU6LIQyhpGhR43JNxrmVnoiVYe6uP6qpZ
 QIXqWhABgXMzFrAliIRI+o5VOV2l0coBqFUDTOo=
X-Google-Smtp-Source: AGHT+IGdLEvqRx+ksZHJQphO8i3cNkNeekDlpM0JfJdoiWQF3PIL2aqQkTaKotzR1I71GfnGttCFzXlhjF9TEvR8snA=
X-Received: by 2002:aa7:c795:0:b0:530:4bcd:626c with SMTP id
 n21-20020aa7c795000000b005304bcd626cmr6502131eds.23.1694998906548; Sun, 17
 Sep 2023 18:01:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230912132423.268494-1-dbarboza@ventanamicro.com>
In-Reply-To: <20230912132423.268494-1-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 Sep 2023 11:00:53 +1000
Message-ID: <CAKmqyKPtXGEUpbYFtxGGsNtA4QVOTz47mCRm=tc6jpzimTtgkQ@mail.gmail.com>
Subject: Re: [PATCH v10 00/20] riscv: 'max' CPU, detect user choice in TCG
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com, philmd@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x52e.google.com
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

On Tue, Sep 12, 2023 at 11:25=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Hi,
>
> In this version we have a change in patch 3. It was causing a build
> break with --enable-debug builds that weren't being detected by regular
> gitlab CI but was detected when running the merge CI [1]. The problem is
> reproducible by any risc-v --enable-debug build.
>
> I ended up leaving kvm_riscv_cpu_add_kvm_properties implementation
> inside cpu.c, since it can't be easily moved to kvm.c at this point,
> while adding its function declaration in kvm_riscv.h since it's a KVM
> only function. This is temporary, not a pattern we want to promote.
> We'll move the function to kvm.c when splitting accelerators logic in
> "riscv: split TCG/KVM accelerators from cpu.c", patch 08 in the current
> version of that series [2].
>
> Series rebased on top of master. Only patch 3 is missing acks.
>
> Changes from v9:
> - patch 3:
>   - use #ifdef CONFIG_KVM instead of #ifndef CONFIG_USER_ONLY
>   - helper renamed to kvm_riscv_cpu_add_kvm_properties
>   - helper is declared in kvm_riscv.h
> - v9 link: https://lore.kernel.org/qemu-riscv/20230901194627.1214811-1-db=
arboza@ventanamicro.com/
>
> [1] https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01729.html
> [2] https://lore.kernel.org/qemu-riscv/20230906091647.1667171-9-dbarboza@=
ventanamicro.com/
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

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  docs/about/deprecated.rst         |  12 +
>  target/riscv/cpu-qom.h            |   1 +
>  target/riscv/cpu.c                | 564 +++++++++++++++++++++---------
>  target/riscv/cpu.h                |   2 +
>  target/riscv/kvm.c                |   8 +-
>  target/riscv/kvm_riscv.h          |   3 +
>  tests/avocado/tuxrun_baselines.py |  32 ++
>  7 files changed, 452 insertions(+), 170 deletions(-)
>
> --
> 2.41.0
>
>

