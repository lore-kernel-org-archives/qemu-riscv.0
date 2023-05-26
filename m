Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7212FC77B7A
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 May 2023 01:23:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q2MAY-00067J-Au; Thu, 25 May 2023 21:23:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q2MAX-000675-EF; Thu, 25 May 2023 21:23:01 -0400
Received: from mail-vk1-xa2a.google.com ([2607:f8b0:4864:20::a2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q2MAS-0004IL-H9; Thu, 25 May 2023 21:23:01 -0400
Received: by mail-vk1-xa2a.google.com with SMTP id
 71dfb90a1353d-456d0287ec1so54517e0c.1; 
 Thu, 25 May 2023 18:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685064175; x=1687656175;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2mK+CmyX61xvkci7jlqyaQDoreTYnraBmuhomb1wB9E=;
 b=EqeAZV17yBNY2rchmLX5B8mJdy9tJLc2w8QQUaBAwydidZoBLZKw/qGJTL+J5+nC+x
 rp1SHFih3+4dxN2M40nHCDKyFyAPMlFIu90YnJt3yBo7sDVc1DTsYDvpsZ2SNtneEp4S
 wJkI2JkdaTPzxjUi/4E5T4fMPhPH+bNPy+CPPtiMNCC3D4OglQxYqWcYSsOyq7KpW/pE
 kTL9JN0n0pTD1UJ054IZwFo+l8YdQ4U6DwfI06C0fI7V8JVaWAOSuQCeYplcZ2LA9ZCx
 PY89P3Qnh85Wp38685y1Pev6D/IsUmNnIxNKk5Xa4dbzXrWqNzmrbmn5j7QHZWuG8riH
 SslQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685064175; x=1687656175;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2mK+CmyX61xvkci7jlqyaQDoreTYnraBmuhomb1wB9E=;
 b=BEdxzHvy9Ra6Cheb0+gsmT0/whNNPi+9ctzdF5I17wgZt34f5jA2XU3EVRMzIFdBp9
 HUJjiVKF8vjH/YuV09xfNSY5S9d46a8JtJUNMbCx6yMnMkpoH/RJ4VVMlbJ8OPsdFXkf
 47nk2VTKNd5ZnDo9uuX/zJGBXlrNJMposCteoukB5H7yHEIZ1lnSQLwZ5kJa7ekVrWAb
 hOcL61wf1F9MzmbsiV+KcFvKkq3N4zc3tsuTE4xXtrvxNmiwjub2O6LcUouuFTlPIXtO
 85styvbJgkcxDyk9WinL5z0ICbggyYDHrPXr5Pd2c8xphPhiMb27DY2fSSg1cR9T/gxQ
 tTeQ==
X-Gm-Message-State: AC+VfDxRqPylCgVzdG8FhJgiNnK6LAPWNGPUfAro5kYDtIWcjEseUaJJ
 +s7ReL9luXjIPSKnF76kTPgJb0opOU4/oAfy4dy4DCa9bIM9aU8H
X-Google-Smtp-Source: ACHHUZ6lrL2uljzC4moXmc28OfXWRCQa/EAVpTpjaFuUbf0cI9v5cjf3XzR/C+iKXlLdpz/zkpGTTvIZtDyqsXMjRlo=
X-Received: by 2002:a1f:dfc5:0:b0:457:28:b2f3 with SMTP id
 w188-20020a1fdfc5000000b004570028b2f3mr68844vkg.2.1685064175015; 
 Thu, 25 May 2023 18:22:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230523093539.203909-1-liweiwei@iscas.ac.cn>
 <20230523093539.203909-4-liweiwei@iscas.ac.cn>
In-Reply-To: <20230523093539.203909-4-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 26 May 2023 11:22:29 +1000
Message-ID: <CAKmqyKNXL8DvHJSuXZZDjCfDpKGVoJ-HisZ4NpwiFNkq2L_eEA@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] target/riscv: Pass RISCVCPUConfig as target_info
 to disassemble_info
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2a;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2a.google.com
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

On Tue, May 23, 2023 at 7:38=E2=80=AFPM Weiwei Li <liweiwei@iscas.ac.cn> wr=
ote:
>
> Pass RISCVCPUConfig as disassemble_info.target_info to support disas
> of conflict instructions related to specific extensions.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  disas/riscv.c      | 10 +++++++---
>  target/riscv/cpu.c |  1 +
>  2 files changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/disas/riscv.c b/disas/riscv.c
> index e61bda5674..729ab684da 100644
> --- a/disas/riscv.c
> +++ b/disas/riscv.c
> @@ -19,7 +19,7 @@
>
>  #include "qemu/osdep.h"
>  #include "disas/dis-asm.h"
> -
> +#include "target/riscv/cpu_cfg.h"
>
>  /* types */
>
> @@ -967,6 +967,7 @@ typedef enum {
>  /* structures */
>
>  typedef struct {
> +    RISCVCPUConfig *cfg;
>      uint64_t  pc;
>      uint64_t  inst;
>      int32_t   imm;
> @@ -4855,11 +4856,13 @@ static void decode_inst_decompress(rv_decode *dec=
, rv_isa isa)
>  /* disassemble instruction */
>
>  static void
> -disasm_inst(char *buf, size_t buflen, rv_isa isa, uint64_t pc, rv_inst i=
nst)
> +disasm_inst(char *buf, size_t buflen, rv_isa isa, uint64_t pc, rv_inst i=
nst,
> +            RISCVCPUConfig *cfg)
>  {
>      rv_decode dec =3D { 0 };
>      dec.pc =3D pc;
>      dec.inst =3D inst;
> +    dec.cfg =3D cfg;
>      decode_inst_opcode(&dec, isa);
>      decode_inst_operands(&dec, isa);
>      decode_inst_decompress(&dec, isa);
> @@ -4914,7 +4917,8 @@ print_insn_riscv(bfd_vma memaddr, struct disassembl=
e_info *info, rv_isa isa)
>          break;
>      }
>
> -    disasm_inst(buf, sizeof(buf), isa, memaddr, inst);
> +    disasm_inst(buf, sizeof(buf), isa, memaddr, inst,
> +                (RISCVCPUConfig *)info->target_info);
>      (*info->fprintf_func)(info->stream, "%s", buf);
>
>      return len;
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index db0875fb43..4fe926cdd1 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -818,6 +818,7 @@ static void riscv_cpu_reset_hold(Object *obj)
>  static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info=
)
>  {
>      RISCVCPU *cpu =3D RISCV_CPU(s);
> +    info->target_info =3D &cpu->cfg;
>
>      switch (riscv_cpu_mxl(&cpu->env)) {
>      case MXL_RV32:
> --
> 2.25.1
>
>

