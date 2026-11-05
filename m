Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C12606A6DF
	for <qemu-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 20:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FXGAhswM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bDhRbRZc
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xP3dH-0003Oy-03; Thu, 05 Nov 2026 15:00:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xP3co-0003I5-6h
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2026 14:59:54 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xP3cl-00040z-DA
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2026 14:59:53 -0500
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A5HeADU2513416
 for <qemu-riscv@nongnu.org>; Thu, 5 Nov 2026 19:59:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 RlWfBrynmvfqWSZ4v1xRk+fxYaPoGpMlDK+ZE5l1eRg=; b=FXGAhswMQ1srA+iS
 AO5ZETWsuGW+N6hgyd4WPzXDWn7vdz2kVnCOc1bZ4sHh3bVdVIpxhRsB794N3F+q
 kCmiXRwlcDcmLmyvSPvIEMVF0vKOO+9c0lbp21bicfO9uEdOrZCBi72WBYWmCzZ2
 a4TZoPVkAZrTP5o9CkctunSTn8HGTHaAeqkbnKM0mfkw9JCl1cR9irPJuNMSgRfm
 Tiex9hIXngCrlUlWvM61j97Cqr/dl44qWCWD3vVckt6rqB6vgeMDB0joSfoHEGLA
 krv9aPqcjv6XH7N6MwAm0FcQXlnTv9IqBoj66VjiAYL+r3GQuYF7M84w0ecj5Tew
 OIuKIw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrraatedx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 05 Nov 2026 19:59:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-944101e6367so198236785a.1
 for <qemu-riscv@nongnu.org>; Thu, 05 Nov 2026 11:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793908788; x=1794513588; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=RlWfBrynmvfqWSZ4v1xRk+fxYaPoGpMlDK+ZE5l1eRg=;
 b=bDhRbRZcgbX/72D0Hl5Cxv77B1cvt7bBHLMOBhLmsqb3xJIGKjGLAlinrypfdadk7H
 bMfIrLHziLp8LmWk+NzircghmphemjTXTLGoEDf4oZ6EBOcWfYsAqRV70f5ht/o8hwlz
 6jIDD0GPm1+OzTpaJ379anywKgKNjgcO8U/Nj6e0PSBxmjhkxcLVXH0OUWrPNiDQQSR7
 ZBQPNQgJOKWsweFasMO6dEnR/F4LXqeVyXjBRHzjtLzbfgk0XzCCm29mP80gSZ2B1hRU
 +fSwcqtPCYRxRlaT4WHpWIh1y++Kg/cVCmxdASpWQLZFubhIvpuZS8Po42tB5RanYc0o
 ibsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793908788; x=1794513588;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=RlWfBrynmvfqWSZ4v1xRk+fxYaPoGpMlDK+ZE5l1eRg=;
 b=ht+KiERhPkptTKqRjxrIoTvx4QOZnluHHzjHNnjKUGc8FJCuXcRjtVmKA/o0IM4JoF
 RGxPWdUkmMOWbVDGmXwR2LIZ+5pX3v8NKGlB8Po9tVr6jPORpkjgcIRuoREHoYH1haOi
 2sJkIeaX8iug0jukTM4awNISTVQ++xu1nOihXCTtcoHIbwavFhD86GMbXOeSHrZWNWVM
 PQKdm/pMuUi5RZxoEVpiBwj4dv2Z1k+lisEWbdgTX/JSSyYvmr2O99M8GPqVHpHATY/3
 +lryUlK1Q6DN05zOrzENf9ASW1YI3b2fAfsXYQbIZR3e/U+9xbu2TgrMwAfNfTFRYTCn
 6e1w==
X-Forwarded-Encrypted: i=1;
 AKwUvBzIMeTtUuIVzn0IhQw51uffZhwzqgANb6QwuH7b7gmCvH5ktNfsXedHq6oleTHuIIi1FxGqxg1beFta@nongnu.org
X-Gm-Message-State: APuU4Z8PMkFQtk9lAdaSOVhZWhdI5IrvItjqKQinlN6TU1W2ulSGkA32
 HgZrRuzkCLYEepLZAz/GmeSOhLzY3u95FcWhTYaQf7/tPNScxGTI36pwxeLhyTZZ0FqqgfhOQEc
 cGS96lxTf/96ku79NxrU7y81Mr9sEBMSM7E3N/GGvs6a4lA5jwnViCg2/vA==
X-Gm-Gg: AYBFou18I7+l9qxD6zix7nYgFZvAgR/Fr9IPvak/gu2uzLv4M6HV05+KGC62FVa2QKN
 LlJK8KzAW7M9+ntYo8BRP0j6m94+/FyFE2ofFOSDgZEPtjzsJCdwEvoxh0yq48CEXD0olXEqkMc
 VnekGFxc0NbR+5un9lWOdkhfhxecbFEMwoOxOOJs29oaVX9GQbima8mkWGfM7zC8rBfuRayyW2U
 uLnrVRkfLBYmwLgzwoBV2Hxcd4QCPoFZsrWqcYh+mCaEBqmNFM+Z7Hpb/K19SuF7XLSi6v30n8L
 IQVPCPCH/xFz65+o0IT8ZuxvciI4ILs7CA4oeaV6Ocgy5ReleDIuSOuepzChIu3qC+ZFDlhDe81
 OL2AM2I8rFawEZnfSx8KPvKVJ7n4NmNyukAgSzOlAhOqKYb5x772l7rBVbp2gNdAEXVD4Vqn5ED
 IxhFMdCCzONgyso1GzBj8=
X-Received: by 2002:a05:620a:31a9:b0:944:4e6:85d8 with SMTP id
 af79cd13be357-945e1595a55mr624519585a.5.1793908788290; 
 Thu, 05 Nov 2026 11:59:48 -0800 (PST)
X-Received: by 2002:a05:620a:31a9:b0:944:4e6:85d8 with SMTP id
 af79cd13be357-945e1595a55mr624418085a.5.1793908770129; 
 Thu, 05 Nov 2026 11:59:30 -0800 (PST)
Received: from [192.168.1.20] (88-178-97-237.subs.proxad.net. [88.178.97.237])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b6df5eab6esm4017225e9.1.2026.11.05.11.59.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2026 11:59:29 -0800 (PST)
Message-ID: <9754a1ce-71f1-4ab1-a95c-98a16ddfa8db@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 20:59:28 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/17] qga/vss-win32: Replace deprecated sprintf() by
 StrCatBuffA()
To: Kostiantyn Kostiuk <kkostiuk@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Michael Roth <michael.roth@amd.com>
References: <20261105125203.40320-1-philmd@oss.qualcomm.com>
 <20261105125203.40320-18-philmd@oss.qualcomm.com>
 <CAPMcbCrrqrBf_7ofh1S=c=2DFTpZf1SjaqEYnVM=miKbSCk-FA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAPMcbCrrqrBf_7ofh1S=c=2DFTpZf1SjaqEYnVM=miKbSCk-FA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA3OSBTYWx0ZWRfX64dLXYfaGd+h
 pbv/U7bpTj6EEYeTYNp9tTKddhSfrBNftq5xOBZXqq9X0xDQvXw7WzNuIM5+B9jD+nedDx/XsY4
 1iYG7mK537bperrD2jSDytir1qFGI5g=
X-Proofpoint-ORIG-GUID: 9vOptgVDEKRTsM8ie8Uy4vcy2VvvuL6F
X-Authority-Analysis: v=2.4 cv=U54Hnuru c=1 sm=1 tr=0 ts=6aece035 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=tK/gbQidGls/GiIE0Lv0/A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=cjEYgBYo8tDwYd4kLZQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA3OSBTYWx0ZWRfX+c1wkotsaHgX
 hJqERmh/4uErJ9X0kktQ+u6jG7p/+Cc8uvJo5NDtTnHnIx5gfhRquhe7qDLJo/NSLuLKjnSRdXl
 V5pHAhVlt2Bzn+K4YfrkvcKGiQ/KHDwj/q7R2V6uARZGYEi/uj1Ypfa4TJGuyhSY88po3D12WDd
 oN4vwz1+xjXXpRNgRplBsgWup9TbRQLQqfM3EYZX/Q7kOCLYsdInmaiVY1JBruVJ1jlitS8WCzw
 E7afez1TWGz3pQDwr0CnkZgGlUwWiB/RNjbbA0tJREUmtPoOMfTxGIEBS2y32aK3pJsX5Qm0Ezz
 +I5k5Oq91oWHAWbHTSjd6yE3Dmk71BzTDQUGAQ9oULNFD1Q+bZJAoMx7DWyEqapLsKftFl41ax3
 TwVkWzrfyOYrU9Cfnnwz14ESNu0RhtDjHWd7tPyrCgLWNe0CuD4Rf8jeZ4WmVY0DBnZpJxPM8bX
 aj0StSQLs09Uw/oJskg==
X-Proofpoint-GUID: 9vOptgVDEKRTsM8ie8Uy4vcy2VvvuL6F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050079
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

On 5/11/26 16:29, Kostiantyn Kostiuk wrote:
> On Thu, Nov 5, 2026 at 2:54 PM Philippe Mathieu-Daudé <
> philmd@oss.qualcomm.com> wrote:
> 
>> Formatting is not necessary, replace the deprecated
>> sprintf() by StrCpyNA() and StrCatBuffA() calls.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
>> ---
>>   qga/vss-win32/install.cpp | 17 ++++++++++++-----
>>   1 file changed, 12 insertions(+), 5 deletions(-)
>>
>> diff --git a/qga/vss-win32/install.cpp b/qga/vss-win32/install.cpp
>> index df00588c923a..1a3d5cbf75d5 100644
>> --- a/qga/vss-win32/install.cpp
>> +++ b/qga/vss-win32/install.cpp
>> @@ -562,7 +562,8 @@ STDAPI DllRegisterServer(void)
>>
>>       /* Add this module to registry */
>>
>> -    sprintf(key, "CLSID\\%s", g_szClsid);
>> +    StrCpyNA(key, "CLSID\\", sizeof(key));
>> +    StrCatBuffA(key, g_szClsid, sizeof(key));
>>
> 
> MSFT does not recommend to use StrCatBuffA due to security warning.
> What about using StringCchCatA instead of snprintf, even in this case?

Good point. I went back with StringCchPrintfA() for less code churn.


