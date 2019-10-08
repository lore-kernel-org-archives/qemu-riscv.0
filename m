Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iHd8z-0002Rf-2c
	for mharc-qemu-riscv@gnu.org; Mon, 07 Oct 2019 20:14:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37103)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
 id 1iHd8w-0002R0-LP
 for qemu-riscv@nongnu.org; Mon, 07 Oct 2019 20:14:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
 id 1iHd8u-0005Hn-GL
 for qemu-riscv@nongnu.org; Mon, 07 Oct 2019 20:14:22 -0400
Received: from rs224.mailgun.us ([209.61.151.224]:21472)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71)
 (envelope-from <bounce+d13a72.9b4e76-qemu-riscv=nongnu.org@fintelia.io>)
 id 1iHd8t-0005Gw-VK
 for qemu-riscv@nongnu.org; Mon, 07 Oct 2019 20:14:20 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=fintelia.io; q=dns/txt;
 s=pic; 
 t=1570493658; h=Content-Transfer-Encoding: MIME-Version: Message-Id:
 Date: Subject: To: From: Sender;
 bh=gP0eQg3wg3/BRnD4OucGfDqnuNj/+RvsVg+lwRViW68=;
 b=wH+eB1tBxVgOkj6U8QSIVb0SkBD2Z8CYz9i+8fAUnKhakDuu2oaulDWKtrooHYO9ZWjsY3hf
 3xRlhnirem5UQWtNj+PwXikGX36yPjS5NvWY1kJgambp17B3eGymaib43XMGOZxBd5kIAdj3
 NCILdnpcSzT/UfHMhOHXaFavPZ8IhcTWcY/l4B5xMdxepCaHb21PkKzMf6/fula8jf6UuCs4
 ypd70F5aJGEVBZ4f2DxZT+55rYVrKIGJbtBQNgRCYEY6KEDMgCHnKYIfyLyB5KomsfqTJPyf
 txoIIXYmS1pMQa1F3ivz7GgUsXAggKv/7MsB+SbdMM2GacwdutOqug==
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyJkNjk0ZSIsICJxZW11LXJpc2N2QG5vbmdudS5vcmciLCAiOWI0ZTc2Il0=
Sender: jonathan@fintelia.io
Received: from jonathan-ThinkPad-X1-Carbon.pdos.lcs.mit.edu
 (26-5-211.dynamic.csail.mit.edu [18.26.5.211])
 by mxa.mailgun.org with ESMTP id 5d9bd4d8.7f51c380ba28-smtp-out-n01;
 Tue, 08 Oct 2019 00:14:16 -0000 (UTC)
From: Jonathan Behrens <jonathan@fintelia.io>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v3 0/3] target/riscv: Expose "priv" register for GDB
Date: Mon,  7 Oct 2019 20:13:15 -0400
Message-Id: <20191008001318.219367-1-jonathan@fintelia.io>
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
X-List-Received-Date: Tue, 08 Oct 2019 00:14:24 -0000

The third patch in this series makes the priv virtual register writitable. I'm
not entirely sure this is a good idea, so I split it out into its own patch. In
particular, this change will conflict with the hypervisor extension work which
assumes that the privilege mode does not change in unexpected cases.

As pointed out in a previous version of this series, GDB actually contains some
support already for the accessing the privilege mode via a virtual "priv"
register, including to convert the values into human readable forms:

(gdb) info reg priv
priv           0x3	prv:3 [Machine]

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


