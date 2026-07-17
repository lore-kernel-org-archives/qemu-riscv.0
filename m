Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC2D0C4451C
	for <qemu-riscv@archiver.kernel.org>; Fri, 17 Jul 2026 13:18:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wkiRh-0004Hc-0B; Fri, 17 Jul 2026 09:17:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wkiRa-0004Gq-6v
 for qemu-riscv@nongnu.org; Fri, 17 Jul 2026 09:17:35 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wkiRU-0006JM-AT
 for qemu-riscv@nongnu.org; Fri, 17 Jul 2026 09:17:32 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66HCSt6m1900968
 for <qemu-riscv@nongnu.org>; Fri, 17 Jul 2026 13:17:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kSkS0+qZWTXHgUFz7QQP3dATc/Fu6b/kpaKEmDO8oCg=; b=TxmErcjOmZ5HHSIA
 4KvQOW8SxpCPSkG1qOrI71VVr2XdCy+oj9n1C3QrmG0R7XqRxuHWf7SXB+pfjh45
 HQ2qFo6aYR1yYqWR6BypbV4WBp1Xqh6TWcHsv9hF8bttnfxF7KXbi8dcEJ6KDSFz
 EHRVy3hRoZsMzfYAjSEHGzUQstIwBQSCHmrti7y1uG9hL4TwZ5dWqDRAc2RAenVL
 i69/0SKuB0+DZcyVtUXuDyCcfq2HywC9D0E9ghG6yMfD2YWhsGRnhg8LCxmoo/X4
 FCiz1nbVcRYzANyllxtEMFnr47Z3vnT0CBdGPzUxOgoU67M4SL3iScyf6uFxg2WU
 wtWSDw==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffe0usthk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 17 Jul 2026 13:17:26 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-8099ed7adc6so146710027b3.3
 for <qemu-riscv@nongnu.org>; Fri, 17 Jul 2026 06:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784294246; x=1784899046; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=kSkS0+qZWTXHgUFz7QQP3dATc/Fu6b/kpaKEmDO8oCg=;
 b=P6P+Ex7Vg9aHyDTOt3Xfla/zqMLvwGrOyAWmgYke9LWM8EqG5KxhrwpOXVcrjZwpvb
 XrVh4H4AZUrA5lAhrvM43w/d/PdYv0vzB4u6vegxfKjNWP1K663CHZR5raJGxxJom3So
 MoUiT3p4XMRvduxNKUVJJCvREEJW/c3XBSzoBaezZqQu/GFStZJI6k9rab0dEn2Y+eXc
 yhwU0OVE0L07RxL7OzhU6+NhwKEjgLtByb9VFMyRQBW8DmyKxhImLAqv3YA6xQ+BX71V
 3K6H4ZzFE8OJVdLBjMpHoFJ2Y4A67yR8qcRZA6Ax/hBAvKmKf1Z0xTNVFH+dQn7I9kOj
 U8nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784294246; x=1784899046;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=kSkS0+qZWTXHgUFz7QQP3dATc/Fu6b/kpaKEmDO8oCg=;
 b=HHgkIRT4tqyKZNQK88neMC/v3DR4IDG5W6efyRi3y/Su726Qz1QyM9xb9Mmbr4z7ik
 FrklFJ41uelIl3EfPCX0xsF5C66eJrztw3MbiBpeoen3aY1QXJW6FTyb9dclNcwwYPo+
 w75z7cilC7B59EZoEEvBG+xlQoqeVcfjNJ7Q35sBYBi/s9IuQtB/qQj6coQYH97dIMXJ
 jrj7WgApNAqVoGWpJt8xYzYjmp3OByWBWew8/3JkteXqxtPkVRfr6SBXv2nVBneuYhCn
 dKNXUGAMOLi8ln23jbclV3MuKdAz1Ued2zX7PJni8dPkNuba92bjnN0nT8nRs6sDF5ye
 vUmQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqrP7Kn3BezLIm6JbT2iXgBU9k0czld/wKsRDAGIRYK8DQ6mPgDRHTNwlYB1BqaiHoRnDrsAb4ULawI@nongnu.org
X-Gm-Message-State: AOJu0Yyp0Eal/iTB9DkxNjy9Yj7naiYGhGh5uszw39k8o22BkYWB3bUD
 fr5V1n8hsyNz5Az7ZpgTQM38FAnPEyCimgd+4asWVmg/F97vWReF+LnE04DlVkqF/nqCYSrhI1x
 meXgTHLIJZ7kadme6gmkrre3bmXbhl7FoG8anQtAjBalfsPebG3eVG9DT6g==
X-Gm-Gg: AfdE7cnFrVFiRJrf6SnpZ27ksq9lwPW3J3/IbeD7Atv+jfRZYasAELBoR5qpW5jKENa
 vfTbFelTjnJqgfnmyVqO+AGmCaXjOfUBBLVs5bbUVYdz4KyAhOEGmuAzMG3BEyjpHWJiT0YCEtF
 BT6nRHkyg0knnvZfDSteL4XC7uvpOv+vZ3/i49imM+FOFrzzBZ/EnUI27vi8e6CsF+BxM6Cx/re
 z73Xm/ybn+XVbMGZAoR1fy2R5tBUrxijTpFv/zocHhN/Pc8KizUni1YacHOoTsFf/XBOXeJzxAD
 nCpLTOTtJxTLsrgbeaBt780xXEEVeZAAz2UXEbWNm1zGV9/jkBvljC0sgTTYAjn6YTcvYZPHdOp
 ulkBdMbEfB6Y/gXBX2HFYryYoB+xa9hKvX/yQMg==
X-Received: by 2002:a05:690c:c4cc:b0:80d:964f:88fd with SMTP id
 00721157ae682-81ef22f14d6mr7812697b3.5.1784294246183; 
 Fri, 17 Jul 2026 06:17:26 -0700 (PDT)
X-Received: by 2002:a05:690c:c4cc:b0:80d:964f:88fd with SMTP id
 00721157ae682-81ef22f14d6mr7812527b3.5.1784294245685; 
 Fri, 17 Jul 2026 06:17:25 -0700 (PDT)
Received: from [192.168.68.105] ([152.234.122.204])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-81ef42f0c31sm8747077b3.48.2026.07.17.06.17.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jul 2026 06:17:24 -0700 (PDT)
Message-ID: <f767ff53-911c-4f9b-923c-09d09f0e107a@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 10:17:20 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/10] hw/riscv/virt: add opt-in RPMI base support
To: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>,
 qemu-riscv@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20260714075659.2258023-1-subrahmanya.lingappa@oss.qualcomm.com>
 <20260714075659.2258023-5-subrahmanya.lingappa@oss.qualcomm.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260714075659.2258023-5-subrahmanya.lingappa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=deWwG3Xe c=1 sm=1 tr=0 ts=6a5a2b66 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=J0RmenBMOwS19r/fhzI3tQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=ln53PORrXrLVmdJtCB8A:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDEzNCBTYWx0ZWRfX4OLqzn/sy3Jr
 GO2C5h6aM4JUcIkrb7Y5c8JHPwbl4Nk+UAA5bSwSwlRkp8l9IoMTmFJPFGFFcQnVxSP6tX/gAQl
 2V+EULQme3SUF6uJk/Kbj5FbJD5Y2it2Y+pX9NcysPs5YqVmvefN627UTNtA04pXFpAQcRnjKkD
 LEXpaSVfkNYe7jb3kJL+q9Y1jpvQaiSLTxDU/jfSeLwfchcul72FUvSC+PlH8bnpDZ1VqxVAFqh
 wHHH3ySTT0HsfAbU9Yhap/3gcmePuzh+nvS+NxZGZcjIK/VRJIh1DlopeoTwpwUnROU+F6q+ofc
 WiotlPZ4TnZJvCYHcn3meqGUfHAILlvfcPB61p+IaMdHQCtl/0VQcjQSd0J4aFmSFkJWs+oVjJe
 IZfCvmBPGV2vydw7/Qe/7w44rvvKjonoy7WNE10aeiUwFIBFYXNUlULc1+BZFo0EQdqIHZQq+dB
 Cd0dL6HZ/pHRWTwbsMA==
X-Proofpoint-ORIG-GUID: 5jCa2OoLMszKhSI_6Drmu509xhc4JAYt
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDEzNCBTYWx0ZWRfX/7s1WIpkOv4A
 +vqEjQ+pQ2L3JJVT24GqM7kyGdtIIaf1AhVFk+hEmHL1YPthfFUBhkCLjVWTj/+DmUdtx/l8B07
 ZJU+juTvWQtPsBWv3D0VibmdPvi6/ew=
X-Proofpoint-GUID: 5jCa2OoLMszKhSI_6Drmu509xhc4JAYt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170134
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org



On 7/14/2026 4:56 AM, Subrahmanya Lingappa wrote:
> Add the virt machine rpmi=on/off option and wire the initial RPMI Base
> transport into machine realization.
> 
> The option remains disabled by default and requires TCG plus librpmi.
> Invalid accelerator/build combinations fail during machine
> initialization. When enabled, virt allocates the RPMI shared-memory
> transport, creates the RPMI device, configures Base service metadata,
> and emits the corresponding device-tree nodes for firmware discovery.
> 
> Signed-off-by: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
> ---
>   hw/riscv/Kconfig             |  1 +
>   hw/riscv/virt.c              | 96 ++++++++++++++++++++++++++++++++++++
>   include/hw/misc/riscv_rpmi.h | 10 ++++
>   include/hw/riscv/virt.h      |  3 ++
>   4 files changed, 110 insertions(+)
> 
> diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
> index 54e41a6afc..4e25be113a 100644
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
> index 33775a61fd..e52ccfae1f 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -45,6 +45,8 @@
>   #include "hw/intc/riscv_aplic.h"
>   #include "hw/intc/sifive_plic.h"
>   #include "hw/misc/sifive_test.h"
> +#include "hw/misc/riscv_rpmi.h"
> +#include "hw/riscv/rpmi-fdt.h"
>   #include "hw/core/platform-bus.h"
>   #include "chardev/char.h"
>   #include "system/device_tree.h"
> @@ -97,6 +99,8 @@ static const MemMapEntry virt_memmap[] = {
>       [VIRT_UART0] =        { 0x10000000,         0x100 },
>       [VIRT_VIRTIO] =       { 0x10001000,        0x1000 },
>       [VIRT_FW_CFG] =       { 0x10100000,          0x18 },
> +    [VIRT_RPMI_SHMEM] =   { 0x10200000,       0x20000 },
> +    [VIRT_RPMI_DOORBELL] = { 0x10230000,        0x1000 },
>       [VIRT_FLASH] =        { 0x20000000,     0x4000000 },
>       [VIRT_IMSIC_M] =      { 0x24000000, VIRT_IMSIC_MAX_SIZE },
>       [VIRT_IMSIC_S] =      { 0x28000000, VIRT_IMSIC_MAX_SIZE },
> @@ -1002,6 +1006,40 @@ static void create_fdt_iommu(RISCVVirtState *s, uint16_t bdf)
>       s->pci_iommu_bdf = bdf;
>   }
>   
> +
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
> +static void create_fdt_rpmi(RISCVVirtState *s, uint32_t *phandle,
> +                            uint32_t msi_phandle)
> +{
> +    RiscvRpmiConfig rpmi_cfg = virt_rpmi_config(s, NULL, 0);
> +    uint32_t rpmi_mbox_handle;
> +    RiscvRpmiFdtMboxConfig cfg = {
> +        .shmem_base = rpmi_cfg.shmem_base,
> +        .doorbell_base = rpmi_cfg.doorbell_base,
> +        .a2p_req_size = rpmi_cfg.a2p_req_size,
> +        .p2a_req_size = rpmi_cfg.p2a_req_size,
> +        .doorbell_size = s->memmap[VIRT_RPMI_DOORBELL].size,
> +    };
> +
> +    riscv_rpmi_fdt_add_mbox(MACHINE(s)->fdt, &cfg, phandle,
> +                            &rpmi_mbox_handle);
> +}
> +
>   static void finalize_fdt(RISCVVirtState *s)
>   {
>       uint32_t phandle = 1, irq_mmio_phandle = 1, msi_pcie_phandle = 1;
> @@ -1021,6 +1059,10 @@ static void finalize_fdt(RISCVVirtState *s)
>       create_fdt_pcie(s, irq_pcie_phandle, msi_pcie_phandle,
>                       iommu_sys_phandle);
>   
> +    if (s->have_rpmi) {
> +        create_fdt_rpmi(s, &phandle, msi_pcie_phandle);
> +    }
> +
>       create_fdt_reset(s, &phandle);
>   
>       create_fdt_uart(s, irq_mmio_phandle);
> @@ -1410,6 +1452,18 @@ static void virt_machine_init(MachineState *machine)
>           exit(1);
>       }
>   
> +
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
>       /* Initialize sockets */
>       mmio_irqchip = virtio_irqchip = pcie_irqchip = NULL;
>       for (i = 0; i < socket_count; i++) {
> @@ -1552,6 +1606,25 @@ static void virt_machine_init(MachineState *machine)
>       /* SiFive Test MMIO device */
>       sifive_test_create(s->memmap[VIRT_TEST].base);
>   
> +    if (s->have_rpmi) {
> +        MachineClass *mc = MACHINE_GET_CLASS(machine);
> +        const CPUArchIdList *possible_cpus = mc->possible_cpu_arch_ids(machine);
> +        g_autofree uint32_t *rpmi_hart_ids =
> +            g_new0(uint32_t, machine->smp.cpus);
> +        RiscvRpmiConfig rpmi_cfg;
> +        Error *local_err = NULL;
> +
> +        for (i = 0; i < machine->smp.cpus; i++) {
> +            rpmi_hart_ids[i] = possible_cpus->cpus[i].arch_id;
> +        }
> +
> +        rpmi_cfg = virt_rpmi_config(s, rpmi_hart_ids, machine->smp.cpus);
> +        if (!riscv_rpmi_create(&rpmi_cfg, &local_err)) {
> +            error_report_err(local_err);
> +            exit(1);
> +        }
> +    }
> +
>       /* VirtIO MMIO devices */
>       for (i = 0; i < VIRTIO_COUNT; i++) {
>           sysbus_create_simple("virtio-mmio",
> @@ -1636,6 +1709,7 @@ static void virt_machine_instance_init(Object *obj)
>   
>       s->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
>       s->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
> +    s->have_rpmi = false;
>       s->acpi = ON_OFF_AUTO_AUTO;
>       s->iommu_sys = ON_OFF_AUTO_AUTO;
>   }
> @@ -1710,6 +1784,21 @@ static void virt_set_aclint(Object *obj, bool value, Error **errp)
>       s->have_aclint = value;
>   }
>   
> +
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
> @@ -1831,6 +1920,13 @@ static void virt_machine_class_init(ObjectClass *oc, const void *data)
>                                             "enable/disable emulating "
>                                             "ACLINT devices");
>   
> +
> +    object_class_property_add_bool(oc, "rpmi", virt_get_rpmi,
> +                                   virt_set_rpmi);
> +    object_class_property_set_description(oc, "rpmi",
> +                                          "Set on/off to enable/disable "
> +                                          "RISC-V RPMI devices");
> +
>       object_class_property_add_str(oc, "aia", virt_get_aia,
>                                     virt_set_aia);
>       object_class_property_set_description(oc, "aia",
> diff --git a/include/hw/misc/riscv_rpmi.h b/include/hw/misc/riscv_rpmi.h
> index cb2658e57e..b5d8a32f9b 100644
> --- a/include/hw/misc/riscv_rpmi.h
> +++ b/include/hw/misc/riscv_rpmi.h
> @@ -85,6 +85,16 @@ struct RiscvRpmiState {
>       bool has_shmem;
>   };
>   
> +#ifdef CONFIG_LIBRPMI
>   DeviceState *riscv_rpmi_create(const RiscvRpmiConfig *cfg, Error **errp);
> +#else
> +static inline DeviceState *riscv_rpmi_create(const RiscvRpmiConfig *cfg,
> +                                             Error **errp)
> +{
> +    (void)cfg;
> +    (void)errp;
> +    return NULL;
> +}

I think you can do:

static inline DeviceState *riscv_rpmi_create(const RiscvRpmiConfig *cfg G_GNUC_UNUSED,
                                              Error **errp G_GNUC_UNUSED)
{
     return NULL;
}

Instead of using the args as void to not get warnings.


Everything else LGTM.  Thanks,
Daniel


> +#endif
>   
>   #endif
> diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> index 18a2a323a3..f7c48613bf 100644
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
> @@ -79,6 +80,8 @@ enum {
>       VIRT_UART0,
>       VIRT_VIRTIO,
>       VIRT_FW_CFG,
> +    VIRT_RPMI_SHMEM,
> +    VIRT_RPMI_DOORBELL,
>       VIRT_IMSIC_M,
>       VIRT_IMSIC_S,
>       VIRT_FLASH,


