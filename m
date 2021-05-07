Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lezBb-0001r2-La
	for mharc-qemu-riscv@gnu.org; Fri, 07 May 2021 08:02:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konrad.schwarz@siemens.com>)
 id 1lezBZ-0001oT-DO
 for qemu-riscv@nongnu.org; Fri, 07 May 2021 08:02:25 -0400
Received: from gw-eagle1.siemens.com ([194.138.20.72]:13097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konrad.schwarz@siemens.com>)
 id 1lezBT-0002i1-OM
 for qemu-riscv@nongnu.org; Fri, 07 May 2021 08:02:24 -0400
Received: from mail2.dc4ca.siemens.de (mail2.dc4ca.siemens.de [139.25.224.94])
 by gw-eagle1.siemens.com (Postfix) with ESMTPS id CF1204F0120
 for <qemu-riscv@nongnu.org>; Fri,  7 May 2021 14:02:15 +0200 (CEST)
Received: from DEMCHDC8A1A.ad011.siemens.net (sop-solman.siemens.com
 [139.25.226.107])
 by mail2.dc4ca.siemens.de (Postfix) with ESMTPS id 3730C18DDCA65
 for <qemu-riscv@nongnu.org>; Fri,  7 May 2021 14:02:15 +0200 (CEST)
Received: from DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) by
 DEMCHDC8A1A.ad011.siemens.net (139.25.226.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 7 May 2021 14:02:14 +0200
Received: from DEMCHDC8A0A.ad011.siemens.net ([139.25.226.106]) by
 DEMCHDC8A0A.ad011.siemens.net ([139.25.226.106]) with mapi id 15.01.2176.012; 
 Fri, 7 May 2021 14:02:14 +0200
From: "Schwarz, Konrad" <konrad.schwarz@siemens.com>
To: "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Subject: target.xml
Thread-Topic: target.xml
Thread-Index: AddDN2jy/7SLM4voQ+a1yUt6X7i4vw==
Date: Fri, 7 May 2021 12:02:14 +0000
Message-ID: <1261d139a2894b56b344f114c47f93e3@siemens.com>
Accept-Language: en-US, de-DE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Enabled=true;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SetDate=2021-05-07T12:02:13Z; 
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Method=Standard;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Name=restricted-default;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ActionId=bb1c1fc1-2b10-4f1b-a34e-13bdff726438;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ContentBits=0
document_confidentiality: Restricted
x-originating-ip: [139.25.69.216]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=194.138.20.72;
 envelope-from=konrad.schwarz@siemens.com; helo=gw-eagle1.siemens.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 07 May 2021 12:02:25 -0000

Hi,

GDB uses an XML description of a target's registers:
i.e., for RISC-V this comprises
general-purpose, floating-point, control & status,
and "virtual" registers, as described
in the GDB manual.  Normally, this target description
is provided by the GDB server (e.g., QEMU);
GDB should dynamically adjust the machine
registers it understands on the command line
(e.g., $pc, $ra, ...) according to the
target description.  It is also possible
to set the target description manually,
using the
    set tdesc filename .../my-target.xml
command.

The XML target description used by default
between QEMU and GDB is outdated.
I've created a new target description
file that includes floating-point,
user, supervisor, hypervisor,
and virtual supervisor CSRs and
provides definitions for the
fields within the CSRs.

However, I get the error message

warning: Architecture rejected target-supplied description

after my set tdesc filename command.

Does anyone know how to debug this?



