Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E1EC4332F
	for <qemu-riscv@archiver.kernel.org>; Tue, 31 Oct 2023 13:26:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qxoky-0005uh-LZ; Tue, 31 Oct 2023 09:26:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1qxokr-0005t4-L9; Tue, 31 Oct 2023 09:26:01 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1qxoko-0002R4-Mw; Tue, 31 Oct 2023 09:26:01 -0400
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39VDEbG4026743; Tue, 31 Oct 2023 13:25:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=hc8R2gfiqsaq0cyFzj8pdKWhc031UnTsawzfIo+qWTw=;
 b=XGcBojEXjuUz1E8H9kjvESw1gDFo05w78FqJEvEqHhqLsYGyp75eISZntqpaicqHxhl+
 zDeF7QczmdXRBk1Jr9EQFcwx2x5UZuNNLtl+j9e9oC1RQ5rm2rF7CJZ5fiIoeDUDMuPb
 OUoFyu9AIc2krEDdiUA9lll/MqDNwO/YUKWDR3GlM/gBMzLca38/laN0RML3oMSlkIpS
 37w1gjGMnr7UUEuByGDtnLUkiAfb3aXfjQ8OdhnkChh40uRkZ6B1Kqjq2dW70GaGn7dt
 bQ3TtQfmI8SyelZ4mvfY1g9jUbmiuaPOGXWwJrS4wU3jqO0sXezw9W7IVrBOJmOQxgnx 5Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3u329s8ec5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 Oct 2023 13:25:42 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39VDFf9v031753;
 Tue, 31 Oct 2023 13:25:42 GMT
Received: from ppma11.dal12v.mail.ibm.com
 (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3u329s8ebp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 Oct 2023 13:25:42 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
 by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 39VCVScA031403; Tue, 31 Oct 2023 13:25:41 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
 by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3u1fb203q1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 Oct 2023 13:25:41 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com
 [10.241.53.104])
 by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 39VDPe3p19006158
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 31 Oct 2023 13:25:40 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0C2745806F;
 Tue, 31 Oct 2023 13:25:40 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 177C358052;
 Tue, 31 Oct 2023 13:25:39 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTPS;
 Tue, 31 Oct 2023 13:25:39 +0000 (GMT)
Message-ID: <3062b244-4f9c-4359-8001-f4ec738f863f@linux.ibm.com>
Date: Tue, 31 Oct 2023 09:25:38 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/14] tpm_crb_sysbus: introduce TPM CRB SysBus device
Content-Language: en-US
To: Joelle van Dyne <j@getutm.app>, qemu-devel@nongnu.org
Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
References: <20231031040021.65582-1-j@getutm.app>
 <20231031040021.65582-12-j@getutm.app>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20231031040021.65582-12-j@getutm.app>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: l0o6sHGmJ19Vpv3W67chLq2N_i1Ypp4P
X-Proofpoint-ORIG-GUID: Ny01uTuNcyzi7e7lohIlEv3q-HM1U4FL
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-31_01,2023-10-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0
 mlxscore=0 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2310240000
 definitions=main-2310310106
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


On 10/31/23 00:00, Joelle van Dyne wrote:
> This SysBus variant of the CRB interface supports dynamically locating
> the MMIO interface so that Virt machines can use it. This interface
> is currently the only one supported by QEMU that works on Windows 11
> ARM64 as 'tpm-tis-device' does not work with current Windows drivers.
> We largely follow that device as a template.
>
> To try out this device with Windows 11 before OVMF is updated, you
> will need to modify `sysbus-fdt.c` and change the added line from:
>
> ```c
>      TYPE_BINDING(TYPE_TPM_CRB_SYSBUS, no_fdt_node),
> ```
>
> to
>
> ```c
>      TYPE_BINDING(TYPE_TPM_CRB_SYSBUS, add_tpm_tis_fdt_node),
> ```
>
> This change was not included because it can confuse Linux (although
> from testing, it seems like Linux is able to properly ignore the
> device from the TPM TIS driver and recognize it from the ACPI device
> in the TPM CRB driver). A proper fix would require OVMF to recognize
> the ACPI device and not depend on the FDT node for recognizing TPM.
>
> The command line to try out this device with SWTPM is:
>
> ```
> $ qemu-system-aarch64 \
>      -chardev socket,id=chrtpm0,path=tpm.sock \
>      -tpmdev emulator,id=tpm0,chardev=chrtpm0 \
>      -device tpm-crb-device,tpmdev=tpm0
> ```
>
> along with SWTPM:
>
> ```
> $ swtpm \
>      --ctrl type=unixio,path=tpm.sock,terminate \
>      --tpmstate backend-uri=file://tpm.data \
>      --tpm2
> ```
>
> Signed-off-by: Joelle van Dyne <j@getutm.app>

I wonder whether we will get someone to test this on loongarch and/or riscv.

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>


> ---
>   docs/specs/tpm.rst      |   1 +
>   include/sysemu/tpm.h    |   3 +
>   hw/acpi/aml-build.c     |   7 +-
>   hw/arm/virt.c           |   1 +
>   hw/core/sysbus-fdt.c    |   1 +
>   hw/loongarch/virt.c     |   1 +
>   hw/riscv/virt.c         |   1 +
>   hw/tpm/tpm_crb_sysbus.c | 162 ++++++++++++++++++++++++++++++++++++++++
>   hw/arm/Kconfig          |   1 +
>   hw/loongarch/Kconfig    |   1 +
>   hw/riscv/Kconfig        |   1 +
>   hw/tpm/Kconfig          |   5 ++
>   hw/tpm/meson.build      |   3 +
>   13 files changed, 187 insertions(+), 1 deletion(-)
>   create mode 100644 hw/tpm/tpm_crb_sysbus.c
>
> diff --git a/docs/specs/tpm.rst b/docs/specs/tpm.rst
> index 2bc29c9804..95aeb49220 100644
> --- a/docs/specs/tpm.rst
> +++ b/docs/specs/tpm.rst
> @@ -46,6 +46,7 @@ operating system.
>   QEMU files related to TPM CRB interface:
>    - ``hw/tpm/tpm_crb.c``
>    - ``hw/tpm/tpm_crb_common.c``
> + - ``hw/tpm/tpm_crb_sysbus.c``
>
>   SPAPR interface
>   ---------------
> diff --git a/include/sysemu/tpm.h b/include/sysemu/tpm.h
> index ffd300e607..bab30fa546 100644
> --- a/include/sysemu/tpm.h
> +++ b/include/sysemu/tpm.h
> @@ -49,6 +49,7 @@ struct TPMIfClass {
>   #define TYPE_TPM_TIS_ISA            "tpm-tis"
>   #define TYPE_TPM_TIS_SYSBUS         "tpm-tis-device"
>   #define TYPE_TPM_CRB                "tpm-crb"
> +#define TYPE_TPM_CRB_SYSBUS         "tpm-crb-device"
>   #define TYPE_TPM_SPAPR              "tpm-spapr"
>   #define TYPE_TPM_TIS_I2C            "tpm-tis-i2c"
>
> @@ -58,6 +59,8 @@ struct TPMIfClass {
>       object_dynamic_cast(OBJECT(chr), TYPE_TPM_TIS_SYSBUS)
>   #define TPM_IS_CRB(chr)                             \
>       object_dynamic_cast(OBJECT(chr), TYPE_TPM_CRB)
> +#define TPM_IS_CRB_SYSBUS(chr)                      \
> +    object_dynamic_cast(OBJECT(chr), TYPE_TPM_CRB_SYSBUS)
>   #define TPM_IS_SPAPR(chr)                           \
>       object_dynamic_cast(OBJECT(chr), TYPE_TPM_SPAPR)
>   #define TPM_IS_TIS_I2C(chr)                      \
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index af66bde0f5..acc654382e 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -31,6 +31,7 @@
>   #include "hw/pci/pci_bus.h"
>   #include "hw/pci/pci_bridge.h"
>   #include "qemu/cutils.h"
> +#include "qom/object.h"
>
>   static GArray *build_alloc_array(void)
>   {
> @@ -2218,7 +2219,7 @@ void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
>   {
>       uint8_t start_method_params[12] = {};
>       unsigned log_addr_offset;
> -    uint64_t control_area_start_address;
> +    uint64_t baseaddr, control_area_start_address;
>       TPMIf *tpmif = tpm_find();
>       uint32_t start_method;
>       AcpiTable table = { .sig = "TPM2", .rev = 4,
> @@ -2236,6 +2237,10 @@ void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
>       } else if (TPM_IS_CRB(tpmif)) {
>           control_area_start_address = TPM_CRB_ADDR_CTRL;
>           start_method = TPM2_START_METHOD_CRB;
> +    } else if (TPM_IS_CRB_SYSBUS(tpmif)) {
> +        baseaddr = object_property_get_uint(OBJECT(tpmif), "x-baseaddr", NULL);
> +        control_area_start_address = baseaddr + A_CRB_CTRL_REQ;
> +        start_method = TPM2_START_METHOD_CRB;
>       } else {
>           g_assert_not_reached();
>       }
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index f1a161b0ea..22e147f71a 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2950,6 +2950,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>       machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_PLATFORM);
>   #ifdef CONFIG_TPM
>       machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_TIS_SYSBUS);
> +    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_CRB_SYSBUS);
>   #endif
>       mc->block_default_type = IF_VIRTIO;
>       mc->no_cdrom = 1;
> diff --git a/hw/core/sysbus-fdt.c b/hw/core/sysbus-fdt.c
> index eebcd28f9a..9c783f88eb 100644
> --- a/hw/core/sysbus-fdt.c
> +++ b/hw/core/sysbus-fdt.c
> @@ -493,6 +493,7 @@ static const BindingEntry bindings[] = {
>   #endif
>   #ifdef CONFIG_TPM
>       TYPE_BINDING(TYPE_TPM_TIS_SYSBUS, add_tpm_tis_fdt_node),
> +    TYPE_BINDING(TYPE_TPM_CRB_SYSBUS, no_fdt_node),
>   #endif
>       TYPE_BINDING(TYPE_RAMFB_DEVICE, no_fdt_node),
>       TYPE_BINDING("", NULL), /* last element */
> diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
> index feed0f8bbf..9d5ad2bc8e 100644
> --- a/hw/loongarch/virt.c
> +++ b/hw/loongarch/virt.c
> @@ -1114,6 +1114,7 @@ static void loongarch_class_init(ObjectClass *oc, void *data)
>       machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
>   #ifdef CONFIG_TPM
>       machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_TIS_SYSBUS);
> +    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_CRB_SYSBUS);
>   #endif
>   }
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 9de578c756..c0d2cd1d60 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1702,6 +1702,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>       machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
>   #ifdef CONFIG_TPM
>       machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_TIS_SYSBUS);
> +    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_CRB_SYSBUS);
>   #endif
>
>
> diff --git a/hw/tpm/tpm_crb_sysbus.c b/hw/tpm/tpm_crb_sysbus.c
> new file mode 100644
> index 0000000000..7edeae3665
> --- /dev/null
> +++ b/hw/tpm/tpm_crb_sysbus.c
> @@ -0,0 +1,162 @@
> +/*
> + * tpm_crb_sysbus.c - QEMU's TPM CRB interface emulator
> + *
> + * Copyright (c) 2018 Red Hat, Inc.
> + *
> + * Authors:
> + *   Marc-André Lureau <marcandre.lureau@redhat.com>
> + *   Joelle van Dyne <j@getutm.app>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + *
> + * tpm_crb is a device for TPM 2.0 Command Response Buffer (CRB) Interface
> + * as defined in TCG PC Client Platform TPM Profile (PTP) Specification
> + * Family “2.0” Level 00 Revision 01.03 v22
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/acpi/acpi_aml_interface.h"
> +#include "hw/acpi/tpm.h"
> +#include "hw/qdev-properties.h"
> +#include "migration/vmstate.h"
> +#include "tpm_prop.h"
> +#include "hw/sysbus.h"
> +#include "qapi/visitor.h"
> +#include "qom/object.h"
> +#include "sysemu/tpm_util.h"
> +#include "trace.h"
> +#include "tpm_crb.h"
> +
> +struct TPMCRBStateSysBus {
> +    /*< private >*/
> +    SysBusDevice parent_obj;
> +
> +    /*< public >*/
> +    TPMCRBState state;
> +    uint64_t baseaddr;
> +    uint64_t size;
> +};
> +
> +OBJECT_DECLARE_SIMPLE_TYPE(TPMCRBStateSysBus, TPM_CRB_SYSBUS)
> +
> +static void tpm_crb_sysbus_request_completed(TPMIf *ti, int ret)
> +{
> +    TPMCRBStateSysBus *s = TPM_CRB_SYSBUS(ti);
> +
> +    return tpm_crb_request_completed(&s->state, ret);
> +}
> +
> +static enum TPMVersion tpm_crb_sysbus_get_tpm_version(TPMIf *ti)
> +{
> +    TPMCRBStateSysBus *s = TPM_CRB_SYSBUS(ti);
> +
> +    return tpm_crb_get_version(&s->state);
> +}
> +
> +static int tpm_crb_sysbus_pre_save(void *opaque)
> +{
> +    TPMCRBStateSysBus *s = opaque;
> +
> +    return tpm_crb_pre_save(&s->state);
> +}
> +
> +static const VMStateDescription vmstate_tpm_crb_sysbus = {
> +    .name = "tpm-crb-sysbus",
> +    .pre_save = tpm_crb_sysbus_pre_save,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_END_OF_LIST(),
> +    }
> +};
> +
> +static Property tpm_crb_sysbus_properties[] = {
> +    DEFINE_PROP_TPMBE("tpmdev", TPMCRBStateSysBus, state.tpmbe),
> +    DEFINE_PROP_UINT64("x-baseaddr", TPMCRBStateSysBus,
> +                       baseaddr, TPM_CRB_ADDR_BASE),
> +    DEFINE_PROP_UINT64("x-size", TPMCRBStateSysBus,
> +                       size, TPM_CRB_ADDR_SIZE),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void tpm_crb_sysbus_initfn(Object *obj)
> +{
> +    TPMCRBStateSysBus *s = TPM_CRB_SYSBUS(obj);
> +
> +    tpm_crb_init_memory(obj, &s->state, NULL);
> +
> +    vmstate_register_ram(&s->state.mmio, DEVICE(obj));
> +
> +    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->state.mmio);
> +}
> +
> +static void tpm_crb_sysbus_reset(DeviceState *dev)
> +{
> +    TPMCRBStateSysBus *s = TPM_CRB_SYSBUS(dev);
> +
> +    return tpm_crb_reset(&s->state, s->baseaddr);
> +}
> +
> +static void tpm_crb_sysbus_realizefn(DeviceState *dev, Error **errp)
> +{
> +    TPMCRBStateSysBus *s = TPM_CRB_SYSBUS(dev);
> +
> +    if (!tpm_find()) {
> +        error_setg(errp, "at most one TPM device is permitted");
> +        return;
> +    }
> +
> +    if (!s->state.tpmbe) {
> +        error_setg(errp, "'tpmdev' property is required");
> +        return;
> +    }
> +
> +    if (tpm_crb_sysbus_get_tpm_version(TPM_IF(s)) != TPM_VERSION_2_0) {
> +        error_setg(errp, "TPM CRB only supports TPM 2.0 backends");
> +        return;
> +    }
> +}
> +
> +static void build_tpm_crb_sysbus_aml(AcpiDevAmlIf *adev, Aml *scope)
> +{
> +    TPMCRBStateSysBus *s = TPM_CRB_SYSBUS(adev);
> +
> +    tpm_crb_build_aml(TPM_IF(adev), scope, s->baseaddr, s->size, false);
> +}
> +
> +static void tpm_crb_sysbus_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    TPMIfClass *tc = TPM_IF_CLASS(klass);
> +    AcpiDevAmlIfClass *adevc = ACPI_DEV_AML_IF_CLASS(klass);
> +
> +    device_class_set_props(dc, tpm_crb_sysbus_properties);
> +    dc->vmsd  = &vmstate_tpm_crb_sysbus;
> +    tc->model = TPM_MODEL_TPM_CRB;
> +    dc->realize = tpm_crb_sysbus_realizefn;
> +    dc->user_creatable = true;
> +    dc->reset = tpm_crb_sysbus_reset;
> +    tc->request_completed = tpm_crb_sysbus_request_completed;
> +    tc->get_version = tpm_crb_sysbus_get_tpm_version;
> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> +    adevc->build_dev_aml = build_tpm_crb_sysbus_aml;
> +}
> +
> +static const TypeInfo tpm_crb_sysbus_info = {
> +    .name = TYPE_TPM_CRB_SYSBUS,
> +    .parent = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(TPMCRBStateSysBus),
> +    .instance_init = tpm_crb_sysbus_initfn,
> +    .class_init  = tpm_crb_sysbus_class_init,
> +    .interfaces = (InterfaceInfo[]) {
> +        { TYPE_TPM_IF },
> +        { TYPE_ACPI_DEV_AML_IF },
> +        { }
> +    }
> +};
> +
> +static void tpm_crb_sysbus_register(void)
> +{
> +    type_register_static(&tpm_crb_sysbus_info);
> +}
> +
> +type_init(tpm_crb_sysbus_register)
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 7e68348440..efe1beaa7b 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -5,6 +5,7 @@ config ARM_VIRT
>       imply VFIO_AMD_XGBE
>       imply VFIO_PLATFORM
>       imply VFIO_XGMAC
> +    imply TPM_CRB_SYSBUS
>       imply TPM_TIS_SYSBUS
>       imply TPM_TIS_I2C
>       imply NVDIMM
> diff --git a/hw/loongarch/Kconfig b/hw/loongarch/Kconfig
> index 25da190ffc..70544f3ce5 100644
> --- a/hw/loongarch/Kconfig
> +++ b/hw/loongarch/Kconfig
> @@ -6,6 +6,7 @@ config LOONGARCH_VIRT
>       imply PCI_DEVICES
>       imply NVDIMM
>       imply TPM_TIS_SYSBUS
> +    imply TPM_CRB_SYSBUS
>       select SERIAL
>       select VIRTIO_PCI
>       select PLATFORM_BUS
> diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
> index b6a5eb4452..d824cb58f9 100644
> --- a/hw/riscv/Kconfig
> +++ b/hw/riscv/Kconfig
> @@ -29,6 +29,7 @@ config RISCV_VIRT
>       imply PCI_DEVICES
>       imply VIRTIO_VGA
>       imply TEST_DEVICES
> +    imply TPM_CRB_SYSBUS
>       imply TPM_TIS_SYSBUS
>       select RISCV_NUMA
>       select GOLDFISH_RTC
> diff --git a/hw/tpm/Kconfig b/hw/tpm/Kconfig
> index a46663288c..28139c456a 100644
> --- a/hw/tpm/Kconfig
> +++ b/hw/tpm/Kconfig
> @@ -25,6 +25,11 @@ config TPM_CRB
>       depends on TPM && PC
>       select TPM_BACKEND
>
> +config TPM_CRB_SYSBUS
> +    bool
> +    depends on TPM
> +    select TPM_BACKEND
> +
>   config TPM_SPAPR
>       bool
>       default y
> diff --git a/hw/tpm/meson.build b/hw/tpm/meson.build
> index 3060ac05e8..f2536c99e3 100644
> --- a/hw/tpm/meson.build
> +++ b/hw/tpm/meson.build
> @@ -5,6 +5,9 @@ system_ss.add(when: 'CONFIG_TPM_TIS_SYSBUS', if_true: files('tpm-sysbus.c'))
>   system_ss.add(when: 'CONFIG_TPM_TIS_I2C', if_true: files('tpm_tis_i2c.c'))
>   system_ss.add(when: 'CONFIG_TPM_CRB', if_true: files('tpm_crb.c'))
>   system_ss.add(when: 'CONFIG_TPM_CRB', if_true: files('tpm_crb_common.c'))
> +system_ss.add(when: 'CONFIG_TPM_CRB_SYSBUS', if_true: files('tpm_crb_sysbus.c'))
> +system_ss.add(when: 'CONFIG_TPM_CRB_SYSBUS', if_true: files('tpm_crb_common.c'))
> +system_ss.add(when: 'CONFIG_TPM_CRB_SYSBUS', if_true: files('tpm-sysbus.c'))
>   system_ss.add(when: 'CONFIG_TPM_TIS', if_true: files('tpm_ppi.c'))
>   system_ss.add(when: 'CONFIG_TPM_CRB', if_true: files('tpm_ppi.c'))
>

