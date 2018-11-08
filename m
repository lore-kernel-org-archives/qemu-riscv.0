Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gKj5r-0005qP-O5
	for mharc-qemu-riscv@gnu.org; Thu, 08 Nov 2018 07:07:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41076)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gKj5p-0005o9-0B
	for qemu-riscv@nongnu.org; Thu, 08 Nov 2018 07:07:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gKj5k-0003QK-2r
	for qemu-riscv@nongnu.org; Thu, 08 Nov 2018 07:07:24 -0500
Received: from mail.uni-paderborn.de ([131.234.142.9]:52606)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kbastian@mail.uni-paderborn.de>)
	id 1gKj5X-0003Jw-GL; Thu, 08 Nov 2018 07:07:07 -0500
Received: from tweenies.uni-paderborn.de ([131.234.189.21]
	helo=localhost.localdomain)
	by mail.uni-paderborn.de with esmtp (Exim 4.89 telepax)
	id 1gKj5V-0002ue-48; Thu, 08 Nov 2018 13:07:05 +0100
Received: from mail.uni-paderborn.de by tweenies with queue id 2944761-4;
	Thu, 08 Nov 2018 12:07:05 GMT
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: kbastian@mail.uni-paderborn.de, mjc@sifive.com, sagark@eecs.berkeley.edu,
	palmer@sifive.com, Alistair.Francis@wdc.com
Cc: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Date: Thu,  8 Nov 2018 13:06:26 +0100
Message-Id: <20181108120628.29926-1-kbastian@mail.uni-paderborn.de>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PMX-Version: 6.4.5.2775670, Antispam-Engine: 2.7.2.2107409,
	Antispam-Data: 2018.11.8.115717, AntiVirus-Engine: 5.53.0,
	AntiVirus-Data: 2018.10.10.5530001
X-IMT-Spam-Score: 0.0 ()
X-IMT-Authenticated-Sender: 
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 131.234.142.9
Subject: [Qemu-riscv] [PATCH 0/2] target/riscv: Bugfixes found in decodetree
 conversion
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
X-List-Received-Date: Thu, 08 Nov 2018 12:07:26 -0000

Hi,

while going through the reviews of the riscv-decodetree patches, two bugs came
up that I fix here. There is one more problem [1] mentioned by Richard but 
I don't have the time to investigate it further.

[1] https://patchwork.kernel.org/patch/10650293/

Bastian Koppelmann (2):
  target/riscv: Fix FCLASS_D being treated as RV64 only
  target/riscv: Fix sfence.vm/a both available in any priv version

 target/riscv/translate.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

-- 
2.19.1


