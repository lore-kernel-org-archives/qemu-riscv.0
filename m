Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6D7606A31C
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 20:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pL+bqXvQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KzqfnGCu
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xQWD9-0005yu-Ck; Mon, 09 Nov 2026 15:43:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQWD6-0005tk-8U
 for qemu-riscv@nongnu.org; Mon, 09 Nov 2026 15:43:24 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQWD4-0000b7-CM
 for qemu-riscv@nongnu.org; Mon, 09 Nov 2026 15:43:23 -0500
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A9HHAV51525332
 for <qemu-riscv@nongnu.org>; Mon, 9 Nov 2026 20:43:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vFsUNxzBgfxBRBMaTjPwOSduz2I1bYUHLab8PMl/5r0=; b=pL+bqXvQE/77n8FW
 mKtJsXtkDILeWLz2L7YNPG0dj4h4v7exKvoOV4bFL2RBOItz9JaKPI50UwU6Wx43
 989t54eM2aPhFHIanzosyaR/eoR4FH/14e25EXvrKG46U0A8MGSKjTlQuG/Mq1SI
 QkPMQJWtFUfJGk5YID7Jp11HsmJaX6k4AhyzihIylXUId0WIY62a/UVkxeqvgblo
 FdJYeAryhiqjaNFsh945UDcCGB/AAjODh5vtswE6+CXZBdS0FwEHL2MA6ch2XMgM
 dWWTCOlOgLRD53LNoSS+OcE47962QyVYUAk3gvOw6X5KXJwBk17aYRTlICPPMSYr
 HQp83A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hufx81e3v-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 09 Nov 2026 20:43:21 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-91ea0c20af3so25336826d6.3
 for <qemu-riscv@nongnu.org>; Mon, 09 Nov 2026 12:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794257001; x=1794861801; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=vFsUNxzBgfxBRBMaTjPwOSduz2I1bYUHLab8PMl/5r0=;
 b=KzqfnGCuIdWtxX7yYpoOfqq4DaAFECza/CLJU5mEezRbCYW6QIiEVsIsaqEb++3NlW
 zfvntzFZ4KKlMNesWpj/f8HXhl8ColC/wAkFxCYWzQv+8g5hV5yTDNQGWwz1TJlvg1ld
 bbAV7K6UzlkWhcfLr1PNC2rC0kUHqjAn/f3WnupBFHLD7XQdGpburUMXg+x3YGqncLxC
 E4uugfeRVyV9ZPsn30h3hGFEn3ugexa7k58EgoKTCDP925FAH0oWJGqIoSijM8sD6lFn
 IeUpRzlv+8iXeGOmXyffto/31OLQ7mwXfs/59fGm7qmhhBIAkxFnWoiKuKaOALXKqjHs
 eFBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794257001; x=1794861801;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=vFsUNxzBgfxBRBMaTjPwOSduz2I1bYUHLab8PMl/5r0=;
 b=hUfq0RVMcs7JzXHmyylMKou0DXp8kn2EXWM5b4s/pQxl2urzChLoys0qgOyzuYG9pJ
 CXwUuipkbC3F0QGXU3hHgV2r1qG5jaPKOdoBY+PXM9QVqS4AJKBqZElHbM9CszWvwKbh
 +25A4MyQntNYjQjGDJGlEjNboNZQ8QhkG6FCL8mbf6nF4/ZQcToco/XJ9OyeqNR4PImL
 qTpChG5pf/y98qTcLTbL7WKNn7vTorO+Sxeu9KKu9AUoeu9Bbr8X21f/AHToz4CgpLLY
 L0pjpIqTkelHuy8Ap5VLzp3XG5xitLduLnqdBocC8Lq/NYlTjCerJpnwMADeOOe9bovB
 rR/w==
X-Forwarded-Encrypted: i=1;
 AL+hErEeZe5sE8r4cZCxt55KvNkoRy1em8DvUQWboI7P+i7UE/SP/07BlyHE3TgmJnsS93uBldQP25v6vYYz@nongnu.org
X-Gm-Message-State: APuU4Z+pA42z02OGyxtPvVUutjaV1BcnBKB00koIg4c9XZRatsyYGwTI
 pb0et6ONOuFFftE+gaG575NgCYcXLHPsV1PgiK2Fth8AaSa7FFOeafOHzqnr75n2hGAW4ZSrvcl
 uQggC7kq3soF3Ig1sWhRDbZUJidAn/3DPf2FMN3tCHd3CEZC64tvDWQQKmg==
X-Gm-Gg: AYBFou0UOoD6z3nvdUgaPRGfB39tu1ZiV2kmcjDcQ8yCwVbCppztp050ih8TLZ1aQ4O
 URpdTRRM6Gflo5QwgwmQ6htB6xWHnTCYNL4+VgX8ViKwL2pW60NTgQptx/ABxUnhNw+3ltM1YJz
 BbMOv25Tqg0q0wRb4IuniEQsIebgqIDTjeMtTe0e6gOyTuWffB3dUt3+am8eNLSetj6imyN/KIX
 vt//PxYwxM1NffJNeE+Zd45OBErF3m24+zZGy902TW3aOaklp5TibyzkAk2GTMuJCSQGQbPbe2l
 x/eKb6lAA8llFrij/TA5Rc4oOo58YxPdxihPlhLZhuPPGh3lqNVMFvXU468i1PiGjdPJJUmVCgr
 IZGO51G9oObLUZJuOmrHz0YSzL0dUCva/+VLolbOhk8595j1eVr4MvHmu2F4+Sb/42S8Ktg0iC3
 Zqwr9OwyXz
X-Received: by 2002:ac8:5707:0:b0:535:2521:f07c with SMTP id
 d75a77b69052e-5552609b143mr9029601cf.7.1794257000795; 
 Mon, 09 Nov 2026 12:43:20 -0800 (PST)
X-Received: by 2002:ac8:5707:0:b0:535:2521:f07c with SMTP id
 d75a77b69052e-5552609b143mr9029251cf.7.1794257000319; 
 Mon, 09 Nov 2026 12:43:20 -0800 (PST)
Received: from [192.168.68.100] ([152.234.124.231])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5550b44e6fcsm6294551cf.10.2026.11.09.12.43.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2026 12:43:19 -0800 (PST)
Message-ID: <8510dcd7-3955-49d0-8975-b3afc6520750@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 17:43:16 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 37/38] disas/riscv: Support Zvfbdota32f extension
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
 <20261104194155.679241-38-max.chou@sifive.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261104194155.679241-38-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AbYkjHXG c=1 sm=1 tr=0 ts=6af23069 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=8elE1k/PHQNyZ14TNTodlQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pFyQfRViAAAA:8 a=EUspDBNiAAAA:8 a=YyB5S3pvMjFU-qa_WgEA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-GUID: k9glqg_2b9LKKzF3Lr_yqlPr1qLs8JAm
X-Proofpoint-ORIG-GUID: k9glqg_2b9LKKzF3Lr_yqlPr1qLs8JAm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA4MiBTYWx0ZWRfX9ZV8Zb04DbSZ
 kyO6OpnpK0slkaYHZwPg2bk99ikUZ4manOan+RFKqx7g32qaltjaRKgAHJs0ZOBP0RYslIJXCQk
 J8Hk/kg6OASNs5KHZuaqTMKxKg3HLZY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA4MiBTYWx0ZWRfXyu940MR9GVQu
 2nk4oUADIYmDtQAcJ+LXshDWIFXzQd4GL+DT50xUB7xkCuEWwA5PEV7I+M5QS59aK7I7D32S6JV
 lUOEZN9+kkgji2f40+Z83cBXXbr0ajQwsc2W9kRtY8HwUWd9uYP1JVIkq7f9kFkGnzK/n6PhoWg
 4jkoMBs4MOZqGgUU0/l60Y6PW5y8TUx7fzTd81sAKVC85okItnj8xe0sZM6zgupUpgEuqwC2wkf
 s3ELqld1bqIWATsTrm/8JXsnYw2MFgHyKQNkuhSg0tBhZQ+Ok1wOUggpEKK+Vc03yF/wq0QTqvu
 8UzarrFcFiTX6+gWohcfljolBk9YUn4DHEh2A5KZcER5xZZN803o4toTv5kyRpwFdjsN67S9QL2
 UGjTjEYv7vJIsEa61v3UpiRsAyb0UQCoFUWsAan2b1HpznHw6En60QbdyevDOyn0tgBf/9MC9es
 KWX0iZ6DpN88UBU3cvA==
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
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/4/2026 4:41 PM, Max Chou wrote:
> Adds support to disassemble Zvfbdota32f instructions.
> - vfbdota.vv
> 
> Signed-off-by: Max Chou <max.chou@sifive.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   disas/riscv-op.c.inc | 1 +
>   disas/riscv.c        | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/disas/riscv-op.c.inc b/disas/riscv-op.c.inc
> index 58f6ddac35a..779fc26a27c 100644
> --- a/disas/riscv-op.c.inc
> +++ b/disas/riscv-op.c.inc
> @@ -538,6 +538,7 @@ OP(vdivu_vv, "vdivu.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm)
>   OP(vdivu_vx, "vdivu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm)
>   OP(vfadd_vf, "vfadd.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm)
>   OP(vfadd_vv, "vfadd.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm)
> +OP(vfbdota_vv, "vfbdota.vv", rv_codec_v_r_ci, rv_fmt_vd_vs2_vs1_ci_vm)
>   OP(vfclass_v, "vfclass.v", rv_codec_v_r, rv_fmt_vd_vs2_vm)
>   OP(vfcvt_f_x_v, "vfcvt.f.x.v", rv_codec_v_r, rv_fmt_vd_vs2_vm)
>   OP(vfcvt_f_xu_v, "vfcvt.f.xu.v", rv_codec_v_r, rv_fmt_vd_vs2_vm)
> diff --git a/disas/riscv.c b/disas/riscv.c
> index a124cbb4bbe..8330ba34a30 100644
> --- a/disas/riscv.c
> +++ b/disas/riscv.c
> @@ -2647,6 +2647,7 @@ static const rv_opcode_data *decode_inst_opcode(rv_decode *dec, rv_isa isa)
>                   case 36: return &op_vfwdota_vv;
>                   case 38: return &op_vfqwdota_vv;
>                   case 39: return &op_vfqwdota_alt_vv;
> +                case 43: return &op_vfbdota_vv;
>                   case 44: return &op_vfwbdota_vv;
>                   case 46: return &op_vfqwbdota_vv;
>                   case 47: return &op_vfqwbdota_alt_vv;


