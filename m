Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRdbc-0001tY-Ju
	for mharc-qemu-riscv@gnu.org; Tue, 27 Nov 2018 08:40:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43121)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1gRcF9-0003LX-2k
	for qemu-riscv@nongnu.org; Tue, 27 Nov 2018 07:13:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1gRcF8-0004Pn-H2
	for qemu-riscv@nongnu.org; Tue, 27 Nov 2018 07:13:31 -0500
Received: from mel.act-europe.fr ([2a02:2ab8:224:1::a0a:d2]:60592
	helo=smtp.eu.adacore.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <chouteau@adacore.com>)
	id 1gRcF8-0004Kp-93
	for qemu-riscv@nongnu.org; Tue, 27 Nov 2018 07:13:30 -0500
Received: from localhost (localhost [127.0.0.1])
	by filtered-smtp.eu.adacore.com (Postfix) with ESMTP id 9950F81391
	for <qemu-riscv@nongnu.org>; Tue, 27 Nov 2018 13:13:28 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at eu.adacore.com
Received: from smtp.eu.adacore.com ([127.0.0.1])
	by localhost (smtp.eu.adacore.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IPz4UPoAcmPL for <qemu-riscv@nongnu.org>;
	Tue, 27 Nov 2018 13:13:28 +0100 (CET)
Received: from [IPv6:2a02:2ab8:224:1:b82a:5cc2:a088:fe2a] (unknown
	[IPv6:2a02:2ab8:224:1:b82a:5cc2:a088:fe2a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.eu.adacore.com (Postfix) with ESMTPSA id 8A29C8138E
	for <qemu-riscv@nongnu.org>; Tue, 27 Nov 2018 13:13:28 +0100 (CET)
From: Fabien Chouteau <chouteau@adacore.com>
To: qemu-riscv@nongnu.org
Message-ID: <cb26cbf9-cfcd-8981-23a2-e53a1751195f@adacore.com>
Date: Tue, 27 Nov 2018 13:13:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 2a02:2ab8:224:1::a0a:d2
X-Mailman-Approved-At: Tue, 27 Nov 2018 08:40:47 -0500
Subject: [Qemu-riscv] Contribution procedures for RISC-V QEMU
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
X-List-Received-Date: Tue, 27 Nov 2018 12:13:31 -0000

Hi everyone,

I have identified two problems with sifive_clint.c in qemu.org branch.

One of them seems to be fixed in github.com/riscv/riscv-qemu/commit/6835068 but
not merged in the qemu.org.

The other is about integer overflow in sifive_clint_write_timecmp() and not
fixed anywhere, as far as I know.

So I have two questions:

 - What is the contribution procedure for RISC-V QEMU? Should I send a patch
   here or use GitHub?

 - When will `6835068` be merged in qemu.org branch?

Thanks in advance,

