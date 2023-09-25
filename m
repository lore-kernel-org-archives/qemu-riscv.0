Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9817ECE7A8B
	for <qemu-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 01:27:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qkaNn-0003z5-VQ; Sun, 24 Sep 2023 21:27:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qkaNi-0003yA-3Z; Sun, 24 Sep 2023 21:27:26 -0400
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qkaNg-0002xs-Cp; Sun, 24 Sep 2023 21:27:25 -0400
Received: by mail-vk1-xa32.google.com with SMTP id
 71dfb90a1353d-496a2ff7780so1771443e0c.2; 
 Sun, 24 Sep 2023 18:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695605242; x=1696210042; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=48Ub7f9UnW7mdJ9yDNbYZtxrcMpX8HWwPGhLojDu8+U=;
 b=XR/vEkVdWUVpGq4gV1dbsuYXAmyDlapW2wjYVF+fcdurhrFSI31tqL+s4VmJI6U5zS
 tfofuefvjmYaYaqcTFTA9MZP7QYN1KWJm5q8Zn9i90CnTR2O/su0xkQ+ituaWOTkqpi5
 t2L98KCRlYdq1OU0MmLFmS5wXssLkXIMCzGv2yLQ6saUybl1uQmeB48P4FYIMdav2lb1
 0iwTlNQkKdSaPgZVvl8Rh/7efFjfvehROoQSZRfdcFFnQ6R33xbb5b5Wgs//Y34OSIZi
 vGhBJrxmPaOOS3afnF9IzbFWaMwO0SbwYpJjStM6x5lZZeKezeYs1jHBJmapxyMHriAO
 UnsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695605242; x=1696210042;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=48Ub7f9UnW7mdJ9yDNbYZtxrcMpX8HWwPGhLojDu8+U=;
 b=HLWakOCuDCtPIPfSozUnjs0Ll8SBOJOOu55DZskkuURAMaeg8yuZ2XjhY1ZicvINix
 IZ4eUR/JzX5H5GemzOYbZL0Y8k+gCaPXcHKhVPwxN21rqXpnwWn8SBa/M5bjrXtI365r
 VB8ZWLT4i4KTW8/B57iq0hF5n0j7KY8a+Er/nvEdIq1FvrmRQ9LFiog6RGv6Oeg8HJE1
 AWEANmgJGK6QmUVM+iFliDyYd2hpZ6dTo/pMsEVUqsIv8P8R6R4bE2PqCCXRLjwxnBfb
 iUjWUxYTVpgrTXcQwrR/gIrVZTcW1hTHkzmw05XPjv8AfCCYERyzXbizGTI++3tr30qt
 Dlrg==
X-Gm-Message-State: AOJu0YzC/sK/T9B7jX6k5t0TZX53VTlRNYvj0DMbcDLBpXkq9PNvfPPj
 jYYZbD34ZK5LsBTp4cEX8PfN7K0g9d37mocNq74=
X-Google-Smtp-Source: AGHT+IE5QXd7oFq8xe50Tb4oQyFwB88DAy5wQq2f6T02ca8oPSGg0BCfo8zARm62UURM7ifXtHGxnVqGGw04+OWIAUE=
X-Received: by 2002:a05:6102:10c:b0:452:5a4f:21ad with SMTP id
 z12-20020a056102010c00b004525a4f21admr3028806vsq.18.1695605242586; Sun, 24
 Sep 2023 18:27:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230920112020.651006-1-dbarboza@ventanamicro.com>
 <20230920112020.651006-13-dbarboza@ventanamicro.com>
In-Reply-To: <20230920112020.651006-13-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 25 Sep 2023 11:26:55 +1000
Message-ID: <CAKmqyKO8Oe74y7MCWL_m+rUrv9cC0Q7Zw07i39Xn9Qu-q368AA@mail.gmail.com>
Subject: Re: [PATCH v3 12/19] target/riscv: move KVM only files to kvm subdir
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, philmd@linaro.org, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a32;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa32.google.com
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

On Wed, Sep 20, 2023 at 9:23=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Move the files to a 'kvm' dir to promote more code separation between
> accelerators and making our lives easier supporting build options such
> as --disable-tcg.
>
> Rename kvm.c to kvm-cpu.c to keep it in line with its TCG counterpart.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/intc/riscv_aplic.c                 | 2 +-
>  hw/riscv/virt.c                       | 2 +-
>  target/riscv/cpu.c                    | 2 +-
>  target/riscv/{kvm.c =3D> kvm/kvm-cpu.c} | 0
>  target/riscv/{ =3D> kvm}/kvm_riscv.h    | 0
>  target/riscv/kvm/meson.build          | 1 +
>  target/riscv/meson.build              | 2 +-
>  7 files changed, 5 insertions(+), 4 deletions(-)
>  rename target/riscv/{kvm.c =3D> kvm/kvm-cpu.c} (100%)
>  rename target/riscv/{ =3D> kvm}/kvm_riscv.h (100%)
>  create mode 100644 target/riscv/kvm/meson.build
>
> diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
> index 99aae8ccbe..c677b5cfbb 100644
> --- a/hw/intc/riscv_aplic.c
> +++ b/hw/intc/riscv_aplic.c
> @@ -32,7 +32,7 @@
>  #include "target/riscv/cpu.h"
>  #include "sysemu/sysemu.h"
>  #include "sysemu/kvm.h"
> -#include "kvm_riscv.h"
> +#include "kvm/kvm_riscv.h"
>  #include "migration/vmstate.h"
>
>  #define APLIC_MAX_IDC                  (1UL << 14)
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 5edc1d98d2..9de578c756 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -35,7 +35,7 @@
>  #include "hw/riscv/virt.h"
>  #include "hw/riscv/boot.h"
>  #include "hw/riscv/numa.h"
> -#include "kvm_riscv.h"
> +#include "kvm/kvm_riscv.h"
>  #include "hw/intc/riscv_aclint.h"
>  #include "hw/intc/riscv_aplic.h"
>  #include "hw/intc/riscv_imsic.h"
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index c8a19be1af..51567c2f12 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -33,7 +33,7 @@
>  #include "fpu/softfloat-helpers.h"
>  #include "sysemu/kvm.h"
>  #include "sysemu/tcg.h"
> -#include "kvm_riscv.h"
> +#include "kvm/kvm_riscv.h"
>  #include "tcg/tcg.h"
>
>  /* RISC-V CPU definitions */
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm/kvm-cpu.c
> similarity index 100%
> rename from target/riscv/kvm.c
> rename to target/riscv/kvm/kvm-cpu.c
> diff --git a/target/riscv/kvm_riscv.h b/target/riscv/kvm/kvm_riscv.h
> similarity index 100%
> rename from target/riscv/kvm_riscv.h
> rename to target/riscv/kvm/kvm_riscv.h
> diff --git a/target/riscv/kvm/meson.build b/target/riscv/kvm/meson.build
> new file mode 100644
> index 0000000000..7e92415091
> --- /dev/null
> +++ b/target/riscv/kvm/meson.build
> @@ -0,0 +1 @@
> +riscv_ss.add(when: 'CONFIG_KVM', if_true: files('kvm-cpu.c'))
> diff --git a/target/riscv/meson.build b/target/riscv/meson.build
> index 3323b78b84..c53962215f 100644
> --- a/target/riscv/meson.build
> +++ b/target/riscv/meson.build
> @@ -24,7 +24,6 @@ riscv_ss.add(files(
>    'zce_helper.c',
>    'vcrypto_helper.c'
>  ))
> -riscv_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'))
>
>  riscv_system_ss =3D ss.source_set()
>  riscv_system_ss.add(files(
> @@ -39,6 +38,7 @@ riscv_system_ss.add(files(
>  ))
>
>  subdir('tcg')
> +subdir('kvm')
>
>  target_arch +=3D {'riscv': riscv_ss}
>  target_softmmu_arch +=3D {'riscv': riscv_system_ss}
> --
> 2.41.0
>
>

