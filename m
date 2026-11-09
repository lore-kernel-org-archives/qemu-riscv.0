Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B2A606A321
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 20:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hauRj7DP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CYMWVzpm
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xQWB6-0001yy-Sq; Mon, 09 Nov 2026 15:41:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQWB3-0001vu-42
 for qemu-riscv@nongnu.org; Mon, 09 Nov 2026 15:41:18 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQWB1-0000Ev-20
 for qemu-riscv@nongnu.org; Mon, 09 Nov 2026 15:41:16 -0500
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A9HH4il4126853
 for <qemu-riscv@nongnu.org>; Mon, 9 Nov 2026 20:41:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 rwegyruWNDbAc8gKWDB9gDBWbC398ncuzPESfeeHOF8=; b=hauRj7DP4xJrbbEh
 9wXNXhcSjkSaTuzca5PdREcgkZEI68Iy8LHj+ArMIqHkW/hIP5w/286fY+oe/x3v
 pjDQe+ZtKr6ymjPM0eNSvrFSVb6CB8P5IEPnlGrHRLGgXGUuUYnP5uPzKPdaksap
 GzZsMre/y15iK2Cn9mS4wcjzZxbFBRnTL3zFoC3YCMmQnHIpJ39X7D5XyyooswWM
 UOKPNBhhH3ie1Xody3zEeEfU8HGe+nZkQ7TxNlOASdd1ho7AEuMXcwIi1RCQuuJV
 udjTS3dJWI0bHcsPBuwY9l6AHFbkPMVyAFFnPOiizMKQ6DzVhBm5kwZ72CU9mPHm
 MxUZUw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hudcj9ybf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 09 Nov 2026 20:41:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93cbf2fd504so239428485a.2
 for <qemu-riscv@nongnu.org>; Mon, 09 Nov 2026 12:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794256871; x=1794861671; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=rwegyruWNDbAc8gKWDB9gDBWbC398ncuzPESfeeHOF8=;
 b=CYMWVzpmqjo1ZKJqAPpsP4CZScjVbeQrsE6/CS7vMAGFpwksK8/xduviFK7wPXZzNk
 C18umOQ66dvyHPUfCSKF2VkUQI4HzoF774Cr2goBUv9Muadv0vojJRT9iGL9ux7PWjl7
 HlQS7UKiwcYAaiFILbCJnJzhMjX8212Hhwjv8yaIkF5lvC+JtqDVMtCo9Alm0BlauTus
 sADGko1H7kH9Geovn2Iar42GUTxwzta+OfFG2pPuB+qkvOq21y08rFy8R2zZYe/vwbXg
 DMGuOmUzovvTk7sglxqTQNd5sHEHp4mUWU0EObmuhKiDr8+odzbatACUQS/LQGPeCoMI
 oeRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794256871; x=1794861671;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=rwegyruWNDbAc8gKWDB9gDBWbC398ncuzPESfeeHOF8=;
 b=akjFiN5U2ohctStWy1oW1MCC90C2Q2pJCGZpm/SKbEn1feDPC9a5lGDGasiSdHV7ag
 KQ3uhvAJtCp8zhGDxwJJk5cM3Y32Zrzu0ssTAog2qcGXSTTJCe6/3m86zFi4q5GVtr+O
 5IwGQWMTRnqn461Y3AHwyQFtjLWEu8YI5uGh3iXe2rDslEthHwtUZ58aHDrRUYlst7u4
 P7LI+KZ79BO537OqkrW3y93aAj/1jy8Jn5Wa9oOxwghul4MdILcjbGDFKZxWJK09fX3V
 DYFz7RvLnQhg3LlBfFTDt6tc9/k+80q36uXExesIXCRv0UsM/1qGAS/I6wOhzX3Vbjl3
 aG4A==
X-Forwarded-Encrypted: i=1;
 AL+hErHF8gCS1dBZ3G3Fq3OV++U6QSKmb4TeJz4+GnDSelEkCDvRNM1rJMczNq/j72jkplG6ZFOuCjIEHaWX@nongnu.org
X-Gm-Message-State: APuU4Z8lTe6Eq/4LCeDik3/xacdqcZ4fREBUAtvYlPYXAICiEU1sBFXN
 Qz1f3zu9A4+cvuYwC67b476Dumk2N9OC+jh3ImQoO5OKhFCUJ2JNoY8YreCaSgshXtuEz7ztITX
 xOabeUpQltGwgzeDx9LHfzthQWfl4x65S/UDkyAtfr94U7CR5yLthK5kgG3fTNiNgDg==
X-Gm-Gg: AYBFou18apbjbsGqt7kXity+OTlM6w1t5OD2CPW/JTGyQDD/2kxsifsaJD6ZGVfVlr8
 hHxLoixuWjA+f4dxFMsgFRezhoBtTY59rXgbiMezWl1N5F7LR3uhvp/7w/pc8kgZ/YYw8ZXdUc0
 sD+yifIqqPHxlHjphc4W+JqvDRL2oJBvCxLJWLNDZjXb3LH0y1VzGPLt7D9HkoEkRZPrJhGpiiS
 Vq79cBBGLh9Br5RWcSU0nQpDWsiaYiY+yzkBVzZz9HJtCWIiXierRS5yuHJAWUhvl36/obzWJoR
 kyiXGUcqJ0VAArkVLipXnnK4bo8zPDhd2T1W80+J4wSzN8+PM68RLFYSfBUY3JLnUA77nheQGHm
 tgcKpSqyKDZa7D+eNB4AuuEhD1pf+wa+sJvoTqSrXlLDdP1EFtCZUzJtZEfvCjueFb934Yl/ajK
 qcjebCoAp1
X-Received: by 2002:a05:620a:1a29:b0:93b:fb3c:2d09 with SMTP id
 af79cd13be357-9479f3d994emr105873185a.66.1794256871446; 
 Mon, 09 Nov 2026 12:41:11 -0800 (PST)
X-Received: by 2002:a05:620a:1a29:b0:93b:fb3c:2d09 with SMTP id
 af79cd13be357-9479f3d994emr105870985a.66.1794256871098; 
 Mon, 09 Nov 2026 12:41:11 -0800 (PST)
Received: from [192.168.68.100] ([152.234.124.231])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9479e76b1c3sm60756685a.16.2026.11.09.12.41.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2026 12:41:10 -0800 (PST)
Message-ID: <687be5db-4101-423c-9296-9c58740d3e19@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 17:41:07 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 29/38] disas/riscv: Support Zvfwbdota16bf extension
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
 <20261104194155.679241-30-max.chou@sifive.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261104194155.679241-30-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KxNjOTlShXFdPBBq7mfaTMv-pLaNkDAq
X-Proofpoint-ORIG-GUID: KxNjOTlShXFdPBBq7mfaTMv-pLaNkDAq
X-Authority-Analysis: v=2.4 cv=au0nmiZV c=1 sm=1 tr=0 ts=6af22fe8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=8elE1k/PHQNyZ14TNTodlQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pFyQfRViAAAA:8 a=EUspDBNiAAAA:8 a=rfBBWanapOhiaCO6LbYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA4MiBTYWx0ZWRfX/xrVOtk+pvI0
 C6d/OM4NVO8MODj3efPErOdne+Q4K8Flt18PiyAFXo+EGuKQAqO3h7rqwAGRfftHhOmaui1k+5F
 VZv1w/HiIsPNYqY9KPMSnyPxmpvYBpE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA4MiBTYWx0ZWRfXz6SKGxmSDfIj
 asiJEfaBlrJL093Eiw3zG96muiMafHwQHVbFnJGB6UJDQDy/K9TzVttUMhU/YmZpr+xqfwFOdY5
 eQhdlJML3IyQeRM5703MIqh7I07WbQ8wu/IKmxGr1KSAUB2gDZE9gZP0oiBCozp51rIYKoIifU3
 7JFTPd704gT4fPMO1izczXmZXWCjSK2lGCsqGeBVjNcQtzSsHyoAZuxKvnNgaPMswYTu8HmErRR
 /O6U7GeTAEKmLzB5XsXMXbN9VLFhIBVeoU9Sn4tmUl4olk7NjVD4reI3JidWv+Yq3kIJcyT8Bx5
 LKNg1oOMX4OLdduuzJ1/+cIs0F68DY5+h1gBOb2c/ZyikLRM0CLOAa3lqsp0UfRO/tvn1M8eGmv
 YDVmNWdYJ+SEZufbGVKmOaW31jFcL4sr+08Uj8z2RGmJ7P/eAEFZsyli28K5QsxNkKGeI/h08tb
 Tl3A6fSZoxUN4t3X2hg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090082
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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
> Adds support to disassemble Zvfwbdota16bf instructions.
> - vfwbdota.vv
> 
> Signed-off-by: Max Chou <max.chou@sifive.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   disas/riscv-op.c.inc | 1 +
>   disas/riscv.c        | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/disas/riscv-op.c.inc b/disas/riscv-op.c.inc
> index bb01ebb8a6c..b24ffb45d8e 100644
> --- a/disas/riscv-op.c.inc
> +++ b/disas/riscv-op.c.inc
> @@ -608,6 +608,7 @@ OP(vfwadd_vf, "vfwadd.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm)
>   OP(vfwadd_vv, "vfwadd.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm)
>   OP(vfwadd_wf, "vfwadd.wf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm)
>   OP(vfwadd_wv, "vfwadd.wv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm)
> +OP(vfwbdota_vv, "vfwbdota.vv", rv_codec_v_r_ci, rv_fmt_vd_vs2_vs1_ci_vm)
>   OP(vfwcvt_f_f_v, "vfwcvt.f.f.v", rv_codec_v_r, rv_fmt_vd_vs2_vm)
>   OP(vfwcvt_f_x_v, "vfwcvt.f.x.v", rv_codec_v_r, rv_fmt_vd_vs2_vm)
>   OP(vfwcvt_f_xu_v, "vfwcvt.f.xu.v", rv_codec_v_r, rv_fmt_vd_vs2_vm)
> diff --git a/disas/riscv.c b/disas/riscv.c
> index 0534b8f4d64..af41c2204f5 100644
> --- a/disas/riscv.c
> +++ b/disas/riscv.c
> @@ -2647,6 +2647,7 @@ static const rv_opcode_data *decode_inst_opcode(rv_decode *dec, rv_isa isa)
>                   case 36: return &op_vfwdota_vv;
>                   case 38: return &op_vfqwdota_vv;
>                   case 39: return &op_vfqwdota_alt_vv;
> +                case 44: return &op_vfwbdota_vv;
>                   }
>               }
>               if (((inst >> 25) & 1) == 1 && ((inst >> 12) & 0b111) == 2) {


