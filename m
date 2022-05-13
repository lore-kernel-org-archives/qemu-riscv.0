Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1npRt6-0006zr-4i
	for mharc-qemu-riscv@gnu.org; Fri, 13 May 2022 05:47:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1npRt1-0006x4-WE; Fri, 13 May 2022 05:47:04 -0400
Received: from mail-sender-0.a4lg.com
 ([2401:2500:203:30b:4000:6bfe:4757:0]:48298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1npRsz-00052r-TQ; Fri, 13 May 2022 05:47:03 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by mail-sender-0.a4lg.com (Postfix) with ESMTPSA id 0F5DF300089;
 Fri, 13 May 2022 09:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irq.a4lg.com;
 s=2017s01; t=1652435219;
 bh=OWZnhpZHPLXTdn75QVrC6abCC+X/uOWKTgc0Kj+SUes=;
 h=From:To:Cc:Subject:Date:Message-Id:Mime-Version:
 Content-Transfer-Encoding;
 b=L8urkBmC3bspAi0c4lUzeMIk1jtz376MT5mp4BX7Cc7MGTPLvFcJjRDvX2oNi+SKQ
 6HOd3e1ctQALYmwZHGUFnGtgR0ee84lG+349DcTR26Tkkzx5/3C2JSZoqa6KpzvtO0
 otIEVPm+laHKGIlstRm21pJJ9F+sRiUAl2NpUTU8=
From: Tsukasa OI <research_trasio@irq.a4lg.com>
To: Tsukasa OI <research_trasio@irq.a4lg.com>,
 Alistair Francis <alistair23@gmail.com>,
 Frank Chang <frank.chang@sifive.com>, Dao Lu <daolu@rivosinc.com>
Cc: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC PATCH 0/1] target/riscv: Make property names lowercase and add
 capitalized aliases
Date: Fri, 13 May 2022 18:46:52 +0900
Message-Id: <cover.1652435208.git.research_trasio@irq.a4lg.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:2500:203:30b:4000:6bfe:4757:0;
 envelope-from=research_trasio@irq.a4lg.com; helo=mail-sender-0.a4lg.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 13 May 2022 09:47:04 -0000

Hello,

While I'm reviewing Dao Lu's Zihintpause patch, I noticed something.

c.f. <https://lists.gnu.org/archive/html/qemu-riscv/2022-05/msg00210.html>

While some CPU configuration properties have capitalized names but others
have lowercase names.  See riscv_cpu_properties in target/riscv/cpu.c
for example:

    DEFINE_PROP_BOOL("i", RISCVCPU, cfg.ext_i, true),
    DEFINE_PROP_BOOL("e", RISCVCPU, cfg.ext_e, false),
    DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, true),

...

    DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
    DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
    DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),

...

    DEFINE_PROP_BOOL("zba", RISCVCPU, cfg.ext_zba, true),
    DEFINE_PROP_BOOL("zbb", RISCVCPU, cfg.ext_zbb, true),
    DEFINE_PROP_BOOL("zbc", RISCVCPU, cfg.ext_zbc, true),

...

I think this is not good.  Property names should have some sort of
consistency (especially when those names are case sensitive).  This is
what happens when invalid property is specified:

Invalid: -cpu rv64,counters=off
Valid  : -cpu rv64,Counters=off

    qemu-system-riscv64: can't apply global rv64-riscv-cpu.counters=off: Property 'rv64-riscv-cpu.counters' not found

But we can't just remove such names for compatibility.

I found a way to make "property aliases" and that way, we can make both
"Counters" and "counters" valid.  I chose lowercase names (because of
number of properties implemented) as primary ones and capitalized names
are defined as aliases.

For instance, I'll show how both "counters" and "Counters" are implemented
below. They share three arguments but on alias (the second one),:

-   it uses DEFINE_PROP on alias to disable setting default value and
-   it defines property type (that is generally set by DEFINE_PROP_BOOL but
    must be set manually because the alias uses DEFINE_PROP).

    DEFINE_PROP_BOOL("counters", RISCVCPU, cfg.ext_counters, true),
    DEFINE_PROP     ("Counters", RISCVCPU, cfg.ext_counters, qdev_prop_bool, bool),




Tsukasa OI (1):
  target/riscv: Make property names lowercase

 target/riscv/cpu.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)


base-commit: 178bacb66d98d9ee7a702b9f2a4dfcd88b72a9ab
-- 
2.34.1


