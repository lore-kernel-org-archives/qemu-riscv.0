Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6799C43458
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 18:43:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wfMNe-0006rg-Di; Thu, 02 Jul 2026 14:43:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfMNc-0006nS-GZ
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2026 14:43:20 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfMNa-0006Nl-Ly
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2026 14:43:20 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 662E3c51549400
 for <qemu-riscv@nongnu.org>; Thu, 2 Jul 2026 18:43:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 dWSlHLHYuGwhQJRyL262tpz3eD7pxLYsTmkGckMVVGg=; b=gcbga0/ZorKbc6cN
 Uruqwm8B6fczwogYxDSFvGxpHgS8mLKMzNDxSAUoLCkTH+/KKB/sWouebrwvvVzI
 owpJ7+tcKwjkkGYDD4mjgzSuqZe7shju7iUbrb8CYNusf5/0MUAH9k0WnlMxwpOg
 w98nBunWnnRTCWgFUXMXA22JopAnvu/kRer7EUeX7CiukSP7IEG1CwxJo6INym05
 WE6LyoPFmQVnU+uI4eC7pGHa04DmjmaCvlZfi7lUsVpxQ0xp52u2Yrx5sfjCPS1Y
 f9gvDHfv13IANm+FmwBBWYUYZc9GG/Xtu6R7IJG+bK5759XJbdr16ngBnQWz+AVK
 0+QjVg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5h98k956-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 02 Jul 2026 18:43:17 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-8ec45d9628aso44171616d6.1
 for <qemu-riscv@nongnu.org>; Thu, 02 Jul 2026 11:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783017796; x=1783622596; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=dWSlHLHYuGwhQJRyL262tpz3eD7pxLYsTmkGckMVVGg=;
 b=TpbEqPFW2TabH1Uc6hDyyDa+lrVSkxWAIUXgDl9TtBUWlxnqo+AUCFSLkpOzArEduZ
 sI+JzPUNOu/Zn6I+ifLfZST8Uce6ItCGsGbREu18/V1r9Pku8In3eKj2/G8GDQjeekX0
 VSI4rsnSeYuDPhXXvMEAR/w61bQX/94Ct5Q6fja+9ppAaex1HQ+LJVCJoIZLLAgZkfoa
 6IYj/XnpIh0u1H8bV+6NnmDbp1LujOEm3T3JilU+1KUk1tDx/o3txXqqG6guIIH3bo8x
 avHH/UNEDokgVvq7lVfqhg79I+HODbZ0RcdheB9zEewzWsXZELEY3espky5qpMjHYJid
 4Y5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783017796; x=1783622596;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=dWSlHLHYuGwhQJRyL262tpz3eD7pxLYsTmkGckMVVGg=;
 b=p60JrWwYZTz4swsBVM9++xOSrpLYjzy3d191IVsD0L7uH0lh1DydaVUM7my2EbIf4t
 2j5/DBhwx19EspONYNNgw90gXeY148x9WuVRcKl4sCZqM9Le+1+OL+8vu4JVcFk6iK0K
 6YkMqolLAtULVzYKjGzz35HTXkOg6Pnp3qg13zkwJM7Yq/oH/CWuoKDeE+V6rvwpB8+M
 BR1lxuKjChaFL742CARbxPkgaJl8gAsImFVdcpZf4QRVzCAXeRdEpkNGuluRNKdJwv+D
 o4j3ToeD/Hb55B2DYF2RwAwadrQcogy1etvaF5wi7amDotNQFilQBqm8aVboSbfCcHER
 wEpg==
X-Gm-Message-State: AOJu0Yw6SMQlhDSk2SuCpttSxVf+bD3Iz81hVF/uN56yePKWVK9gMDZP
 2jXJ+EmacbuOrOieElZx6idpoZ2gFKmFeHYmphijH+VLyoJJge2BeXtUfqUV4Ndi4kFeeG6Ryd+
 lp69jLkCZ2nAzG6aieQw7mINcirBQH0WC5R0K03yIwHhx3dgUEwSqW0HIkQ==
X-Gm-Gg: AfdE7ckhxod9sJMftIlptvNUvbS/+s9O0m9apvvlsKSfSyk8FS2ChlXpVrHadEsQr9a
 UKtqh9gi0B9glAj+H04uRjzaYdekHLhOa/VknI3D5QOdlDg7ndwGsL3Hb00/7qCR4YTX7tAlN/D
 erL7MckBROGKbXy5CEQlrhmWVhhkmITKEZuY0lJdaewfYOOr3TziRoTbb/fjoHaaAz2V93g/kbQ
 NKz7RfMIHJ/yZHkY0V12N4yTHY7i0s0QgvrBeR+Iz9Vb7aNJ9QX4rIqj2DJcMTR2m3P5XzHLpLk
 UwLFRnMxFbHRGgK+5ns5XKSN/0t9OzR6FR0a99JjK6aTmdMHCXlvfdkHTmM5ux0kHtm0e66OT9q
 5pSHYtCDKhqz9Xl/AEVZSVrCSFBONgvArSe/xbN/Lj/9M
X-Received: by 2002:a05:6214:4a84:b0:8f1:e1ba:cdfc with SMTP id
 6a1803df08f44-8f421bab001mr131442866d6.16.1783017796279; 
 Thu, 02 Jul 2026 11:43:16 -0700 (PDT)
X-Received: by 2002:a05:6214:4a84:b0:8f1:e1ba:cdfc with SMTP id
 6a1803df08f44-8f421bab001mr131442096d6.16.1783017795687; 
 Thu, 02 Jul 2026 11:43:15 -0700 (PDT)
Received: from [192.168.68.106] ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8f46e371d55sm32478896d6.10.2026.07.02.11.43.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jul 2026 11:43:15 -0700 (PDT)
Message-ID: <80e0e4a6-3eb4-4c18-bc76-873575cfc91c@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 15:43:09 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/riscv/riscv-iommu.c: check for misaligned IOHGATP_PPN
To: "Nutty.Liu" <nutty.liu@hotmail.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 andrew.jones@oss.qualcomm.com, Palmer Dabbelt <palmer@dabbelt.com>,
 Tao Tang <tangtao1634@phytium.com.cn>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20260630203155.2103084-1-daniel.barboza@oss.qualcomm.com>
 <SE3PR04MB892210C486C30552B7FCCE09F3F62@SE3PR04MB8922.apcprd04.prod.outlook.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <SE3PR04MB892210C486C30552B7FCCE09F3F62@SE3PR04MB8922.apcprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: NVQ3MPfPS7SyyRtp7OJGWwZFxaF3t2eg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE5NyBTYWx0ZWRfX8KBxMhnI2xMs
 dK9uCYRIQ1IKg5NAV6D07dvCfHeMGDe3T0GiIZksiDsU+BH08CKRljLvKVnZExc9KMbqssS89Cv
 iEcrXyU8odZrgV1wWaKFp7bOq3PsYyRm+WWzpnkUS6KRsczV5HnA/6Ak3PEEdtRephxKQaST6Z5
 7h+QN296aEenIF9w8l7DB7/ibM0dxtbl3qLEGMFkkmOPcefWbF9HhDLvpcnHijRnM80/NkqC+wM
 FebrDnlp3X/SCPcUNkmLDEaxv85rwGTYGjxCa5eBjlCjVel5BLY60IARavnsVw6GELlNVnTFeM9
 GE07PH5WF3n1oQ0i9O1bD7vhhzlPu7z8AjXfFvgap7i2MEi1PGMPEMJ3ulkDtuwuOJhrbcexkn+
 hZb6Qm5mcpc5KiKishuTLyMuNjKbA8AP9ur7cvPmv/dlE/Uhl8IpCghiF4mLAUyFy5sg/7s5fig
 i14uNJTeABy2KDOvBDA==
X-Proofpoint-GUID: NVQ3MPfPS7SyyRtp7OJGWwZFxaF3t2eg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE5NyBTYWx0ZWRfXzpFfdbdiyiwN
 RnVzqEdv9msKd2ldEqLzGLcrYAIsY4GHg9HWjPo5Do9jUija/tntU0dNeviwXi7Nx2XZZEL8zUh
 Pb/pLWN4Z2lxzDrVvpC8uFIqCq1jD6c=
X-Authority-Analysis: v=2.4 cv=bdFbluPB c=1 sm=1 tr=0 ts=6a46b145 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=p0WdMEafAAAA:8 a=EUspDBNiAAAA:8 a=69EAbJreAAAA:8 a=VMdUOAZnqhEMiYmn0K4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020197
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



On 7/1/2026 1:02 AM, Nutty.Liu wrote:
> 
> On 7/1/2026 4:31 AM, Daniel Henrique Barboza wrote:
>> We must check if IOHGATP_PPN is 16kb aligned for non-bare GATP modes.
>>
>> qos-riscv-iommu.h needs change too since G_IOHGATP must now be 16kb
>> aligned too.
>>
>> Fixes: 69a9ae4836 ("hw/riscv/riscv-iommu: add ATS support")
>> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3550
>> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
>> ---
>>   hw/riscv/riscv-iommu.c               | 14 ++++++++++++++
>>   tests/qtest/libqos/qos-riscv-iommu.h |  2 +-
>>   2 files changed, 15 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
>> index 891a56e731..09990c640f 100644
>> --- a/hw/riscv/riscv-iommu.c
>> +++ b/hw/riscv/riscv-iommu.c
>> @@ -795,6 +795,20 @@ static bool riscv_iommu_validate_device_ctx(RISCVIOMMUState *s,
>>           return false;
>>       }
>> +    if (gatp != RISCV_IOMMU_DC_IOHGATP_MODE_BARE) {
>> +        uint64_t iohgatp_ppn = get_field(ctx->gatp,
>> +                                         RISCV_IOMMU_DC_IOHGATP_PPN);
> Seems it should be like the following:
> 
> +        uint64_t iohgatp_ppn = PPN_PHYS(get_field(ctx->gatp,
> +                                        RISCV_IOMMU_DC_IOHGATP_PPN));

Yes, I should.  No wonder I need to change the tests to make it work ... But
for some reason the bug reproducer was working.  Go figure ..


With this correction we're able to both fix the bug and keep the tests
untouched, meaning we're doing the right thing.

Thanks for both yours and Chao's comment in his reply.  I'll send a v2.


Daniel


> 
> Otherwise,
> Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
> 
> Thanks,
> Nutty
>> +        /*
>> +         * One of the conditions for a misconfigured DDT entry
>> +         * according to the riscv-spec: "DC.iohgatp.MODE is not
>> +         * Bare and the root page table determined by DC.iohgatp.PPN
>> +         * is not aligned to a 16-KiB boundary."
>> +         */
>> +        if (iohgatp_ppn & ((1ULL << 14) - 1)) {
>> +            return false;
>> +        }
>> +    }
>> +
>>       fsc_mode = get_field(ctx->satp, RISCV_IOMMU_DC_FSC_MODE);
>>       if (ctx->tc & RISCV_IOMMU_DC_TC_PDTV) {
>> diff --git a/tests/qtest/libqos/qos-riscv-iommu.h b/tests/qtest/libqos/qos-riscv-iommu.h
>> index 90e69a5d73..4a972401f5 100644
>> --- a/tests/qtest/libqos/qos-riscv-iommu.h
>> +++ b/tests/qtest/libqos/qos-riscv-iommu.h
>> @@ -46,7 +46,7 @@
>>   #define QRIOMMU_L1_PTE_VAL          0x0000000000012000ull
>>   #define QRIOMMU_L2_PTE_VAL          0x0000000000013000ull
>> -#define QRIOMMU_G_IOHGATP           0x0000000000020000ull
>> +#define QRIOMMU_G_IOHGATP           0x0000000008000000ull
>>   #define QRIOMMU_G_L0_PTE_VAL        0x0000000000021000ull
>>   #define QRIOMMU_G_L1_PTE_VAL        0x0000000000022000ull


