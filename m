Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7FD1C79F9F
	for <qemu-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 17:50:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x4iuB-0005l6-5K; Thu, 10 Sep 2026 13:49:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x4iu9-0005ik-5L
 for qemu-riscv@nongnu.org; Thu, 10 Sep 2026 13:49:45 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x4iu6-0007lF-My
 for qemu-riscv@nongnu.org; Thu, 10 Sep 2026 13:49:44 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68AF4HvF1326091
 for <qemu-riscv@nongnu.org>; Thu, 10 Sep 2026 17:49:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3PwGMFZj6D0YLnndRQdmlRtDOpdlteOb8O/Qaxv8tMw=; b=NPqCqSuDEGnIlDt2
 XEug3ScWDQuPGEVLZ0OMwvjrax5aFFSJxYncWmsLxM+FU57PAiSDeS5+muKyK7Ns
 GOSuUIa4I/QBSsgE4XeFYmSQA5R6Nz4+mlIEu5A/pGc9BVub7NtLTBi0d3ifElZz
 lZIPwPGtM5JhvKK+UeqyGqa6XG+ssvgkvcUN1OGIWh2gTj4Y8DTcfCWdsQc5oDIS
 ySIy4mQ6PfwtLxpdRAw+dsKAeY2OAbbc2FqPGDoXpzu6EyblCI/jaHZhdCIQi+Bp
 mo6TXgH0vUZO1YJa4jlOTTwQ7yHP6hJd2jcBw0c+ihYTmBYa6fxJrV3hP7sBYxV9
 PtNr+g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkwts18sx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 10 Sep 2026 17:49:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-934956beec8so1071321585a.0
 for <qemu-riscv@nongnu.org>; Thu, 10 Sep 2026 10:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1789062579; x=1789667379; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=3PwGMFZj6D0YLnndRQdmlRtDOpdlteOb8O/Qaxv8tMw=;
 b=PX+9LhgJzov4Xonwf+eMVXZvHAKmTxi8oRLc0hIoeLCK1Xcsc4sXAn8jg8cYWhXIyh
 Jo78OGe2/MBNA7VnbDNZDyFJVDuOKc+TtxbFtxwhM8tUcAH1JRut4ROL+6CvlgAVRwsM
 gAIRoC2KxOgRA7wIktFO40WJEpaD9I5lEjiYfXj8STyzTk4UQdnnO01NiwUt/hHLpDmH
 TnmbYBfB6qsu0z8qaKtiN9zTSiM+q263Tp7e3WsZM7tPJp/cvCqur+S7PygEmm4/HIvV
 wMOsD0ERLyZKAfhNJ//H4kd5kErQ2uaLrsN8Phe3iSuyDuvVTkxkfc0D3YG35dMJvqZU
 jDyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789062579; x=1789667379;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=3PwGMFZj6D0YLnndRQdmlRtDOpdlteOb8O/Qaxv8tMw=;
 b=EmbsPxLDQToR9lI360XBrAlNvKtzRbFxhebzPZo6LGr6FDJ2bWBRFGdGi9g2mvPJaj
 7RW90gyKdWWWKtLzsRbjb1Pu3xldbTLVmjwDzGcUSO55ONdxIiXTFhCgw+dMp/02++eZ
 ay68Ej9i1Rxk5ClZdqt4YJmDQS149yygv1anV9+HDOVkaBCR4TCmRT4frurTbAbUdo/L
 qxKeYhS29VG2Ud9YPXWmLxVoKyvVEiwryxO7zZfShKWTS6EiXPJzBaNA9n7lj99CNXtb
 30RWELuwhKy6+03OxhKk9SSBXl0ZhYhr3snZNIXePsQmC/zMQH2qcRZTsYvSR6uLLx8X
 mOZA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzHAY+HzsItmfGezwzZjfcaFmlnw2FJdQ2ubkhw4mmSVZrUXFS6T38yMSRhrVhyqqilP0+DPi45q+Va@nongnu.org
X-Gm-Message-State: AFuF++lqz0ByT0coZkCN27Gvcqft3ksDaXunfZY7N/XSN5iHrila7XwW
 s4YSKugvRSA7r68P75S/ucnqv4zE9NC8WeADkDfKGmXXo7aN/ckDUHMontL5Qbqr9/lKulpTpFD
 kEXAXk45tRO83bvi8FzRAQGv7MP1Kf1GYWv9WPpT0pYguPto/uDwjje+OOA==
X-Gm-Gg: AYBFou1JTuYzG1RMhSZ5KYq5xzfPLD5how7ujk6Cozz0x5HQuoxiKhWsLZdJkCKefo1
 19CfLBh86FBnAsQ7ILz35Gg3AYQaF7oYS7vQCJ7BeAGEPwioMJ3aaAxrSxRz236GVyusJ0c2G4T
 EhHCM0g5frHCY5mf176J4KTK6YOw2w4vwHGq8MEWN4wC2aBhfx0XOSu/ZQWcKxVjPmkihAGVSHO
 jfiN3ggU9DwdgaMSaLK+ZdrIWsZRg3xg4/ySQnhVEp2qAFtbgS/wmOMs4SnwJAiW+nHW6V8oBIz
 BKMV7qx04Nq6rlOPLVn+161U4UtvezHViAmy8UvwRu2zQh80F+DnLCBbmbW6qD0636CvTQJQf0V
 kBxur9g66A/2kdqmPCaMdibwUCsS4cZDp6ws=
X-Received: by 2002:a05:620a:6989:b0:936:d833:6a35 with SMTP id
 af79cd13be357-93980133923mr5155032985a.0.1789062578904; 
 Thu, 10 Sep 2026 10:49:38 -0700 (PDT)
X-Received: by 2002:a05:620a:6989:b0:936:d833:6a35 with SMTP id
 af79cd13be357-93980133923mr5155025785a.0.1789062578339; 
 Thu, 10 Sep 2026 10:49:38 -0700 (PDT)
Received: from [192.168.68.102] ([177.18.66.131])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-939e8bf9d51sm22669385a.14.2026.09.10.10.49.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Sep 2026 10:49:37 -0700 (PDT)
Message-ID: <f13c7586-1ff0-4c56-8427-f4e961f7de56@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 14:49:33 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 3/5] hw/riscv: server platform reference machine
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 chao.liu@processmission.com, Nutty Liu <nutty.liu@hotmail.com>,
 Sunil V L <sunilvl@oss.qualcomm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20260909210756.1767711-1-daniel.barboza@oss.qualcomm.com>
 <20260909210756.1767711-4-daniel.barboza@oss.qualcomm.com>
 <zvil6c7jl5erlz5g4ukwj7p4x5if7tqkjvkm3lrp2appofd2us@q4ovbwbtpprj>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <zvil6c7jl5erlz5g4ukwj7p4x5if7tqkjvkm3lrp2appofd2us@q4ovbwbtpprj>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PIaaavqC c=1 sm=1 tr=0 ts=6aa2edb4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=CQQxcbsX5Byh3TlVSSGwig==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=g-BEclO_xI7EE9ocZzAA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 2C2r907NfJ0Vndb5m6PtogvH1KmsXph_
X-Proofpoint-ORIG-GUID: 2C2r907NfJ0Vndb5m6PtogvH1KmsXph_
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDIxOCBTYWx0ZWRfX1uR+guFZLDfe
 xa5yIcL8zl3LYOQzIeJ6We3ESmPnx/UkFtGAMc1kNjnElWPmvPmPEXbL98S9GU86JDdoUGhamED
 xMk4dpte6tkKh0rZSEknc6oKuYgidR4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDIxOCBTYWx0ZWRfX+KrpXe5VewDI
 CSDcGB2tesCYEWK6gkE+j3qAOfpKwgqXDxvJbaGaYy+ds/IoC79p1VB0qdt7n95+cYo3JfnJ0KJ
 1Gdgv+gA5BzDwYOIaqNGIbx4duqynA3eRTcOIrUKjmYDU0lyoIbv3zyYDDrqkG3b31epqXAg1a1
 zXph8Po6XuHQ6c+m2VP5cWRQfsannvOBma6FK5W7+Rsvfuo66ZRtyo19fCwVJfOymMILDdBp6je
 k9gsL2ufvg6Kn6OoSas6QqwvEQ5yZ7hCVFBvH51BOLjwAvPO/w6eErDZ+x/jMRlWDLUprityAuX
 kKPRNxAaMtXNwXcL6r/TyWYgVCeegLhPDZ+9g3DxbTb/ddEvs3vK5KwgIeNvjFCYBJICWRCOfau
 JEMxKY9Tb25qhOJEH3yfrFlY+lB680kO/D+g6O8Y8hm+TQksmFW5GBz3uBjDkQjnXQ6WN5IgIyL
 W+mLnrIzctm3gcfPEPw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_05,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100218
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



On 9/10/2026 12:36 PM, Andrew Jones wrote:
> On Wed, Sep 09, 2026 at 06:07:53PM -0300, Daniel Henrique Barboza wrote:
>> diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
>> index d06ac26648..da59eb2155 100644
>> --- a/hw/riscv/Kconfig
>> +++ b/hw/riscv/Kconfig
>> @@ -69,6 +69,22 @@ config RISCV_VIRT
>>       select ACPI
>>       select ACPI_PCI
>>
>> +config RISCV_SERVER_PLATFORM_REF
>> +    bool
>> +    default y
>> +    depends on RISCV64
>> +    imply TPM_TIS_SYSBUS
>> +    select RISCV_NUMA
>> +    select GOLDFISH_RTC
>> +    select PCI
>> +    select PCI_EXPRESS_GENERIC_BRIDGE
>> +    select PFLASH_CFI01
>> +    select SERIAL
> 
> This needs to select SERIAL_MM rather than SERIAL, since the machine calls
> serial_mm_init(). It also directly uses the platform bus, so it needs
> 
>      select PLATFORM_BUS
> 
> The machine also creates an ICH9 AHCI controller, so keeping it would require
> selecting AHCI_ICH9.
> 
> However, SATA is optional for Server Platform v1.0, so I suggest dropping the
> default ICH9 AHCI controller instead. That would also remove the IDE/AHCI
> includes, NUM_SATA_PORTS, the AHCI-specific state, and its initialization.
> The base machine would then have no default storage controller, and users
> could add NVMe explicitly when needed.

I'll play around and see if we can still use SATA + ICH9 via the platform bus.
We'll probably need to update the docs and tests too.

Note that this might imply adding additional stuff to support SATA hotplug as
well.  If the resulting code is more complex than what we have then I'd rather
keep SATA + ich9 by default.

> 
> Likewise, networking hardware is optional, so I suggest dropping the e1000e
> default NIC. pci_init_nic_devices() may remain for explicit -nic requests.

Same as above.

> 
> To make suitable optional devices such as NVMe available, I suggest
> 
>      imply PCIE_DEVICES
> 
> rather than the broader PCI_DEVICES set.
> 
>> +#include "system/kvm.h"
>> +#include "system/qtest.h"
>> +#include "system/tcg.h"
>> +#include "kvm/kvm_riscv.h"
>> +#include "system/tpm.h"
>> +#include "system/qtest.h"
> 
> Duplicate system/qtest.h include.
> 
>> +#define RVSERVER_IRQCHIP_NUM_MSIS 255
>> +#define RVSERVER_IRQCHIP_NUM_SOURCES 96
>> +#define RVSERVER_IRQCHIP_NUM_PRIO_BITS 3
>> +#define RVSERVER_IRQCHIP_MAX_GUESTS_BITS 3
>> +#define RVSERVER_IRQCHIP_MAX_GUESTS \
>> +    ((1U << RVSERVER_IRQCHIP_MAX_GUESTS_BITS) - 1U)
>> +#define RVSERVER_IRQCHIP_DEFAULT_AIA_GUESTS 5
> 
> nit: Please align these definitions with the related definitions above.

I suppose you're talking about aligning the macros.

> Also, the two nearby #error strings have "accomodate" rather than
> "accommodate".
> 
>> +enum {
>> +    RVSERVER_UART0_IRQ = 10,
>> +    RVSERVER_RTC_IRQ = 11,
>> +    RVSERVER_PCIE_IRQ = 32, /* 32 to 35 */
>> +    IOMMU_SYS_IRQ = 36, /* 36 to 39 */
>> +    RVSERVER_PLATFORM_BUS_IRQ = 40, /* 40 to 48 */
>> +};
> 
> RVSERVER_PLATFORM_BUS_NUM_IRQS is 8, so this should say 40 to 47. Please
> also align the assignments.
> 
>> +static const MemMapEntry rvserver_ref_memmap[] = {
>> +    [RVSERVER_DEBUG] =          {        0x0,         0x100 },
> 
> RVSERVER_DEBUG does not appear to be used.
> 
>> +        riscv_aclint_mtimer_create(memmap[RVSERVER_ACLINT].base +
>> +                i * RISCV_ACLINT_DEFAULT_MTIMER_SIZE,
>> +                RISCV_ACLINT_DEFAULT_MTIMER_SIZE,
>> +                base_hartid, hart_count,
>> +                RISCV_ACLINT_DEFAULT_MTIMECMP,
>> +                RISCV_ACLINT_DEFAULT_MTIME,
>> +                RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, true);
> 
> Server SoC v1.0 CTI_010 requires the time CSR to count in units of 1 ns,
> so we should define a machine-specific 1 GHz timebase rather than using
> the 10 MHz virt default, for example
> 
>      #define RVSERVER_ACLINT_TIMEBASE_FREQ 1000000000
> 
> and use RVSERVER_ACLINT_TIMEBASE_FREQ in this call. The CPU FDT
> timebase-frequency property should use
> 
>      kvm_enabled() ? kvm_riscv_get_timebase_frequency(&s->soc->harts[0]) :
>                      RVSERVER_ACLINT_TIMEBASE_FREQ

The FDT code is doing all that, so in the end what we want is just a new
RVSERVER macro with the 1Gb clock.

> 
>> +    if (!rvserver_aclint_allowed()) {
>> +        error_report("'aclint' is only available with TCG acceleration");
>> +        exit(1);
>> +    }
> 
> This makes the machine TCG/qtest only. We can follow virt's support of KVM
> to enable it. The documentation can state that a conformant guest requires
> a conformant host, while allowing nonconformant hosts to be used for
> functional KVM testing.


I don't want to hold upstreaming of the base emulation because of KVM, in particular
because there's a very, very high chance that we do not have KVM support for all the
riscv-server-ref extensions anyway.

My idea is to implement KVM support for this board as a follow-up.  We'll mark it as
"experimental" since we'll boot with a KVM cpu that doesn't have all the required
extensions (again, most likely).

We'll probably need to discuss if we're going to stick with just the "host" CPU type
or if we want a riscv-server-ref type for KVM too.


> 
>> +static void rvserver_ref_machine_instance_init(Object *obj)
>> +{
>> +    RISCVServerRefMachineState *s = RISCV_SERVER_REF_MACHINE(obj);
>> +
>> +    s->flash[0] = riscv_flash_create(OBJECT(s),
>> +                                     "riscv-server-ref.flash0",
>> +                                     "pflash0",
>> +                                     RVSERVER_FLASH_SECTOR_SIZE);
>> +    s->flash[1] = riscv_flash_create(OBJECT(s),
>> +                                     "riscv-server-ref.flash1",
>> +                                     "pflash1",
>> +                                     RVSERVER_FLASH_SECTOR_SIZE);
> 
> virt has an instance finalizer which unreferences either flash device when
> initialization fails before realization. This machine should have the same
> cleanup and set instance_finalize in its TypeInfo.
> 
>> +    static const char * const valid_cpu_types[] = {
>> +        TYPE_RISCV_CPU_RVSERVER_REF,
>> +    };
> 
> This needs a NULL terminator. MachineClass.valid_cpu_types is walked until
> NULL. For example, testing this with "-cpu max" printed:
> 
>      The valid models are: riscv-server-ref, (null), (null)

That's a good catch.

> 
> KVM also needs TYPE_RISCV_CPU_HOST in the valid CPU types.

True.  We'll do it as a follow-up when we're sure which KVM types we're going to
support

Thanks,
Daniel

> 
> Thanks,
> drew


