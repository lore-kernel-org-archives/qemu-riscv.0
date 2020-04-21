Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jQyQb-0007i1-Mn
	for mharc-qemu-riscv@gnu.org; Tue, 21 Apr 2020 15:19:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52064)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1jQyQY-0007h5-PF
 for qemu-riscv@nongnu.org; Tue, 21 Apr 2020 15:19:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1jQyQY-0007gB-1o
 for qemu-riscv@nongnu.org; Tue, 21 Apr 2020 15:19:26 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:45274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmerdabbelt@google.com>)
 id 1jQyQX-0007db-Db
 for qemu-riscv@nongnu.org; Tue, 21 Apr 2020 15:19:25 -0400
Received: by mail-pl1-x644.google.com with SMTP id t4so5616164plq.12
 for <qemu-riscv@nongnu.org>; Tue, 21 Apr 2020 12:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=d2aQTDRAnh1W1uDd73pKIcIBYgis36iQt06EI8YmDrs=;
 b=pN2E2m6qSoaom/4RWEWGJIAiKglZBsnOOAJkYLDW0TFi0GRqtF+NL5qzXlwGjA8g43
 M3ulH0EpM/ibrYAnNsEhiK8fDYXxIqH0lWxbhmRq+CosYiW8seSWR/0hHHPe0AK0//GQ
 PnF+Q/b6MdjHym2cb6K92xGz4EiNquim42F0XMbQOTOU6BgaTqrFi4b8F8GVX/hbRh48
 NFjRJNYr4FX6k/mmmXqjYfBEbigeCbXTvdp3DnOwkCmPtUW50t0BPkWyqFgulMZ7UkjX
 sLWavhJ8/0BacVDd8weZH0RYey2sfjeJOVRiaeP5RnUIy5KJuWxEhNAt3joNM7JBOV24
 nrhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=d2aQTDRAnh1W1uDd73pKIcIBYgis36iQt06EI8YmDrs=;
 b=gOzcpOwcxUyAZnxlCyIpfPss0m+ji1fHHZQXD+/l+zgCRYy4tSxye+HiFhPl7OFJaA
 puuqiIQx4l2uoz49JLhyJF5LwH0n04/2zItgP7+TxzGQS3F8tTmXvkqBUcNZgleJPpVy
 yBjJdT4GE63rfBO5bXkwo8lF8eELbbb8InXEvyDf5JzZuUjiZ5exXIxkAlSL62ZfuOaP
 27iB3hVSxrht7d1UhM4/pBMzez+iHTaXIeWd7U5whrpAMTpnlbS9oWqslPxPNpvVGxpz
 iIzX3p8hPEGhVb2B9rGqOU3ybL+Ie1/7BsrrwZ9kawQJWYhyiLwrxbG5zEScKrm6w9w0
 2PBA==
X-Gm-Message-State: AGi0PubPashZlg5soGivSLvKpzfc8cXB1ZUg4Zg9QsBl62IKLq6cQT0F
 7FnbhxS/aW7o02rx0OxaIdIaoMYzVEw=
X-Google-Smtp-Source: APiQypLI5c5Cdk+yBJuabxDSseVYoNfNLx75Kl68Jw+Bwvhm+JFcUoaBmn2gMpXS6O7U2JMQmYBSsw==
X-Received: by 2002:a17:902:7886:: with SMTP id
 q6mr23086848pll.237.1587496761677; 
 Tue, 21 Apr 2020 12:19:21 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id y187sm3193810pfg.16.2020.04.21.12.19.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 12:19:21 -0700 (PDT)
Subject: [PULL] RISC-V Patches for 5.0-rc4
Date: Tue, 21 Apr 2020 12:09:55 -0700
Message-Id: <20200421191001.92644-1-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.26.1.301.g55bc3eb7cb9-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=palmerdabbelt@google.com; helo=mail-pl1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::644
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
X-List-Received-Date: Tue, 21 Apr 2020 19:19:28 -0000

The following changes since commit 20038cd7a8412feeb49c01f6ede89e36c8995472:

  Update version for v5.0.0-rc3 release (2020-04-15 20:51:54 +0100)

are available in the Git repository at:

  git@github.com:palmer-dabbelt/qemu.git tags/riscv-for-master-5.0-rc4

for you to fetch changes up to 8a7ce6ac908a8ef30d6a81fe8334c3c942670949:

  riscv/sifive_u: Add a serial property to the sifive_u machine (2020-04-21 10:54:59 -0700)

----------------------------------------------------------------
RISC-V Patches for 5.0-rc4

This contains handful of patches that I'd like to target for 5.0.  I know it's
a bit late, I thought I'd already sent these out but must have managed to miss
doing so.  The patches include:

* A handful of fixes to PTE lookups related to H-mode support.
* The addition of a serial number fo the SiFive U implementetaion, which allows
  bootloaders to generate a sane MAC address.

These pass "make check" and boot Linux for me.

----------------------------------------------------------------
Peter: Sorry I dropped the ball here.  I can understand if it's too late for
5.0, but if there's still going to be an rc4 then I'd love to have these
included.
----------------------------------------------------------------
Alistair Francis (5):
      target/riscv: Don't set write permissions on dirty PTEs
      riscv: Don't use stage-2 PTE lookup protection flags
      riscv: AND stage-1 and stage-2 protection flags
      riscv/sifive_u: Fix up file ordering
      riscv/sifive_u: Add a serial property to the sifive_u SoC

Bin Meng (1):
      riscv/sifive_u: Add a serial property to the sifive_u machine

 hw/riscv/sifive_u.c         | 137 ++++++++++++++++++++++++++------------------
 include/hw/riscv/sifive_u.h |   3 +
 target/riscv/cpu_helper.c   |  17 +++---
 3 files changed, 94 insertions(+), 63 deletions(-)


