Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B4A606A332
	for <qemu-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 16:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TwiN9Ef/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iO38jR41
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xRtwJ-0005SS-48; Fri, 13 Nov 2026 11:15:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xRtvQ-00043H-2k
 for qemu-riscv@nongnu.org; Fri, 13 Nov 2026 11:14:54 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xRtvL-0000Q5-Pv
 for qemu-riscv@nongnu.org; Fri, 13 Nov 2026 11:14:50 -0500
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ADFRJOZ1725104
 for <qemu-riscv@nongnu.org>; Fri, 13 Nov 2026 16:14:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 10wBZ4jugaWTdlgb2PVN8d/4Oy+nrxG79emfL0q6Izc=; b=TwiN9Ef/zyY8nVFY
 h0tqRpdaVtm9+n8Edv1wS01AOWyJe6XIcStuDPlxU7aQXx0P4c85ipum+eneGOG3
 YjN2F4bkW1bFK6tIgAwoGZ1zuXEkWbkGoaIxsbLhAtIrMWqYcpA9YAAcBP1T2vj3
 qXlUGECCGOJtJMV0EMGo8+z5b0axm9IiMAFmKAoufdWTa3Ayj1x66ddI/EN7Q2az
 kfW4OKw1QaufVMyrKT/bbJlEyEN9/co+2wQJ/sjNHU6AYZ++35bkrBKj0vWAruV0
 FghSCZhMgjix91sP9rssI76XbCKMA4vPzpxTGpwlZyUtGd/YmpKuSHYPZWXyS97m
 ARh/zw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hx1bp947n-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 13 Nov 2026 16:14:45 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id
 ada2fe7eead31-7d2dd8c5aeeso183961137.0
 for <qemu-riscv@nongnu.org>; Fri, 13 Nov 2026 08:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794586484; x=1795191284; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=10wBZ4jugaWTdlgb2PVN8d/4Oy+nrxG79emfL0q6Izc=;
 b=iO38jR41nwfLjySr67oyEM8DYWf4tBmHvtWMNoxELxIomBlKeYSsIHGQcY8n06Dr7A
 rbnA9b8FQlfhnNXKz88VHKGAp1+7E2LzzNPweJpFktx1x1ueGLdL71rEKaz05PXza/5z
 3yF2MgvQOdfHCaPuGmsre0D7LKhd2EPDKqJmkGvFmm6CEq1hn9HPcAKgH1BrNDXH0lVH
 iWbhatwnQVCZtBBEwKTdSon/58Iy8lElN5FNCpt/TASA10A3Q+kvDqlzEHOZahCmCONs
 UNATjQz8cLCaJEZCZCgpVG/lNUId59aKK1Zn7EeAzgL+N79YGskWfQaHslcecR8qschy
 5+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794586484; x=1795191284;
 h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=10wBZ4jugaWTdlgb2PVN8d/4Oy+nrxG79emfL0q6Izc=;
 b=xTYpH6Nvrx/pxVKG+weQhrDxnoBeCZNTGMj+Lh50nHZU7P2PANN5NwVoL/AgC/ChHX
 jq3w6XkAR7xeOQRhUhW++WCz3J4Y31rnR5wxAST+T/ytmRq/jUcfRLGMgUjP9QBlstXw
 8VOl71C8B9wDSh4F6y7aK0pcXj6SE+kPo8cgBVzPsKV73vTHGPErqq87BmO1PY4Hkh6y
 LAjLkUzq9gjBrSYAdQjMXD9BkEjSmqiG8UTyHtPlgrAs4kjv+kLlp9rfnyXv50PRNU2A
 25qYE9Pi/9BVz2NFBja+BC4sMF3mjvSaWBiujbeGPrXCpITdw+yXGB4tXOU/aTXelNcx
 KKrg==
X-Forwarded-Encrypted: i=1;
 AL+hErGHXjEImPCEVdrzkNu5M9l+WhkmyJM5UwUJxkQ1k95T3UH/Fyc5IfO+Ui5Fuc5r6VIuloF9vnqX4LxA@nongnu.org
X-Gm-Message-State: APuU4Z94TLVINRo+JuNcmqx3mRU5xJCo3VW+pHNVeLSybew7i3vVeKBW
 NbEsqSt5zyFqedSd9h9QUt4mF8kVrJESPRr6iQW2PN2grXR5um9/iAR/GCJAXAqKR+9/CiMs7Ep
 GNMkc0FXDLZfVxs/Y80yAe9kbXxkzOWAidoKDkUn/ZwVZXIQ2QeRtwhkE+g==
X-Gm-Gg: AYBFou1P759uQna7iSu4f404YiiuHemjlhOpvTOd4MLzVggVtucB4Jn3n7blXxg9LgA
 iPhO227oR+lthUYtR05OmKp0VQDCfs+nOt7k+VTaX7v45JNyillStDwX3AdVp3R3R6DCOU/Eqaf
 2ysjMzeL1ucJrD2CSeIwJyzf73BUpivHpgJT8kQDCVrN58Q8OMzCw4uMCT0mUoDoMN0UkW80kri
 N+KWCnENEeYA+qx1hRV+E1gbAauHzMz9A6hrWaCqGpomQdGvwN6Y5jS2LjCCCP0zeiKw+RBytE1
 IxeENoJOiczgCFtdYkNaaNQqF/b+3WupuiDq9yegHnC0is1hKF1hQuIvRstD9r6gb5FInx/3dJa
 Zz95N719DdqWiSGuT3Stf41GEOhoLRUEeODYs+Wf+cNaHaWPA6Sz+HrvM6GPspRNfZWIdwcCixo
 8KvI3e/o0=
X-Received: by 2002:a05:6102:c86:b0:7cc:2daa:90ee with SMTP id
 ada2fe7eead31-7d64d74eefemr957151137.15.1794586484498; 
 Fri, 13 Nov 2026 08:14:44 -0800 (PST)
X-Received: by 2002:a05:6102:c86:b0:7cc:2daa:90ee with SMTP id
 ada2fe7eead31-7d64d74eefemr957136137.15.1794586483915; 
 Fri, 13 Nov 2026 08:14:43 -0800 (PST)
Received: from [192.168.69.234] (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb56f8d054sm43390645e9.3.2026.11.13.08.14.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Nov 2026 08:14:42 -0800 (PST)
Message-ID: <48687730-c5b5-4bbb-a608-177713707e88@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 17:14:41 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tcg/riscv64: Fix vector constant matching for logical
 ops
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "aurelien@aurel32.net" <aurelien@aurel32.net>
Cc: "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "daniel.barboza@oss.qualcomm.com" <daniel.barboza@oss.qualcomm.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20261010174742.3552498-1-aurelien@aurel32.net>
 <9ca6f711-e886-46a5-80ea-a6c750696a93@oss.qualcomm.com>
 <auEeif_51q1K9XOz@aurel32.net>
 <d230ae93a44b63138389d07c355c2e8d3154acd7.camel@wdc.com>
 <548258ad-0e51-458a-827e-6b9c7d0f15d3@linaro.org>
 <fa097440-d725-44e3-9753-a6d500d50f8d@oss.qualcomm.com>
In-Reply-To: <fa097440-d725-44e3-9753-a6d500d50f8d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=W9ytxhWk c=1 sm=1 tr=0 ts=6af73775 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pkvQYlA5gn_oJZ00GtsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: U9Utmi4gay3BX_4N_Z-ZRd3gzOQCa7HF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA2NCBTYWx0ZWRfX3pHIZdias0dd
 +sdSe41ujvFhendjvlejEbtTSyf456Z1pQy0XYXMLm0yJf1x1cjDauC5Fr5Ki+scpSG59CVknpk
 CMai0rJvBtB7kbMMt8qJYOKLlM4GC0E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA2NCBTYWx0ZWRfXwy76u8yQEfXz
 OTODQ7EMwtQW4oc11Vyvd7H5V1EwjYZS+0LDOLUHd9QQivBY15A8EK+cdlXOjlApphDUQtho8Fx
 ZUECU7F1vDC88dRp7d4zujQWibxydgCNt4IvTqEb20wliCHwG6TFzyaF0M1FiujOVsMMQcp08xJ
 hVOVNFnRMvaziaQb2vjBFXo4XriJDUD041hLw89XEBFijZLkiz1/MAULIEfqLfskDGpvN3l0Kic
 z0lS9p7Ts3MrWOL4/NCtuw4OFce9bo3w4vfapec9NYLNkyJaiEPbDgwCCko6K0q5qw9nDfdnt2j
 Plt8ye/dPIt4L+R+d+Bk0yBDPnZX4b8tarnmn4EsbPI46yMK4PdAgYLBTeAMaVu711mOtlqnWiE
 BkMZR+nHHSBVkhsodVuFJ+WfFJCXQiDwbY1XheZtW5rYm3pDrlyDHUzpnOt38tvKyPfWx2PWdkA
 JSt6tLde8JdmAWSmJjg==
X-Proofpoint-ORIG-GUID: U9Utmi4gay3BX_4N_Z-ZRd3gzOQCa7HF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130064
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 12/11/26 05:57, Philippe Mathieu-DaudÃ© wrote:
> On 11/11/26 04:29, Richard Henderson wrote:
>> On 11/10/26 18:36, Alistair Francis wrote:
>>> On Tue, 2026-10-27 at 22:58 +0100, Aurelien Jarno wrote:


>>> Are you able to update this patch and send a v3 that include these
>>> fixes, or ideally what Richard said?
>>
>> https://lore.kernel.org/qemu-devel/20261028143330.6518-1- 
>> philmd@oss.qualcomm.com/
>>
>> I thought there would be some more review, but if there's no more 
>> comment I can merge it sometime this week.
> 
> Indeed I wanted to respin updating commit descriptions per Aurelien
> suggestions but got overwhelmed with SD/MMC bugs.
> 

Will try to post that on Monday.

