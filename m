Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 190B9C5AC7A
	for <qemu-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 13:50:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wsKxM-00005F-WE; Fri, 07 Aug 2026 09:49:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wsKxL-00004x-9C
 for qemu-riscv@nongnu.org; Fri, 07 Aug 2026 09:49:51 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wsKxJ-0004Cu-P2
 for qemu-riscv@nongnu.org; Fri, 07 Aug 2026 09:49:51 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 677CgeIU2152870
 for <qemu-riscv@nongnu.org>; Fri, 7 Aug 2026 13:49:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ptG+R5WOI7mZhPG8VO1W13KcTCcjMb5jfhFBj425/F8=; b=jzihxCOtW6fXYTSZ
 F5iu0QtVzIrKxD8jGPwrRXkS9f4GeE4AMFiW+q0ZGgxIKtoATwbWgggh2U02ERbe
 R54olq162qpdBs+FjyT1qlDtuZrOcFPaYR3YoucTK/MmYnf/VAQ1rNCGsaXLcc/2
 AhqqmKaRttSfof7nVvG0c2WNgEmwJW11ErVBrkK9ipRcrnM9Em6nAdHMKc/fDlr+
 Qb15Ay0x7NFLUPwEb86AEibFDTVb6jdJ5m1q3FrH+hR22pyzrZV9nAPy9vTNKgXo
 TUIA/T4Xc2Al/AWa8/k7uc5UYIzMWwoBBlAP8p+W+v44+KdKl35ljLyHH0woBgaU
 ye0x/Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6rc4qw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 07 Aug 2026 13:49:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-92e8004d60eso585327685a.1
 for <qemu-riscv@nongnu.org>; Fri, 07 Aug 2026 06:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786110587; x=1786715387; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ptG+R5WOI7mZhPG8VO1W13KcTCcjMb5jfhFBj425/F8=;
 b=Ub4pl8jx24VL36RPdqtUDPbHt9v7Ro7KjlXtW8LmCPBZE3j+EvEG6woCY9wQJTbipV
 qrQ9dXcLfJfJKoz6kbTb72wXEKMpZzCIXADnEzIxas/Y5YSOEe7d5XHRyNOxKuBtYlm9
 eLxm3NMOfSNoRA78yqqHK5gjUmdDLTN0t+CQ6XxfnPF0DNCTNdi4xMTyWXaJ7afqb9DU
 cMn37lnc+SgS/FTT/MdRyWqqUTW7sPJKPOs2Q61Qpj3Pi1kyc+0f/grw+MelDm/10Urh
 7tL6yx4wSqquGGQkxhqoLSMO94hDIGDPEZFYfYYkc2kq42135SXaQF17EmoAv3hTmKAa
 aW+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786110587; x=1786715387;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ptG+R5WOI7mZhPG8VO1W13KcTCcjMb5jfhFBj425/F8=;
 b=raCqXgLNSWqyqjpONd8f7qC74ueEZ65Cq+8n8G9GBWgWhFWlvguPvfWuc2XuwkwPhJ
 7FVqqO8T9XV6EtBDCctWsirPgBNV7t1FutzjFLqAKaVHCGSOiChbdBSKXBNwZxSptj1Y
 ohUGbVeyT8LFPFI9gj9TY/+7q7sAnhX2Ukg+k1lCseILxWn1NkJ6K5wLd//ILaY8JWGx
 hyqPrSK7GuFCEDDVD1IaYhKXa50JcWYIfK7RVPgP6EwWu8/vwW3xw2/33EnsO8fc88nv
 ArSLnTehTRsc5gUr3tRHFmLySWR+WnISe4D8zjKagEcy7lG7j6Yq1JJHPO+qCoFSxWcc
 gvKw==
X-Forwarded-Encrypted: i=1;
 AHgh+RosPcPPqPxpgFTPuBkMqT9lKJUpkDxIhbAwFln54iWBo9FGNPzcc4Wl3QOcH2vREYqcVD4dtNM7P/64@nongnu.org
X-Gm-Message-State: AOJu0YxWHiKYa04HfWiTNYPCRPUdJsJGRoWW4wL+poNqQEO6CSFWqtFI
 8K5BhuhXCM8GnMecr8pwgVJMRYgmTGJIKGpfhLq0kvU0XoS7e5ezb5jfsx024C/KegFuWao9VrH
 g7Tmm8LJMpeyjPfdLkgNfuxKG4zy4npG+ki1gcPgtSgAw8Y/LhyNVW/bW4w==
X-Gm-Gg: AR+sD10eTXPTxFfcJMgkzwkfPs4VJ2cTl8DTyboiGEmp6sMZ0AigpNMy4APlwOf9jS3
 xw3POUlksiDLBbAZwtmDaAsD+7STQqh2KZcu3ozNHxpp9fn5iXu9Rr7AceC/zPbxzE/5ssTrHN2
 xf39amc3PuxeNwHBSsxtYZIvu4dxydDDe5l684MRsDtwJr37IcHmyuJjMcNrK+mhcLs8PBRn3Ri
 rOx6T9MVPZW3jXJVQR4kAAeq4f83VApSD/aBt1m8kf8/POG9DtPOKVFicJIDqqGBWcFdnHQXxJs
 Jt4zzGcqtorHTjnMhd7BWfMilIT0lvaf40I/T62l2IkG6nIXX/ZLNuFFMcR8zq3bXEmwTIQtlU+
 5fU+iC8FBXKP2HKi59Ds5+rehMXWRR/4YOZd7
X-Received: by 2002:a05:620a:29c9:b0:936:5771:2b42 with SMTP id
 af79cd13be357-93666401242mr1022235585a.10.1786110586964; 
 Fri, 07 Aug 2026 06:49:46 -0700 (PDT)
X-Received: by 2002:a05:620a:29c9:b0:936:5771:2b42 with SMTP id
 af79cd13be357-93666401242mr1022198385a.10.1786110584040; 
 Fri, 07 Aug 2026 06:49:44 -0700 (PDT)
Received: from [192.168.68.104] ([187.11.154.152])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9366e28097bsm149753685a.39.2026.08.07.06.49.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Aug 2026 06:49:43 -0700 (PDT)
Message-ID: <a26fb578-54bd-40c4-ab4f-59ee61f3c843@oss.qualcomm.com>
Date: Fri, 7 Aug 2026 10:49:40 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/8] target/riscv: Add Zicclsm CPU option
To: frank.chang@sifive.com, qemu-devel@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 "open list:SiFive Machines" <qemu-riscv@nongnu.org>,
 Max Chou <max.chou@sifive.com>
References: <20260805164345.698208-1-frank.chang@sifive.com>
 <20260805164345.698208-2-frank.chang@sifive.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260805164345.698208-2-frank.chang@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDEwOCBTYWx0ZWRfX6jvqLMebfDyY
 MB5DjkryLntFgX5ZECx/6gbh8OMy9+zNPhY7yQmFB3N49M5DhMnaOURKGxU5X+Zcjzkb16UwGWJ
 VwGQ/LnQ0lGlre6QH8ORpiL2jIGzt0BKroOFMogFeq1R8eX1KGh9d+HDcCydT000N2c+uqUIeVS
 WAGZGy0ceyuyhtKOqVKbr+HwvnxNIUxNVqXjz1WUwkl9vEG1ElU/g01V5pdCTRdzoCapWOtpuV3
 9/Xwm9l/oNoIjt/3WQjYK3eackqg6okLs9nxxO2XmWun/BL8x+uoD1qKwxTv94Dvt2n+zDfT4D0
 iFoYCBeztV4AC9U4ltlCKQBX3hNrwSBfe5zhLmaUQ1hdnKxjM7pYEMplsycS7z5tDVhMcO0oKQo
 vdBGxVpDj7D3zo2fhouLy4qWACgBJDbhPn66/VUP+JgeoTyu3e8XcweDkZHHovY4v7z9/oF5MFc
 Z4Tmzkwzb8FHOc31fDw==
X-Authority-Analysis: v=2.4 cv=HPXz0Itv c=1 sm=1 tr=0 ts=6a75e27b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=iMfxv9gflPUPBcmW7/Gq5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pFyQfRViAAAA:8 a=JF9118EUAAAA:8 a=KYMhUjEZWClA7Ab8mSAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=oJz5jJLG1JtSoe7EL652:22 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-ORIG-GUID: rmuTAH52fx2wpeqzEtjbpe1aM3mfVRqb
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDEwOCBTYWx0ZWRfX/7cQDR9d3QGD
 jnGJIz5Zgs8hE2NW422ru6QCxDiBBGAHoliQD1pa3JwFXcN8rx0C52OtKLJO6aPFM7sSHhhIEaR
 LvM7PRmOz9Mt0v75iK29hQzOUFaF2Dw=
X-Proofpoint-GUID: rmuTAH52fx2wpeqzEtjbpe1aM3mfVRqb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_02,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608070108
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Hi Frank!

On 8/5/2026 1:43 PM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> Add Zicclsm CPU option so that user can turn on/off misaligned loads
> and stores support.
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Max Chou <max.chou@sifive.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>   target/riscv/cpu_cfg_fields.h.inc | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/target/riscv/cpu_cfg_fields.h.inc b/target/riscv/cpu_cfg_fields.h.inc
> index 9eb47af0a76..f8c27a574f8 100644
> --- a/target/riscv/cpu_cfg_fields.h.inc
> +++ b/target/riscv/cpu_cfg_fields.h.inc
> @@ -139,6 +139,8 @@ BOOL_FIELD(has_priv_1_11)
>   /* Always enabled for TCG if has_priv_1_11 */
>   BOOL_FIELD(ext_ziccrse)
>   
> +BOOL_FIELD(ext_zicclsm)
> +

This is a needed step but, as is, it's not adding a new CPU option for users as
the commit msg says.  This is being done in patch 7.

I think this change should be squashed into patch 2, where ext_zicclsm is being
added in eligible CPUs.


Thanks,
Daniel

>   /* Vendor-specific custom extensions */
>   BOOL_FIELD(ext_xtheadba)
>   BOOL_FIELD(ext_xtheadbb)


