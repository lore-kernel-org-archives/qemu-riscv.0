Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EBC8606A31E
	for <qemu-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 20:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B80DTjO/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VzZsN0Yw
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xVaII-0006Js-Aq; Mon, 23 Nov 2026 15:05:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xVaIG-0006Hv-2O
 for qemu-riscv@nongnu.org; Mon, 23 Nov 2026 15:05:40 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xVaIE-0003A3-9h
 for qemu-riscv@nongnu.org; Mon, 23 Nov 2026 15:05:39 -0500
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ANJuNVh2349969
 for <qemu-riscv@nongnu.org>; Mon, 23 Nov 2026 20:05:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WWLb8+fh6oO3ZnzEEKtRhiJ803Mtq9Gx0HjgM7/TCnM=; b=B80DTjO/shIT/blh
 q+h+7FJJFahuPXXJi30WjGIryphv86T3jCKpYbnPcvdOtIQk39PSTSD703J3Ertq
 3IOhIYaSOJjHbqps5pDio8/6quiWQWDg94ZFeQ+gaQTZeHNl/U3g1P17gTbSRXo3
 P7TjyrTROpQuAk1JjBGhnZKgv/B/olMPKkbRdLYCPSk7T+km9nkCCeZvGhw2Qrc+
 rSjgv7n274Odt09Eu7NBGU9Wln6Rtlg2ilZzEYPlrrfqOkb8NaWMqVsDl5mWXq/4
 Kqk+IKww0rg9c788YnV3POLuWC/VvKzvA7SycSP6qv8mSFTW/XICrCT4Bk4/mSMe
 GQEESw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g9a372t-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 23 Nov 2026 20:05:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-9308eafb465so778173985a.2
 for <qemu-riscv@nongnu.org>; Mon, 23 Nov 2026 12:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795464336; x=1796069136; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=WWLb8+fh6oO3ZnzEEKtRhiJ803Mtq9Gx0HjgM7/TCnM=;
 b=VzZsN0YwNgzFx2D1eftRTolUAm/if2+ZU1zeLPI9QxAqOZjN5sdFX34EjNbOsFh9rr
 dFzr+dwZCeEDHrWyyfhBUzpgpex9OpBPk7D9umODzCE+ciNOGDfuFu6sbNd4Icy8JPQG
 MnAMLf8qh8r+NIr+882EN76M/TUERAEFj77pfnjD8DPeISfOeQkn82nCUkrfLJpg2+ev
 WfNVF8MdvRLcx+wikcgVIJ/kDuiZWxxNBK+jSm8Hnkmw9niUhrOJjdkg7B5DWkIO2r6/
 pwDOAKnNF9KnAoWDwwtgdx07Y7q42vsNYVEFupaEcAXeM4X8mOjW9xG4xA13t75Qae0v
 aZeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795464336; x=1796069136;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=WWLb8+fh6oO3ZnzEEKtRhiJ803Mtq9Gx0HjgM7/TCnM=;
 b=TkDKk7lhRxa0rKIi3Aj4/nOMdHePoB8bZbKYKRd1xU2ZeEnEclWlyGoZxyCGBGV00L
 DLHF9h/zyOZ7kVHiUK72w41+08sPUqLA15AaEeVhmMKeL3G/QKNN+Pv7JrjnQyQFRPNq
 61VhKq5/iumjhVlqqvuhFkEHKA/bzBC/x9whtqOH6lodmPuzo9Bn4QZtkS1p7rK/qZRz
 IEsWykEwwbTTY1cQ1VFiYXWugvj2G2kQ/mFeHvDKfObDazwexae9+a4V/z6/Lgu5NefD
 T6Jiy4xA/OOwlfmE7Rd0cMkS/R3aVg5pxY+Nr0xz/YnVAJikz6twrQvR5+3HQZ7rPqDG
 Fk/w==
X-Gm-Message-State: APuU4Z+4dmtjaywEqgEnD40oMJGm3Z98h+tYBKO0HydD7XpvDbk0L1GK
 TfssaPAMBSYAmYJPWGJ2nB2a/h5apfqB3QT1/aw4E20yJa1L2M8XouVX5NS8lMXzErbNL6QmZrE
 saoHxdozI9x5p15RGY8T1VaiE7Y3qPPRBVDjtO6MOBGPVBoInIS+wEkxsXTZ7qYptBw==
X-Gm-Gg: AZFdTZdiGM3TsNSXXWni1Ntt7lXVtbGKbkP1LFIdZnbbNmBdcBg79fyR8hXpU9T3mN6
 lSuwhhP1VUWEjHItwQZB9dUV3KbX+VNvuzYciGPuoKBFX7ZAk4ai2UD5V9JaFX29ww1qAGTU2V+
 8cfAY65B7qhq7INL3DBfNI/Mbd6bbY3S23zZP0NpK2q8jlijxqqfstMZLGrJSz8LTbE0AaJVSel
 Ma2PItJZIQCA1hVPkvuyncYZfydbNtyTzYsZu4XHwyRtz6mFGmKrlbgLF7EWdmtu+/m6DSm9xzv
 QdOjE04Jvan0HxEU5JX8ECIQGU3qccYlJsaLydYtyzLY0irPq1ITsItZE38Mi7WGFmyhQvqsp4D
 km0/ixJ40XOroMgHODT9Wv/NMeram0Jyna8TqJIBwJL1RQAyDCmcjJhvqFPTZR7cQQsU1dnKgf4
 WkB//YtAMw
X-Received: by 2002:a05:620a:4384:b0:949:733e:dde5 with SMTP id
 af79cd13be357-949bab32aadmr2124872585a.66.1795464335905; 
 Mon, 23 Nov 2026 12:05:35 -0800 (PST)
X-Received: by 2002:a05:620a:4384:b0:949:733e:dde5 with SMTP id
 af79cd13be357-949bab32aadmr2124866085a.66.1795464335146; 
 Mon, 23 Nov 2026 12:05:35 -0800 (PST)
Received: from [192.168.68.101] ([189.110.107.17])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-949bb35005dsm880498985a.11.2026.11.23.12.05.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Nov 2026 12:05:34 -0800 (PST)
Message-ID: <aa883642-c38a-48e4-b883-c3206d1b8426@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 17:05:32 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] hw/riscv: iommu-sys: Add migration support
To: Tan Chi <tanchi25@mails.ucas.ac.cn>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 chao.liu.zevorn@gmail.com
References: <20261119024251.280765-1-tanchi25@mails.ucas.ac.cn>
 <20261119024251.280765-4-tanchi25@mails.ucas.ac.cn>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261119024251.280765-4-tanchi25@mails.ucas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4MCBTYWx0ZWRfX5UcAnuMBnDMz
 jzi6H5KmdZ5RZwdfl+UjPzHkdHaoMfrpk4co3e7hDT/TtjfSwQgnbEXkIXgP8jzXuFid9FUGlzz
 Pnc6iulujRvzWAvwmDn421gEE3dh5sk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4MCBTYWx0ZWRfXytB9MBfcLa+/
 S/NiyJ2M9rAEpkAT2Koi5tp6WXKQ01EYtIhD5B33ucyGtp9N9doxzuXQTHTLyLaQwVb/kYPqzje
 Odc0eyQjR+7ozSwz24xsFYPQv80d5lRr7xidqeYu1hzw7GeHdG7O4ssjRqPwHwW1UH7sPxpJbfw
 2BGOKKEQBkeysmQV7cB2SWy2X1QkThzH0coikDusM3o0KoXtWHbn6WJTu4xZbyD9HkRmLqTewgW
 672vhWfFJvJsbcEW6hMLCVHv1gm1DLkRki06XDqa5ss0vXd4McbD0wy/rqWDJe0xwwbzJpcwEfC
 MfSnwziFYGXtM+P+dleP2+KfZJN0WLK5gmxaLHsTwgKvG0AUPXwTQQeehQG+B0eGgLIJrmKl2FO
 8gL//acMlbajy4Y/HmHPAhGJanzrKoLHm7szfavL+P2USUK2selSIUbpz6uJImjdGOVzNFbPj/T
 vBVr0ZUJIfciAjQAvrA==
X-Proofpoint-ORIG-GUID: SivIMvfriOm-F8Fc4shwLeaCY9RjuOsA
X-Authority-Analysis: v=2.4 cv=cYJHPXDM c=1 sm=1 tr=0 ts=6b049c90 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=2Chh/y2wedAoPG2p3qwUfw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=fGMt68kduvb59XZs-sMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: SivIMvfriOm-F8Fc4shwLeaCY9RjuOsA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230080
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



On 11/18/2026 11:42 PM, Tan Chi wrote:
> Add VMState support for the system-bus RISC-V IOMMU device.
> 
> Preserve the MSI-X configuration table and pending bit array,
> which are maintained in separate buffers by the system-bus
> wrapper. The common IOMMU registers and internal state are
> migrated independently by the embedded IOMMU device.
> 
> Signed-off-by: Tan Chi <tanchi25@mails.ucas.ac.cn>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   hw/riscv/riscv-iommu-sys.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/hw/riscv/riscv-iommu-sys.c b/hw/riscv/riscv-iommu-sys.c
> index 258c171efd..6e4cea00a5 100644
> --- a/hw/riscv/riscv-iommu-sys.c
> +++ b/hw/riscv/riscv-iommu-sys.c
> @@ -21,6 +21,7 @@
>   #include "hw/pci/pci_bus.h"
>   #include "hw/core/qdev-properties.h"
>   #include "hw/core/sysbus.h"
> +#include "migration/vmstate.h"
>   #include "qapi/error.h"
>   #include "qemu/error-report.h"
>   #include "qemu/host-utils.h"
> @@ -242,6 +243,25 @@ DeviceState *riscv_create_iommu_sys(DeviceState *mmio_irqchip,
>       return iommu_sys;
>   }
>   
> +#define RISCV_IOMMU_SYSDEV_MSIX_TABLE_SIZE \
> +    (RISCV_IOMMU_PCI_MSIX_VECTORS * PCI_MSIX_ENTRY_SIZE)
> +
> +#define RISCV_IOMMU_SYSDEV_MSIX_PBA_SIZE \
> +    (QEMU_ALIGN_UP(RISCV_IOMMU_PCI_MSIX_VECTORS, 64) / 8)
> +
> +static const VMStateDescription vmstate_riscv_iommu_sys = {
> +    .name = "riscv-iommu-sys",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (const VMStateField[]) {
> +        VMSTATE_BUFFER_POINTER_UNSAFE(msix_table, RISCVIOMMUStateSys, 0,
> +                                      RISCV_IOMMU_SYSDEV_MSIX_TABLE_SIZE),
> +        VMSTATE_BUFFER_POINTER_UNSAFE(msix_pba, RISCVIOMMUStateSys, 0,
> +                                      RISCV_IOMMU_SYSDEV_MSIX_PBA_SIZE),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>   static const Property riscv_iommu_sys_properties[] = {
>       DEFINE_PROP_UINT64("addr", RISCVIOMMUStateSys, addr, 0),
>       DEFINE_PROP_UINT32("base-irq", RISCVIOMMUStateSys, base_irq, 0),
> @@ -267,6 +287,7 @@ static void riscv_iommu_sys_class_init(ObjectClass *klass, const void *data)
>       rc->phases.hold = riscv_iommu_sys_reset_hold;
>   
>       dc->realize = riscv_iommu_sys_realize;
> +    dc->vmsd = &vmstate_riscv_iommu_sys;
>       set_bit(DEVICE_CATEGORY_MISC, dc->categories);
>       device_class_set_props(dc, riscv_iommu_sys_properties);
>   }


