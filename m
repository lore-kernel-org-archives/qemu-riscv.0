Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h8qCX-0007cg-Dq
	for mharc-qemu-riscv@gnu.org; Tue, 26 Mar 2019 13:49:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50117)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1h8qCR-0007bH-Pu
	for qemu-riscv@nongnu.org; Tue, 26 Mar 2019 13:49:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1h8qCP-0003VH-Rk
	for qemu-riscv@nongnu.org; Tue, 26 Mar 2019 13:49:23 -0400
Received: from mel.act-europe.fr ([194.98.77.210]:39744
	helo=smtp.eu.adacore.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <chouteau@adacore.com>)
	id 1h8qCL-0003Sx-Tr; Tue, 26 Mar 2019 13:49:19 -0400
Received: from localhost (localhost [127.0.0.1])
	by filtered-smtp.eu.adacore.com (Postfix) with ESMTP id DB6BD81388;
	Tue, 26 Mar 2019 18:49:14 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at eu.adacore.com
Received: from smtp.eu.adacore.com ([127.0.0.1])
	by localhost (smtp.eu.adacore.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R-p18HPnzztF; Tue, 26 Mar 2019 18:49:14 +0100 (CET)
Received: from [192.168.42.81] (unknown [37.171.27.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.eu.adacore.com (Postfix) with ESMTPSA id 9BC5B81368;
	Tue, 26 Mar 2019 18:49:13 +0100 (CET)
To: Palmer Dabbelt <palmer@sifive.com>
Cc: mjc@sifive.com, Alistair Francis <Alistair.Francis@wdc.com>,
	sagark@eecs.berkeley.edu, Bastian Koppelmann
	<kbastian@mail.uni-paderborn.de>,
	"open list:All patches CC here" <qemu-devel@nongnu.org>,
	"open list:RISC-V" <qemu-riscv@nongnu.org>
References: <mhng-b7fc143c-a6ed-4d8b-93b5-eeff60013c81@palmer-si-x1c4>
From: Fabien Chouteau <chouteau@adacore.com>
Message-ID: <a5ad2b8f-2c0d-b813-84eb-d85d1a59b87a@adacore.com>
Date: Tue, 26 Mar 2019 18:49:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <mhng-b7fc143c-a6ed-4d8b-93b5-eeff60013c81@palmer-si-x1c4>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 194.98.77.210
Subject: Re: [Qemu-riscv] [PATCH] SiFive RISC-V GPIO Device
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Mar 2019 17:49:24 -0000

Hi Palmer,

On 26/03/2019 09:58, Palmer Dabbelt wrote:
> Do you have anything that actually glues this to a machine so I can test it?
> 

In this patch I do instantiate the device in sifive_e machine.

Regards,

