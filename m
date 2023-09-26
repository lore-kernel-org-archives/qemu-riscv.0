Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA5CCE8180F
	for <qemu-riscv@archiver.kernel.org>; Tue, 26 Sep 2023 01:39:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qkx34-0005Ip-M5; Mon, 25 Sep 2023 21:39:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qkx33-0005IM-CD; Mon, 25 Sep 2023 21:39:37 -0400
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qkx31-0002fy-Ok; Mon, 25 Sep 2023 21:39:37 -0400
Received: by mail-vs1-xe2d.google.com with SMTP id
 ada2fe7eead31-44ee3a547adso3181901137.2; 
 Mon, 25 Sep 2023 18:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695692374; x=1696297174; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Edih9qW7HETeoFZkZ9/w7uCjY8X16grU3S/ONqMsy64=;
 b=Cu7T1MeMfJXvcVCQjN7ztMdUH687TXlqplWZ5+LMtZJ6cfFbuOYURaeuIhXaqALciN
 tq898O6CQuonwrK5lVaLRg6dfzaJHNUijE6ryRVUOJ93fIkwK5R9ezfEOBc3+f164kFE
 w/hp5hscW0hVd05AVnMFVNCJOie8UuvX13s6p8D49MQXA6K49YmsG175xW+fbzFY2yc9
 bDibBG7KBqV0S205TBBDDg+ke3Ycuosm95YTMcTB+A31AvXvEl2XQSA2XbfZvs8icotV
 A/4R7DvLnivlsz1o+7DdaBf9KMf+zG4NTmu4jX90Mq0d5Qv9MI/xISJs88B0d9ciAfCw
 5B9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695692374; x=1696297174;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Edih9qW7HETeoFZkZ9/w7uCjY8X16grU3S/ONqMsy64=;
 b=Fj4KkpRM+Rc3CpvCLMH6PodFNfqvD024SHs11Ofn0iIH3vm8c53oVyTDhbpL8m7xS2
 hZqRKYizIcH/OpuGhFMegPeDQEvOVifrr5xEedLxNwxDsA7zrqd5B+jlVkeKDsZZUaxa
 WpBtyIwuDWkQ7zzI9Bzkkil+U+Zm47cPy+IzhDZD8POHvPbV7K2s3joyzm4BPyVdpd8c
 7naSB+iB5uwAdJHSCoUJcssLVmk1JnlTFXSiiuOUiX+klmKx1tiWBoqDN8Itkj51kj1Z
 De9EEc0LsmIXRIKhdrGgMSUXYkKN2t4dqN4HzD2AdqtlfC+VA00zcsrPyYqVoaFeoplD
 Y3aw==
X-Gm-Message-State: AOJu0YzphNzUnEOd+IMDx6Tic0Pjpwa6mrYt6f/90Pdv2J/fLrJmljgO
 y3vUCj4RYYA4paJwhuRq9a2sW9vf1GRwbyOOHr8=
X-Google-Smtp-Source: AGHT+IHg0SqdmJ0sd4++JeCxb2Z7w/DsNg2ikDUMpzuNWewxGNxFpPfRtRhqUS4hd0ufORiLubA9jp5H7ew9Sa6c7PQ=
X-Received: by 2002:a67:fa16:0:b0:452:cfeb:1607 with SMTP id
 i22-20020a67fa16000000b00452cfeb1607mr6133975vsq.5.1695692374216; Mon, 25 Sep
 2023 18:39:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230925175709.35696-1-dbarboza@ventanamicro.com>
In-Reply-To: <20230925175709.35696-1-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 26 Sep 2023 11:39:07 +1000
Message-ID: <CAKmqyKMX61GOqy2SKhwPFnkiz2VWES519dAUwneNHWpn-8OhCw@mail.gmail.com>
Subject: Re: [PATCH v4 00/19] riscv: split TCG/KVM accelerators from cpu.c
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2d;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2d.google.com
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

On Tue, Sep 26, 2023 at 3:58=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Hi,
>
> This new version has a simple copyright change in the tcg-cpu.c file,
> patch 01, suggested by Alistair in v3. No other changes made.
>
> All patches acked/reviewed.
>
> Changes from v3:
> - patch 1:
>   - use cpu.c copyright notice in tcg-cpu.c
> - v3 link: https://lore.kernel.org/qemu-riscv/20230920112020.651006-1-dba=
rboza@ventanamicro.com/
>
> Daniel Henrique Barboza (19):
>   target/riscv: introduce TCG AccelCPUClass
>   target/riscv: move riscv_cpu_realize_tcg() to TCG::cpu_realizefn()
>   target/riscv: move riscv_cpu_validate_set_extensions() to tcg-cpu.c
>   target/riscv: move riscv_tcg_ops to tcg-cpu.c
>   target/riscv/cpu.c: add .instance_post_init()
>   target/riscv: move 'host' CPU declaration to kvm.c
>   target/riscv/cpu.c: mark extensions arrays as 'const'
>   target/riscv: move riscv_cpu_add_kvm_properties() to kvm.c
>   target/riscv: make riscv_add_satp_mode_properties() public
>   target/riscv: remove kvm-stub.c
>   target/riscv: introduce KVM AccelCPUClass
>   target/riscv: move KVM only files to kvm subdir
>   target/riscv/kvm: do not use riscv_cpu_add_misa_properties()
>   target/riscv/cpu.c: export set_misa()
>   target/riscv/tcg: introduce tcg_cpu_instance_init()
>   target/riscv/cpu.c: make misa_ext_cfgs[] 'const'
>   target/riscv/tcg: move riscv_cpu_add_misa_properties() to tcg-cpu.c
>   target/riscv/cpu.c: export isa_edata_arr[]
>   target/riscv/cpu: move priv spec functions to tcg-cpu.c

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  hw/intc/riscv_aplic.c                 |   2 +-
>  hw/riscv/virt.c                       |   2 +-
>  target/riscv/cpu.c                    | 988 ++------------------------
>  target/riscv/cpu.h                    |  30 +-
>  target/riscv/csr.c                    |   1 +
>  target/riscv/kvm-stub.c               |  30 -
>  target/riscv/{kvm.c =3D> kvm/kvm-cpu.c} | 120 +++-
>  target/riscv/{ =3D> kvm}/kvm_riscv.h    |   4 -
>  target/riscv/kvm/meson.build          |   1 +
>  target/riscv/meson.build              |   4 +-
>  target/riscv/tcg/meson.build          |   2 +
>  target/riscv/tcg/tcg-cpu.c            | 883 +++++++++++++++++++++++
>  target/riscv/tcg/tcg-cpu.h            |  27 +
>  13 files changed, 1113 insertions(+), 981 deletions(-)
>  delete mode 100644 target/riscv/kvm-stub.c
>  rename target/riscv/{kvm.c =3D> kvm/kvm-cpu.c} (91%)
>  rename target/riscv/{ =3D> kvm}/kvm_riscv.h (89%)
>  create mode 100644 target/riscv/kvm/meson.build
>  create mode 100644 target/riscv/tcg/meson.build
>  create mode 100644 target/riscv/tcg/tcg-cpu.c
>  create mode 100644 target/riscv/tcg/tcg-cpu.h
>
> --
> 2.41.0
>
>

