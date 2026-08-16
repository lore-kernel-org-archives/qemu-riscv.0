Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C3A0C5B572
	for <qemu-riscv@archiver.kernel.org>; Sun, 16 Aug 2026 09:11:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wvWuB-0005t5-JJ; Sun, 16 Aug 2026 05:11:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wvWuA-0005sB-2w
 for qemu-riscv@nongnu.org; Sun, 16 Aug 2026 05:11:46 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wvWu8-0001Fc-FP
 for qemu-riscv@nongnu.org; Sun, 16 Aug 2026 05:11:45 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67G71pNP2347087
 for <qemu-riscv@nongnu.org>; Sun, 16 Aug 2026 09:11:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KdbNQUou+xQoWZZSBwZEMOBzSbgSNuXhzX8u77iLeBY=; b=Dq1gK66fPLMQstb4
 p9bfLTqjlIlDrp+zLcpgygfxRY6Wg+3+D6UskjX3lz+ftVXCtS4c21U1QP10Ybbz
 tQckLB9FnMg+96uxF9qNGD8g8D1Y3EOsUXx04VX8w9/c9Ane/2yaEpGaZi7F5d7d
 NahyaQN7M5vJ3oANBRrhXGou4gVWLUDTMB+hunWPCoVaUI9aa/iyJQH0flIDBSYj
 pgyEd95z2jNg2Cjd/4r7J7QS6iGYNnvdtqDCQFLcgxHkNqJVcQC3Fr5E6u/T6aFl
 XLyGBTVQCJz/sgzgHY9z865K8+P2OuLM23oJ1yqkV9hFowQQCpdqayaWTP9u+27P
 htnpZw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2hd7u0de-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Sun, 16 Aug 2026 09:11:42 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-52769fc3f2eso30634241cf.0
 for <qemu-riscv@nongnu.org>; Sun, 16 Aug 2026 02:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786871502; x=1787476302; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=KdbNQUou+xQoWZZSBwZEMOBzSbgSNuXhzX8u77iLeBY=;
 b=JSol/F1tpRMOLf0rn2LRTJ1CtRLvTbymMVqAwwUfsh+mB/XfmVNw/KzW1XhgFPMuoo
 50XAe2Cb4nYhv7rPGxTVsmAPButk0PHbAN7tlpuCMg+Ar+D+XzXEB7m2klnUhg5NfwZF
 /m3ThCDUMtsvzwsUMUxOwnm0dQ4ILycurFRuDtfko8SECQR0765LrJkHKiL+TcOlFN+E
 AgE0Vu/rOmInL964HSkq3jkFI5RefwvLqX9M8LsUHsJYPEOas0a6PJDJ+cj1nTiXeY24
 R+RfOns4J71nls3kwhCJ2jozn64ewWgT2Od4HPCZtC1UTBLXpThszXNjMbE6inGiy9jW
 ioXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786871502; x=1787476302;
 h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=KdbNQUou+xQoWZZSBwZEMOBzSbgSNuXhzX8u77iLeBY=;
 b=GsjrU/PwTsuqypoY5rKWonT5vpEF9mMndUT1QJuDBPjaVcxpfi//f3OoUykOjcHWEc
 wGYXiGtO+PRXbx8F5DHbdjmQFnl02Y0LI6aMIoPBtxv0eAJ6zaldnFWdYL1YGZPr75mE
 gPIVYHW18T4PUvOeU0xat/eZTcYE9ujuSh/KN5zQQrQ1PHzeM/dpBQLpGjG1LbFV/Hsl
 qzLI0iM6umpSfxdEYnVABARoF8bb5c/KK/eZcLLZWBGppRZ0N3sBg8hzwUVnxY19faj2
 6mFd//W25FtSIZxMdHHgwGV0vf+o9OcJyWG3E/qv84dalhXQqNpel6GT5KjkaU0+/cd6
 dGiA==
X-Forwarded-Encrypted: i=1;
 AHgh+RoorW6ESebtsJB1sUBaIBaaerFY9XZafoaSdUQagIwYjbg5kRDlKxB7GAQ0MvnXjm8lyUuUwhO3RlO0@nongnu.org
X-Gm-Message-State: AOJu0YwYSsB4/KqaDmK6ccUfZ4lz0gfYRgzOg6ILp+ZZYxbpxwydZNBs
 gzs8pQWBJjeAn67VBhTVZzZIApq2yeVVxenpbsJaTZmIkDzjLkJKf5/8UlZzeS+kwJe/1wvC+ew
 eyXf+VKh0pZ1i7oD0f8hx4y9aUPsoKgHmJ/rx62Vv5Yn4vFPmlmztdDJ5Vl34OOrlHA==
X-Gm-Gg: AR+sD115QPhU0+VWwMGrT+e3rqrWeS4RJvazYfIuMnVbois72TLWVkZe8sVoysJJwDa
 9+f3CbVM/f4t5lKSs642TiBXEh8HwABOkZDuLoDCNgnncnIbW9xCk/Muz7i57ctc9t4KFeJ6AIv
 re2SJKb1nnLFDrj6dZcYa1yWnPgvn+ik/rMFVighx25+YEzpGCkoDuGIvq5y3KrDhplmxFxhzmn
 D9ujJKehjaULAO+I5I5CptbtfQyKhDA2yNh9U7wtns6GYUqd/7G7wAAfs53IrikeUEnjuxdb+5G
 WfkfR1IeM9aDW/H4izmFDi8CgvMGYaJ+f1E06xpkk5ZUXTzoCouLkCtfSoFpvKOrefNmNy9sc9o
 U393rNLcotJRChgvyXv6OY6i0UlNpEaXl8fM=
X-Received: by 2002:ac8:5fcd:0:b0:51c:167d:b346 with SMTP id
 d75a77b69052e-52d85420e12mr167004571cf.23.1786871501676; 
 Sun, 16 Aug 2026 02:11:41 -0700 (PDT)
X-Received: by 2002:ac8:5fcd:0:b0:51c:167d:b346 with SMTP id
 d75a77b69052e-52d85420e12mr167004281cf.23.1786871501309; 
 Sun, 16 Aug 2026 02:11:41 -0700 (PDT)
Received: from [192.168.69.229] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49996108141sm27335365e9.6.2026.08.16.02.11.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Aug 2026 02:11:40 -0700 (PDT)
Message-ID: <6a6b6a70-1558-4fb3-a0f4-87958a350b72@oss.qualcomm.com>
Date: Sun, 16 Aug 2026 11:11:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 07/18] accel/tcg: Replace size with first/last in
 probe_access_full
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org
References: <20260815203730.1468365-1-richard.henderson@linaro.org>
 <20260815203730.1468365-8-richard.henderson@linaro.org>
 <2875df0a-d000-46fa-a8e9-22aadf102a7b@oss.qualcomm.com>
In-Reply-To: <2875df0a-d000-46fa-a8e9-22aadf102a7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE2MDA2OCBTYWx0ZWRfX+GOXy8fhA5wa
 GuYczcPWc/13L4CPytP4BavMshwSq7l3XJ6ysoouUGGIhuiofiN3M/S8i4UuKGxZ2jI782g21Xi
 iYZ6yvgvyyzRnH/jcihVDEAHBm7LCs2i4usTH+TlAM/oWXqY2StXhCNfk4XvY1NdMRTXHGG3aNp
 rSYszeTUr9CKgQsiTtMsRApCAkf3mOLW/n9ucGK0dFijLJjJfbzjScGg81yKf5YyfKQ+6WJQ0Rs
 NGXFWLHR1S05LEZyNncljc9B2ehBHV0hP5F3yaKCqvhWqBQO4r0veJu5VeDp+1ZWsgu1nTxRhja
 WRjSyiv4ef0rKxtrSjGUv/UtFmmUNj4S2zfaroFZNO/bOqZZmId282QhDrzudRRSIigRsTsvw4q
 ujHpSrw2+e4GAprxVEGmVHfTBgTIZZdfbFPPZuBzpSImRMB8Q6jraYDaEXwo6gnwXbpIYEv59z+
 dbHA2UCIzxKP37fFhNg==
X-Proofpoint-GUID: VKVkbTZ_4s7L21nwrrADLVA3mXlnI9Ux
X-Authority-Analysis: v=2.4 cv=Ja2Ma0KV c=1 sm=1 tr=0 ts=6a817ece cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=bdvilYR6Lf0MEp-pbN8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: VKVkbTZ_4s7L21nwrrADLVA3mXlnI9Ux
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE2MDA2OCBTYWx0ZWRfXySiAj2rYd1ZV
 AOK6Hs2dtcH1TlGx9ajhn/cW7FW9SMzDzFX4UbSdMFzmpG4plx7y3+tVI19gwk7tqM4qkm7iJ5U
 25qD2LuIbHgCyFp6vUoSowyTXlmS/6k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 adultscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608160068
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 16/8/26 11:09, Philippe Mathieu-DaudÃ© wrote:
> On 15/8/26 22:37, Richard Henderson wrote:
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   include/accel/tcg/probe.h     |  2 +-
>>   accel/tcg/cputlb.c            | 17 +++++++++++------
>>   target/arm/tcg/helper-a64.c   |  5 ++++-
>>   target/arm/tcg/mte_helper.c   | 21 ++++++++++++---------
>>   target/arm/tcg/sve_helper.c   |  5 ++++-
>>   target/mips/tcg/ldst_helper.c |  4 ++--
>>   6 files changed, 34 insertions(+), 20 deletions(-)
>>
>> diff --git a/include/accel/tcg/probe.h b/include/accel/tcg/probe.h
>> index 0b788901ba..e3068a79de 100644
>> --- a/include/accel/tcg/probe.h
>> +++ b/include/accel/tcg/probe.h
>> @@ -86,7 +86,7 @@ int probe_access_flags(CPUArchState *env, vaddr 
>> addr, int size,
>>    * This function will return TLB_MMIO in order to force the access
>>    * to be handled out-of-line if plugins wish to instrument the access.
>>    */
>> -int probe_access_full(CPUArchState *env, vaddr addr, int size,
>> +int probe_access_full(CPUArchState *env, vaddr addr, vaddr first, 
>> vaddr last,
> 
> I prefer this clearer first/last range API, it feels safer.
> 
> Missing updating the docstring, otherwise:

I now see this is done in the following patch. Maybe amend

"the probe_access_full() docstring will be updated in the next commit"?
> Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
> 
>>                         MMUAccessType access_type, int mmu_idx,
>>                         bool nonfault, void **phost,
>>                         CPUTLBEntryFull **pfull, uintptr_t retaddr);
> 


