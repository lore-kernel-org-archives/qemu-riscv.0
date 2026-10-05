Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A172CA5FF5
	for <qemu-riscv@archiver.kernel.org>; Mon,  5 Oct 2026 13:35:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xDiqX-0001lM-VF; Mon, 05 Oct 2026 09:35:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xDiqM-0001a8-VG
 for qemu-riscv@nongnu.org; Mon, 05 Oct 2026 09:35:04 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xDiqH-0005u7-8r
 for qemu-riscv@nongnu.org; Mon, 05 Oct 2026 09:35:01 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 695CFNCx1527656
 for <qemu-riscv@nongnu.org>; Mon, 5 Oct 2026 13:34:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 LZ4EJ7lmFpUwukMRrcGizDRsY8ibjTYc8PvBHvmSrfw=; b=CWQVOJdDOTDPbH1O
 NfS9xAxzkpQCdSPPWEAKqjJ+nmQuGnkVpn5Bsynp24goBkSvPYxdVo/R+VFxnxn3
 aCj0S9Z1pgbzBwyAo9eKwPSSP9pnb1vcS2TssOYQOeqor1PFgl9QQxQFIWFI+3xl
 lfe79WT/XIu8gZ8Bl0E/xoWedZMtuBnaXxeaCKjkvZEmebGQJWVmrC1lvMPxgOvY
 QP3M4CZVcyN3HhF6UTwTuXxMxxqdlpKPUyg2IwaJStcRb695yBuKn+yjAHqgAZOA
 j+DOAHHxJZxn03PWrRi3qpJ+KvvHAEFfYSztq9B5k6KKngyanNW8KRoWT+KQYzOz
 x3epNA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4a7drkd5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 05 Oct 2026 13:34:55 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id
 ada2fe7eead31-7bdb408a368so430682137.2
 for <qemu-riscv@nongnu.org>; Mon, 05 Oct 2026 06:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791207295; x=1791812095; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=LZ4EJ7lmFpUwukMRrcGizDRsY8ibjTYc8PvBHvmSrfw=;
 b=C9oD+T11B6NyP5BsQgCJ5o9glWtcw35lV8f1n6hwLWT/1XaxO6WZ1oXw9Yq0uS/v6B
 zPGsRDrrv9sDH/J3OQuYfwys8nmtrgQ9BGoimT81HviOrc4cogTuOE4kHSRlFGw8nJy6
 lWfrPo9oQGjBb6w/zKSPS1LlQBh9EBiG/Y0EAOUNaCbg+goaZ+rGnu6Y/IP7qevPVwDI
 WR8raXSZMqdkVqkeN1l3AAW0MBXR9r25cH2zSkSOUTrJ/us1Ab6sevB/hP3F0U2uc1Ri
 Snyk1oQezUZ/1vUIJSKRx3RFkfq6BqzR5SLqwO1WaVyvfDwW5LJln114om8y13B9sCXc
 bJ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791207295; x=1791812095;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=LZ4EJ7lmFpUwukMRrcGizDRsY8ibjTYc8PvBHvmSrfw=;
 b=GXOUR+pDwuAQf08QHfcY2TJCbW3h8B8lhG7m0JbBRcilRNg78x88FGJXP5hDZnAc5a
 HfZeCBskKgpFlAdfLFRIaCI4GvO6KhB2aOrM2udp1GVmmm9HUwgtGDNIaopTC6mu84Se
 cmWxqRDRrOQ0p0ZfXLOs1aERgE6P9JcXF8g1UcCUhYZi8Moc7CTOn07BzfP8hnBJ25ra
 UABPaA6cg3DbpBHp37np0DfYlcyzJejsiylb7ZsUk+PiB1/3YNTJQn/86/aADXfKFAGW
 GT8az1OX1N2iiNeaioD/QXcQONAlcifduaZFf95BBU7mD4HFMk7eMLtgeZAw8uj89F2Z
 lT6A==
X-Forwarded-Encrypted: i=1;
 AKwUvByh/nwB8LLusj5Yszatrt5OBSqXj2BZEDc6K/7euzy58qIJLDoiHR8EgiyqQEZWL2ASNBVpf/ZIMO5m@nongnu.org
X-Gm-Message-State: AFq9FYKhcXt3GB17UJ5D7Mk0pTUVX1R7GKpFzBf2CtQ5FuLH03ntFCso
 HNRQ5NdtPg+H85PVkHeOgIr3b0XcfMYv9lgLXWCjkapyjJvN0mYCYG3Jz32xkQ3qdKvcbmfu1so
 owKRjCfQ4KYn0XWHyASwYapOwRj2AfovMqBDnhxPA54X+DtfA1ey2Hkba0g==
X-Gm-Gg: AYBFou2coUDA9mDuN4Ko7yNfTzxqZlH0gF/InoH1tgl2HeHBSRyXJgdzX49jhNpARaD
 DX3rMKotu/EyrjgeyTHxE/eEWDhcedhNw9g02plpr6nKR+R0R/DHSC+reGLiKGCnC7rCFk9zYAa
 6QylIxAlA5ZhTQyr4Am0ffzo+d3MWxwlf7wzVATAMqPy4A9D+qt+wOquYF4v0tLU2YYrVwxWtSG
 TzvIJHo9Mf52y/fZv6g32+AE4AgcyU7aso2w2o6KjIDKAwW5HNX3GDGINPzH2ZLzsf3/g1llK1D
 T0YqgAxzczS46FC44HiN6pQBpwzUidIJ6/YzqREd1KLnrKKbF4FEYbGVk38XI+23S0GuXUkGJSE
 WMY+/czOOtL8zGsAW5Qlgb1iPfkVpKa8vuA==
X-Received: by 2002:a05:6102:91b:b0:7c3:881f:b620 with SMTP id
 ada2fe7eead31-7c3881ff813mr919258137.21.1791207294793; 
 Mon, 05 Oct 2026 06:34:54 -0700 (PDT)
X-Received: by 2002:a05:6102:91b:b0:7c3:881f:b620 with SMTP id
 ada2fe7eead31-7c3881ff813mr919248137.21.1791207294089; 
 Mon, 05 Oct 2026 06:34:54 -0700 (PDT)
Received: from [192.168.69.225] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c6773663dsm76912f8f.4.2026.10.05.06.34.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Oct 2026 06:34:53 -0700 (PDT)
Message-ID: <5e64e1e0-d733-4f8e-98b4-8e6b554101b2@oss.qualcomm.com>
Date: Mon, 5 Oct 2026 15:34:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/28] hw: mark secure machines for x86, s390, ppc, arm,
 loonarch, riscv
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org
References: <20260911143627.2743803-1-berrange@redhat.com>
 <20260911143627.2743803-2-berrange@redhat.com>
 <f1481bad-4dbb-414c-801e-aa24a6977b18@oss.qualcomm.com>
 <asOk6i4CNT9P6Bs-@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <asOk6i4CNT9P6Bs-@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA1MyBTYWx0ZWRfXwdfdAE4kBXD1
 UJq51fOvmPDrqe+8nLIPWmpnjr7q85CvH4utc6y8LrO9dLbj2wkAeB6bccGfZosThdq6MaulTKh
 HjI9RUca+ody4EehFKIDXeMBvmAPmQU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA1MyBTYWx0ZWRfX+4yhRcamJRKx
 aLXpDYQ9pYJSPjz1uzON5ZOYwx/e3TKa5aes5YQ0WfrUpKJllIYxOF13lEaljHf1BjOuRhmZlST
 dR2EIFrVF42Ky0+Ep+G4XNqUv4GUfOAVHKE2fX0ABOgDHzi7Hq3Jo13wvei2kqP//5xxiAXfvzQ
 m5K6Bo/QOIVcd7fphc1EP0oZSmXBQ12tEp/qmDymkGkCfLlCd2QEBCszXXoBm/0z5+s9Tu56pzn
 NNEHNPiFYlfuljRoHE+EjJAq+Sc0SYIIZ/CzZA5dcMC/oKIMbL2Zk1Exeo7DJ0vZvLw9lC2gFlx
 OEDB2nBC6qzjyesVDLqC77znRNFfeV5SRLADg8HPV+n/ueUGTL032fgxdislRQokKTtwB5Cux9u
 17JMlRATWihGsDkT8oeCCIdC9UXhBBhh4TGjVkc4daOpS1P8omunLzRt0X1wozMdWqLKpMa3MdI
 6M7evxRaCZYsMe67pLQ==
X-Proofpoint-GUID: A5ayqEG75SKqm2FrZi401NURs4jugF8Q
X-Authority-Analysis: v=2.4 cv=SvwFe/O0 c=1 sm=1 tr=0 ts=6ac3a77f cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=ID6ng7r3AAAA:8 a=20KFwNOVAAAA:8 a=CtHk5BvZtinuqIhR7bsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22 a=AkheI1RvQwOzcTXhi5f4:22
X-Proofpoint-ORIG-GUID: A5ayqEG75SKqm2FrZi401NURs4jugF8Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050053
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

On 5/10/26 15:23, Daniel P. BerrangÃ© wrote:
> On Mon, Oct 05, 2026 at 03:06:08PM +0200, Philippe Mathieu-Daudé wrote:
>> Hi,
>>
>> On 11/9/26 16:36, Daniel P. BerrangÃ© wrote:
>>> The versioned machine types are typically present for use in
>>> virtualization use cases and can be expected to provide a security
>>> barrier. The only exceptions are the m68k versioned machine types
>>> which are only used with TCG. There are also a handful of other
>>> machines declared secure in docs/system/security.rst, notably
>>> the Xen machine variants and microvm.
>>>
>>> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
>>> ---
>>>    hw/arm/virt.c              | 1 +
>>>    hw/arm/xen-pvh.c           | 1 +
>>>    hw/i386/microvm.c          | 1 +
>>>    hw/i386/pc_piix.c          | 4 ++--
>>>    hw/i386/xen/xen-pvh.c      | 1 +
>>>    hw/loongarch/virt.c        | 2 ++
>>>    hw/ppc/spapr.c             | 1 +
>>>    hw/riscv/virt.c            | 1 +
>>>    hw/s390x/s390-virtio-ccw.c | 1 +
>>>    hw/xen/xen-pvh-common.c    | 1 +
>>>    hw/xenpv/xen_machine_pv.c  | 2 +-
>>>    include/hw/i386/pc.h       | 1 +
>>>    12 files changed, 14 insertions(+), 3 deletions(-)
>>
>> This patch should be split per machine / area of maintenance,
>> so maintainers can officially Ack their commitment to security
>> boundary for their machine.
>>
>> I'm not sure LoongArch / RISCV / PPC are. If this was previously
>> discussed, then pointer to the public discussions should be listed
>> in the patch description.
> 
> Those are explicitly documented here:
> 
>    https://www.qemu.org/docs/master/system/security.html#virtualization-use-case
> 
> so this patch is just encoding what has already been defined.

I probably missed when this was accepted, we are good then!

That said, 1/ Nitro Enclave are missing and 2/ this series organization
is not easy to follow to me: I'd rather a per-machine approach, with a
'info qom-tree' output justifying the devices, then finish the series
with busses-based devices expected to be secure. I dont quite follow
this approach. I'm not asking to redo the series since it is already
reviewed.

