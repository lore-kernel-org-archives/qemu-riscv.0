Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iK2Ym-0005LR-PN
	for mharc-qemu-riscv@gnu.org; Mon, 14 Oct 2019 11:47:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33805)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
 id 1iK2Yf-0005Ef-73
 for qemu-riscv@nongnu.org; Mon, 14 Oct 2019 11:46:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
 id 1iK2Yd-00083c-7p
 for qemu-riscv@nongnu.org; Mon, 14 Oct 2019 11:46:53 -0400
Received: from rs224.mailgun.us ([209.61.151.224]:59345)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71)
 (envelope-from <bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
 id 1iK2YK-0007mr-5B
 for qemu-riscv@nongnu.org; Mon, 14 Oct 2019 11:46:49 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=fintelia.io; q=dns/txt;
 s=pic; 
 t=1571067986; h=Content-Transfer-Encoding: MIME-Version: Message-Id:
 Date: Subject: To: From: Sender;
 bh=Bi3YMZz2MEYyGeBYXwW6EEIw98GgauVCfCNzTFTBtOo=;
 b=DKrjL6aBOGQpiUTZHgLx8zlQsSjnZ2//c8g6elua6M8gdjPCf+3zqpUiVO4+TwxH5SLQo8sv
 Uk/pKJvz0w9IUw6YcPpGOzSrJlRwKl2f56f4PDuvUa2d1TLVIWYtHtDKKAl1t6knd/M4fz1k
 tfYzM0dLWnCkdI/G7J26Wwk8RWdCCcQIocILmFyMDt7QqJhdx+AvL4C33fM2KewI/3Gkm7zF
 B4AzR728tXRwsr05UR6HdbHPoGlqyBcKsSnZO3eY/frtD2OkudnIXRPSE0+nw0DUq92y4zA0
 Tj7fjIzVvAV9vwYllmpFMTskZ0qYkzvq+jm312KlNFMnd8VnTUy0lg==
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyJkNjk0ZSIsICJxZW11LXJpc2N2QG5vbmdudS5vcmciLCAiOWI0ZTc2Il0=
Sender: jonathan@fintelia.io
Received: from jonathan-ThinkPad-X1-Carbon.pdos.lcs.mit.edu
 (26-5-211.dynamic.csail.mit.edu [18.26.5.211])
 by mxa.mailgun.org with ESMTP id 5da4984b.7f705dace450-smtp-out-n01;
 Mon, 14 Oct 2019 15:46:19 -0000 (UTC)
From: Jonathan Behrens <jonathan@fintelia.io>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v4 0/3] target/riscv: Expose "priv" register for GDB
Date: Mon, 14 Oct 2019 11:45:26 -0400
Message-Id: <20191014154529.287048-1-jonathan@fintelia.io>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.61.151.224
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
X-List-Received-Date: Mon, 14 Oct 2019 15:46:55 -0000


This series adds a new "priv" virtual register that reports the current
privilege mode. This is helpful for debugging purposes because that information
is not actually available in any of the real CSRs.

The third patch in this series makes the priv virtual register writitable. I'm
not entirely sure this is a good idea, so I split it out into its own patch. In
particular, this change will conflict with the hypervisor extension work which
assumes that the privilege mode does not change in unexpected cases.

As pointed out in a previous version of this series, GDB actually contains some
support already for the accessing the privilege mode via a virtual "priv"
register, including to convert the values into human readable forms:

(gdb) info reg priv
priv           0x3      prv:3 [Machine]

Changlog V4:
- Fix typo in filename

Changlog V3:
- Break patch into series
- Make priv a virtual register

Changelog V2:
- Use PRV_H and PRV_S instead of integer literals

Jonathan Behrens (3)
  target/riscv: Tell gdbstub the correct number of CSRs
  target/riscv: Expose priv register for GDB for reads
  target/riscv: Make the priv register writable by GDB

 configure                       |  4 ++--
 gdb-xml/riscv-32bit-virtual.xml | 11 +++++++++++
 gdb-xml/riscv-64bit-virtual.xml | 11 +++++++++++
 target/riscv/gdbstub.c          | 36 ++++++++++++++++++++++++++++++++++--
 4 files changed, 58 insertions(+), 4 deletions(-)



