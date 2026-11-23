Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6D4606A327
	for <qemu-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 13:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MBE1Wb/l;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XsM3jGhj
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xVTga-0006Qz-BF; Mon, 23 Nov 2026 08:02:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xVTgG-0006FE-1N
 for qemu-riscv@nongnu.org; Mon, 23 Nov 2026 08:02:06 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xVTgD-0000MF-QK
 for qemu-riscv@nongnu.org; Mon, 23 Nov 2026 08:01:59 -0500
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ANCG22G551169
 for <qemu-riscv@nongnu.org>; Mon, 23 Nov 2026 13:01:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 F1gFJ15/VkXNFitkQMduPe0dWyuv85qy1ddsXjmlDIc=; b=MBE1Wb/lBca325bi
 DdBvkw7l4hXBWU4IPHEeJi8iWphg+DUESfnmEAIO6nZ5sCLNIRjsS1oA2yqdqEz1
 qDcsI4QJUvXA7uTJVeMjJRaHJC2fna9hNMzxRBAKfyWH1DJLQMXoDDM0PnJ//A3L
 IkmGGv0mnZqAWnJ34lIN104R9Y8nQytj0EIMF7neImnLJejdq7SFDMCgHkoFz2jO
 x5tcCaQO8h3aWJEnsl0GlFVRwqmB66uQnNUKpSULrwpR7IXsr3A4P8AUPkHsQibB
 tSpSl0dsVch5iCgEKuV2EMM0g4i0yjdPVMEbE0LGEV8l9jdosEwMDQ4qm3q7bR8c
 VNtD0A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ma0rce4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 23 Nov 2026 13:01:54 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-9210ec7cb34so91795546d6.0
 for <qemu-riscv@nongnu.org>; Mon, 23 Nov 2026 05:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795438914; x=1796043714; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=F1gFJ15/VkXNFitkQMduPe0dWyuv85qy1ddsXjmlDIc=;
 b=XsM3jGhjvla6WV1yDZxONWEcMJgouBWNduAxlwSLsWwj00+cnlvlTejD/AgKSgIfxu
 3JpQdiX0UVPIoGlQa8WO1bdKurLX7kmQSne8+oQWZ9CEIhVGFthXq+P3KJEvHJIkpYvx
 +x7/BjducF66hcpg4gPHNONZ3czrxJsnWb4MPsyFIlzHMa0/5GGbWYoEIVnHqV7KgbLl
 aH6qNxosHrR8wXCpGwSUDXgSzW6oln6WOoKsrN67hyDuiHsDS42BbuaatGz+i/rPWg9R
 OiJBWt3ZG9sqcCmlObhWT7vl8vuXsQDjGL8qgagdPmvpOBrAjaDDI6O/7oOMKzu52MW3
 B46g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795438914; x=1796043714;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=F1gFJ15/VkXNFitkQMduPe0dWyuv85qy1ddsXjmlDIc=;
 b=CSVilxjidcYftaDRYCTd2ZoQZ7QAF2bklwqcVxUzrTJWIO4e9VfgL58qegW43X4Egi
 C02m68jNfwXErtINCzFsd2r5UaDrQI0UcYyhudSthXgKcMLLLt2KUqQ4Q7UNoFriTx66
 GukulVRj8nY9xi0qlfCa8S991yac/ReP2XyvzTjbRUd7pQdZfLZBbv/lLj15WUWky8Qm
 zV6XPhgcm1dDStOuch2Q+827VPrXCW1QR28NOzMumMCAPjsjdHnYMyxsrgmsnR4GYXKK
 cNFfHuFPfwxeyM37Yy/e6PEOo90shIsvWKkKYG/9pHO2TQWx5fCQFwRLIgdVIy/yphex
 h1Yg==
X-Gm-Message-State: APuU4Z95yWCPqITpHd6AWuwZvnP2upDsb88UGVu6iumeD77xFMSEJrX4
 9rm1J4Y2nBqtN0f+7FGk5Uez7SWVfsMwgCo+Uu9XYo4iPJ+DjMv6yuEdcM206VZukQk6hNCEgVX
 vVBqqypkBH72JQapPAiRSrWeuvdK5IdX5oNM3pcTvpeIVdqZxmueL2c+UzA==
X-Gm-Gg: AZFdTZeIs3quUr2ASv1WY8/e1PXzZ/MILPMogoOmGB2Fa1DreM1FNbeWEi3BrCBdmVS
 qwoi2wM4Gql03CjiMAM7KDvKVKje7+/WC8wjduDtvfe6/J+SRBkSsl/76rRzuSVXfl20dTx1GoO
 7hjrvkTYEXFcmZNQ1ef++r0jG7ChkTAMvbmk7fVyFxi2eRU6U7eQzCepfvSDXdwXJlb4CBfO53n
 Ll99FDBeYoebEQUaoU6w+Y8RGZ/bimRoVYG1Py8G0PSBBQmLGMXS2NxnO+2E4O7T3h5AJxPiIkm
 eKZiEAzNbPDTGKI8QT3Pe8O0oVDPUkYbUhJqCywWUQsWF28PyzIScN9bVnRUwiOR4L5ZA7aZ8X4
 Lxkw9M9KeKJ+mEHECtqFocnngsJa9mO51FZOB2WvJAeL1bb5EXgUwyJCkz6djGyoQFODD3ooXT3
 wDNcfhc8fv
X-Received: by 2002:a05:6214:4108:b0:921:3730:b09b with SMTP id
 6a1803df08f44-9213730b141mr186544276d6.45.1795438913858; 
 Mon, 23 Nov 2026 05:01:53 -0800 (PST)
X-Received: by 2002:a05:6214:4108:b0:921:3730:b09b with SMTP id
 6a1803df08f44-9213730b141mr186543856d6.45.1795438913164; 
 Mon, 23 Nov 2026 05:01:53 -0800 (PST)
Received: from [192.168.68.101] ([189.110.107.17])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-92134a08552sm103563256d6.34.2026.11.23.05.01.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Nov 2026 05:01:52 -0800 (PST)
Message-ID: <92436cc6-3d05-4404-851c-4b13846cb7f7@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 10:01:49 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 04/10] hw/riscv/virt: add opt-in RPMI base support
To: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
References: <20261111060403.3777501-1-subrahmanya.lingappa@oss.qualcomm.com>
 <20261111060403.3777501-5-subrahmanya.lingappa@oss.qualcomm.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261111060403.3777501-5-subrahmanya.lingappa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gkqvTfrN0Lb5pS6eMi3W55Qni1Ft0mZ9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1MSBTYWx0ZWRfXxLOi7qV45pO4
 CIPaGcPIk9kUOwc1Wg9cBoyVeF+3HrpF0DPcZMtowdht9ticMkn3AXnnggAMEvrFCZItjt08ZCd
 LLU/jx851XbiTpXU6HIKgVubJd4rqS4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1MSBTYWx0ZWRfX1UYBN4aVz4tf
 FN5qveoWXU9+GCnwbfUFIguI9GnFVa0l6uX2fNs/CYVX8MSfnaOIzaY4uap1J/BfWQ3ZQZca8dx
 5Zi+2W8Hi0Wu00lzOIftailTYRZiwTu4v/wZx/9cENNDhhu705Awo1ggqzXUJh6eSx0V3QtXqvH
 D/nYCRnLBBPpfwtE10/OGbldOqi+nVJSThlmjjrCZmHXb1L4l6rgkgMqII6RpWal9E1d+/q5oJP
 qGFwEi7Y7E25VSy+4BWjsCDVzqogl3aFN99xF46teP1FEv0GA+r1T8IQ9CYvUpgVGvbEXUIH2VI
 z0L1mpdE7eDV/hDDZYBT2qkrfgnmUqg1+c/pQEN3qyTcIJ8qXev8FS21SGTIigTczeMlL42puIZ
 fm+XPXhBaweXP/EWs14le7PLhhkO1X2UPMpJZqc/ZRfi63iJgUbmgXXF9Q91xDT5V+5anM5Vza0
 YB6lU/a8wikK3cMAvBA==
X-Authority-Analysis: v=2.4 cv=Yr+a1IYX c=1 sm=1 tr=0 ts=6b043943 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=2Chh/y2wedAoPG2p3qwUfw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=QaC23mGSh3G_0Hz8NDYA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: gkqvTfrN0Lb5pS6eMi3W55Qni1Ft0mZ9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230051
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
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/11/2026 3:03 AM, Subrahmanya Lingappa wrote:
> Add the virt machine rpmi=on/off option and wire the initial RPMI
> Base transport into machine realization for firmware clients that use RPMI
> platform management.
> 
> The option remains disabled by default. Enabling it requires a
> librpmi-enabled TCG build; KVM and builds without librpmi reject the
> configuration. The RPMI mailbox node is emitted when enabled, while the
> legacy reset and poweroff nodes remain available until the later service
> patches select the RPMI reset path.
> 
> Size each A2P queue from one quarter of shared memory after
> reserving 8 KiB: 30 KiB per queue on virt.
> 
> Signed-off-by: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   hw/riscv/Kconfig        |  1 +
>   hw/riscv/virt.c         | 90 +++++++++++++++++++++++++++++++++++++++++
>   include/hw/riscv/virt.h |  3 ++
>   3 files changed, 94 insertions(+)
> 
> diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
> index d89fdfcc86..28d108faf8 100644
> --- a/hw/riscv/Kconfig
> +++ b/hw/riscv/Kconfig
> @@ -49,6 +49,7 @@ config RISCV_VIRT
>       imply VIRTIO_VGA
>       imply TEST_DEVICES
>       imply TPM_TIS_SYSBUS
> +    imply RISCV_RPMI
>       select DEVICE_TREE
>       select RISCV_NUMA
>       select GOLDFISH_RTC
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index de1c92463a..8a2ed43029 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -46,6 +46,8 @@
>   #include "hw/intc/riscv_aplic.h"
>   #include "hw/intc/sifive_plic.h"
>   #include "hw/misc/sifive_test.h"
> +#include "hw/misc/riscv_rpmi.h"
> +#include "hw/riscv/rpmi-fdt.h"
>   #include "hw/core/platform-bus.h"
>   #include "chardev/char.h"
>   #include "system/device_tree.h"
> @@ -107,6 +109,8 @@ static const MemMapEntry virt_memmap[] = {
>       /* UART1 supports page isolation from UART0 */
>       [VIRT_UART1] =        { 0x1000a000,         0x100 },
>       [VIRT_FW_CFG] =       { 0x10100000,          0x18 },
> +    [VIRT_RPMI_SHMEM] =   { 0x10200000,       0x20000 },
> +    [VIRT_RPMI_DOORBELL] = { 0x10230000,        0x1000 },
>       [VIRT_FLASH] =        { 0x20000000,     0x4000000 },
>       [VIRT_IMSIC_M] =      { 0x24000000, VIRT_IMSIC_MAX_SIZE },
>       [VIRT_IMSIC_S] =      { 0x28000000, VIRT_IMSIC_MAX_SIZE },
> @@ -115,6 +119,10 @@ static const MemMapEntry virt_memmap[] = {
>       [VIRT_DRAM] =         { 0x80000000,           0x0 },
>   };
>   
> +#define VIRT_RPMI_A2P_REQ_SIZE \
> +    ((virt_memmap[VIRT_RPMI_SHMEM].size - 0x2000) / 4)
> +#define VIRT_RPMI_P2A_REQ_SIZE 0
> +
>   /* PCIe high mmio is fixed for RV32 */
>   #define VIRT32_HIGH_PCIE_MMIO_BASE  0x300000000ULL
>   #define VIRT32_HIGH_PCIE_MMIO_SIZE  (4 * GiB)
> @@ -470,6 +478,35 @@ static void create_fdt_iommu(RISCVVirtState *s, uint16_t bdf)
>       s->pci_iommu_bdf = bdf;
>   }
>   
> +static RiscvRpmiConfig virt_rpmi_config(RISCVVirtState *s,
> +                                        const uint32_t *hart_ids,
> +                                        uint32_t hart_count)
> +{
> +    return (RiscvRpmiConfig) {
> +        .doorbell_base = s->memmap[VIRT_RPMI_DOORBELL].base,
> +        .shmem_base = s->memmap[VIRT_RPMI_SHMEM].base,
> +        .shmem_size = s->memmap[VIRT_RPMI_SHMEM].size,
> +        .a2p_req_size = VIRT_RPMI_A2P_REQ_SIZE,
> +        .p2a_req_size = VIRT_RPMI_P2A_REQ_SIZE,
> +        .platform_info = "QEMU RISC-V virt RPMI",
> +        .hart_ids = hart_ids,
> +        .hart_count = hart_count,
> +    };
> +}
> +
> +static void create_fdt_rpmi(RISCVVirtState *s, uint32_t *phandle)
> +{
> +    RiscvRpmiFdtMboxConfig cfg = {
> +        .shmem_base = s->memmap[VIRT_RPMI_SHMEM].base,
> +        .doorbell_base = s->memmap[VIRT_RPMI_DOORBELL].base,
> +        .a2p_req_size = VIRT_RPMI_A2P_REQ_SIZE,
> +        .p2a_req_size = VIRT_RPMI_P2A_REQ_SIZE,
> +        .doorbell_size = s->memmap[VIRT_RPMI_DOORBELL].size,
> +    };
> +
> +    riscv_rpmi_fdt_add_mbox(MACHINE(s)->fdt, &cfg, phandle, NULL);
> +}
> +
>   static void finalize_fdt(RISCVVirtState *s)
>   {
>       uint32_t phandle = 1, irq_mmio_phandle = 1, msi_pcie_phandle = 1;
> @@ -506,6 +543,9 @@ static void finalize_fdt(RISCVVirtState *s)
>                               s->memmap[VIRT_TEST].base,
>                               s->memmap[VIRT_TEST].size,
>                               FINISHER_RESET, FINISHER_PASS, true);
> +    if (s->have_rpmi) {
> +        create_fdt_rpmi(s, &phandle);
> +    }
>   
>       create_fdt_uarts(s, irq_mmio_phandle);
>   
> @@ -739,6 +779,18 @@ static void virt_machine_init(MachineState *machine)
>           exit(1);
>       }
>   
> +    if (s->have_rpmi) {
> +#ifndef CONFIG_LIBRPMI
> +        error_report("RISC-V RPMI support is not compiled in");
> +        exit(1);
> +#else
> +        if (kvm_enabled()) {
> +            error_report("RISC-V RPMI support is not available with KVM");
> +            exit(1);
> +        }
> +#endif
> +    }
> +
>       /* Initialize sockets */
>       mmio_irqchip = virtio_irqchip = pcie_irqchip = NULL;
>       for (i = 0; i < socket_count; i++) {
> @@ -897,6 +949,21 @@ static void virt_machine_init(MachineState *machine)
>       /* SiFive Test MMIO device */
>       sifive_test_create(s->memmap[VIRT_TEST].base);
>   
> +    if (s->have_rpmi) {
> +        MachineClass *mc = MACHINE_GET_CLASS(machine);
> +        const CPUArchIdList *possible_cpus = mc->possible_cpu_arch_ids(machine);
> +        g_autofree uint32_t *rpmi_hart_ids =
> +            g_new0(uint32_t, machine->smp.cpus);
> +        RiscvRpmiConfig rpmi_cfg;
> +
> +        for (i = 0; i < machine->smp.cpus; i++) {
> +            rpmi_hart_ids[i] = possible_cpus->cpus[i].arch_id;
> +        }
> +
> +        rpmi_cfg = virt_rpmi_config(s, rpmi_hart_ids, machine->smp.cpus);
> +        riscv_rpmi_create(&rpmi_cfg, &error_fatal);
> +    }
> +
>       /* VirtIO MMIO devices */
>       for (i = 0; i < VIRTIO_COUNT; i++) {
>           sysbus_create_simple("virtio-mmio",
> @@ -1050,6 +1117,20 @@ static void virt_set_aclint(Object *obj, bool value, Error **errp)
>       s->have_aclint = value;
>   }
>   
> +static bool virt_get_rpmi(Object *obj, Error **errp)
> +{
> +    RISCVVirtState *s = RISCV_VIRT_MACHINE(obj);
> +
> +    return s->have_rpmi;
> +}
> +
> +static void virt_set_rpmi(Object *obj, bool value, Error **errp)
> +{
> +    RISCVVirtState *s = RISCV_VIRT_MACHINE(obj);
> +
> +    s->have_rpmi = value;
> +}
> +
>   bool virt_is_iommu_sys_enabled(RISCVVirtState *s)
>   {
>       return s->iommu_sys == ON_OFF_AUTO_ON;
> @@ -1166,6 +1247,15 @@ static void virt_machine_class_init(ObjectClass *oc, const void *data)
>                                             "enable/disable emulating "
>                                             "ACLINT devices");
>   
> +
> +    object_class_property_add_bool(oc, "rpmi", virt_get_rpmi,
> +                                   virt_set_rpmi);
> +    object_class_property_set_description(oc, "rpmi",
> +                                          "Set on/off to enable/disable "
> +                                          "RISC-V RPMI devices; requires "
> +                                          "librpmi and is unavailable with "
> +                                          "KVM");
> +
>       object_class_property_add_str(oc, "aia", virt_get_aia,
>                                     virt_set_aia);
>       object_class_property_set_description(oc, "aia",
> diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> index 6e4fbf4b64..c9fb118fc8 100644
> --- a/include/hw/riscv/virt.h
> +++ b/include/hw/riscv/virt.h
> @@ -55,6 +55,7 @@ struct RISCVVirtState {
>   
>       int fdt_size;
>       bool have_aclint;
> +    bool have_rpmi;
>       RISCVVirtAIAType aia_type;
>       int aia_guests;
>       char *oem_id;
> @@ -82,6 +83,8 @@ enum {
>       VIRT_VIRTIO,
>       VIRT_UART1,
>       VIRT_FW_CFG,
> +    VIRT_RPMI_SHMEM,
> +    VIRT_RPMI_DOORBELL,
>       VIRT_IMSIC_M,
>       VIRT_IMSIC_S,
>       VIRT_FLASH,


