Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2047606A31F
	for <qemu-riscv@archiver.kernel.org>; Thu, 22 Oct 2026 09:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=arCJMKwV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HUkbHjrb
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJpEk-0005xB-KB; Thu, 22 Oct 2026 05:37:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xJpEi-0005wj-23
 for qemu-riscv@nongnu.org; Thu, 22 Oct 2026 05:37:25 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xJpEf-0001c8-QG
 for qemu-riscv@nongnu.org; Thu, 22 Oct 2026 05:37:23 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69M7chtW3677263
 for <qemu-riscv@nongnu.org>; Thu, 22 Oct 2026 09:37:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Met1yuz+a9fbYLJ/Vf2zNO1UzM4V5gFrbE3bYUbE3tw=; b=arCJMKwVHJLOShuU
 DDmGXH6J+5uRbuHSOk2lFwEHOYA8hUknZHXnoxs5zYJ/624r+72AnU38Io/ENFbJ
 4MW1N7VVuvg9bOeIhbE2JVNAhbHrefzwYCHGAwLFtWNkovBHrFV1MP1UZGnK5jMi
 Fny01FiNFwhDKFqWWpHuMbgzpQTNXFytc4lEK4YxVAW6w6wwQufeCYNzWAUl4Em6
 vv6GWB+HQMV7grb0nIguI8T/dWEN4KTJl+FstCHb+Yvc8nlJNIV8pYPINAbd1nF3
 6yuYUxXoHbn5e4UY+DVf9rrdZ8So/lV7tgnv41k4+5Is2nov8oKSkbMQf7zLXtte
 roFJlg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93c9p88-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 22 Oct 2026 09:37:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-92e82060977so163898685a.1
 for <qemu-riscv@nongnu.org>; Thu, 22 Oct 2026 02:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792661839; x=1793266639; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Met1yuz+a9fbYLJ/Vf2zNO1UzM4V5gFrbE3bYUbE3tw=;
 b=HUkbHjrbxOqxhwEqNOAGfoCvtfhlNd1MHO5BvFCFqftTtkSfPB+cL7fJX5SPbyHErd
 ESQVXcSWsE39IGkVYNiSOunHz5z7wXFYFnod8kb5/GxOXMydwLfhz4LdfWkayKSMukpc
 q0yC4k2uBXKnxDsJh5FmU2VZVKXAa64Cl4NEPSTTvy4h4CilblUZwhqUex27DyOB+m+P
 RUYHi96064SojoDqYUPmhsYkkweS5GEZp7op9zOD/hmz+swFQ8WZaiEY79OOoLpEUCHF
 ttZb6gHLlZVi8LD1UaaWDBER8pWXr/8gKncr+sE52QVdbP2YJdgEbv4jtJMqHcsCUx3I
 1W2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792661839; x=1793266639;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Met1yuz+a9fbYLJ/Vf2zNO1UzM4V5gFrbE3bYUbE3tw=;
 b=Bq3NsAV0Ba7RESlx6GxXUohCKlKfbcsYynVH8rwIvL0O1M5JZLP/JzKvceKheByeJu
 2rbjtHAfsegJfRP+vqZmg3N3TrZWUc961Zd3w5/Vs9zTWpy+n2mRpZvLaKZZDrrKK4U5
 4Hm+zjOHXjhWlrFdmmscnIJpF8+vY5laciVhRhw2HBoPOBUG4XwyGUdQODXtI87R0sjQ
 +9Ep/DdGamfdN4TkFi6S+huodDrT0dVSGuA+7fypHTAvwAa3/BD+Iq0HAmWec8eeQgqK
 V9L0Lew7uqO02GM+eXFoLOckeu6/TOV9StkmJDWNhG25TpXF5uBN2Hv9dnKDUiudffGg
 tNig==
X-Forwarded-Encrypted: i=1;
 AKwUvBxoUis5QfDyG/nv74V64y7K6qTNmJ8oUAKhi4C7pTkVtvTSKS7GAqYapH+AJn12DWLYSGvpZFXoloNI@nongnu.org
X-Gm-Message-State: AFq9FYKo8wGGuNv8lKWyILcsV0yAGaYPKKtfzF029hljo9O9N/ywq6dH
 k/7GIJ2Vt7kmy/FDyShc0Qdk/cnHHLC8vzrr6yX6EDx8Y/iPJVVYED35ztPyfcUVflF5PkP0NZ8
 MFNW7Uaa9l8OABHsxa+jPfigUZYCJN0ctd6JPPZEvjQU1bzjvErRMldEtYQ==
X-Gm-Gg: AYBFou1FkPbmnR3B5xTzrDkF8epqajv+JIwyddbxFoOZxTa2a+Vr4hW6sauVf9c1hCi
 3u1NfTwHLAgPMLahG0Gy4ZDMe9Jz4GxkQ97s9bEESxq5SmGd3IdpgiJlog7eJ+G29PEYTijcVcd
 1lWxwz+DInAy4ywWY6yoR64v/An/PiPBfK2BFrM2aVRo4mdSCoiC4JK8HnFMiHcgTkTasKNIlOz
 GZRtcoZEw+y44foV0yKl8Z6MXC0u7RRKMR2MWqvLSrq16dImOAQaRXZfv2vdleAs5l/RH71Mh+U
 zgyrrIKzLJpz0ELgOu/bcVpWM7WZ+JX8roonPa7ExQyDr/nIkWKnEgxo5+TADPNT2MzG50UrhsK
 owaL6FtUuvrXGXU01zYJkCNl5uLV058lSqWe+
X-Received: by 2002:a05:620a:2550:b0:93e:c12d:4ec9 with SMTP id
 af79cd13be357-93f627d22bfmr278563185a.41.1792661839176; 
 Thu, 22 Oct 2026 02:37:19 -0700 (PDT)
X-Received: by 2002:a05:620a:2550:b0:93e:c12d:4ec9 with SMTP id
 af79cd13be357-93f627d22bfmr278560885a.41.1792661838639; 
 Thu, 22 Oct 2026 02:37:18 -0700 (PDT)
Received: from [192.168.68.104] ([152.234.125.162])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91c10b736adsm45269496d6.7.2026.10.22.02.37.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Oct 2026 02:37:18 -0700 (PDT)
Message-ID: <b1ec9cdf-e20c-4ec2-8ed1-419d0276f8ae@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 06:37:14 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] hw/riscv: share the PLIC interrupt cells between
 boards
To: Ralf Ramsauer <ralf@vmexit.de>, qemu-devel@nongnu.org
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, Bin Meng <bmeng.cn@gmail.com>,
 Lukas Landgraf <lukas.landgraf@st.oth-regensburg.de>
References: <2949aabb-200f-44bd-9b9d-4d0ceaaf77e4@oss.qualcomm.com>
 <20261021203551.3211170-1-ralf@vmexit.de>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261021203551.3211170-1-ralf@vmexit.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzOCBTYWx0ZWRfX2AnozxvdcAPY
 FmdVuN2RiHIK5I//wivvYLEfxTJsOnW7ZqqWFyuHGo3A/xgNQiZSO9YVd7uICdMC9EScfJjBGSk
 yEbRgP4R7/dhLT7YZkV3rMdIEASe8j0=
X-Authority-Analysis: v=2.4 cv=ReAFmFtv c=1 sm=1 tr=0 ts=6ad9d94f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=AgQEunjic7gIBKSbIeB6Ag==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=MtFd9EPPngaKLdiOwr0A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: qSaSuq1j2Tt09CyGnnf7yA271d7l7bOL
X-Proofpoint-ORIG-GUID: qSaSuq1j2Tt09CyGnnf7yA271d7l7bOL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzOCBTYWx0ZWRfX/9rgpcW0945R
 TL5yNCchvUlu1u+sjSbjYSaN6ujIhAx2qEAHLYOXDn5WOmNO7X4lXUR18W85ZsKykG6SASVZX/q
 0NSPPc7Mq+vjCEFZvxcr/droSS4g68ho/CJbSxtI7nGH/CNXdYyYUlJZS2rjFjQKsgl1BtMNpIS
 LQvd78GETx88CvUjsc1Pj0OjWdVA6R0UMtu7s269XI/buHI5vziB6n9G4rFCuEllPac5W/JW2Sw
 oTiJfmPyC/ZeNqT78EZqGlWrNFPillx2TXqhCN6hGst2UfLQpAPlhisHznj5UWTJCoyzV1LeUtS
 GHPnqWUziv2eFKflyaT6p3XIYiqbkJ2TKjpCJC93uqvuR3LX5NWaQhiSLtqMoOPKmJ6LM40r45K
 4uH0s3pl73G6PJMaObJdcKnQVboi+V/udR+c2YUHfADvNTaNRUgKRPNAS6IPFiRjyM4p95lWG04
 4n7zkOgokP5gBEYxXJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220038
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



On 10/21/2026 5:35 PM, Ralf Ramsauer wrote:
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

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

> Cleanup, not a fix.  Can be dropped, the rest does not depend on it.
> 1-3 are unchanged since v2 and carry your Reviewed-by.
> 
> v3:
>   - take has_m_mode as a parameter, the boards keep the accelerator
>     considerations and the fdt helper just writes what it is told (Daniel)
>   - virt.c uses one has_m_mode local for the allocation and the call
> 
>   hw/riscv/fdt-common.c         | 18 ++++++++++++++++++
>   hw/riscv/sifive_u.c           | 12 ++++--------
>   hw/riscv/virt.c               | 16 ++++++----------
>   include/hw/riscv/fdt-common.h |  3 +++
>   4 files changed, 31 insertions(+), 18 deletions(-)
> 
> diff --git a/hw/riscv/fdt-common.c b/hw/riscv/fdt-common.c
> index ce2dcb43b4..503d818dd0 100644
> --- a/hw/riscv/fdt-common.c
> +++ b/hw/riscv/fdt-common.c
> @@ -212,6 +212,24 @@ riscv_create_fdt_socket_cpu_sifive(void *fdt, char *clust_name,
>                                      phandle, intc_phandles, false, false);
>   }
>   
> +uint32_t riscv_plic_hart_fdt_cells(uint32_t *cells, RISCVCPU *hart,
> +                                   uint32_t intc_phandle, bool has_m_mode)
> +{
> +    uint32_t len = 0;
> +
> +    if (has_m_mode) {
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
> index 8f50c67a14..be194f8aec 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -58,6 +58,7 @@
>   #include "chardev/char.h"
>   #include "net/eth.h"
>   #include "system/device_tree.h"
> +#include "system/kvm.h"
>   #include "system/runstate.h"
>   #include "system/system.h"
>   
> @@ -201,14 +202,9 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
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
> +                                                  intc_phandles[cpu],
> +                                                  !kvm_enabled());
>       }
>   
>       riscv_create_fdt_plic(fdt, memmap[SIFIVE_U_DEV_PLIC].base,
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index a2851b506d..ece8ef0070 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -152,24 +152,20 @@ static void create_fdt_socket_plic(RISCVVirtState *s,
>       unsigned long plic_addr = s->memmap[VIRT_PLIC].base +
>                                 (s->memmap[VIRT_PLIC].size * socket);
>       bool numa_enabled = riscv_numa_enabled(MACHINE(s));
> +    bool has_m_mode = !kvm_enabled();
>       uint32_t cells_length;
>   
>       plic_name = g_strdup_printf("/soc/interrupt-controller@%lx", plic_addr);
>   
>       plic_cells = g_new0(uint32_t,
> -                        s->soc[socket].num_harts * (kvm_enabled() ? 2 : 4));
> +                        s->soc[socket].num_harts * (has_m_mode ? 4 : 2));
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
> +                                                  intc_phandles[cpu],
> +                                                  has_m_mode);
>       }
>   
>       plic_phandles[socket] = (*phandle)++;
> diff --git a/include/hw/riscv/fdt-common.h b/include/hw/riscv/fdt-common.h
> index eb9db8278d..58e635e9ed 100644
> --- a/include/hw/riscv/fdt-common.h
> +++ b/include/hw/riscv/fdt-common.h
> @@ -93,6 +93,9 @@ void riscv_create_fdt_socket_cpu_sifive(void *fdt, char *clust_name,
>                                           int socket_hartid_base,
>                                           uint32_t *phandle,
>                                           uint32_t *intc_phandles);
> +/* Describe one hart's PLIC contexts, returns the number of cells written */
> +uint32_t riscv_plic_hart_fdt_cells(uint32_t *cells, RISCVCPU *hart,
> +                                   uint32_t intc_phandle, bool has_m_mode);
>   void riscv_create_fdt_plic(void *fdt, hwaddr addr, uint64_t size,
>                              uint32_t plic_phandle, uint32_t int_cells,
>                              uint32_t addr_cells, uint32_t *plic_cells,
> 
> base-commit: 81ce3a87737aa50716c42db8886082d12783e0a1
> prerequisite-patch-id: 70f23581616a275c2b659d655418184163a0c37c
> prerequisite-patch-id: e0d267d9d4940408ecf478a14f7cbffd069b9666
> prerequisite-patch-id: 0164dcda18a619b9f4a6f84eedcc5fe1e8c92eb9


