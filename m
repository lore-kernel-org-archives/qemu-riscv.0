Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gi1Cj-0008Ra-Dg
	for mharc-qemu-riscv@gnu.org; Fri, 11 Jan 2019 13:06:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45662)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gi1Ch-0008QT-La
	for qemu-riscv@nongnu.org; Fri, 11 Jan 2019 13:06:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gi1Cg-0002gh-C7
	for qemu-riscv@nongnu.org; Fri, 11 Jan 2019 13:06:47 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:45409)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gi1Cg-0002ft-4Q
	for qemu-riscv@nongnu.org; Fri, 11 Jan 2019 13:06:46 -0500
Received: by mail-pf1-x429.google.com with SMTP id g62so7279959pfd.12
	for <qemu-riscv@nongnu.org>; Fri, 11 Jan 2019 10:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=OJoQObu5YR2wx8D4Jy1ke2eobqdhBhTej4tuBxRNKOE=;
	b=ix/bCdJT5I9CtqCY2WbP4g5nCDocPjw38+HlL8N8fXa0JeHRTHVmruJi8CIkD+LyFd
	GUWl9NUUFyq8YgM1ljbz5hQrfLwFL2AHkE/WGvwatWW0HAi9xHmkukU07lHkLRjc39HE
	KGIeFoAqi3CdIH2rKgysYEaCvqTE/VEPRmMqAdDlJ1Ihc23FzGR43L4C2UEIU2z4tIT+
	L5qFSrpmkAqzBK8Qgedo+UQbc6T65KuxzQdwtxm7Ak4IZswz7ok4zCoEVF2dhdXfnTQc
	Gz0oysCTY3Nyaf9AAFcr44IARjxN5yo085M5EHaCstI50TM72K73yftLCIYx2JyX04U9
	fchg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=OJoQObu5YR2wx8D4Jy1ke2eobqdhBhTej4tuBxRNKOE=;
	b=h8IreMjKsQ4FKS5WNYB6/bSk/pA0F7pkpj2ZtASu9UTZmjDGyj6xl1rSwZLG2316b2
	/MB0JNRW4FY7w83x4bamIaeKm0nUIPFZtzLplBDl/DNLK6WrMFlMX3Rnl+AdRWdcyeWF
	Tk8goj2nGTQ0FNyqIPHnUL96NzrVOBNsA9gch4aG2pcVvpg3/C3NDWi8+OhKGtYCDKTw
	nvUaOvU2rEQ9EQ4GurbJyBoQ15OWYl7oF57T+6tZpGK926PIPG5AYWsYMWbbD4F1eStJ
	xCWjw7udgYjVCiljIDU/1RNawcU3afs3bBDWzk+9EcMyKJkc0JHETYSKh6rYAXpHTHPz
	WYMA==
X-Gm-Message-State: AJcUukcZRuxmvX6AQjVwZpKxqBy4A5AreYuip5/AxVZ0QYes4tlWtn5T
	7FYF6lC2EyFXPfHNanr+WBd7zFgOoA0=
X-Google-Smtp-Source: ALg8bN4JqSiOFwxjsE8iLmiXFQX4GqQl/tkeYnOJcqG5zF1r29zR4Gqk86Cw5kmjc1prDGI8ljdj3w==
X-Received: by 2002:a62:fb07:: with SMTP id x7mr15466921pfm.71.1547230004752; 
	Fri, 11 Jan 2019 10:06:44 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	v70sm126757667pfa.152.2019.01.11.10.06.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Jan 2019 10:06:44 -0800 (PST)
Date: Fri, 11 Jan 2019 10:06:30 -0800
Message-Id: <20190111180630.6433-5-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20190111180630.6433-1-palmer@sifive.com>
References: <20190111180630.6433-1-palmer@sifive.com>
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Alistair Francis <alistair.francis@wdc.com>, 
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::429
Subject: [Qemu-riscv] [PULL 4/4] default-configs: Enable USB support for
 RISC-V machines
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
X-List-Received-Date: Fri, 11 Jan 2019 18:06:48 -0000

From: Alistair Francis <Alistair.Francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 default-configs/riscv32-softmmu.mak | 1 +
 default-configs/riscv64-softmmu.mak | 1 +
 2 files changed, 2 insertions(+)

diff --git a/default-configs/riscv32-softmmu.mak b/default-configs/riscv32-softmmu.mak
index dbc93982848a..c9c59714093f 100644
--- a/default-configs/riscv32-softmmu.mak
+++ b/default-configs/riscv32-softmmu.mak
@@ -1,6 +1,7 @@
 # Default configuration for riscv-softmmu
 
 include pci.mak
+include usb.mak
 
 CONFIG_SERIAL=y
 CONFIG_VIRTIO_MMIO=y
diff --git a/default-configs/riscv64-softmmu.mak b/default-configs/riscv64-softmmu.mak
index dbc93982848a..c9c59714093f 100644
--- a/default-configs/riscv64-softmmu.mak
+++ b/default-configs/riscv64-softmmu.mak
@@ -1,6 +1,7 @@
 # Default configuration for riscv-softmmu
 
 include pci.mak
+include usb.mak
 
 CONFIG_SERIAL=y
 CONFIG_VIRTIO_MMIO=y
-- 
2.18.1


