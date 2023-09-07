Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE0FEE14D3
	for <qemu-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 04:14:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qe6PX-0007gB-2N; Thu, 07 Sep 2023 00:14:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qe6PV-0007f2-C0; Thu, 07 Sep 2023 00:14:29 -0400
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qe6PS-0001wV-EE; Thu, 07 Sep 2023 00:14:29 -0400
Received: by mail-vs1-xe2a.google.com with SMTP id
 ada2fe7eead31-44d4d997dcfso213627137.0; 
 Wed, 06 Sep 2023 21:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694060064; x=1694664864; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/YGLzkne9IxnlblMwEuFvZCvXmYXq1l/Bytms/2SnD0=;
 b=KnbAtcGzkzg+4ZaS+dWE2vEj+D8whzL01w+EgJfreG3AsKCxzUgC6NC7HY9jmXPxRw
 DF04KjXzcRQcyA9mCArFel32YzfRyYjUjc4R78SxBRVXMtGqgjwgz/dKMgm/+jTv0oQz
 b9D6WlPfc4XLBn2ssQiw3oUmnLZsRicodPYxR9utgNVTLbM3pzL0aeU0ZUe7DUaCNeOY
 fZI1uX8p1bkUSVWHe6w2C7kO8T1xyzaUdI3v7nvgHrkhU7tdwB9m0+AXEBt6FIKBygav
 7I6NEA+MJ7G+G0iXNoQjmzGpDrU1Jcjfw4TokpWSs+1qa3GPhveANtrEB9kpZ58MfkgX
 qx5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694060064; x=1694664864;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/YGLzkne9IxnlblMwEuFvZCvXmYXq1l/Bytms/2SnD0=;
 b=TDeskW/9ZCEFaXfCDfRUEZGrfDfaful9iTs+4JbxBqDT/6EKV0N6sDd8u5wdCW4dua
 X93ZJsb2yK1Cl0fzHAh+LyxmZyRbA/IvihHz3Jdzh3NhjgVQE8SvY//GAeax7Z351Hp0
 Mg2Z6n68FIhHTro9cMtk+PngFQrVmW9cf6Iu9UZBxPzJAVo3to9Lwytbm03c0m87FvH/
 XCnr+DhBM81SDVd1YzvtXNVEwf/XWcGSC2tMRroTiqBsSjGqTpprbdvpKi5HDGOWqTt/
 jwcLhfALyjXr9gfOUtzuqIbpLX9IXjcc7KDFWZRj4K4K2OtrrIRJK5POcwXqgpIKz1N2
 /fRA==
X-Gm-Message-State: AOJu0YyiS1lxkctqs6lxhbTGLS84cZCVIBv3mS1r4mRNXOhtymInRhto
 o+pHQ9T3VFd5CngTuh9JP3lyxDbYHfmV5hEgOIk=
X-Google-Smtp-Source: AGHT+IHxwu/XDCC7FD+4eK8uNm4YdYWRgyzuMNtp309qzmRswhaFkgPblXlUk0N6vZRGAw1slmagkp9pszAbSoI87e8=
X-Received: by 2002:a67:f4d9:0:b0:443:60d7:e1e6 with SMTP id
 s25-20020a67f4d9000000b0044360d7e1e6mr5135205vsn.10.1694060064612; Wed, 06
 Sep 2023 21:14:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230901194627.1214811-1-dbarboza@ventanamicro.com>
In-Reply-To: <20230901194627.1214811-1-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 7 Sep 2023 14:13:57 +1000
Message-ID: <CAKmqyKMm13nDPSmCvqBV5aDwtHjLFxNqKQ5OF2oSR22-mpD85A@mail.gmail.com>
Subject: Re: [PATCH v9 00/20] riscv: 'max' CPU, detect user choice in TCG
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2a;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2a.google.com
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

Thanks!

Applied to riscv-to-apply.next

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

