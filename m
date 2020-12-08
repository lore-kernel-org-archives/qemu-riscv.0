Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kmZ4O-0006XJ-Fk
	for mharc-qemu-riscv@gnu.org; Tue, 08 Dec 2020 04:14:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruinland@andestech.com>)
 id 1kmZ4M-0006X8-A1
 for qemu-riscv@nongnu.org; Tue, 08 Dec 2020 04:14:02 -0500
Received: from atcsqr.andestech.com ([60.248.187.195]:61735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruinland@andestech.com>)
 id 1kmZ4G-0004bM-Oj
 for qemu-riscv@nongnu.org; Tue, 08 Dec 2020 04:14:01 -0500
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 0B89DQHX019120
 for <qemu-riscv@nongnu.org>; Tue, 8 Dec 2020 17:13:26 +0800 (GMT-8)
 (envelope-from ruinland@andestech.com)
Received: from APC301.andestech.com (10.0.12.128) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.487.0; Tue, 8 Dec 2020
 17:13:32 +0800
Date: Tue, 8 Dec 2020 17:11:57 +0800
From: Ruinland ChuanTzu Tsai <ruinland@andestech.com>
To: <qemu-riscv@nongnu.org>
CC: <ruinland@andestech.com>, <alankao@andestech.com>, <dylan@andestech.com>, 
 <rick@andestech.com>
Subject: Policy on adding custom instructions/extensions and upcoming Andes
 RV variants
Message-ID: <20201208091157.GB23039@APC301.andestech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [10.0.12.128]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 0B89DQHX019120
Received-SPF: pass client-ip=60.248.187.195;
 envelope-from=ruinland@andestech.com; helo=ATCSQR.andestech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Tue, 08 Dec 2020 09:14:02 -0000


Hi Palmer, Alistair and all,

As RISC-V platforms thrives, there are many custom instructions appear
like bamboo shoots.

We, the Andes Technology, has been determined to contribute our RISC-V
platform into QEMU upstream, namely our Linux-capable AE350 platform
and our A series RISC-V CPU core product line, which we have already
upstreamed our U-Boot an OpenSBI port.

Some of our efforts get ratified into standard extension, just as the
P-Extension has made its way. And there are still many other
enhancement/additions to original extensions - -
Our odyssey on optimizing code size and branch performance ends up as
our very own "Andes Extended Instructions" and "Advanced CoDense™
technology." Both of them are the bedrock which makes our customers
have delightful experience on transisting into RISC-V ecosystem. [1]

We firmly believe by making them accessible to the public could benefit
each other from many perspectives.

Somehow, as we dive deeply to the current code base, we have some
issues which we would like to inquire with the community first and
ask around if there are prior discussions.

That is, we are curious about how QEMU regards on adding new
instructions/extensions, and to be more specific, the upcoming
"-Xandes" CPU variants ?

The existing extensions/instructions are now listed in :
`target/riscv/*.decode`.

If a new extension gets ratified, then it won't be a problem for us just
to add its instructions into corresponding decode file.
Nonetheless, what if we want to add some custom instructions that are
widely adopted custom standards ?

Since we cannot disclose too much at this time being, let's take
CV32E40P, a.k.a. RIS5Y, from PULP Platform as an example, it has been
taped out by NXP as RV32M1 and they are publicly available. The
implementation has Post-Incrementing Load &Store Instruction[1],
and some of them are landed as enhancement to vanilla RV32I - -

p.lb  rD, rs2(rs1)
p.lbu rD, rs2(rs1)
......

they have the same opcode as ordinary lb,lh ... (000 0011).

What will be the most desired way for QEMU upstream to encompass such
feature ?

Will it be suitable to just add them into `insn32.decode` and use
definition guard at compile time to toggle such feature or should there
be a duplicated new decode file which end up as a new decoder for 
decode_opc() to invoke and gets setup during QEMU startup ?

And to be aggressive, if ones made modification on the existing opcode
encoding, duplicating decode file seemed to be inevitable ?

Certainly, these might be too detailed to ask before we put our code
here. Still we would like to know the policy first so we can cooperate
more smoothly.

Cordially Yours,
Ruinland ChuanTzu Tsai

[1] https://www.andestech.com/en/products-solutions/andestar-architecture/
[2] https://pulp-platform.org/docs/ri5cy_user_manual.pdf (Section 14.1.2)

