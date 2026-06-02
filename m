Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E9E5CD6E57
	for <qemu-riscv@archiver.kernel.org>; Tue,  2 Jun 2026 20:39:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wUVtE-0007ch-Ey; Tue, 02 Jun 2026 16:39:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wUVtC-0007bi-Ov
 for qemu-riscv@nongnu.org; Tue, 02 Jun 2026 16:39:06 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wUVtA-0000CM-Sr
 for qemu-riscv@nongnu.org; Tue, 02 Jun 2026 16:39:06 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 652Il1ln4012553
 for <qemu-riscv@nongnu.org>; Tue, 2 Jun 2026 20:39:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 OjxrF1bxgw/PGBB4TXruXcteKZIrmTQ8rM13C3DGFas=; b=EYPtYZoBgxjArDpU
 0zjqaiwCZz8zONbl7G5KgSOcEsdOrKlQKWMEuyYbDEB0/FmEkV+jj3v4OKNloIb5
 3SS53tK8SXVPlqDIsAqzCRXbQXPhoFIYC+dW4w6xXZD2QkWmMvu3gtA3zlTfzVUA
 yMtNUZbQcfJVfAnlKZUzl21CN0aBufNzrYB0XO9YvYzvmvpGr6nPsOO7kgSQS73G
 xEWgDfDXxvOH/dsJl+vKzwwYrgl95TgccfGD2AzvO8lFZHU2uqXvjgeRCpmCRL/i
 Gdr3zy1BK11RWd+qDPWhmEAYLvhIMi7/gEjTq4d6T2K7XKC5S0HlhaBiQ1LYGAlv
 yokkvQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehsf4kptk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 02 Jun 2026 20:39:02 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id
 a1e0cc1a2514c-963954cf84dso5525311241.3
 for <qemu-riscv@nongnu.org>; Tue, 02 Jun 2026 13:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1780432741; x=1781037541; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OjxrF1bxgw/PGBB4TXruXcteKZIrmTQ8rM13C3DGFas=;
 b=bdqZ/CO/EEH9R90Kq66c0HVPsxPL+hlxLslRAPLric7WGg3MV0Yy1TI7YC7X4hxvJl
 kLpeRGayxGy9IfDsd1JHMYKR7IcApL7grrMCOQi/gCANVFAsfvGRRepQsaAgdX8dd+MN
 tJ1+1hwqhPhExUXarPixeCi0d4FCUfi1knL+wM+xn/WMrKEX4egRlmt3QYox8Ttl+Zlh
 OMtyQz+bgDhlUYApYKfvcnZvpgnXuTrOU5QI+dq9pJ27UA/15FvFdbhiff6+sclF9/f8
 PawWcM2ym7Eo3r5Op3rXfPcCJC+dAdMErAMhla2jBrj3+7DRlesBGrEF3lGO3oM/QMsI
 /tYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780432741; x=1781037541;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OjxrF1bxgw/PGBB4TXruXcteKZIrmTQ8rM13C3DGFas=;
 b=bNg4K6gP8tl8Wmn6S7cE9iUwLVaH3oxvpgAUFiZmjChlZE4+84vxA5A+ZhxOItYV5O
 KMZeDrXA0U9HDbb630u3bNnvXXoTGTRCryLUsPqYn3fxizkwi90VYYcMc1REDJnfzAlY
 TPXuWNi/ezXXEavTOQx1czgJNpULAzvfBqvCOTRcM9R6fpAPgszM1Uny388y4vLt8AN4
 HbKRtBcEpnLNOTijYTXKEabUkXZxdbVXoj8yKejYfFTiZG5p8IOW71YWcjIr1QtyJBOu
 RowbK12+RiO0fPRJE2wpIXlqoqnYWlIlb9XyyOjlX1cvdWt9StcJtq/uwrrAJ2cB+EAY
 iEzQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9RLr5pIRbJy8agTSH2s82Kw0BWjO8gE2552GLZXvvX/bXWt1r8lbzzDIHAMtDjRdJBXYyD467OnPOT@nongnu.org
X-Gm-Message-State: AOJu0YygqYr/LcESIs45EEjfWqgoMZwbJXFu2FHiA1iGe4vNC32YQBeJ
 7I5KAzRvUx4Xl4+AbdPAeJp+8BI/EG5+R+QEe6b4fCRllSWUU3pExaprYXEv1WMDU5I+VY6coiQ
 6WsAH95XTRlkZtHZlFRPBb33dPR9vVnavCQmcgeCEcETArQr2oHNBbyjNHg==
X-Gm-Gg: Acq92OH8jFNiwvhKVZm9U3Ea615vcfcFO4PJbNKutwkJ/u01KAt3sRW705Ar3HFLOlF
 h/CMBkbAGBaUiDPYSc/4EhkkJP2Y1LHwW6DbHCuSzy3fO+AizmUIPdnsIMSdiYG/BzEkSB3pv2/
 +kdqoy4nyd3LH61K2sqDpIrTjc8d+900Rk89doQ4ipo7ZZ14HGUvhClpSiPuUVQLVJ3aneqC9yi
 WMUtL9G3tO7U/fq5IL4qnpE+F6BMT7J1iOq3/vtYaFh4WHp5acpI1rCyht4O0FFMYL6pw4QMIuq
 UWImI9yNzdaHIlD+GKfoaV0Arwn102q6wAeazbqhPS60R3VPyCbZ6QdZknZ5fGZygf+lughCoKP
 9+HyohLDIAWDzNeuljvj7zBpCP8TyNKkznrcXdq910XbOy94l4mI9FoQg92oWVusWRlpI
X-Received: by 2002:a05:6102:442c:b0:6cc:16d2:30f6 with SMTP id
 ada2fe7eead31-6ec55f9bbddmr153216137.7.1780432741401; 
 Tue, 02 Jun 2026 13:39:01 -0700 (PDT)
X-Received: by 2002:a05:6102:442c:b0:6cc:16d2:30f6 with SMTP id
 ada2fe7eead31-6ec55f9bbddmr153210137.7.1780432740950; 
 Tue, 02 Jun 2026 13:39:00 -0700 (PDT)
Received: from [192.168.68.106] ([177.170.117.62])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-6eb5745d325sm505737137.4.2026.06.02.13.38.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2026 13:39:00 -0700 (PDT)
Message-ID: <2b18456d-380e-4415-9ba1-b20f063d3b1e@oss.qualcomm.com>
Date: Tue, 2 Jun 2026 17:38:55 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] docs: add riscv-server-ref.rst
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 chao.liu.zevorn@gmail.com, leif.lindholm@oss.qualcomm.com,
 andrew.jones@oss.qualcomm.com
References: <20260514204640.2540054-1-daniel.barboza@oss.qualcomm.com>
 <20260514204640.2540054-5-daniel.barboza@oss.qualcomm.com>
 <CAKmqyKNNHh70cxDXEwncFk0Hngje2HbiBdmwc8KxOP8m47+HRw@mail.gmail.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAKmqyKNNHh70cxDXEwncFk0Hngje2HbiBdmwc8KxOP8m47+HRw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDIwMCBTYWx0ZWRfX5zqV55mXg9xU
 CY4cQTUwbYyPKsIyQq9PGW30y4P1hnK9OAsKsQiiwi9VS4JtdISaQeDDZq3Lk8P/pzQe8J9PRgY
 uXDRl3Xky/Tq8q55lF+neB8IYZ6j/qJww4ctxgf30x3t4pjwXN/yTPQofDbX/EB6+zJEWnf2TvR
 jRRxPRdpMDXvoIPZovBqFIJzUXenQmfjjZGN4ef8DmaVouYLrB/UmH3UE2fI9JapQBAWJbPA7F3
 0Z6LcGPWf8yWKs4M6W7xkAn20tBPPB6n8t9jGCnxIrYB4mqv7aXwFtrr5g1AkcPbJOTPIroS4zn
 /aVKvyqpQJFEkv8EPheG53INmohdkoslA5KCasQ0v1rQYIm8CRTHub50xPWILvkO33Xknr9BBP8
 a5bKGUIWxjb+w2BCjj2infrS9nUpLWI3T5rsXssUgst4wq4zM4/PhkGVw356kW1UhuAN24cbqNC
 T6UpdaIbdmu6vH/io+g==
X-Proofpoint-GUID: WJRbKV2jW8HW2LS9Uc6TUL4fbFq0vuKi
X-Authority-Analysis: v=2.4 cv=AJZ7LEvz c=1 sm=1 tr=0 ts=6a1f3f66 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=gdiugJE53z4H+vvYeRBHqw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=HLm-iaw83xql1Y3C3awA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: WJRbKV2jW8HW2LS9Uc6TUL4fbFq0vuKi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606020200
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



On 6/1/2026 12:06 AM, Alistair Francis wrote:
> On Fri, May 15, 2026 at 6:48 AM Daniel Henrique Barboza
> <daniel.barboza@oss.qualcomm.com> wrote:
>>
>> Add documentation for the new riscv-server-ref board.
>>
>> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
>> ---
>>   docs/system/riscv/riscv-server-ref.rst | 37 ++++++++++++++++++++++++++
>>   docs/system/target-riscv.rst           |  1 +
>>   2 files changed, 38 insertions(+)
>>   create mode 100644 docs/system/riscv/riscv-server-ref.rst
>>
>> diff --git a/docs/system/riscv/riscv-server-ref.rst b/docs/system/riscv/riscv-server-ref.rst
>> new file mode 100644
>> index 0000000000..7803133b77
>> --- /dev/null
>> +++ b/docs/system/riscv/riscv-server-ref.rst
>> @@ -0,0 +1,37 @@
>> +.. SPDX-License-Identifier: GPL-2.0-or-later
>> +
>> +RISC-V Server Platform Reference board (``riscv-server-ref``)
>> +=============================================================
>> +
>> +The RISC-V Server Platform specification `spec`_ defines a standardized
>> +set of hardware and software capabilities that portable system software,
>> +such as OS and hypervisors, can rely on being present in a RISC-V server
>> +platform.  This machine aims to emulate this specification, providing
>> +an environment for firmware/OS development and testing.
>> +
>> +`spec`_ is version 1.0 at the introduction of this board.  New spec versions
>> +might trigger a revision of the emulation itself, which will strive to always
>> +match the latest version available.  In case the emulation changes aren't
>> +backwards compatible we'll introduce a versioning scheme, probably via
>> +a machine property, to allow older SW to run with older spec versions.
>> +
>> +The main features included in the riscv-server-ref board are:
>> +
>> +* IOMMU platform device (riscv-iommu-sys)
>> +* AIA
>> +* PCIe AHCI
>> +* PCIe NIC
>> +* No virtio mmio bus
>> +* No fw_cfg device
>> +* No ACPI table
>> +* Minimal device tree nodes
>> +
>> +There are multiple ways of using this reference board, some of them being:
>> +
>> +* BIOS: u-boot-spl.bin; SD-CARD: <disk_containing_FIT>; NVME: <distro_disk>
>> +* BIOS: fw_dynamic.bin; KERNEL: u-boot.bin; NVME: <distro_disk>
>> +* BIOS: fw_dynamic.bin; KERNEL: EDK2.fd; NVME: <distro_disk>
>> +* BIOS: fw_dynamic.bin; KERNEL: <linux_image>; INITRD: <busybox_initrd>
> 
> Can we add a test case that boots something?

I'll add a testcase for it.  Hopefully a straightforward TuxRun ...



Daniel



> 
> Alistair


