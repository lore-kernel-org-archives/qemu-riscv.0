Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF17AC5DF85
	for <qemu-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 13:55:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wx3Ed-0008Cc-T6; Thu, 20 Aug 2026 09:55:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx3Ec-0008Aw-M5
 for qemu-riscv@nongnu.org; Thu, 20 Aug 2026 09:55:10 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx3EZ-0002vQ-N2
 for qemu-riscv@nongnu.org; Thu, 20 Aug 2026 09:55:10 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67K9JL4s2927387
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 13:55:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 cNqSTio/80AhQH9gcvfRiLCoMn3QHaKni6/LNlZbDAk=; b=fQiT0gPr1RR7dM90
 bRZQf/VARVesYMGQx2ayRy8m53GSndN0wDH059tPjG6f1mklj54orhcZfTztGcVv
 wQFLolNfTfg11vWu/ImFtblNQGh49cCT2/GMG/cRtvg5nQN1bTPM1ItagNysQA2J
 mQTpjShoIaSfu8W5tSymKdzsDFzVdHrGzsWlpXbpasx7M2ikFKL3046cfPuFSqTL
 bCIwzla0NzRgV97kJGHkeTlfvCGnIEhYbXGud63NKuhAXZzLle7DpxjPcL3JhPKY
 ZbboQOAcOnk37hnvsx+uq6DBnhAfJELB3w63qgAloBJBjj6qoLwBvkpS2wr2/ab2
 VnJqsg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5xuk11fg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 13:55:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-92e5e38fbc5so293154685a.2
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 06:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787234105; x=1787838905; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=cNqSTio/80AhQH9gcvfRiLCoMn3QHaKni6/LNlZbDAk=;
 b=UAMRT1zx/vfcVvMZGxyzqifRE6o1e0OQ+WuK1Yf+eOUp987JibTqVt7wYPRBo6P+/8
 cNBk6fcsuiQzlI03d2fJhR8ZWetFRM+C1gKR+RAfrKG5osvvqoWvkbPkBs14/z4hm9fQ
 gyGTlTIsCOEQ4wl5iOQVhxgDy6qUmKR7Uf80hUd1xx8X5H83OG4UIQmF7o+k5cYEnuLf
 JaTxSNCR7JG5kwyl72hZab/VUk4FW6U8FRdFsGuYuFceXgc3356Bi7KsQzWWHTOuKdJN
 1Amle+rcYRPoxbQ2HwHGWva/+8SqvZUDLkNx/nqsTT2yXme4IQKYckReXnOzawYAOuYs
 J3wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787234105; x=1787838905;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=cNqSTio/80AhQH9gcvfRiLCoMn3QHaKni6/LNlZbDAk=;
 b=Yoi7pSXUvtnk6hSXDnRbZ9aecnKp6axEpHGqQq2TA2xAD5aFtptgSnYBbMO/F8Y0v1
 WHeUIVYqSJ7TU9WhmGLW6UtnbzlFkLZi6hdFHBfzrDGKHOlD8nCa8N7RAnL5SnKoDS3K
 JG3ZWo/dZ+LGhnr/L3ZAc2UfN51WnATpubnlwBPE8CKWEXwglIAk1je1Wj7FkIlqqMYy
 Me+hqfjC5w1/S8wD3R9809Ii0XMNQ1RFi0HX4UDdoW6hNIyY8GYl/z+CmJQxYBapHqtJ
 u+JuEvo2nYZRg3KQJYFrHuTdJV1MlK38XjGo2gUzmxKbYAFfmxNp6T62RHFigJOKByPa
 bUmw==
X-Forwarded-Encrypted: i=1;
 AHgh+RrvmJ3gahUr4VoFg2fy+O67fcXXWbEjyW8cnlKumA7LpLkUsc83hX7cy6lusPWMjwK3eeBAvOaMIAUC@nongnu.org
X-Gm-Message-State: AOJu0YyPuI0h1iZg0E1g1BAafUKgq6jJPPDrF25Sh2+Ubx9HqHVK9GgK
 TdKZxBhWO/7HWGoJGOkAVThiXfHZUp13qvMFDWwBfIHiZGEGSx2x46FI0NVWgVKpUc+57528epc
 xvsG5Ns6w9kcA422MxjyiSNzwb68AVOBV/a8ZeHT6B8z1uV6T0BeuZZv14Q==
X-Gm-Gg: AR+sD13ViSd8ONswJQ6dxDphB18buHFxlgotHwg4759GGe4D1VW7TSmXL/ZtE+lY/2l
 9sMo4oFRT9951Nio8pbiURZFLNzSbf1j7oK9+EnzsoSWpK/xEA6OB6ncmXh3+DHtKLJOYxEJTPE
 LcPTP18FiPakXxGQ2M1zUieFMiV8B2O7V5aEbREiXtKNr+xKhqUkYMtxmwZaZvO6jviBI05cYaa
 5N7qug/l9Khu+PYzYXCN5pYhkVkjB8b5R9EZuuegl4GZxXoIRXjpS3ASb+arQMg2gy49kPr+Qo3
 xBipGKaSZO0yfcqbQlixLVlWKz2XHv0hcvzf/kKlCR8rGAM3rJuy6rEizFVTxRKuA2ou4TBn2mc
 weaaTD9aE54feKJc3D665NgXvq6oe2GLENX59+S0B
X-Received: by 2002:a05:620a:4111:b0:936:9525:e952 with SMTP id
 af79cd13be357-9371e66fa14mr1114332585a.41.1787234105095; 
 Thu, 20 Aug 2026 06:55:05 -0700 (PDT)
X-Received: by 2002:a05:620a:4111:b0:936:9525:e952 with SMTP id
 af79cd13be357-9371e66fa14mr1114324885a.41.1787234104562; 
 Thu, 20 Aug 2026 06:55:04 -0700 (PDT)
Received: from [192.168.69.231] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499a9e805a4sm160437145e9.4.2026.08.20.06.55.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Aug 2026 06:55:03 -0700 (PDT)
Message-ID: <3b8a8e0e-de7c-4c01-a1cf-2b86f6c74b7d@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 15:55:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 13/13] cpus: Constify @cpu in SysemuCPUOps::has_work()
 handler
Content-Language: en-US
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Brian Cain
 <brian.cain@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Helge Deller <deller@gmx.de>, Zhao Liu <zhao1.liu@intel.com>,
 Song Gao <17746591750@163.com>, Bibo Mao <maobibo@loongson.cn>,
 Xianglai Li <lixianglai@loongson.cn>, Laurent Vivier <laurent@vivier.eu>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Aleksandar Rikalo <arikalo@gmail.com>,
 Stafford Horne <shorne@gmail.com>, Nicholas Piggin <npiggin@gmail.com>,
 Chinmay Rath <rathc@linux.ibm.com>, Glenn Miles <milesg@linux.ibm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Yoshinori Sato <yoshinori.sato@nifty.com>, Cornelia Huck
 <cohuck@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Ilya Leoshkevich
 <iii@linux.ibm.com>, David Hildenbrand <david@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>
References: <20260820104730.25462-1-philmd@oss.qualcomm.com>
 <20260820104730.25462-14-philmd@oss.qualcomm.com>
 <178723213517.2730041.8745378645612815468.b4-review@b4>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <178723213517.2730041.8745378645612815468.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: oIeCn3w6J4lteRp0AEXc0AG-Xc8Kg3so
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDEwNCBTYWx0ZWRfXzoTC1fRUYbjQ
 vw5zNsNDhC2HWVQZq+iXHTcttN6IuBh0O9EhyvYiOHhlYV9CpqGNW8rPWDGBLNhnF2Q1C7uaZni
 Xn5ljdYK0EAgkRklBS9/MZqQmQEfKQM=
X-Authority-Analysis: v=2.4 cv=T/O8ifKQ c=1 sm=1 tr=0 ts=6a870739 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=3P15AqrnF0164yn1b9kA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDEwNCBTYWx0ZWRfX/kRpHc/jxt7n
 Zf9VrSHgqPN5Fz8qV0iuutZqZe0imX4bwH9txvmK8GN8WDYzSazcQTxJeuW7HKZ+IGOknAq0tio
 FwjpOVA30rOMx4Db2kFtsyQXLxKFtNQ1vRYiKfQOAdZonQkBx3+9h6Su51dYu6UmpxEbKqB/GPp
 3MTJCKpnSZlRpiv8R7wvdavCgcbJb/vFpm41ujv5KfurUNmyj3zxS0U1iuR5yxNiOK7nX4AucP0
 RLQ0td9a7COw9OEYW3WS/pSXS9eqtsbcnNDitGBQuETxKrfUSxL++gtViN+d+BZUFgBjP0dS0A+
 xb3YAqm7pmct0BPf8WRbcn5GxqXs8m/79wgZPhbRAXAygDGWacrjemThwoBep/HQZni4OrYVx94
 uprOHw3qstoJuc4v1tLn7TNRYgisCSYouToMmrecb8LpAQRliecz+BPYbGXHyR8U7YZFduS2Q5T
 QqrO2nUOIptUQ5uhjkw==
X-Proofpoint-ORIG-GUID: oIeCn3w6J4lteRp0AEXc0AG-Xc8Kg3so
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200104
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
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

On 20/8/26 15:22, marcandre.lureau@redhat.com wrote:
>> All functions called by target has_work() handler take a const @cpu
>> argument. We can now fulfill the comment added in commit c2804566f6
>> ("target/arm: do not clear halting reason in has_work helper"),
>> qualifying the handler const to denote its idempotency.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
>> Message-ID: <20260820104730.25462-14-philmd@oss.qualcomm.com>


>> diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
>> index dcd5c5065bcd..837ecb9b343f 100644
>> --- a/target/tricore/cpu.c
>> +++ b/target/tricore/cpu.c
>> @@ -111,9 +111,9 @@ static void tricore_cpu_reset_hold(Object *obj, ResetType type)
>>       cpu_state_reset(cpu_env(cs));
>>   }
>>   
>> -static bool tricore_cpu_has_work(CPUState *cs)
>> +static bool tricore_cpu_has_work(const CPUState *cs)
>>   {
>> -    return true;
>> +    return true; /* XXX */
>>   }
> 
> Add more explicit FIXME?

Oops this was a dev comment for myself ("this is dubious, better
review"), I forgot about it :/ As mentioned Peter in commit
de680286b52 ("accel/tcg: Make cpu_exec_interrupt hook mandatory")
"Tricore doesn't currently implement the architectural interrupt
handling" so here I'll simply add:

   /* Interrupts are not implemented */

Thanks for the reviews!

