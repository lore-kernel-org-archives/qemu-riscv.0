Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12BE7CA9ED1
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Oct 2026 09:32:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xGCOB-000290-K9; Mon, 12 Oct 2026 05:32:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xGCO7-00028K-Hp
 for qemu-riscv@nongnu.org; Mon, 12 Oct 2026 05:32:07 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xGCO6-0006Pz-7i
 for qemu-riscv@nongnu.org; Mon, 12 Oct 2026 05:32:07 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69C8Klrw2181459
 for <qemu-riscv@nongnu.org>; Mon, 12 Oct 2026 09:32:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GyRcXF1ciT9RJ4zdYe+TPv7B62fx7H8HsxB0IuM1B6w=; b=bFFZ3IOZUP2B2CgR
 DyOeHlSBw9/5xxjveJWcvT70xDr/7/0FZiaeKb7veDu8sJRze40VsqzFYfEtvdzx
 i47dOxZC+c1mU9iZVYy7bMcH7mTRXlIBpvAZ/qqGEt4w6AaWxqNE2zlfoFYSZfkz
 IX2CQbFOBI5ctIYNJ1B+SySWr58De9L6j98yUoatctoKinlWYOTX+3OOskhleK6a
 bkqZpHn1hpNO+SGY8O2pgo7+CAmbtcctM1GZnRJvDvCVRrlU1o/JJRqPmUuA0ZBy
 DKG2StnMgDoIbNOd3GwmD1vplQC1aBiD+ChvGuOFCl4DhefiJz7EqMgxPRtGXAGO
 i3HySQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sd1s21y-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 12 Oct 2026 09:32:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93cbf2fd504so303904485a.2
 for <qemu-riscv@nongnu.org>; Mon, 12 Oct 2026 02:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791797524; x=1792402324; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=GyRcXF1ciT9RJ4zdYe+TPv7B62fx7H8HsxB0IuM1B6w=;
 b=f3ZTtxjZo3eZegjdwsGkUmuhpuWwKT0qtm3sWW6ZXWrARPMFAOO0axiZuzL5aW7SkG
 Q8C8/xhFVNcluOKz3cqE3YxfJrcDEnWfA/jum5zeS6MbMcgXcRep1CkiCjiggCIQbx3p
 ulDhs1pJwnsiHqRQ/+XtBMEV2Hmlh9N4+t5BuzOKAevhu/uer9nOOyVDF5ZRqfLtFKuu
 RA7lF7SmzsWxW6bTre75OV+bpePGkOTTdAZw3RzR6PBD+9EUMUaqK7P0BrbOKncvIsyW
 Tv1qnUEUcerr0Q643Y8io5M40zzMfkExVcvwjpeBuq4d6WtMKeeRo5qlqpD+8s46IxVs
 1uDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791797524; x=1792402324;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=GyRcXF1ciT9RJ4zdYe+TPv7B62fx7H8HsxB0IuM1B6w=;
 b=w0a8MjQNl2+31kwQ64w+fXVQwu7d8z9sRXti3J2++N7cqS+iYuBTFidY2DOhFxpfpI
 Hi0Qia92IbkrrFu30e5/e3QWJ5wzWpuOPA1fRB9OcecM4HW8+d7EUVPlJx5liRbSjRo6
 DLb9LZV+7WTX2oMB8IlnlCWxHviHbHawL3HOA4l7cmiYzX2eFjQYMsRnuuVcU/N2ElII
 gZMBnJ/s3rElh8pdqNGJwPjHz6jJR2i6Ma8FZVIuNPi7QNFLhEtZ7wEqiY7MOFrGTln8
 mo7QMVywepYLJ8ATd9BoJ/PMhI4y3qRicvXl0my2GGsqEmZ0ibu87Krv3XLukyQo7N+7
 EyQg==
X-Forwarded-Encrypted: i=1;
 AKwUvByaOCghqTSpvOEkBCogH2s1qe2bRtpt3LE39VzcPIw0iCLNlGO0g+CEbaLlNH3shwgsUnRzlXxflrJj@nongnu.org
X-Gm-Message-State: AFq9FYIoY4+IQvbsQzalAMwxsaaI9o7gYpWLpk2B6M75pp3noUkTFVVS
 eDzglJaj3bcjZzK1oeYpCWj/Yx6yRc7cj994du3iYMq7faG0cg5j2CpmPg8KEnOHE1WEb/xNBp1
 ijFakXk9KazlIJVM3ood7N4zWqu6RVfxmcZYgLGCsJuHt5O/QbpGZDeg1Kg==
X-Gm-Gg: AYBFou2wB6JKnqXNMTwyXSgXmL09/rdX/PsE17PF/+mWK13KkafuQ9bxD63Ij1tcQkx
 jHU9alUuVdIXQ+8oBY3fUp1jZ1QGxiqqKuw2Ijhzwoxk+BaThdmWzq9UFA1x1H2wWag1L7oRmPh
 lsBNDF9H3efXkjax7JrE9ozSiu0yHY9XX4LRnmII2aYiUv+JAKYSK3iYLmiUNAl5y2P6uDMy1BF
 qV0NEPIKN8nQhG5EXzzIWxBN0VMOZCKI5PB6LoMgEI1VRBIP7nZ2+5MQn5yHLUgOXheHq/XCCPR
 wOvtK7X9VL59A4R/710SGFXl280TrZplkAAWyZbe1jqevFX+tbytFoNkhQLyLTf4nwzK8ZTwGd2
 aus2Gz82yQU3j8ScIlvvB7JUJ7EoxA1OjyE8=
X-Received: by 2002:a05:620a:4891:b0:93b:c458:8254 with SMTP id
 af79cd13be357-93ebd274041mr1627688485a.46.1791797524393; 
 Mon, 12 Oct 2026 02:32:04 -0700 (PDT)
X-Received: by 2002:a05:620a:4891:b0:93b:c458:8254 with SMTP id
 af79cd13be357-93ebd274041mr1627684985a.46.1791797523987; 
 Mon, 12 Oct 2026 02:32:03 -0700 (PDT)
Received: from [192.168.68.107] ([152.234.126.58])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93eb984888esm825978785a.16.2026.10.12.02.32.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2026 02:32:03 -0700 (PDT)
Message-ID: <a60dc61d-1c0f-4f27-926d-fe9e3b607be3@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 06:31:59 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] MAINTAINERS: Update Sunil's email id
To: Sunil V L <sunilvl@oss.qualcomm.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, "Michael S . Tsirkin"
 <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Anup Patel <anup.patel@oss.qualcomm.com>, Drew Fustini <fustini@kernel.org>
References: <20261011182552.1071742-1-sunilvl@oss.qualcomm.com>
 <20261011182552.1071742-5-sunilvl@oss.qualcomm.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261011182552.1071742-5-sunilvl@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: fEHVNxpnya6OdZZV9KnBDsReEsQqFxuF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzNyBTYWx0ZWRfX0svdPL0ETOZZ
 lJQ39gmpEE4093qPlOfMF92d6aF1HVwnGwVOPLJpNrhCC3Uhdt2sFgUz4/JGFt65Qh/eoolmtKQ
 l+TsecRLmv1aApZA/exHlZRoTEtV4/s=
X-Authority-Analysis: v=2.4 cv=QtHLTlyd c=1 sm=1 tr=0 ts=6acca915 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=XIBTAJF/fpiF5bhQ2IRv1g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=bDdBU3oEAAAA:8 a=69wJf7TsAAAA:8 a=gNWp-g1RRsTVTnLNSnoA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=DN7SgORnOiO7RqxRx1GC:22
 a=Fg1AiH1G6rFz08G2ETeA:22
X-Proofpoint-GUID: fEHVNxpnya6OdZZV9KnBDsReEsQqFxuF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzNyBTYWx0ZWRfX2A8k0kYfSQxu
 e2473KQKE6kEreXLprSRv1bAJrGk7v/y7a2kiB5EtZDMd05YrSlBSGz9UqtkklOVzzMXmRUkaPr
 S5qnFabuTULKA+4vqHjNYQvAx1kHoj/bSkZR/ilWiwZ896mUwopHH33DICew4zmmaDLBqsPawX+
 /1HOaXxCqpryVC0xvpgwkiVB1ANbhegetPjerff7kwCr5Qhe0vxbQE+vKd7eRv30SmCEY1be+PY
 njH4Iyf8k3/v5+nXpYcR8t0N9ocVS6KUDtK277ymeDXJ/vifkqkHQ+4k68Tgujx+ZUZD991IqgR
 RxbLP+wCbGQEeOBs7SjxPzNXCwID1HwEQY/qu9hJ/sJWho07ay5dbRBDJcR/qEm8IFE7R3xgYCS
 tJ8wkN8LshmU9228hwRe78TbV9QhJAhz1OYqAsPLEgI9futjTMgknKSn6zKpgh6+enD6aWJS5ZO
 sJrFf9Mp3J5Ns6tYQBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120037
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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



On 10/11/2026 3:25 PM, Sunil V L wrote:
> From: Sunil V L <sunilvl@oss.qualcomm.com>
> 
> Update my email ID to qualcomm.
> 
> Signed-off-by: Sunil V L <sunilvl@oss.qualcomm.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8cc426451c2f..5c2282088610 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2335,7 +2335,7 @@ S: Orphan
>   F: hw/arm/virt-acpi-build.c
>   
>   RISC-V ACPI Subsystem
> -M: Sunil V L <sunilvl@ventanamicro.com>
> +M: Sunil V L <sunilvl@oss.qualcomm.com>
>   L: qemu-riscv@nongnu.org
>   S: Maintained
>   F: hw/riscv/virt-acpi-build.c


