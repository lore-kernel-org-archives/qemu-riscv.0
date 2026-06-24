Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F915CDB47F
	for <qemu-riscv@archiver.kernel.org>; Wed, 24 Jun 2026 17:22:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wcRID-0001RY-Iq; Wed, 24 Jun 2026 13:21:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wcRIC-0001PW-3c
 for qemu-riscv@nongnu.org; Wed, 24 Jun 2026 13:21:40 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wcRI9-0008Rs-QV
 for qemu-riscv@nongnu.org; Wed, 24 Jun 2026 13:21:39 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65OFfJbw3301027
 for <qemu-riscv@nongnu.org>; Wed, 24 Jun 2026 17:21:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 z0A/4SjiYWXJjRjSBt/M4fA2Wa/xhI0L8g0aA+Jfe3s=; b=khfuI7kLkwbDgpQW
 w9myvXDTjI6wobwlJs83UDKdvPiEW9lecdR9qAqFSDsnZPeIwGjhXO5hWMV/VEV5
 qlnq99/Vudojh/7k2XllxoGs6XoiZh6tWHX1zbGeKibaWTiGnqKV/qY1LJ106qTt
 pwgbwgFWylWaatHSmJZXMPDtbsSQaDYn2HsxwEqe96ft6S+iT4JG+qbwqYSaSq1p
 eudreMFvzAqcH9q8KFC4HbvbeQs632/R8miqvEOhxyr70MX0SvuVM2gxzcGiailX
 pUWdEOK0/ICaIv4853Srg6jtqbODRorAmWhX9ZDnCxtCjNWZ6/LxFLMFnsEgOhYO
 13dbnQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f05aqbf2u-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 24 Jun 2026 17:21:35 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-30c1f6c5559so1266678eec.0
 for <qemu-riscv@nongnu.org>; Wed, 24 Jun 2026 10:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782321695; x=1782926495; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=z0A/4SjiYWXJjRjSBt/M4fA2Wa/xhI0L8g0aA+Jfe3s=;
 b=kam6gClJhA4dCyLFuwCLhY0yncHK2bzX8jUaFqY96owu7WOrdt79QNPEXhrpggXbli
 sTx+EPOr3QRaM2b0Zwu0UwkGYukzJ7ZqzFKrE+WmkgV6KPm9wnPuEWDHAUCx6BkR9J4n
 jI2dAqXCX7Y2IVbMWk+AgvBVamacVLR2LfJC6jwcdI6pO8x5QrIqVDhexa5e4yzhKLe1
 H5vhlX0UBvzxROAvSbVTGM6/MECTrSBC4hlJKT+cGNxphtfm7/t8nq0ElaMiQJ6gviOJ
 tG3Mf6odKCSUZiIRs/li5Hy5mO35x4Jy9V+1FWPfticwwfoFkoK7K/HCSkP7aS7JO2QE
 3EUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782321695; x=1782926495;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z0A/4SjiYWXJjRjSBt/M4fA2Wa/xhI0L8g0aA+Jfe3s=;
 b=cmK2N9AwwoJ/Gzbjpyx9lo3nQRb+q5jBIrAPmHDMF0ZBBDyVK5Gj63MQnUrZ3skNvF
 CtjJX0pmSJU4yLIZoMurVFKgOth5iuAcbWx5pFFDc1M74io+7WrbK7d2QdYdt8LCOKrL
 wQgKs+IlDjH+pYlJ0QjyHIcGIWXtfJafR13YvsIeGRayG4c3pLtASBYPuPoRjZCH1p3N
 Ku3JagoBtAqavJU8+UOIEaI+AxCsxVWMxh2g9/Kd2NrbmxENYGMB96yJuNNm5Lky55et
 /BB2hwvbKctVXJdxeyAkI8ihU/Zwn+XFYXOyoGzBLe32pF0sB2RbFPnncXqu2Q1+YTJ8
 Q7qA==
X-Gm-Message-State: AOJu0YzlYoPHuDJ9zhXzLUNmYfBBCtm1mutNBqTC3coss5PeGGa24L+3
 oaJh614X7VfLefIGCf2Bu+TmOLonKUQe2MD5rCSbBcEYpi7XBwtmbQFSk4tJRMZofSHgApVyl6D
 I2XZzsz7bwY0kgaLsyStijnjVVjxJGu1X0glvIwWfpu7IafStnONHjCAjow==
X-Gm-Gg: AfdE7ckBc29Jc9I9sEFMc7HaM8gCSqF9nJNs7v1hJuPdvU3s7RDEbh5UdaP60okNuNt
 8L1ATE5foowZR5PudjJraacYzc9KvLG2vUlzuxvCooJ79GAVTcKfX+85+s3rNCLEOu25T4QXsrf
 qJdLt8Ntw0hDiZNgyqORJMJfhy4ZovQOwhwAMRikakP+cG6XYLae+jrHOt3CFfr6eo+a9clLV1p
 9U+naK6O1AvpK71a1RejqCIrZOAqZRSWkgIHiygtejTfJb+jyjbZJIlOZDuHyaizC9lnKst80HF
 O+T9z5dUEF5K5rBdrnY7vDAhIXaDae0084vUNE7w+7ax5pc47QtH87cTDYSR1FWRv/4MqEFMbWV
 EFDz/JaRKHksuQ788fdaxbnankCvAkxBhYy0YrFTbQcH/
X-Received: by 2002:a05:7300:3256:b0:304:2cc9:2ba8 with SMTP id
 5a478bee46e88-30c68e47e84mr4060550eec.30.1782321695090; 
 Wed, 24 Jun 2026 10:21:35 -0700 (PDT)
X-Received: by 2002:a05:7300:3256:b0:304:2cc9:2ba8 with SMTP id
 5a478bee46e88-30c68e47e84mr4060497eec.30.1782321694308; 
 Wed, 24 Jun 2026 10:21:34 -0700 (PDT)
Received: from [192.168.68.103] ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30c7ca87caasm483524eec.27.2026.06.24.10.21.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2026 10:21:32 -0700 (PDT)
Message-ID: <79017627-4888-415a-9686-16367490b5b5@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 14:21:24 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] hw/riscv/virt, gpex: Provide 32-bit MMIO window for
 CXL host bridges
To: Chen Pei <cp0613@linux.alibaba.com>, jic23@kernel.org, pbonzini@redhat.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 sunilvl@ventanamicro.com, dave.jiang@intel.com,
 alison.schofield@intel.com, imammedo@redhat.com, mst@redhat.com,
 guoren@kernel.org
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, linux-cxl@vger.kernel.org
References: <20260618093827.3507-1-cp0613@linux.alibaba.com>
 <20260618093827.3507-4-cp0613@linux.alibaba.com>
Content-Language: en-US
In-Reply-To: <20260618093827.3507-4-cp0613@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE0NCBTYWx0ZWRfX56wGc+Dcc/27
 Z9YQPUlUY6Gu9EoZRy3N+HyoUeVQp9SWyualLo5d2hb02E70mptol4tD2rHP7LbBHriLnp11590
 cEUj5ehbmrJFbgxhtxUsYM7YoxW8rqA=
X-Proofpoint-GUID: NUWQwlN8UU4HtM9zm3_jrFOxGb58sqdh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE0NCBTYWx0ZWRfX2LSv00NnePZ0
 a30deFtf/YDTHXzkCp0xYXYHed69Q+OiMYN2nO2RZoQsWytCmrNXhxXwDv2pZgXFfVlZB/lTn+C
 RSFpuQXzhimmWNdFaZe+hjq+r8hp7hq+G2eVIma03CNBnu+j4sS+xpRsAcTtpOXrlWJ0Hs7wWwA
 EnX3FkH1Lz52tRZY54fj1/yeGdsUnlennR96XRfnvd1UxTzHXm2XD4KPPVU6ka1Hur931o0zRPe
 kcChVpuTdLxlBBZmpoxo3NnkrN2+wn1yNOq7WETRg1gIf5weomcXJseR3X7J0vMSo3YnD2LT9xz
 HwTVsV66zFsv1i8T5IpituQAFYMcw7CreVIbNs+S3vIWerHN6G8cKogLlnxor69k7C6A8e+9Bmd
 g4O9fHbuNYN1JtW9FndLs04tVjZHDA==
X-Authority-Analysis: v=2.4 cv=UphT8ewB c=1 sm=1 tr=0 ts=6a3c121f cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=SRrdq9N9AAAA:8 a=YeOTPVOvUyn0jVLZ81oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: NUWQwlN8UU4HtM9zm3_jrFOxGb58sqdh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240144
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
From:  Daniel Henrique Barboza via <qemu-riscv@nongnu.org>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org



On 6/18/2026 6:38 AM, Chen Pei wrote:
> CXL component register BAR (BAR0 on CXL Root Port and Type3 device)
> and the CXL device register BAR (BAR2 on Type3 device) are declared
> as 64-bit non-prefetchable memory.  Per the PCI-to-PCI Bridge
> Architecture Specification Rev 1.2 (PCI-SIG, 2003):
> 
>    - §3.2.5.8 (Memory Base/Limit): the non-prefetchable window covers
>      only 32-bit addresses (AD[31:20]); the Type 1 header defines no
>      upper-32-bit extension for it.
>    - §3.2.5.9 (Prefetchable Memory Base/Limit): the bottom 4 bits
>      encode 64-bit support (01h), but this applies exclusively to the
>      *prefetchable* window.
>    - §3.2.5.10 (Prefetchable Base/Limit Upper 32 Bits): optional
>      registers for AD[63:32] of the prefetchable range only.
> 
> The architecture therefore allows a 64-bit window only when it is also
> prefetchable; there is no 64-bit non-prefetchable form.  PCIe inherits
> this Type 1 header layout unchanged.  Linux thus places 64-bit
> non-prefetchable BARs in the 32-bit non-prefetchable bridge window,
> which requires the bridge to own enough address space below 4 GiB.
> 
> On RISC-V virt the 32-bit PCIe MMIO range (1 GiB at 0x40000000) is
> currently consumed entirely by PCI0, so CXL host bridges (ACPI0016)
> have no non-prefetchable window and Linux fails to assign these BARs.
> Marking the BARs prefetchable would work around it, but the CXL
> component registers have read/write side effects and are not
> prefetchable per the PCIe specification.
> 
> Reserve the top 256 MiB of the 32-bit MMIO window exclusively for
> CXL host bridges:
> - Shrink PCI0's mmio32 window by 256 MiB in virt.c so that UEFI's
>    PciHostBridgeDxe and the ACPI _CRS for PCI0 never claim that range
> - Store the reserved range in a new gpex_cfg.cxl_mmio32 field
> - In gpex-acpi.c, emit the cxl_mmio32 range as the Memory resource
>    in the CXL host bridge _CRS instead of re-using build_crs() (which
>    returns an empty set when UEFI has not assigned resources yet)
> - Reduce the FDT 'ranges' for PCI0 by the same 256 MiB so that UEFI
>    firmware driven by device-tree also respects the reservation
> 
> Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
> ---
>   hw/pci-host/gpex-acpi.c    | 36 +++++++++++++++++++++--
>   hw/riscv/virt.c            | 58 +++++++++++++++++++++++++++++++-------
>   include/hw/pci-host/gpex.h |  1 +
>   3 files changed, 83 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
> index d9820f9b41..d8b943b665 100644
> --- a/hw/pci-host/gpex-acpi.c
> +++ b/hw/pci-host/gpex-acpi.c
> @@ -158,9 +158,41 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
>                * Resources defined for PXBs are composed of the following parts:
>                * 1. The resources the pci-bridge/pcie-root-port need.
>                * 2. The resources the devices behind pxb need.
> +             *
> +             * For CXL host bridges on platforms where UEFI (driven by
> +             * FDT 'ranges') does not assign PCI resources for the CXL
> +             * root bridge before ACPI table construction, build_crs()
> +             * would return an empty resource set.  When the platform
> +             * has reserved a dedicated MMIO window for CXL host bridges
> +             * (cfg->cxl_mmio32), emit that window as a static _CRS
> +             * instead.  The platform is responsible for shrinking PCI0's
> +             * mmio32 window so the two do not overlap.
>                */
> -            crs = build_crs(PCI_HOST_BRIDGE(BUS(bus)->parent), &crs_range_set,
> -                            cfg->pio.base, 0, 0, 0);
> +            if (is_cxl && cfg->cxl_mmio32.size) {
> +                uint64_t cxl_base = cfg->cxl_mmio32.base;
> +                uint64_t cxl_size = cfg->cxl_mmio32.size;
> +
> +                crs = aml_resource_template();
> +
> +                /* 32-bit MMIO range for CXL devices */
> +                aml_append(crs,
> +                    aml_dword_memory(AML_POS_DECODE, AML_MIN_FIXED,
> +                                     AML_MAX_FIXED, AML_NON_CACHEABLE,
> +                                     AML_READ_WRITE, 0,
> +                                     cxl_base,
> +                                     cxl_base + cxl_size - 1,
> +                                     0, cxl_size));
> +
> +                /* Bus number range */
> +                aml_append(crs,
> +                    aml_word_bus_number(AML_MIN_FIXED, AML_MAX_FIXED,
> +                                       AML_POS_DECODE, 0,
> +                                       bus_num, bus_num + 15,
> +                                       0, 16));
> +            } else {
> +                crs = build_crs(PCI_HOST_BRIDGE(BUS(bus)->parent),
> +                                &crs_range_set, cfg->pio.base, 0, 0, 0);
> +            }
>               aml_append(dev, aml_name_decl("_CRS", crs));
>   
>               if (is_cxl) {
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 84b91b4322..9c1a001553 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -113,6 +113,9 @@ static const MemMapEntry virt_memmap[] = {
>   /* PCIe high mmio for RV64, size is fixed but base depends on top of RAM */
>   #define VIRT64_HIGH_PCIE_MMIO_SIZE  (16 * GiB)
>   
> +/* 32-bit MMIO range carved out of VIRT_PCIE_MMIO for CXL host bridges */
> +#define VIRT_CXL_MMIO32_SIZE        (256 * MiB)
> +
>   static MemMapEntry virt_high_pcie_memmap;
>   
>   #define VIRT_FLASH_SECTOR_SIZE (256 * KiB)
> @@ -890,15 +893,28 @@ static void create_fdt_pcie(RISCVVirtState *s,
>       }
>       qemu_fdt_setprop_sized_cells(ms->fdt, name, "reg", 2,
>           s->memmap[VIRT_PCIE_ECAM].base, 2, s->memmap[VIRT_PCIE_ECAM].size);
> -    qemu_fdt_setprop_sized_cells(ms->fdt, name, "ranges",
> -        1, FDT_PCI_RANGE_IOPORT, 2, 0,
> -        2, s->memmap[VIRT_PCIE_PIO].base, 2, s->memmap[VIRT_PCIE_PIO].size,
> -        1, FDT_PCI_RANGE_MMIO,
> -        2, s->memmap[VIRT_PCIE_MMIO].base,
> -        2, s->memmap[VIRT_PCIE_MMIO].base, 2, s->memmap[VIRT_PCIE_MMIO].size,
> -        1, FDT_PCI_RANGE_MMIO_64BIT,
> -        2, virt_high_pcie_memmap.base,
> -        2, virt_high_pcie_memmap.base, 2, virt_high_pcie_memmap.size);
> +    {
> +        /*
> +         * When CXL is enabled, reserve the last 256 MiB of the 32-bit
> +         * MMIO window for CXL host bridges and exclude it from the main
> +         * PCIe host bridge's FDT 'ranges' so UEFI's PciHostBridgeDxe
> +         * does not allocate that range to PCI0.  The CXL host bridge
> +         * _CRS declares this range independently.
> +         */
> +        hwaddr mmio32_size = s->memmap[VIRT_PCIE_MMIO].size;
> +        if (s->cxl_devices_state.is_enabled) {
> +            mmio32_size -= VIRT_CXL_MMIO32_SIZE;
> +        }
> +        qemu_fdt_setprop_sized_cells(ms->fdt, name, "ranges",
> +            1, FDT_PCI_RANGE_IOPORT, 2, 0,
> +            2, s->memmap[VIRT_PCIE_PIO].base, 2, s->memmap[VIRT_PCIE_PIO].size,
> +            1, FDT_PCI_RANGE_MMIO,
> +            2, s->memmap[VIRT_PCIE_MMIO].base,
> +            2, s->memmap[VIRT_PCIE_MMIO].base, 2, mmio32_size,
> +            1, FDT_PCI_RANGE_MMIO_64BIT,
> +            2, virt_high_pcie_memmap.base,
> +            2, virt_high_pcie_memmap.base, 2, virt_high_pcie_memmap.size);
> +    }

We can get rid of the braces - it's just adding an extra identation level while
not doing anything special.  'mmio32_size' can be declared at the start
of create_fdt_pcie().

Thanks,
Daniel

>   
>       if (virt_is_iommu_sys_enabled(s)) {
>           qemu_fdt_setprop_cells(ms->fdt, name, "iommu-map",
> @@ -1728,7 +1744,29 @@ static void virt_machine_init(MachineState *machine)
>               qdev_get_gpio_in(virtio_irqchip, VIRTIO_IRQ + i));
>       }
>   
> -    gpex_pcie_init(system_memory, pcie_irqchip, s);
> +    DeviceState *pcie_dev = gpex_pcie_init(system_memory, pcie_irqchip, s);
> +
> +    /*
> +     * If CXL is enabled, reserve the last 256 MiB of the 32-bit MMIO
> +     * window for CXL host bridges so the bridge non-prefetchable window
> +     * can hold CXL device BARs (component registers and similar 64-bit
> +     * non-prefetchable BARs that need a < 4 GiB address).
> +     *
> +     * - Shrink PCI0's mmio32 advertised in the ACPI _CRS by the same
> +     *   256 MiB so the two ranges do not overlap (the FDT 'ranges'
> +     *   shrink happens in create_fdt_pcie()).
> +     * - Store the reserved range in cxl_mmio32 so gpex-acpi.c can emit
> +     *   a correct _CRS for the CXL host bridge (ACPI0016).
> +     */
> +    if (s->cxl_devices_state.is_enabled) {
> +        GPEXHost *gpex = GPEX_HOST(pcie_dev);
> +        gpex->gpex_cfg.cxl_mmio32.size = VIRT_CXL_MMIO32_SIZE;
> +        gpex->gpex_cfg.cxl_mmio32.base =
> +            s->memmap[VIRT_PCIE_MMIO].base +
> +            s->memmap[VIRT_PCIE_MMIO].size - VIRT_CXL_MMIO32_SIZE;
> +        /* Shrink PCI0's advertised 32-bit MMIO window to exclude CXL range */
> +        gpex->gpex_cfg.mmio32.size -= VIRT_CXL_MMIO32_SIZE;
> +    }
>   
>       create_platform_bus(s, mmio_irqchip);
>   
> diff --git a/include/hw/pci-host/gpex.h b/include/hw/pci-host/gpex.h
> index 1da9c85bce..d38fbbacd6 100644
> --- a/include/hw/pci-host/gpex.h
> +++ b/include/hw/pci-host/gpex.h
> @@ -43,6 +43,7 @@ struct GPEXConfig {
>       MemMapEntry mmio32;
>       MemMapEntry mmio64;
>       MemMapEntry pio;
> +    MemMapEntry cxl_mmio32;
>       int         irq;
>       PCIBus      *bus;
>       bool        pci_native_hotplug;


