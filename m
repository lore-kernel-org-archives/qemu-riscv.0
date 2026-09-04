Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F05AC61DD6
	for <qemu-riscv@archiver.kernel.org>; Fri,  4 Sep 2026 10:43:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x2RNo-0000BZ-8x; Fri, 04 Sep 2026 06:42:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x2RNl-0000Ab-MX
 for qemu-riscv@nongnu.org; Fri, 04 Sep 2026 06:42:53 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x2RNi-0004XH-RI
 for qemu-riscv@nongnu.org; Fri, 04 Sep 2026 06:42:52 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 684AI9PK2616015
 for <qemu-riscv@nongnu.org>; Fri, 4 Sep 2026 10:42:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 50SIKzO1p5asV7sJAAY3zU7mEKvMmrAZny1H5BPdTBQ=; b=WysMxFQYYaGEawEx
 UuaNSEregwkaVZaXLsos73ah+EAgIqIiCZa7jnTOkJHWR+cmMaCYJt74rU9SzP3C
 XUwW6xMd55UOVXa2JD9W3mMcS0FV6jA4J6mg7MUiAMzbXN5zo+6t6DXk09D5K48j
 tEulwTcrxQ8SgtxE0t1ClQVvxXZJewOIkWko8NEAMhpMMJ7T9oL4kxpVyC3mbkgx
 mK/Tv3bnG65dygIUx1U/yiuDsDuRXH9h6afhQSvq5YyqfLv6xTyP38nMRrbn0OXI
 jZ1/Ei5EMlud3FM8kh5vstyLeTT0esPiBsDGYLv8IU/JZ+btFqhp1UQtNqvhRbZm
 k0Z43g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfdyp34wa-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 04 Sep 2026 10:42:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-9390ca1a9abso117072385a.2
 for <qemu-riscv@nongnu.org>; Fri, 04 Sep 2026 03:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788518567; x=1789123367; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=50SIKzO1p5asV7sJAAY3zU7mEKvMmrAZny1H5BPdTBQ=;
 b=g7gDEAa/6jWVF081n7K7D082544Wvinzl0m+slcqknYr8UTyTMF2ZDfSnXdP3XcYRV
 NxnovAWZzOF5Vb3l03YX5oEsQURVY9UgpaOLknSRnBx4lw0/e330kZPI0t0AFLgiIin5
 3V6Eu7i26Q1U770DWejE2JwUCzhoPjQ0RxqcIyLM8ZFozIc0yV+j+0bz/ooiU69jgkfa
 OV4mICvwQxlTcSDOBUrHuKsCV5QIRNQzJitpYV+qntUHqbEbrNr5WJv+byZiCqs0KPMA
 B/VZHN21bskpIdsqGdmPpRAFyG6CFm5MErWzWddl6gumGJ8/6P/PXvNwXYONDqq9qPK7
 epLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788518567; x=1789123367;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=50SIKzO1p5asV7sJAAY3zU7mEKvMmrAZny1H5BPdTBQ=;
 b=i2etCMAtkm8EGWmv64JAuYKF4khLwEQ9P7fdNOOxI2G1TeCQjwcEIhOZvHs7Tun/sn
 q+D/oZYa63rB/J31p0aqW86iDOUnhAI9Qnoy2tdn6pXTmm3DZ5nujRKpGrYbyZLjo4Rq
 yO/nUGVhmYb9RASvdqI56AZEMrBVyOXajbcAQVYkT3FBXqTslumX2yNTg+wx95fvukMw
 hkBxShjxDh9wE4LqojgZAZiLQ5Gn1PBf5ggSO8KcudJYQH37rMc2/rUlFPeGYq8evf4f
 cDqO2MHrkOndWnimtk51fuPw4X+Ygv1JT+wDZElHXys+id/ncd31kfRp8GpL0bhiKC/Q
 nT7g==
X-Forwarded-Encrypted: i=1;
 AKwUvBzDTyf0GgMCojRGFM7vWgnZRPNDzvrToX06VsJAU9fCWIhM5O7yC+dqk6uFol3euz1oOS6KayODrWix@nongnu.org
X-Gm-Message-State: AFuF++kW5PvAEHnS5O4dCAWocSF5vEZeYP+hlSHpcUfW7Fo9KsmSx8Aq
 gTKEnOdAYRKNvU1QeK0rL2m48i4xDx1c2BmvidgmBQbuzNsJAM+gu1oZ+LUpwIj7AcLkl1+pX1w
 sm30DDwy86A4K5NT5+zUBsP/mx010NCmXPPSQdDdc0UpXuydIWbiQZvCKIQ==
X-Gm-Gg: AYBFou0cwF32xsTDxunvr9cI2bien7d6Ntf+OwcZlc4gRxLU08nNRdERCSfnnRtNjn+
 H6yxsR9jAFw+yBwEijjw3f9wWVrF0yEv7qWUaeC57WpUeXRzTqaom7HVPdBHIdlUctBvWqkdoRA
 +ZkWCEUGn/XfBFoSZkm22o8wyNNVIypyFWHvjHNdybrq8PkwJxPtptBpMybWB8yDz6Wk7HrNTlZ
 EuzZ/PKcDkevStGtt65g3Qq5lrW7kWCLniL6V0En8btk/qfynzf0U3bo3j+KBlMB/DVwDxly6D4
 Po562K8KzhmsMs25MbsXyRL5lZgkurye1uppKMxLkyVBS0J7MHjk6un3/VQ5vaETi93bATf/VJa
 wi3UoOUcsU2e2hKWpZZ+/b0brzYAV1CdZlg==
X-Received: by 2002:a05:620a:f0f:b0:937:19d3:3fda with SMTP id
 af79cd13be357-9398042d815mr462286085a.28.1788518567634; 
 Fri, 04 Sep 2026 03:42:47 -0700 (PDT)
X-Received: by 2002:a05:620a:f0f:b0:937:19d3:3fda with SMTP id
 af79cd13be357-9398042d815mr462281585a.28.1788518567207; 
 Fri, 04 Sep 2026 03:42:47 -0700 (PDT)
Received: from [192.168.69.202] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cf772692dsm70648315e9.10.2026.09.04.03.42.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Sep 2026 03:42:46 -0700 (PDT)
Message-ID: <a4b3c4a2-e359-4952-8b1a-34db4e2b3c9a@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 12:42:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/16] hw/riscv: Add property to hart array to allow
 private memory
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: Portia Stephens <portias@oss.tenstorrent.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Michael Ellerman <mpe@kernel.org>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20260903055131.257903-1-joel@jms.id.au>
 <20260903055131.257903-15-joel@jms.id.au>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260903055131.257903-15-joel@jms.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: HGFk4K0ll79MXlalgAhQmOReKTio62oM
X-Proofpoint-GUID: HGFk4K0ll79MXlalgAhQmOReKTio62oM
X-Authority-Analysis: v=2.4 cv=Q5XiJY2a c=1 sm=1 tr=0 ts=6a9aa0a8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=t9496tuAAAAA:8 a=EUspDBNiAAAA:8 a=JF9118EUAAAA:8 a=S4Sp4hC2xgBoH1LN8d0A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=4wQ91nGE5lQcD7eh5OX0:22
 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA5NiBTYWx0ZWRfX9cDmwqUtmFYr
 R5fW3xShBg+LnJck/DMcLhGRPTSJHaUyIbPchPJHLn0bkPYjZrUR0+27j2frkIKFqhng60E8Pmd
 NKxxiDvp3gxM3y66fzv7viceHdFjJuIK/bufnxjIVJaar+fJ9DvI1ZK38MyOBi2vEKKaQkNotZT
 sFlULPCCrE8yjxpsLMKuf+NP9Yr6Lj1TsCq6CKoPZSA2WWyNyZNi0kPV5Q1toNhUvQF2eXHSu5G
 Nv8bcUU4LEzdy6ZBkheKRwN0UTlvcT9QgN5srHctOTDbDZ/7302Zi8VoSgLO2AW5LOz5SRIwwFr
 gifrgvooHgKY99GPpEJ6Qm264ugPhjsnAE4YHtp04CgcoT9Wn1vPLzjflse4d4YHgGctpyeGVU/
 OGyFuEd3MjpPi9z6oCuwyo/rM/Ac+ZXb8GxW13zcoyLf8ipt0ZdJ0qYx5xTrYFxR1X69JHipord
 NPCNFSqW/iyrDtKoMMQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA5NiBTYWx0ZWRfXxoOfgh5D7o19
 QF02+ULOVEbN/KdG7KzE1VedqeIWjLEW5HQAPdJXmHkBp5/9ZaXMfAiJxJu7UFaxBpxz+DvMTu2
 v7xEUXAphB2r684f9vvIr88Lz9XyhwU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040096
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

On 3/9/26 07:51, Joel Stanley wrote:
> From: Portia Stephens <portias@oss.tenstorrent.com>
> 
> There are platforms where CPUs have different mapping of system memory.
> The global system memory does not allow for this. This adds an optional
> property on the hart array to assign a specific memory region. The array
> passes the region to each hart it creates, so a machine can alias the
> harts' memory to system memory, while the harts view memory from their
> own memory region.
> 
> Signed-off-by: Portia Stephens <portias@oss.tenstorrent.com>
> Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   include/hw/riscv/riscv_hart.h | 2 ++
>   hw/riscv/riscv_hart.c         | 8 ++++++++
>   2 files changed, 10 insertions(+)
> 
> diff --git a/include/hw/riscv/riscv_hart.h b/include/hw/riscv/riscv_hart.h
> index 197fa1623115..c3cd05a2c877 100644
> --- a/include/hw/riscv/riscv_hart.h
> +++ b/include/hw/riscv/riscv_hart.h
> @@ -42,6 +42,8 @@ struct RISCVHartArrayState {
>       uint64_t *rnmi_irqvec;
>       uint32_t num_rnmi_excpvec;
>       uint64_t *rnmi_excpvec;
> +    /* Optional private memory region for use instead of system memory */
> +    MemoryRegion *memory;
>       RISCVCPU *harts;
>   };
>   
> diff --git a/hw/riscv/riscv_hart.c b/hw/riscv/riscv_hart.c
> index 747754be6158..32fd39737ff6 100644
> --- a/hw/riscv/riscv_hart.c
> +++ b/hw/riscv/riscv_hart.c
> @@ -53,6 +53,8 @@ static const Property riscv_harts_props[] = {
>       DEFINE_PROP_ARRAY("rnmi-exception-vector", RISCVHartArrayState,
>                         num_rnmi_excpvec, rnmi_excpvec, qdev_prop_uint64,
>                         uint64_t),
> +    DEFINE_PROP_LINK("memory", RISCVHartArrayState, memory,
> +                     TYPE_MEMORY_REGION, MemoryRegion *),
>   };
>   
>   static void riscv_harts_cpu_reset(void *opaque)
> @@ -117,6 +119,12 @@ static bool riscv_hart_realize(RISCVHartArrayState *s, int idx,
>       object_initialize_child(OBJECT(s), "harts[*]", &s->harts[idx], cpu_type);
>       qdev_prop_set_uint64(DEVICE(&s->harts[idx]), "resetvec", s->resetvec);
>   
> +    /* Use private memory instead of system_memory if provided */
> +    if (s->memory) {
> +        object_property_set_link(OBJECT(&s->harts[idx]), "memory",
> +                                 OBJECT(s->memory), &error_abort);

IMHO this logic should be inverted: we want explicit memory bus mapping
by default, and if not set then take the global memory. Personally I'd
even go further and assert it is set (otherwise programming error), with
a preliminary patch setting global system memory to current machines.

> +    }
> +
>       if (s->harts[idx].cfg.ext_smrnmi) {
>           if (idx < s->num_rnmi_irqvec) {
>               qdev_prop_set_uint64(DEVICE(&s->harts[idx]),


