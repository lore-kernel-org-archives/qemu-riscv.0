Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 630DECE7A8B
	for <qemu-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 03:30:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qkcJ4-0002OB-KN; Sun, 24 Sep 2023 23:30:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qkcIx-0002NA-0T; Sun, 24 Sep 2023 23:30:43 -0400
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qkcIv-00030w-7B; Sun, 24 Sep 2023 23:30:38 -0400
Received: by mail-ua1-x92d.google.com with SMTP id
 a1e0cc1a2514c-79a2216a2d1so2015942241.2; 
 Sun, 24 Sep 2023 20:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695612635; x=1696217435; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G9T+UpR7HZxXOs7aXxZ2OXpsfKV6MonZgK7TngX6oB4=;
 b=gRdfs9wae7FSw5JnFnd8aRXC0ELOmGbMgtzn23JFGYHe0i+pffGYjKzay36IuzmJ74
 F1Ux1hKcVzNmc9A6PZPjPu0ASPhR4n5CvQu6rTOUSTpBzNli2E0aKQBe1I9TQ6qo/imy
 Oa7x8yUv5i3zH4fz+y4l90tu07LMuuK6e0Bzund/RGxUnhM0JN0Lce7KdtUfabp6b6PW
 Nt7EuDRMQmnDeEOOSfHis1QQ5N9c9z89TJsQAzjUCRHCH561vcEA7wTTiKJ3Txs9HL9q
 Ji0rVj7mZtEbHW3lh33jJ8+bnGPVZDqVWbwHcysMkF3eRene4mAX/crTjkSIoIILek9Y
 TrRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695612635; x=1696217435;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G9T+UpR7HZxXOs7aXxZ2OXpsfKV6MonZgK7TngX6oB4=;
 b=rDhDKcvv9IsOWoaRA2dhz/gqKlFgWcYxwN15Q0BTRNZzbzHfMLRK18mcd1mvTM01SE
 Eu5SMUJu7RtCdwfaJkyI2SGURysjB0GxZbejvPnl10eqyVi2RwZF0pJlgDQYTOnby3ir
 a/3mQIljiDDT1/SIevGhkMKGwJEPzLxtkhDJ7DfFxlOPRkiN3DXiyJ5AeviJrrZeqXN0
 r28kOiadx8ffRgcR7O0MyrRlAlpgJPkrYkcqW3061pMVZH86gQPyYiPPk7QPAgquisFt
 Gz42aYMkB7FepiUw7mKJec0MomC0NHuSum6HgwiR4e1v3mdD1UNpenbjnHZFGelIjhlT
 gUyQ==
X-Gm-Message-State: AOJu0YwCCE5sD/CtI1rMraqCYvEq9JyF7mb8RAc1gCyuVGCHwB+OQ2P7
 8+L5m+wRkL2b1v3PAYFxapxhA9G6EtkyYuiC2jk=
X-Google-Smtp-Source: AGHT+IFPJc7/GfZHWZEOJc9wXuvaw77sVkOZiT8MbQ2yd8k8Svl9OiVNe2NLkx+Oy4DCrepsDKTd8FdSt2BhJZwB5Z0=
X-Received: by 2002:a05:6102:134f:b0:450:f3aa:f405 with SMTP id
 j15-20020a056102134f00b00450f3aaf405mr2812372vsl.17.1695612635058; Sun, 24
 Sep 2023 20:30:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230920112020.651006-1-dbarboza@ventanamicro.com>
In-Reply-To: <20230920112020.651006-1-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 25 Sep 2023 13:30:08 +1000
Message-ID: <CAKmqyKNaimFBiiRBdrt137fcD0fh+oepSOi5zgfKL9nrWmSCsw@mail.gmail.com>
Subject: Re: [PATCH v3 00/19] riscv: split TCG/KVM accelerators from cpu.c
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, philmd@linaro.org, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92d;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92d.google.com
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

On Wed, Sep 20, 2023 at 9:26=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Hi,
>
> In this version we changed patch 10 (remove kvm-stub.c) as suggested by
> Phil to not include non-KVM stubs in kvm_riscv.h. A change in patch 05
> requested by Zhiwei was also made.
>
> Patches based on Alistair's riscv-to-apply.next.
>
> Patches missing acks: patch 10
>
> Changes from v2:
> - patch 05:
>   - remove riscv_cpu_add_user_properties() from riscv_host_cpu_init()
> - patch 10:
>   - do not add non-KVM stubs in kvm_riscv.h
> - v2 link: https://lore.kernel.org/qemu-riscv/20230906091647.1667171-1-db=
arboza@ventanamicro.com/
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

