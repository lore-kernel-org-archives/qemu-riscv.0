Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gKp7q-0006Ku-EX
	for mharc-qemu-riscv@gnu.org; Thu, 08 Nov 2018 13:33:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53718)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gKp7o-0006KD-Ho
	for qemu-riscv@nongnu.org; Thu, 08 Nov 2018 13:33:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gKp7n-0002lX-Cb
	for qemu-riscv@nongnu.org; Thu, 08 Nov 2018 13:33:52 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:34884)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gKp7m-0002J4-W2
	for qemu-riscv@nongnu.org; Thu, 08 Nov 2018 13:33:51 -0500
Received: by mail-pl1-x62c.google.com with SMTP id n4-v6so9935106plp.2
	for <qemu-riscv@nongnu.org>; Thu, 08 Nov 2018 10:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:cc:from:to;
	bh=Egq5gRpH33IkA9LDQH2z8yl43ypRiuVrfR0hVa8D0kA=;
	b=iPNbI4lK4RRIVbBLJd8PFdmZEa8VuAEGr8VRLelCslHhYhSjNHfGbuK5YZuzZBIOfR
	VJ7P2gsJSY/tnhEyF0Kz3Zb8ndTEgHSFjTnLOnyY1SKM9MhfR0CJlnXUkmvPXa5wDDUB
	SJFAOkTziJ3o36VMhyEmgAASyyJ+SEvHMWqshQ/1kX94RQNmvVQ72g9KqQiInsiPbaDK
	tI1NgdugnWLe1hQ92l233xwpdAIjU9jkRKzblB0zgyZJ41u70hSZjEDRGlbzUX15NoL4
	4rnZL1oZW5p3xpP2rOiMtV2m8m1tcSIwWEzKBk7fskinlbbKfO6nvbANcA7QXt2CS5HF
	nWfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:cc:from:to;
	bh=Egq5gRpH33IkA9LDQH2z8yl43ypRiuVrfR0hVa8D0kA=;
	b=loCMLzEjMbinos2L3JzFZdF+HBBveqpOB8yGZCcjpTyBEU/q/FypwqpGWM6HfTQh3i
	gigy4GxAHcFZUsxpNaa9TjTyJVWMj5rK1Nnlr3Ic59bH4U15l5fSL2+LCspqDlD5pelQ
	Vl0S2r1Y6a2DaytEe86aYA+UhFQILbzR4Qa4ozxWZYleNa6UlNNdICYTAqiyg8Z4NIrj
	FfEGsLN3ZGoGycm8I7yqKv13TUsKt6fgy+fVA6eqMjUySpIquIecOZuekgiN/PVFPj7r
	BDSluxTFazBfx5faUyNAPzqKHWMnN5qhhyUJj+kCJGkEl0gbZUj6jKV3Sp90Jtn5C6Xa
	YSXw==
X-Gm-Message-State: AGRZ1gLNVe1RQBv2uVVMwH+wh/nHcYy1m24R2v3VuOUCfWF3M0erLyrB
	6Ff4w1b2tWjVl9pECPdl9oFY8g==
X-Google-Smtp-Source: AJdET5cvnRI0ZHJzx4sZdNIhPsIIfIVKBlTYrr/lxqZ8XnOCokidch5W79wl2mPr+jsTtVlVcjGIkg==
X-Received: by 2002:a17:902:b70c:: with SMTP id
	d12-v6mr5706180pls.288.1541701999207; 
	Thu, 08 Nov 2018 10:33:19 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	o12-v6sm4895941pfh.20.2018.11.08.10.33.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Nov 2018 10:33:18 -0800 (PST)
Date: Thu,  8 Nov 2018 10:33:05 -0800
Message-Id: <20181108183306.4361-1-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::62c
Subject: [Qemu-riscv] [PULL] A Single RISC-V Patch for 3.1-rc1
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
X-List-Received-Date: Thu, 08 Nov 2018 18:33:53 -0000

The following changes since commit a7ce790a029bd94eb320d8c69f38900f5233997e:

  tcg/tcg-op.h: Add multiple include guard (2018-11-08 15:15:32 +0000)

are available in the Git repository at:

  git://github.com/riscv/riscv-qemu.git tags/riscv-for-master-3.1-rc1

for you to fetch changes up to 00a014ac01feac875468d38c376f7e06f050f992:

  riscv: spike: Fix memory leak in the board init (2018-11-08 08:41:06 -0800)

----------------------------------------------------------------
A Single RISC-V Patch for 3.1-rc1

This tag contains a single patch that I'd like to target for rc1: a fix
for a memory leak that was detected by static code analysis.

There are still three patch sets that I'd like to try to get up for 3.1:

* The patch set Basian just published that contains fixes for a pair of
  issues he found when converting our port to decodetree.
* An as-of-yet-unwritten fix to the third issue that Basian pointed out.
* A fix to our fflags bug, which is currently coupled to some CSR
  refactoring that I don't think is OK for 3.1.

I'm at Plumbers next week (and I think Alistair is there too?), but I'll
try to find a way to squeeze in as much as possible.

----------------------------------------------------------------
Alistair Francis (1):
      riscv: spike: Fix memory leak in the board init

 hw/riscv/spike.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)


