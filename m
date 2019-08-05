Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hufiG-0008G4-2V
	for mharc-qemu-riscv@gnu.org; Mon, 05 Aug 2019 12:19:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34537)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <chouteau@adacore.com>) id 1hufiD-0008Cx-Kb
 for qemu-riscv@nongnu.org; Mon, 05 Aug 2019 12:19:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chouteau@adacore.com>) id 1hufiC-0005zO-N2
 for qemu-riscv@nongnu.org; Mon, 05 Aug 2019 12:19:53 -0400
Received: from mel.act-europe.fr ([194.98.77.210]:53850
 helo=smtp.eu.adacore.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <chouteau@adacore.com>)
 id 1hufi9-0005tF-Ii; Mon, 05 Aug 2019 12:19:50 -0400
Received: from localhost (localhost [127.0.0.1])
 by filtered-smtp.eu.adacore.com (Postfix) with ESMTP id 03435822A4;
 Mon,  5 Aug 2019 18:19:48 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at eu.adacore.com
Received: from smtp.eu.adacore.com ([127.0.0.1])
 by localhost (smtp.eu.adacore.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e5-mnW6rxSHz; Mon,  5 Aug 2019 18:19:47 +0200 (CEST)
Received: from [192.168.0.17] (89-157-139-225.rev.numericable.fr
 [89.157.139.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp.eu.adacore.com (Postfix) with ESMTPSA id D0CF082293;
 Mon,  5 Aug 2019 18:19:46 +0200 (CEST)
To: Bin Meng <bmeng.cn@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>
References: <1558108285-19571-1-git-send-email-bmeng.cn@gmail.com>
 <1558108285-19571-2-git-send-email-bmeng.cn@gmail.com>
 <9338c7b4-6a05-2189-b93d-25cb2bd4dd54@adacore.com>
 <CAEUhbmVEccyET4+MdRVwP=oy0TNdU2qc2T=2cbxKsTyngpnFgQ@mail.gmail.com>
From: Fabien Chouteau <chouteau@adacore.com>
Message-ID: <36d947f0-af1e-fbee-05e3-48edda6e7a2e@adacore.com>
Date: Mon, 5 Aug 2019 18:19:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmVEccyET4+MdRVwP=oy0TNdU2qc2T=2cbxKsTyngpnFgQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 194.98.77.210
Subject: Re: [Qemu-riscv] [PATCH 2/2] riscv: sifive_u: Update the plic hart
 config to support multicore
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
X-List-Received-Date: Mon, 05 Aug 2019 16:19:54 -0000

On 05/08/2019 18:10, Bin Meng wrote:
> Thank you for the suggestion. A patch was created for this:
> http://patchwork.ozlabs.org/patch/1142282/

Awesome, thank you Bin!


