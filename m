Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD5D606A32C
	for <qemu-riscv@archiver.kernel.org>; Fri, 20 Nov 2026 21:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N1S7OFxb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DTBAgUnD
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xUVm0-0004bL-JQ; Fri, 20 Nov 2026 16:03:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xUVlu-0004aD-Rb
 for qemu-riscv@nongnu.org; Fri, 20 Nov 2026 16:03:50 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xUVlp-00051m-8I
 for qemu-riscv@nongnu.org; Fri, 20 Nov 2026 16:03:49 -0500
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AKJlJ493619507
 for <qemu-riscv@nongnu.org>; Fri, 20 Nov 2026 21:03:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1z28Hl9UoYbPXT+NxXjdESgixpFf5eMvwLmVLjQMS+8=; b=N1S7OFxbvQwQ5twO
 eZtr3O1nXjmIg6krXaZz8Oku/Jq7STQQGAEc0z/RRvIqnDL4sQp/TPA/g7RkCheF
 EAdQQGDPQqwyWWiQwhS2K1u6QClyOD/uVhajrEsl9FG0XlkPGwV+GPMaSITIYz4Z
 mUDORaiyrQuUrypkjjJtQlxSt0PACd2ULcMGrIP1cXju2p+2bxnDqA60qJATvuOM
 l5iMkDwQdk8TJwrcqq30nXv62+ri1lFwyMuRBZx//YCZk5UcowFi6EY04QjCiw6s
 46nRo+9u+bpb8TUkXLGp/hD2BkIdzn+GpayBLpfTbOa6G7qcvj9msIqOAQhs2ylI
 NtUfog==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2vnx086d-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 20 Nov 2026 21:03:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-55d3e7ba879so29357551cf.2
 for <qemu-riscv@nongnu.org>; Fri, 20 Nov 2026 13:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795208618; x=1795813418; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=1z28Hl9UoYbPXT+NxXjdESgixpFf5eMvwLmVLjQMS+8=;
 b=DTBAgUnDAR6IEMsJACPi5fEN6YXgAILQqEUwSVs4yO/8PaxLx08b7IP674oZ777XoD
 6dN+DYj74Z4Rysl+NKz/9inIP8SA51p3uK0JPOG0j8MOL5LcCucYNtY+V0CCWjBuwBd1
 7Jz1keEdw5V+JgQd98nQLzMrlXZILCPhHGP9OiKeuvcoa1CzZWdafPSCcReNbBLk8oHr
 bcnMr21XcUaT9Tf5tQHxcuI/eVIb3Ue7/8tSv469qtLtFrVicEchXZOj59Mtc77fIhqh
 OuhWwjS+tBAAgV2X4kUiXosOS7sL5BuJgCYAgh97ZrA9Ei5YjkKoDblfZ88lKnLCqX/4
 FCAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795208618; x=1795813418;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=1z28Hl9UoYbPXT+NxXjdESgixpFf5eMvwLmVLjQMS+8=;
 b=maeJ5rSUOQsqMhJQZcWhvaCrsk+TebSYNWehIDNXP1KqwANr2mEvVmwTcHt9FTUVEZ
 9SsVdHz5oKGCsXgECsNVmIPh5Z3biXfcnUrc2yJweC15FS7rvpHmoVZCQRhL4cBondU2
 YPBHXj06VkgFiLzPwKjo5BO5jUl9Pq+Crpt6HdyMtpr66vY1irVlry/KZrpXERmS+BLj
 hYqQ9G/1DyUd1nbwS1T8+m3M83+6USS5R6lyj25KX4F+AKxBOACYZK+k98PP/+RO0sXX
 KxP+z7ImBAwtJ3lkU6Y0lHM5EcvlOWRKxyhG/6gm+80fWLHiWxPDV+MCaoHTwvTmta41
 jHQw==
X-Gm-Message-State: APuU4Z+3WDnp2DzIp7dvOM4991KA5b2SkAsd/h5+bMnO9Ty3WyVt42XX
 BllK+mecjE8E3kX6NjAL1FU46QIJUw85lgw5NDRLaFCc7b+1vNK+hm5OigPgR9HXaazd/l7QyQa
 zmm9rDQ8O6Vn9nq/4DH3aF89IxcXzu3NBIB7NUv2ny+HKKtR7gtLlDKRlHA==
X-Gm-Gg: AYBFou37/cdgY6Op6jcT1KhnlC7YkUuVAc2jyn575Y+AzHDu/tz7NxOQrfByrWbuRrg
 Lwh3GCejT+C7YllGlSxjoZ4wtOHEqTQ/nTk/LANHNJWCBrfG08BTiueN3qkudXLXXrv+acfNmpV
 RjBaS0/BCsblSfBjAAGU8eGSw8NH8zEwFX1XlXbT7vBqgClV4MConO/DZCAhzauwSP7NhifKbOW
 4J6xoQo8lNlq8+aOv/sxu+EvaJ/fCE/eEpfZD04aweH5h2WCf3VYGknCZy0/CMJyeTDBuD3+O5S
 fd6GZMLgUkDKYmw8h8SRG7mX8A6Bh0sS3zB/Kd2HANTOD6IlS36qRzcFydZmyYUdQl3y3QoNfSE
 aSQwjc8eoMcU2UrcUwI1eVJn5W1cM8M3KUv8CsD3o+mPLEEXyd4qbijbcJaMLmghm2ZiBWAiFBb
 RdatbibWuU
X-Received: by 2002:ac8:5d0e:0:b0:55d:25a1:72a9 with SMTP id
 d75a77b69052e-55d76a17bcbmr79194931cf.32.1795208617974; 
 Fri, 20 Nov 2026 13:03:37 -0800 (PST)
X-Received: by 2002:ac8:5d0e:0:b0:55d:25a1:72a9 with SMTP id
 d75a77b69052e-55d76a17bcbmr79194241cf.32.1795208617323; 
 Fri, 20 Nov 2026 13:03:37 -0800 (PST)
Received: from [192.168.68.105] ([189.110.107.17])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-55d7c654585sm25593031cf.5.2026.11.20.13.03.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2026 13:03:36 -0800 (PST)
Message-ID: <88d509cd-c844-4ff4-8a48-b0bfa661ac56@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 18:03:34 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] riscv: Add support for Zibi extension
To: =?UTF-8?B?5rSq5b+X5Y2a?= <hongzhibo@bytedance.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org
References: <20260203082144.2183253-1-hongzhibo@bytedance.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260203082144.2183253-1-hongzhibo@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA4MyBTYWx0ZWRfXymNCYc3+ZbM7
 v2P4bZRf9BtK0GFxYUBos5o3YEPvbDp/auLxtP66fLHpNSHnKBRN6N8ZJz7SN6koW7Bo61PvAtd
 NKONfSrAT6GqyhISMEPl5A88iRlr2FNkbwvtzb4aoxa2wve7NrVYNaBtHdscIS+QbQJ0vt93zoZ
 dhrTPEteNaZx+8O7Le8+kFujZBG0bNZ4+GETRdMJ7aIP6f5GoOEgZ0FTmCR/9vICbFfU2udh6wY
 VWZdq3Wl/PHm5kIzW3cQ87rvXmFsNVBuksjxlp9e9mCbae4MeXo1ChQZdPT5y90IwgPke7OSBoH
 O+dTdamFYHHFrQKBExyC2dX+Usu9MJ8ImJ8Fii1Fyd8uZ/XnsVRgEoLnlMyyT3Dvy+UD/WmZ2Ls
 amTC38htgOtrrrJoxCEKSr1lWizdepj7Z0+09NQPeAW3IRcT7UzYbv4mWV+gJqi3PyfshPfco3R
 35ui4pcwkATWw5T8Cdw==
X-Authority-Analysis: v=2.4 cv=SbRi5fRu c=1 sm=1 tr=0 ts=6b00b5ac cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=2Chh/y2wedAoPG2p3qwUfw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=968KyxNXAAAA:8 a=Be6vgRiyOBYVyl_d8FUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: F8iZ9oLGo8Nm8xRRtZsCAy3qka9a08sQ
X-Proofpoint-GUID: F8iZ9oLGo8Nm8xRRtZsCAy3qka9a08sQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA4MyBTYWx0ZWRfX/w0bkQzsFx+b
 nxvXxIvAV2X50Z4U/AIDkZcVtDx17s2d23QUL2g5if4W2iwq9ms0e0LoSMJ0e0saIlT9m9pudcG
 b5Yqc8qRqPuMzMs3A23bx0Wfm/Zr+RY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200083
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Zhibo,

I never saw a new version of this work.  Care to rebase and send it?
I believe Chao also made some comments.

It would also be nice to add a TCG testcase for it.  There are several
examples in the tests/tcg/riscv64/ dir.


Thanks,
Daniel

On 2/3/2026 5:21 AM, 洪志博 wrote:
> From: Zhibo Hong <hongzhibo@bytedance.com>
> 
> Signed-off-by: Zhibo Hong <hongzhibo@bytedance.com>
> ---
>   disas/riscv.c                              | 17 +++++++
>   disas/riscv.h                              |  2 +
>   target/riscv/cpu.c                         |  2 +
>   target/riscv/cpu_cfg_fields.h.inc          |  1 +
>   target/riscv/insn32.decode                 |  9 ++++
>   target/riscv/insn_trans/trans_rvzibi.c.inc | 54 ++++++++++++++++++++++
>   target/riscv/translate.c                   |  6 +++
>   7 files changed, 91 insertions(+)
>   create mode 100644 target/riscv/insn_trans/trans_rvzibi.c.inc
> 
> diff --git a/disas/riscv.c b/disas/riscv.c
> index 85cd2a9c2a..92862835f0 100644
> --- a/disas/riscv.c
> +++ b/disas/riscv.c
> @@ -984,6 +984,8 @@ typedef enum {
>       rv_op_ssamoswap_d = 953,
>       rv_op_c_sspush = 954,
>       rv_op_c_sspopchk = 955,
> +    rv_op_beqi      = 956,
> +    rv_op_bnei      = 957,
>   } rv_op;
>   
>   /* register names */
> @@ -2254,6 +2256,8 @@ const rv_opcode_data rvi_opcode_data[] = {
>         rv_op_sspush, 0 },
>       { "c.sspopchk", rv_codec_cmop_ss, rv_fmt_rs1, NULL, rv_op_sspopchk,
>         rv_op_sspopchk, 0 },
> +    { "beqi", rv_codec_bi, rv_fmt_rs1_imm1_offset, NULL, 0, 0, 0 },
> +    { "bnei", rv_codec_bi, rv_fmt_rs1_imm1_offset, NULL, 0, 0, 0 },
>   };
>   
>   /* CSR names */
> @@ -3997,6 +4001,8 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>               switch ((inst >> 12) & 0b111) {
>               case 0: op = rv_op_beq; break;
>               case 1: op = rv_op_bne; break;
> +            case 2: op = rv_op_beqi; break;
> +            case 3: op = rv_op_bnei; break;
>               case 4: op = rv_op_blt; break;
>               case 5: op = rv_op_bge; break;
>               case 6: op = rv_op_bltu; break;
> @@ -4529,6 +4535,12 @@ static uint32_t operand_imml(rv_inst inst)
>       return (inst << 38) >> 58;
>   }
>   
> +static int32_t operand_bi(rv_inst inst)
> +{
> +    uint32_t cimm = (inst << 39) >> 59;
> +    return cimm == 0 ? -1 : cimm;
> +}
> +
>   static uint32_t calculate_stack_adj(rv_isa isa, uint32_t rlist, uint32_t spimm)
>   {
>       int xlen_bytes_log2 = isa == rv64 ? 3 : 2;
> @@ -4948,6 +4960,11 @@ static void decode_inst_operands(rv_decode *dec, rv_isa isa)
>           dec->rs1 = dec->rs2 = operand_crs1(inst);
>           dec->imm = 0;
>           break;
> +    case rv_codec_bi:
> +        dec->rs1 = operand_rs1(inst);
> +        dec->imm = operand_sbimm12(inst);
> +        dec->imm1 = operand_bi(inst);
> +        break;
>       };
>   }
>   
> diff --git a/disas/riscv.h b/disas/riscv.h
> index d211700cb2..452c788278 100644
> --- a/disas/riscv.h
> +++ b/disas/riscv.h
> @@ -168,6 +168,7 @@ typedef enum {
>       rv_codec_fli,
>       rv_codec_lp,
>       rv_codec_cmop_ss,
> +    rv_codec_bi,
>   } rv_codec;
>   
>   /* structures */
> @@ -305,5 +306,6 @@ enum {
>   #define rv_fmt_rd_rs1_immh_imml_addr  "O\t0,(1),i,j"
>   #define rv_fmt_rd2_imm                "O\t0,2,(1),i"
>   #define rv_fmt_fli                    "O\t3,h"
> +#define rv_fmt_rs1_imm1_offset        "O\t1,j,o"
>   
>   #endif /* DISAS_RISCV_H */
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index e95eea0249..0a1cb41c96 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -120,6 +120,7 @@ static void riscv_cpu_cfg_merge(RISCVCPUConfig *dest, const RISCVCPUConfig *src)
>    * instead.
>    */
>   const RISCVIsaExtData isa_edata_arr[] = {
> +    ISA_EXT_DATA_ENTRY(zibi, PRIV_VERSION_1_13_0, ext_zibi),
>       ISA_EXT_DATA_ENTRY(zic64b, PRIV_VERSION_1_12_0, ext_zic64b),
>       ISA_EXT_DATA_ENTRY(zicbom, PRIV_VERSION_1_12_0, ext_zicbom),
>       ISA_EXT_DATA_ENTRY(zicbop, PRIV_VERSION_1_12_0, ext_zicbop),
> @@ -1238,6 +1239,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
>       MULTI_EXT_CFG_BOOL("ssccfg", ext_ssccfg, false),
>       MULTI_EXT_CFG_BOOL("smctr", ext_smctr, false),
>       MULTI_EXT_CFG_BOOL("ssctr", ext_ssctr, false),
> +    MULTI_EXT_CFG_BOOL("zibi", ext_zibi, false),
>       MULTI_EXT_CFG_BOOL("zifencei", ext_zifencei, true),
>       MULTI_EXT_CFG_BOOL("zicfilp", ext_zicfilp, false),
>       MULTI_EXT_CFG_BOOL("zicfiss", ext_zicfiss, false),
> diff --git a/target/riscv/cpu_cfg_fields.h.inc b/target/riscv/cpu_cfg_fields.h.inc
> index 70ec650abf..046c656bd9 100644
> --- a/target/riscv/cpu_cfg_fields.h.inc
> +++ b/target/riscv/cpu_cfg_fields.h.inc
> @@ -30,6 +30,7 @@ BOOL_FIELD(ext_zks)
>   BOOL_FIELD(ext_zksed)
>   BOOL_FIELD(ext_zksh)
>   BOOL_FIELD(ext_zkt)
> +BOOL_FIELD(ext_zibi)
>   BOOL_FIELD(ext_zifencei)
>   BOOL_FIELD(ext_zicntr)
>   BOOL_FIELD(ext_zicsr)
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 6e35c4b1e6..0a92e79508 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -20,6 +20,7 @@
>   %rs3       27:5
>   %rs2       20:5
>   %rs1       15:5
> +%rs1_3     17:3                  !function=ex_rvc_register
>   %rd        7:5
>   %sh5       20:5
>   %sh6       20:6
> @@ -40,6 +41,7 @@
>   %imm_z6   26:1 15:5
>   %imm_mop5 30:1 26:2 20:2
>   %imm_mop3 30:1 26:2
> +%imm_bi   20:5                   !function=ex_bi
>   
>   # Argument sets:
>   &empty
> @@ -60,6 +62,7 @@
>   &k_aes     shamt rs2 rs1 rd
>   &mop5 imm rd rs1
>   &mop3 imm rd rs1 rs2
> +&bi   imm imm2 rs1
>   
>   # Formats 32:
>   @r       .......   ..... ..... ... ..... ....... &r                %rs2 %rs1 %rd
> @@ -111,6 +114,8 @@
>   # Formats 128:
>   @sh6       ...... ...... ..... ... ..... ....... &shift shamt=%sh6 %rs1 %rd
>   
> +@bi      ....... ..... ... .. ... ..... ....... &bi imm=%imm_b imm2=%imm_bi rs1=%rs1
> +
>   # *** Privileged Instructions ***
>   ecall       000000000000     00000 000 00000 1110011
>   ebreak      000000000001     00000 000 00000 1110011
> @@ -1084,3 +1089,7 @@ sb_aqrl  00111 . . ..... ..... 000 ..... 0101111 @atom_st
>   sh_aqrl  00111 . . ..... ..... 001 ..... 0101111 @atom_st
>   sw_aqrl  00111 . . ..... ..... 010 ..... 0101111 @atom_st
>   sd_aqrl  00111 . . ..... ..... 011 ..... 0101111 @atom_st
> +
> +# *** Zibi Extension ***
> +beqi       ....... ..... ..... 010 ..... 1100011 @bi
> +bnei       ....... ..... ..... 011 ..... 1100011 @bi
> \ No newline at end of file
> diff --git a/target/riscv/insn_trans/trans_rvzibi.c.inc b/target/riscv/insn_trans/trans_rvzibi.c.inc
> new file mode 100644
> index 0000000000..24bc0806aa
> --- /dev/null
> +++ b/target/riscv/insn_trans/trans_rvzibi.c.inc
> @@ -0,0 +1,54 @@
> +#define REQUIRE_ZIBI(ctx) do {                  \
> +    if (!ctx->cfg_ptr->ext_zibi) {              \
> +        return false;                           \
> +    }                                           \
> +} while (0)
> +
> +static bool gen_immediate_branch(DisasContext *ctx, arg_bi *a, TCGCond cond)
> +{
> +    TCGLabel *l = gen_new_label();
> +    TCGv src1 = get_gpr(ctx, a->rs1, EXT_SIGN);
> +    TCGv imm2 = tcg_constant_tl(a->imm2);
> +    target_ulong orig_pc_save = ctx->pc_save;
> +
> +    if (get_xl(ctx) == MXL_RV128) {
> +        TCGv src1h = get_gprh(ctx, a->rs1);
> +        TCGv imm2h = tcg_constant_tl(a->imm2 >= 0 ? 0 : -1);
> +        TCGv tmp = tcg_temp_new();
> +
> +        cond = gen_compare_i128(false, tmp, src1, src1h, imm2, imm2h, cond);
> +        tcg_gen_brcondi_tl(cond, tmp, 0, l);
> +    } else {
> +        tcg_gen_brcond_tl(cond, src1, imm2, l);
> +    }
> +    gen_goto_tb(ctx, 1, ctx->cur_insn_len);
> +    ctx->pc_save = orig_pc_save;
> +
> +    gen_set_label(l); /* branch taken */
> +
> +    if (!has_ext(ctx, RVC) && !ctx->cfg_ptr->ext_zca &&
> +        (a->imm & 0x3)) {
> +        /* misaligned */
> +        TCGv target_pc = tcg_temp_new();
> +        gen_pc_plus_diff(target_pc, ctx, a->imm);
> +        gen_exception_inst_addr_mis(ctx, target_pc);
> +    } else {
> +        gen_goto_tb(ctx, 0, a->imm);
> +    }
> +    ctx->pc_save = -1;
> +    ctx->base.is_jmp = DISAS_NORETURN;
> +
> +    return true;
> +}
> +
> +static bool trans_beqi(DisasContext *ctx, arg_beqi *a)
> +{
> +    REQUIRE_ZIBI(ctx);
> +    return gen_immediate_branch(ctx, a, TCG_COND_EQ);
> +}
> +
> +static bool trans_bnei(DisasContext *ctx, arg_bnei *a)
> +{
> +    REQUIRE_ZIBI(ctx);
> +    return gen_immediate_branch(ctx, a, TCG_COND_NE);
> +}
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index f687c75fe4..d0b83ebe01 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -858,6 +858,11 @@ static int ex_rvc_shiftri(DisasContext *ctx, int imm)
>       return imm;
>   }
>   
> +static int ex_bi(DisasContext *ctx, int imm)
> +{
> +    return imm == 0 ? -1 : imm;
> +}
> +
>   /* Include the auto-generated decoder for 32 bit insn */
>   #include "decode-insn32.c.inc"
>   
> @@ -1215,6 +1220,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
>   #include "insn_trans/trans_xthead.c.inc"
>   #include "insn_trans/trans_xventanacondops.c.inc"
>   #include "insn_trans/trans_xmips.c.inc"
> +#include "insn_trans/trans_rvzibi.c.inc"
>   
>   /* Include the auto-generated decoder for 16 bit insn */
>   #include "decode-insn16.c.inc"


