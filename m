Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i2cwS-0003Om-47
	for mharc-qemu-riscv@gnu.org; Tue, 27 Aug 2019 10:59:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46765)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1i2cwE-0003L1-CS
 for qemu-riscv@nongnu.org; Tue, 27 Aug 2019 10:59:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1i2cw7-0003jE-Kp
 for qemu-riscv@nongnu.org; Tue, 27 Aug 2019 10:59:09 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:36125)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1i2cvv-0003Oy-5f; Tue, 27 Aug 2019 10:58:55 -0400
Received: by mail-pf1-x441.google.com with SMTP id w2so14293672pfi.3;
 Tue, 27 Aug 2019 07:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=FpCtqaldJOPS+6r8LXByFWiXnp/lwboxYZuh51b65Ho=;
 b=OaYJ9H7AGNb0evmcU/GDuLFj6s3FsaggyADNL4nnEao+k/LFpxWHvtZZSOpvnFTkMh
 eJYemiOcx+4nTg51EAqt0bLWuPRId8WtKkFnYQ825KuXdkyDNuG3OCjkAb1389CymUbj
 R8wxCPeb6HfZ6j4QnGz0LVH4pHAABGaCtIEQ5VaRxeAy8JK81EbUQ2HzELSJuaiVZak6
 DHZ96Iepk1AQdTKJFH0AhJernFIl635fKQ+CB3V5jmZAL38vTuL+53ORodBmOdWbVaEL
 ppLvbn1JxkVSbQFNPa86voTRZ7su5q5Mh8T9stpHQ1lrimLuJ5mj8mFZoDNi5Z47gx6H
 BguQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=FpCtqaldJOPS+6r8LXByFWiXnp/lwboxYZuh51b65Ho=;
 b=klvtt1Sz8BgYTeiIJOIGye/ZEgNL8lPGzIokoaHNwmwalUSp4oPFACam0248OLYOuy
 sHSa6XNo5WPjrcOk3y87oeE9DnMhfEM9PkDOiKD7Cso5vO8wXNWcAYUyIQ//BJMNsaDq
 LzRP5LdgUrZr0dup/w+yZmx3TaRFTsMjpnkr6AwKRCxbkNtq7MQm+Wbt12KBhSN9C4iX
 l3Zh46wcssQk/9jUOE+JJv0qA/0jcQ0tigt1golfxd2uGcsZ8PvAej+T2jnc71XycHgh
 jv0600FBdzxxkeEOe0rm8wRpmu0cOxPIsB/bf8XZVrun6uo3Zw7s4cKi6wnin01XP/n7
 Kpqg==
X-Gm-Message-State: APjAAAX5zHOIT6vgLu6NI7tnlJW/4MkcEdMI8TamHRzLUhEBKkD0jsWy
 bG4WEZ0oj0NZzKTYePt+M2s=
X-Google-Smtp-Source: APXvYqwZObKOM2i1J/KP2C8vyutgP/wSQvnsO/UQDzDLSg3fM9dk10L8a+OLEHDt/ndZVbAGaZ4nXA==
X-Received: by 2002:a17:90a:c386:: with SMTP id
 h6mr25510892pjt.122.1566917932880; 
 Tue, 27 Aug 2019 07:58:52 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id j15sm14839344pfr.146.2019.08.27.07.58.51
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Tue, 27 Aug 2019 07:58:52 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Date: Tue, 27 Aug 2019 07:58:16 -0700
Message-Id: <1566917919-25381-8-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1566917919-25381-1-git-send-email-bmeng.cn@gmail.com>
References: <1566917919-25381-1-git-send-email-bmeng.cn@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: [Qemu-riscv] [PATCH v6 07/30] riscv: roms: Remove executable
 attribute of opensbi images
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
X-List-Received-Date: Tue, 27 Aug 2019 14:59:18 -0000

Like other binary files, the executable attribute of opensbi images
should not be set.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

---

Changes in v6: None
Changes in v5: None
Changes in v4:
- new patch to remove executable attribute of opensbi images

Changes in v3: None
Changes in v2: None

 pc-bios/opensbi-riscv32-virt-fw_jump.bin     | Bin
 pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin | Bin
 pc-bios/opensbi-riscv64-virt-fw_jump.bin     | Bin
 3 files changed, 0 insertions(+), 0 deletions(-)
 mode change 100755 => 100644 pc-bios/opensbi-riscv32-virt-fw_jump.bin
 mode change 100755 => 100644 pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin
 mode change 100755 => 100644 pc-bios/opensbi-riscv64-virt-fw_jump.bin

diff --git a/pc-bios/opensbi-riscv32-virt-fw_jump.bin b/pc-bios/opensbi-riscv32-virt-fw_jump.bin
old mode 100755
new mode 100644
diff --git a/pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin b/pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin
old mode 100755
new mode 100644
diff --git a/pc-bios/opensbi-riscv64-virt-fw_jump.bin b/pc-bios/opensbi-riscv64-virt-fw_jump.bin
old mode 100755
new mode 100644
-- 
2.7.4


