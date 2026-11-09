Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D090C606A321
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 20:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WioLLSfk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cqC/k+im
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xQVma-0004kD-9g; Mon, 09 Nov 2026 15:16:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQVm7-0004aZ-G5
 for qemu-riscv@nongnu.org; Mon, 09 Nov 2026 15:15:31 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQVm4-0005fP-8V
 for qemu-riscv@nongnu.org; Mon, 09 Nov 2026 15:15:29 -0500
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A9HGwMN4125821
 for <qemu-riscv@nongnu.org>; Mon, 9 Nov 2026 20:15:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 RjqJGOegX5/uJL79YkLnvS00Rbfe765zlIAZdr54PVA=; b=WioLLSfkNTvOv0C4
 QK6ZdGi3ZawznYIiNzJYVLhJpU0qyY2NmbJfBTzT6RoCZmJYnpA8zkMAJc+0k/uv
 ykc+8/d69/3na18j7FOqb4JynoN4l8yHZd3RebeVV78KRkAZfQ+MqsO7O4+sKErx
 YCp7uDufWJXixnBpKt5Abkji5QpTfy6ztRiVkCBJFpnj74kIJPrdS6lAbIQb4U69
 HZ06aTmk0p4U0nWZwBk2G30HgCIWlsbILFfQ/6gLQTg31p3Ydt5JH1TxboNamK/A
 wMysWz4dahfUTjj3bqp3goGteFRtlFuIDZb0iqvX4E0FZrO9ych5CNLf4407IAED
 0OOGbA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hudcj9vwf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 09 Nov 2026 20:15:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-944138ed63fso216760985a.3
 for <qemu-riscv@nongnu.org>; Mon, 09 Nov 2026 12:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794255325; x=1794860125; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=RjqJGOegX5/uJL79YkLnvS00Rbfe765zlIAZdr54PVA=;
 b=cqC/k+im+jbxlJU0kAezLCT6FMuCDfnTpQRg0+AV3xqO3qArpXA+1oG6NIqpIr6/0g
 rH1H1HzVBuZAc+PPqkLVD1/yucv229Ejmn1ncMHNXObhQiVUtYPR3idl+PQzYLT1VwlY
 JNq3qBT3HUCMC9xn36iMWGjJe2lcWkDLticiHX/8Jta5fdQfddmuhZWH9FWoriMALWeS
 Dy1ErOpYbPbcNqlNG6jozHUpw8sFkgp3AP3CLvMCz0J+NLtUYWnOF4pNHSvRmN4ZN9UD
 d49nu3d8EMw0ogEsUjVMpWK0TcnXd6Nuc/LjOMm3MdcFR+zAfnX0XjFPRSfU6RsOxKTm
 rkeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794255325; x=1794860125;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=RjqJGOegX5/uJL79YkLnvS00Rbfe765zlIAZdr54PVA=;
 b=hxwj9A1m8XSF/G30B/kwdRg+OgUrJBxnC7MQ88Vpq3/6XppIyA7nvD8PahOMpmUYhL
 TVS+XtjmnxWHDMOCT9WC98Ebe5uugoiO6ohyj6YFuKSHzfzwRn+oUW8NuSnXUzd4T+nM
 LXylf1oqGLeg5fAr4FfUw9r4Jx/UFU9xQ8ERL9Gp0CwENMthrDSXt7yohxN+FeWmswpE
 wPRWzJ4sH06o9gtIJrTU9Zy6u917Vk5w/IcUXWwgFtcv3qaUcoj/WZrp67aEmTqCCvCt
 6djBpllwysQeim4JkUIt369tFgVLJJ4wFay7x9YeaKWtUPR5Ba4xuyB284ocx9Y8zHxX
 LylQ==
X-Forwarded-Encrypted: i=1;
 AL+hErGM2UVaWPdIvctiYHxYKHfY9ypDIc5z9zd+bX1vGUkAghVzHk+5HfCe81YmYjmAkTOZHp+/x5UmfAAC@nongnu.org
X-Gm-Message-State: APuU4Z/niLy/HTtFNUw/MJX0dCHIcb5tHe5m3GTnQAqBLjpdYmfh3SMn
 XBCtPJraiBD/LEecujHGgnxMPq8vf6Non/JzfKNBL9yUQchGoNbsdMmWpGzKfLUX8DB2cqCegjR
 isECmTdZMCPTWzc2eWR/+eaM3ZGXcb0u+7nWjvZccPFzwHpqPeudVTjJzeFet/NGRVg==
X-Gm-Gg: AYBFou2gjULON/wyP2S89UV0e+qsNVOvc3Haq+67m9OZa7hZiFX1SevJrfefpUS/wwh
 +3Ip3UhQyU3fdXPatTimjjyxeDzfyxMlH7bm5kQvWMqiqEC4QKfiUi85NSs0UyyUOwLoSgjvRBq
 dsms55W0X2BAXAz6Qc2ndkDSn2wIfVYTiw/bZz5wfwG0nteCeq3C81Xhs6Lc91aGAhrYb5mhij8
 tvOBaA0ttk5y4JfPaskZKZ1mtLswGQX9tl1Dlq+IrmeWKk/dEcveI0bbuc4EWW01VhvEzWKQGjV
 63oZsjh1er7ocGUY6WJ8ZJMcoYx84x0+DkZljdU2jTH1erHSw4IXzS3Pzpko3D52Cd0OFlMeWpV
 tBGdG6suaQF/BEcoQtjYBNe+i7Dz8pQxvMCWnkQP/nDsxxs0/2KMnViw3K0dEyFkpe9MkudtKCX
 27beO4QdjT
X-Received: by 2002:a05:620a:1999:b0:93f:2aa8:c549 with SMTP id
 af79cd13be357-9479f2f0980mr112261885a.24.1794255325203; 
 Mon, 09 Nov 2026 12:15:25 -0800 (PST)
X-Received: by 2002:a05:620a:1999:b0:93f:2aa8:c549 with SMTP id
 af79cd13be357-9479f2f0980mr112247985a.24.1794255324125; 
 Mon, 09 Nov 2026 12:15:24 -0800 (PST)
Received: from [192.168.68.100] ([152.234.124.231])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9479e61c333sm56890085a.3.2026.11.09.12.15.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2026 12:15:23 -0800 (PST)
Message-ID: <25b0b8eb-3629-473b-ad02-b9371eb08012@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 17:15:20 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 14/38] disas/riscv: Support Zvfwdota16bf extension
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
 <20261104194155.679241-15-max.chou@sifive.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261104194155.679241-15-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RlAIqVm_-0ltapKdBpyNbPViRchn4fr_
X-Proofpoint-ORIG-GUID: RlAIqVm_-0ltapKdBpyNbPViRchn4fr_
X-Authority-Analysis: v=2.4 cv=au0nmiZV c=1 sm=1 tr=0 ts=6af229de cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=8elE1k/PHQNyZ14TNTodlQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pFyQfRViAAAA:8 a=EUspDBNiAAAA:8 a=oBDotbn3GxYtm7rD55AA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA4MCBTYWx0ZWRfXysCRjuMRra0Q
 9J6iQI3cde4hdMD5JtExUa4l2m7ontLR2GwOktdxaGAi3faE9rSmuG+sdvF4+6EFXEbttv1uH3l
 qJlgt+Ht75lPNI/5iklifXYgUyJwdEo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA4MCBTYWx0ZWRfXxpL22AYJ5O3r
 W58NLkNFoEgCfN06H3Yb+SnBDp9T2ZKpQqDTkEVNyC7n2ghzb0NNcIX0nToeGJffKM7n0qJVUdh
 Ypg4SvnppS5Pwdm3uXxSPAud2T6snmpehdf/usi6HwC4GfyNElJUXDhNBshNUfkABZMnoOYoFDR
 j2OstwvlL2xhjILwavqc82sjZ+H5pzRIE4tjdXATu2xdmK3rPR+q+tP3y9ivrUZz+MWbPdNWn5e
 FHQHwMFFi7+E1vx+/PPz0Z07MXHFX58XlB6Z+E8ErqDSzUF82lDD2viMF+wZkmEsUZR++jqLU1m
 wrZtruvILpGpDIORM/JCv6QxpOY4it660hV7HDI7/OvTW4VSy5N8B6sCDvsjTcgBPpN8qPsvjW4
 9NbKVV61rEFn6LWJnqbaoCHro5c0gXe5rbBlha4IVGHVlUobrRlQabQzKehKaUckDZTXDtJNiSh
 oCvj/tBNoWx/qUQ98NA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090080
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



On 11/4/2026 4:41 PM, Max Chou wrote:
> Add disassembler support for the vfwdota.vv instruction from the
> Zvfwdota16bf extension.
> 
> Signed-off-by: Max Chou <max.chou@sifive.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   disas/riscv-op.c.inc | 1 +
>   disas/riscv.c        | 4 ++++
>   2 files changed, 5 insertions(+)
> 
> diff --git a/disas/riscv-op.c.inc b/disas/riscv-op.c.inc
> index ec767ccbf8b..aeb9423f130 100644
> --- a/disas/riscv-op.c.inc
> +++ b/disas/riscv-op.c.inc
> @@ -614,6 +614,7 @@ OP(vfwcvt_rtz_xu_f_v, "vfwcvt.rtz.xu.f.v", rv_codec_v_r, rv_fmt_vd_vs2_vm)
>   OP(vfwcvt_x_f_v, "vfwcvt.x.f.v", rv_codec_v_r, rv_fmt_vd_vs2_vm)
>   OP(vfwcvt_xu_f_v, "vfwcvt.xu.f.v", rv_codec_v_r, rv_fmt_vd_vs2_vm)
>   OP(vfwcvtbf16_f_f_v, "vfwcvtbf16.f.f.v", rv_codec_v_r, rv_fmt_vd_vs2_vm)
> +OP(vfwdota_vv, "vfwdota.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm)
>   OP(vfwmacc_vf, "vfwmacc.vf", rv_codec_v_r, rv_fmt_vd_fs1_vs2_vm)
>   OP(vfwmacc_vv, "vfwmacc.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm)
>   OP(vfwmaccbf16_vf, "vfwmaccbf16.vf", rv_codec_v_r, rv_fmt_vd_fs1_vs2_vm)
> diff --git a/disas/riscv.c b/disas/riscv.c
> index 2acded0c915..62feb4c653e 100644
> --- a/disas/riscv.c
> +++ b/disas/riscv.c
> @@ -2640,6 +2640,10 @@ static const rv_opcode_data *decode_inst_opcode(rv_decode *dec, rv_isa isa)
>                   case 39: return &op_vqwdotas_vv;
>                   }
>               }
> +            if (((inst >> 12) & 0b111) == 1 &&
> +                ((inst >> 26) & 0b111111) == 36) {
> +                return &op_vfwdota_vv;
> +            }
>               if (((inst >> 25) & 1) == 1 && ((inst >> 12) & 0b111) == 2) {
>                   switch ((inst >> 26) & 0b111111) {
>                   case 32: return &op_vsm3me_vv;


