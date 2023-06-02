Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D340FC77B7A
	for <qemu-riscv@archiver.kernel.org>; Fri,  2 Jun 2023 03:27:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q4vRV-0000Zm-HB; Thu, 01 Jun 2023 23:27:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q4vRU-0000Za-TE; Thu, 01 Jun 2023 23:27:08 -0400
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q4vRT-0006nd-BD; Thu, 01 Jun 2023 23:27:08 -0400
Received: by mail-vk1-xa32.google.com with SMTP id
 71dfb90a1353d-45702d3d92cso569759e0c.1; 
 Thu, 01 Jun 2023 20:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685676426; x=1688268426;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vyf31h4qMQ/kRAVd60eucSupJKhCue28412MTcJsuAo=;
 b=YANp9DnSsCtOaJ2WaHsrmr41MgH823BuahW8h9OhysnbYEb/qiUm704DQPDUEJTIp7
 uxVTER0bRRECVh67oW227TDJP/7fbeqff7eDubg3IB+gLH1uJ257Sjh94H/IzmpZpYWN
 j+DGTtlQKwe7XADb+bWbfz9Gst4DlthKWkticZs89Sl1Us29fhJH1WD756qbfML9zZ9A
 pRVIseqy2ViH2+t76BDTACN4l4ZUITw0EyiwZWFCSfMX2Jl0xtRhUgMaVH/7xhVHGjZ6
 aFaWFwoNyLjeqVjzdAqJiW9gTb6Efw+flWhxoe9zPb+jL9nVM0oMVekKiTr2/muLXNja
 52dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685676426; x=1688268426;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vyf31h4qMQ/kRAVd60eucSupJKhCue28412MTcJsuAo=;
 b=U4sB5lYo4Q0i/oWs6SeOskVTi8oo5rx/tzeXp/O4mXTzHGNsIzB6fblFABule1DKkU
 iljF4kyl15rimK8EC4QjnUVSHWM5FRn5+8OuH+QUCY+43LfN6u3lKe43Y4XeDxO6lypb
 kMvpoxmAF8lPX8xn3gZRQK1lTLp/8Y3TcYuQUWa1ZdmEYQmQnN3z8IvIN8vx5+7gsggb
 nTr0CShwlgvGnhvI3M54X57H4lABGJ936Wc3nvU3moY1n+GlF5/j4SwcQb/hB50jWy61
 BfXJawXvnFAJ1lI5QqckUdeVoKkD4ATCYr4vveEl6736U+U1W6XMt1XvkA29IfEwpgaC
 i6EQ==
X-Gm-Message-State: AC+VfDzsb7ZoOK1dBEU9JYX19W6QMZWCbGyyzOtK+iDHUlz3ojFrr0vy
 I9thpU6luhUOlBhYRMoPWS9B9ulXkbjUeha3RWE=
X-Google-Smtp-Source: ACHHUZ4q3eZFoyqjo398fx26vSNuFDolDXthVpKRX2MnE+D86++aIoBHdJ1RnmhaDVdt/9ZjhkE0W9issmOMXR2zsaQ=
X-Received: by 2002:a1f:cb44:0:b0:457:d0f:37bf with SMTP id
 b65-20020a1fcb44000000b004570d0f37bfmr2047412vkg.16.1685676425947; Thu, 01
 Jun 2023 20:27:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230526162308.22892-1-rkanwal@rivosinc.com>
 <20230526162308.22892-5-rkanwal@rivosinc.com>
In-Reply-To: <20230526162308.22892-5-rkanwal@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 2 Jun 2023 13:26:39 +1000
Message-ID: <CAKmqyKNmDqjUfhHuxx5-Y-VotC+-PRo+imYy1FJzVVr7KUPaYw@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] target/riscv: Split interrupt logic from
 riscv_cpu_update_mip.
To: Rajnesh Kanwal <rkanwal@rivosinc.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn, 
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, atishp@rivosinc.com, 
 apatel@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a32;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa32.google.com
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

On Sat, May 27, 2023 at 2:24=E2=80=AFAM Rajnesh Kanwal <rkanwal@rivosinc.co=
m> wrote:
>
> This is to allow virtual interrupts to be inserted into S and VS
> modes. Given virtual interrupts will be maintained in separate
> mvip and hvip CSRs, riscv_cpu_update_mip will no longer be in the
> path and interrupts need to be triggered for these cases from
> rmw_hvip64 and rmw_mvip64 functions.
>
> Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.h        |  1 +
>  target/riscv/cpu_helper.c | 25 ++++++++++++++++++-------
>  2 files changed, 19 insertions(+), 7 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index de7e43126a..de55bfb775 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -562,6 +562,7 @@ void riscv_cpu_swap_hypervisor_regs(CPURISCVState *en=
v);
>  int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t interrupts);
>  uint64_t riscv_cpu_update_mip(CPURISCVState *env, uint64_t mask,
>                                uint64_t value);
> +void riscv_cpu_interrupt(CPURISCVState *env);
>  #define BOOL_TO_MASK(x) (-!!(x)) /* helper for riscv_cpu_update_mip valu=
e */
>  void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(void *),
>                               void *arg);
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index b25ee179e9..c79ec4db76 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -609,11 +609,12 @@ int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint6=
4_t interrupts)
>      }
>  }
>
> -uint64_t riscv_cpu_update_mip(CPURISCVState *env, uint64_t mask,
> -                              uint64_t value)
> +void riscv_cpu_interrupt(CPURISCVState *env)
>  {
> +    uint64_t gein, vsgein =3D 0, vstip =3D 0;
>      CPUState *cs =3D env_cpu(env);
> -    uint64_t gein, vsgein =3D 0, vstip =3D 0, old =3D env->mip;
> +
> +    QEMU_IOTHREAD_LOCK_GUARD();
>
>      if (env->virt_enabled) {
>          gein =3D get_field(env->hstatus, HSTATUS_VGEIN);
> @@ -622,15 +623,25 @@ uint64_t riscv_cpu_update_mip(CPURISCVState *env, u=
int64_t mask,
>
>      vstip =3D env->vstime_irq ? MIP_VSTIP : 0;
>
> -    QEMU_IOTHREAD_LOCK_GUARD();
> -
> -    env->mip =3D (env->mip & ~mask) | (value & mask);
> -
>      if (env->mip | vsgein | vstip) {
>          cpu_interrupt(cs, CPU_INTERRUPT_HARD);
>      } else {
>          cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
>      }
> +}
> +
> +uint64_t riscv_cpu_update_mip(CPURISCVState *env, uint64_t mask, uint64_=
t value)
> +{
> +    uint64_t old =3D env->mip;
> +
> +    /* No need to update mip for VSTIP */
> +    mask =3D ((mask =3D=3D MIP_VSTIP) && env->vstime_irq) ? 0 : mask;
> +
> +    QEMU_IOTHREAD_LOCK_GUARD();
> +
> +    env->mip =3D (env->mip & ~mask) | (value & mask);
> +
> +    riscv_cpu_interrupt(env);
>
>      return old;
>  }
> --
> 2.25.1
>
>

