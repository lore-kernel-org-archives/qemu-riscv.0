Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E65606A31C
	for <qemu-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 13:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B46SfiHR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WRLAAz67
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xM49B-0005Ft-V7; Wed, 28 Oct 2026 09:56:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prajwal.n@oss.qualcomm.com>)
 id 1xM493-0005F6-A9
 for qemu-riscv@nongnu.org; Wed, 28 Oct 2026 09:56:50 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prajwal.n@oss.qualcomm.com>)
 id 1xM491-000137-HG
 for qemu-riscv@nongnu.org; Wed, 28 Oct 2026 09:56:49 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69SBdx7G4154582
 for <qemu-riscv@nongnu.org>; Wed, 28 Oct 2026 13:56:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qpL1Jz+LTl+962xGPbneGzNJZkCmiPVOxhZsO5Mdh7s=; b=B46SfiHRiV2MzzSf
 loNQ7whj0vRg+LPq+b6QIll1B1e321f5OoJznsQXkbLdxS6ISWu9+Fj3b0mObZgA
 HhPogX8e2reMiY3ISLDeor7teWLDCnwHwy4B5sscXjtx2CAfB7SIR4HPIHVnHkOV
 +O+uXJc+0BSOZh9WRKUw4EMcJrwrmPJ3RA0WC9bb9h+/BYv9HWCEPo2tAZUoT1EI
 tPlKhETBh2bP2KpDzvFrr6SIBgUWlrR35DeDDAsQfDAOoeBXwStbW1A4bQaf2AQ6
 mZ/QRo7J+q71xnf70I8Jij6ca/ZQljkfiA2WD5peGWkFyFQlmJVPRGGSfQBZUfkD
 crAGFg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdsp13xm-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 28 Oct 2026 13:56:45 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-30bcb065bfdso1709640eec.0
 for <qemu-riscv@nongnu.org>; Wed, 28 Oct 2026 06:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793195805; x=1793800605; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=qpL1Jz+LTl+962xGPbneGzNJZkCmiPVOxhZsO5Mdh7s=;
 b=WRLAAz67ihkIy7OUDZW7rpd+hkM/KDOazU9G/ITlAcOGWIN3poGfTPTxETTgef5NsS
 2CJGM8C9yKfMEnfIH0jFdKMjp2nXubozZHe8rcmxu2Ukn/8pw7DHfd79+E1uPpL1DzVg
 ZYA1pxKFu7T9uDxtP+PZWry3w2WRrAFCcyck+PJ3bry0JoRCH0dBjf++3I8pQxFnVhST
 uJ6q8T49RsrMlZnj3oR3w2RE2DFb9z1mlvh86+jGT8xGQCP3Iv3E8uMyx8ehOGwn4X9C
 UBTZ4+FRa2CrJ2Px05fFCp9BZNd4b0kvN1JFwisTwlA/iLhyl4taXaRbdohx1smGZLx6
 7Mwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793195805; x=1793800605;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=qpL1Jz+LTl+962xGPbneGzNJZkCmiPVOxhZsO5Mdh7s=;
 b=sKF9wEW+QMXQw2r7maDRsFl28HMrqLzaaNSDO7Aonp78oenrZJTTNt/JfK+S4uHeEc
 Z7XHU6lUhJhpnK7U+17kX+JlnyuOk8ju9eeYBOmahYvrzRqy8jO6fgGXMZ0JbbeczCso
 YGiv9HBDawRY2TQAim9XPAhstGweAG6LEo8JRv3n8vRb0mXtZlznWHTz+GnLuKYAih7i
 +QrWLsSBOGaE7xcRXBZJzOcmjlJUPoYTzT4Sa08wMxARAbRMgkcFpe+zfW4MhrrK5IIU
 XeV3DwNcR1mX+A2Qp0iM5bwm7TGY8Xtk1Ys1aC7FGMhCWDdocIzl81WZiarZNG7VUXOm
 /YkQ==
X-Gm-Message-State: AFq9FYJGPoTbiR2JffBek3rdrA6xBuBFslENsoU/Pzlm9l19vP6VaOGI
 OTJ4caTqHsckXXqUATLeKnZeVhK6Em7duKKRMo4UR8UrOFT3XUFysA/YjddiJ3l0i1osdaicQtn
 OtBHfAKZNaSiPT96nb3uhHVUZb1ApNtN3TilZJbcDnQV+S8umTDNUbRRwQw==
X-Gm-Gg: AYBFou1TxWdj2OCIst6ODzy8viMfAE01I8sMxcaWtXk5fzcj4eRHhMajExUhNxDfLEU
 0QF90rpP86Rjfe5ws137KaZNoBMQTIZ2r2tlIOjK3LO0rJHJ/1e4SU3uq7jPjk55tWDeR52JraV
 oMbMnXVWr9tUeFyv/GvCuzIk5F3myoS3wrJrRHK7bnBlcI7FQQ4GcYIt2iPzqtUGdXTqCE3YBmB
 vtNgaOSEautt4qriIJBs3xbkGTV2Z1kWRIpQSSiQVGYm7zNjdf+J1pA5kbZ4RnkV7KVT51YiU7G
 V4wfHWVrzy9/zZjbbc5SvdSYu7c/ne+BtkwPUEBbWO41YhSOS1gfOsMhZW7rin1QtkUiNJsWRxP
 AwWoTndfNnlOhbyR8T4+5HfwgG51JcjHVW1ZKULLXHrmFIVjH2Hp5M+kU7TwLN0q3vmMK9prmfg
 ==
X-Received: by 2002:a05:701b:458c:b0:17f:7280:134e with SMTP id
 a92af1059eb24-1a6cef7a368mr2765239c88.32.1793195804747; 
 Wed, 28 Oct 2026 06:56:44 -0700 (PDT)
X-Received: by 2002:a05:701b:458c:b0:17f:7280:134e with SMTP id
 a92af1059eb24-1a6cef7a368mr2765190c88.32.1793195804055; 
 Wed, 28 Oct 2026 06:56:44 -0700 (PDT)
Received: from [192.168.1.6] ([125.99.240.160])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1a75e5c6d4fsm11027199c88.14.2026.10.28.06.56.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2026 06:56:43 -0700 (PDT)
Message-ID: <af95947c-62aa-46ad-82e9-1720be6fefde@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 19:26:33 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/6] hw/riscv: add CBQRI controllers to virt machine
To: Drew Fustini <fustini@kernel.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Sunil V L <sunilvl@oss.qualcomm.com>,
 Anup Patel <anup.patel@oss.qualcomm.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Nicolas Pitre <npitre@baylibre.com>,
 =?UTF-8?Q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>,
 Atish Patra <atish.patra@linux.dev>,
 =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>,
 yunhui cui <cuiyunhui@bytedance.com>,
 Chen Pei <cp0613@linux.alibaba.com>, guo.wenjia23@zte.com.cn,
 liu.qingtao2@zte.com.cn, prajwal.n.oss@gmail.com
References: <20261026-riscv-ssqosid-cbqri-v6-0-1a367a35cd0e@kernel.org>
 <20261026-riscv-ssqosid-cbqri-v6-6-1a367a35cd0e@kernel.org>
Content-Language: en-US
From: Prajwal N <prajwal.n@oss.qualcomm.com>
In-Reply-To: <20261026-riscv-ssqosid-cbqri-v6-6-1a367a35cd0e@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _cVNpShie24thlWIQb8cZsLpsVfkoC4k
X-Proofpoint-ORIG-GUID: _cVNpShie24thlWIQb8cZsLpsVfkoC4k
X-Authority-Analysis: v=2.4 cv=Cssq4X4D c=1 sm=1 tr=0 ts=6ae1ff1d cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=GuUutMOJDLuJj3+4/pSvWA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=IpJZQVW2AAAA:8 a=bDdBU3oEAAAA:8 a=VwQbUJbxAAAA:8 a=7HQ5lZ7GkhH3xUXdjy4A:9
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22 a=IawgGOuG5U0WyFbmm1f5:22
 a=DN7SgORnOiO7RqxRx1GC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1NSBTYWx0ZWRfXzDo0GNSyvFi8
 V4sia+rzksZjcbcPTyvzMM4JlPezPSvlGmNZsijjdIwyen2Vi/WSSBzifLV8ZUQpChETrYkEOdk
 toHpjmUNh0VQOmH+hgGh8Oq9YDlcqWUcViYBuAcMX8j7OiRapcUOHuhBtsVTYEC/3ggd5I5vAYS
 zdxFQ55YLXyRJXF3jldl3kDSRU0Y7jafoZnPaYW5WUkmF/1rcUbzdVdAE132ZRF100CMir1+mYm
 o/dTmpeUnoXsISJKcjkPSjYeSCfeuXalNygiq+eJNOwb52DWISIxS6syn+TID9VvClYDRrLXJdo
 ymsGtUBLPxcC7WP7Dog5PclgCz1ZrwX7qsfrVYrEv6wYYnTSwk4y/0CoBle6E1Jxb+VbEh/l+3B
 LLnsEKAZCc/0QcJsSz9infFUsoLQf8okFS77dBWx/4AtHnD7Axj8wI/K6LGsYU9U8PRBzh1biGL
 4zfeDwRAaYljh8z5Fdg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1NSBTYWx0ZWRfXyySubfBIxlAT
 +kXwyWqUMf6G5LP4j9XVwyjYzYBemqLQdZlBIYuPxffqlrOOlnfk0neqc34x/+BsNPtPAn3GSL6
 J4sMIn0pp5uhepqUQBo1vxRurwyXBHA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280055
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=prajwal.n@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, KHOP_DYNAMIC=0.001,
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

Hi Drew,

On 26-10-2026 23:17, Drew Fustini wrote:
> From: Nicolas Pitre <npitre@baylibre.com>
> 
> Add CBQRI controllers to the RISC-V virt machine. The device properties
> can be fully configured from the command line:
> 
>   $ qemu-system-riscv64 -M virt ... \
>       -device riscv.cbqri.capacity,mmio_base=0x04828000[,...]
>       -device riscv.cbqri.bandwidth,mmio_base=0x04829000[,...]
> 
> The mmio_base option is mandatory, the others are optional.
> 
> Many -device arguments as wanted can be provided as long as their
> mmio regions don't conflict.
> 
> To see all possible options:
> 
>   $ qemu-system-riscv64 -device riscv.cbqri.capacity,help
>   riscv.cbqri.capacity options:
>     alloc_op_config_limit=<bool> -  (default: true)
>     alloc_op_flush_rcid=<bool> -  (default: true)
>     alloc_op_read_limit=<bool> -  (default: true)
>     at_code=<bool>         -  (default: true)
>     at_data=<bool>         -  (default: true)
>     max_mcids=<uint16>     -  (default: 256)
>     max_rcids=<uint16>     -  (default: 64)
>     mmio_base=<uint64>     -  (default: 0)
>     mon_evt_id_none=<bool> -  (default: true)
>     mon_evt_id_occupancy=<bool> -  (default: true)
>     mon_op_config_event=<bool> -  (default: true)
>     mon_op_read_counter=<bool> -  (default: true)
>     ncblks=<uint16>        -  (default: 16)
>     target=<str>
> 
>   $ qemu-system-riscv64 -device riscv.cbqri.bandwidth,help
>   riscv.cbqri.bandwidth options:
>     alloc_op_config_limit=<bool> -  (default: true)
>     alloc_op_read_limit=<bool> -  (default: true)
>     at_code=<bool>         -  (default: true)
>     at_data=<bool>         -  (default: true)
>     max_mcids=<uint16>     -  (default: 256)
>     max_rcids=<uint16>     -  (default: 64)
>     mmio_base=<uint64>     -  (default: 0)
>     mon_evt_id_none=<bool> -  (default: true)
>     mon_evt_id_rdonly_count=<bool> -  (default: true)
>     mon_evt_id_rdwr_count=<bool> -  (default: true)
>     mon_evt_id_wronly_count=<bool> -  (default: true)
>     mon_op_config_event=<bool> -  (default: true)
>     mon_op_read_counter=<bool> -  (default: true)
>     nbwblks=<uint16>       -  (default: 1024)
>     target=<str>
> 
> Boolean options correspond to hardware capabilities that can be disabled
> 
> Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Signed-off-by: Drew Fustini <fustini@kernel.org>
> ---
>  hw/core/sysbus-fdt.c | 4 ++++
>  hw/riscv/virt.c      | 3 +++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/hw/core/sysbus-fdt.c b/hw/core/sysbus-fdt.c
> index 12238570b5e1..265917ef573e 100644
> --- a/hw/core/sysbus-fdt.c
> +++ b/hw/core/sysbus-fdt.c
> @@ -35,6 +35,7 @@
>  #include "hw/core/platform-bus.h"
>  #include "hw/display/ramfb.h"
>  #include "hw/uefi/var-service-api.h"
> +#include "hw/riscv/cbqri.h"
>  #include "hw/arm/fdt.h"
>  #include "hw/watchdog/sbsa_gwdt.h"
>  
> @@ -142,6 +143,9 @@ static const BindingEntry bindings[] = {
>      TYPE_BINDING(TYPE_RAMFB_DEVICE, no_fdt_node),
>      TYPE_BINDING(TYPE_UEFI_VARS_SYSBUS, add_uefi_vars_node),
>      TYPE_BINDING(TYPE_WDT_SBSA, no_fdt_node),
> +    /* RISC-V CBQRI controllers have no generic device tree node */
> +    TYPE_BINDING(TYPE_RISCV_CBQRI_BC, no_fdt_node),
> +    TYPE_BINDING(TYPE_RISCV_CBQRI_CC, no_fdt_node),
>      TYPE_BINDING("", NULL), /* last element */
>  };
>  
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index d4b501802f60..dbc0f8cfc8d7 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -57,6 +57,7 @@
>  #include "hw/pci-host/gpex.h"
>  #include "hw/display/ramfb.h"
>  #include "hw/acpi/aml-build.h"
> +#include "hw/riscv/cbqri.h"
>  #include "qapi/qapi-visit-common.h"
>  #include "hw/virtio/virtio-iommu.h"
>  #include "hw/uefi/var-service-api.h"
> @@ -1157,6 +1158,8 @@ static void virt_machine_class_init(ObjectClass *oc, const void *data)
>  #ifdef CONFIG_TPM
>      machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_TIS_SYSBUS);
>  #endif
> +    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RISCV_CBQRI_BC);
> +    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RISCV_CBQRI_CC);

When the controller device is created dynamically through the QEMU command line, the
corresponding device tree node must also be created. As I do not see the implementation
to add the DT node in this series, Could you please clarify how it is created.?

Thanks,
Prajwal N
>  
>      object_class_property_add_bool(oc, "aclint", virt_get_aclint,
>                                     virt_set_aclint);
> 


