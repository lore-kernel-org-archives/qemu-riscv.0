Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gYfac-0003q1-8B
	for mharc-qemu-riscv@gnu.org; Sun, 16 Dec 2018 18:12:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60214)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sorear2@gmail.com>) id 1gYfaZ-0003pu-WF
	for qemu-riscv@nongnu.org; Sun, 16 Dec 2018 18:12:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sorear2@gmail.com>) id 1gYfaW-00066L-Rm
	for qemu-riscv@nongnu.org; Sun, 16 Dec 2018 18:12:47 -0500
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842]:44628)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sorear2@gmail.com>) id 1gYfaW-00065y-O3
	for qemu-riscv@nongnu.org; Sun, 16 Dec 2018 18:12:44 -0500
Received: by mail-qt1-x842.google.com with SMTP id n32so12190111qte.11
	for <qemu-riscv@nongnu.org>; Sun, 16 Dec 2018 15:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=jWSNIn7TO+cDRqtB3B9zDomDgmmO6w3Ljez9EagTlo0=;
	b=K8J30Rqo2EgAwy70SR6UrsqvGybST0LlVsIhGN3lAdGzHUFiW80GJavdBFHeN7y7Hm
	fm82XArQ9SJR1zycsJ40z/wVjk6q5I1W76ytezUAgyBl5K7CPf30ioEHI3W/D7tC0Ngk
	ECB0rK10Arn3a58JPbIAty5C1+bBWscVts7KSGwwwybx1Q8qYXMMMwYrXxoKMs8W1GTQ
	D4YleQgNLxQD5clA7Et5PSBf40v/YtjMeMGSoPRU2myyITHM3Urlll8NVfXKRtFNjOfV
	iy7odbklx4CmrsdQBxoc31Bx8XJsz0jEG1s+G+BRMK7ikk/dUCtUoJYBnJnk4FeHvJRC
	Amfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jWSNIn7TO+cDRqtB3B9zDomDgmmO6w3Ljez9EagTlo0=;
	b=jRTZIWbzU/ThpseIFlcRzGbeJ7jECw2L4ltCLINik0XB3CpOMWYh6w3w/qqdUnJWnn
	I2JtjgX/PKzK+m2fz6OaUmKQzGb0WLxhLQE3uRCfkwQlr03nOku0m8DY7ihvQyWxQDsu
	eHcHuXTleFNih96JO+F/LIthmLtGxJUQKjzcaz54Pl1fhzNLUBWIgoYc3I8EF+IGVBsP
	cDaASK6ZaWubM13y41EE95Pfv1eBv6JTDKNQL23eXwXVQ/48spkIRewGDnkJa/NX3gmx
	7Jmzcii040WMiXsr3XPlKCtAyxGTwQ/6xwQxEjKJJkGqV7VM/CtCc15lrh/LIBDJCtac
	4yIg==
X-Gm-Message-State: AA+aEWZcnh5Svr0ATGPZV8IvKW8SWizRdTEVKw0kbtTYxPtXDFaQNoNY
	tQRhFv20hJNT4kt70MdFRufLznOb/R8=
X-Google-Smtp-Source: AFSGD/WjRShebFptkNjF1SfTlly9+oeqqF7DZX/xTtrldsyx9fDfozmDkxkwTQFSuaeJ35RoZ18XdQ==
X-Received: by 2002:a0c:ef03:: with SMTP id t3mr10912008qvr.148.1545001963896; 
	Sun, 16 Dec 2018 15:12:43 -0800 (PST)
Received: from localhost.localdomain
	(209-6-78-127.s3965.c3-0.abr-cbr1.sbo-abr.ma.cable.rcncustomer.com.
	[209.6.78.127]) by smtp.gmail.com with ESMTPSA id
	e186sm5713451qkb.32.2018.12.16.15.12.43
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 16 Dec 2018 15:12:43 -0800 (PST)
From: Stefan O'Rear <sorear2@gmail.com>
To: qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
	Stefan O'Rear <sorear2@gmail.com>
Date: Sun, 16 Dec 2018 18:12:23 -0500
Message-Id: <1545001947-29444-1-git-send-email-sorear2@gmail.com>
X-Mailer: git-send-email 2.8.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::842
Subject: [Qemu-riscv] [PATCH v2 0/4] Support separate -firmware and -kernel
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
X-List-Received-Date: Sun, 16 Dec 2018 23:12:48 -0000

This was posted in May[0] by Michael Clark.  I have split it up to
address earlier review feedback, along with other minor cleanups.

[0]: http://lists.nongnu.org/archive/html/qemu-devel/2018-05/msg05121.html

Stefan O'Rear (4):
  RISC-V: Move firmware loading logic to a separate file
  RISC-V: refactor initrd loading
  RISC-V: Honor entry point in loaded ELF firmware
  RISC-V: Support separate firmware and kernel payload

 hw/riscv/Makefile.objs  |   1 +
 hw/riscv/boot.c         | 170 ++++++++++++++++++++++++++++++++++++++++++++++++
 hw/riscv/virt.c         |  69 ++++----------------
 include/hw/riscv/boot.h |  24 +++++++
 4 files changed, 208 insertions(+), 56 deletions(-)
 create mode 100644 hw/riscv/boot.c
 create mode 100644 include/hw/riscv/boot.h

-- 
2.8.0


