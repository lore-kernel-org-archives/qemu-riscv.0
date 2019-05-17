Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hRlHA-0004vS-E0
	for mharc-qemu-riscv@gnu.org; Fri, 17 May 2019 18:24:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39582)
	by lists.gnu.org with esmtp (Exim 4.71) (envelope-from
	<bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
	id 1hRlH7-0004vG-HP
	for qemu-riscv@nongnu.org; Fri, 17 May 2019 18:24:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from
	<bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
	id 1hRlH6-00058r-LJ
	for qemu-riscv@nongnu.org; Fri, 17 May 2019 18:24:25 -0400
Received: from rs224.mailgun.us ([209.61.151.224]:13165)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from
	<bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
	id 1hRlH6-00057I-Co
	for qemu-riscv@nongnu.org; Fri, 17 May 2019 18:24:24 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=fintelia.io; q=dns/txt;
	s=pic; 
	t=1558131861; h=Content-Transfer-Encoding: MIME-Version: Message-Id:
	Date: Subject: Cc: To: From: Sender;
	bh=KIYDNj+Ax7S4cVsa1BB5pw4uyUUItI3e5+Oj57+pKMU=;
	b=bgKNfAXPRdZeoKdNPao/EWsXIsekQf5TpG3dVHn/zsRvvF1DvbLwb2kaWhnkdUjyEOWel/o4
	IlYb0jm2DVIC8ku89RyWcOU2RTiZ1EthJ902VgB+wvn+AE7Gw+F08h6Gh6kRbAbUKy+PYfjT
	I577Rucc8iYHnk1/vCXimMdw5BrC1XBJSMWW7JoI3a6IKV3Q0MW2k4MGvU54g3rYXQYaVIKs
	3DUVFzpMQVoyyBwWT7OgxcdhMhT/ADgTwfHg39AEeEffoN9YoaY1IjFusRndRkflzzZauyQd
	FWnhJGjKc1MfDbvszdoUULucycPmZdejehJp6q4rnWehBsMEh2nwWA==
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyJkNjk0ZSIsICJxZW11LXJpc2N2QG5vbmdudS5vcmciLCAiOWI0ZTc2Il0=
Sender: jonathan@fintelia.io
Received: from jonathan-ThinkPad-X1-Carbon.csail.mit.edu
	(30-9-187.wireless.csail.mit.edu [128.30.9.187])
	by mxa.mailgun.org with ESMTP id 5cdf3494.7ff77a124cb0-smtp-out-n01;
	Fri, 17 May 2019 22:24:20 -0000 (UTC)
From: Jonathan Behrens <jonathan@fintelia.io>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Jonathan Behrens <fintelia@gmail.com>, Palmer Dabbelt <palmer@sifive.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Jonathan Behrens <jonathan@fintelia.io>
Date: Fri, 17 May 2019 18:23:40 -0400
Message-Id: <20190517222342.26394-1-jonathan@fintelia.io>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.61.151.224
Subject: [Qemu-riscv] [PATCH for-4.1 0/2] target/riscv: Improve virt machine
 kernel handling
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
X-List-Received-Date: Fri, 17 May 2019 22:24:26 -0000

Jonathan Behrens (2):
  target/riscv: virt machine shouldn't assume ELF entry is DRAM base
  target/riscv: Add support for -bios "firmware_filename" flag

 hw/riscv/virt.c | 93 ++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 69 insertions(+), 24 deletions(-)

-- 
2.20.1

