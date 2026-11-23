Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804F3606A327
	for <qemu-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 14:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JfqKFCtr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ct15865b
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xVUeK-0002Rc-Ed; Mon, 23 Nov 2026 09:04:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xVUdk-0002Jc-M0
 for qemu-riscv@nongnu.org; Mon, 23 Nov 2026 09:03:32 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xVUdh-0001qN-FQ
 for qemu-riscv@nongnu.org; Mon, 23 Nov 2026 09:03:27 -0500
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ANDL1EW2086051
 for <qemu-riscv@nongnu.org>; Mon, 23 Nov 2026 14:03:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 AQiHntMmnvlqkvMV/Ha1Ck0HXP3c1l/WJPdOqiMIX38=; b=JfqKFCtrEmFvHqC5
 1W3XAtTuINNgxu9e9Mkv4UhcqhkTSlskGevyf1tbPvNUYtDmrWp3TZR85eS3ZKt8
 9AmYRPjX8gV1pUMi8F8y6YV2dWwCIX7Oi2lrcQ01PxDPA4bwTaR11Fc9WcCbcEld
 dS8+lrxg+CQxcohKpftv27o82aOkCl/hSPTTZJNbriZZhIr+U68cbFtBaBeZtDw+
 Y1U3Wbn1HlkNx29v04mU7nnY2C458GMKskAU96tiRNP3oMZ/71Tpz9Wq2YbRWbFv
 1jv1z2LNNrCPAvCcOsMa6PeJUIAwRDCwkd0bEboiglkxi4lgFL7w9X3GTP+J532b
 6F9fVg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fy01pkq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 23 Nov 2026 14:03:23 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-5363fa3d3e4so60213591cf.0
 for <qemu-riscv@nongnu.org>; Mon, 23 Nov 2026 06:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795442603; x=1796047403; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=AQiHntMmnvlqkvMV/Ha1Ck0HXP3c1l/WJPdOqiMIX38=;
 b=Ct15865byHHvQkbA+V6+eMmp+MMohNOLo486uYvTae3dHhatEYTeVcubUcAKWzQkqf
 LVeO5s+IYlwSX3b1L2YE3FhfrJ0AzIROtv3JRa+wJec50FHvSDr1NurRHN6Jd8QOBXtY
 q5FOtqs0zwGoliO3KcShSJqRHa2CzMKOFdj7fL6hbysUUe4Y/iDpVz3mpSMSEZ6i3wV6
 pNDqJ4SZNyFoLMToqLu/olB1rwBVABZv+8HevNBPJ+rSlHbhLO9O1FF218yyGuZR80Os
 zupO1WFjBSQB1ueHsHsGrlmkP+zJhLkEtXxU1G5VmIuWCpKu31iFIMPZ3bnzB7X4KZo3
 K3Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795442603; x=1796047403;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=AQiHntMmnvlqkvMV/Ha1Ck0HXP3c1l/WJPdOqiMIX38=;
 b=YK7LrGvANvBGldyP+CStb8w529WJQh/60b7ZmgtpqwaZ7XoRpKSx+FBYabWtAx4+/w
 oyDihC4r+6LMgQMiUo5uAMWdrsTZqEsGhF5wOwsE74P6PN51NxxyXYPrbVZWfGswcS/z
 siVeRQ+WZghl0FNnbg8Ttk9Fv/EsyIYS3y+T9/yrZErsrIti0dJW47Npzha4rjqi/ZCn
 YJpWk78+aeq8CtmoyCZk6JjY3t1uIkS1ISs9sZVkzXEsjhQD8GIE5SdzIUyNkC2RXe2j
 +VJJ2UfaBPwhO9AbFxQfEupy28Hranahe+II3ao9Zfc2Y/xlhOWwPmGTAnvbvmadiWj4
 I8MQ==
X-Gm-Message-State: APuU4Z9AYSFrqwy8R60eSotAko9uZ5Klu+1vwQnQOjvI75Vptd+bTWDG
 +QZpUjwO/yOYEpukmg2tLocDKirZMQ2fpDH8YoVINPvhzHIxzlh56ES81RvKI9IKsjgcN9upKEn
 Z+beEma0LMaf/bXcBCaQpb+e5NN5+POFdrV/vHNNzSZ5rIOKJyiTLL5VkJw==
X-Gm-Gg: AZFdTZd7K1kzftegr6d8/YmhOmwLjl5CwhktvxrwWmepq8Yv79CF5zM9VVBrXyHV6p5
 dm4dgzLKn1SGXVb4oNe314Xczs9xyajiCCOKKxzyGb15a6bgIOOqJEssXtu6O57YneriLQ5S07C
 f9QA8lLZwjfEicM8SgqBS5qIQPsc6jGrhxmuN4/o4IjNybo3jmnuCUEm9vyXu/W6A4izVDZame7
 masOWWpEwZ77rsayeM/nI/U8Bvr0Ffj+cT2k+soWe9W44Q5D3jfQAzvrZKz7+38q6gcUoiRI8da
 vEyihUkJmSXIWsnDM/jV2j8HjP4ayaogs0FXGufu2n18iqF/lD7AZzFBQSAUm2aS9oIP+BlBw64
 wJGAar6RA1M75YWV/EXm3Mdc2Jq9J0ooJCjnpl6Av1mHp8+rCOr0uQkVMd4IiUYZATPoXUZwLfp
 iAOGrUf33/
X-Received: by 2002:a05:622a:1b23:b0:55c:840:1308 with SMTP id
 d75a77b69052e-55d76ac843dmr206798421cf.60.1795442602649; 
 Mon, 23 Nov 2026 06:03:22 -0800 (PST)
X-Received: by 2002:a05:622a:1b23:b0:55c:840:1308 with SMTP id
 d75a77b69052e-55d76ac843dmr206797511cf.60.1795442601947; 
 Mon, 23 Nov 2026 06:03:21 -0800 (PST)
Received: from [192.168.68.101] ([189.110.107.17])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-55d788548a2sm98983591cf.19.2026.11.23.06.03.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Nov 2026 06:03:21 -0800 (PST)
Message-ID: <51e50192-328b-4780-aea1-06dbd89be222@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 11:03:15 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] hw/riscv: add cache_level and node properties to
 CBQRI controllers
To: Drew Fustini <fustini@kernel.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Sunil V L <sunilvl@oss.qualcomm.com>,
 Anup Patel <anup.patel@oss.qualcomm.com>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Nicolas Pitre <npitre@baylibre.com>,
 =?UTF-8?Q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>,
 Atish Patra <atish.patra@linux.dev>,
 =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>,
 yunhui cui <cuiyunhui@bytedance.com>,
 Chen Pei <cp0613@linux.alibaba.com>, guo.wenjia23@zte.com.cn,
 liu.qingtao2@zte.com.cn, Jinjie Ruan <ruanjinjie@huawei.com>,
 Jinjie Ruan <2118537295@qq.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Vasudevan Srinivasan <vasu@rivosinc.com>
References: <20261113-riscv-rqsc-v2-0-34d47fa4141e@kernel.org>
 <20261113-riscv-rqsc-v2-1-34d47fa4141e@kernel.org>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261113-riscv-rqsc-v2-1-34d47fa4141e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1NSBTYWx0ZWRfX0cUyBJ4mdIrV
 9Jqk81exho90hDVq3G9mxwOCTbs+tB6OfLOBSJ/aVxPBazu54QHa6FzuTfA33YOLoy85KRl/e9p
 hKrI7FdfXmOLxsNudP6e9UMcXOkq486bWaSrSy0AluuzKzNYb9/BJ74pYUDthYliE+li5vDBIuB
 QtgggAP/qRkjaHTaWF9CYyDSfUZaeklGIbly2vwZnZnf3mSThzHF36Ijid/CC/2dCZmEGGIliIR
 7IMRCqlHVli7MCFmYolVCQNA119aCOcOf7W1c2CB2n34Y88KqDNDG5regvt7C3OModMdc1fS0gm
 /9G6WDV1NDNS1cT0SX98FAzgNRGomv4sANHz+t2s4E3p3vXkbTO4CySdxCtapMMdwB7e/b+i18X
 bGgtQONpJIL5IySrI5cOtC6DsQQUZlQ3HalsH+xEYrKMxCnUN7ZMI5j3R5ab1qOIG/jxdwj4RWb
 9xloN7p12dhL848hvRQ==
X-Proofpoint-ORIG-GUID: RUl1Q6afiA1r5EpjuTxDurDD0D9pU5mP
X-Authority-Analysis: v=2.4 cv=QrXLTlyd c=1 sm=1 tr=0 ts=6b0447ab cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=2Chh/y2wedAoPG2p3qwUfw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=s8214ipjFJNddzb_8BYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: RUl1Q6afiA1r5EpjuTxDurDD0D9pU5mP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1NSBTYWx0ZWRfXxB25SR9+Fbhp
 o0AjHTjOUhh2ws+0oUh6radHiFEsYzdqpb6IrrA4Smgzdd5/AsbTbwOOjsZOG7DEoxd2eHww2Tk
 +dCFl3CnzIWCifyoAYm20xkLVXte2F0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230055
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/13/2026 8:12 PM, Drew Fustini wrote:
> The ACPI RQSC table specifies which cache a capacity controller backs
> and which proximity domain a bandwidth controller serves.
> 
> Add a cache_level property to the capacity controller. It accepts 2 or
> 3, the unified cache levels that the smp-cache option can place and the
> PPTT can describe, and defaults to 2. Add a node property to the
> bandwidth controller. It defaults to 0 and rejects a node the machine
> does not have.
> 
> Signed-off-by: Drew Fustini <fustini@kernel.org>
> ---
>   hw/riscv/cbqri_bandwidth.c | 13 +++++++++++++
>   hw/riscv/cbqri_capacity.c  |  8 ++++++++
>   2 files changed, 21 insertions(+)
> 
> diff --git a/hw/riscv/cbqri_bandwidth.c b/hw/riscv/cbqri_bandwidth.c
> index bd8cf2b50e4c..6c33d1738d27 100644
> --- a/hw/riscv/cbqri_bandwidth.c
> +++ b/hw/riscv/cbqri_bandwidth.c
> @@ -17,7 +17,9 @@
>   #include "hw/core/sysbus.h"
>   #include "migration/vmstate.h"
>   #include "target/riscv/cpu.h"
> +#include "hw/core/boards.h"
>   #include "hw/riscv/cbqri.h"
> +#include "system/numa.h"
>   
>   /* Property defaults, shared with riscv_cbqri_bc_caps_init() */
>   #define BC_DEFAULT_MAX_MCIDS    256
> @@ -139,6 +141,7 @@ typedef struct RiscvCbqriBandwidthState {
>   
>       uint16_t nbwblks;
>       uint16_t mrbwb;
> +    uint32_t node;
>   
>       bool supports_at_code;
>   
> @@ -542,12 +545,21 @@ static const MemoryRegionOps riscv_cbqri_bc_ops = {
>   static void riscv_cbqri_bc_realize(DeviceState *dev, Error **errp)
>   {
>       RiscvCbqriBandwidthState *bc = RISCV_CBQRI_BC(dev);
> +    MachineState *ms = MACHINE(qdev_get_machine());
> +    unsigned int nb_nodes = ms->numa_state ? ms->numa_state->num_nodes : 0;
>   
>       if (!bc->mmio_base) {
>           error_setg(errp, "mmio_base property not set");
>           return;
>       }
>   
> +    /* Without -numa there is a single implicit node 0. */
> +    if (bc->node >= MAX(nb_nodes, 1)) {
> +        error_setg(errp, "node %u out of range, %u NUMA node(s)",
> +                   bc->node, MAX(nb_nodes, 1));
> +        return;
> +    }
> +
>       if (bc->nb_rcids == 0) {
>           error_setg(errp, "max_rcids must be at least 1");
>           return;
> @@ -638,6 +650,7 @@ static const Property riscv_cbqri_bc_properties[] = {
>                          BC_DEFAULT_NBWBLKS),
>       DEFINE_PROP_UINT16("mrbwb", RiscvCbqriBandwidthState, mrbwb,
>                          BC_DEFAULT_MRBWB),
> +    DEFINE_PROP_UINT32("node", RiscvCbqriBandwidthState, node, 0),
>   
>       DEFINE_PROP_BOOL("at_code", RiscvCbqriBandwidthState,
>                        supports_at_code, true),
> diff --git a/hw/riscv/cbqri_capacity.c b/hw/riscv/cbqri_capacity.c
> index 0c572aa8b02f..1585cad1d073 100644
> --- a/hw/riscv/cbqri_capacity.c
> +++ b/hw/riscv/cbqri_capacity.c
> @@ -127,6 +127,7 @@ typedef struct RiscvCbqriCapacityState {
>       uint16_t nb_rcids;
>   
>       uint16_t ncblks;
> +    uint8_t cache_level;
>   
>       bool supports_at_code;
>   
> @@ -591,6 +592,11 @@ static void riscv_cbqri_cc_realize(DeviceState *dev, Error **errp)
>           return;
>       }
>   
> +    if (cc->cache_level != 2 && cc->cache_level != 3) {
> +        error_setg(errp, "cache_level must be 2 or 3");
> +        return;
> +    }
> +

For this kind of property that has a very specific and restrictive value range (i.e.
we'll abort if we don't get what we want), I suggest not using DEFINE_PROP_UINT8()
to declare the prop in the array.

What we do in target/riscv/cpu.c in for 'num-pmp-regions':


static void prop_num_pmp_regions_set(Object *obj, Visitor *v, const char *name,
                                      void *opaque, Error **errp)
{
     RISCVCPU *cpu = RISCV_CPU(obj);
     uint8_t value;

     visit_type_uint8(v, name, &value, errp);

     (... a bunch of checks ....)
}

static void prop_num_pmp_regions_get(Object *obj, Visitor *v, const char *name,
                                      void *opaque, Error **errp)
{
     uint8_t value = RISCV_CPU(obj)->cfg.pmp_regions;

     visit_type_uint8(v, name, &value, errp);
}

static const PropertyInfo prop_num_pmp_regions = {
     .type = "uint8",
     .qapi_type = &uint8_type_info,
     .description = "num-pmp-regions",
     .get = prop_num_pmp_regions_get,
     .set = prop_num_pmp_regions_set,
};


And this is added in a property array like this:

{.name = "num-pmp-regions", .info = &prop_num_pmp_regions},


This is more verbose but it will make realize() easier since the property
is guaranteed to be valid. 'cache_level' seems like a good candidate for
this kind of pattern.


Thanks,
Daniel



>       if (cc->nb_rcids == 0) {
>           error_setg(errp, "max_rcids must be at least 1");
>           return;
> @@ -666,6 +672,8 @@ static const Property riscv_cbqri_cc_properties[] = {
>                          CC_DEFAULT_MAX_RCIDS),
>       DEFINE_PROP_UINT16("ncblks", RiscvCbqriCapacityState, ncblks,
>                          CC_DEFAULT_NCBLKS),
> +    DEFINE_PROP_UINT8("cache_level", RiscvCbqriCapacityState,
> +                      cache_level, 2),
>   
>       DEFINE_PROP_BOOL("at_code", RiscvCbqriCapacityState,
>                        supports_at_code, true),
> 


