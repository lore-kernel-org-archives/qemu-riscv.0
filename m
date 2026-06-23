Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA3ECDB470
	for <qemu-riscv@archiver.kernel.org>; Tue, 23 Jun 2026 20:00:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wc7Hh-0005EV-Lw; Tue, 23 Jun 2026 15:59:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wc7Hf-0005EE-IL
 for qemu-riscv@nongnu.org; Tue, 23 Jun 2026 15:59:47 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wc7He-0003BM-2a
 for qemu-riscv@nongnu.org; Tue, 23 Jun 2026 15:59:47 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65NJwlYn3454716
 for <qemu-riscv@nongnu.org>; Tue, 23 Jun 2026 19:59:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 tDdTE/WBojdqAek/AFZiN0lbaLEKVX0EkFfDK3nLUTA=; b=e0yEvpSoMnbR9vPP
 0taN4pXaBaWKTf46Dtc69TUKG+kJ2kimHl1DIAU/UY0NX/GIAXUL0fGQ9OfgLaNL
 INvEdXlBY4qpnhoaERwXTVNaml041vLRNNCr4bPiqQxaao7IAA80G9bUx+QbwA/N
 wS8U5DNSC+xq+IieZdA0+Mf04g58MpAflSeLokQyBGPbP8v89bErjyRAxpb0ZRHL
 46QRwWmWWV6JGKCEVUSrsPQ3lkqPnWPlAbWI9XkRzLSQ0lR7VlBp7v3zTH6ONKZi
 RnZ312TNvgwvn5NlFIUqAYXrLlXnamknAQEoGTae4uL38SlSO+MtXRXm0oTejtn7
 A6tNKg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyp1gu39m-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 23 Jun 2026 19:59:43 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2c6bbd0afffso2894025ad.0
 for <qemu-riscv@nongnu.org>; Tue, 23 Jun 2026 12:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782244783; x=1782849583; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tDdTE/WBojdqAek/AFZiN0lbaLEKVX0EkFfDK3nLUTA=;
 b=GsCa60NZjIcNU8njFA1eCDQgbBsGhZ7TKFsCWIj16eR5IGy0RLJVSBRKCrgC9+qwdX
 OfHIGSR4H8o088TwJCR1fiINDLRs6S7s0C+bWUcMwdgDYaGQmNlzvwaZXFRIUggB2o9T
 WN+co7ARBVjaO2pPNAoOycwSxxPNUDocHHfTusEsmjRHjxnmUXZlKjCb8EHLo8XF9WgO
 HM9FVf5clkN1h5PvHDVxZfCJZSpjCBqRXGvKZHvnXPqLMaLsbB7+vCrf91TRRWcBJFW1
 eVoDMATdkiS9H9FaTfWgvfSEVOEN2++hupmhYgjZiAS6mwbFBVcSrUt0jjb+M5o+Tc/l
 wMSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782244783; x=1782849583;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tDdTE/WBojdqAek/AFZiN0lbaLEKVX0EkFfDK3nLUTA=;
 b=X7FYqt5ZRBNVUkeF6S/p2zoIHZYuYFWrx5E+/kTQIPb758cFtDV67dA7AK/m2chRNt
 XZ73B2FQ50iRP1Q6Y7UFFZLpusCbhteelW10ReO1gw/R8WxmgsAJodB/QVyEzVVWuSHW
 o2cL1DceqDbegDXkyROquEVDPpDjCoIuDG4TmDAtceQZOrgNPNWsTLdWu+LRFnF04zsF
 efalt6yyGVCjE4kmOTbHzNV+gEOgV58AQkAHE0M+3cJzyKkTTutpmhKhKKgrnz9FU5Fb
 kto0b8oKUDe8RwAcq0YNbX489mqr3xbpe9EWUOJFqhLJInY+xiSRh3OzE7CWyoT7Grv3
 POnw==
X-Gm-Message-State: AOJu0YwXDkLT3Q8u9XGmuD/LnrRTkBsiXx77yirGAKLK2hMZyi4uQSfF
 ygc2RvSDKzpYwrzc9QeFyS3H9UunOxhABT5yL6WeEFMsr/Ecw+MreCyL6H8Tlfh9TKndClHoE0y
 HXJNTtVPpwVIl5+VzWtjd6V3EcjpdzWVBVYR+QZ8kzW5ingkR66GAI2eHyw==
X-Gm-Gg: AfdE7cmcRqomlWRF569SbsxEwDIJsXnGYfpHghCw8C8n3lrKl3AizTMDNQCWe2gg/r1
 hkpuBg42lPhSKQkKqNfp2j9sfMASvdc9Dv5xVL8y19d8RbnBqPW2W3MoVTMRg36lWfwhaimbQah
 ctXBg/l4LInoMN0Bu7pne5HYxWg1xz/Thh5Vza0u9J1giznSeZkI0gJ755kCW+nbu44+zEeFWVr
 JPh5UtoleIYau+DrQjPhDzzRudcP78xL6kSO+fU/UmYiECy1A/zXkOqWmnTwdcD6FSbWXkKvnCj
 UsDVu8+jk+uw8Q/JUIc2MX3OZEgBsa6vNxNHsjS5X4fzGEXVcrSMTbKhFEyD0XgRzloD8hFbJC6
 VYYJo2t4CRGUa2tuwCCrlv+cMMfwZ0xyruUuwKfTFxReD
X-Received: by 2002:a17:903:19f0:b0:2c2:bd7f:ccd4 with SMTP id
 d9443c01a7336-2c7c768469amr45828765ad.21.1782244783024; 
 Tue, 23 Jun 2026 12:59:43 -0700 (PDT)
X-Received: by 2002:a17:903:19f0:b0:2c2:bd7f:ccd4 with SMTP id
 d9443c01a7336-2c7c768469amr45828435ad.21.1782244782565; 
 Tue, 23 Jun 2026 12:59:42 -0700 (PDT)
Received: from [192.168.68.103] ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c7436af238sm111927195ad.9.2026.06.23.12.59.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jun 2026 12:59:42 -0700 (PDT)
Message-ID: <9bf2f5b5-2ec4-4ac7-bda4-fb0a37a9968b@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 16:59:37 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/24] target/riscv: move riscv_cpu_set_nmi() to tcg-cpu.c
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 pierrick.bouvier@oss.qualcomm.com, Palmer Dabbelt <palmer@dabbelt.com>
References: <20260622193141.1449724-1-daniel.barboza@oss.qualcomm.com>
 <20260622193141.1449724-12-daniel.barboza@oss.qualcomm.com>
 <c6428872-6fe1-4961-a6a0-5df6714f939b@oss.qualcomm.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <c6428872-6fe1-4961-a6a0-5df6714f939b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: WII6jbjqEbY3mQpxVvKSELkJHP0BVu0G
X-Proofpoint-GUID: WII6jbjqEbY3mQpxVvKSELkJHP0BVu0G
X-Authority-Analysis: v=2.4 cv=QJhYgALL c=1 sm=1 tr=0 ts=6a3ae5af cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=TDylviO6ZuoNFwrYxHQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDE2NCBTYWx0ZWRfX43Hgevr4uYY7
 qPeMWKAyBpuTbltjk41QoTFJySaqU19Qzz56iobiu2jYRyfHQCAqFGJlVg2rYAnEjCCmKdVTJn+
 2uHVRmTzEEQSJtcO7oDKIvEtR3J+bTY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDE2NCBTYWx0ZWRfX/cZJzzBYEAr0
 Zd80tgAUX5ak0Z3ZL5x4YkLqwNOVcRmZNME5pS9YLTUtmB2fedn7gr57SE8EK303p8op5h878TM
 /CwjLHgAIbG6KxpbouqogStEj+XmVtnxriATREhW6W2SMGa3yfg9MNTtg2hRlEDVJ3pQCcDK0Uc
 7rA6OSSBmHlVxxdUmg40iRVk+7VVUBaCJKfBpISlm5nX8HL4qj9qXVP7n4rpINqXpVwnJpW8S5q
 B/CARMJBWscF/FcdCVmNmt0LwvTLQ/aLULSjqT3Wm3X6KDhJKJESQzTsA8UNny/TKpcRZEjqhvG
 FItUmRp9J1u565Z+dT1rQNiGzTXLnEq3Yl7QuRYh478mGEc5y348s8wBAERFSwaWutG5KQusC6s
 8eg2DwIDdTV++4++ik9FWoqPgw7K6OmXTI4V50rzo8U0KgEv+uRCm24SeAmujvZsd2V2K/0vxUu
 j3/dwSgIea67K8OqnWw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_04,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230164
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



On 6/22/2026 6:04 PM, Philippe Mathieu-Daudé wrote:
> On 22/6/26 21:31, Daniel Henrique Barboza wrote:
>> This function is related to Smrnmi and non-masked interrupts, firing up
>> interrupts via env->rnmip from riscv_cpu_local_irq_pending().
>>
>> This is all TCG only code.
>>
>> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
>> ---
>>   target/riscv/cpu.c         | 8 --------
>>   target/riscv/tcg/tcg-cpu.c | 7 +++++++
>>   2 files changed, 7 insertions(+), 8 deletions(-)
> 
> 
>> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
>> index fef66557c2..0d0a704179 100644
>> --- a/target/riscv/tcg/tcg-cpu.c
>> +++ b/target/riscv/tcg/tcg-cpu.c
>> @@ -1662,6 +1662,11 @@ static void riscv_register_custom_csrs(RISCVCPU *cpu, const RISCVCSR *csr_list)
>>           }
>>       }
>>   }
>> +
>> +static void riscv_cpu_set_nmi(void *opaque, int irq, int level)
>> +{
>> +    riscv_cpu_set_rnmi(RISCV_CPU(opaque), irq, level);
> 
> Preferably inlining riscv_cpu_set_rnmi() here:
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
> 

Inlined. Thx!

>> +}
>>   #endif
> 


