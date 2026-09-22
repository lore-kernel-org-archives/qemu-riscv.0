Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB3CC982FA
	for <qemu-riscv@archiver.kernel.org>; Tue, 22 Sep 2026 16:55:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x93ln-00011c-Am; Tue, 22 Sep 2026 12:55:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x93it-0005CJ-UJ
 for qemu-riscv@nongnu.org; Tue, 22 Sep 2026 12:52:11 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x93ip-0002gd-C5
 for qemu-riscv@nongnu.org; Tue, 22 Sep 2026 12:52:02 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68MEjMQb449574
 for <qemu-riscv@nongnu.org>; Tue, 22 Sep 2026 16:51:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7ZahAdzdetQRzcszcEqUBlC2urOcMootaawZNY9kO68=; b=U4ih59NhGwEnVT6x
 9YLEn3Zs9nWGggVW3wBZ0Sr+RHMtIxddSWmh2y3MZFeCZBMXx6dYyFzKUxqTwJXk
 46MnyAoKKrlJtt0YnvO++Yt3h46yedeyWbEsNtf617yTm10Fu2btBTNuJ7sIvyTF
 txDfVDZ1d+G649t4yTstZDnByw0bnrJAz4wK1PzBzpgVJzc04sIiFkS+ErpRVi5h
 mykiq2/bRGTLtOPAkOEi86UmFQfOwG6OOmCicG6Isv4Om8F3Zd55sWMRRZ8X/MIP
 yBu4aQrmpCTTzxpyEJu6Ed0mcp9IzN6pIBImpkP2kePyvyIgnQX55cfiKzu9lPdI
 5kFRDQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gunjytfre-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 22 Sep 2026 16:51:48 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id
 ada2fe7eead31-7a532e31dadso2676137.1
 for <qemu-riscv@nongnu.org>; Tue, 22 Sep 2026 09:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790095907; x=1790700707; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=7ZahAdzdetQRzcszcEqUBlC2urOcMootaawZNY9kO68=;
 b=LIGZJQeHfRIwBp/d14yT9tB9jDgxLDWJkXrRWVr0LHwC4Ni45y3plZU4AClwyJ+8xh
 Xjdr46wuNmrFt4Ck66rzR5z+j/D5ecP5OCAkQBR66x8oihzqHNhGVm8sL1ChSmJPWCds
 k9dhEN9hBlu14YaHr97mTCtllbI57jnpmr+jKLrscu5t7WzIqy5Zlvo7PZUoRE+gwJFZ
 Zv68I3XWQ3jfioTAV4YNH+9WTf45rnHlK33DRQZCzAz/Lkeq3ioeLLmdxAiFagZMfTJO
 KVyTT9CG5sZJgAmTW1S5+hMzNcJvl4WKXfoSoW1PGiocm2fgm//Yfx0W98VaxM97DnWd
 3F1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790095907; x=1790700707;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=7ZahAdzdetQRzcszcEqUBlC2urOcMootaawZNY9kO68=;
 b=2MNfiooINqVWvr2efUk9dr4NlKwuEv9jF5vlEgiKUEvdR05PfoXXiX8HLny40Z0YZP
 bI+W95CckpYmmLcUp/HTdr79UR2n/JHmD5eY9R5q4bkK0W+NqYXLj+IGnW5WPWq7SjLF
 Y1tFcCMxQ6/uuRHeI6sWPshHqnhp4+xDolpumDvPqrz7trsLlO2OOfl0BJfy6VQMMmdT
 F64zbM4BWHMtaDQhkb9rWWtuH0kKG7zs0bsYiZTYv8cSees3ydyuISwlJ+sFY0BPDunX
 Gu+UCeVdHPYMDQ/aeNGP1e46k8zdwvOzodfeietgetrhv9HexqB5K997MamHHd35FmC2
 HE5w==
X-Gm-Message-State: AFuF++nNWYvigOFeP8sVjXN/M/Vjb4yB5fZ7lDtuT4RTjus07cQt9tCy
 dy8OtfandenAJBWr3iVNcxM5/2sg+6bj7H5SRnCFKAqX2p9+MlYnxmy00UFaK/M9mGRAhvsLBD6
 VWBJiOqkQA7akWYKMdsuGaOVWmcIHpp2+xloUiEx/EUKvVh3qLLhTgIxb/w==
X-Gm-Gg: AYBFou3g5SaeVlxIVNeRbQRz+8R2c6UiUyKqFxZEMIo9UjouDX+Gb7/ANXgAJ/bntMO
 Bd34g3gs+dNZI5ozj6SJYEEPSDpMMFsoDPaJ7v/bawVdcr4CFEpFkBvEs6aoyv/idZm+UHn970E
 o9DghvmKJBmtdfoF32Z2gokYJyFhQPebeBn0jxNEl0EX8DTrOBtRRyCWe5YFDzrp5T0NbYlLT2c
 Eckt04bZE+0uIBR2lGokARIVEJWbQGgjAyLv8LUxbaHZAbN8SQzSeBsG1ZKZ0RZj3q1QpWWjhqj
 gUzpC6saFDpekjbbcOB7EoINYp9/vG92BXyiAuYZSfZsGtunYOlnwrZyxKxXu/cP8DX0nWfIHFM
 rs4YnV+hBpLxrsaYn4PM=
X-Received: by 2002:a05:6102:6890:b0:7a1:f7e2:aade with SMTP id
 ada2fe7eead31-7a55c28a6ccmr10060070137.16.1790095907454; 
 Tue, 22 Sep 2026 09:51:47 -0700 (PDT)
X-Received: by 2002:a05:6102:6890:b0:7a1:f7e2:aade with SMTP id
 ada2fe7eead31-7a55c28a6ccmr10060028137.16.1790095906958; 
 Tue, 22 Sep 2026 09:51:46 -0700 (PDT)
Received: from [192.168.0.4] ([79.127.134.52])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fde1ccb90sm3520245e9.6.2026.09.22.09.51.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2026 09:51:46 -0700 (PDT)
Message-ID: <95c0f187-84ba-4cab-bb73-7e5d43bb8553@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 18:51:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/17] target/s390x: Access S390CpuState atomically
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand <david@kernel.org>,
 Cornelia Huck <cohuck@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>
References: <20260922164936.15189-1-philmd@oss.qualcomm.com>
 <20260922164936.15189-6-philmd@oss.qualcomm.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260922164936.15189-6-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 8AQLl1XvSrmWL8D1LMJaZ6coUkM7H2-V
X-Authority-Analysis: v=2.4 cv=KqHYSmWN c=1 sm=1 tr=0 ts=6ab2b224 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=QTt6BuOzr45adi7bDCnRgQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=RzrCrBfgYV1t9sYBGf8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI0NiBTYWx0ZWRfXxC8LLf2R/cOB
 /WnCi+tTZRSUlGwD/kN7rL8IQZjnYu7jBYIuotThr7WY7EgHYbCIlmSyBv1JCXmomWk0Ag6hq6H
 VG0Nm+50fBY6Zs9fTVgINY2d17U771FDZ3YA0TTStDTxsukx3lN8Gcb53/74g2+I5TgBLj2BI9d
 5KYQC2loUyHJVBo30nqs/IhQ8EVpLjZhq5cWoaVmqYNZPZWjKrUJ9V92GSKfFpxG80NaKMLUxtZ
 4oLU0b0KnZFuTgbkUZZsuTrGED5Pi7cr3BXaLB5SqW9KqXc2IEy5/fkGGZu62RtVhxxQPgs8CXx
 BR4zOPh57MyWncbiNstiKbd20oPm/0+adyiVYmnei+jwETEqLFSdUkpUSHvbA/8SIPdRG+Is3pS
 rRgvzZt+C886GcohXAuqqQhmIAkRtoyX+BwKI7D8W5dcxp7MmVa0BfeCdfQEO1+8knanMxTMG8w
 /O3UgZ2f96STIA0YPMA==
X-Proofpoint-ORIG-GUID: 8AQLl1XvSrmWL8D1LMJaZ6coUkM7H2-V
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI0NiBTYWx0ZWRfX+5F148YYuCxs
 Lyf656UKFotJ6/C7OSmhHXLkCYwWXdg499FNZBXM6y/z829XxC50stOiKov9Od6HhGLZAzE9kQm
 6u+sye6CGo6HAL5QcCa8yv+GiqxCCWw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220246
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

On 2026-09-22 18:49, Philippe Mathieu-Daudé wrote:
> Use qatomic_read/set() in the S390 CPU state accessors.
> This avoids non-atomic reads in s390_cpu_has_work().
> 

Reported-by: Paolo Bonzini <pbonzini@redhat.com>

> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
> ---
>   target/s390x/cpu.h        | 2 +-
>   target/s390x/cpu-system.c | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)

