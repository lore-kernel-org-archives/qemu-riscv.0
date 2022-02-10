Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nI2m8-0003bs-AA
	for mharc-qemu-riscv@gnu.org; Thu, 10 Feb 2022 01:17:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nI2m5-0003Yl-KP
 for qemu-riscv@nongnu.org; Thu, 10 Feb 2022 01:17:49 -0500
Received: from [2607:f8b0:4864:20::1036] (port=38547
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nI2lz-0001PQ-UT
 for qemu-riscv@nongnu.org; Thu, 10 Feb 2022 01:17:49 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 h14-20020a17090a130e00b001b88991a305so7481401pja.3
 for <qemu-riscv@nongnu.org>; Wed, 09 Feb 2022 22:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2ZmZIjF7hDJXu/YS3yMdoKolgpMhM7EuubXRK9cd+L0=;
 b=m33rCHResF0FmnQeiixFLlGNpkpE84aIVAuGwKzPddx7YnUKlec0xUBEZcF2fcLaXX
 lXlZAvTFUbJyJ3c1jW7UwMle4vgzPFvSeSFkzdvp4eOneh485dH7fmJED1d9YSiNJceM
 xPQzCP3FXGpocWa6B7RwWHCml6UM/JA2jo+0DzGwQ/BC0A/xuqFG45Okic3fKsjK5/gu
 d8jGmF2OYFAvmxsLGbhEThkpE4LYD9SddG/x2G+X3qEwkvPGIvJCL5JWtj4E0t2wNcrM
 HIYyvrw2XyeFnC9tTB9ORprkwjYsIbHQ7ns2rOevch9PcGWbjCqKoZbJDVAf9QvDruHZ
 hMxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2ZmZIjF7hDJXu/YS3yMdoKolgpMhM7EuubXRK9cd+L0=;
 b=5GfgCOJin3yf1eOK8RnGtAFh3XbJp9uBHqaJQ+sxALOHfU8heyFoNAoOOe6iJPSAxw
 mq2xVhRI9q//opMPWeejVo6QE0jDp9O8V1jnqE5AP7YXOlZ0BDKRS7gjdVVY/43/l4vr
 NN3+1jG9Y+UTP5/pQfa9JGJOXP1iWOScDXSqlJbJwDHP/SMow9SM5fHzFxNdkF+6Lp6l
 aYFPH04fIpIavvV4YfHpoSxX9ON4geh1TrcfpG27xnr5oDZFJ2Dug2AVuOl62p38rroi
 bUYU9oXEAOCKMocok7V5SUV1yTJ6oDWpta5KDuNzULrkl2BuK4Sc6imYKe7IexsD4ghe
 LoMA==
X-Gm-Message-State: AOAM532YHP4kc5aSOFUJ33ibjYuJnl+9LL0T2hn0qF86/HU4AwtYjuZM
 JBG0p2mjwzNbOWQMydNe0QMO0w==
X-Google-Smtp-Source: ABdhPJzmC9bBQK+I95XW/QbMscfULLvHUdD/gDAyomxfDw1WrFL4pBGzHaa1+2wks7lstTrfjITepw==
X-Received: by 2002:a17:902:bd93:: with SMTP id
 q19mr6122760pls.140.1644473861334; 
 Wed, 09 Feb 2022 22:17:41 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id q2sm23110266pfj.94.2022.02.09.22.17.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 22:17:40 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	Frank Chang <frank.chang@sifive.com>
Subject: [RFC PATCH v2 0/3] Support ACLINT 32/64-bit mtimecmp/mtime read/write
 accesses
Date: Thu, 10 Feb 2022 14:17:32 +0800
Message-Id: <20220210061737.1171-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 10 Feb 2022 06:17:50 -0000

From: Frank Chang <frank.chang@sifive.com>

This patchset makes ACLINT mtime to be writable as RISC-V privilege
spec defines that mtime is exposed as a memory-mapped machine-mode
read-write register. Also, mtimecmp and mtime should be 32/64-bit memory
accessible registers.

This patchset is the updated verion of:
https://patchew.org/QEMU/20220126095448.2964-1-frank.chang@sifive.com/

Changelog:

v2:
  * Support 32/64-bit mtimecmp/mtime memory accesses.
  * Add .impl.[min|max]_access_size declaration.

Frank Chang (3):
  hw/intc: Add .impl.[min|max]_access_size declaration in RISC-V ACLINT
  hw/intc: Support 32/64-bit mtimecmp and mtime accesses in RISC-V
    ACLINT
  hw/intc: Make RISC-V ACLINT mtime MMIO register writable

 hw/intc/riscv_aclint.c         | 87 +++++++++++++++++++++++-----------
 include/hw/intc/riscv_aclint.h |  1 +
 target/riscv/cpu.h             |  8 ++--
 target/riscv/cpu_helper.c      |  4 +-
 4 files changed, 66 insertions(+), 34 deletions(-)

--
2.31.1


