Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CBBEEC8738
	for <qemu-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 16:15:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qeHf9-0007gM-QM; Thu, 07 Sep 2023 12:15:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_llindhol@quicinc.com>)
 id 1qeHf8-0007fH-0D; Thu, 07 Sep 2023 12:15:22 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_llindhol@quicinc.com>)
 id 1qeHf5-0006lA-9K; Thu, 07 Sep 2023 12:15:21 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 387EEZJU012188; Thu, 7 Sep 2023 16:12:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=qRbYx2iqphiH2TpnRUdKhiIY1QPLiz2ghwSFbKB7rtw=;
 b=NmuJsGzrgcaL4kKZqUmFBl7MhVFSJcacruF2KLkD0x+TR9r8a890BJgyPVJFMlZ/iS85
 Zks7fb2ZpDUGZpEVfnx3W/nFJUgGEKy0jhnxYlrsgnhLjq/NfF3dWhRVucLN5jMiZpq2
 HWljWqWQmMMRMQFU7MDslHoC5TPMi2+rOQyiVQaJFTPDwYI616qPV7bCtbD5oYL3zlbz
 WBuVEQwMbQu1np1mHyGKWuE9ra3wOhEF/FhHao2Tf0p/TxnxCeJuIgSqUZy+MFEsgNCq
 vzOaovtW+HfshvjuENy6wNSNFOAZ7gCmyKX3FTECGdNLWZvWLylB7UiVUS88pDWqHunV FA== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sxxbbjcsy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Sep 2023 16:12:50 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
 by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 387GCmVA010116
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 7 Sep 2023 16:12:48 GMT
Received: from qc-i7.hemma.eciton.net (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Thu, 7 Sep 2023 09:12:37 -0700
Date: Thu, 7 Sep 2023 17:12:33 +0100
From: Leif Lindholm <quic_llindhol@quicinc.com>
To: Gavin Shan <gshan@redhat.com>
CC: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, <qemu-riscv@nongnu.org>,
 <qemu-ppc@nongnu.org>, <qemu-s390x@nongnu.org>, <imp@bsdimp.com>,
 <kevans@freebsd.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>,
 <wangyanan55@huawei.com>, <peter.maydell@linaro.org>,
 <b.galvani@gmail.com>, <strahinja.p.jankovic@gmail.com>,
 <sundeep.lkml@gmail.com>, <kfting@nuvoton.com>, <wuhaotsh@google.com>,
 <nieklinnenbank@gmail.com>, <rad@semihalf.com>,
 <marcin.juszkiewicz@linaro.org>, <laurent@vivier.eu>,
 <vijai@behindbytes.com>, <palmer@dabbelt.com>,
 <alistair.francis@wdc.com>, <bin.meng@windriver.com>,
 <liweiwei@iscas.ac.cn>, <dbarboza@ventanamicro.com>,
 <zhiwei_liu@linux.alibaba.com>, <richard.henderson@linaro.org>,
 <mrolnik@gmail.com>, <edgar.iglesias@gmail.com>, <bcain@quicinc.com>,
 <gaosong@loongson.cn>, <yangxiaojuan@loongson.cn>,
 <aurelien@aurel32.net>, <jiaxun.yang@flygoat.com>,
 <aleksandar.rikalo@syrmia.com>, <chenhuacai@kernel.org>,
 <crwulff@gmail.com>, <marex@denx.de>, <shorne@gmail.com>,
 <clg@kaod.org>, <david@gibson.dropbear.id.au>, <groug@kaod.org>,
 <npiggin@gmail.com>, <ysato@users.sourceforge.jp>, <david@redhat.com>,
 <thuth@redhat.com>, <iii@linux.ibm.com>,
 <mark.cave-ayland@ilande.co.uk>, <atar4qemu@gmail.com>,
 <kbastian@mail.uni-paderborn.de>, <jcmvbkbc@gmail.com>,
 <pbonzini@redhat.com>, <imammedo@redhat.com>, <shan.gavin@gmail.com>
Subject: Re: [PATCH v3 30/32] hw/arm/sbsa-ref: Check CPU type in
 machine_run_board_init()
Message-ID: <ZPn2cYH7F3nr+fkh@qc-i7.hemma.eciton.net>
References: <20230907003553.1636896-1-gshan@redhat.com>
 <20230907003553.1636896-31-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230907003553.1636896-31-gshan@redhat.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 0O5hPlhy_KEh1MkJsqNiG1L1hT_7N0t8
X-Proofpoint-GUID: 0O5hPlhy_KEh1MkJsqNiG1L1hT_7N0t8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-07_08,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 mlxlogscore=999 clxscore=1011 bulkscore=0
 suspectscore=0 spamscore=0 adultscore=0 mlxscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2308100000 definitions=main-2309070144
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=quic_llindhol@quicinc.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On Thu, Sep 07, 2023 at 10:35:51 +1000, Gavin Shan wrote:
> Set mc->valid_cpu_types so that the user specified CPU type can
> be validated in machine_run_board_init(). We needn't to do it
> by ourselves.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>

Reviewed-by: Leif Lindholm <quic_llindhol@quicinc.com>

> ---
>  hw/arm/sbsa-ref.c | 21 +++------------------
>  1 file changed, 3 insertions(+), 18 deletions(-)
> 
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index bc89eb4806..f24be53ea2 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -149,26 +149,15 @@ static const int sbsa_ref_irqmap[] = {
>      [SBSA_GWDT_WS0] = 16,
>  };
>  
> -static const char * const valid_cpus[] = {
> +static const char * const valid_cpu_types[] = {
>      ARM_CPU_TYPE_NAME("cortex-a57"),
>      ARM_CPU_TYPE_NAME("cortex-a72"),
>      ARM_CPU_TYPE_NAME("neoverse-n1"),
>      ARM_CPU_TYPE_NAME("neoverse-v1"),
>      ARM_CPU_TYPE_NAME("max"),
> +    NULL,
>  };
>  
> -static bool cpu_type_valid(const char *cpu)
> -{
> -    int i;
> -
> -    for (i = 0; i < ARRAY_SIZE(valid_cpus); i++) {
> -        if (strcmp(cpu, valid_cpus[i]) == 0) {
> -            return true;
> -        }
> -    }
> -    return false;
> -}
> -
>  static uint64_t sbsa_ref_cpu_mp_affinity(SBSAMachineState *sms, int idx)
>  {
>      uint8_t clustersz = ARM_DEFAULT_CPUS_PER_CLUSTER;
> @@ -730,11 +719,6 @@ static void sbsa_ref_init(MachineState *machine)
>      const CPUArchIdList *possible_cpus;
>      int n, sbsa_max_cpus;
>  
> -    if (!cpu_type_valid(machine->cpu_type)) {
> -        error_report("sbsa-ref: CPU type %s not supported", machine->cpu_type);
> -        exit(1);
> -    }
> -
>      if (kvm_enabled()) {
>          error_report("sbsa-ref: KVM is not supported for this machine");
>          exit(1);
> @@ -899,6 +883,7 @@ static void sbsa_ref_class_init(ObjectClass *oc, void *data)
>      mc->init = sbsa_ref_init;
>      mc->desc = "QEMU 'SBSA Reference' ARM Virtual Machine";
>      mc->default_cpu_type = ARM_CPU_TYPE_NAME("neoverse-n1");
> +    mc->valid_cpu_types = valid_cpu_types;
>      mc->max_cpus = 512;
>      mc->pci_allow_0_address = true;
>      mc->minimum_page_bits = 12;
> -- 
> 2.41.0
> 

