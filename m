Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15555606A321
	for <qemu-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 18:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AiuLniX1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q182e1rK
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJbOs-0003yx-WA; Wed, 21 Oct 2026 14:50:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xJbOq-0003sm-BG
 for qemu-riscv@nongnu.org; Wed, 21 Oct 2026 14:50:56 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xJbOo-0004A4-8z
 for qemu-riscv@nongnu.org; Wed, 21 Oct 2026 14:50:56 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69LHpLJ02416065
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 18:50:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 o2Dp3S3JPLh03/tNEB7AIFX/p8Hdvb1C6Z1SsbCdJpU=; b=AiuLniX1mpRECtNH
 us3+ti4mUTzywWxCzjDo8mXHisJe3XZZkS5ODDRyhpalRDx+DctPzR/SXVkm6Vvh
 7i6dAmo4YE3JVfmYDryCuLiKisCF4jYcdi8HH5tevovNOAId2uXxFzp9GRZ40/fL
 TogKTpBO+g9qdn73+xK8Ibdg0BSKQpSSVZmuHFSQqxnm1gmhHH9vfG8J09OhHhBb
 mFgMWVjeZY34SDmJS84l9ef1g616uaqHnsbELg9qyIK+ftTdCAHSgOn3dbbqBKKD
 GkQj8mrMb/QDYLo4gRXEKaPHop1kCtJKst8UInM7BrAUB3ibMUNNTOc1yqV29Cob
 ELN+2Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heuhuj49v-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 18:50:51 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-5364605e74bso26991461cf.3
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 11:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792608651; x=1793213451; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=o2Dp3S3JPLh03/tNEB7AIFX/p8Hdvb1C6Z1SsbCdJpU=;
 b=Q182e1rKYfNCzoXkuoueyIpIA3tRgVKzDX3OxkZQ42Ds3zQaI4+hym4czeRwzBfe5C
 aSpLp9VOTXhEr5dgjYjShDgTKgAJ5gpfGsEqULZubv7RGbPbifj0Qir21W8BmCxS9Hnc
 SMI6OoFkS6psE8vYXTFyOsXtlYoB00OxoDN6JLgan2kY5W8kUDpsACu3ZAISnKJBIU5Q
 YKeO6/gvFc9JKIQ8LNrSa33JxETCc8WPD6CcwIlb9XH6Y8WMORQURBXE3YSfUTuo+7PA
 6/GHrS8n4iVnqdICxW9OAmLj0CHYJdQ7YHM3dNoYPimTxrD+cdeHQH03M9HVhNwXSuO6
 oMqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792608651; x=1793213451;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=o2Dp3S3JPLh03/tNEB7AIFX/p8Hdvb1C6Z1SsbCdJpU=;
 b=aEfnC6qWWxxT0ulKQ9GG3WQSavOdlPHzIWY/cusTFoP49QuWGAJjjOIRcoqbiSSjq4
 OAP4UsAA7zy0MVMfrsulmbdqnNaEd71WHVPyWisCg/5zvSLWFgFE7N0NGXCyRmrYG1fX
 GDcmgfAP2PK0dZn+LGbaNn2sIWPq9+L9YRFJadD8/Ggaa3E++w96YNmuQJh2pgbSEwc/
 77EnFBFkk0kNf7X5Ak207FyQy0oIw2KEBvJ0isf7wy/eiuNZozKd+pa5fLlyifpHrItK
 2M5gonCIK3xq1ZclMeLXW/JjGH86GHZso9EgBErqiW55LmHuRf558Lorrl32oEU8tDJd
 G1UQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByJg9sVjwfavugTJ9b5IRK6ilUIbFSdyEHfOTDK+N+ndiQSBbJZZnko88xHIZ1LsYThuw2U7CF5Fwfs@nongnu.org
X-Gm-Message-State: AFq9FYLYCbHS7V1MDaV26klX1/Wnr+E29Ddhg2JUKKORFHKXMKwCV0Ip
 919qij17kdXTrM3m7nwOe63jBXa1/HhT9P9ylnvgGaB5wLog7QZkxN+eb17v4VCQ05Ttm8vd6jH
 0CDfJaCxd8qQt5Ysimsl0Gr82O+E6msKL1az7FsIGr+TBZkX2LHquGNiM8Q==
X-Gm-Gg: AYBFou2aOV7/YGN5mx1Ylj6PGKm85g59j2TbRqFL7iFUaHw8DAZ9XuVYj99ixDlV3xN
 4hwp7fWwD1vL2duZHnx+Pm5xFjxLgoIm9IXxj+ASsSLmXJlHcPhZWqPenPlyvEGjSKg+ScY08XE
 9ujldfvmpYRnLRHZqL9IogEGKjXQwyaGmgT+WwoRd51RloQJLgQtUTCPrd+0Z8P4KknBgx1ZvMa
 3Xr+KkE1SdpCMnCv2uInXe9C2y0z6t2/tzjwAO4q+EoMHQPP2yAjNQiJPWq1KI0df98lT0tFtDD
 TQpm5xx9XZUVM2AMS3ILAWDl2yIPYkeIV+TweMc+dbkLEmT0oTmp2l4m5jjWwBVIlHwCj74w+Ki
 l+UYYJTSeB3w4QqV+y3iprpWPAZnRRit0j7b78NWfiZIq0IO+nYjs50tHW+bO4Wuoh1djr42f
X-Received: by 2002:ac8:5ac4:0:b0:536:1f7a:610e with SMTP id
 d75a77b69052e-5369b5a5426mr49637361cf.6.1792608650427; 
 Wed, 21 Oct 2026 11:50:50 -0700 (PDT)
X-Received: by 2002:ac8:5ac4:0:b0:536:1f7a:610e with SMTP id
 d75a77b69052e-5369b5a5426mr49637061cf.6.1792608649919; 
 Wed, 21 Oct 2026 11:50:49 -0700 (PDT)
Received: from [192.168.68.101] (200-204-190-237.dsl.telesp.net.br.
 [200.204.190.237]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-536ab723d98sm6330791cf.13.2026.10.21.11.50.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Oct 2026 11:50:49 -0700 (PDT)
Message-ID: <2949aabb-200f-44bd-9b9d-4d0ceaaf77e4@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 15:50:46 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] hw/riscv: share the PLIC interrupt cells between
 boards
To: Ralf Ramsauer <ralf@vmexit.de>, qemu-devel@nongnu.org
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, Bin Meng <bmeng.cn@gmail.com>,
 Lukas Landgraf <lukas.landgraf@st.oth-regensburg.de>
References: <20261021110838.3097959-1-ralf@vmexit.de>
 <20261021110838.3097959-5-ralf@vmexit.de>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261021110838.3097959-5-ralf@vmexit.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=d4JgWhjE c=1 sm=1 tr=0 ts=6ad9098b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=QmVDPCq3bE4LYXGvZ20s0w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=MtFd9EPPngaKLdiOwr0A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA3NSBTYWx0ZWRfX7AbVy5DR7np0
 u1nDv2HLbLMykAZ/GaumZAl8Z7kpAlEhi+bEXYeyA4gL792TxB8nAn3Jb1cLbctz8eLxEE/Lkv0
 aewzuBhk3LRVN464yN9j82yLaUpK/cQ=
X-Proofpoint-GUID: wTpd7bfnZ9P_wAJueZS45KQQOnVkryDR
X-Proofpoint-ORIG-GUID: wTpd7bfnZ9P_wAJueZS45KQQOnVkryDR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA3NSBTYWx0ZWRfX24Po74A1ZE8h
 E98asKGXSziMhuoKa3JX/QuBgixZVY5G5YGHaVwAly8iYS9nPF18zIzT5hgSGSDvs8jFRFlynN7
 4x+piSNvJluqTEGuq0L6YjbMLanFuIYfs6LvmaHUQ94xqrype7g1hUbURJP/OMrHWYPk16tEuZI
 OD5nAdBNpInL9wseHdHyFJ+cBbwAOtSjv9ftLXxrOJx5Y5fy0427FLt1CLTNLAAfNgzMRXCsupb
 XuT178IR6tN48q10+BgJuI78bu2faKP2R+mQbM+Bzd9rriYq7iLXc1jwX6YLSKiVhxM7W2ZDPbY
 WqKPP3L08Q8Lm7oPK3Z3xPEo8M/IOPEjPjtLGxrXy8tiY1jBGPmg/SHK7eTKhczPNSwYA4BHDEH
 KTTnM9n91kbZwmlUHdiwwDWNoLH3OEVd+ybEKafCfXMxRAJp++kOcU8Aeqw8DyR63MTTUgbTL9C
 yj4nx9DmIQCZy0NfgYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210075
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



On 10/21/2026 8:08 AM, Ralf Ramsauer wrote:
> From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> 
> virt and sifive_u now describe a hart's PLIC contexts with the same rule:
> a machine context unless the hart runs under KVM, where there is no
> M-mode, and a supervisor context if the hart has supervisor mode.
> Writing that rule down twice is what let the virt device tree drift away
> from riscv_plic_hart_config_string().
> 
> This makes the sifive_u device tree ask whether KVM is in use, which it
> did not do before.  Its PLIC device already does, so the two now agree.
> 
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
> Cleanup, not a fix.  Can be dropped, the rest does not depend on it.
> 
>   hw/riscv/fdt-common.c         | 20 ++++++++++++++++++++
>   hw/riscv/sifive_u.c           | 10 ++--------
>   hw/riscv/virt.c               | 12 +++---------
>   include/hw/riscv/fdt-common.h |  3 +++
>   4 files changed, 28 insertions(+), 17 deletions(-)
> 
> diff --git a/hw/riscv/fdt-common.c b/hw/riscv/fdt-common.c
> index ce2dcb43b4..70f96734b4 100644
> --- a/hw/riscv/fdt-common.c
> +++ b/hw/riscv/fdt-common.c
> @@ -10,6 +10,7 @@
>   
>   #include "qemu/error-report.h"
>   #include "system/device_tree.h"
> +#include "system/kvm.h"
>   #include "hw/core/boards.h"
>   #include "hw/core/sysbus-fdt.h"
>   #include "hw/riscv/fdt-common.h"
> @@ -212,6 +213,25 @@ riscv_create_fdt_socket_cpu_sifive(void *fdt, char *clust_name,
>                                      phandle, intc_phandles, false, false);
>   }
>   
> +uint32_t riscv_plic_hart_fdt_cells(uint32_t *cells, RISCVCPU *hart,
> +                                   uint32_t intc_phandle)
> +{
> +    uint32_t len = 0;
> +
> +    /* harts running under KVM have no M-mode */
> +    if (!kvm_enabled()) {

In this file we're trying to keep it as bland as possible w.r.t accelerator logic.
The idea is that the boards will do accelerator considerations and just point
the fdt functions what to write in the fdt.  This will make it less annoying to deal
with accel differences across multiple files ... ideally.

For example in virt.c we have:

     riscv_fdt_create_cpu_socket_subnode(ms->fdt,
         kvm_enabled() ? kvm_riscv_get_timebase_frequency(&s->soc->harts[0]) :
                         RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ);

The above calls this fdt helper:

void riscv_fdt_create_cpu_socket_subnode(void *fdt,
                                          uint64_t timebase_frequency)

I.e. the fdt helper only cares about timebase_frequency to blindly put it in the
fdt.  It doesn't care if it's kvm or not.

So for this helper I suggest something like:

uint32_t riscv_plic_hart_fdt_cells(uint32_t *cells, RISCVCPU *hart,
                                    uint32_t intc_phandle, bool has_m_mode)

{
     uint32_t len = 0;

     if (has_m_mode) {
         ...
     }
     ...
}

And then virt.c and sifive_u.c makes accellerator considerations if needed.
E.g.:


riscv_plic_hart_fdt_cells(&cells[cells_length], hart,
                           intc_phandles[cpu], !kvm_enabled());


Thanks,
Daniel

> +        cells[len++] = cpu_to_be32(intc_phandle);
> +        cells[len++] = cpu_to_be32(IRQ_M_EXT);
> +    }
> +
> +    if (riscv_cpu_has_supervisor_mode(hart)) {
> +        cells[len++] = cpu_to_be32(intc_phandle);
> +        cells[len++] = cpu_to_be32(IRQ_S_EXT);
> +    }
> +
> +    return len;
> +}
> +
>   void riscv_create_fdt_plic(void *fdt, hwaddr addr, uint64_t size,
>                              uint32_t plic_phandle, uint32_t int_cells,
>                              uint32_t addr_cells, uint32_t *plic_cells,
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 8f50c67a14..456b6da3e6 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -201,14 +201,8 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
>       for (cpu = 0; cpu < ms->smp.cpus; cpu++) {
>           /* cpu 0 is the management hart that does not have S-mode */
>           hart = cpu ? &s->soc.u_cpus.harts[cpu - 1] : &s->soc.e_cpus.harts[0];
> -
> -        cells[cells_length++] = cpu_to_be32(intc_phandles[cpu]);
> -        cells[cells_length++] = cpu_to_be32(IRQ_M_EXT);
> -
> -        if (riscv_cpu_has_supervisor_mode(hart)) {
> -            cells[cells_length++] = cpu_to_be32(intc_phandles[cpu]);
> -            cells[cells_length++] = cpu_to_be32(IRQ_S_EXT);
> -        }
> +        cells_length += riscv_plic_hart_fdt_cells(&cells[cells_length], hart,
> +                                                  intc_phandles[cpu]);
>       }
>   
>       riscv_create_fdt_plic(fdt, memmap[SIFIVE_U_DEV_PLIC].base,
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index a2851b506d..a325891dca 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -161,15 +161,9 @@ static void create_fdt_socket_plic(RISCVVirtState *s,
>       cells_length = 0;
>   
>       for (cpu = 0; cpu < s->soc[socket].num_harts; cpu++) {
> -        if (!kvm_enabled()) {
> -            plic_cells[cells_length++] = cpu_to_be32(intc_phandles[cpu]);
> -            plic_cells[cells_length++] = cpu_to_be32(IRQ_M_EXT);
> -        }
> -
> -        if (riscv_cpu_has_supervisor_mode(&s->soc[socket].harts[cpu])) {
> -            plic_cells[cells_length++] = cpu_to_be32(intc_phandles[cpu]);
> -            plic_cells[cells_length++] = cpu_to_be32(IRQ_S_EXT);
> -        }
> +        cells_length += riscv_plic_hart_fdt_cells(&plic_cells[cells_length],
> +                                                  &s->soc[socket].harts[cpu],
> +                                                  intc_phandles[cpu]);
>       }
>   
>       plic_phandles[socket] = (*phandle)++;
> diff --git a/include/hw/riscv/fdt-common.h b/include/hw/riscv/fdt-common.h
> index eb9db8278d..14116a95cf 100644
> --- a/include/hw/riscv/fdt-common.h
> +++ b/include/hw/riscv/fdt-common.h
> @@ -93,6 +93,9 @@ void riscv_create_fdt_socket_cpu_sifive(void *fdt, char *clust_name,
>                                           int socket_hartid_base,
>                                           uint32_t *phandle,
>                                           uint32_t *intc_phandles);
> +/* Describe one hart's PLIC contexts, returns the number of cells written */
> +uint32_t riscv_plic_hart_fdt_cells(uint32_t *cells, RISCVCPU *hart,
> +                                   uint32_t intc_phandle);
>   void riscv_create_fdt_plic(void *fdt, hwaddr addr, uint64_t size,
>                              uint32_t plic_phandle, uint32_t int_cells,
>                              uint32_t addr_cells, uint32_t *plic_cells,


