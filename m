Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNlhn-0000Mw-Ik
	for mharc-qemu-riscv@gnu.org; Fri, 16 Nov 2018 16:31:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59600)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gNlhd-0000Gg-7j
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 16:31:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gNlhY-0001eY-TM
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 16:31:01 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:38414)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gNlhY-0001e7-GI
	for qemu-riscv@nongnu.org; Fri, 16 Nov 2018 16:30:56 -0500
Received: by mail-pl1-x631.google.com with SMTP id e5so1692898plb.5
	for <qemu-riscv@nongnu.org>; Fri, 16 Nov 2018 13:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:cc:from:to;
	bh=AxWN8Qplcd2YOTtl4ih2cfRqU5arnKW6U66ILx92bLY=;
	b=JdNInoh0QwuZscuuN4gQWa3kpVDBM7veK8JlTTvzMaIgFvhqs2dFSQJNZoLMwCbN6f
	y6nNd6RUEF2+rmhRQStA2/Rp9JaX1U6ABlDJcVQ/tqlY24K62pJ+rB+6P0b4bej/1nIm
	AWxisSxXfDTaDcyhbPQ8c+U2MagBG5UK2zvNi4HlYNhQgJRoF8i/N2Vc+Vlu/C2V96EO
	h5ijgu9fpnYs6v8p9/7FnGE4qubbUQRMucePhkyD6Srz3F8lVRxjxKHp2108+SC0A+BV
	FoWy2MbCrE0SOeJB05Ou0y4xskSWiDfN7D5wLFstdh6/qjWj3TU6aDBzjRiVo6xcoNEY
	ORsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:cc:from:to;
	bh=AxWN8Qplcd2YOTtl4ih2cfRqU5arnKW6U66ILx92bLY=;
	b=oBio35ILzeuDdKK5mv8tj01rQ1B3mwP3ER1dpo+akwLc897Y+GvrM7g3JIJ3RrGLn1
	yAdS47nF/TMm/wfE6eKWiAo+90+MKbLppQ5u+pxq+RALJ+gKQnVTxHNnS4p5AfXdssAc
	hBHGVp7rg1ktZFVIOvtxCojv0YInGQXhMQ72hubVxt0q1yYT+0lcN3zc/0yqkAebx54d
	T8HC1isZo1Ps6gks7t9cq9OClWt2pgFvdhgGXIdSQK/gWasbhukvIT0jI/ddDYeTY1bK
	lEXZcpkcyW2R2Hx/0C5fO+1xxaUeZBTEpmC8oJFhlhCOvhCzD+XY3H+/G+++PdEata3n
	8yVw==
X-Gm-Message-State: AGRZ1gIvoqbG+rQ/6zZWFaGjTxE4yBHKjmro85Vu9t9URJJQ/EJxzxVO
	oc9tWpDrGxE8g0GRk7LJeSrMsQ==
X-Google-Smtp-Source: AJdET5fDxtobHr7M9yqg5bi/4ueNFzY05rWenPir/Oa38NYdJQq6loW4WuQtuNr8K8vGw2EeJCXdNg==
X-Received: by 2002:a17:902:b217:: with SMTP id
	t23-v6mr12612442plr.128.1542403854657; 
	Fri, 16 Nov 2018 13:30:54 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	r2sm11864635pfh.57.2018.11.16.13.30.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Nov 2018 13:30:53 -0800 (PST)
Date: Fri, 16 Nov 2018 13:30:40 -0800
Message-Id: <20181116213045.19825-1-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::631
Subject: [Qemu-riscv] [PULL] RISC-V Patches for 3.1-rc2
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
X-List-Received-Date: Fri, 16 Nov 2018 21:31:04 -0000

The following changes since commit cb968d275c145467c8b385a3618a207ec111eab1:

  Update version for v3.1.0-rc1 release (2018-11-13 18:16:14 +0000)

are available in the Git repository at:

  git://github.com/riscv/riscv-qemu.git tags/riscv-for-master-3.1-rc2

for you to fetch changes up to 3502dc824a7b0218abb49f4350e80a49829748cf:

  RISC-V: Respect fences for user-only emulators (2018-11-13 15:12:15 -0800)

----------------------------------------------------------------
RISC-V Patches for 3.1-rc2

This pull request contains four patches that aren't really related to
each other aside from all being bug fixes that I think should go in for
3.1.0:

* The second half of Alistair's memory leak patch set that I missed last
  week.
* A fix to make fclass.d availiable only on RV64IFD systems (without
  this it's availiable on RV32IFD systems, truncating the result).
* A fix to make sfence.vm availiable only in priv-1.9.1, and sfence.vma
  only availiable in priv-1.10.
* A change to respect fences in user-mode emulators, which were
  previously treated as NOPs.

As usual, this builds and boot Linux for me.  I don't think I have
anything else planned for 3.1.0, but I may be wrong as things are a bit
hectic this week.

----------------------------------------------------------------
Alistair Francis (1):
      hw/riscv/virt: Free the test device tree node name

Bastian Koppelmann (2):
      target/riscv: Fix FCLASS_D being treated as RV64 only
      target/riscv: Fix sfence.vm/a both available in any priv version

Palmer Dabbelt (1):
      RISC-V: Respect fences for user-only emulators

 hw/riscv/virt.c          |  1 +
 target/riscv/translate.c | 24 ++++++++++++++++--------
 2 files changed, 17 insertions(+), 8 deletions(-)


