Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D057CCA5FFC
	for <qemu-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 17:31:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xEVUG-00078D-1D; Wed, 07 Oct 2026 13:31:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xEVTe-000755-Sz
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2026 13:30:55 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xEVTc-0003fg-NV
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2026 13:30:50 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 697EtIgC3417587
 for <qemu-riscv@nongnu.org>; Wed, 7 Oct 2026 17:30:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SC30Ocf3ftAI6tKBSOsLS47gpVDQ/hdhCPVUUGpHVeU=; b=G/kS4Z/oNaqYZiyD
 tePj61Z+7/R1+nZe2d2V/RlYGX13DJ9/yTHjV9cdjmQumlLbp/eopGTl0A0tmhHG
 q9KVgqZJ40WSjzbyph9oCcpSc1yokfMNY/UlOCEqgQejjdKmkHDnBnql/l/GM4Ls
 qrnJVvumGrL0bsc98qPwho9WiHh22c6f3PcLFcuLX0IrzVAGvHGw3QThBV+inZyP
 YzUm4+nuEBqPp3MPeQ8BTaHi7qpDnQvjevVDyp9tOP72X9XedI+uEnVLeBXSAk7g
 3dP68LyoEPqvhcBx2/Vh8QkNO4savcx2D1zTdQk9hjjhaom0GpC3haCE1j9mVByE
 h5jyNQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c6u3adk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 07 Oct 2026 17:30:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93ca9b53afaso1122248385a.0
 for <qemu-riscv@nongnu.org>; Wed, 07 Oct 2026 10:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791394245; x=1791999045; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=SC30Ocf3ftAI6tKBSOsLS47gpVDQ/hdhCPVUUGpHVeU=;
 b=inIHuvpvaigJ7Glfy68A/bOddajy040e0P12NWt0qL2t0KTl6pp2/54sevkOPmJW4O
 cECjg89ntqIvlnGKFQ7yiVE4LdEVCYV5Rh/GBGKPc4cwYX9z+30bpzzJ7JKcCzl0pUIK
 anE5ngz6f/4ROBKrbJa1x+hnolwF+QTZmkPol571d9IAlu9ygVNPDm1jSFHxKjYzKAJq
 iRPF4bxDib3alxNxW49XhmDMhJVpfnQ7ZgFCjI6+O9oE0bMQ/1ixKq66qBj1RJHA+Ed2
 HzxLuaMU66n5RshI3/mEmyh1GD4N9cSb/lD13eGJ/qyhhJRKPd67NwNUcGPzcm3pYhZH
 PFuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791394245; x=1791999045;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=SC30Ocf3ftAI6tKBSOsLS47gpVDQ/hdhCPVUUGpHVeU=;
 b=LncAXCb22nkn5Uyy+RhysoutGa6ZDgCzSuqmgsQ/GjgNX1eCiEYA9cZCRLlDIIALLl
 qiVj0H5btzxykUB6PuEYj4icQoi88F1KC8xri8T6vQRotj7013bq4OGn8Bb2xjXeLN67
 2ubANVEEZf0plEhHC4vsh3ySARmnav1Cc0fZZ4q+PSbYVMbw/YW81PLOdRE0WM4jbvoX
 vQsPB8EbUEgoEF2kdn7UGa0XcRdlNqfL0tDknhynyP8FCZuvIaBPYy/oa1j5LSPA0SKW
 io4jcgPOy18XCp8wLkyrbanETQim9ZamKQAnucj/B7Q3MV9fgkhpjQ5/gjEnun4/N1Uv
 oQeg==
X-Gm-Message-State: AFuF++mjAFaDIYhb/AIGf5BjPKWgI+cUXZ2VvKUJzKQPg7Aniquf0EVw
 HvQnmvJ9n2x7El9IFckndlIWNEc9K/73IKJ3Q1xckrcK10by7uac9vjqcZKThLoKXlbjbkyuekE
 cFujuzwAXjRKO6JlI/yNNGipBkI1xEa0XKMfMpY0P4Ztnxaip3ashbbjtcw==
X-Gm-Gg: AYBFou0+fbpGcURTVY1CrfezetSqyY3AWUUWEqQJYMTxpgDZbw+fWjByhIlZh94Yszg
 dJV9WrsI470hXQ+fTnqcNF1fPY1DmyikKKXld0xpZVfFbgnR4XKCLMWfKBajeXL4NaXUSPJnMfO
 6b/+XYPzYKD/sNluiNsaFPlOo9yiNqIW4rXKmDu+weSv/llo+Bl+ipcpZtg5CO2w7WwvB3f7uWB
 IWv+0DE5/Q+3DdYKvtp0ZsWBkAR/zMjc9Al8Cx8WQ4HGEnh64rk+9AEvZNNiv0vZ+pzQZA0ibMl
 zRcPjYwWKTl+Qcr8NKXbBrLcj6Y8f5pTa1LAhGLq1KxogopKamph0AuRyyY2K6VnKc8K5JWGjNj
 B8rgNXX7QyLjDjBn+lvyb
X-Received: by 2002:a05:620a:444a:b0:93d:23b3:507b with SMTP id
 af79cd13be357-93e9b80306cmr541314985a.57.1791394244680; 
 Wed, 07 Oct 2026 10:30:44 -0700 (PDT)
X-Received: by 2002:a05:620a:444a:b0:93d:23b3:507b with SMTP id
 af79cd13be357-93e9b80306cmr541310185a.57.1791394244051; 
 Wed, 07 Oct 2026 10:30:44 -0700 (PDT)
Received: from [10.251.42.73] ([212.136.9.21])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1802e4563sm43202275e9.3.2026.10.07.10.30.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Oct 2026 10:30:43 -0700 (PDT)
Message-ID: <5df7768b-013f-4686-9ac4-cb8e39773919@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 19:30:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/18] target/riscv: Compile arch_dump.c once
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org,
 Ani Sinha <anisinha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
Cc: qemu-riscv@nongnu.org, daniel.barboza@oss.qualcomm.com,
 pierrick.bouvier@oss.qualcomm.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, luoyonggang@gmail.com
References: <20261007-rv-dedup-v2-0-8a2f0f296a7f@rev.ng>
 <20261007-rv-dedup-v2-15-8a2f0f296a7f@rev.ng>
 <b41b3cd4-2f20-4c34-8b8d-da80c23a6990@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <b41b3cd4-2f20-4c34-8b8d-da80c23a6990@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA2OSBTYWx0ZWRfX1udrYgD/92Nz
 NMNDTUELx2Pz/CO2KLE5jpE/GOEE3c4qx48Dxm3ycWsgdXjAq9OULrpzQSx03Q175t27dT9Udj3
 2G+P0Tt5mC1C5vtnnZRCcvKMNttoL3k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA2OSBTYWx0ZWRfX+fR1kq0elva6
 2o7b5RB4dthoYmQz4psYMVOdL6WIkaiFrtI2vwReTEvFTXPTtDYPAAHKT6emqEbEGalzHaeLxuB
 1NgmT/isRE/5yxIJ+JvnujC9Wxe3BsCnqDaltKJ6EJ2gXjnQQZs7HQRTTf1IyAfugaqZhOz30Mx
 411ug2/PV7vEyi7iWTmr+Cbgo1Jv+jjigKx9R1okBumy2BeovsS5rVaXryUIhWN3Q13XZtyHz9Z
 k2JdLSlPMr7lZxxuXwpl5zGKMJJhKg4fb330zAxY/ZHgsHjvJkqxeoAcyyPw3jITeQ/xrb3n4KK
 lL+B0YWqsU93ZVUkCJGzuyl0XJuGtweTdNl2K1Z/t2uAdGneu1tnyA/JoYHqMRujDph4HrXS9Kh
 sXu7r2awV2/ahwf5azybuMbidp/JS5AdxOn84kbMmXwLDJaw2mRLbnztgAxPFlQWDsuk/0M+Xqv
 8E8jsBwHX3JNzfVxrTg==
X-Proofpoint-ORIG-GUID: JezTPLTtO61AhvhOsSIUzciku-kkcJWf
X-Authority-Analysis: v=2.4 cv=T5EZ3PKQ c=1 sm=1 tr=0 ts=6ac681c5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=/bviTfK1dmy+WGcHzWQ0gg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=uxkZjOOMJT5FjBTOQEUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: JezTPLTtO61AhvhOsSIUzciku-kkcJWf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070069
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 2026-10-07 12:34, Philippe Mathieu-DaudÃ© wrote:
> On 7/10/26 10:43, Anton Johansson wrote:
>> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
>> Signed-off-by: Anton Johansson <anjo@rev.ng>
>> ---
>>   target/riscv/arch_dump.c | 13 +++++++------
>>   target/riscv/meson.build |  2 +-
>>   2 files changed, 8 insertions(+), 7 deletions(-)
>>
>> diff --git a/target/riscv/arch_dump.c b/target/riscv/arch_dump.c
> 
> 
>> @@ -175,11 +176,11 @@ int cpu_get_dump_info(ArchDumpInfo *info,
>>       info->d_machine = EM_RISCV;
>> -#if defined(TARGET_RISCV64)
>> -    info->d_class = ELFCLASS64;
>> -#else
>> -    info->d_class = ELFCLASS32;
>> -#endif
>> +    if (target_riscv64()) {
>> +        info->d_class = ELFCLASS64;
>> +    } else {
>> +        info->d_class = ELFCLASS32;
>> +    }
> If this is good enough to link:
> Acked-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
> 
> But FYI the whole "system/dump-arch.h" API is not ready for
> heterogenous emulation. We discussed it once with Marc-André
> and there is no good way to adapt it, since it was not designed
> with that in mind, and is restricted to a single architecture
> which doesn't change (word size, endianness) at runtime.
> IIRC we ended agreeing dump can not be supported in Het.Emu.,
> and the plan was to refactor get_dump_info() as a CPUClass
> handler, if not heterogenous then dispatch if available
> otherwise fallback to "not supported" stub.

FTR for whoever will work on this, this symbol will clash:

$ git grep -w cpu_get_dump_info
dump/dump.c:1856:     * If the target architecture is not supported, 
cpu_get_dump_info() will
dump/dump.c:1859:    ret = cpu_get_dump_info(&s->dump_info, 
&s->guest_phys_blocks);
include/system/dump-arch.h:31:int cpu_get_dump_info(ArchDumpInfo *info,
stubs/dump.c:17:int cpu_get_dump_info(ArchDumpInfo *info,
target/arm/arch_dump.c:388:int cpu_get_dump_info(ArchDumpInfo *info,
target/i386/arch_dump.c:397:int cpu_get_dump_info(ArchDumpInfo *info,
target/loongarch/arch_dump.c:145:int cpu_get_dump_info(ArchDumpInfo *info,
target/ppc/arch_dump.c:232:int cpu_get_dump_info(ArchDumpInfo *info,
target/riscv/arch_dump.c:164:int cpu_get_dump_info(ArchDumpInfo *info,
target/s390x/arch_dump.c:452:int cpu_get_dump_info(ArchDumpInfo *info,


