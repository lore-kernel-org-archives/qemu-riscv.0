Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtxjW-00043I-7s
	for mharc-qemu-riscv@gnu.org; Wed, 13 Feb 2019 11:50:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48403)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1gtxjT-00040N-LE
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 11:50:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1gtxjS-0001gm-Se
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 11:49:59 -0500
Received: from mel.act-europe.fr ([194.98.77.210]:58091
	helo=smtp.eu.adacore.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <chouteau@adacore.com>)
	id 1gtxjQ-00013t-Sr; Wed, 13 Feb 2019 11:49:57 -0500
Received: from localhost (localhost [127.0.0.1])
	by filtered-smtp.eu.adacore.com (Postfix) with ESMTP id 602578138C;
	Wed, 13 Feb 2019 17:49:38 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at eu.adacore.com
Received: from smtp.eu.adacore.com ([127.0.0.1])
	by localhost (smtp.eu.adacore.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pBi7gP8_GLId; Wed, 13 Feb 2019 17:49:38 +0100 (CET)
Received: from [IPv6:2a02:2ab8:224:1:bc9b:afbd:d99e:104f] (unknown
	[IPv6:2a02:2ab8:224:1:bc9b:afbd:d99e:104f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.eu.adacore.com (Postfix) with ESMTPSA id C5E138138A;
	Wed, 13 Feb 2019 17:49:37 +0100 (CET)
To: Alistair Francis <alistair23@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Palmer Dabbelt <palmer@sifive.com>,
	"open list:All patches CC here" <qemu-devel@nongnu.org>,
	Michael Clark <mjc@sifive.com>, Alistair Francis <Alistair.Francis@wdc.com>
References: <20190212173839.31587-1-chouteau@adacore.com>
	<CAKmqyKOAVDbJQ6avwWgDHP1fHD_EXdZmi+Sjucm05ZqNkQoUog@mail.gmail.com>
From: Fabien Chouteau <chouteau@adacore.com>
Message-ID: <4229ac38-28c4-05b0-eab4-2d865fd53a76@adacore.com>
Date: Wed, 13 Feb 2019 17:49:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAKmqyKOAVDbJQ6avwWgDHP1fHD_EXdZmi+Sjucm05ZqNkQoUog@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 194.98.77.210
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] SiFive RISC-V GPIO Device
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
X-List-Received-Date: Wed, 13 Feb 2019 16:50:00 -0000

On 13/02/2019 01:06, Alistair Francis wrote:> Thanks for the patch!
You are welcome!

Let me know if there is something to improve.

Regads,

