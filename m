Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE08D606A31E
	for <qemu-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 20:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fyFh8Ky3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EE1dedoa
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xVaHv-00063U-I5; Mon, 23 Nov 2026 15:05:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xVaHs-00062z-KA
 for qemu-riscv@nongnu.org; Mon, 23 Nov 2026 15:05:16 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xVaHp-0002Cc-6f
 for qemu-riscv@nongnu.org; Mon, 23 Nov 2026 15:05:16 -0500
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ANJuQH73255326
 for <qemu-riscv@nongnu.org>; Mon, 23 Nov 2026 20:05:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jctTf7MlA/OhyTxx8VxIJDBlWtWuAXaZzvVIWxJ7eAI=; b=fyFh8Ky3grvgGf4W
 b164bB8vpAVIfd9+dP4UC4oQXvWF1HKrg8+XVc7TR2lWygMiLmQdm1WcZXLqCG+B
 C4FgpR6P0hEOkCglnXiAmcr8KzKwSlDfI8VX6+QONwz/H0t1dXlB8hmHWptB8UE/
 M9iKCBUdgp76CLs0+SkMZPhqTJ59ft5Qm5bydPlumLwgSgDxs4ppHoh3ZVQ6znPA
 41V9G1NCEWKJFNST5hr3T2gcNxIy2J+/jlKiwg9qPalYFGhmKXncyUUZJf3SsOch
 eh/Eg+AT7wTfrjg2oH6EBnPEmUBEPQCfG6AM7qsfnMn1PsObH75EGmySYRnOGIdb
 o7i+Uw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1pb70d-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 23 Nov 2026 20:05:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-948d83322f6so77678585a.1
 for <qemu-riscv@nongnu.org>; Mon, 23 Nov 2026 12:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795464310; x=1796069110; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=jctTf7MlA/OhyTxx8VxIJDBlWtWuAXaZzvVIWxJ7eAI=;
 b=EE1dedoa6Gkw9hBh6H5J8b403otzQPaC5aLCpzF1B2yee9+eUzcM7a5Kj68EokTYMZ
 uldGhRqWCZQdYE72CdVUOFsx9G5CcqDMNym4RhTjuLZCuZI8ntvrxNtrdWnl+YWY8PxY
 ZKXYVGtUIPMZdVXiocSe/4STzJN8JNmi9rYYFyebcPZTvAfP2sXjfsdyxtdV7njl3Eaq
 zyTyi5MTy09te0DglfYFSbV2QvHpWiSScM7OF5ug9rz+lKEm0X6jaEaeTfL06++x8bif
 4uDZPBazyDzDKmP+95EAmAJgwnsuHQKp8DpN8Os+tdqidnNLT/dwvBLMouZtw9FmUg41
 aCdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795464310; x=1796069110;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=jctTf7MlA/OhyTxx8VxIJDBlWtWuAXaZzvVIWxJ7eAI=;
 b=igfatX64ko2Y15MC024dbyOeC+7NZnypEHq5LWDrIyklCy1l+ArkksVaaRszH41Y7S
 44FKOu0rpxHw7/dvfrAiAtUsniaWks22/Iir4SWsT4iSLHw/tv/vhxPMHj0dq/4dumBB
 ZN4plHRH/V2Z37MHcQFGXOIP+yxuo1mVLZ8cRUjbfigD17+g6jTAunCMEU1shpDDlsak
 VQ+w4dk1pMc5vQFsh0eCUrJUBGOkEcZTBh2dozZwf91PkBXw2Qmq2gEakkMuOehRpF6g
 PY+Uh5mlRj9dMmAEvV5vIqsh3SAgAvMiS24NXft9bYKqPF+OQ3++AhjLXVrE/OejWE4M
 Ccew==
X-Gm-Message-State: APuU4Z9074a7Cs0n59p0ZxKVB5urdkcht+5FnQUKXUVRmWX2ujWHNfbm
 WWEs87hxMeUSpb9CvpxN5HJX4Zr1ZfXoaW5uRXZGQCOTbxg31nG6XXMvjhWMn+dQT3SX8Lnji8n
 lx3P0kDnTVjr1VY6qqi30SLr8u5TMR+ayadKPD0jtIj7+cxbL74FIAQL2Zw==
X-Gm-Gg: AZFdTZdsXpclXJpplULpcwZD+DI46hWNE2ThUsnwylTmA7Xqoa2qxiJfz25f9VynoE1
 /GkkE3j+VlqDJOsrd0C3+TOskBYgLj/QxdhYmzJNCPYj8HY+7TbG6MMePx5rni3HWuZRS2jbe9W
 YYZu3ZiVE/gzWjOF5h+2ag1AycsEIpDROterOx3tIWt7hmTv9uEfxrvRfFgSc8fSFNtJIliaDD4
 thy3Tm8/GDoW8j9s7Fj8btlsqFSu5/mz7zSV7lPlnqxozmhDhDA9Z0R8jdEOzkPSFmaTiSpaJ4c
 1VYFS8M5BRbpqXXyD1TJa0Y0aalVvhCE9OF2QliRXMkiWxWErMNk2PB2AM8zR3QZgUwaAL8Xvim
 +P20RILCdWihHWBYkWQ17gpLJELMVvIL1hmNd1dWs6AKaigUMOpOMX7U/vnlC0RPFHY+lAHQp6D
 9IMbwL05tu
X-Received: by 2002:a05:620a:2995:b0:93f:43a4:a48c with SMTP id
 af79cd13be357-949baa0640dmr2226388085a.45.1795464309786; 
 Mon, 23 Nov 2026 12:05:09 -0800 (PST)
X-Received: by 2002:a05:620a:2995:b0:93f:43a4:a48c with SMTP id
 af79cd13be357-949baa0640dmr2226379585a.45.1795464309153; 
 Mon, 23 Nov 2026 12:05:09 -0800 (PST)
Received: from [192.168.68.101] ([189.110.107.17])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-949bb34ae74sm876952585a.8.2026.11.23.12.05.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Nov 2026 12:05:08 -0800 (PST)
Message-ID: <4fe0858f-aa32-4f1a-bb92-767c2e51c8a4@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 17:05:05 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] hw/riscv: iommu: Add migration support for common
 state
To: Tan Chi <tanchi25@mails.ucas.ac.cn>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 chao.liu.zevorn@gmail.com
References: <20261119024251.280765-1-tanchi25@mails.ucas.ac.cn>
 <20261119024251.280765-2-tanchi25@mails.ucas.ac.cn>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261119024251.280765-2-tanchi25@mails.ucas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfX2U3sScsH7+25
 tAWNfgHC0bvJD+s6CZpLSh73blOP3hkVHduYoO0vpConnQYH2ruwfYJnHkM0my6AoSW3JDnqkcJ
 DDDHWAZEApX59EO+NwN0/NQMkMjJovyD2/UOxAUXG1o0imeod9T5Y3+z0OvhRdB+7gFri8lsyuD
 fwn0IRc3r/7+ZBtdCplo/hhvyhu3XN+n/X7rJ5LEoOfjJu+/h9e5d9CIAc90HxrujNGvbfUZLsu
 Q482nILdUMXOZMkW/CjSZ2rYiLMwb+9KJWujo5scBXmMgylMvwuyeeGXUL9GGHmUo5AkLJJqZyj
 mGMopRh+jqZO8a9cUq4JkmvQ9UB4EadDIvFlw6EQmw47TyOsXp1TVWlkPuXS5+9spcbOUBaKL+q
 6dWLB5Z7NjkYOerknr1FwCTvOH9ckmlVgKiBzAjdQQpRLR7PqWbcLZ0vjaXeEvGr6o7gnyw448/
 gtxsQQn3KeQWjU6eWTg==
X-Authority-Analysis: v=2.4 cv=AeIkjHXG c=1 sm=1 tr=0 ts=6b049c77 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=2Chh/y2wedAoPG2p3qwUfw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=jNSlP54px0yOmMIMDkQA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: F988XQLp8LaCDUiWjPEXdJhL3HD5SBjb
X-Proofpoint-ORIG-GUID: F988XQLp8LaCDUiWjPEXdJhL3HD5SBjb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfXyg8hxLsM70DY
 SjUy6pFW1zBFz7R79brYevvjzTGZ5elFSa8fxsCXhehxBzhJDt8B/jlIrfjcU6tqfdTP9QxhVYM
 AuINZTOc5d90WzdTUkQl+XTzMGaWTtE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230079
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/18/2026 11:42 PM, Tan Chi wrote:
> Add VMState support for the common RISC-V IOMMU device to preserve
> its register state, device directory configuration, and command,
> fault, and page-request queue state across migration.
> 
> Save the HPM cycle counter state and overflow timer in a separate
> subsection when HPM is enabled. Rebuild the HPM event-to-counter
> mapping from the restored event selector registers on the
> destination.
> 
> Signed-off-by: Tan Chi <tanchi25@mails.ucas.ac.cn>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   hw/riscv/riscv-iommu-hpm.c | 27 +++++++++++++++++++
>   hw/riscv/riscv-iommu-hpm.h |  2 ++
>   hw/riscv/riscv-iommu.c     | 54 ++++++++++++++++++++++++++++++++++++++
>   3 files changed, 83 insertions(+)
> 
> diff --git a/hw/riscv/riscv-iommu-hpm.c b/hw/riscv/riscv-iommu-hpm.c
> index 9bfef6db45..9656fdc839 100644
> --- a/hw/riscv/riscv-iommu-hpm.c
> +++ b/hw/riscv/riscv-iommu-hpm.c
> @@ -381,3 +381,30 @@ void riscv_iommu_process_hpmevt_write(RISCVIOMMUState *s, uint32_t evt_reg)
>   
>       update_event_map(s, val, ctr_idx);
>   }
> +
> +int riscv_iommu_hpm_post_load(void *opaque, int version_id)
> +{
> +    RISCVIOMMUState *s = opaque;
> +    uint64_t evt_val;
> +    unsigned int i;
> +
> +    if (!(s->cap & RISCV_IOMMU_CAP_HPM)) {
> +        return 0;
> +    }
> +
> +    g_hash_table_remove_all(s->hpm_event_ctr_map);
> +
> +    for (i = 0; i < s->hpm_cntrs; i++) {
> +        evt_val = riscv_iommu_reg_get64(
> +                    s, RISCV_IOMMU_REG_IOHPMEVT_BASE + (i << 3));
> +
> +        if (!check_valid_event_id(
> +                get_field(evt_val, RISCV_IOMMU_IOHPMEVT_EVENT_ID))) {
> +            continue;
> +        }
> +
> +        update_event_map(s, evt_val, i);
> +    }
> +
> +    return 0;
> +}
> diff --git a/hw/riscv/riscv-iommu-hpm.h b/hw/riscv/riscv-iommu-hpm.h
> index 5fc4ef2e8b..516974ec87 100644
> --- a/hw/riscv/riscv-iommu-hpm.h
> +++ b/hw/riscv/riscv-iommu-hpm.h
> @@ -30,4 +30,6 @@ void riscv_iommu_process_iocntinh_cy(RISCVIOMMUState *s, bool prev_cy_inh);
>   void riscv_iommu_process_hpmcycle_write(RISCVIOMMUState *s);
>   void riscv_iommu_process_hpmevt_write(RISCVIOMMUState *s, uint32_t evt_reg);
>   
> +int riscv_iommu_hpm_post_load(void *opaque, int version_id);
> +
>   #endif
> diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
> index 5b1a388364..7c23e32693 100644
> --- a/hw/riscv/riscv-iommu.c
> +++ b/hw/riscv/riscv-iommu.c
> @@ -3067,6 +3067,59 @@ void riscv_iommu_reset(RISCVIOMMUState *s)
>       qemu_mutex_unlock(&s->iot_lock);
>   }
>   
> +static bool riscv_iommu_hpm_state_needed(void *opaque)
> +{
> +    RISCVIOMMUState *s = opaque;
> +
> +    return !!(s->cap & RISCV_IOMMU_CAP_HPM);
> +}
> +
> +static const VMStateDescription vmstate_riscv_iommu_hpm = {
> +    .name = "riscv-iommu/hpm",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = riscv_iommu_hpm_state_needed,
> +    .post_load = riscv_iommu_hpm_post_load,
> +    .fields = (const VMStateField[]) {
> +        VMSTATE_UINT64(hpmcycle_val, RISCVIOMMUState),
> +        VMSTATE_UINT64(hpmcycle_prev, RISCVIOMMUState),
> +        VMSTATE_UINT64(irq_overflow_left, RISCVIOMMUState),
> +        VMSTATE_TIMER_PTR(hpm_timer, RISCVIOMMUState),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static const VMStateDescription vmstate_riscv_iommu = {
> +    .name = "riscv-iommu",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .priority = MIG_PRI_IOMMU,
> +    .fields = (const VMStateField[]) {
> +        VMSTATE_BUFFER_POINTER_UNSAFE(regs, RISCVIOMMUState,
> +            0, RISCV_IOMMU_REG_MSI_CONFIG),
> +
> +        VMSTATE_UINT64(ddtp, RISCVIOMMUState),
> +        VMSTATE_UINT64(fctl, RISCVIOMMUState),
> +
> +        VMSTATE_UINT64(cq_addr, RISCVIOMMUState),
> +        VMSTATE_UINT64(fq_addr, RISCVIOMMUState),
> +        VMSTATE_UINT64(pq_addr, RISCVIOMMUState),
> +
> +        VMSTATE_UINT32(cq_mask, RISCVIOMMUState),
> +        VMSTATE_UINT32(fq_mask, RISCVIOMMUState),
> +        VMSTATE_UINT32(pq_mask, RISCVIOMMUState),
> +
> +        VMSTATE_BUFFER_POINTER_UNSAFE(regs_ro, RISCVIOMMUState,
> +            0, RISCV_IOMMU_REG_MSI_CONFIG),
> +
> +        VMSTATE_END_OF_LIST(),
> +    },
> +    .subsections = (const VMStateDescription * const []) {
> +        &vmstate_riscv_iommu_hpm,
> +        NULL
> +    }
> +};
> +
>   static const Property riscv_iommu_properties[] = {
>       DEFINE_PROP_UINT32("version", RISCVIOMMUState, version,
>           RISCV_IOMMU_SPEC_DOT_VER),
> @@ -3094,6 +3147,7 @@ static void riscv_iommu_class_init(ObjectClass *klass, const void *data)
>       dc->user_creatable = false;
>       dc->realize = riscv_iommu_realize;
>       dc->unrealize = riscv_iommu_unrealize;
> +    dc->vmsd = &vmstate_riscv_iommu;
>       device_class_set_props(dc, riscv_iommu_properties);
>   }
>   


