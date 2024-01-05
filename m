Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88296C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 03:52:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLbG0-0005F0-4B; Thu, 04 Jan 2024 22:52:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLbFy-0005EU-Jl; Thu, 04 Jan 2024 22:52:26 -0500
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLbFx-0005mf-2b; Thu, 04 Jan 2024 22:52:26 -0500
Received: by mail-ua1-x92f.google.com with SMTP id
 a1e0cc1a2514c-7cd5ab5d5bbso357897241.3; 
 Thu, 04 Jan 2024 19:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704426744; x=1705031544; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FbsUhug9aRcFiZGsW2WkGhpv6LeKKlWTh3fGKjuwWEU=;
 b=L7Sf6BBMism3RNAk60HH1ABGLZWjuxn5/vERg3UcqFmdmXcy9BUaSPnDsqWlUWdtoR
 JR+xx7rXebgYupxR1VNX7xaAnlwPb6xVYvKvBssZaiLzzHO4o1Y+41yr7bwPUQiFBBSa
 i8fZEEjfuVF+Fsdp6Ga97mlth6bY5vXD8U+J4u2pXYtnCPzsGi/7+s+mNwv2CQfaJFb2
 r3oSv2/gfHYO8rbRdvccvxpbxSjG01j1YIyAJULYkseSL0CkgCbkypy1NeFZ4mMlqBM0
 4Ei6AmwWW8lGZkvFDLHDs72IMdnHsPsnqz/3ZkOa2Bt47INqyyi+o98L0HAsZp6D452Q
 e/AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704426744; x=1705031544;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FbsUhug9aRcFiZGsW2WkGhpv6LeKKlWTh3fGKjuwWEU=;
 b=Y1Nlw+px5JyTZ7OHyfGa1gCfNSDSeD0JNEw/PPQxjSzhj4TfLhzJo99v+P0JGFZgY3
 PG6UTnyF6P9xnq/aC62hEaD7VPS4nw5EnvcuMvDfAXK7nm/yFqTxpO6c8WBUgSdW9xGu
 GXyq3paJ2W0xd2CWYcqLvSigl3mQ4wBQzE8U40JyOZz1E+/zH2sVgMq9nsMu20WFrBA6
 FgmK7oFnVSiATXDyziTg78DjEeFbzswlEgodaASMTSlUExDVRLclDVVDibQCvX9gDaV9
 nEu37tMyhJPGle7y4EPy57sM5UoBv/ME85k8kPjNlFfI7KMGNmaYVb1H23ddCWyjuaLA
 Heog==
X-Gm-Message-State: AOJu0YyOeXWm7GAP2MZntSJbnGHAu78J6EPBhG41OPTDdAkN2gWWcJCN
 U8QuxBfImw2rIsDGPQsobKPVg/YaIXKLtq4kUV8=
X-Google-Smtp-Source: AGHT+IHYUOkxfjRXbpzDuVue8HiQAWTRUnzJG1lJDuZkwxezkbDU8slEXlN5ZdoMFHSasO0eYKFZ+JMHP7z1eIdZlA0=
X-Received: by 2002:ac5:ccd3:0:b0:4b7:197b:318a with SMTP id
 j19-20020ac5ccd3000000b004b7197b318amr1179413vkn.23.1704426743734; Thu, 04
 Jan 2024 19:52:23 -0800 (PST)
MIME-Version: 1.0
References: <20240103174013.147279-1-dbarboza@ventanamicro.com>
 <20240103174013.147279-3-dbarboza@ventanamicro.com>
In-Reply-To: <20240103174013.147279-3-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 5 Jan 2024 13:51:57 +1000
Message-ID: <CAKmqyKPpXWb60Jh4HtBdCbgapmcxiD4C2Ty_s192Fy0D0COsXA@mail.gmail.com>
Subject: Re: [PATCH v3 02/16] target/riscv: make riscv_cpu_is_generic() public
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com, vladimir.isaev@syntacore.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92f;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92f.google.com
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

On Thu, Jan 4, 2024 at 3:42=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> We'll use this function in target/riscv/cpu.c to implement setters that
> won't allow vendor CPU options to be changed.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c         | 5 +++++
>  target/riscv/cpu.h         | 1 +
>  target/riscv/tcg/tcg-cpu.c | 5 -----
>  3 files changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 70bf10aa7c..65cfa6c740 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -183,6 +183,11 @@ void isa_ext_update_enabled(RISCVCPU *cpu, uint32_t =
ext_offset, bool en)
>      *ext_enabled =3D en;
>  }
>
> +bool riscv_cpu_is_generic(Object *cpu_obj)
> +{
> +    return object_dynamic_cast(cpu_obj, TYPE_RISCV_DYNAMIC_CPU) !=3D NUL=
L;
> +}
> +
>  const char * const riscv_int_regnames[] =3D {
>      "x0/zero", "x1/ra",  "x2/sp",  "x3/gp",  "x4/tp",  "x5/t0",   "x6/t1=
",
>      "x7/t2",   "x8/s0",  "x9/s1",  "x10/a0", "x11/a1", "x12/a2",  "x13/a=
3",
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 40c96a32cc..bf69cb9a27 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -756,6 +756,7 @@ enum riscv_pmu_event_idx {
>  void isa_ext_update_enabled(RISCVCPU *cpu, uint32_t ext_offset, bool en)=
;
>  bool isa_ext_is_enabled(RISCVCPU *cpu, uint32_t ext_offset);
>  void riscv_cpu_set_misa(CPURISCVState *env, RISCVMXL mxl, uint32_t ext);
> +bool riscv_cpu_is_generic(Object *cpu_obj);
>
>  typedef struct RISCVCPUMultiExtConfig {
>      const char *name;
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 8a35683a34..a09300e908 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -658,11 +658,6 @@ bool riscv_cpu_tcg_compatible(RISCVCPU *cpu)
>      return object_dynamic_cast(OBJECT(cpu), TYPE_RISCV_CPU_HOST) =3D=3D =
NULL;
>  }
>
> -static bool riscv_cpu_is_generic(Object *cpu_obj)
> -{
> -    return object_dynamic_cast(cpu_obj, TYPE_RISCV_DYNAMIC_CPU) !=3D NUL=
L;
> -}
> -
>  /*
>   * We'll get here via the following path:
>   *
> --
> 2.43.0
>
>

