Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 171A8C7EE23
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 03:37:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q8YN4-0001Dm-0F; Sun, 11 Jun 2023 23:37:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q8YN1-0001DS-NJ; Sun, 11 Jun 2023 23:37:31 -0400
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q8YN0-0000P2-3w; Sun, 11 Jun 2023 23:37:31 -0400
Received: by mail-vk1-xa2e.google.com with SMTP id
 71dfb90a1353d-46514fec772so1168109e0c.0; 
 Sun, 11 Jun 2023 20:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686541049; x=1689133049;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H+7Gc2CTTwxFT0n7MPOpXZZE4MX3a0JKdeN7p8V0E1I=;
 b=DpBKU9TvFPkfIhF/qC/LTnPqxBUCsT//Ccizg0j8P6N6f7+Z94XRjh3LpigZx8zOQh
 FX+U85PS14LzgJ2CvWgaBg5LNzc6k9MwK8TIOuv4jgHvp4hDrgg+LNF4Rjb/i0qZibJE
 j+PGAXYN8PUSIocPjWriLHlUW1Rl9IHB6IrESLra+GWJL2kR5hHVzG5LzACnFptVo46F
 zEgDB3Uus0jq7ydsxy/SaPnoTGupbMzInLcYVv4ALRo2MfmwAhyP/ehGGjpCIoQmZW6P
 azvz5YmABjz6/dthzv5JaSs/3a7itj1mChWy5SffnF6iuEzkD+6VK3kPxLG38iQFAiCh
 2bwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686541049; x=1689133049;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H+7Gc2CTTwxFT0n7MPOpXZZE4MX3a0JKdeN7p8V0E1I=;
 b=LdQKmZRibL4imccj7R4VlytPWFstO3ZKGPjX5czVCkXTWwLJ4nZGVYOUha9tSJzsrW
 yFqgN2qujKtpE//N2o3DFIdHFr8CFRL8eqziWR68jdy0MyuTv/FkS8a9Rq3Bze1NygMf
 QBlkbWmo+Bh0CT/CXPDafWYJCyrEVtlXANYz97umCtsYDgGsVyENSw+x2Z8eKFL07vvW
 NOIu+9BKV3EvqQTkAP1a7U0syH/x2VXVvbMub2UwdtMBCm1/JspQpGk6inPDn9SQ9fPJ
 YH30mnMjNpPwl+5TuuE9g3iPcCDSBhULzPwrzIlPUhU66901sN98b2MZXxquymdppzui
 qwaQ==
X-Gm-Message-State: AC+VfDypUzsi091AwRYLAyAgIRovvQ0euZJ1u82YZTRiZbRZmCDuL7lv
 3CAhrt9DEtqZinpJcG0IY86LiTbwCwUELCH4BEA=
X-Google-Smtp-Source: ACHHUZ5SfZExOxmquETsLUDXBC14sEnxrUg7QhCAF543vW4aj9S7NVos4PfrabDCnqv3rsHOrIhDXvfM18eKTZzgt3M=
X-Received: by 2002:a1f:3d84:0:b0:457:2d6a:7b4d with SMTP id
 k126-20020a1f3d84000000b004572d6a7b4dmr3551936vka.10.1686541048774; Sun, 11
 Jun 2023 20:37:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230530131843.1186637-1-christoph.muellner@vrull.eu>
 <20230530131843.1186637-8-christoph.muellner@vrull.eu>
In-Reply-To: <20230530131843.1186637-8-christoph.muellner@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 12 Jun 2023 13:37:02 +1000
Message-ID: <CAKmqyKPYa5D5g4dRpuLGCdM9vZQCaPzNGoaEQSQvq_+E5mnPOw@mail.gmail.com>
Subject: Re: [PATCH 7/9] disas/riscv: Provide infrastructure for vendor
 extensions
To: Christoph Muellner <christoph.muellner@vrull.eu>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2e;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2e.google.com
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

On Tue, May 30, 2023 at 11:21=E2=80=AFPM Christoph Muellner
<christoph.muellner@vrull.eu> wrote:
>
> From: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
>
> A previous patch provides a pointer to the RISCVCPUConfig data.
> Let's use this to add the necessary code for vendor extensions.
> This patch does not change the current behaviour, but clearly
> defines how vendor extension support can be added to the disassembler.
>
> Signed-off-by: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  disas/riscv.c | 34 ++++++++++++++++++++++++++++++----
>  1 file changed, 30 insertions(+), 4 deletions(-)
>
> diff --git a/disas/riscv.c b/disas/riscv.c
> index 086edee6a2..db98e3ea6a 100644
> --- a/disas/riscv.c
> +++ b/disas/riscv.c
> @@ -20,6 +20,7 @@
>  #include "qemu/osdep.h"
>  #include "disas/dis-asm.h"
>  #include "disas/riscv.h"
> +#include "target/riscv/cpu-config.h"
>
>  typedef enum {
>      /* 0 is reserved for rv_op_illegal. */
> @@ -4599,13 +4600,38 @@ static void decode_inst_decompress(rv_decode *dec=
, rv_isa isa)
>  /* disassemble instruction */
>
>  static void
> -disasm_inst(char *buf, size_t buflen, rv_isa isa, uint64_t pc, rv_inst i=
nst)
> +disasm_inst(char *buf, size_t buflen, rv_isa isa, uint64_t pc, rv_inst i=
nst,
> +            struct disassemble_info *info)
>  {
> +    RISCVCPUConfig *cfg =3D info->private_data;
>      rv_decode dec =3D { 0 };
>      dec.pc =3D pc;
>      dec.inst =3D inst;
> -    dec.opcode_data =3D rvi_opcode_data;
> -    decode_inst_opcode(&dec, isa);
> +
> +    static const struct {
> +        bool (*guard_func)(const RISCVCPUConfig *);
> +        const rv_opcode_data *opcode_data;
> +        void (*decode_func)(rv_decode *, rv_isa);
> +    } decoders[] =3D {
> +        { always_true_p, rvi_opcode_data, decode_inst_opcode },
> +    };
> +
> +    for (size_t i =3D 0; i < ARRAY_SIZE(decoders); i++) {
> +        bool (*guard_func)(const RISCVCPUConfig *) =3D decoders[i].guard=
_func;
> +        const rv_opcode_data *opcode_data =3D decoders[i].opcode_data;
> +        void (*decode_func)(rv_decode *, rv_isa) =3D decoders[i].decode_=
func;
> +
> +        if (guard_func(cfg)) {
> +            dec.opcode_data =3D opcode_data;
> +            decode_func(&dec, isa);
> +            if (dec.op !=3D rv_op_illegal)
> +                break;
> +        }
> +    }
> +
> +    if (dec.op =3D=3D rv_op_illegal)
> +        dec.opcode_data =3D rvi_opcode_data;
> +
>      decode_inst_operands(&dec, isa);
>      decode_inst_decompress(&dec, isa);
>      decode_inst_lift_pseudo(&dec);
> @@ -4659,7 +4685,7 @@ print_insn_riscv(bfd_vma memaddr, struct disassembl=
e_info *info, rv_isa isa)
>          break;
>      }
>
> -    disasm_inst(buf, sizeof(buf), isa, memaddr, inst);
> +    disasm_inst(buf, sizeof(buf), isa, memaddr, inst, info);
>      (*info->fprintf_func)(info->stream, "%s", buf);
>
>      return len;
> --
> 2.40.1
>
>

