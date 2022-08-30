Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oSx9u-00079R-Gq
	for mharc-qemu-riscv@gnu.org; Tue, 30 Aug 2022 05:03:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oSx9q-00076W-JC; Tue, 30 Aug 2022 05:03:42 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:41487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oSx9n-0008K4-Fe; Tue, 30 Aug 2022 05:03:41 -0400
Received: by mail-pl1-x635.google.com with SMTP id p18so10476412plr.8;
 Tue, 30 Aug 2022 02:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=8VyaC5Ykgf7c6qkE5KVqxeWRX+OF9MY9k6Sp+6bZDQg=;
 b=naMo53QTmXA/tTgSHF/KPxXsU6uHfWe8kHu4dZg/UhqmSZAXTsLUNBbG9MYL1MJugA
 F/OjUADxAn1cewbot5Gwaz6aNJMPHtRm804tQC1nVtPTyMyzwUocif0kg2Rw+I4p+jyS
 TxNC1l1QCJY5loItclnc3sVgsszlqB+O9u6VsfDzQr4gvdrE3fHJw2YejTjj2p5oumCn
 DbgjUFTnvS+XqihKgDAeFPWOeQ6CspvA/hcDLyAOtT/2q6t1wopHyYdRfJ0oY+8QmZDQ
 OADJBFRxTJoqau89zlQlSDIBoVTup71REAtrRVNLOTpI+ytukkWAmi61Y2e+JrB4v1EG
 9iQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=8VyaC5Ykgf7c6qkE5KVqxeWRX+OF9MY9k6Sp+6bZDQg=;
 b=TvI7lxXIXb65zkGE92qWAdMKtL9e+7HVpdaNL/59ZTtQj6rJJ7MgsAIEf1Kgk4Xowa
 a1Gu8oXEAnSj/OERbm1AOlJdIO/skJq/rE6BS4IwUQdgPNU4ahf1Ctr8uGsT6MW6dVmQ
 BdvOUuApO5LKq7KSfM6qOVFUrgV5EyAdlRpnOzh+IOXN914BaVLY2HwWkRSin5A/LcFG
 4HypHB8MaAPSt+ASSVXXGHiYX673ceFAu7wO4xBIC+XWvx33JfwMBQi6TUTkq/QXypRc
 zdFG+Az4ek9sFbNlqnlGnw+bSSL+2gvm9hxclN1hWmrNopsyyMiPQqs80RzIkJS57tS3
 Cxbw==
X-Gm-Message-State: ACgBeo2WftY2TUAeuhcF41xBg63qIx0Qh4S643SC5FL3pYzgbauWQeGf
 RbkWhZ6KIcAfFzPC54x3LTaAMzXOqzuS2wH+vh0=
X-Google-Smtp-Source: AA6agR636Av6mIryMlcEyk85+Ibz5LSNrelRGgrFxUw4uysE4CyGppJRAvcBP7wJe3Iwp+NQ++DmXofLqT1Z8s1KAuM=
X-Received: by 2002:a17:902:f64f:b0:172:a790:320a with SMTP id
 m15-20020a170902f64f00b00172a790320amr20061327plg.149.1661850217284; Tue, 30
 Aug 2022 02:03:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220824130331.21315-1-zhiwei_liu@linux.alibaba.com>
 <20220824130331.21315-5-zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20220824130331.21315-5-zhiwei_liu@linux.alibaba.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 30 Aug 2022 11:03:10 +0200
Message-ID: <CAKmqyKN7ZWrJW_tJyeqTJxKqSOV=nmXx-hb996EvD_6M5hxhZA@mail.gmail.com>
Subject: Re: [RFC PATCH 4/4] target/riscv: Support Ventana disassemble
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x635.google.com
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
X-List-Received-Date: Tue, 30 Aug 2022 09:03:44 -0000

On Wed, Aug 24, 2022 at 5:37 PM LIU Zhiwei <zhiwei_liu@linux.alibaba.com> wrote:
>
> Pass through the custom information to disassemble by the target_info
> field. In disassemble, select the decode path according to the custom
> extension.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> ---
>  disas/riscv.c         | 56 +++++++++++++++++++++++++++++++++++++++++--
>  target/riscv/cpu.c    | 19 +++++++++++++++
>  target/riscv/custom.h | 25 +++++++++++++++++++
>  3 files changed, 98 insertions(+), 2 deletions(-)
>  create mode 100644 target/riscv/custom.h
>
> diff --git a/disas/riscv.c b/disas/riscv.c
> index aaf85b2aba..590cdba0f6 100644
> --- a/disas/riscv.c
> +++ b/disas/riscv.c
> @@ -19,6 +19,7 @@
>
>  #include "qemu/osdep.h"
>  #include "disas/dis-asm.h"
> +#include "target/riscv/custom.h"
>
>
>  /* types */
> @@ -562,6 +563,11 @@ typedef enum {
>      rv_op_xperm8 = 398,
>  } rv_op;
>
> +typedef enum {
> +    Ventana_op_vt_maskc = 0,
> +    Ventana_op_vt_maskcn = 1,
> +} rv_Ventana_op;

This is unused right?

> +
>  /* structures */
>
>  typedef struct {
> @@ -602,6 +608,7 @@ typedef struct {
>      uint8_t   bs;
>      uint8_t   rnum;
>      const rv_opcode_data *used_opcode_data;
> +    const rv_opcode_data *custom_opcode_data;
>  } rv_decode;
>
>  /* register names */
> @@ -1287,6 +1294,11 @@ const rv_opcode_data opcode_data[] = {
>      { "xperm8", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 }
>  };
>
> +const rv_opcode_data Ventana_opcode_data[] = {
> +    { "vt.maskc", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    { "vt.maskcn", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +};

Could we keep this in a vendor file instead?

> +
>  /* CSR names */
>
>  static const char *csr_name(int csrno)
> @@ -2244,6 +2256,18 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>              case 0: op = rv_op_addd; break;
>              case 1: op = rv_op_slld; break;
>              case 5: op = rv_op_srld; break;
> +            case 6: /* Todo: Move custom decode to sperate decode function */
> +                if (dec->custom_opcode_data == Ventana_opcode_data) {
> +                    op = Ventana_op_vt_maskc;
> +                    dec->used_opcode_data = dec->custom_opcode_data;
> +                }
> +                break;
> +            case 7:
> +                if (dec->custom_opcode_data == Ventana_opcode_data) {
> +                    op = Ventana_op_vt_maskcn;
> +                    dec->used_opcode_data = dec->custom_opcode_data;
> +                }
> +                break;

This seems like it won't scale very well as we add more custom extensions

>              case 8: op = rv_op_muld; break;
>              case 12: op = rv_op_divd; break;
>              case 13: op = rv_op_divud; break;
> @@ -3190,15 +3214,43 @@ static void decode_inst_decompress(rv_decode *dec, rv_isa isa)
>      }
>  }
>
> +static const struct {
> +    enum RISCVCustom ext;
> +    const rv_opcode_data *opcode_data;
> +} custom_opcode_table[] = {
> +    { VENTANA_CUSTOM,   Ventana_opcode_data },
> +};
> +
> +static const rv_opcode_data *
> +get_custom_opcode_data(struct disassemble_info *info)
> +{
> +    for (size_t i = 0; i < ARRAY_SIZE(custom_opcode_table); ++i) {
> +        if (info->target_info & (1ULL << custom_opcode_table[i].ext)) {
> +            return custom_opcode_table[i].opcode_data;
> +        }
> +    }
> +    return NULL;
> +}
> +
>  /* disassemble instruction */
>
>  static void
> -disasm_inst(char *buf, size_t buflen, rv_isa isa, uint64_t pc, rv_inst inst)
> +disasm_inst(char *buf, size_t buflen, rv_isa isa, uint64_t pc, rv_inst inst,
> +            struct disassemble_info *info)
>  {
>      rv_decode dec = { 0 };
>      dec.pc = pc;
>      dec.inst = inst;
> +
> +    /*
> +     * Set default opcode_data.
> +     * Only overide the default opcode_data only when
> +     * 1. There is a custom opcode data.
> +     * 2. The instruction belongs to the custom extension.
> +     */
>      dec.used_opcode_data = opcode_data;
> +    dec.custom_opcode_data = get_custom_opcode_data(info);

What if something has two vendor extensions?

I'm not sure we need this, it might be better to just check if the
extension is enabled and then use that decoder

Alistair

> +
>      decode_inst_opcode(&dec, isa);
>      decode_inst_operands(&dec);
>      decode_inst_decompress(&dec, isa);
> @@ -3253,7 +3305,7 @@ print_insn_riscv(bfd_vma memaddr, struct disassemble_info *info, rv_isa isa)
>          break;
>      }
>
> -    disasm_inst(buf, sizeof(buf), isa, memaddr, inst);
> +    disasm_inst(buf, sizeof(buf), isa, memaddr, inst, info);
>      (*info->fprintf_func)(info->stream, "%s", buf);
>
>      return len;
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index a5f84f211d..cc6ef9303f 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -31,6 +31,7 @@
>  #include "fpu/softfloat-helpers.h"
>  #include "sysemu/kvm.h"
>  #include "kvm_riscv.h"
> +#include "custom.h"
>
>  /* RISC-V CPU definitions */
>
> @@ -504,11 +505,29 @@ static void riscv_cpu_reset(DeviceState *dev)
>  #endif
>  }
>
> +static bool has_Ventana_ext(const RISCVCPUConfig *cfg_ptr)
> +{
> +    return cfg_ptr->ext_XVentanaCondOps;
> +}
> +
>  static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
>  {
>      RISCVCPU *cpu = RISCV_CPU(s);
>      CPURISCVState *env = &cpu->env;
>
> +    static const struct {
> +        bool (*guard_func)(const RISCVCPUConfig *);
> +        enum RISCVCustom ext;
> +    } customs[] = {
> +        { has_Ventana_ext, VENTANA_CUSTOM },
> +    };
> +
> +    for (size_t i = 0; i < ARRAY_SIZE(customs); ++i) {
> +        if (customs[i].guard_func(&(cpu->cfg))) {
> +            info->target_info |= 1ULL << customs[i].ext;
> +        }
> +    }
> +
>      switch (env->xl) {
>      case MXL_RV32:
>          info->print_insn = print_insn_riscv32;
> diff --git a/target/riscv/custom.h b/target/riscv/custom.h
> new file mode 100644
> index 0000000000..1a161984c0
> --- /dev/null
> +++ b/target/riscv/custom.h
> @@ -0,0 +1,25 @@
> +/*
> + * QEMU RISC-V CPU -- custom extensions
> + *
> + * Copyright (c) 2022 T-Head Semiconductor Co., Ltd. All rights reserved.
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +#ifndef RISCV_CPU_CUSTOM_H
> +#define RISCV_CPU_CUSTOM_H
> +
> +enum RISCVCustom {
> +    VENTANA_CUSTOM = 0,
> +};
> +
> +#endif
> --
> 2.25.1
>
>

