Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 596D7CD6E79
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jun 2026 12:29:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wVTfW-00061A-12; Fri, 05 Jun 2026 08:28:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wVTfR-000600-BU
 for qemu-riscv@nongnu.org; Fri, 05 Jun 2026 08:28:53 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wVTfP-0002yO-Hp
 for qemu-riscv@nongnu.org; Fri, 05 Jun 2026 08:28:53 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65575YpR1501999
 for <qemu-riscv@nongnu.org>; Fri, 5 Jun 2026 12:28:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PklErwagQ6pnXNqyjfn3THpocc7sHePuZG5qin6c9cM=; b=IsQ8Kqs48vHYgTHx
 JpiUmmMCaKQbUqdSIsZlnI+VG1JDEKN8BdL+67nFBYJPq0RhFr3m72q0JmOoRJw5
 J4lrPmcZ55vWlL/cj1b1m4k+IjLxoRT9uplwIf+AqtCdoqhzJGSnxSYdwR2nh1oZ
 s9KUYY4IXtCfr+JH5Zv7kJ8wCjH8YMcJhkJIEWexTRIj44kVoWjRtS4EG5opnN6T
 /nQU93A1iMWerp7OshSvNm+1d9yul7xsjFJrkUzxZi6fetRQ5Ww5Ek+VDZZ38SJv
 kIUTsbVDuP4PUlvBOf8mB/eAniSEhZCCJxYQSwXavK+4UedySwpNg/Hxt9Y6vmQk
 BU+p8w==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eksrws61f-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 05 Jun 2026 12:28:47 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id
 a1e0cc1a2514c-9639158a44dso735087241.3
 for <qemu-riscv@nongnu.org>; Fri, 05 Jun 2026 05:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1780662527; x=1781267327; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PklErwagQ6pnXNqyjfn3THpocc7sHePuZG5qin6c9cM=;
 b=DZzr4wq3XAfVvJuC5cGiLVbwl+T/K5cdNdXhAmEF04V5jmffVnczbUR+WA34yym9rM
 4lTAEZL+xAThMKsvLBA/Ruky+qgoICW9XjyOZxHXBlAQtxvhis49bECdorl6bdakViVr
 oiiw7UfNrjz1e8dRh49hX1QWEi16er4eDQaJNI+HKNWJQvy15bdJuTK9i7Czi4Tr886V
 lXSpP4yFs60L+ikQX+xS6tK48rqDzVnTk6ex3ds82xr4eLW09pG7ZEtt1o+u/qZwF13O
 XsJjN+G/URYZhssQurVUaqYOZMkcqO4kI6fjdORHwmoEMpqJBw+t8usIzAU8hotd5bDw
 hpsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780662527; x=1781267327;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PklErwagQ6pnXNqyjfn3THpocc7sHePuZG5qin6c9cM=;
 b=WMw1TxEtJbBhbRk1f3wdhzfxFNiDICrJLJITs4PgWVwWv0+xoRllRwO/HrLvgBONW0
 NUWA2zGsSpahJkNYp3ACIl0cmwjL2vJsNUZC7lJ3uAU436afOp4ytDIr194n1Oor4pHD
 GS883d7rM5aJkHSeb5TbkWxpHcZSQyGZG/X/jmXbrIJ1O12tWauo1cT8NyFV2nu2el1A
 Tf6RT9BYvIsRUQiDuJt5SqzGC+qIcNcshKGTrrctMjf+TazQX02EbAKB9LBCCIdIziXB
 504KO1fUXJ0pcM2sbKPeU6yxnlPmZosIB3ylBIcm7/jbs3URaoD86SvEVPZk3yyf8LKc
 G4PA==
X-Gm-Message-State: AOJu0Yx0ee0BBvn5j8WT7yLKnmYIP1O68f1R544gO8vLWqliZEmK/a6s
 jIGJ+rl7/PraXDwrQwmo34PkzUNPoNw1xr4iYqoDbGFNxq21Er2puYSY7aRU51w0F/Nh6lSIEGn
 JGsdtPEYp6WsHJidSTIo3HzFbZhjbIgjUMEchLyjXpbuxNMMBqKxVybzxUA==
X-Gm-Gg: Acq92OHFFrlmq5XolyqDbDy71JfVHFm3MGD8UUHL1LQt/4UMp1GmXcWWlK5cyd2G+0O
 c6mfQ543JqyVG53gY6Mx28dVd6QxZqiFRfPLeUWKkF5+A75RkENRFlLfAcymkuFVQXDCxdxcrF8
 U3fiUChQH0SVNRIrN5xp9WYIZioBhbs+UC1L+jAMErCLAmrTfEizABGjAFVJBsVcqAwNmgYw9Tg
 Jgh4gfzr+As3eaUHAa0mjWrw61ma67OFCN+Q++Ctc97tmmR4C8qOnxUiliQolqHpTzwKjlYXhjo
 iyKb8a7t5/OesSe3VQrZMJ0sTDDvWE2gcshvbK0QyFAFa1UH3663/JmU1FoiA3TJwUVFuVZm7Sm
 5m43bRz6L3sc/ng0VwtPFqqCAAYI5Kb7OJjC1Cr7YrVT8jUhbXjVR86+NIZF/8vi9Yl1Q
X-Received: by 2002:a05:6122:3c46:b0:5a0:1bcb:acd1 with SMTP id
 71dfb90a1353d-5ac4ee912efmr1436117e0c.5.1780662526944; 
 Fri, 05 Jun 2026 05:28:46 -0700 (PDT)
X-Received: by 2002:a05:6122:3c46:b0:5a0:1bcb:acd1 with SMTP id
 71dfb90a1353d-5ac4ee912efmr1436100e0c.5.1780662526462; 
 Fri, 05 Jun 2026 05:28:46 -0700 (PDT)
Received: from [192.168.68.106] ([177.170.117.62])
 by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-5a6dc44d226sm7091950e0c.11.2026.06.05.05.28.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jun 2026 05:28:45 -0700 (PDT)
Message-ID: <a77a1891-214e-4788-8cc3-a5729f5cd182@oss.qualcomm.com>
Date: Fri, 5 Jun 2026 09:28:39 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/5] target/riscv: Add server platform reference cpu
To: Icenowy Zheng <uwu@icenowy.me>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 andrew.jones@oss.qualcomm.com, leif.lindholm@oss.qualcomm.com,
 Fei Wu <wu.fei9@sanechips.com.cn>, Palmer Dabbelt <palmer@dabbelt.com>
References: <20260604095244.3313259-1-daniel.barboza@oss.qualcomm.com>
 <20260604095244.3313259-3-daniel.barboza@oss.qualcomm.com>
 <4acb210eea217195fa733a4f42369c01591d5499.camel@icenowy.me>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <4acb210eea217195fa733a4f42369c01591d5499.camel@icenowy.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=L5ktheT8 c=1 sm=1 tr=0 ts=6a22c100 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=gdiugJE53z4H+vvYeRBHqw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=V1jnuoLLAAAA:20 a=uTRCLKPYAAAA:8 a=EUspDBNiAAAA:8 a=cnEU3zZSKP9vwp5vf1oA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
 a=T-agBWn15iSmxapsA1lH:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDEyMSBTYWx0ZWRfX7BjJSmc/pCHU
 uk4ZVbLa4lqXHSm7PMZq+79rNtXNEeaKicG6p3qYZuuSgP4iE2Gs8ZkrePFOyPqHD7fiezm/Bpk
 ZRbSIY9PN/WKe+ZZDF9WaZV/Uhgm5wMeWgCaMH1z2yhuk2/db1HKZ1pAQyvem1UbWN/PXgv5lPF
 3IdviMxo2iHr5rJAi8U2zepzYmZNTVB6v8ZCkAg94U3Ivyb89fDrGfzgvQPPTxCIL8HzZTHEMQ0
 1oBrkO8/pbVtNw8N3lFKu9r3cO923hNzXVP19ANAMA5mRmX1bK3jwpyfR+um02Y0sATrDcQQ8p5
 w5GHk3I7iE85YCVcc/bHQrdO2ql2clsySlEFyRhguU4imsTiPGBDjbnF635C73Vh32jNJ/72CUJ
 ldyt+7Log+P4UJCTW2Xgiq4d41pbls4oTt6zgtmt+a+ZXTX6NmqVXfdhPAXUsN/mmdsKyPnCYgh
 f5Baa9nKycctC/hx2xA==
X-Proofpoint-ORIG-GUID: qnVswHPejVrmg3my9WQ-xsSJQyhIl7pL
X-Proofpoint-GUID: qnVswHPejVrmg3my9WQ-xsSJQyhIl7pL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050121
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org



On 6/5/2026 3:59 AM, Icenowy Zheng wrote:
> 在 2026-06-04四的 06:52 -0300，Daniel Henrique Barboza写道：
>> From: Fei Wu <wu.fei9@sanechips.com.cn>
>>
>> The harts requirements of RISC-V server platform [1] require RVA23
>> ISA
>> profile support and others.
>>
>> This patch provides a new "riscv-server-ref" CPU to go along with the
>> future "riscv-server-ref" board.
>>
>> [1]
>> https://github.com/riscv-non-isa/riscv-server-platform/blob/main/server_platform_requirements.adoc
>>
>> Signed-off-by: Fei Wu <wu.fei9@sanechips.com.cn>
>> Signed-off-by: Daniel Henrique Barboza
>> <daniel.barboza@oss.qualcomm.com>
>> ---
>>   target/riscv/cpu-qom.h |  1 +
>>   target/riscv/cpu.c     | 11 +++++++++++
>>   2 files changed, 12 insertions(+)
>>
>> diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
>> index 30dcdcfaae..a150acd151 100644
>> --- a/target/riscv/cpu-qom.h
>> +++ b/target/riscv/cpu-qom.h
>> @@ -42,6 +42,7 @@
>>   #define TYPE_RISCV_CPU_RVA22S64
>> RISCV_CPU_TYPE_NAME("rva22s64")
>>   #define TYPE_RISCV_CPU_RVA23U64
>> RISCV_CPU_TYPE_NAME("rva23u64")
>>   #define TYPE_RISCV_CPU_RVA23S64
>> RISCV_CPU_TYPE_NAME("rva23s64")
>> +#define TYPE_RISCV_CPU_RVSERVER_REF     RISCV_CPU_TYPE_NAME("riscv-
>> server-ref")
>>   #define TYPE_RISCV_CPU_IBEX
>> RISCV_CPU_TYPE_NAME("lowrisc-ibex")
>>   #define TYPE_RISCV_CPU_SHAKTI_C         RISCV_CPU_TYPE_NAME("shakti-
>> c")
>>   #define TYPE_RISCV_CPU_SIFIVE_E         RISCV_CPU_TYPE_NAME("sifive-
>> e")
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index 3f0f931335..c4a5a7f1cb 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -3315,6 +3315,17 @@ static const TypeInfo riscv_cpu_type_infos[] =
>> {
>>   #endif
>>       ),
>>   
>> +    DEFINE_RISCV_CPU(TYPE_RISCV_CPU_RVSERVER_REF,
>> TYPE_RISCV_BARE_CPU,
>> +        .misa_mxl_max = MXL_RV64,
>> +        .profile = &RVA23S64,
>> +
>> +        .cfg.ext_zkr = true,
>> +        .cfg.ext_svadu = true,
>> +        .cfg.ext_sdext = true,
>> +
>> +        .cfg.max_satp_mode = VM_1_10_SV48,
> 
> Here it only declares the maximum supported SATP mode is Sv48, but the
> RVSP spec requires Sv48, and the RVSP REF machine created in the next
> patch also requires it (because the above 4G PCIe memory space is
> beyond 40-bit physical address space).
> 
> Without `,sv48=on` explicitly enabled on the CPU, booting EDK2 firmware
> will fail because of the out-of-address-space PCIe memory space.

You're correct.  We're not initializing satp_mode to max_satp_mode, so the
default value is being set to sv39.  This seems to be the case for all
CPUs, not just this one.  For some reason I thought we were defaulting
to the max_satp_mode.  I need to understand why sv39 is being set as
default (i.e. why not BARE?).

As far as -cpu riscv-server-ref goes we do not want to force users to
specify sv48=on.  The CPU should default to that without any additional
command line.

Thanks for reporting this.  There might be extra stuff to do in the code
base before adding this CPU (maybe adding a 'satp_mode' attribute and
make CPUs default to that value, like profile CPUs do).


> 
> Maybe a RVSERVER profile could be defined for CPUs conformant to server
> platform spec (because that spec really adds some requireed
> extensions), and use it for RVSERVER_REF CPU type?


Treating riscv-server-ref as a profile style CPU might be an easier alternative
to have what we want but I wonder if allowing CPUs to set a default satp_mode
is better long term.  I'll see what I can do.


Thanks,
Daniel

> 
> Thanks,
> Icenowy
> 
>> +    ),
>> +
>>   #if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
>>       DEFINE_RISCV_CPU(TYPE_RISCV_CPU_BASE128, TYPE_RISCV_DYNAMIC_CPU,
>>           .cfg.max_satp_mode = VM_1_10_SV57,


