Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785D5606A334
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 20:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jUTY5i9t;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BmzbPO/Y
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xQVqx-0007Kt-BK; Mon, 09 Nov 2026 15:20:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQVqv-0007KX-6n
 for qemu-riscv@nongnu.org; Mon, 09 Nov 2026 15:20:29 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQVqt-00068s-HS
 for qemu-riscv@nongnu.org; Mon, 09 Nov 2026 15:20:28 -0500
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A9HHRPJ876689
 for <qemu-riscv@nongnu.org>; Mon, 9 Nov 2026 20:20:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 6reDuVj5y8a5z6eEUR4mOox+pRjZIbEHjck8wUX3gnY=; b=jUTY5i9tuxb7bHaB
 cjGuqPNskSg7PvKhFq600nTYucIm9KiZX9pWlxZ/crn/Bi3VbSAGLTfZcQXC7Mvm
 ILEZbAG6QVMbN+VhVqMl7tdgQv0sF8uhUxgZGKkBStik4kSa/YwMeXFSKBI/BXty
 F6PhlSnLYO+Bxzjt3kGxwfMV/kncOrX0CGiRcutq2oOFu1s+7jkyNbwhOAmcgB3M
 3HbVTG2GGa+Wt1S/Woc4CsnXFCV73TB6nKiOloCrKAmAC6zBWBiW1BdrNWZgzQGh
 3j0nyK32VHpuyOjzTr007C63fxRNZCyWgMjxgKEMqOZD6hPlyZvME1WfLI7DkCti
 /XlbgQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hudf59x36-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 09 Nov 2026 20:20:26 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-91eb16ea5c3so37079736d6.2
 for <qemu-riscv@nongnu.org>; Mon, 09 Nov 2026 12:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794255626; x=1794860426; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=6reDuVj5y8a5z6eEUR4mOox+pRjZIbEHjck8wUX3gnY=;
 b=BmzbPO/YORGaqoYX7BWLXwouGwr3oPQTxkcKGcve7HTfEi+LrnHvAjWJUvVKoHrk1P
 p7Aw8xkjWhpn5JIcALPh0XwtgR85kbBCDT0MOsQVZcCmXS1dZalouOfa5FFN3VFWXZYD
 uHcwluM0fTmld0NgchtQo9u18667L+k67kQZA0z9KjXUfAlVOgL2+gIqWbLLX2O/SyNt
 W64INAVImA3WwjzXx7P66f52o0+bwYke7O4qKPcHMUeC+0Y0OSiwrQo9eoR1TuXTv1Dd
 NGTlUqNdEKGNOsNhy32LEllR4sc/PWR+205EpNn27Fr5mt8HRJ8MMccSAkxTZ/HtqC3k
 IZhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794255626; x=1794860426;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=6reDuVj5y8a5z6eEUR4mOox+pRjZIbEHjck8wUX3gnY=;
 b=EoVp0F4c6r7XedVDGsXaBoM6SSdSPTplG5r9TKzQVdzRhGIKJxB5qjN57vIBL5rRkI
 7KooUoeD2V+fypiSvLfSQuvfAvGKNwx2QDjYgdylnBPyXsnpb0bGRzajwB/LNIuCQtRl
 Cd/3JcJul2Mnt+pBx/fC7ub3fGaK2NIFDep6pDPbedxB9D3QkneHrbsvSLwx3Urs/x0z
 X/NnwtYDmhszhezsbIzH95A5jybu16yuONhAdPvaHaXHqajydNuWsw26cZ9C5eDrceMW
 jaRD1JgSIaQdzSC/SXBQbd6LtApuodL4iats2OGKebzfBJshqhoL4ryBOy3NP8n8hIVf
 qiAA==
X-Forwarded-Encrypted: i=1;
 AL+hErHScVVpYAFgOKdnP6wrPILVLXs1KxDaeOBrzxJvmMA167Ec0o8c5WqxM6g4bKq/CAH2q4Gy9ZBy0F14@nongnu.org
X-Gm-Message-State: APuU4Z/GggzvQFX1UlGY7rMexEn2sJfPi8iRU6Yd5l3z6OIBqvdATrq3
 RA+piR35RZXg6FT96vwyIRwYMMzJE2gKchh3xUKRI79Nte02GtjeQQKtdhxKIb1Ufqdn2R0xGLp
 Pb/g7rDWgjKtH6c0l9jwCAUi6Z2D3mCbh/w23YOnFfB6IMbjR6/S8hYWZkA==
X-Gm-Gg: AYBFou09N1Zm3AqvSCk6OOx4bCDxCtZBj78zx2DQYtsKAElULrAG3frwjS5UXehHbjK
 OwF24ai8/lhjj+hkcVaxuegMDawN2szXVnbIiLaFwOYVg05P0Rm09DkbZfqE1Dx952/un3bF6jE
 sm1wrbhDxcE6oZBNyE5iXETAmCvrShfUBkR3U2DFMztUUYvThQMIeFcGUbdeBxp3OTJ8A7Afdyi
 7nZwbMWW/Q1jpQKqt+vwJ5CitUwgZtQ1FjikK73BcAdAzCaMV/OpwjlHRn4q1Lbi9lObad1dNE7
 f1wKms2HMmPzRxM6LeZ/9uBsr4bJDGShBKZpzUAGQRTpHfILC4IccTW9palYrlFF5bcML+ptpT2
 SJXL9tVfWoFTErm/x5SZl0kuO9QCud1J1IWYmz1GTRQlje80gIpwIMA/w9G7Xaw1ITY6wvPMwOk
 JrLON3Fx2M
X-Received: by 2002:a05:6214:8403:b0:91c:7c1c:da3d with SMTP id
 6a1803df08f44-91eef8662bcmr8858826d6.43.1794255625681; 
 Mon, 09 Nov 2026 12:20:25 -0800 (PST)
X-Received: by 2002:a05:6214:8403:b0:91c:7c1c:da3d with SMTP id
 6a1803df08f44-91eef8662bcmr8858526d6.43.1794255624986; 
 Mon, 09 Nov 2026 12:20:24 -0800 (PST)
Received: from [192.168.68.100] ([152.234.124.231])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91ef052383asm4045306d6.35.2026.11.09.12.20.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2026 12:20:24 -0800 (PST)
Message-ID: <29e5d5da-efc6-4829-aece-d9f516179b0e@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 17:20:21 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 18/38] disas/riscv: Support Zvfqwdota8f extension
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
 <20261104194155.679241-19-max.chou@sifive.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261104194155.679241-19-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: tql0LnklfVWmuki2uTVXoYekDugYG3lJ
X-Proofpoint-GUID: tql0LnklfVWmuki2uTVXoYekDugYG3lJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA4MSBTYWx0ZWRfX9GIn4Llw0hwJ
 HpSJK7gzpeq7mpPlrsMdgiKGuJSZy+D+v3IBaW8g0gncxgAgN/pnA5yAKEjS/J9ISgibEYJ9HvH
 wbTqmp4hyvQ6Eas//sZ/ntoAmJ+crS8=
X-Authority-Analysis: v=2.4 cv=bar+w+PB c=1 sm=1 tr=0 ts=6af22b0a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=8elE1k/PHQNyZ14TNTodlQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pFyQfRViAAAA:8 a=EUspDBNiAAAA:8 a=JQTPU3wg1eTVZYZx9qIA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA4MSBTYWx0ZWRfXyYeE97XPJiSd
 yVtTEEL5yQjVefePehImeltLa02mvwhaBiUuHWknlHJ7ADReflQU44LRbYlS3tak/hP8kuK89OF
 I/FO+UgN/3eca0MlbSGplGAjQ1GjfKiejofHIY4Juvb90yVZdJgNxd1qsyA0EF57hJVhd0F9yPq
 dA4/jZNdMLhyr22y5hxAn2m2eXE+nhfTFQ5zuP7IW0o6pTClsHWbfSm/q6ARZWTkCKeI6L93MGp
 AynrU0V5blMGnqCBFfMuGF0/MIloVoIDVAyhE9tzVdDd2ej7TJP8Wz7V6JZD550H7pyQvQAVk76
 if/djyBrzgVOi3juNBGbiHEto07iSHmIn1d+gd/D7QQgRYDyYuXiLiOVLPhhcaJ7SrH4qxJgSpP
 PSq4Wf8qRJTKE3R2WxAUgD5rNdNcWEt4pCUwxxlAWQjtP9fA0mb/6PhQ6lvOLrN8xdQga0BaWOu
 COpErBYfLLlW0Gh/RpQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090081
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
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/4/2026 4:41 PM, Max Chou wrote:
> Adds support to disassemble Zvfqwdota8f instructions.
> - vfqwdota.vv
> - vfqwdota.alt.vv
> 
> Signed-off-by: Max Chou <max.chou@sifive.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   disas/riscv-op.c.inc | 2 ++
>   disas/riscv.c        | 9 ++++++---
>   2 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/disas/riscv-op.c.inc b/disas/riscv-op.c.inc
> index aeb9423f130..5ba29f52976 100644
> --- a/disas/riscv-op.c.inc
> +++ b/disas/riscv-op.c.inc
> @@ -583,6 +583,8 @@ OP(vfnmsac_vf, "vfnmsac.vf", rv_codec_v_r, rv_fmt_vd_fs1_vs2_vm)
>   OP(vfnmsac_vv, "vfnmsac.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm)
>   OP(vfnmsub_vf, "vfnmsub.vf", rv_codec_v_r, rv_fmt_vd_fs1_vs2_vm)
>   OP(vfnmsub_vv, "vfnmsub.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm)
> +OP(vfqwdota_alt_vv, "vfqwdota.alt.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm)
> +OP(vfqwdota_vv, "vfqwdota.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm)
>   OP(vfrdiv_vf, "vfrdiv.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm)
>   OP(vfrec7_v, "vfrec7.v", rv_codec_v_r, rv_fmt_vd_vs2)
>   OP(vfredmax_vs, "vfredmax.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm)
> diff --git a/disas/riscv.c b/disas/riscv.c
> index 62feb4c653e..0f609cc06b4 100644
> --- a/disas/riscv.c
> +++ b/disas/riscv.c
> @@ -2640,9 +2640,12 @@ static const rv_opcode_data *decode_inst_opcode(rv_decode *dec, rv_isa isa)
>                   case 39: return &op_vqwdotas_vv;
>                   }
>               }
> -            if (((inst >> 12) & 0b111) == 1 &&
> -                ((inst >> 26) & 0b111111) == 36) {
> -                return &op_vfwdota_vv;
> +            if (((inst >> 12) & 0b111) == 1) {
> +                switch ((inst >> 26) & 0b111111) {
> +                case 36: return &op_vfwdota_vv;
> +                case 38: return &op_vfqwdota_vv;
> +                case 39: return &op_vfqwdota_alt_vv;
> +                }
>               }
>               if (((inst >> 25) & 1) == 1 && ((inst >> 12) & 0b111) == 2) {
>                   switch ((inst >> 26) & 0b111111) {


