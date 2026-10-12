Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BEC8CA9ED2
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Oct 2026 09:39:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xGCVF-00043Q-0J; Mon, 12 Oct 2026 05:39:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xGCVC-00042Z-PE
 for qemu-riscv@nongnu.org; Mon, 12 Oct 2026 05:39:26 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xGCV9-00073J-Hz
 for qemu-riscv@nongnu.org; Mon, 12 Oct 2026 05:39:26 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69C8KtKY312836
 for <qemu-riscv@nongnu.org>; Mon, 12 Oct 2026 09:39:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TX5GKIOh4OFebQubg6UFnRZxE4XAme6FeLaQHqPJiVA=; b=axtZDi7/ZFnI+ZKY
 MVB3/w8zl6/kYExCn/5FTpu1YoaNYIfQRmmWSm9zFVF9RYX8im52xnJEh9e5m+Wc
 LNNPL6UbaDD3sKFW0qCjKpLJnnLw7JUbYvb4HFkIfZO6hkIFKN6i8EtMXvk2mFVq
 KPkooaEF41WtLuRp2N01rxdZQDugvpiU6yt+mljpymiZhq9uJA4IBHaWFdcGOoJS
 LIPS0seafR97B/vQkJxuswvvRX8mBhDXPTbkWoCIgZfV06RTiL9Ak2JXIp0jp84v
 P6q1c8ozA36pTrWYeYl2lTuZHDw6ib01CcComhWiMdSK6X8YbahZOjvIaicwE1D9
 vs+MgA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7ehjnwtq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 12 Oct 2026 09:39:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93e46c120dfso158045385a.1
 for <qemu-riscv@nongnu.org>; Mon, 12 Oct 2026 02:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791797960; x=1792402760; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=TX5GKIOh4OFebQubg6UFnRZxE4XAme6FeLaQHqPJiVA=;
 b=gluZl1M4OI9xSbFxejsi5YeDXXjf9oz7v7992YwrfGSSYjbYkO56m0hMuQqB/Y2W7Z
 d58bEwZQBua+vBPAKf0LWsLwpkKpkQcxNSlAfpOr+olrB2/5sLrLUFS7oBTqiDemiknw
 XfrHaeu7Z+N4qFV75g/KPYE1aJyKUnWVeQoQxVdbV2eZ6EyQEiVXjYBKCBx6k35Cdv6u
 rHV8M9CbmptFzqTUm+O50+dwwa1pMugurYXa2Pab7Ia098iEIigmtBM66t+iACgfY5HR
 oSbA9JlQ/UaPS7dD1QWnHBkTFRON/4v67Jh5kMmh8Po0+foi0mTJUJlwnKyvM8cIgqsj
 PVog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791797960; x=1792402760;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=TX5GKIOh4OFebQubg6UFnRZxE4XAme6FeLaQHqPJiVA=;
 b=R77gDHhnck6/8xqcjqWAoBHnltEK7Wags2r0uQ83s6g+x+vn+Wq91RewVqHcJbfAwe
 7lS46MC4Ya5KgNFGftR7eyx7o2YvEu2Vspj/R8bTY+Gt8KjAPCTKLCBa7HKjgMG4dauJ
 KZwvm8KB9eI3Upo0mvTOPL0HVtwOsoU3wbxajn06ZnImnF82Vl2sJby9/BgBNb0G94rJ
 jnwBoOruXeYeGWTbFQ9UqkiGE5loeDS8BgWD2KZ29u8XBR4tANyivOoTK4ifiY9upM3B
 CZH6acTtKB+4jx4A36Z2NsurzuXCv1pDGCmU+aU1jQX4uVXKFZ34mvShB1+XHFGrEpU4
 slLQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwfhWQP/yLJ0Yt4ThS9YT067QQOr2uFcmANaIsi9/GeYXaBO7fdRqGLgpUa+LN7J60mtxb+LROCK9BU@nongnu.org
X-Gm-Message-State: AFq9FYIw64atVvN0VTUuFzcIrd2HppMCeusPbNj/TOKxHoFqJFoYvDap
 +jRhJFeTRImBYqNrYixVBckVDGsQdn99YtQJcEfyARyP4iswXTkAljnR+OJt0xPRirBWkn+6tHY
 OAkEWwK9U0uO6vwUQW6YhsbDTtdeAcCaNNgmZ+2cazJtsNMxd2hbT/SwJXQ==
X-Gm-Gg: AYBFou1XSLLeKTAVHrIKkFJ+AU8oDLEZeoZMBPXVsnW/iwt2eM+oOk/fHJOJL2uuKcG
 KIFNwaBEeTjN6CWlPqWxzgvT2Y5P5fIQCw0bmP1YFXU65B09LwwgV9tYximcNuZpP4RVIqlO9L/
 Vc7t1JQkJ3JR285g2S/o8CtI0nDdOjoqiZtYYv7jrObh3JfecAV2Z+jMFKIsIde5PhhupOw1dk7
 80n2kalBRNVJlBlOxxKzNuhEInP3Xk6oAF25CHk7OlAi/fA/dZ6hzYlbiEgHHdY/qfwxOIfCOsp
 uyleUHewP9FpgvonyVEyW2K2MrD5Nynl3PYryjOa8gcgSLcy6CLD7Yobzmsse+Zga15dJmw7J1N
 J+LW7Qt8tki2fwROXMM+cADeOputCmsCRr/0=
X-Received: by 2002:a05:620a:4693:b0:93a:9ef5:d370 with SMTP id
 af79cd13be357-93ebd0be3d8mr1534818485a.1.1791797960463; 
 Mon, 12 Oct 2026 02:39:20 -0700 (PDT)
X-Received: by 2002:a05:620a:4693:b0:93a:9ef5:d370 with SMTP id
 af79cd13be357-93ebd0be3d8mr1534815885a.1.1791797959966; 
 Mon, 12 Oct 2026 02:39:19 -0700 (PDT)
Received: from [192.168.68.107] ([152.234.126.58])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93eb9848702sm819358085a.12.2026.10.12.02.39.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2026 02:39:18 -0700 (PDT)
Message-ID: <3847ee55-78c8-496d-942e-104def334b72@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 06:39:14 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] hw/riscv/virt: Add ACPI PPTT table
To: Sunil V L <sunilvl@oss.qualcomm.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, "Michael S . Tsirkin"
 <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Anup Patel <anup.patel@oss.qualcomm.com>,
 Drew Fustini <fustini@kernel.org>,
 Sia Jee Heng <jeeheng.sia@starfivetech.com>
References: <20261011182552.1071742-1-sunilvl@oss.qualcomm.com>
 <20261011182552.1071742-3-sunilvl@oss.qualcomm.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261011182552.1071742-3-sunilvl@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzOCBTYWx0ZWRfX4J31asq49C04
 wVOLphHvfF3QUBuE1Yw/xPXHzFEBSKm7F9AtsRnXjT0F8dGg6eRZo3m3rAdgCem2Nu69Y0A5bNH
 JErl0W0Qyu8FjPbh27dyWo6u23fATPxDF/07vWs2zd6JppIXQ7imHoabauZxYH6M4z4pAW0Sw02
 QzMxGNYRySZBcDawVvNyu1Lw7owxG52xUnxEo5htEMc3R8uJAW8rBCUdfpvO61igN6XjtikN8aM
 kFDFuzPJu76RSU7qaUQto9ufns0G22wS+ul15ZTYdOEWX4/uKjx3brGU4M7JSSv/m3DgtcwHGld
 In2mR6cWNJUWW0Kk88GylvGB9H0BivprT7uzS4LtLnBxHwFfXmvdHd/6VM1HrjurMRrySQeIdGi
 CkEGGm8pMXzQNZLb0fKUr6acj+XPNNkOb1KiQg2ZrgnYG5i6f/nQz6UD78xVbCXa+7yrSl1khIq
 v/paYwXIV8y7oNqrPDw==
X-Proofpoint-ORIG-GUID: 7C0-I6o-PZltafSRIsFil59GpK_aI7r0
X-Authority-Analysis: v=2.4 cv=MpTHeGae c=1 sm=1 tr=0 ts=6accaac9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=XIBTAJF/fpiF5bhQ2IRv1g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Bq6zwJu1AAAA:8 a=e7M5XfOby5X2jGa20tgA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=KQ6X2bKhxX7Fj2iT9C4S:22
X-Proofpoint-GUID: 7C0-I6o-PZltafSRIsFil59GpK_aI7r0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzOCBTYWx0ZWRfX5+pG+ir5Citw
 Ed6yuI9d3dgRe3ubTlwhtHzQX+CSx3ReSz1u7aKWFY7R/k69ZxIFo6UTTfe6FpyG14fuho8/bsZ
 iWUFrjn9GLVDth4L88QboySbw8wTl7o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120038
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Hi Sunil!

On 10/11/2026 3:25 PM, Sunil V L wrote:
> From: Sunil V L <sunilvl@oss.qualcomm.com>
> 
> Generate the Processor Properties Topology Table (PPTT) for the RISC-V
> virt machine.
> 
> Describe the machine using separate L1 data and instruction caches plus
> unified L2 and L3 caches, and enable the corresponding cache and cluster
> SMP properties.
> 
> Signed-off-by: Sunil V L <sunilvl@oss.qualcomm.com>
> Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> ---
>   hw/riscv/virt-acpi-build.c |  7 +++++
>   hw/riscv/virt.c            | 54 ++++++++++++++++++++++++++++++++++++++
>   include/hw/riscv/virt.h    |  4 +++
>   3 files changed, 65 insertions(+)
> 
> diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> index 0475dcb5c601..3c72a03dadb6 100644
> --- a/hw/riscv/virt-acpi-build.c
> +++ b/hw/riscv/virt-acpi-build.c
> @@ -882,7 +882,10 @@ static void virt_acpi_build(RISCVVirtState *s, AcpiBuildTables *tables)
>       unsigned dsdt, xsdt;
>       GArray *tables_blob = tables->table_data;
>       MachineState *ms = MACHINE(s);
> +    CPUCoreCaches caches[CPU_MAX_CACHES];
> +    unsigned int num_caches;
>   
> +    num_caches = virt_get_caches(caches);

So if we have virt_get_caches() as:

unsigned int virt_get_caches(CPUCoreCaches *caches)
{
     for (int i = 0; i < ARRAY_SIZE(virt_caches); i++) {
         caches[i] = virt_caches[i];
     }

     return ARRAY_SIZE(virt_caches);
}


And then we do:


     CPUCoreCaches caches[CPU_MAX_CACHES];
     unsigned int num_caches;

     num_caches = virt_get_caches(caches);


Isn't that the same as:


     CPUCoreCaches caches[CPU_MAX_CACHES];
     unsigned int num_caches = ARRAY_SIZE(virt_caches);

     memcpy(caches, virt_caches, num_caches * sizeof(CPUCoreCaches));


and then we can get rid of virt_get_caches()?  Am I missing something?


Cheers,
Daniel


>       table_offsets = g_array_new(false, true,
>                                   sizeof(uint32_t));
>   
> @@ -915,6 +918,10 @@ static void virt_acpi_build(RISCVVirtState *s, AcpiBuildTables *tables)
>           spcr_setup(tables_blob, tables->linker, s);
>       }
>   
> +    acpi_add_table(table_offsets, tables_blob);
> +    build_pptt(tables_blob, tables->linker, ms, s->oem_id,
> +               s->oem_table_id, num_caches, caches);
> +
>       acpi_add_table(table_offsets, tables_blob);
>       {
>           AcpiMcfgInfo mcfg = {
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index d4b501802f60..245651fbbd13 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -109,6 +109,45 @@ static const MemMapEntry virt_memmap[] = {
>       [VIRT_DRAM] =         { 0x80000000,           0x0 },
>   };
>   
> +CPUCoreCaches virt_caches[] = {
> +    {
> +        .type = DATA_CACHE,
> +        .sets = 256,
> +        .size = 64 * KiB,
> +        .level = 1,
> +        .linesize = 64,
> +        .attributes = 0x0,
> +        .associativity = 4,
> +    },
> +    {
> +        .type = INSTRUCTION_CACHE,
> +        .sets = 256,
> +        .size = 64 * KiB,
> +        .level = 1,
> +        .linesize = 64,
> +        .attributes = 0x0,
> +        .associativity = 4,
> +    },
> +    {
> +        .type = UNIFIED_CACHE,
> +        .sets = 4096,
> +        .size = 2048 * KiB,
> +        .level = 2,
> +        .linesize = 64,
> +        .attributes = 0x0,
> +        .associativity = 8,
> +    },
> +    {
> +        .type = UNIFIED_CACHE,
> +        .sets = 8192,
> +        .size = 4096 * KiB,
> +        .level = 3,
> +        .linesize = 64,
> +        .attributes = 0x0,
> +        .associativity = 8,
> +    },
> +};
> +
>   /* PCIe high mmio is fixed for RV32 */
>   #define VIRT32_HIGH_PCIE_MMIO_BASE  0x300000000ULL
>   #define VIRT32_HIGH_PCIE_MMIO_SIZE  (4 * GiB)
> @@ -140,6 +179,15 @@ static void virt_flash_map(RISCVVirtState *s,
>                            sysmem, VIRT_FLASH_SECTOR_SIZE);
>   }
>   
> +unsigned int virt_get_caches(CPUCoreCaches *caches)
> +{
> +    for (int i = 0; i < ARRAY_SIZE(virt_caches); i++) {
> +        caches[i] = virt_caches[i];
> +    }
> +
> +    return ARRAY_SIZE(virt_caches);
> +}
> +
>   static void create_fdt_socket_plic(RISCVVirtState *s,
>                                      int socket,
>                                      uint32_t *phandle, uint32_t *intc_phandles,
> @@ -1144,6 +1192,12 @@ static void virt_machine_class_init(ObjectClass *oc, const void *data)
>       mc->cpu_index_to_instance_props = riscv_numa_cpu_index_to_props;
>       mc->get_default_cpu_node_id = riscv_numa_get_default_cpu_node_id;
>       mc->numa_mem_supported = true;
> +    mc->smp_props.clusters_supported = true;
> +    mc->smp_props.cache_supported[CACHE_LEVEL_AND_TYPE_L1D] = true;
> +    mc->smp_props.cache_supported[CACHE_LEVEL_AND_TYPE_L1I] = true;
> +    mc->smp_props.cache_supported[CACHE_LEVEL_AND_TYPE_L2] = true;
> +    mc->smp_props.cache_supported[CACHE_LEVEL_AND_TYPE_L3] = true;
> +
>       /* platform instead of architectural choice */
>       mc->cpu_cluster_has_numa_boundary = true;
>       mc->default_ram_id = "riscv_virt_board.ram";
> diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> index e516898f9ad9..1e498a4f5f6e 100644
> --- a/include/hw/riscv/virt.h
> +++ b/include/hw/riscv/virt.h
> @@ -121,10 +121,14 @@ enum {
>   #define VIRT_PLIC_SIZE(__num_context) \
>       (VIRT_PLIC_CONTEXT_BASE + (__num_context) * VIRT_PLIC_CONTEXT_STRIDE)
>   
> +#define CPU_MAX_CACHES 16
> +
>   bool virt_is_acpi_enabled(RISCVVirtState *s);
>   bool virt_is_iommu_sys_enabled(RISCVVirtState *s);
>   void virt_acpi_setup(RISCVVirtState *vms);
>   
> +unsigned int virt_get_caches(CPUCoreCaches *caches);
> +
>   /*
>    * The virt machine physical address space used by some of the devices
>    * namely ACLINT, PLIC, APLIC, and IMSIC depend on number of Sockets,


