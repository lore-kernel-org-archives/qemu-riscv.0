Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09309606A31E
	for <qemu-riscv@archiver.kernel.org>; Tue, 20 Oct 2026 19:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E8c2+z+3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CKxzHdKQ
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJFdL-000537-3m; Tue, 20 Oct 2026 15:36:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xJFdJ-00052o-Az
 for qemu-riscv@nongnu.org; Tue, 20 Oct 2026 15:36:25 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xJFdG-0000F1-OX
 for qemu-riscv@nongnu.org; Tue, 20 Oct 2026 15:36:25 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69KGtkW82278767
 for <qemu-riscv@nongnu.org>; Tue, 20 Oct 2026 19:36:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zEx1jbVy6KEIefnzlAofyoKHJlVVp0+831FyWmke0Aw=; b=E8c2+z+3hK2kIotP
 Mmyf36dG7jTkXaj/s12ydJ/+BdiXeYoeHKg0hG40DlEYs7dGkQr1KL+rsNAb0n7x
 fqhSVYa5p+cnvIoixabwBuHNSGO8VwWZTflZHrF5t5M/cEVtE+hnykBhhUKdWmix
 cCHkyGI8jKCaYyiHzofKlZQuGjqG/aN4+Z5XAXJHE7TisLdJSX0kuNtRfy1Q14yV
 gBBECqq8o4NxPCSKCxi8OThb3x/uhVOdUwnpLePDIWT4l9T13XsfiGJDRmStySzy
 zjPQ0NluLFKtCK/pX7sjoKuWj0yKurlO0JhwaFUBT4IgDhqt/07chIFzUGeK/WNG
 uDVK/A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7h29vpr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 20 Oct 2026 19:36:21 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-53664602c7fso754091cf.1
 for <qemu-riscv@nongnu.org>; Tue, 20 Oct 2026 12:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792524980; x=1793129780; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=zEx1jbVy6KEIefnzlAofyoKHJlVVp0+831FyWmke0Aw=;
 b=CKxzHdKQPd04/YJrknU7BWfxsuq3ti7mXhuB1Cj9UyK03DbwVJX5/nK0Ek+pPz0+o5
 6l0ULX4bF4rOoLaVifPI0sG12OFV/J70hGrI7XD+lxLCcPLmm5LilayXpOvBH9wYavBk
 Ty0BolhNohvxq1a3RrcIFCtfR9V7K3KjwQQXRuCgEuliXBUdVrBNTIcBkKzqicbqIeBT
 wQ09KAO3Dko9/z2jy7QZmz9JaE+a96/SF20Cf536zP9vVP+kTuKq9r1fu0z8Ahw7oIMs
 e/+MU80Eqwc7/mXifazH843CKhF5YxNH3TpPzt6OgWmxYXtSgcSJC3PHn3ynJ8EUlB0m
 p12Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792524980; x=1793129780;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=zEx1jbVy6KEIefnzlAofyoKHJlVVp0+831FyWmke0Aw=;
 b=Hj9Y/14Icuh8q+tdAaiZ85zYP0WDRil/fzV3A9DcoktuV0j4FUcPoRlu5vZM9Ix2KI
 jGg28gZWRV2jz8cdumlDBPr9bqJm+YjBOn3/sL+E0mRpcEvsSxTrH9jry59X/AcFthQ/
 Xn1xxr6g7ohnxiEQWy5UGSt/62iz0YikqYHppfQKzl9PvgYmBsS3SKDJd1z3QokekE6D
 B4OBroFJh7/t/WLvJKTymI85hjGzV6bbTh/YlebgyAozLQN6zrc90VXjq/ubRIFCEAjE
 hoIn21+GNjaaB39j7a9Ijv1gsJa99EoZE2RGWj0xbOusTABrsVdPWKYcFWvEdQKrbN3E
 LiGA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxgZ5gsjQLLdW5ccIZwrbEqG/vjqtgZKxk5wkeChyS7THcJ5Lolmw1MdgFGKI5kdqtwUo8hVx7b4yfP@nongnu.org
X-Gm-Message-State: AFq9FYL21AuGsguEfFgAm5sKy4JT3j9iTbLgKFH1oFqRxPopW8LcHXvm
 PHDnraM1qLF3kq8hv2vtRS5MfU4sG42bWVXm1AUnTju2q9Q4O7ZEbdyE+G+SnF7W08QKgn4p3B8
 5yHiFwASUu6KlNiGgZytCeQhVZk+npehM6EUzdHrPPA2yuDg0wA97TGamNA==
X-Gm-Gg: AYBFou3Qupj1+CscK2qdAJU5Z714kIICgVLp994JH5UFurSdGlIykBepi8Ws8ExvtUa
 RaYM8YHkFPwAIsOZ7oqa0cgQyS6jqU1ESj3wKUB4xyu5knl2gA6tSPUwA5u9FsO/qdfMKftUK11
 tcvkX4Xx8jbaYMKSYOPgM4ZJ9PbyikFRPiVJnPg/LIwCl1QwzCrLOg7bIZTos/IFre5ANg8TPtv
 xj3Bia1zOJHtE9x4ljIrgPGruLckK3uEunObeAookOtyaXDTGj2hW/tC9IH1LucOu5iKxHMDKFV
 nE2BJ8eTB9zNE/cl8AaZZKtAMSb2lLTE4FetRofVwbEU2i1NRnne9pDP3YWrs4UcOVPBCuhXgRf
 rCrBS0zzOoeohtSSHmhJoEkePcBdQRI5eMUjE7upwES6Ai/PrcvvV2A5tdKeVf9yoobiUsm71
X-Received: by 2002:a05:622a:144e:b0:533:33ed:c39d with SMTP id
 d75a77b69052e-53645c1fa2cmr162930121cf.7.1792524980108; 
 Tue, 20 Oct 2026 12:36:20 -0700 (PDT)
X-Received: by 2002:a05:622a:144e:b0:533:33ed:c39d with SMTP id
 d75a77b69052e-53645c1fa2cmr162929871cf.7.1792524979519; 
 Tue, 20 Oct 2026 12:36:19 -0700 (PDT)
Received: from [192.168.68.101] (200-204-190-237.dsl.telesp.net.br.
 [200.204.190.237]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-53698ae7fa8sm3461731cf.9.2026.10.20.12.36.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Oct 2026 12:36:19 -0700 (PDT)
Message-ID: <da95e5d0-156e-47d1-9021-44e31d8f487e@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 16:36:16 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] hw/riscv/riscv-iommu: reclaim invalidated IOATC
 entries
To: Tan Chi <tanchi25@mails.ucas.ac.cn>, qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 qemu-riscv@nongnu.org
References: <20261017143943.15521-1-tanchi25@mails.ucas.ac.cn>
 <20261017144533.15610-2-tanchi25@mails.ucas.ac.cn>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261017144533.15610-2-tanchi25@mails.ucas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dPeTqcGkLUSnhJ47IHNqhO2kBv4ee77h
X-Proofpoint-ORIG-GUID: dPeTqcGkLUSnhJ47IHNqhO2kBv4ee77h
X-Authority-Analysis: v=2.4 cv=EuJHPicA c=1 sm=1 tr=0 ts=6ad7c2b5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=QmVDPCq3bE4LYXGvZ20s0w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=jTvNZoomtVP_xqLlT78A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA3OCBTYWx0ZWRfX7/2FX9Zf6n//
 RPpvxxEkicWniLTiix7pdNDFEbJIzuCYhpKCF19OcRA+Hj8+jOHsiZH5vtgi8gtBj0DKvOa7ANv
 2XEnLZR/qujY1yCH4l4DciwmFRib2So=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA3OCBTYWx0ZWRfX95ObX0i9G+CP
 2Csp+efaxgeQIRzwhLin7GejGllEiWUS9BYgi6/jnTAiKLP14mF8I/b/bFJ4HdfY++/d2RgrhhR
 /vqaduv6TH0/7YiVR5q0Y+hf1U5u0k1acL7Q4eWVqbyz2unnS8++8G+dzBud7LOJ1lcBkG355Qt
 7dg2tYT9qmh3VhDWQ6ldv/0pgwE8kleb97D9Adj4caBhi7REeUWa7+t290raNap8oy/YaXITJni
 6bHXyTz3n195sYQeeUzBtxXb5py6rzblEXvhRoBV/D+9Q24ECfaJtqTwgzIW+ms3gA6+MvonYTd
 883rGWiJmVrOUTekOfNW9Mgar32Stz1mup2mmVwWEYvY/CLhZfJju5NrUIr5RqefJLERZ8ysAtL
 Bd1Xm9MGgMUqXTTHeISsyVhmAkFPbIU4mBJWhGYFofQCNPQOOLnczch1HRtDzVq6ByYT8f/pXE7
 ryxWtS/YbjkYnHPBXMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200078
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
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/17/2026 11:45 AM, Tan Chi wrote:
> IOTINVAL currently walks the IOATC hash table and invalidates matching
> entries by setting iot->perm to IOMMU_NONE. The invalidated entries remain
> in the hash table afterwards.
> 
> Under workloads with frequent DMA map/unmap activity, invalid entries can
> accumulate while only a smaller number of entries remain valid. Subsequent
> IOTINVAL operations continue to scan these entries. They are also included
> in g_hash_table_size(), causing the IOATC to reach iot_limit earlier and
> the entire cache to be flushed more frequently.
> 
> Remove matching entries during invalidation instead of leaving them in the
> hash table with IOMMU_NONE.
> 
> The measurements use a Linux 7.3-rc5 guest based on linux-iommu/next
> commit cec2dc7663e7 with v6 of the "iommu/riscv: Enable MSI remapping,
> IOMMU_DMA and VFIO" series applied. The QEMU behavior is not specific to
> this guest kernel; this configuration makes it easier to exercise through
> normal DMA map/unmap activity.
> 
> In a high-churn NVMe workload with frequent DMA map/unmap activity, runtime
> drops from 168 seconds to 35 seconds, a 4.8x speedup.
> 
> A short fio workload with a small working set remains within measurement
> noise. Across three runs for each version of a 300-second fio workload with
> a 4 GiB working set, median throughput improves from 68.6 MiB/s to
> 75.0 MiB/s, an increase of 9.3%.
> 
> Signed-off-by: Tan Chi <tanchi25@mails.ucas.ac.cn>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   hw/riscv/riscv-iommu.c | 122 +++++++++++++++++++----------------------
>   1 file changed, 56 insertions(+), 66 deletions(-)
> 
> diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
> index bd34c72868..c217a428de 100644
> --- a/hw/riscv/riscv-iommu.c
> +++ b/hw/riscv/riscv-iommu.c
> @@ -1582,104 +1582,93 @@ static guint riscv_iommu_iot_hash(gconstpointer v)
>   /* GV: 0 AV: 0 PSCV: 0 GVMA: 0 */
>   /* GV: 0 AV: 0 GVMA: 1 */
>   static
> -void riscv_iommu_iot_inval_all(gpointer key, gpointer value, gpointer data)
> +gboolean riscv_iommu_iot_inval_all(gpointer key, gpointer value, gpointer data)
>   {
>       RISCVIOMMUEntry *iot = (RISCVIOMMUEntry *) value;
>       RISCVIOMMUEntry *arg = (RISCVIOMMUEntry *) data;
> -    if (iot->tag == arg->tag) {
> -        iot->perm = IOMMU_NONE;
> -    }
> +    return iot->tag == arg->tag;
>   }
>   
>   /* GV: 0 AV: 0 PSCV: 1 GVMA: 0 */
>   static
> -void riscv_iommu_iot_inval_pscid(gpointer key, gpointer value, gpointer data)
> +gboolean riscv_iommu_iot_inval_pscid(gpointer key, gpointer value,
> +                                     gpointer data)
>   {
>       RISCVIOMMUEntry *iot = (RISCVIOMMUEntry *) value;
>       RISCVIOMMUEntry *arg = (RISCVIOMMUEntry *) data;
> -    if (iot->tag == arg->tag &&
> -        iot->pscid == arg->pscid) {
> -        iot->perm = IOMMU_NONE;
> -    }
> +    return iot->tag == arg->tag &&
> +           iot->pscid == arg->pscid;
>   }
>   
>   /* GV: 0 AV: 1 PSCV: 0 GVMA: 0 */
>   static
> -void riscv_iommu_iot_inval_iova(gpointer key, gpointer value, gpointer data)
> +gboolean riscv_iommu_iot_inval_iova(gpointer key, gpointer value, gpointer data)
>   {
>       RISCVIOMMUEntry *iot = (RISCVIOMMUEntry *) value;
>       RISCVIOMMUEntry *arg = (RISCVIOMMUEntry *) data;
> -    if (iot->tag == arg->tag &&
> -        iot->iova == arg->iova) {
> -        iot->perm = IOMMU_NONE;
> -    }
> +    return iot->tag == arg->tag &&
> +           iot->iova == arg->iova;
>   }
>   
>   /* GV: 0 AV: 1 PSCV: 1 GVMA: 0 */
> -static void riscv_iommu_iot_inval_pscid_iova(gpointer key, gpointer value,
> -                                             gpointer data)
> +static gboolean riscv_iommu_iot_inval_pscid_iova(gpointer key,
> +                                                 gpointer value,
> +                                                 gpointer data)
>   {
>       RISCVIOMMUEntry *iot = (RISCVIOMMUEntry *) value;
>       RISCVIOMMUEntry *arg = (RISCVIOMMUEntry *) data;
> -    if (iot->tag == arg->tag &&
> -        iot->pscid == arg->pscid &&
> -        iot->iova == arg->iova) {
> -        iot->perm = IOMMU_NONE;
> -    }
> +    return iot->tag == arg->tag &&
> +           iot->pscid == arg->pscid &&
> +           iot->iova == arg->iova;
>   }
>   
>   /* GV: 1 AV: 0 PSCV: 0 GVMA: 0 */
>   /* GV: 1 AV: 0 GVMA: 1 */
> -static
> -void riscv_iommu_iot_inval_gscid(gpointer key, gpointer value, gpointer data)
> +static gboolean riscv_iommu_iot_inval_gscid(gpointer key, gpointer value,
> +                                            gpointer data)
>   {
>       RISCVIOMMUEntry *iot = (RISCVIOMMUEntry *) value;
>       RISCVIOMMUEntry *arg = (RISCVIOMMUEntry *) data;
> -    if (iot->tag == arg->tag &&
> -        iot->gscid == arg->gscid) {
> -        iot->perm = IOMMU_NONE;
> -    }
> +    return iot->tag == arg->tag &&
> +           iot->gscid == arg->gscid;
>   }
>   
>   /* GV: 1 AV: 0 PSCV: 1 GVMA: 0 */
> -static void riscv_iommu_iot_inval_gscid_pscid(gpointer key, gpointer value,
> -                                              gpointer data)
> +static gboolean riscv_iommu_iot_inval_gscid_pscid(gpointer key,
> +                                                  gpointer value,
> +                                                  gpointer data)
>   {
>       RISCVIOMMUEntry *iot = (RISCVIOMMUEntry *) value;
>       RISCVIOMMUEntry *arg = (RISCVIOMMUEntry *) data;
> -    if (iot->tag == arg->tag &&
> -        iot->gscid == arg->gscid &&
> -        iot->pscid == arg->pscid) {
> -        iot->perm = IOMMU_NONE;
> -    }
> +    return iot->tag == arg->tag &&
> +           iot->gscid == arg->gscid &&
> +           iot->pscid == arg->pscid;
>   }
>   
>   /* GV: 1 AV: 1 PSCV: 0 GVMA: 0 */
>   /* GV: 1 AV: 1 GVMA: 1 */
> -static void riscv_iommu_iot_inval_gscid_iova(gpointer key, gpointer value,
> -                                             gpointer data)
> +static gboolean riscv_iommu_iot_inval_gscid_iova(gpointer key,
> +                                                 gpointer value,
> +                                                 gpointer data)
>   {
>       RISCVIOMMUEntry *iot = (RISCVIOMMUEntry *) value;
>       RISCVIOMMUEntry *arg = (RISCVIOMMUEntry *) data;
> -    if (iot->tag == arg->tag &&
> -        iot->gscid == arg->gscid &&
> -        iot->iova == arg->iova) {
> -        iot->perm = IOMMU_NONE;
> -    }
> +    return iot->tag == arg->tag &&
> +           iot->gscid == arg->gscid &&
> +           iot->iova == arg->iova;
>   }
>   
>   /* GV: 1 AV: 1 PSCV: 1 GVMA: 0 */
> -static void riscv_iommu_iot_inval_gscid_pscid_iova(gpointer key, gpointer value,
> -                                                   gpointer data)
> +static gboolean riscv_iommu_iot_inval_gscid_pscid_iova(gpointer key,
> +                                                       gpointer value,
> +                                                       gpointer data)
>   {
>       RISCVIOMMUEntry *iot = (RISCVIOMMUEntry *) value;
>       RISCVIOMMUEntry *arg = (RISCVIOMMUEntry *) data;
> -    if (iot->tag == arg->tag &&
> -        iot->gscid == arg->gscid &&
> -        iot->pscid == arg->pscid &&
> -        iot->iova == arg->iova) {
> -        iot->perm = IOMMU_NONE;
> -    }
> +    return iot->tag == arg->tag &&
> +           iot->gscid == arg->gscid &&
> +           iot->pscid == arg->pscid &&
> +           iot->iova == arg->iova;
>   }
>   
>   /* caller must hold iot_lock */
> @@ -1712,7 +1701,7 @@ static void riscv_iommu_iot_update(RISCVIOMMUState *s, RISCVIOMMUEntry *iot)
>       g_hash_table_add(s->iot_cache, iot);
>   }
>   
> -static void riscv_iommu_iot_inval(RISCVIOMMUState *s, GHFunc func,
> +static void riscv_iommu_iot_inval(RISCVIOMMUState *s, GHRFunc func,
>       uint32_t gscid, uint32_t pscid, hwaddr iova, RISCVIOMMUTransTag transtag)
>   {
>       RISCVIOMMUEntry key = {
> @@ -1723,7 +1712,7 @@ static void riscv_iommu_iot_inval(RISCVIOMMUState *s, GHFunc func,
>       };
>   
>       qemu_mutex_lock(&s->iot_lock);
> -    g_hash_table_foreach(s->iot_cache, func, &key);
> +    g_hash_table_foreach_remove(s->iot_cache, func, &key);
>       qemu_mutex_unlock(&s->iot_lock);
>   }
>   
> @@ -1972,7 +1961,8 @@ static void riscv_iommu_process_cq_tail(RISCVIOMMUState *s)
>       dma_addr_t addr;
>       uint32_t tail, head, ctrl;
>       uint64_t cmd_opcode;
> -    GHFunc func;
> +    GHRFunc iot_func;
> +    GHFunc ctx_func;
>   
>       ctrl = riscv_iommu_reg_get32(s, RISCV_IOMMU_REG_CQCSR);
>       tail = riscv_iommu_reg_get32(s, RISCV_IOMMU_REG_CQT) & s->cq_mask;
> @@ -2035,18 +2025,18 @@ static void riscv_iommu_process_cq_tail(RISCVIOMMUState *s)
>                   goto cmd_ill;
>               }
>   
> -            func = riscv_iommu_iot_inval_all;
> +            iot_func = riscv_iommu_iot_inval_all;
>   
>               if (gv) {
> -                func = (av) ? riscv_iommu_iot_inval_gscid_iova :
> +                iot_func = (av) ? riscv_iommu_iot_inval_gscid_iova :
>                                 riscv_iommu_iot_inval_gscid;
>               }
>   
>               riscv_iommu_iot_inval(
> -                s, func, gscid, pscid, iova, RISCV_IOMMU_TRANS_TAG_VG);
> +                s, iot_func, gscid, pscid, iova, RISCV_IOMMU_TRANS_TAG_VG);
>   
>               riscv_iommu_iot_inval(
> -                s, func, gscid, pscid, iova, RISCV_IOMMU_TRANS_TAG_VN);
> +                s, iot_func, gscid, pscid, iova, RISCV_IOMMU_TRANS_TAG_VN);
>               break;
>           }
>   
> @@ -2066,24 +2056,24 @@ static void riscv_iommu_process_cq_tail(RISCVIOMMUState *s)
>               if (gv) {
>                   transtag = RISCV_IOMMU_TRANS_TAG_VN;
>                   if (pscv) {
> -                    func = (av) ? riscv_iommu_iot_inval_gscid_pscid_iova :
> +                    iot_func = (av) ? riscv_iommu_iot_inval_gscid_pscid_iova :
>                                     riscv_iommu_iot_inval_gscid_pscid;
>                   } else {
> -                    func = (av) ? riscv_iommu_iot_inval_gscid_iova :
> +                    iot_func = (av) ? riscv_iommu_iot_inval_gscid_iova :
>                                     riscv_iommu_iot_inval_gscid;
>                   }
>               } else {
>                   transtag = RISCV_IOMMU_TRANS_TAG_SS;
>                   if (pscv) {
> -                    func = (av) ? riscv_iommu_iot_inval_pscid_iova :
> +                    iot_func = (av) ? riscv_iommu_iot_inval_pscid_iova :
>                                     riscv_iommu_iot_inval_pscid;
>                   } else {
> -                    func = (av) ? riscv_iommu_iot_inval_iova :
> +                    iot_func = (av) ? riscv_iommu_iot_inval_iova :
>                                     riscv_iommu_iot_inval_all;
>                   }
>               }
>   
> -            riscv_iommu_iot_inval(s, func, gscid, pscid, iova, transtag);
> +            riscv_iommu_iot_inval(s, iot_func, gscid, pscid, iova, transtag);
>               break;
>           }
>   
> @@ -2091,12 +2081,12 @@ static void riscv_iommu_process_cq_tail(RISCVIOMMUState *s)
>                                RISCV_IOMMU_CMD_IODIR_OPCODE):
>               if (!(cmd.dword0 & RISCV_IOMMU_CMD_IODIR_DV)) {
>                   /* invalidate all device context cache mappings */
> -                func = riscv_iommu_ctx_inval_all;
> +                ctx_func = riscv_iommu_ctx_inval_all;
>               } else {
>                   /* invalidate all device context matching DID */
> -                func = riscv_iommu_ctx_inval_devid;
> +                ctx_func = riscv_iommu_ctx_inval_devid;
>               }
> -            riscv_iommu_ctx_inval(s, func,
> +            riscv_iommu_ctx_inval(s, ctx_func,
>                   get_field(cmd.dword0, RISCV_IOMMU_CMD_IODIR_DID), 0);
>               break;
>   
> @@ -2106,9 +2096,9 @@ static void riscv_iommu_process_cq_tail(RISCVIOMMUState *s)
>                   /* illegal command arguments IODIR_PDT & DV == 0 */
>                   goto cmd_ill;
>               } else {
> -                func = riscv_iommu_ctx_inval_devid_procid;
> +                ctx_func = riscv_iommu_ctx_inval_devid_procid;
>               }
> -            riscv_iommu_ctx_inval(s, func,
> +            riscv_iommu_ctx_inval(s, ctx_func,
>                   get_field(cmd.dword0, RISCV_IOMMU_CMD_IODIR_DID),
>                   get_field(cmd.dword0, RISCV_IOMMU_CMD_IODIR_PID));
>               break;


