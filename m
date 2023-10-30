Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E68CBC4332F
	for <qemu-riscv@archiver.kernel.org>; Mon, 30 Oct 2023 21:22:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qxZhe-0002oj-B4; Mon, 30 Oct 2023 17:21:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1qxZha-0002JC-Dp; Mon, 30 Oct 2023 17:21:38 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1qxZhY-0006xw-K9; Mon, 30 Oct 2023 17:21:38 -0400
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39UJsI7e027187; Mon, 30 Oct 2023 21:21:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=kTpptsJNUdZqwcKScBKMqEw80CPTt7/EVFJ2ZCfMGnw=;
 b=nuUo1CgvBQfC0xEiBH4PXCctaQat+5bI6atgNfNLVbcfnpMkhMGtTgFnyTbgueO3w11/
 75ZccxtmV/TL1+gCR9934gFQhtboG78kcdakNr8RZiVa0i0FIiq+kttdtUrIeoh8Jt2c
 E0gglrmAeQOiZm7xHbqUPLXs3KBt+Tk2P15jMjRMapsy7mE+BZEKjtVO17924ewBGA9+
 NcpVzVKmJkVpbFoiQ/At2cemoky60TcvMtsB05KjLpxjfF54VOIs53rLJ7QssvxFXU7x
 UWiNS85nh1Vq4b5lAKGau+YDEJV1U0elPg1FbrF5VC07KLLt6jfpW+yjbcueIpSO+sst Sw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3u2k2320f4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Oct 2023 21:21:20 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39UKml2j019367;
 Mon, 30 Oct 2023 21:21:19 GMT
Received: from ppma12.dal12v.mail.ibm.com
 (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3u2k2320eg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Oct 2023 21:21:19 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
 by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 39UIVra6000595; Mon, 30 Oct 2023 21:21:18 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
 by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3u1cmsv5sh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Oct 2023 21:21:18 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com
 [10.39.53.230])
 by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 39ULLItb29819288
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 30 Oct 2023 21:21:18 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 107B35805D;
 Mon, 30 Oct 2023 21:21:18 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9E87F58054;
 Mon, 30 Oct 2023 21:21:16 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
 Mon, 30 Oct 2023 21:21:16 +0000 (GMT)
Message-ID: <01a8060f-e106-440c-8213-3633fcfbbc69@linux.ibm.com>
Date: Mon, 30 Oct 2023 17:21:15 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/14] tpm_crb_sysbus: introduce TPM CRB SysBus device
Content-Language: en-US
From: Stefan Berger <stefanb@linux.ibm.com>
To: Joelle van Dyne <j@getutm.app>, qemu-devel@nongnu.org
Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
References: <20231029060404.71196-1-j@getutm.app>
 <20231029060404.71196-12-j@getutm.app>
 <d203aee9-f319-4ce4-9fc4-1f29440817bc@linux.ibm.com>
In-Reply-To: <d203aee9-f319-4ce4-9fc4-1f29440817bc@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: dWFVokMeo5InFzorQ9DPauW90vuxI_aU
X-Proofpoint-ORIG-GUID: qMk5Ok62WNWpZhDrKWNb0PZg-4xwir_3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-30_13,2023-10-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 mlxlogscore=894 adultscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2310300167
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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


On 10/30/23 17:08, Stefan Berger wrote:
>
> On 10/29/23 02:03, Joelle van Dyne wrote:
>> diff --git a/hw/tpm/tpm_crb_sysbus.c b/hw/tpm/tpm_crb_sysbus.c
>> new file mode 100644
>> index 0000000000..c10a8b5639
>> --- /dev/null
>> +++ b/hw/tpm/tpm_crb_sysbus.c
>> @@ -0,0 +1,161 @@
>> +/*
>> + * tpm_crb_sysbus.c - QEMU's TPM CRB interface emulator
>> + *
>> + * Copyright (c) 2018 Red Hat, Inc.
>> + *
>> + * Authors:
>> + *   Marc-André Lureau <marcandre.lureau@redhat.com>


You can add your name here...



