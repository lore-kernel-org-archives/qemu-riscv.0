Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1grgc1-0007FM-Mx
	for mharc-qemu-riscv@gnu.org; Thu, 07 Feb 2019 05:08:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33931)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1grgby-0007De-W9
	for qemu-riscv@nongnu.org; Thu, 07 Feb 2019 05:08:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1grgby-0007HM-9a
	for qemu-riscv@nongnu.org; Thu, 07 Feb 2019 05:08:50 -0500
Received: from mel.act-europe.fr ([2a02:2ab8:224:1::a0a:d2]:42505
	helo=smtp.eu.adacore.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <chouteau@adacore.com>)
	id 1grgbq-00078J-F1; Thu, 07 Feb 2019 05:08:44 -0500
Received: from localhost (localhost [127.0.0.1])
	by filtered-smtp.eu.adacore.com (Postfix) with ESMTP id 58E2381354;
	Thu,  7 Feb 2019 11:08:27 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at eu.adacore.com
Received: from smtp.eu.adacore.com ([127.0.0.1])
	by localhost (smtp.eu.adacore.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eBhGFvvZgZ6R; Thu,  7 Feb 2019 11:08:27 +0100 (CET)
Received: from [IPv6:2a02:2ab8:224:1:45ad:b40e:ab13:7adb] (unknown
	[IPv6:2a02:2ab8:224:1:45ad:b40e:ab13:7adb])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.eu.adacore.com (Postfix) with ESMTPSA id 6380781386;
	Thu,  7 Feb 2019 11:08:26 +0100 (CET)
To: Alistair Francis <alistair23@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Palmer Dabbelt <palmer@sifive.com>,
	"open list:All patches CC here" <qemu-devel@nongnu.org>,
	Michael Clark <mjc@sifive.com>, Alistair Francis <Alistair.Francis@wdc.com>
References: <20190130185242.12490-1-chouteau@adacore.com>
	<CAKmqyKMNqYBN9ZCESAxfqWSOidjFRhQNofN130MOPDOyRwQ28w@mail.gmail.com>
From: Fabien Chouteau <chouteau@adacore.com>
Message-ID: <5cb673ce-930d-81d5-eb59-d33471f7318b@adacore.com>
Date: Thu, 7 Feb 2019 11:08:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAKmqyKMNqYBN9ZCESAxfqWSOidjFRhQNofN130MOPDOyRwQ28w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 2a02:2ab8:224:1::a0a:d2
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] hw/riscv/sifive_clint.c:
 avoid integer overflow in timecmp write
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
X-List-Received-Date: Thu, 07 Feb 2019 10:08:51 -0000

Hello Alistair,

On 07/02/2019 01:42, Alistair Francis wrote:> 
> Can you describe what this fixes?
> 

I encountered this problem when I tried to write 0xffffffffffffffff in timecmp.

With the integer overflow in QEMU, writing this value means that the QEMU timer
will be set in the past.

> Won't an overflow be ok as we then just wrap around anyway? I guess
> there is a problem if we want a value so large that we wrap around
> past our current time though.
> 

The overflow was in the computation of the value `next_ns`. It is used to set
the QEMU timer:

timer_mod(cpu->env.timer, next_ns);

A negative `next_ns` -because of the overflow- means that the timer
triggers immediately instead of far in the future.

Regards,

