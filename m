Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10475C43458
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 06:20:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1weoIW-0000Iu-E3; Wed, 01 Jul 2026 02:19:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1weoIU-0000HD-9C
 for qemu-riscv@nongnu.org; Wed, 01 Jul 2026 02:19:46 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1weoIS-0007LX-In
 for qemu-riscv@nongnu.org; Wed, 01 Jul 2026 02:19:46 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6615lWvb066016
 for <qemu-riscv@nongnu.org>; Wed, 1 Jul 2026 06:19:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 unj+myK7kWvzNi+xjrja/5YPEXPwzazrjsdj5mHR4ds=; b=RkflwARdVyxQrKpU
 xlUgR7WCZ2E04vrFKIJKCG4HMIR/O8CiMSARBIjjKpTKTN8avtSmhYguYxGDK0kL
 IJCJuaO5+5nTfTPY1JTtFch7yZ3N/C6zrf1DrcnrSkkKPE0JOev9SqzCgqorGhEb
 c4S1+SntNqnYYnb/6c2rNNccvWfkmFYIbPgZGzVzYUG8yWha6HxRnbu09D1HA/x8
 ulZrmQ3snBRLYHAeR6li3gqA6WlrZyZT1ICMzBT+Tr/v1z2gNITpnshDaNmC7UOY
 Jd+WZ2tNrxbmaC6XmyagFSe05/8OUGRVMxumlV/tjWOsZTGeY9+KxDuaEQateO1j
 s7GtJA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jtqjj7h-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 01 Jul 2026 06:19:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-92e6ed4fe99so62488385a.0
 for <qemu-riscv@nongnu.org>; Tue, 30 Jun 2026 23:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782886781; x=1783491581; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=unj+myK7kWvzNi+xjrja/5YPEXPwzazrjsdj5mHR4ds=;
 b=cQLiazVrm4i9rNlFlXB95Hf4PxOfFDaEwGkL7UDUbYQn9wDvMti1hRfnNbUV0iXFy+
 t1Ar3vRHcSIXGgBlzabF7IQIfnPOkFByBvQC7NA3CwBRUuuAXMGVpHICiZYTQu1qrlsz
 rxdgtRlkYQf8uH40m2L0SP5XKi6Xvat3+kwnzku5WotjZLl16VSiT9lYjUIkjJRx2S5+
 EBpRvJCLfIf8X0hzIHBjNy5N+yINsoc/am1c0H1n5bBBe7Ht0Xtndiv6hIvQHvW4f11q
 wa81Lp4gJdyK/HONv/VbzCwpG8Rrq8uOrikTZ5G7s6PI5S9CNug2a5qGqBQvvcMyZ82D
 EsyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782886781; x=1783491581;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=unj+myK7kWvzNi+xjrja/5YPEXPwzazrjsdj5mHR4ds=;
 b=UHrTbQBlmhubEUsk0TEr/emcnPpKK8gkUj+RdeelpYMWG0nWlCKcA0ItmowEO+JIcp
 BjcCOyBEngFghh5lqVlKLBWOmcxjgrOqRBCbM1fGYO8RTvV55XqHD8g/UucQM7s91tJX
 SZNfKDbB+U5Tt3/cmNgZ0DfZps/3pQtR6UbWXLYAWGiJidauVubEwNTywIpI3b8lLTp6
 sZlKLaUfQVzMCcLoli3mlHSLTh4cOy53CV8RxJwvuS4DW6ylJ4wi+3awPYHFjljV4pE0
 PqR4xnIOkRduP1z/ZW2C3TeTEp39NVhMiRFIY1QDxeePak2+haNxIcWH8UrHmVdldwF9
 FhvQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9ORk0ycDTLV+3Qqr1pOY7+mApvuIab+koB3uy5EO2GnmUHeTQ5nL6Jhzetp2jPVYLnig8TouCoIZak@nongnu.org
X-Gm-Message-State: AOJu0Yxnw35GnGFTxCWPgtbzRnW3ILBMeC3GnT8CnDfcpkTp+YkDk4Io
 Ytzgadk9q9jzotfARyNT3ZY77kcUbsMMgC3Tkj17PZZ9Cis3wFPO+Kmu00R24u//2r8cyVXYiah
 7zC8TLXaD8Iu8XX5zeC7MbQNZRY18+ofcEy2PAo2L9Y6afSuE86NH0hbB4g==
X-Gm-Gg: AfdE7cn/li8EaED4/QK9fNaZMqNG8RyPaX+ruJP1tBy6MC5+VD3WKDXroVYJICjljCa
 +hW9OlwYdB5+uahpWav5fE11guoVSW8jQhiMFCvJd/hGprEw+k0RukVPchoeQfB44fDveIqFIrd
 SofOeuOOiS2cLmgKn91Vnz74v9xHr4KckoguX546eqcpFjxE17UOdRDEl9agMjE/KHD9NG1U2IA
 MArIXgopFF/A7BnlzHfVLeFDvzn1cFgHU0L+wQvPmpBHl6HAmAXDcD+KMbcSofk7KKpTdBiKAab
 eWRE6gobDppQ/14jIM7vEBgrRR90MgcaomMgxhjz0D+hJRbfNvH3F7zC4noK+cAUHfYkc8l09pl
 S1/0e3kvQjVJ3iJCVy5/yfDkpgfIkzKvRX0aUNvrqBoFE+MlJwcdnpX2XAs6WBA==
X-Received: by 2002:a05:620a:404b:b0:915:efa6:d718 with SMTP id
 af79cd13be357-92e784cc16dmr43870885a.47.1782886781527; 
 Tue, 30 Jun 2026 23:19:41 -0700 (PDT)
X-Received: by 2002:a05:620a:404b:b0:915:efa6:d718 with SMTP id
 af79cd13be357-92e784cc16dmr43869485a.47.1782886781138; 
 Tue, 30 Jun 2026 23:19:41 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493be81df2asm89069585e9.12.2026.06.30.23.19.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2026 23:19:40 -0700 (PDT)
Message-ID: <6d52bca8-c748-4b27-a46d-a9de9dc2b782@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 08:19:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/17] exec/breakpoint: Introduce BP_CPU_ID_SHIFT
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: shivangu@linux.ibm.com, qemu-arm@nongnu.org, qemu-riscv@nongnu.org
References: <20260701030443.1382447-1-richard.henderson@linaro.org>
 <20260701030443.1382447-9-richard.henderson@linaro.org>
 <a5d3aa14-4b74-4e0a-a514-a8dc23890813@oss.qualcomm.com>
In-Reply-To: <a5d3aa14-4b74-4e0a-a514-a8dc23890813@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: djh0-r_qq9S5x2J2S4egnG2t1XgBJanl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA2MyBTYWx0ZWRfX+xSqnB7mjJXT
 n8sjldc1/SC2U8698/QfvUAbT7pypVkuit/xINoQg4YvurC3RaNQxvtY4FgRJmkaLip9qwo7uXW
 msbAdp3Xvri771TEEDy6OzhutjyWK9thhxamatHdeRy1PVFvgmQAqp6auHMO/X5j5Eip9kkGUOB
 SJNGIxxXr1hoxxbYMFuo8ZYqmxRhOhnuC/sPtHoLh7LXFSkM/rhCRuUCXVWNbf/Mafa7NoeiMIT
 JgACsx8XbOzf9+VH9gfZ/RHg/O4klpb+Akht7PlnmDAiCx5aIFX/vGEg/nO5C+WqwSrRDDzTbmw
 6tEzMyaOAcD1eOCMhQ8K48l8dEkzoTMxD4MyR2E73ELY/AXiJJjK+VNEZlNwsK3dNmLeE3L6rFU
 avZcmANOpfLbBbQZpCtwklD4H9IwX0S/9qA1bHdDvGOFXEj5zP1B2QUSVjEcHHe78bWbk2Y5ik0
 bv+786Yb7Fm43mXUYgg==
X-Proofpoint-GUID: djh0-r_qq9S5x2J2S4egnG2t1XgBJanl
X-Authority-Analysis: v=2.4 cv=LIZWhpW9 c=1 sm=1 tr=0 ts=6a44b17e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=uRcIMZw2FUk9YvzEzAQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA2MyBTYWx0ZWRfX0Z/c6HahzOVn
 U/uNrpiimzhe9Mraz7Nz57lMok0bONKjJzkAiS1n7fGqAJ0vdvUeafGOaA6Dyhf0IaNq2Af9V4y
 zIMM6+VjVN1HbpYt2hs88I8oIYODbAQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010063
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

Hi Richard,

On 1/7/26 08:10, Philippe Mathieu-DaudÃ© wrote:
> On 1/7/26 05:04, Richard Henderson wrote:
>> Allow the target to store an identifier with
>> breakpoints and watchpoints.  Change "flags" to
>> use uint32_t instead of "int".
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   include/exec/breakpoint.h | 10 ++++++----
>>   cpu-common.c              |  4 ++--
>>   2 files changed, 8 insertions(+), 6 deletions(-)
>>
>> diff --git a/include/exec/breakpoint.h b/include/exec/breakpoint.h
>> index fc91343875..93876f3304 100644
>> --- a/include/exec/breakpoint.h
>> +++ b/include/exec/breakpoint.h
>> @@ -25,10 +25,12 @@
>>   #define BP_WATCHPOINT_HIT_READ  (BP_MEM_READ << BP_HIT_SHIFT)
>>   #define BP_WATCHPOINT_HIT_WRITE (BP_MEM_WRITE << BP_HIT_SHIFT)
>>   #define BP_WATCHPOINT_HIT       (BP_MEM_ACCESS << BP_HIT_SHIFT)
>> +/* Bits [31:16] are reserved as an identifier for BP_CPU. */
>> +#define BP_CPU_ID_SHIFT       16

While I understand the benefits of storing the ID in the structure,
I'm not keen in having it packed with the BP flags, it hinders the
code logic. Since there is no point in optimizing this, lets simply
add an index field. And convert the API introducing _by_index()
helpers. I suppose you plan to remove cpu_breakpoint_remove_by_ref()
at the end.

>>   struct CPUBreakpoint {
>>       vaddr pc;
>> -    int flags; /* BP_* */
>> +    uint32_t flags; /* BP_* */
>>       QTAILQ_ENTRY(CPUBreakpoint) entry;
>>   };
>> @@ -37,13 +39,13 @@ struct CPUWatchpoint {
>>       vaddr len;
>>       vaddr hitaddr;
>>       MemTxAttrs hitattrs;
>> -    int flags; /* BP_* */
>> +    uint32_t flags; /* BP_* */
>>       QTAILQ_ENTRY(CPUWatchpoint) entry;
>>   };
> 
> See https://lore.kernel.org/qemu-devel/20260630220100.1289-19- 
> philmd@oss.qualcomm.com/ ;)
> 
> 


