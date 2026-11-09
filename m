Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535C5606A334
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 20:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RAtfBJZc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Soxsxa0s
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xQW4o-0007hY-93; Mon, 09 Nov 2026 15:34:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQW2n-00060p-Om
 for qemu-riscv@nongnu.org; Mon, 09 Nov 2026 15:32:49 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQW2l-0007kv-US
 for qemu-riscv@nongnu.org; Mon, 09 Nov 2026 15:32:45 -0500
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A9HHNSA846810
 for <qemu-riscv@nongnu.org>; Mon, 9 Nov 2026 20:32:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 s3mPOkM3JZkNb79CxvOftLFVQKpBjYROdf8pVPNRyIg=; b=RAtfBJZc7F1YsAok
 5yFMgXCAF5F7QcZK6aQFnFw5iWTiHwDHf3MOIlcBSEytk1umPfpI0NXEAAxeiciL
 Ky+2EAGRv4w4HxiwYBgsGtHBGD9FgfM9IOzxlZXOYtZfA0F0CexwwQ/YMSVYsYAB
 VWsexqUlObFTKpkTObRkEgLe8bcQyUd6PLrGGaYTiB9nuE0CByP1qEEjPLS8O/t0
 ZupiLbAtJgZYnfrRod/VJAtXYJTQMSq9WIQAEvXGGBkzdc63r0REY+84Fs8sDINs
 gDRmLf8xN1KH89YudeCrbgiiURyuRWsR3oMELZxuQFobGR90hbdSDEcNqI0QOPW3
 0UxLIw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucapa56s-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 09 Nov 2026 20:32:41 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-91ebb902eebso26288846d6.3
 for <qemu-riscv@nongnu.org>; Mon, 09 Nov 2026 12:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794256360; x=1794861160; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=s3mPOkM3JZkNb79CxvOftLFVQKpBjYROdf8pVPNRyIg=;
 b=Soxsxa0spuGwV8TJcyOgtfISFAu747D3AKVowIOa34cr309bRP2Da1Vjp5VqWDW5bA
 ITI9mQ2jMuIkbYnoQmLIU0c56fMoMWRfKi77tPXiX7mivos5mnPYA7uvfDv9eK5bw7pE
 CMDv3iLHhKKsOu28rXwNZ5a34P/AXpfx+B6sgNXp/X2l9Houv5HySSB8aj38TgAEWh9F
 FaV2+6Zwf4el67EjygeMyQvZxXYq9VNF2r5r9/bjpR4szzCXkVca9L8XqsCOESc3r1WV
 0BVinjBU9HZlb8dw37ttx1Y8WBB/BcmDs/ZHbcFdiCcUq+BZuQX9uKIyM+Fh5JNv0mE9
 YC9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794256360; x=1794861160;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=s3mPOkM3JZkNb79CxvOftLFVQKpBjYROdf8pVPNRyIg=;
 b=O0uUIUykhd0KL5c+ZeLrNR8NByqW+qBJ/5G0+fs2O9hH5F8Zt8wrR39pjTRHL73JZs
 Y2An1YzZsHToyzJC3excoYnrGobYeBLeftij66o75fPGAzo8lyW9HyhcdMiBnrO3qo5Z
 4DB18crfFCkK1EjMSIFI8+SqaAM20ENW4cVVNvWQeJ0C5ukGOlX5H+yB+ga/gzbCMUmA
 AaYRXWfwvfyj0x6DUgu+BXqTfpgHWAE3kAJdDXbyHtup1qD7NVuUJZKgbkjJVA9LwP/e
 AQz84PuNf/4SpJ9IZhPq+1CVNa+7tRKqZ6AkQdYeCiC1GZ1U6X7S41W4s/7UH439s/ry
 6+0A==
X-Forwarded-Encrypted: i=1;
 AL+hErF2lYwOYQrli9YTD7icRk15v1JvQR+orrcOZskfpXJOPlTTrvwnxVCACqZ+KcfttfkkOhtDUAL1Tgq+@nongnu.org
X-Gm-Message-State: APuU4Z+TpFna3UJRqmtp9jxZiJIkyo5YM92Irz5p6rZ8MU+MY2t34dag
 pO3ZVAa6SEf+m/OgNfoOap4dzRMEi2MPiCReD8O2bJuwGgaZxNm+jfYuxKmEqw7vw9dL6XD4kCy
 sG7YjDh+y/2TkEbM4EKTmoCKKMGme2vd3oxYFtx//+xBlopnSNZJ6wuI9Bg==
X-Gm-Gg: AYBFou2aBItuzFRWo+PwqISOPFPlIonGyIOfIyEl6AXFmpjHdxU+z4+wIuWYiW6gvou
 JayAcbNWQIX5jgk8GxIauyAe9oAAmuAvMk9u6IuOdvJn8qJAxaVIteYwtVqy4RygDGiQ6pCNAjL
 0yIBx/Mdy2/V37LszOfTOtM1s/QuoaOOJqSzmJHX3RK2wjYoKI6HhhcKeCKlIOQtYOvDejC492E
 TwVrddal6ufoJPyc6lsI1mxIFXvJ0lteoUN7UmVY98EESKWhFV+gOcos7Pkb6fNeSXS9ARGjStk
 FO17xZdydDl8uk1VV2ZtmV7vq8+icV1bfkQr9yiWGimhKixWEHwHHk8TmfIEQbfRMIFhf44RER2
 TB51cB/K8a3P5Uj59TFZjHXmG5T+SbZgn1U1C7JklVWfAL7BukWIvfD0MfZNILLhgQ5R1cAz8mK
 rKY1NBNHHD
X-Received: by 2002:ad4:4ee3:0:b0:91e:9b39:4411 with SMTP id
 6a1803df08f44-91eef9296c1mr13740766d6.38.1794256359937; 
 Mon, 09 Nov 2026 12:32:39 -0800 (PST)
X-Received: by 2002:ad4:4ee3:0:b0:91e:9b39:4411 with SMTP id
 6a1803df08f44-91eef9296c1mr13740196d6.38.1794256359272; 
 Mon, 09 Nov 2026 12:32:39 -0800 (PST)
Received: from [192.168.68.100] ([152.234.124.231])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91ef010b059sm4868366d6.0.2026.11.09.12.32.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2026 12:32:38 -0800 (PST)
Message-ID: <d7bfda86-61aa-4e66-995c-53724e095fc1@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 17:32:35 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 22/38] disas/riscv: Support Zvqwbdota8i extension
To: Max Chou <max.chou@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
References: <20261104194155.679241-1-max.chou@sifive.com>
 <20261104194155.679241-23-max.chou@sifive.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261104194155.679241-23-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA4MSBTYWx0ZWRfX7PVf6Ad0xW7C
 rpbd6gJff9LeDSkqSEGAol50IjU0zZ38Ly0vbGw0Pu23nMynPDR6gdNJbY30d2Yylr5Bb7x8rjK
 lwSSmFZBnGa64UncWMuTisZcq6KD9BzJVsZLhVWQHTaY2ZBRxhfM8YN3m2vn9nJjolcLDfW6cAC
 R+bx6FI0bfJ3r2wGT6tkFyaqkcY30ehl84eXpkkT0zv/9+JlEJEW1CAqSwo97Gi3UkNOAlZUtzo
 I3HfQtbn3uyx1cndeuONBPWqjZ7wn3RsMYyti47gjXGJHdS9rEjLyz0/9D8CV/VGX9eW83dSi1h
 2up7vMv61FwAf6dnyHAbm7pMvLWoWTTHcde0plqde+QKeou7NY6P/JgX09MbvF3s/GUX90MTCWE
 I14YLiEhjolXBhndIh4PWjY/utZnHaOQhfUJ/e9W2w5Ugc766HoOWY5rizPFKi7OGuebrSGtk/M
 NBmaecJpUXvAsrNPLtA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA4MSBTYWx0ZWRfXxS/s1ObCV3uG
 wpiRX/AGn7777HioLDT3wo3MenaTYQ3wdMflSATnxE4rOzgR5Q5qMYoPMz9xHfyiKiLT9HQIubs
 QOVQYcfE1WFykY+7KIX2zSGzj8w8hTI=
X-Proofpoint-ORIG-GUID: k335cRY5SvMM9YxcKBmbp0uO61xMwEz9
X-Authority-Analysis: v=2.4 cv=TaQDJhQh c=1 sm=1 tr=0 ts=6af22de9 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=8elE1k/PHQNyZ14TNTodlQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pFyQfRViAAAA:8 a=EUspDBNiAAAA:8 a=b8KV8q9dYJj5uaI0mwgA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-GUID: k335cRY5SvMM9YxcKBmbp0uO61xMwEz9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090081
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
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/4/2026 4:41 PM, Max Chou wrote:
> Adds support to disassemble Zvqwbdota8i instructions.
> - vqwbdotau.vv
> - vqwbdotas.vv
> 
> Zvbdota instructions encode the batch-column immediate (ci) in rs2[2:0]
> and the vs2 base-register group in rs2[7:3].
> Add rv_codec_v_r_ci that splits rs2 into dec->rs2 (base register) and
> dec->imm (ci), and add rv_fmt_vd_vs2_vs1_ci_vm to print them separately.
> 
> Signed-off-by: Max Chou <max.chou@sifive.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   disas/riscv-op.c.inc | 2 ++
>   disas/riscv.c        | 9 +++++++++
>   disas/riscv.h        | 2 ++
>   3 files changed, 13 insertions(+)
> 
> diff --git a/disas/riscv-op.c.inc b/disas/riscv-op.c.inc
> index 5ba29f52976..bb01ebb8a6c 100644
> --- a/disas/riscv-op.c.inc
> +++ b/disas/riscv-op.c.inc
> @@ -773,6 +773,8 @@ OP(vnsrl_wx, "vnsrl.wx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm)
>   OP(vor_vi, "vor.vi", rv_codec_v_i, rv_fmt_vd_vs2_imm_vm)
>   OP(vor_vv, "vor.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm)
>   OP(vor_vx, "vor.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm)
> +OP(vqwbdotas_vv, "vqwbdotas.vv", rv_codec_v_r_ci, rv_fmt_vd_vs2_vs1_ci_vm)
> +OP(vqwbdotau_vv, "vqwbdotau.vv", rv_codec_v_r_ci, rv_fmt_vd_vs2_vs1_ci_vm)
>   OP(vqwdotas_vv, "vqwdotas.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm)
>   OP(vqwdotau_vv, "vqwdotau.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm)
>   OP(vredand_vs, "vredand.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm)
> diff --git a/disas/riscv.c b/disas/riscv.c
> index 0f609cc06b4..0534b8f4d64 100644
> --- a/disas/riscv.c
> +++ b/disas/riscv.c
> @@ -2638,6 +2638,8 @@ static const rv_opcode_data *decode_inst_opcode(rv_decode *dec, rv_isa isa)
>                   switch ((inst >> 26) & 0b111111) {
>                   case 38: return &op_vqwdotau_vv;
>                   case 39: return &op_vqwdotas_vv;
> +                case 46: return &op_vqwbdotau_vv;
> +                case 47: return &op_vqwbdotas_vv;
>                   }
>               }
>               if (((inst >> 12) & 0b111) == 1) {
> @@ -2999,6 +3001,13 @@ static void decode_inst_operands(rv_decode *dec, rv_isa isa,
>           dec->rs2 = operand_rs2(inst);
>           dec->vm = operand_vm(inst);
>           break;
> +    case rv_codec_v_r_ci:
> +        dec->rd = operand_rd(inst);
> +        dec->rs1 = operand_rs1(inst);
> +        dec->rs2 = operand_rs2(inst) & ~0x7;
> +        dec->imm = (operand_rs2(inst) & 0x7) << 3;
> +        dec->vm = operand_vm(inst);
> +        break;
>       case rv_codec_v_ldst:
>           dec->rd = operand_rd(inst);
>           dec->rs1 = operand_rs1(inst);
> diff --git a/disas/riscv.h b/disas/riscv.h
> index 4f1ffc4ae02..34050583c96 100644
> --- a/disas/riscv.h
> +++ b/disas/riscv.h
> @@ -138,6 +138,7 @@ typedef enum {
>       rv_codec_k_bs,
>       rv_codec_k_rnum,
>       rv_codec_v_r,
> +    rv_codec_v_r_ci,
>       rv_codec_v_ldst,
>       rv_codec_v_i,
>       rv_codec_v_i_u,
> @@ -254,6 +255,7 @@ typedef struct {
>   #define rv_fmt_vd_vs2_vs1             "O\tD,F,E"
>   #define rv_fmt_vd_vs2_vs1_vl          "O\tD,F,El"
>   #define rv_fmt_vd_vs2_vs1_vm          "O\tD,F,Em"
> +#define rv_fmt_vd_vs2_vs1_ci_vm       "O\tD,F,E,im"
>   #define rv_fmt_vd_vs2_rs1_vl          "O\tD,F,1l"
>   #define rv_fmt_vd_vs2_fs1_vl          "O\tD,F,4l"
>   #define rv_fmt_vd_vs2_rs1_vm          "O\tD,F,1m"


