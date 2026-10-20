Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3135606A31A
	for <qemu-riscv@archiver.kernel.org>; Tue, 20 Oct 2026 19:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KEFA6U7r;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X+kAnYg/
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJFdA-00051O-FP; Tue, 20 Oct 2026 15:36:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xJFd9-00051G-5q
 for qemu-riscv@nongnu.org; Tue, 20 Oct 2026 15:36:15 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xJFd6-0000EM-SA
 for qemu-riscv@nongnu.org; Tue, 20 Oct 2026 15:36:14 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69KJI3dX1508779
 for <qemu-riscv@nongnu.org>; Tue, 20 Oct 2026 19:36:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Zm1GplTLJCFEHQBBO5u9p6Q4G5v5I2vGYCddqLp2fgk=; b=KEFA6U7rwFiUxbSU
 0/52t6VsuONpMOyBqshM6s7RyoxyeeUJSG0zXBzkXFGnijEmPeaac2q+kM4Q0L4x
 aaqYFD2EZ02NE+9kn7uw4rVMbwreGa0AgUbmqwH8zqNDKIGe/DiZyzl1byuZM3ul
 Q4CWl1vqO98NyzTu4QuE/nhuTu7UdY2mfNeHOlD5eShuDXOtxIfRPIBkQ//Amcmu
 PHajFuU6ISoL06VzH0u8y61PRyjrCjC3v8cIRFlGbdkEYovHh90N25nWCIAyMiuS
 oUJ3laAf8SaBHOy9XZqvG7W91YbELaH+CR1RLhTMFDAxeVCSeq12x2zT+6W4UQKA
 OTw5bg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heeb98205-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 20 Oct 2026 19:36:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93f3969a2a7so419885a.2
 for <qemu-riscv@nongnu.org>; Tue, 20 Oct 2026 12:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792524967; x=1793129767; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Zm1GplTLJCFEHQBBO5u9p6Q4G5v5I2vGYCddqLp2fgk=;
 b=X+kAnYg/psOqAjKhlxl+MVxjlGGeRGUX89xqlYZmi88a8zW52m6uhAsNiY2Y/MvkaU
 EV1RH5N45ZLJAcfikRM5sI7GRWpqUL4VsGzEpgn1gSkB9CnO0igWfZfZsEMVH8vvOxAO
 U5Esrh0JYefhZsgymBcLAnRtwwLBZVY6rJgs+qVwc6WmbTaOtIluUtCTs8kQd12JgyPS
 QWrz4ehkcS2ju6NuLu+rmw6+PZ75oEV7E6td1fJPFGtzRv5f7RgafN9sZO7TWbRS3qlw
 bFDjcvAU+77ommZoQVLkq1fHT23pMnfKTjuk+kMbCy1fRSbqjokdi7ITrZsd1Em69Q8O
 uXfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792524967; x=1793129767;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Zm1GplTLJCFEHQBBO5u9p6Q4G5v5I2vGYCddqLp2fgk=;
 b=BmaHhyVY/JHyvjatth6/1LRwPSC6u2OI+vxECxNgD5mwks3NMHxyn4Rv26/BNNbiWg
 7nL5QARKcIQeFBA8Tk2u/oDiIW+YUCHUX6Yl4N6+uYN0rCKMMu6YP+pjmVCC5eSdXb2r
 uzHXeUuCbzYmDbJmG5Xj2wyvaAZEjWBg+yD6U+N1MYs9OCpxGfNPw9c6pORQ7Dv+mep8
 r5mfINCWyB6AASi91bVkLbwzSHwawm8F19yh0VRBjMTbIfyTIs4yXmtOwpwfWtVLBQOC
 RuHiWIdwKpuY2IlFvikHJRz0lB73LT5FT9Zs/0eS52Z6wiR4zVB1Znswb1NpM9CJjiDC
 gc1g==
X-Forwarded-Encrypted: i=1;
 AKwUvBzfzpkMfeVmX9SQiGxgoxcpnV5G/qaIFp1d30SZUm0Di+9yLbngCCF4rED3rsqwCHFbBz0UxzZcxtlf@nongnu.org
X-Gm-Message-State: AFq9FYJMf/N+biUwbhEqG6xe0xzo3rxfScuowdVDjhvGE5AI319l6+1y
 htYyJLQlSlQbwvgzTQTKzrEqwkjbbj5Pb3AvCHEFO4DYREehRSrmvDoC3lN8tsRLY18K2tzAcAi
 VHxCa1p9KdvIgEqUxZNdSS0G1dm1+cmqxtFyCuE8kkIoCMEre4pHijWdN7w==
X-Gm-Gg: AYBFou06ZZhppiBd22xcmYevDAIJ49UpSdFWtTM+UOgfoIdQKKdM51h6mB5q1H875VB
 9fLT5qL1Ry3s1nZpFV+kKG9HqGLPEgniFJKYEEf2lyeMk/yd3u6yA8z8PYs6+eP47xMhGalXsE1
 EVnPAA2Kb2q5l5GVFqRd5Fr4yFZTrYJvrb2tOSYdsI2Gxv9Ww6TAXHf8cj1oLbc+eArtkKM3WoK
 7AEjmnyx9Ie1cH9CSFTOmmX64yBTwISA9MSIe2Zuar/CoKOP7g0rUvq7rRb770wooxDdZizO5s3
 HSDqz6DfHxT6KDXffhqqb41A9UxDdshEtz+AGPe8p6aJFyRnV9+G8pfCwidXrPlGWeJ1wP5IEqc
 GHcyZSGu8B5YCBVAUSL0roJOzsZ+4sV/AtwBfVyLrfAv4Oeu85LzLB7YJBas5Fcf4DGuU6AcL
X-Received: by 2002:a05:620a:1706:b0:93f:2940:1ff0 with SMTP id
 af79cd13be357-93f57f05b89mr48788885a.24.1792524966899; 
 Tue, 20 Oct 2026 12:36:06 -0700 (PDT)
X-Received: by 2002:a05:620a:1706:b0:93f:2940:1ff0 with SMTP id
 af79cd13be357-93f57f05b89mr48784885a.24.1792524966318; 
 Tue, 20 Oct 2026 12:36:06 -0700 (PDT)
Received: from [192.168.68.101] (200-204-190-237.dsl.telesp.net.br.
 [200.204.190.237]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93f56dd0022sm63039385a.20.2026.10.20.12.36.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Oct 2026 12:36:05 -0700 (PDT)
Message-ID: <e72c6610-1a05-4766-aa12-2104ee5836af@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 16:36:02 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] hw/riscv/riscv-iommu: serialize IOATC accesses
To: Tan Chi <tanchi25@mails.ucas.ac.cn>, qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 qemu-riscv@nongnu.org
References: <20261017143943.15521-1-tanchi25@mails.ucas.ac.cn>
 <20261017144533.15610-1-tanchi25@mails.ucas.ac.cn>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261017144533.15610-1-tanchi25@mails.ucas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA3OCBTYWx0ZWRfX8uw8lYLDOV6x
 8d2zJfpPIXGUPfNr6rDqTSUwAj5JEX1MKauM96I5vxf9DSsnslD71z/6bqi6eYX3iow2NtsQrJv
 gN+JNWohGjBB6N2ucLEtgpJ2DMMlw9A=
X-Proofpoint-GUID: OLp4xxjQEHnjp47B_Lz53Pdx9dgaWBKQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA3OCBTYWx0ZWRfX7Pc9U8LvXUKe
 +/BkiuDiKbCME7ZFXZojV5Z4pQEhXC2NIjwQJnou5UC0emSiiSteVbOu5bKE25kgFTmIw26d+2n
 IDv/6cIlaWpoDhVgG0T8/pGHGKobXsETyicR0sWN7INOrJdk5vENCrv8/p5E0aEoaSeodTBcvIc
 iOfjOOWNKKC9M3G04KG6oYpyavBgPgEHXWu1WWEc0GWpZyTYkex6yVQLfmuhCHE6f+vU93efczx
 bLFLjytvcFXLB7xFmzD8D7Wtu5bj/r5kFVQHt6IGUmRci1QMBzH68hj2ZkF2iVqdXvpsE+KeuHW
 J4lGZtb16rwra81MHB5sde89Pq/K8xSXEhhfFhOX7Yihl02neCMVRJjQuKWVwo2t9WZdyyNIQWS
 jIDOyJD2hxT4g3odk5K9fBmjH1bJB98gWwn2BqRyqTtfgIWMnd5Cmx/weL5D0qxWt2ij+rICnmz
 tsplCFUD+caiqf3irgA==
X-Authority-Analysis: v=2.4 cv=R42WitRX c=1 sm=1 tr=0 ts=6ad7c2a9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=QmVDPCq3bE4LYXGvZ20s0w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=JNyCrnv5xJobtWStvckA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: OLp4xxjQEHnjp47B_Lz53Pdx9dgaWBKQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200078
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
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/17/2026 11:45 AM, Tan Chi wrote:
> The IOATC currently keeps references to the hash table while cached
> entries are being used. The following change will remove matching
> entries during invalidation, which requires cached entry lifetime to be
> protected explicitly.
> 
> Add an iot_lock to serialize IOATC lookup, update, invalidation, and
> reset operations. Copy the fields needed by the translation path while
> holding the lock, then release it before updating the IOMMUTLBEntry.
> 
> Keep the page-table walk outside the critical section so the lock is not
> held across potentially expensive memory accesses.
> 
> Signed-off-by: Tan Chi <tanchi25@mails.ucas.ac.cn>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   hw/riscv/riscv-iommu.c | 53 ++++++++++++++++++++++++------------------
>   hw/riscv/riscv-iommu.h |  1 +
>   2 files changed, 32 insertions(+), 22 deletions(-)
> 
> diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
> index 323a041b4a..bd34c72868 100644
> --- a/hw/riscv/riscv-iommu.c
> +++ b/hw/riscv/riscv-iommu.c
> @@ -1682,7 +1682,7 @@ static void riscv_iommu_iot_inval_gscid_pscid_iova(gpointer key, gpointer value,
>       }
>   }
>   
> -/* caller should keep ref-count for iot_cache object */
> +/* caller must hold iot_lock */
>   static RISCVIOMMUEntry *riscv_iommu_iot_lookup(RISCVIOMMUContext *ctx,
>       GHashTable *iot_cache, hwaddr iova, RISCVIOMMUTransTag transtag)
>   {
> @@ -1695,27 +1695,26 @@ static RISCVIOMMUEntry *riscv_iommu_iot_lookup(RISCVIOMMUContext *ctx,
>       return g_hash_table_lookup(iot_cache, &key);
>   }
>   
> -/* caller should keep ref-count for iot_cache object */
> -static void riscv_iommu_iot_update(RISCVIOMMUState *s,
> -    GHashTable *iot_cache, RISCVIOMMUEntry *iot)
> +/* caller must hold iot_lock */
> +static void riscv_iommu_iot_update(RISCVIOMMUState *s, RISCVIOMMUEntry *iot)
>   {
>       if (!s->iot_limit) {
>           return;
>       }
>   
>       if (g_hash_table_size(s->iot_cache) >= s->iot_limit) {
> -        iot_cache = g_hash_table_new_full(riscv_iommu_iot_hash,
> -                                          riscv_iommu_iot_equal,
> -                                          g_free, NULL);
> -        g_hash_table_unref(qatomic_xchg(&s->iot_cache, iot_cache));
> +        GHashTable *old_cache = s->iot_cache;
> +        s->iot_cache = g_hash_table_new_full(riscv_iommu_iot_hash,
> +                                             riscv_iommu_iot_equal,
> +                                             g_free, NULL);
> +        g_hash_table_unref(old_cache);
>       }
> -    g_hash_table_add(iot_cache, iot);
> +    g_hash_table_add(s->iot_cache, iot);
>   }
>   
>   static void riscv_iommu_iot_inval(RISCVIOMMUState *s, GHFunc func,
>       uint32_t gscid, uint32_t pscid, hwaddr iova, RISCVIOMMUTransTag transtag)
>   {
> -    GHashTable *iot_cache;
>       RISCVIOMMUEntry key = {
>           .tag = transtag,
>           .gscid = gscid,
> @@ -1723,9 +1722,9 @@ static void riscv_iommu_iot_inval(RISCVIOMMUState *s, GHFunc func,
>           .iova  = PPN_DOWN(iova),
>       };
>   
> -    iot_cache = g_hash_table_ref(s->iot_cache);
> -    g_hash_table_foreach(iot_cache, func, &key);
> -    g_hash_table_unref(iot_cache);
> +    qemu_mutex_lock(&s->iot_lock);
> +    g_hash_table_foreach(s->iot_cache, func, &key);
> +    qemu_mutex_unlock(&s->iot_lock);
>   }
>   
>   static RISCVIOMMUTransTag riscv_iommu_get_transtag(RISCVIOMMUContext *ctx)
> @@ -1747,15 +1746,14 @@ static int riscv_iommu_translate(RISCVIOMMUState *s, RISCVIOMMUContext *ctx,
>   {
>       RISCVIOMMUTransTag transtag = riscv_iommu_get_transtag(ctx);
>       RISCVIOMMUEntry *iot;
> -    IOMMUAccessFlags perm;
> +    IOMMUAccessFlags perm = IOMMU_NONE;
>       bool enable_pid;
>       bool enable_pri;
> -    GHashTable *iot_cache;
> +    hwaddr phys = 0;
>       int fault;
>   
>       riscv_iommu_hpm_incr_ctr(s, ctx, RISCV_IOMMU_HPMEVENT_URQ);
>   
> -    iot_cache = g_hash_table_ref(s->iot_cache);
>       enable_pri = (iotlb->perm == IOMMU_NONE) &&
>                    (ctx->tc & RISCV_IOMMU_DC_TC_EN_PRI);
>       enable_pid = (ctx->tc & RISCV_IOMMU_DC_TC_PDTV);
> @@ -1771,10 +1769,15 @@ static int riscv_iommu_translate(RISCVIOMMUState *s, RISCVIOMMUContext *ctx,
>           }
>       }
>   
> -    iot = riscv_iommu_iot_lookup(ctx, iot_cache, iotlb->iova, transtag);
> -    perm = iot ? iot->perm : IOMMU_NONE;
> +    qemu_mutex_lock(&s->iot_lock);
> +    iot = riscv_iommu_iot_lookup(ctx, s->iot_cache, iotlb->iova, transtag);
> +    if (iot) {
> +        perm = iot->perm;
> +        phys = iot->phys;
> +    }
> +    qemu_mutex_unlock(&s->iot_lock);
>       if (perm != IOMMU_NONE) {
> -        iotlb->translated_addr = PPN_PHYS(iot->phys);
> +        iotlb->translated_addr = PPN_PHYS(phys);
>           iotlb->addr_mask = ~TARGET_PAGE_MASK;
>           iotlb->perm = perm;
>           fault = 0;
> @@ -1805,12 +1808,12 @@ static int riscv_iommu_translate(RISCVIOMMUState *s, RISCVIOMMUContext *ctx,
>           iot->pscid = get_field(ctx->ta, RISCV_IOMMU_DC_TA_PSCID);
>           iot->perm = iotlb->perm;
>           iot->tag = transtag;
> -        riscv_iommu_iot_update(s, iot_cache, iot);
> +        qemu_mutex_lock(&s->iot_lock);
> +        riscv_iommu_iot_update(s, iot);
> +        qemu_mutex_unlock(&s->iot_lock);
>       }
>   
>   done:
> -    g_hash_table_unref(iot_cache);
> -
>       if (enable_pri && fault) {
>           struct riscv_iommu_pq_record pr = {0};
>           if (enable_pid) {
> @@ -2674,6 +2677,7 @@ static void riscv_iommu_instance_init(Object *obj)
>       s->iot_cache = g_hash_table_new_full(riscv_iommu_iot_hash,
>                                            riscv_iommu_iot_equal,
>                                            g_free, NULL);
> +    qemu_mutex_init(&s->iot_lock);
>   
>       s->iommus.le_next = NULL;
>       s->iommus.le_prev = NULL;
> @@ -2690,6 +2694,8 @@ static void riscv_iommu_instance_finalize(Object *obj)
>   
>       g_hash_table_unref(s->ctx_cache);
>       g_hash_table_unref(s->iot_cache);
> +
> +    qemu_mutex_destroy(&s->iot_lock);
>   }
>   
>   static void riscv_iommu_realize(DeviceState *dev, Error **errp)
> @@ -2850,7 +2856,10 @@ void riscv_iommu_reset(RISCVIOMMUState *s)
>       riscv_iommu_reg_set32(s, RISCV_IOMMU_REG_IPSR, 0);
>   
>       g_hash_table_remove_all(s->ctx_cache);
> +
> +    qemu_mutex_lock(&s->iot_lock);
>       g_hash_table_remove_all(s->iot_cache);
> +    qemu_mutex_unlock(&s->iot_lock);
>   }
>   
>   static const Property riscv_iommu_properties[] = {
> diff --git a/hw/riscv/riscv-iommu.h b/hw/riscv/riscv-iommu.h
> index 7c470ba084..403d10b321 100644
> --- a/hw/riscv/riscv-iommu.h
> +++ b/hw/riscv/riscv-iommu.h
> @@ -73,6 +73,7 @@ struct RISCVIOMMUState {
>   
>       GHashTable *iot_cache;          /* IO Translated Address Cache */
>       unsigned iot_limit;             /* IO Translation Cache size limit */
> +    QemuMutex iot_lock;
>   
>       /* MMIO Hardware Interface */
>       MemoryRegion regs_mr;


