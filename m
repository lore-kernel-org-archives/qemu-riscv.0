Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 628DDC7EE2D
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 May 2023 13:12:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q15KQ-0006XP-Au; Mon, 22 May 2023 09:11:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q15K9-0005kp-TJ
 for qemu-riscv@nongnu.org; Mon, 22 May 2023 09:11:42 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q15K7-0007bB-8m
 for qemu-riscv@nongnu.org; Mon, 22 May 2023 09:11:41 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-6af6de9fb74so1173448a34.2
 for <qemu-riscv@nongnu.org>; Mon, 22 May 2023 06:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1684761098; x=1687353098;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OyKhb6ub+3IlJYJIiDqKguC9wdaMqo3Bw4cyTI1yO+Y=;
 b=UKc06YbUXzdw69n4HhqqaA/MzyKMCVjpCbFTpgxJ6O7iyqHkh40DDkJWYs/EDNkP45
 bdQPxWBSY/6/SgGQzyPbInndVH2pO5isHnVE2hsQWhu6MtUpMI1/e3rSqWTVhkScCMwF
 KsKLVapR8vhC69CgmyK8k80BFDWSaoDSDt3x3eqrk8VV6IejIgZ23bZYJE6zt8qXpEdW
 b5kJEcKBs4jlTHbfooXfwbuWZbOel8s3gVtP6Stdd2+En+L0XjpF4JNstyVKorYybI/q
 Yggi8NB7Ef8uVdzWTgV7WCN30ixSKUKfRXGDOKJEaFmy4O0cJcIXAbEBM7kLyF2hD4Rf
 XLdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684761098; x=1687353098;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OyKhb6ub+3IlJYJIiDqKguC9wdaMqo3Bw4cyTI1yO+Y=;
 b=EWK240+0RE4TRciTKxz5jZOrymXzadPfDw9XpN+eXOfg0RGPbb63sHy+DGeThDjR2S
 YqoPjV1jxtkdRq1J7d+EcjjTy2nMy684VPzkK52F003TGKYAb4Fr/Ei0m24QWDrN21yu
 UrIOdoTpTYhBEJtxv/mA04m8QQQh6Ou3DcIlz1TZqmDceLY4/RpCYxUDW6Bi/X3iYh/o
 iEqWR7xvTSa/n9+OC8AMDHYiGyLn10QFQKyNqU/fi6ijjte831J+2hORJegnZ3PF813Y
 Q99yzzPWQ7Rgf3FeTU91BeYSf0Hz7kPIuUQ3LRwjTi3fyE3M4NKi8IOuMMkOaDR0eLpz
 /Rtg==
X-Gm-Message-State: AC+VfDyt1W9pXGS9HyqYVgVhrEXDz87WdmxaP9MVDehJoqlLqhJTg8k7
 9qQhKmp6xIdtPvdV+M2tSS9uhQ==
X-Google-Smtp-Source: ACHHUZ7o0cpAsWcjDA1tMf8drQbUN3XELGpFDG3qvBnaCqYTs/1lUgAWKqph3e/PjSRHC/CluCXW4Q==
X-Received: by 2002:a9d:5a07:0:b0:6ab:ce:6eac with SMTP id
 v7-20020a9d5a07000000b006ab00ce6eacmr5252609oth.20.1684761097958; 
 Mon, 22 May 2023 06:11:37 -0700 (PDT)
Received: from [192.168.68.107] ([179.111.98.125])
 by smtp.gmail.com with ESMTPSA id
 a5-20020a056830100500b006af7d71c9f4sm958973otp.71.2023.05.22.06.11.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 May 2023 06:11:37 -0700 (PDT)
Message-ID: <26d6d754-0d80-e192-98a4-eb4f6f65e3cd@ventanamicro.com>
Date: Mon, 22 May 2023 10:11:31 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 6/7] disas/riscv.c: Fix lines with over 80 characters
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230519021926.15362-1-liweiwei@iscas.ac.cn>
 <20230519021926.15362-7-liweiwei@iscas.ac.cn>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230519021926.15362-7-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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



On 5/18/23 23:19, Weiwei Li wrote:
> Fix lines with over 80 characters.
> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   disas/riscv.c | 201 +++++++++++++++++++++++++++++++++++---------------
>   1 file changed, 140 insertions(+), 61 deletions(-)
> 
> diff --git a/disas/riscv.c b/disas/riscv.c
> index fcea5d7beb..ee50a4ab0c 100644
> --- a/disas/riscv.c
> +++ b/disas/riscv.c
> @@ -1108,8 +1108,10 @@ static const char rv_vreg_name_sym[32][4] = {
>   /* pseudo-instruction constraints */
>   
>   static const rvc_constraint rvcc_jal[] = { rvc_rd_eq_ra, rvc_end };
> -static const rvc_constraint rvcc_jalr[] = { rvc_rd_eq_ra, rvc_imm_eq_zero, rvc_end };
> -static const rvc_constraint rvcc_nop[] = { rvc_rd_eq_x0, rvc_rs1_eq_x0, rvc_imm_eq_zero, rvc_end };
> +static const rvc_constraint rvcc_jalr[] = { rvc_rd_eq_ra, rvc_imm_eq_zero,
> +                                            rvc_end };
> +static const rvc_constraint rvcc_nop[] = { rvc_rd_eq_x0, rvc_rs1_eq_x0,
> +                                           rvc_imm_eq_zero, rvc_end };
>   static const rvc_constraint rvcc_mv[] = { rvc_imm_eq_zero, rvc_end };
>   static const rvc_constraint rvcc_not[] = { rvc_imm_eq_n1, rvc_end };
>   static const rvc_constraint rvcc_neg[] = { rvc_rs1_eq_x0, rvc_end };
> @@ -1139,18 +1141,28 @@ static const rvc_constraint rvcc_bleu[] = { rvc_end };
>   static const rvc_constraint rvcc_bgt[] = { rvc_end };
>   static const rvc_constraint rvcc_bgtu[] = { rvc_end };
>   static const rvc_constraint rvcc_j[] = { rvc_rd_eq_x0, rvc_end };
> -static const rvc_constraint rvcc_ret[] = { rvc_rd_eq_x0, rvc_rs1_eq_ra, rvc_end };
> -static const rvc_constraint rvcc_jr[] = { rvc_rd_eq_x0, rvc_imm_eq_zero, rvc_end };
> -static const rvc_constraint rvcc_rdcycle[] = { rvc_rs1_eq_x0, rvc_csr_eq_0xc00, rvc_end };
> -static const rvc_constraint rvcc_rdtime[] = { rvc_rs1_eq_x0, rvc_csr_eq_0xc01, rvc_end };
> -static const rvc_constraint rvcc_rdinstret[] = { rvc_rs1_eq_x0, rvc_csr_eq_0xc02, rvc_end };
> -static const rvc_constraint rvcc_rdcycleh[] = { rvc_rs1_eq_x0, rvc_csr_eq_0xc80, rvc_end };
> -static const rvc_constraint rvcc_rdtimeh[] = { rvc_rs1_eq_x0, rvc_csr_eq_0xc81, rvc_end };
> +static const rvc_constraint rvcc_ret[] = { rvc_rd_eq_x0, rvc_rs1_eq_ra,
> +                                           rvc_end };
> +static const rvc_constraint rvcc_jr[] = { rvc_rd_eq_x0, rvc_imm_eq_zero,
> +                                          rvc_end };
> +static const rvc_constraint rvcc_rdcycle[] = { rvc_rs1_eq_x0, rvc_csr_eq_0xc00,
> +                                               rvc_end };
> +static const rvc_constraint rvcc_rdtime[] = { rvc_rs1_eq_x0, rvc_csr_eq_0xc01,
> +                                              rvc_end };
> +static const rvc_constraint rvcc_rdinstret[] = { rvc_rs1_eq_x0,
> +                                                 rvc_csr_eq_0xc02, rvc_end };
> +static const rvc_constraint rvcc_rdcycleh[] = { rvc_rs1_eq_x0,
> +                                                rvc_csr_eq_0xc80, rvc_end };
> +static const rvc_constraint rvcc_rdtimeh[] = { rvc_rs1_eq_x0, rvc_csr_eq_0xc81,
> +                                               rvc_end };
>   static const rvc_constraint rvcc_rdinstreth[] = { rvc_rs1_eq_x0,
>                                                     rvc_csr_eq_0xc82, rvc_end };
> -static const rvc_constraint rvcc_frcsr[] = { rvc_rs1_eq_x0, rvc_csr_eq_0x003, rvc_end };
> -static const rvc_constraint rvcc_frrm[] = { rvc_rs1_eq_x0, rvc_csr_eq_0x002, rvc_end };
> -static const rvc_constraint rvcc_frflags[] = { rvc_rs1_eq_x0, rvc_csr_eq_0x001, rvc_end };
> +static const rvc_constraint rvcc_frcsr[] = { rvc_rs1_eq_x0, rvc_csr_eq_0x003,
> +                                             rvc_end };
> +static const rvc_constraint rvcc_frrm[] = { rvc_rs1_eq_x0, rvc_csr_eq_0x002,
> +                                            rvc_end };
> +static const rvc_constraint rvcc_frflags[] = { rvc_rs1_eq_x0, rvc_csr_eq_0x001,
> +                                               rvc_end };
>   static const rvc_constraint rvcc_fscsr[] = { rvc_csr_eq_0x003, rvc_end };
>   static const rvc_constraint rvcc_fsrm[] = { rvc_csr_eq_0x002, rvc_end };
>   static const rvc_constraint rvcc_fsflags[] = { rvc_csr_eq_0x001, rvc_end };
> @@ -1552,17 +1564,23 @@ const rv_opcode_data opcode_data[] = {
>       { "fmv.q.x", rv_codec_r, rv_fmt_frd_rs1, NULL, 0, 0, 0 },
>       { "c.addi4spn", rv_codec_ciw_4spn, rv_fmt_rd_rs1_imm, NULL, rv_op_addi,
>         rv_op_addi, rv_op_addi, rvcd_imm_nz },
> -    { "c.fld", rv_codec_cl_ld, rv_fmt_frd_offset_rs1, NULL, rv_op_fld, rv_op_fld, 0 },
> -    { "c.lw", rv_codec_cl_lw, rv_fmt_rd_offset_rs1, NULL, rv_op_lw, rv_op_lw, rv_op_lw },
> +    { "c.fld", rv_codec_cl_ld, rv_fmt_frd_offset_rs1, NULL, rv_op_fld,
> +      rv_op_fld, 0 },
> +    { "c.lw", rv_codec_cl_lw, rv_fmt_rd_offset_rs1, NULL, rv_op_lw, rv_op_lw,
> +      rv_op_lw },
>       { "c.flw", rv_codec_cl_lw, rv_fmt_frd_offset_rs1, NULL, rv_op_flw, 0, 0 },
> -    { "c.fsd", rv_codec_cs_sd, rv_fmt_frs2_offset_rs1, NULL, rv_op_fsd, rv_op_fsd, 0 },
> -    { "c.sw", rv_codec_cs_sw, rv_fmt_rs2_offset_rs1, NULL, rv_op_sw, rv_op_sw, rv_op_sw },
> +    { "c.fsd", rv_codec_cs_sd, rv_fmt_frs2_offset_rs1, NULL, rv_op_fsd,
> +      rv_op_fsd, 0 },
> +    { "c.sw", rv_codec_cs_sw, rv_fmt_rs2_offset_rs1, NULL, rv_op_sw, rv_op_sw,
> +      rv_op_sw },
>       { "c.fsw", rv_codec_cs_sw, rv_fmt_frs2_offset_rs1, NULL, rv_op_fsw, 0, 0 },
> -    { "c.nop", rv_codec_ci_none, rv_fmt_none, NULL, rv_op_addi, rv_op_addi, rv_op_addi },
> +    { "c.nop", rv_codec_ci_none, rv_fmt_none, NULL, rv_op_addi, rv_op_addi,
> +      rv_op_addi },
>       { "c.addi", rv_codec_ci, rv_fmt_rd_rs1_imm, NULL, rv_op_addi, rv_op_addi,
>         rv_op_addi, rvcd_imm_nz },
>       { "c.jal", rv_codec_cj_jal, rv_fmt_rd_offset, NULL, rv_op_jal, 0, 0 },
> -    { "c.li", rv_codec_ci_li, rv_fmt_rd_rs1_imm, NULL, rv_op_addi, rv_op_addi, rv_op_addi },
> +    { "c.li", rv_codec_ci_li, rv_fmt_rd_rs1_imm, NULL, rv_op_addi, rv_op_addi,
> +      rv_op_addi },
>       { "c.addi16sp", rv_codec_ci_16sp, rv_fmt_rd_rs1_imm, NULL, rv_op_addi,
>         rv_op_addi, rv_op_addi, rvcd_imm_nz },
>       { "c.lui", rv_codec_ci_lui, rv_fmt_rd_imm, NULL, rv_op_lui, rv_op_lui,
> @@ -1573,37 +1591,63 @@ const rv_opcode_data opcode_data[] = {
>         rv_op_srai, rv_op_srai, rvcd_imm_nz },
>       { "c.andi", rv_codec_cb_imm, rv_fmt_rd_rs1_imm, NULL, rv_op_andi,
>         rv_op_andi, rv_op_andi },
> -    { "c.sub", rv_codec_cs, rv_fmt_rd_rs1_rs2, NULL, rv_op_sub, rv_op_sub, rv_op_sub },
> -    { "c.xor", rv_codec_cs, rv_fmt_rd_rs1_rs2, NULL, rv_op_xor, rv_op_xor, rv_op_xor },
> -    { "c.or", rv_codec_cs, rv_fmt_rd_rs1_rs2, NULL, rv_op_or, rv_op_or, rv_op_or },
> -    { "c.and", rv_codec_cs, rv_fmt_rd_rs1_rs2, NULL, rv_op_and, rv_op_and, rv_op_and },
> -    { "c.subw", rv_codec_cs, rv_fmt_rd_rs1_rs2, NULL, rv_op_subw, rv_op_subw, rv_op_subw },
> -    { "c.addw", rv_codec_cs, rv_fmt_rd_rs1_rs2, NULL, rv_op_addw, rv_op_addw, rv_op_addw },
> -    { "c.j", rv_codec_cj, rv_fmt_rd_offset, NULL, rv_op_jal, rv_op_jal, rv_op_jal },
> -    { "c.beqz", rv_codec_cb, rv_fmt_rs1_rs2_offset, NULL, rv_op_beq, rv_op_beq, rv_op_beq },
> -    { "c.bnez", rv_codec_cb, rv_fmt_rs1_rs2_offset, NULL, rv_op_bne, rv_op_bne, rv_op_bne },
> +    { "c.sub", rv_codec_cs, rv_fmt_rd_rs1_rs2, NULL, rv_op_sub, rv_op_sub,
> +      rv_op_sub },
> +    { "c.xor", rv_codec_cs, rv_fmt_rd_rs1_rs2, NULL, rv_op_xor, rv_op_xor,
> +      rv_op_xor },
> +    { "c.or", rv_codec_cs, rv_fmt_rd_rs1_rs2, NULL, rv_op_or, rv_op_or,
> +      rv_op_or },
> +    { "c.and", rv_codec_cs, rv_fmt_rd_rs1_rs2, NULL, rv_op_and, rv_op_and,
> +      rv_op_and },
> +    { "c.subw", rv_codec_cs, rv_fmt_rd_rs1_rs2, NULL, rv_op_subw, rv_op_subw,
> +      rv_op_subw },
> +    { "c.addw", rv_codec_cs, rv_fmt_rd_rs1_rs2, NULL, rv_op_addw, rv_op_addw,
> +      rv_op_addw },
> +    { "c.j", rv_codec_cj, rv_fmt_rd_offset, NULL, rv_op_jal, rv_op_jal,
> +      rv_op_jal },
> +    { "c.beqz", rv_codec_cb, rv_fmt_rs1_rs2_offset, NULL, rv_op_beq, rv_op_beq,
> +      rv_op_beq },
> +    { "c.bnez", rv_codec_cb, rv_fmt_rs1_rs2_offset, NULL, rv_op_bne, rv_op_bne,
> +      rv_op_bne },
>       { "c.slli", rv_codec_ci_sh6, rv_fmt_rd_rs1_imm, NULL, rv_op_slli,
>         rv_op_slli, rv_op_slli, rvcd_imm_nz },
> -    { "c.fldsp", rv_codec_ci_ldsp, rv_fmt_frd_offset_rs1, NULL, rv_op_fld, rv_op_fld, rv_op_fld },
> -    { "c.lwsp", rv_codec_ci_lwsp, rv_fmt_rd_offset_rs1, NULL, rv_op_lw, rv_op_lw, rv_op_lw },
> -    { "c.flwsp", rv_codec_ci_lwsp, rv_fmt_frd_offset_rs1, NULL, rv_op_flw, 0, 0 },
> -    { "c.jr", rv_codec_cr_jr, rv_fmt_rd_rs1_offset, NULL, rv_op_jalr, rv_op_jalr, rv_op_jalr },
> -    { "c.mv", rv_codec_cr_mv, rv_fmt_rd_rs1_rs2, NULL, rv_op_addi, rv_op_addi, rv_op_addi },
> -    { "c.ebreak", rv_codec_ci_none, rv_fmt_none, NULL, rv_op_ebreak, rv_op_ebreak, rv_op_ebreak },
> -    { "c.jalr", rv_codec_cr_jalr, rv_fmt_rd_rs1_offset, NULL, rv_op_jalr, rv_op_jalr, rv_op_jalr },
> -    { "c.add", rv_codec_cr, rv_fmt_rd_rs1_rs2, NULL, rv_op_add, rv_op_add, rv_op_add },
> -    { "c.fsdsp", rv_codec_css_sdsp, rv_fmt_frs2_offset_rs1, NULL, rv_op_fsd, rv_op_fsd, rv_op_fsd },
> -    { "c.swsp", rv_codec_css_swsp, rv_fmt_rs2_offset_rs1, NULL, rv_op_sw, rv_op_sw, rv_op_sw },
> -    { "c.fswsp", rv_codec_css_swsp, rv_fmt_frs2_offset_rs1, NULL, rv_op_fsw, 0, 0 },
> -    { "c.ld", rv_codec_cl_ld, rv_fmt_rd_offset_rs1, NULL, 0, rv_op_ld, rv_op_ld },
> -    { "c.sd", rv_codec_cs_sd, rv_fmt_rs2_offset_rs1, NULL, 0, rv_op_sd, rv_op_sd },
> -    { "c.addiw", rv_codec_ci, rv_fmt_rd_rs1_imm, NULL, 0, rv_op_addiw, rv_op_addiw },
> -    { "c.ldsp", rv_codec_ci_ldsp, rv_fmt_rd_offset_rs1, NULL, 0, rv_op_ld, rv_op_ld },
> -    { "c.sdsp", rv_codec_css_sdsp, rv_fmt_rs2_offset_rs1, NULL, 0, rv_op_sd, rv_op_sd },
> +    { "c.fldsp", rv_codec_ci_ldsp, rv_fmt_frd_offset_rs1, NULL, rv_op_fld,
> +      rv_op_fld, rv_op_fld },
> +    { "c.lwsp", rv_codec_ci_lwsp, rv_fmt_rd_offset_rs1, NULL, rv_op_lw,
> +      rv_op_lw, rv_op_lw },
> +    { "c.flwsp", rv_codec_ci_lwsp, rv_fmt_frd_offset_rs1, NULL, rv_op_flw, 0,
> +      0 },
> +    { "c.jr", rv_codec_cr_jr, rv_fmt_rd_rs1_offset, NULL, rv_op_jalr,
> +      rv_op_jalr, rv_op_jalr },
> +    { "c.mv", rv_codec_cr_mv, rv_fmt_rd_rs1_rs2, NULL, rv_op_addi, rv_op_addi,
> +      rv_op_addi },
> +    { "c.ebreak", rv_codec_ci_none, rv_fmt_none, NULL, rv_op_ebreak,
> +      rv_op_ebreak, rv_op_ebreak },
> +    { "c.jalr", rv_codec_cr_jalr, rv_fmt_rd_rs1_offset, NULL, rv_op_jalr,
> +      rv_op_jalr, rv_op_jalr },
> +    { "c.add", rv_codec_cr, rv_fmt_rd_rs1_rs2, NULL, rv_op_add, rv_op_add,
> +      rv_op_add },
> +    { "c.fsdsp", rv_codec_css_sdsp, rv_fmt_frs2_offset_rs1, NULL, rv_op_fsd,
> +      rv_op_fsd, rv_op_fsd },
> +    { "c.swsp", rv_codec_css_swsp, rv_fmt_rs2_offset_rs1, NULL, rv_op_sw,
> +      rv_op_sw, rv_op_sw },
> +    { "c.fswsp", rv_codec_css_swsp, rv_fmt_frs2_offset_rs1, NULL, rv_op_fsw, 0,
> +      0 },
> +    { "c.ld", rv_codec_cl_ld, rv_fmt_rd_offset_rs1, NULL, 0, rv_op_ld,
> +      rv_op_ld },
> +    { "c.sd", rv_codec_cs_sd, rv_fmt_rs2_offset_rs1, NULL, 0, rv_op_sd,
> +      rv_op_sd },
> +    { "c.addiw", rv_codec_ci, rv_fmt_rd_rs1_imm, NULL, 0, rv_op_addiw,
> +      rv_op_addiw },
> +    { "c.ldsp", rv_codec_ci_ldsp, rv_fmt_rd_offset_rs1, NULL, 0, rv_op_ld,
> +      rv_op_ld },
> +    { "c.sdsp", rv_codec_css_sdsp, rv_fmt_rs2_offset_rs1, NULL, 0, rv_op_sd,
> +      rv_op_sd },
>       { "c.lq", rv_codec_cl_lq, rv_fmt_rd_offset_rs1, NULL, 0, 0, rv_op_lq },
>       { "c.sq", rv_codec_cs_sq, rv_fmt_rs2_offset_rs1, NULL, 0, 0, rv_op_sq },
>       { "c.lqsp", rv_codec_ci_lqsp, rv_fmt_rd_offset_rs1, NULL, 0, 0, rv_op_lq },
> -    { "c.sqsp", rv_codec_css_sqsp, rv_fmt_rs2_offset_rs1, NULL, 0, 0, rv_op_sq },
> +    { "c.sqsp", rv_codec_css_sqsp, rv_fmt_rs2_offset_rs1, NULL, 0, 0,
> +      rv_op_sq },
>       { "nop", rv_codec_i, rv_fmt_none, NULL, 0, 0, 0 },
>       { "mv", rv_codec_i, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
>       { "not", rv_codec_i, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
> @@ -2838,7 +2882,8 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>               }
>               break;
>           case 11:
> -            switch (((inst >> 24) & 0b11111000) | ((inst >> 12) & 0b00000111)) {
> +            switch (((inst >> 24) & 0b11111000) |
> +                    ((inst >> 12) & 0b00000111)) {
>               case 2: op = rv_op_amoadd_w; break;
>               case 3: op = rv_op_amoadd_d; break;
>               case 4: op = rv_op_amoadd_q; break;
> @@ -2887,7 +2932,8 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>               }
>               break;
>           case 12:
> -            switch (((inst >> 22) & 0b1111111000) | ((inst >> 12) & 0b0000000111)) {
> +            switch (((inst >> 22) & 0b1111111000) |
> +                    ((inst >> 12) & 0b0000000111)) {
>               case 0: op = rv_op_add; break;
>               case 1: op = rv_op_sll; break;
>               case 2: op = rv_op_slt; break;
> @@ -2958,7 +3004,8 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>               break;
>           case 13: op = rv_op_lui; break;
>           case 14:
> -            switch (((inst >> 22) & 0b1111111000) | ((inst >> 12) & 0b0000000111)) {
> +            switch (((inst >> 22) & 0b1111111000) |
> +                    ((inst >> 12) & 0b0000000111)) {
>               case 0: op = rv_op_addw; break;
>               case 1: op = rv_op_sllw; break;
>               case 5: op = rv_op_srlw; break;
> @@ -3167,35 +3214,41 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>                   }
>                   break;
>               case 112:
> -                switch (((inst >> 17) & 0b11111000) | ((inst >> 12) & 0b00000111)) {
> +                switch (((inst >> 17) & 0b11111000) |
> +                        ((inst >> 12) & 0b00000111)) {
>                   case 0: op = rv_op_fmv_x_s; break;
>                   case 1: op = rv_op_fclass_s; break;
>                   }
>                   break;
>               case 113:
> -                switch (((inst >> 17) & 0b11111000) | ((inst >> 12) & 0b00000111)) {
> +                switch (((inst >> 17) & 0b11111000) |
> +                        ((inst >> 12) & 0b00000111)) {
>                   case 0: op = rv_op_fmv_x_d; break;
>                   case 1: op = rv_op_fclass_d; break;
>                   }
>                   break;
>               case 115:
> -                switch (((inst >> 17) & 0b11111000) | ((inst >> 12) & 0b00000111)) {
> +                switch (((inst >> 17) & 0b11111000) |
> +                        ((inst >> 12) & 0b00000111)) {
>                   case 0: op = rv_op_fmv_x_q; break;
>                   case 1: op = rv_op_fclass_q; break;
>                   }
>                   break;
>               case 120:
> -                switch (((inst >> 17) & 0b11111000) | ((inst >> 12) & 0b00000111)) {
> +                switch (((inst >> 17) & 0b11111000) |
> +                        ((inst >> 12) & 0b00000111)) {
>                   case 0: op = rv_op_fmv_s_x; break;
>                   }
>                   break;
>               case 121:
> -                switch (((inst >> 17) & 0b11111000) | ((inst >> 12) & 0b00000111)) {
> +                switch (((inst >> 17) & 0b11111000) |
> +                        ((inst >> 12) & 0b00000111)) {
>                   case 0: op = rv_op_fmv_d_x; break;
>                   }
>                   break;
>               case 123:
> -                switch (((inst >> 17) & 0b11111000) | ((inst >> 12) & 0b00000111)) {
> +                switch (((inst >> 17) & 0b11111000) |
> +                        ((inst >> 12) & 0b00000111)) {
>                   case 0: op = rv_op_fmv_q_x; break;
>                   }
>                   break;
> @@ -3216,9 +3269,17 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>                   case 11: op = rv_op_vxor_vv; break;
>                   case 12: op = rv_op_vrgather_vv; break;
>                   case 14: op = rv_op_vrgatherei16_vv; break;
> -                case 16: if (((inst >> 25) & 1) == 0) op = rv_op_vadc_vvm; break;
> +                case 16:
> +                    if (((inst >> 25) & 1) == 0) {
> +                        op = rv_op_vadc_vvm;
> +                    }
> +                    break;
>                   case 17: op = rv_op_vmadc_vvm; break;
> -                case 18: if (((inst >> 25) & 1) == 0) op = rv_op_vsbc_vvm; break;
> +                case 18:
> +                    if (((inst >> 25) & 1) == 0) {
> +                        op = rv_op_vsbc_vvm;
> +                    }
> +                    break;
>                   case 19: op = rv_op_vmsbc_vvm; break;
>                   case 23:
>                       if (((inst >> 20) & 0b111111) == 32)
> @@ -3365,7 +3426,11 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>                       case 2: op = rv_op_vmsof_m; break;
>                       case 3: op = rv_op_vmsif_m; break;
>                       case 16: op = rv_op_viota_m; break;
> -                    case 17: if (((inst >> 20) & 0b11111) == 0) op = rv_op_vid_v; break;
> +                    case 17:
> +                        if (((inst >> 20) & 0b11111) == 0) {
> +                            op = rv_op_vid_v;
> +                        }
> +                        break;
>                       }
>                       break;
>                   case 23: if ((inst >> 25) & 1) op = rv_op_vcompress_vm; break;
> @@ -3415,7 +3480,11 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>                   case 12: op = rv_op_vrgather_vi; break;
>                   case 14: op = rv_op_vslideup_vi; break;
>                   case 15: op = rv_op_vslidedown_vi; break;
> -                case 16: if (((inst >> 25) & 1) == 0) op = rv_op_vadc_vim; break;
> +                case 16:
> +                    if (((inst >> 25) & 1) == 0) {
> +                        op = rv_op_vadc_vim;
> +                    }
> +                    break;
>                   case 17: op = rv_op_vmadc_vim; break;
>                   case 23:
>                       if (((inst >> 20) & 0b111111) == 32)
> @@ -3465,9 +3534,17 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>                   case 12: op = rv_op_vrgather_vx; break;
>                   case 14: op = rv_op_vslideup_vx; break;
>                   case 15: op = rv_op_vslidedown_vx; break;
> -                case 16: if (((inst >> 25) & 1) == 0) op = rv_op_vadc_vxm; break;
> +                case 16:
> +                    if (((inst >> 25) & 1) == 0) {
> +                        op = rv_op_vadc_vxm;
> +                    }
> +                    break;
>                   case 17: op = rv_op_vmadc_vxm; break;
> -                case 18: if (((inst >> 25) & 1) == 0) op = rv_op_vsbc_vxm; break;
> +                case 18:
> +                    if (((inst >> 25) & 1) == 0) {
> +                        op = rv_op_vsbc_vxm;
> +                    }
> +                    break;
>                   case 19: op = rv_op_vmsbc_vxm; break;
>                   case 23:
>                       if (((inst >> 20) & 0b111111) == 32)
> @@ -3638,7 +3715,8 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>           case 28:
>               switch (((inst >> 12) & 0b111)) {
>               case 0:
> -                switch (((inst >> 20) & 0b111111100000) | ((inst >> 7) & 0b000000011111)) {
> +                switch (((inst >> 20) & 0b111111100000) |
> +                        ((inst >> 7) & 0b000000011111)) {
>                   case 0:
>                       switch (((inst >> 15) & 0b1111111111)) {
>                       case 0: op = rv_op_ecall; break;
> @@ -3688,7 +3766,8 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>               }
>               break;
>           case 30:
> -            switch (((inst >> 22) & 0b1111111000) | ((inst >> 12) & 0b0000000111)) {
> +            switch (((inst >> 22) & 0b1111111000) |
> +                    ((inst >> 12) & 0b0000000111)) {
>               case 0: op = rv_op_addd; break;
>               case 1: op = rv_op_slld; break;
>               case 5: op = rv_op_srld; break;

