Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1izz2t-0004X9-Uo
	for mharc-qemu-riscv@gnu.org; Fri, 07 Feb 2020 03:31:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49879)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <christoph@cullmann.io>) id 1izz2q-0004UM-Sr
 for qemu-riscv@nongnu.org; Fri, 07 Feb 2020 03:31:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <christoph@cullmann.io>) id 1izz2p-0000hz-Pv
 for qemu-riscv@nongnu.org; Fri, 07 Feb 2020 03:31:24 -0500
Received: from babylon2k.com ([2a01:488:66:1000:57e6:5dc9:0:1]:50070)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <christoph@cullmann.io>)
 id 1izz2p-0000ec-JX
 for qemu-riscv@nongnu.org; Fri, 07 Feb 2020 03:31:23 -0500
Received: from babylon2k.com (localhost [IPv6:::1])
 by babylon2k.com (Postfix) with ESMTPA id B42AF22DB2A
 for <qemu-riscv@nongnu.org>; Fri,  7 Feb 2020 09:31:19 +0100 (CET)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 07 Feb 2020 09:31:19 +0100
From: Christoph Cullmann <christoph@cullmann.io>
To: qemu-riscv@nongnu.org
Subject: Question about [v3] RISC-V: Select FPU gdb xml file based on the
 supported extensions
User-Agent: Roundcube Webmail/1.4.0
Message-ID: <eb8fdfcdb9a20c84642556340663cc89@cullmann.io>
X-Sender: christoph@cullmann.io
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a01:488:66:1000:57e6:5dc9:0:1
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
X-List-Received-Date: Fri, 07 Feb 2020 08:31:27 -0000

Hi,

we did run in the same issue (with qemu master) as solved by

https://patchwork.kernel.org/patch/11107481/

I updated the patch to apply to master, is there
interest to get this merged?

(and shall I supply an updated version?)

Greetings
Christoph

-- 
Ignorance is bliss...
https://cullmann.io | https://kate-editor.org

