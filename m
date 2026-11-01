Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9379606A324
	for <qemu-riscv@archiver.kernel.org>; Sun,  1 Nov 2026 09:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e36N8xfE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HjvPPV+h
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xNRuv-0001IB-60; Sun, 01 Nov 2026 04:31:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xNRuj-0001Bk-5a
 for qemu-riscv@nongnu.org; Sun, 01 Nov 2026 04:31:46 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xNRug-0005ck-W6
 for qemu-riscv@nongnu.org; Sun, 01 Nov 2026 04:31:44 -0500
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A18KcQt1321344
 for <qemu-riscv@nongnu.org>; Sun, 1 Nov 2026 09:31:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 k+OI2r0QnlmiqpCj7p8JkPjMy+HTw2hRCcXztFIShNo=; b=e36N8xfE/GHBMTnb
 pfoPJgOlrUWiCI3WfPYF26KVW+aHCKldcK56dU1guZdGNZaH4F+bM4mYSciD2UVi
 JNWaKV3VARNG6GNn2XxWhEtx2sgXl1HUd6c0peKFMtEKtVTBuEVJRoNDkFxhtaBz
 WLC+pBUob3/n4SGis/vhqulfUjPEMFXa2M/Q5JjYPgS6ydPFxEBhh0PXpdWqXBBI
 fN093vVjAQlV5yyFxdOoG/sSok5Ec5HACBy6JaCBhiNn9l2YShvh6XEwWYYsCQM0
 +ERZfHbCmyhFNPKAk0g+2C4KhGR8kB3AVdBfK0viIr2yErVCm6+h9qDN2ukbnr/P
 1Y0Lbw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn61fucen-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Sun, 01 Nov 2026 09:31:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93cb71b1443so429320985a.2
 for <qemu-riscv@nongnu.org>; Sun, 01 Nov 2026 01:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793525498; x=1794130298; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=k+OI2r0QnlmiqpCj7p8JkPjMy+HTw2hRCcXztFIShNo=;
 b=HjvPPV+hFsVn2bhIhMxDZ41dR6aeVAx3WOwoNUDHbNxT05wo0g40aKs5N/2RmjRnKc
 aNHm3hHbYFsm/BzKCnqBRhRUrStiHaBBLZIKRwNi73fBROrTMft5ZGSL12fvG7FcCo8K
 aDkMQHOPnaG6OPPsnMnbdTDdIpFk2GPmlvA8LpjWgjOmW1xFVqewFjW73rFfEH7tVrPE
 YlkwxVqMkIPbiAgzhSzp/7sBGSlWvgw0c5GRgUafqciwhwcvLH8al/ifrjyqT6S6OGmB
 n38bQQHucE/qaw9k7OuYr6F59ijacJh49GVo8RVCD3vwuGqMbbfwo86Px3QU8mJwbHNi
 Mpnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793525498; x=1794130298;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=k+OI2r0QnlmiqpCj7p8JkPjMy+HTw2hRCcXztFIShNo=;
 b=cwI9FZE+9/e5Mes//l8ySEaNP+JFAbe1cBggq6S3chJud1WxYgL33n/MBDfOTyUd6g
 NapdORBBpNOAjl0zUZd19d2HMWq15QLFSQF/lalwP+G10cQzXQkzRaHV3dcD4rYUJJu7
 OWNXxFr/2+rKV1Q9aelZuElBgwfC6F/3zBy6BmZ53BND5sjEmO42V3+E86ESIp4PzKOt
 M2skeb8Q7FVFFQFtDbIjRDx62UWReJcvsgBomIrGliYmoJ657VDzrhpb4J3c3LAIXD6h
 GxzGtl6ujJ7q1SDMmkUSG+VvvqaZu59sk3Yntfl4k0tr5OObKG1NMj1ZFXkYTB9Kpy9g
 wBJg==
X-Forwarded-Encrypted: i=1;
 AKwUvByhp9cUG/OFQndQB/XKyQQRf1xt99AobmQwoFjt/QI17FH4T2AoW3fK0Z/LdK1sMxBmHEjVCYShLZ/s@nongnu.org
X-Gm-Message-State: AFq9FYJqr+8zOf8Xv3dbnUW7UEQbj9BTje6FBXwVgp1FFLfpwJsiHAvL
 0btHemZfwz3YQtL1KOVLX5TtIm4/E5E5tFILunM/pWVe2CExAc05lW9BvVnyHaWMmM4t3FyZDvt
 pLMVpyXSN4zWfNV6qQqmk633Sqy+Aj08g9cchz4Ve7HJOWGek9bFqvShfgg==
X-Gm-Gg: AYBFou0ommFz7ymYcw9Ike6KEIM+0KaQGWbmUmU5AKR3XCmKTSR/HepUV4t8LSuNa3Y
 kl3TcQpApdpoqTvPLKZN8fXVMsrcEKsgxy3vaNRM4YSegRTUkGeWpNcPEXQCIcQu6oxMBvJ2jce
 3eHTqePQZKJvs5BiJcoUjyHJGHgIpnO2trPSw02wZmkWSNT2IakAP1W2Gf44wVrXyZ3EYJ7yW4p
 5BXlaCR9nV0oz6axfaMKobiPL3v2eAi9zc6ckSV1+m2K90LuXtEUJsA7knvlx9Lwd5V2Eos6YHD
 LxkUzG+jAP1js2bMh8dK6X7zXK2wNMDHdDp7KRYf7dPR/R9krzagKgJTFTGoqvR6tZsy4dm0xCS
 CrJamWoe7c0/kwvSweH+zMVR7BfnxQbQWV8IcugOQYwN4bLT39y94l7LjpCJjdCZsVSADcLLyI+
 Hl1+nZJi43
X-Received: by 2002:a05:620a:2610:b0:93f:19c2:da4 with SMTP id
 af79cd13be357-9442184e69dmr971640585a.70.1793525498337; 
 Sun, 01 Nov 2026 01:31:38 -0800 (PST)
X-Received: by 2002:a05:620a:2610:b0:93f:19c2:da4 with SMTP id
 af79cd13be357-9442184e69dmr971637785a.70.1793525497660; 
 Sun, 01 Nov 2026 01:31:37 -0800 (PST)
Received: from [192.168.68.102] ([152.234.122.251])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-944252e516dsm563502985a.4.2026.11.01.01.31.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Nov 2026 01:31:37 -0800 (PST)
Message-ID: <7abfa611-06ec-439d-b127-bdb62ff025d5@oss.qualcomm.com>
Date: Sun, 1 Nov 2026 06:31:33 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/27] hw/riscv: pfsoc: Map the SiFive L2CC memory
 windows
To: Bin Meng <bin.meng@processmission.com>, QEMU <qemu-devel@nongnu.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Chao Liu <chao.liu@processmission.com>, Conor Dooley <conor@kernel.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Sebastian Huber <sebastian.huber@embedded-brains.de>,
 Weiwei Li <liwei1518@gmail.com>, qemu-riscv@nongnu.org
References: <20261014012323.322790-1-bin.meng@processmission.com>
 <20261014012323.322790-6-bin.meng@processmission.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261014012323.322790-6-bin.meng@processmission.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDAzNyBTYWx0ZWRfXxFyeIPAUP2SJ
 vIcbRu4Gee9i5ANJvKEjn53thUnmPIVpq504xRVrGDYO1dMvxbrfzsI+QblQ0g2FEwh12mULd2H
 7Qq+vm8S9yzJ7s5TixzIZ4yQuC7KhJY=
X-Authority-Analysis: v=2.4 cv=V/LoQuni c=1 sm=1 tr=0 ts=6ae706fb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=QOY8BskYDu05dfarAz2gNQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=FRSEYCzRAAAA:8 a=XYAwZIGsAAAA:8 a=EUspDBNiAAAA:8 a=q3K8DOYYDC0vxjoJZ6QA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=H4N_Y-AU75W7NKDNhZlT:22
 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-GUID: ynUqASGwnsK2qSPY74_wYTZZSgD6XvzX
X-Proofpoint-ORIG-GUID: ynUqASGwnsK2qSPY74_wYTZZSgD6XvzX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDAzNyBTYWx0ZWRfX+fs5GvcZHoyY
 HKKs2aZL7ZPHcSSqmhbdOKjMM0s5meCQaLWK9Zf6Q9LITIVIr4tqGpkaBAjqSre+PfATvsQX6WX
 kmybUvFRqGl9kWad77NrOehN36z6gMz90K8dzxJaNmQx/7MraFlQZYQ7UZ9o19Hs3aoaSvWqKaM
 bNScAsLHLEWEdrDDJ42imsFMXHHaZDJ+MF6ogbTQr6JhicritjH+ANOp/Ir3r6Ip3B9s4xhbo82
 TzCggx2+r5bQ5xpN+Oo7H0H/ynV2AIlBvDBTUiVAkv9dKf/dIZvqDwuG2x0Db+O9KOWRIjhk1nA
 qTIpKIWR8nfRPHpW/5ntJPBKY6GvBHSXbqEjXzB0zNigBW6+/P8K3rb16ZSVA6XZM+bGVBhkAd0
 xZCvrnjzMYpIpU1WSskZEtVSjmyUDOq7GwkLUVfJ+275SzFXV2oehxw7HbJfwwJ1090HPdCioH5
 RhSsuVDugzeQ2ifGWcg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010037
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



On 10/13/2026 10:22 PM, Bin Meng wrote:
> L2-LIM consists of cache SRAM ways controlled by L2CC WayEnable, and
> L2 Zero is the controller's scratchpad allocation interface. Creating
> their RAM stand-ins in the SoC and passing a LIM link splits ownership
> of the register state and the memory views it controls.
> 
> Instantiate the shared SiFive L2CC with 15 masters and the existing
> 2 MiB modeled Zero aperture. Let the controller own the backing and
> both windows, and map its register, LIM, and Zero regions from the SoC.
> Remove the external RAM allocations and the l2-lim link.
> 
> The device restores the visible LIM range after reset or migration.
> L2 Zero keeps its fixed aperture as a RAM approximation of scratchpad
> access rather than tracking the remaining LIM capacity.
> 
> Signed-off-by: Bin Meng <bin.meng@processmission.com>
> Tested-by: Conor Dooley <conor.dooley@microchip.com>
> 
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

> 
> (no changes since v3)
> 
> Changes in v3:
> - Configure and instantiate the shared SiFive L2CC
> - Map the register, LIM, and Zero windows exposed by the controller
> - Remove the external RAM allocations and l2-lim link
> - Keep the PolarFire master count and modeled Zero aperture unchanged
> 
>   include/hw/riscv/microchip_pfsoc.h |  2 ++
>   hw/riscv/microchip_pfsoc.c         | 45 ++++++++++--------------------
>   hw/riscv/Kconfig                   |  1 +
>   3 files changed, 17 insertions(+), 31 deletions(-)
> 
> diff --git a/include/hw/riscv/microchip_pfsoc.h b/include/hw/riscv/microchip_pfsoc.h
> index 612fd2b69c..18f5003850 100644
> --- a/include/hw/riscv/microchip_pfsoc.h
> +++ b/include/hw/riscv/microchip_pfsoc.h
> @@ -27,6 +27,7 @@
>   #include "hw/cpu/cluster.h"
>   #include "hw/dma/sifive_pdma.h"
>   #include "hw/misc/mchp_pfsoc_dmc.h"
> +#include "hw/misc/sifive_l2cc.h"
>   #include "hw/misc/mchp_pfsoc_ioscb.h"
>   #include "hw/misc/mchp_pfsoc_sysreg.h"
>   #include "hw/net/cadence_gem.h"
> @@ -43,6 +44,7 @@ typedef struct MicrochipPFSoCState {
>       RISCVHartArrayState e_cpus;
>       RISCVHartArrayState u_cpus;
>       DeviceState *plic;
> +    SiFiveL2CCState l2cc;
>       MchpPfSoCDdrSgmiiPhyState ddr_sgmii_phy;
>       MchpPfSoCDdrCfgState ddr_cfg;
>       MchpPfSoCIoscbState ioscb;
> diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
> index 8106dbb3ad..d0d8c8f84c 100644
> --- a/hw/riscv/microchip_pfsoc.c
> +++ b/hw/riscv/microchip_pfsoc.c
> @@ -174,6 +174,12 @@ static void microchip_pfsoc_soc_instance_init(Object *obj)
>       object_initialize_child(obj, "dma-controller", &s->dma,
>                               TYPE_SIFIVE_PDMA);
>   
> +    object_initialize_child(obj, "l2-cache-controller", &s->l2cc,
> +                            TYPE_SIFIVE_L2CC);
> +    qdev_prop_set_uint32(DEVICE(&s->l2cc), "num-masters", 15);
> +    qdev_prop_set_uint64(DEVICE(&s->l2cc), "zero-size",
> +                         microchip_pfsoc_memmap[MICROCHIP_PFSOC_L2ZERO].size);
> +
>       object_initialize_child(obj, "sysreg", &s->sysreg,
>                               TYPE_MCHP_PFSOC_SYSREG);
>   
> @@ -200,8 +206,6 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
>       MemoryRegion *system_memory = get_system_memory();
>       MemoryRegion *rsvd0_mem = g_new(MemoryRegion, 1);
>       MemoryRegion *e51_dtim_mem = g_new(MemoryRegion, 1);
> -    MemoryRegion *l2lim_mem = g_new(MemoryRegion, 1);
> -    MemoryRegion *l2zero_mem = g_new(MemoryRegion, 1);
>       MemoryRegion *envm_data = g_new(MemoryRegion, 1);
>       MemoryRegion *qspi_xip_mem = g_new(MemoryRegion, 1);
>       char *plic_hart_config;
> @@ -260,35 +264,14 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
>           RISCV_ACLINT_DEFAULT_MTIMECMP, RISCV_ACLINT_DEFAULT_MTIME,
>           iks->clint_timebase_freq, false);
>   
> -    /* L2 cache controller */
> -    create_unimplemented_device("microchip.pfsoc.l2cc",
> -        memmap[MICROCHIP_PFSOC_L2CC].base, memmap[MICROCHIP_PFSOC_L2CC].size);
> -
> -    /*
> -     * Add L2-LIM at reset size.
> -     * This should be reduced in size as the L2 Cache Controller WayEnable
> -     * register is incremented. Unfortunately I don't see a nice (or any) way
> -     * to handle reducing or blocking out the L2 LIM while still allowing it
> -     * be re returned to all enabled after a reset. For the time being, just
> -     * leave it enabled all the time. This won't break anything, but will be
> -     * too generous to misbehaving guests.
> -     */
> -    memory_region_init_ram(l2lim_mem, NULL, "microchip.pfsoc.l2lim",
> -                           memmap[MICROCHIP_PFSOC_L2LIM].size, &error_fatal);
> -    memory_region_add_subregion(system_memory,
> -                                memmap[MICROCHIP_PFSOC_L2LIM].base,
> -                                l2lim_mem);
> -
> -    /*
> -     * HSS decompresses into the L2 zero-device window and executes there.
> -     * Model it as RAM because QEMU does not model the backing L2 cache.
> -     */
> -    memory_region_init_ram(l2zero_mem, NULL, "microchip.pfsoc.l2zero",
> -                           memmap[MICROCHIP_PFSOC_L2ZERO].size,
> -                           &error_fatal);
> -    memory_region_add_subregion(system_memory,
> -                                memmap[MICROCHIP_PFSOC_L2ZERO].base,
> -                                l2zero_mem);
> +    /* The L2CC owns the SRAM backing and both software-visible windows */
> +    sysbus_realize(SYS_BUS_DEVICE(&s->l2cc), errp);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->l2cc), SIFIVE_L2CC_MMIO_REGS,
> +                    memmap[MICROCHIP_PFSOC_L2CC].base);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->l2cc), SIFIVE_L2CC_MMIO_LIM,
> +                    memmap[MICROCHIP_PFSOC_L2LIM].base);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->l2cc), SIFIVE_L2CC_MMIO_ZERO,
> +                    memmap[MICROCHIP_PFSOC_L2ZERO].base);
>   
>       /* create PLIC hart topology configuration string */
>       plic_hart_config = riscv_plic_hart_config_string(ms->smp.cpus);
> diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
> index d06ac26648..46a499f70f 100644
> --- a/hw/riscv/Kconfig
> +++ b/hw/riscv/Kconfig
> @@ -21,6 +21,7 @@ config MICROCHIP_PFSOC
>       select MCHP_PFSOC_MMUART
>       select MCHP_PFSOC_SYSREG
>       select RISCV_ACLINT
> +    select SIFIVE_L2CC
>       select SIFIVE_PDMA
>       select SIFIVE_PLIC
>       select UNIMP


