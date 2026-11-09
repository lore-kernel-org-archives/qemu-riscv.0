Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7C3606A321
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 20:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c7UAdPtw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TmhFntAA
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xQWCN-0003vF-R1; Mon, 09 Nov 2026 15:42:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQWBt-0003UG-6h
 for qemu-riscv@nongnu.org; Mon, 09 Nov 2026 15:42:10 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQWBq-0000J6-HA
 for qemu-riscv@nongnu.org; Mon, 09 Nov 2026 15:42:08 -0500
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A9HH4Pj1525215
 for <qemu-riscv@nongnu.org>; Mon, 9 Nov 2026 20:42:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Ic06gkENK7FYwrAGOzINuDl/piIHOOKh8+hDLiik7g0=; b=c7UAdPtwL3wWsUEU
 EiX0aASC4keceMRQKvlXWddgPIwfe0nH6SuRycfEqbaXNo31lHXhLrn0qBNuhbXB
 qDanCcY1bg0IGbEqV3lONfX0PxZefwcAHFb7oFHdnIudJcDkrH5Fxzs8eJfJ5/Ad
 V5Njaol5pGRuANYFWwW/B4LDWkrFo9yjvUGyXIFztrRof2gdwCFXc7MNr35uFtGj
 61Vp6vrjmojsOslTpyweP9NWHkjUDbKCtq6JWJ2Pm549rBFe9PAkA8FI4YjgQvn+
 klbD32lIsEFkgPf15voM4D+6ZyOHspkFyOHybHMVI/uftORnxS7Ap+9erbcaNq5X
 Cl68rg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hufx81e0r-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 09 Nov 2026 20:42:05 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-91ea0c20af3so25317476d6.3
 for <qemu-riscv@nongnu.org>; Mon, 09 Nov 2026 12:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794256925; x=1794861725; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Ic06gkENK7FYwrAGOzINuDl/piIHOOKh8+hDLiik7g0=;
 b=TmhFntAAJe9OONU+4TFGWyNvObY2XQ/tB7bavOtyRUY82N++4FVYNZRQoiHb2sCnt6
 S9PxMalJ8r8FC3xotb/iLrfzGwrxit6PO8pXssvFSDYLtQqj32Y5E+otklm04jevvmxc
 IuaOIcVJR47S5MsK0Qin2o3OGGAlFn4urWzGelDXl72IVcvSjIKM6dsfbGu0eVstoLEk
 6U5fegAryKvTYMFvzFXwegOQDMeZ1FmN+SuOraXnLYqGpUETs8XSDLnCgFO3SfaJuxgB
 8HMGk85cX8//MYq6PcS2TKn61f9XS0p9V4K1NfFClHm/vZ22qB0X1GUUNJGng8SOUlS1
 YWPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794256925; x=1794861725;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Ic06gkENK7FYwrAGOzINuDl/piIHOOKh8+hDLiik7g0=;
 b=zoxPKO73wH00+y2kw/2uo+sDF30YBBO/33iX7eMu16oHVkIATiRvVOT31nTYR6yW9E
 w1WbDPUfhQ/K39a/sjYVQt2C7Pk+fxwr8jyUG+aaObUHM/oGeYJhtY1Gcq1PNqhka5xq
 KY2klD+aag9WyU6lmiP7CvshvGl3wXylHjsg6SfOiCofjnhfKYhQFxR3+xsp1/7FfrAZ
 7yfW6tJ1HENJ3H8W75HZIAxkMTAVNbYtm7NCmFr9NGKDVkUcikkTn8vGxCeHm/5mRhSq
 ouRES8E9r7TQ3RBUiwnmJM4ynbDjQPLNH59zW7G9lPkmUeeU/9u+eisFgHaF2RJ4tVNe
 SogA==
X-Forwarded-Encrypted: i=1;
 AL+hErEnusXYwTh5uJt0MP94uG5adLTl6IgvFoxUMzLGSwqzrARbPbZ/5Rf49NdDCPb0GZP2d3ZDzh/YSZp9@nongnu.org
X-Gm-Message-State: APuU4Z9NFDNpqF4eg9zFBC3ekBlQ3EMElkXOGI39q9KZe7UcxtIN7iHV
 JJV7Trme/giEsv7UhQC4ZgPFEkKcXi2uCIdPt6RNs2/QJQJF4m6UBrA0J05Zf7TfAXguVkujoFf
 Ak2uK3Pv/f5r/ZYEU7UNDBhZunc+JX23cNZsiBIoVY6Vfpw3liuPnOZiF9w==
X-Gm-Gg: AYBFou3MfXuR66EdnqWLbhNkYmuWT9fQAYiUDMDiYlpJETjx23mHceinKIvlADHn7tJ
 IkT0bymxIXEjpAgYh485tvPiJdpftWeohc01KP618AlyyD1RWA+klbJACKsK07lkI7264/F/DOv
 EQ6pVFnv7QeRJ0vPQCH8fXSOQ42/JZOnFyucNXvV9GuqDNZE2bfytMpFEQGYUUT3N/bigGa+h+J
 h12D0tpFMq1bIjjBk1itXsfY7oTFdG/vpj6heDpM0cgsfFWnqf/IcAnbezYKEbLAhp6U/Ec1GIF
 mDQkg7CdTXAkyoemAuEyVHUhtzhpAZsG+fxzu/k8WY+5LLi3EPTbZUx3l5HrC8BYt6H9SAKp5Yg
 7/kbSXbQ0cULmzPI6/go7H5rubFSZq3PB01j+bYOUJdtBaV9rERFF21SK/yjhIrYLYTChLnws9O
 e4W1W19Fws
X-Received: by 2002:ad4:5aeb:0:b0:91e:7e89:c8fa with SMTP id
 6a1803df08f44-91eef8cf4e5mr15086916d6.12.1794256924694; 
 Mon, 09 Nov 2026 12:42:04 -0800 (PST)
X-Received: by 2002:ad4:5aeb:0:b0:91e:7e89:c8fa with SMTP id
 6a1803df08f44-91eef8cf4e5mr15086256d6.12.1794256923859; 
 Mon, 09 Nov 2026 12:42:03 -0800 (PST)
Received: from [192.168.68.100] ([152.234.124.231])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91ef04ace42sm4697696d6.13.2026.11.09.12.42.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2026 12:42:03 -0800 (PST)
Message-ID: <f1c04ca4-8281-4624-8b93-b0b8943261a7@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 17:42:00 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 33/38] disas/riscv: Support Zvfqwbdota8f extension
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
 <20261104194155.679241-34-max.chou@sifive.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261104194155.679241-34-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AbYkjHXG c=1 sm=1 tr=0 ts=6af2301d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=8elE1k/PHQNyZ14TNTodlQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pFyQfRViAAAA:8 a=EUspDBNiAAAA:8 a=vq4rhS0DSI_N1f-mmVAA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-GUID: 65qWag-jpzFrmiCS5TltPqT-gKspKaFJ
X-Proofpoint-ORIG-GUID: 65qWag-jpzFrmiCS5TltPqT-gKspKaFJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA4MiBTYWx0ZWRfXwaRQks23tCBX
 QbJs2bK+YhNosS9ieDjqDexsoLe9WMlJG5gVr0Wqg/wxLJgPCqKM4Mla9BtLIq5sUw4Ob1+0SD8
 KKWD1hHYo6uBlry8wuKUsjaUiTmsRz4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA4MiBTYWx0ZWRfX+7lADZnHf1RF
 V6sDctG9UCgOv1oXVtJ5Pho9HMn1x88E37SNH+ssJc69+V7nmhnkftxvCz8u5SY5epbOzJ4kHdt
 rGeN/7RQ9QXgFKX49in1peala8cRGs+HZBPUGXXo7ilpYsdkB/0HsuqDDa6269Ete+wwcL3bybq
 B1DpV7/1rDZUkmd4f+XW9TWzvSSsObTVX7f9ApKX7hruSnotUjrPzaUxyai1lKguqrRFU5SSidt
 GpsDOSuZdO1r2w/oIbP61dFeMmIEJf5UBSUZ4ShXifzE2eEv59pv6M2bookZ67o1Ny+qbjWl4c0
 k+BzCBdcvyQYMxEIj1twdABybxjc70E9Pu5t4TASZvQkpPXP4ATN2DqfyPacuPvLhBQYWO2ZMp5
 NGXocBxtAQCWgaZqwLeVwkncjTOhDp4guUy1KvXYXvvk+eqUA7PBLeN+bSaybT1QGnCPcfONGLv
 o9izDz21G4BSj2zA6mw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090082
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
> Adds support to disassemble Zvfqwbdota8f instructions.
> - vfqwbdota.vv
> - vfqwbdota.alt.vv
> 
> Signed-off-by: Max Chou <max.chou@sifive.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   disas/riscv-op.c.inc | 3 +++
>   disas/riscv.c        | 2 ++
>   2 files changed, 5 insertions(+)
> 
> diff --git a/disas/riscv-op.c.inc b/disas/riscv-op.c.inc
> index b24ffb45d8e..58f6ddac35a 100644
> --- a/disas/riscv-op.c.inc
> +++ b/disas/riscv-op.c.inc
> @@ -583,6 +583,9 @@ OP(vfnmsac_vf, "vfnmsac.vf", rv_codec_v_r, rv_fmt_vd_fs1_vs2_vm)
>   OP(vfnmsac_vv, "vfnmsac.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm)
>   OP(vfnmsub_vf, "vfnmsub.vf", rv_codec_v_r, rv_fmt_vd_fs1_vs2_vm)
>   OP(vfnmsub_vv, "vfnmsub.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm)
> +OP(vfqwbdota_alt_vv, "vfqwbdota.alt.vv", rv_codec_v_r_ci,
> +   rv_fmt_vd_vs2_vs1_ci_vm)
> +OP(vfqwbdota_vv, "vfqwbdota.vv", rv_codec_v_r_ci, rv_fmt_vd_vs2_vs1_ci_vm)
>   OP(vfqwdota_alt_vv, "vfqwdota.alt.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm)
>   OP(vfqwdota_vv, "vfqwdota.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm)
>   OP(vfrdiv_vf, "vfrdiv.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm)
> diff --git a/disas/riscv.c b/disas/riscv.c
> index af41c2204f5..a124cbb4bbe 100644
> --- a/disas/riscv.c
> +++ b/disas/riscv.c
> @@ -2648,6 +2648,8 @@ static const rv_opcode_data *decode_inst_opcode(rv_decode *dec, rv_isa isa)
>                   case 38: return &op_vfqwdota_vv;
>                   case 39: return &op_vfqwdota_alt_vv;
>                   case 44: return &op_vfwbdota_vv;
> +                case 46: return &op_vfqwbdota_vv;
> +                case 47: return &op_vfqwbdota_alt_vv;
>                   }
>               }
>               if (((inst >> 25) & 1) == 1 && ((inst >> 12) & 0b111) == 2) {


