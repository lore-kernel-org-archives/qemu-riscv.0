Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78EACCDE008
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 00:56:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wcurg-0007iK-Rc; Thu, 25 Jun 2026 20:56:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wcurd-0007hV-4o
 for qemu-riscv@nongnu.org; Thu, 25 Jun 2026 20:56:14 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wcura-0008Sp-68
 for qemu-riscv@nongnu.org; Thu, 25 Jun 2026 20:56:11 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-68bd9fce347so722618a12.2
 for <qemu-riscv@nongnu.org>; Thu, 25 Jun 2026 17:56:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782435369; cv=none;
 d=google.com; s=arc-20260327;
 b=MM1ioW7UX2QehrKJCoEgba9IAjvbkTExE99AK94eOt5VDF+geIYi0QBMgjAWP8gEuA
 jKDcRHsi386yGCXJe/kzee7OBd54MZpFl8k8IS00xqTRfGQxRgoo0MQmEkdog+Guv0ai
 PZ1Cd1DMU8VhHO7GU725fviNCGeHmz4Eqzz6vkr1ZVMySC8fT/fiRseYUxJNZyACR+77
 p5odVW9QHPjR8G4FJYmz6+ak11gERwi3wjACmyjN85k1vbSNtvEwd5zlSSEf4nFmbsoV
 NDL4kJDFT3+jLDOn1PYLO61WCjVifrM/NmlpSMXywdkQe5fHfTYFfk4fkMan1rXIOopF
 SqDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=MBx1qTn11MgstL675Wxconde9f9FJEhzlv9FGb8dOzY=;
 fh=4FGU2Z6w39rXmdzfteDDgjk6OFdyN8YCAtuSO7Zznes=;
 b=Q27hNdxYBS1UsieNfHBB0kTls3vYCPefAr5GyEP9HlKm1m95jKQGsMj3VLGIdbraIS
 E6/dPpQoVJ7FPWhI3vrEo9+BxSTW2Cb4wLJgTiKwzbcO6V8SQQkz5jiAbjaX/BV0RXDg
 FmeE3Jf3HUHPmaBwbTmDIU9z7c8zYuB1K2mI+XGWAWCaSLj1LKEQGHQyVzou5+U63wno
 doh7dcaZCj4zrzwuLofmnZVTxG5Wis84FdfxpoinESG8geKjkknsMeiNS524IubGOdr+
 62wyh7Dl6NDM6OJAjBMCHOpvrMSIV6Ho+bDPUnr/JuQxeLVhMqoGWy21sXG+H5FkoqfX
 9iNg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782435369; x=1783040169; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MBx1qTn11MgstL675Wxconde9f9FJEhzlv9FGb8dOzY=;
 b=COb+A8AKC1+1WmQzfb0Zh8HqvWXfaiAQZhBo7JBENN/P3zMrEsBBFSsJtqQMdOoTAx
 WOXu4tj5Ewv2ZVp+9ZR6bYsRNCtxxMC9qxRpqNO2czU4i81EISy7hxUx2x9lyKj8+3Wu
 9q4+YKq+s/3Wf4BXlcHKD92D1gtnY0zTyWc8aDLmsR6kabtkO7+kqdrForX0N2zHb8un
 41qjJuvk+CQwWF+7YZjuMs/o2HQda8Nh1Zp9ommtmdfIbIZ7wmyM10ir8z66LTfcnNAX
 I+EJJXZ32W2CVZZR9yuJji8NkvNIAokcACUrIFulhr1PKH4nclRjqHsJw5fNXoOdJzHs
 FRGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782435369; x=1783040169;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MBx1qTn11MgstL675Wxconde9f9FJEhzlv9FGb8dOzY=;
 b=gCELJj669pb9ypF8DHTDQL4R7178FuxCvr4RCAwU6FkvPaKYqhD6ySKatKb4lXMu6U
 +FrHEUG69PctTYPr9dr2Yt+YSTUagdRqyqZkHUDL1Hr5iSCuH9vQMpPiXG19eizg8UQg
 18F7AKpf/6NrDK4kycf/c9E8t2RrrUHmmvYnrJgeGtlRMpMdWYeghT7MpGP8WaXnX9A3
 V25Q8nKl87/ka4p91vSDR1jSiqi2hASqaa8nXs64VCrSjutZ57ZdYpVm2HZHevHZHEAN
 K6uBev3fYvuVGgM4+o7n46zcaV3gxIq4yFO/1/Aijxu5xipy2Jl+V3zzDAZTvyFvnQKE
 TGdw==
X-Forwarded-Encrypted: i=1;
 AHgh+Roj/5TIIUU3BLNb4FcLaFn25nYXQb5MxsD2382VeFK+PQopzFG5eZxDs0DB4+sCtwjs97On+jwkHuqS@nongnu.org
X-Gm-Message-State: AOJu0YyyTAu6IRKCJecMzbnQCwHaCV29zbwp8BQfdGBHitncnylfkfuQ
 izUgg4c9zY/QD3sEDCJoi91n74FLLAgyANUEF8HbNQJt6+/0mP41Qp0LXb810w8pIl2++x+vZO6
 vr6KBE84kqBvjl4IpngP5CIQmUnBXzAc=
X-Gm-Gg: AfdE7cmN6uKBGH2PHBVQ556JmERyXRV40KApJvm1gEulZKGNvQlP/pypT0NktByIywj
 A/iZ1Wn2sJXCZo/+AnhCb/4XZxljPM9GpVhNNF7B1xxnEe1QqvMh+V5dsxsp0myu42Y9zkyroD7
 ZcPlVMbnYZJxvwz1CVpVYlHLvZelBFJnrLNl02ebmTwCxy6AJJrwn5QI/tXU+hsQvW5WISkeJE4
 VBI7FbZE9xXS6vhOoTNX2LVH9NX9gRi9bBD/LzpqfxjwAmpQZC3378uoqFuGqxAYvPg3YWFI5Ap
 5obQ8ek+zwI+dTWqeT8J2T2q8C9lERRMQVFFug==
X-Received: by 2002:a05:6402:210b:b0:697:7fe4:c3db with SMTP id
 4fb4d7f45d1cf-69810a3ad96mr802967a12.3.1782435368703; Thu, 25 Jun 2026
 17:56:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260624000632.2149359-1-daniel.barboza@oss.qualcomm.com>
 <20260624000632.2149359-8-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260624000632.2149359-8-daniel.barboza@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 26 Jun 2026 10:55:42 +1000
X-Gm-Features: AVVi8Cex2vGfmlVj1-Z-JPyMvLY_ntmU2g7NprIT9S63QwdjkLhQ6Pf8yWhGuys
Message-ID: <CAKmqyKN1TEQze8KLG2t=oJTv=pNOezDST+EsuoU9HVvKWa9W6Q@mail.gmail.com>
Subject: Re: [PATCH v2 07/24] target/riscv: move debug.h to tcg subdir
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com, 
 pierrick.bouvier@oss.qualcomm.com, philmd@oss.qualcomm.com, 
 fritchleybohrer@gmail.com, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x529.google.com
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

On Wed, Jun 24, 2026 at 10:09=E2=80=AFAM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> riscv_trigger_* APIs are TCG only.  Wrap the usages we have of them
> in cpu.c with CONFIG_TCG.
>
> After that we can move the header to the tcg subdir.  This will be
> enough to get this out of the way for the --disable-tcg build.
>
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c             | 8 +++++---
>  target/riscv/machine.c         | 2 +-
>  target/riscv/tcg/cpu_helper.c  | 2 +-
>  target/riscv/tcg/csr.c         | 2 +-
>  target/riscv/tcg/debug.c       | 2 +-
>  target/riscv/{ =3D> tcg}/debug.h | 0
>  target/riscv/tcg/tcg-cpu.c     | 2 +-
>  7 files changed, 10 insertions(+), 8 deletions(-)
>  rename target/riscv/{ =3D> tcg}/debug.h (100%)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 319825882a..fe47ae64c9 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -39,7 +39,7 @@
>  #include "kvm/kvm_riscv.h"
>  #include "tcg/tcg-cpu.h"
>  #if !defined(CONFIG_USER_ONLY)
> -#include "target/riscv/debug.h"
> +#include "target/riscv/tcg/debug.h"
>  #endif
>
>  /* RISC-V CPU definitions */
> @@ -836,9 +836,11 @@ static void riscv_cpu_reset_hold(Object *obj, ResetT=
ype type)
>      env->vill =3D true;
>
>  #ifndef CONFIG_USER_ONLY
> +#ifdef CONFIG_TCG
>      if (cpu->cfg.debug) {
>          riscv_trigger_reset_hold(env);
>      }
> +#endif
>
>      if (cpu->cfg.ext_smrnmi) {
>          env->rnmip =3D 0;
> @@ -996,7 +998,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error=
 **errp)
>
>      riscv_cpu_register_gdb_regs_for_features(cs);
>
> -#ifndef CONFIG_USER_ONLY
> +#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
>      if (cpu->cfg.debug) {
>          riscv_trigger_realize(&cpu->env);
>      }
> @@ -1011,7 +1013,7 @@ static void riscv_cpu_realize(DeviceState *dev, Err=
or **errp)
>  static void riscv_cpu_unrealize(DeviceState *dev)
>  {
>      RISCVCPUClass *mcc =3D RISCV_CPU_GET_CLASS(dev);
> -#ifndef CONFIG_USER_ONLY
> +#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
>      RISCVCPU *cpu =3D RISCV_CPU(dev);
>
>      if (cpu->cfg.debug) {
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index e1cbcaa349..11e869a9c1 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -23,7 +23,7 @@
>  #include "system/tcg.h"
>  #include "migration/cpu.h"
>  #include "exec/icount.h"
> -#include "target/riscv/debug.h"
> +#include "target/riscv/tcg/debug.h"
>  #include "hw/riscv/machines-qom.h"
>
>  static bool pmp_needed(void *opaque)
> diff --git a/target/riscv/tcg/cpu_helper.c b/target/riscv/tcg/cpu_helper.=
c
> index a893472c4e..8c347aa1c0 100644
> --- a/target/riscv/tcg/cpu_helper.c
> +++ b/target/riscv/tcg/cpu_helper.c
> @@ -35,7 +35,7 @@
>  #include "semihosting/common-semi.h"
>  #include "exec/icount.h"
>  #include "cpu_bits.h"
> -#include "target/riscv/debug.h"
> +#include "target/riscv/tcg/debug.h"
>  #include "pmp.h"
>  #include "qemu/plugin.h"
>
> diff --git a/target/riscv/tcg/csr.c b/target/riscv/tcg/csr.c
> index 7fb0ad5bc1..b460860409 100644
> --- a/target/riscv/tcg/csr.c
> +++ b/target/riscv/tcg/csr.c
> @@ -34,7 +34,7 @@
>  #include "tcg/insn-start-words.h"
>  #include "internals.h"
>  #if !defined(CONFIG_USER_ONLY)
> -#include "target/riscv/debug.h"
> +#include "target/riscv/tcg/debug.h"
>  #endif
>
>  /* CSR function table public API */
> diff --git a/target/riscv/tcg/debug.c b/target/riscv/tcg/debug.c
> index ba5bc6ae13..3c0fe70101 100644
> --- a/target/riscv/tcg/debug.c
> +++ b/target/riscv/tcg/debug.c
> @@ -28,7 +28,7 @@
>  #include "qapi/error.h"
>  #include "qemu/error-report.h"
>  #include "cpu.h"
> -#include "target/riscv/debug.h"
> +#include "target/riscv/tcg/debug.h"
>  #include "trace.h"
>  #include "exec/helper-proto.h"
>  #include "exec/watchpoint.h"
> diff --git a/target/riscv/debug.h b/target/riscv/tcg/debug.h
> similarity index 100%
> rename from target/riscv/debug.h
> rename to target/riscv/tcg/debug.h
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index b73e3e9dd4..fe6350f497 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -37,7 +37,7 @@
>  #include "hw/core/boards.h"
>  #include "system/tcg.h"
>  #include "exec/icount.h"
> -#include "target/riscv/debug.h"
> +#include "target/riscv/tcg/debug.h"
>  #endif
>
>  /* Hash that stores user set extensions */
> --
> 2.43.0
>
>

