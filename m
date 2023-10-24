Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE1EC00A8F
	for <qemu-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 11:34:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qvFfw-0002Qz-Ch; Tue, 24 Oct 2023 07:34:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_llindhol@quicinc.com>)
 id 1qvFff-0002Fh-05; Tue, 24 Oct 2023 07:34:04 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_llindhol@quicinc.com>)
 id 1qvFfb-0003XM-SE; Tue, 24 Oct 2023 07:34:02 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39OBFruY030894; Tue, 24 Oct 2023 11:32:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=SDdDuTaN4SoAWEpM2HKbvwWC/AnVWG6bKPnln/BNFPM=;
 b=Nbu7HyH4d39Kp0iB+z//t5OAGEFCvePvI+VCVMlCc+A7pp3g8W6L2lEyt7AwENfe6nHN
 BrYi2YgU5WbLlrm6dE8GwNVxLUxPgxkTC7gWf3vqjhSe210N6jeS+HZjP5aN9yKaMW+0
 gE7Els2Ns4ZmsjMkSSrnufM4WwKkLJlV1QSsCJuYhmoMNj4MbZNivxoc4gFAB9nVe/RY
 /mgRqddLohVGW71+h2kfx/u2OWkX3hK3IyGkqFd8guImMqyUoOGknoNDjFSKRrtaN84p
 j3u7VrYEz5a6kTH7TL3iJQlF8qKQqVWyxADB7qLLYF6pAU1a3icvvfco/5ptP25ft3eO Rg== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3twxw5hgfg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Oct 2023 11:32:26 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
 by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39OBWP59014241
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Oct 2023 11:32:25 GMT
Received: from qc-i7.hemma.eciton.net (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Tue, 24 Oct 2023 04:32:11 -0700
Date: Tue, 24 Oct 2023 12:32:08 +0100
From: Leif Lindholm <quic_llindhol@quicinc.com>
To: David Woodhouse <dwmw2@infradead.org>
CC: <qemu-devel@nongnu.org>, Richard Henderson <richard.henderson@linaro.org>, 
 Beniamino Galvani <b.galvani@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>, Strahinja Jankovic
 <strahinja.p.jankovic@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Andrew Jeffery
 <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, Igor Mitsyanko
 <i.mitsyanko@gmail.com>, Jean-Christophe Dubois <jcd@tribudubois.net>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Rob Herring <robh@kernel.org>, Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>, Tyrone Ting <kfting@nuvoton.com>,
 Hao Wu <wuhaotsh@google.com>, Radoslaw Biernacki <rad@semihalf.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Alistair Francis
 <alistair@alistair23.me>, Helge Deller <deller@gmx.de>, Paolo Bonzini
 <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, "Michael S.
 Tsirkin" <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Song Gao <gaosong@loongson.cn>, Thomas Huth <huth@tuxfamily.org>, Laurent
 Vivier <laurent@vivier.eu>, Huacai Chen <chenhuacai@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, =?iso-8859-1?Q?Herv=E9?= Poussineau
 <hpoussin@reactos.org>, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jason Wang <jasowang@redhat.com>, Jia Liu <proljc@gmail.com>,
 Stafford Horne <shorne@gmail.com>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, David Gibson
 <david@gibson.dropbear.id.au>, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, Yoshinori
 Sato <ysato@users.sourceforge.jp>, Magnus Damm <magnus.damm@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, Paul
 Durrant <paul@xen.org>, Max Filippov <jcmvbkbc@gmail.com>,
 <qemu-arm@nongnu.org>, <qemu-ppc@nongnu.org>, <qemu-riscv@nongnu.org>,
 <qemu-s390x@nongnu.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 08/45] hw/arm/sbsa-ref: use pci_init_nic_devices()
Message-ID: <ZTerOM9bc5B8v/cc@qc-i7.hemma.eciton.net>
References: <20231022155200.436340-1-dwmw2@infradead.org>
 <20231022155200.436340-9-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231022155200.436340-9-dwmw2@infradead.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: dizOLerF3W9Ktgo_lllh00WJGa4VFPrs
X-Proofpoint-GUID: dizOLerF3W9Ktgo_lllh00WJGa4VFPrs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-24_11,2023-10-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 mlxscore=0 bulkscore=0 impostorscore=0 phishscore=0
 mlxlogscore=781 priorityscore=1501 suspectscore=0 clxscore=1011
 adultscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2310170001 definitions=main-2310240097
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

On Sun, Oct 22, 2023 at 16:51:23 +0100, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>

Reviewed-by: Leif Lindholm <quic_llindhol@quicinc.com>

> ---
>  hw/arm/sbsa-ref.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index 3c7dfcd6dc..582a28ce92 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -691,9 +691,7 @@ static void create_pcie(SBSAMachineState *sms)
>  
>      pci = PCI_HOST_BRIDGE(dev);
>      if (pci->bus) {
> -        for (i = 0; i < nb_nics; i++) {
> -            pci_nic_init_nofail(&nd_table[i], pci->bus, mc->default_nic, NULL);
> -        }
> +        pci_init_nic_devices(pci->bus, mc->default_nic);
>      }
>  
>      pci_create_simple(pci->bus, -1, "bochs-display");
> -- 
> 2.40.1
> 

