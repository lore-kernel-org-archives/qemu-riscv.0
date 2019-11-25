Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iZLRy-0001ix-MF
	for mharc-qemu-riscv@gnu.org; Mon, 25 Nov 2019 15:59:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55422)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1iZLRw-0001iF-3O
 for qemu-riscv@nongnu.org; Mon, 25 Nov 2019 15:59:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1iZLRv-0001ZN-59
 for qemu-riscv@nongnu.org; Mon, 25 Nov 2019 15:59:12 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:34772)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1iZLRu-0001YH-TF
 for qemu-riscv@nongnu.org; Mon, 25 Nov 2019 15:59:11 -0500
Received: by mail-pj1-x1033.google.com with SMTP id bo14so7162780pjb.1
 for <qemu-riscv@nongnu.org>; Mon, 25 Nov 2019 12:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=8xgPuTqJy1QlZRSzq2LsNtqmgUVuLv7FF3Wn8phW0/s=;
 b=pcDjDB/E0CGsZrU8NMMO/iJMnT3ZR0UuN7X+oV9rvfBNKFzmlgqXbvozPY3Wvt9HzD
 xwjothopBZLXA94e6Ovpxz5GO3NooyTiJ9W/3eHVu0Dulmc+evxn+iU7Muc1mCL7D+pu
 FdkDhXE4qEpRtgxvrbP9gqAhrN/p5XSFxJhXPx7n2+NxZBdttKuVWtI/yVes1zsXZGcs
 xPbzgOoZf2X8oATsj1Baboco/SrHQmBUmk8rMEh4jC4tEyPiE9oJnTHBeKqHiOp8kXZY
 a4YsztTKFdWdX1szWfuouAtCeuRYgKNUso754SELurLVG6+OBIbqMSpMxkfwbO7B5N+b
 aiXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=8xgPuTqJy1QlZRSzq2LsNtqmgUVuLv7FF3Wn8phW0/s=;
 b=TyvZ3ZjeffglvHvyacQi+O5SxvUO986dhjACeVQ8cvOoJ222a6j45Lb4tI40e5UpQ1
 tjdqrDkUZpI3IpXuAnQ0XVhVC2mKn90vS4c06neghMqHx9kl/wdnAyK6yuG6FAj+1f/L
 /Jd6CVH/J6IKUn7p2eL4Gzng8QcpSj6hhVLoGqjyX6/JA0xlhlDXh09UjRGhhTsNk7i/
 w5aY42rGpeNN4p5PWs7cT3+L4m6A+RmBSsGhkGht1L19p5AYrP+lYe83WsEk1VVr+4bR
 gOpLBgVEGazaMKOigPHl2jvg3sz3kkkpC0UCxq6LbNfg5zNcOFv1HPergi5kYeYz4RNd
 9imw==
X-Gm-Message-State: APjAAAXHcOcbM6a81M9C/zkYVjRD7CHP1+ZQhLasUNdyi2NkdAnLGgwG
 J7rwEi5ExmdQUTedVDcuMmU1cA==
X-Google-Smtp-Source: APXvYqzT+MktQlxwHyfFhnr8BBtqHGUAlO7k2gx5q1V2jgaVL89ES+NNBNB5MApFwz2y/npZhVr+hQ==
X-Received: by 2002:a17:90a:1b69:: with SMTP id
 q96mr1294544pjq.89.1574715548358; 
 Mon, 25 Nov 2019 12:59:08 -0800 (PST)
Received: from localhost ([2620:15c:211:200:12cb:e51e:cbf0:6e3f])
 by smtp.gmail.com with ESMTPSA id x2sm10218162pfj.90.2019.11.25.12.59.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2019 12:59:07 -0800 (PST)
Subject: [PULL] RISC-V Patches for 4.2-rc3
Date: Mon, 25 Nov 2019 12:58:52 -0800
Message-Id: <20191125205854.226672-1-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1033
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
X-List-Received-Date: Mon, 25 Nov 2019 20:59:13 -0000

The following changes since commit 65e05c82bdc6d348155e301c9d87dba7a08a5701:

  Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging (2019-11-25 15:47:44 +0000)

are available in the Git repository at:

  git@github.com:palmer-dabbelt/qemu.git tags/riscv-for-master-4.2-rc3

for you to fetch changes up to 6478dd745dca49d63250500cd1aeca1c41cd6f89:

  hw/riscv: Add optional symbol callback ptr to riscv_load_kernel() (2019-11-25 12:34:52 -0800)

----------------------------------------------------------------
RISC-V Patches for 4.2-rc3

This tag contains two patches that I'd like to target for 4.2-rc3:

* A fix to the DT entry for the SiFive test finisher.
* A fix to the spike board's HTIF interface.

This passes "make check" and boots OE for me.

----------------------------------------------------------------
Palmer Dabbelt (1):
      RISC-V: virt: This is a "sifive,test1" test finisher

Zhuang, Siwei (Data61, Kensington NSW) (1):
      hw/riscv: Add optional symbol callback ptr to riscv_load_kernel()

 hw/riscv/boot.c         | 7 ++++---
 hw/riscv/sifive_e.c     | 2 +-
 hw/riscv/sifive_u.c     | 3 ++-
 hw/riscv/spike.c        | 6 +++---
 hw/riscv/virt.c         | 8 ++++++--
 include/hw/riscv/boot.h | 3 ++-
 6 files changed, 18 insertions(+), 11 deletions(-)


