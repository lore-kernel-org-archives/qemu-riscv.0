Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE14606A337
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 19:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F1BrHMFt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fV6Z2hNb
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xQVWW-0003ep-3b; Mon, 09 Nov 2026 14:59:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQVVT-00032Q-3i
 for qemu-riscv@nongnu.org; Mon, 09 Nov 2026 14:58:27 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQVVP-00045s-RY
 for qemu-riscv@nongnu.org; Mon, 09 Nov 2026 14:58:17 -0500
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A9Jh0iu1832053
 for <qemu-riscv@nongnu.org>; Mon, 9 Nov 2026 19:58:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 k8s1kli3QS4w6J4igCm2SG55neSxU1XlmvU6mXPmBLA=; b=F1BrHMFtx7oakTF+
 KpA9klvf9HyijTVJmqNT/N+RDuqiKMtsLAMZarhvle+k6UYU+oZ+yNuiwW9JXyef
 SA1VTEfqsMDjX+i2qj21LmO+eHKNRPETGDb60gf4JmPaF2j3ijkIUxoSRiGSbh9b
 Y9gHZ+Y0fMpkge+Y/N/6DF/6MHdSiM92Z3RArfNkAaN6ut7CvUqBZYRWqPkNrSFw
 L+fzkeq6OQgDh5dveXloBKLNltkWpOvtmw11sv84V9ZWhJx93L8Foj6fZ1XwVHpb
 TT2LUwf3It4G6hqk3N37jzNa9iQDxvmMfGb7FLHoy26rZjNGR2E5JCZNzKzzZve1
 EUiiBQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4humjg01n6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 09 Nov 2026 19:58:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-5364605e74bso35271321cf.3
 for <qemu-riscv@nongnu.org>; Mon, 09 Nov 2026 11:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794254292; x=1794859092; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=k8s1kli3QS4w6J4igCm2SG55neSxU1XlmvU6mXPmBLA=;
 b=fV6Z2hNbUEMMNbDbMsiSJ1XS4B4Md0h2Qyh44oIYyPyciLf/h0ht2qq2m+VmqUmgAJ
 nQSDDrsm89unEz82Ebnu72S9B6WesLmnU5vSvYWadfdqsO0YDgo/lRYEhg5sEKcqqWQU
 X4NWsjzJ4j8F08D4zqxUfmGTN/Uls+BeAcCDgfa/eyEVAYW/hJW2/kC/RUcypEU6S1zi
 gKcdp4pZVjJIJozZMhhvZcU9yucQDOJFGfCu4UkhGh7BE4lqjAIXCE0Y9tEtRMGcI7O3
 gWuCpAigfSoqpOJ+jg/EPGhO9c1kQw1eGm8I3oW8lhXZKylN5GMic00LwGVK0Zo2vb6q
 GnuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794254292; x=1794859092;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=k8s1kli3QS4w6J4igCm2SG55neSxU1XlmvU6mXPmBLA=;
 b=HbwJyRCpSlNwsE0PISi1UqJClQrobkDaafMCiEqU9A1LOVZs4DbT1b3/4RN4w+sa6t
 O4GPn9ARlLjDO+TOL5h8LSuhojWnnYB7wu6eYbYZ0mYMYby6p0R0SXOnz1SWaXaHk1t0
 IYfcKZGW/WMB40qtnQF4Al18ousQehUzahOUfzGz0qWIXo0EC5DnevkNn1+rJOchm8C4
 xXOmI86lE7NHQ1cUL4FSmdCsRoUN8IOK7uZTrEv8wi5wGWUhXoIxdWIZJbWopqruySCj
 cwyOA5KuabiPn8e6jBMB+zieu//OsOhibGRDrrk5dWbdOirOiFA4d5Z37LLZiioPqSAe
 2QVg==
X-Forwarded-Encrypted: i=1;
 AL+hErF+OiOXipFHKvRA2/MgDe9WdH72QH3NX9BrIIffr9U8G4nT/c2TM/T+ugVMpJtG0dX85ICMEV9/jQnT@nongnu.org
X-Gm-Message-State: APuU4Z9olKH9w7cUogtHLC4+QaB6JXH4AkQOyfUAcVb8fmM4Cu4HNfHW
 tP2gMaJBCXNC9gxtl8Wu80PyfpOfBRgj4AGGg6/le1UptI+bCbTNXea0XNLgVA0mvUUYB+N0eeW
 F6Ei5NC/Bk3d0KDLXZ4u3lMY/1tbL6c+jUGPdWzcB4nXgzma7NVEeZ/LnwA==
X-Gm-Gg: AYBFou24bZEkILgKvdiLEjvIwwu79HDygak/Y9E2XiBrV4rBJNWO+DR9403ly6T9U1d
 rVAGu2YkKdB7b897Nm1Lm3l98lJS2erJgzpss2xJYshbKN3wBBymBEsdihlcY4DiVUW6tm2woXz
 x9TdsccuBf6w5p7JSd472KyQGNzlyY81tZVDeANgl5LDop1O4/516ecUMqgA/gc4cac6ww3Cd3D
 hSjWJsOXyqTz0nrvXmFqAR6bPQhHTtWbuxnTkUc56lLtUPbQ/Dk740e3x8ELn1SCEgL/cSXoQEf
 qAc5sjkT96XeeLzv7mCcIyUTzo5scMiIjDnDbzZ4nOJFOo5BrcCjxyXWS/x4RSYD62mQ7lnNgvv
 wTuBL/Z/1E6PdEfUpDR4Klhe7tP4lAhI1iahgNEgmMWFHB2K4K6ZWX3xs5PHfK9bE3h2OWtzqlQ
 Y1e4Zbczlz
X-Received: by 2002:a05:622a:1247:b0:535:84e3:b165 with SMTP id
 d75a77b69052e-555257c5c5dmr8198081cf.9.1794254292429; 
 Mon, 09 Nov 2026 11:58:12 -0800 (PST)
X-Received: by 2002:a05:622a:1247:b0:535:84e3:b165 with SMTP id
 d75a77b69052e-555257c5c5dmr8197801cf.9.1794254291869; 
 Mon, 09 Nov 2026 11:58:11 -0800 (PST)
Received: from [192.168.68.100] ([152.234.124.231])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91ef04ceadcsm3785256d6.19.2026.11.09.11.58.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2026 11:58:11 -0800 (PST)
Message-ID: <4cad77b2-f5ec-42c5-b499-3d00d37dcc05@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 16:58:07 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 07/38] disas/riscv: Support Zvqwdota8i extension
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
 <20261104194155.679241-8-max.chou@sifive.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261104194155.679241-8-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA3OCBTYWx0ZWRfX7Of0387HFN0a
 mJ0Ad8NJkFR0yBhijvyRJYDxR7Qf7uKOJANX1I3tryNJ+iGAw89/XQXPGldK1QR73BIySI0G5yq
 k6ueW0VE9uJr0Scrnm9NhHULvvveLiLxbWx+artHva1RefiaUIpu50BE0pXh/fjnAVpg8RJ6xij
 33MrZS8ocWvSJU8O5BMtciNm2SXtGl94HUm3cC4RJO1gKohqpB/iXiWYSpXJKdEHPbIHGIX77ef
 nEy8Sc/ZFyVL1EXWTZPlzf6lpVltgzOTLbEiGbJElkLyMDsxmhbW9cF1ON3h/BMQOFROXoJr24O
 Bgl3TZ0+IXL52F3+ftb96lWH/40atc1Ti3YtAx1G7fTpATXHAR2oMjc0fyWSbWdpUfLMJJoKtfF
 YEh2PAIiU3XDC9JCpGsO1Eg5urRopRZuUmwEH8Hn9zWht4NQIR8Z/c/a3UaV9KgP5gXFb/P5MZu
 IcBIjhIpVFYPk0yzkgg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA3OCBTYWx0ZWRfX6JFT4wJbfztT
 LBy648fzZcic/BZ+Ft/LlNAqaBNAErKuIVm3vKBdyFxVNPdklYe0cXb2OtCWV8cvjvyM4NvqThp
 GkL9sF0S66cPmQtDQAzNflvjzxCg7aw=
X-Proofpoint-GUID: GoU7Mg6FFLr6H13hXL9a4iE5yAR_RC6y
X-Authority-Analysis: v=2.4 cv=B6gsQ+tM c=1 sm=1 tr=0 ts=6af225d5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=8elE1k/PHQNyZ14TNTodlQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pFyQfRViAAAA:8 a=EUspDBNiAAAA:8 a=9igOfUfchdEoLShCGswA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-ORIG-GUID: GoU7Mg6FFLr6H13hXL9a4iE5yAR_RC6y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090078
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



On 11/4/2026 4:41 PM, Max Chou wrote:
> Adds support of Zvqwdota8i extensions:
> - vqwdotau.vv
> - vqwdotas.vv
> 
> Signed-off-by: Max Chou <max.chou@sifive.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   disas/riscv-op.c.inc | 2 ++
>   disas/riscv.c        | 6 ++++++
>   2 files changed, 8 insertions(+)
> 
> diff --git a/disas/riscv-op.c.inc b/disas/riscv-op.c.inc
> index 425473ee61b..ec767ccbf8b 100644
> --- a/disas/riscv-op.c.inc
> +++ b/disas/riscv-op.c.inc
> @@ -770,6 +770,8 @@ OP(vnsrl_wx, "vnsrl.wx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm)
>   OP(vor_vi, "vor.vi", rv_codec_v_i, rv_fmt_vd_vs2_imm_vm)
>   OP(vor_vv, "vor.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm)
>   OP(vor_vx, "vor.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm)
> +OP(vqwdotas_vv, "vqwdotas.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm)
> +OP(vqwdotau_vv, "vqwdotau.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm)
>   OP(vredand_vs, "vredand.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm)
>   OP(vredmax_vs, "vredmax.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm)
>   OP(vredmaxu_vs, "vredmaxu.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm)
> diff --git a/disas/riscv.c b/disas/riscv.c
> index ca0d6e90b37..2acded0c915 100644
> --- a/disas/riscv.c
> +++ b/disas/riscv.c
> @@ -2634,6 +2634,12 @@ static const rv_opcode_data *decode_inst_opcode(rv_decode *dec, rv_isa isa)
>               }
>               break;
>           case 29:
> +            if (((inst >> 12) & 0b111) == 0) {
> +                switch ((inst >> 26) & 0b111111) {
> +                case 38: return &op_vqwdotau_vv;
> +                case 39: return &op_vqwdotas_vv;
> +                }
> +            }
>               if (((inst >> 25) & 1) == 1 && ((inst >> 12) & 0b111) == 2) {
>                   switch ((inst >> 26) & 0b111111) {
>                   case 32: return &op_vsm3me_vv;


