Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ngjrI-0004Ad-Jq
	for mharc-qemu-riscv@gnu.org; Tue, 19 Apr 2022 05:09:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1ngjqy-00048W-Re
 for qemu-riscv@nongnu.org; Tue, 19 Apr 2022 05:09:00 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:38497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1ngjqw-0007rb-OT
 for qemu-riscv@nongnu.org; Tue, 19 Apr 2022 05:08:56 -0400
Received: by mail-pf1-x431.google.com with SMTP id b15so8106732pfm.5
 for <qemu-riscv@nongnu.org>; Tue, 19 Apr 2022 02:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e8xqzWknn8xYvk/+Uuko5kRvnUv2h3xmnJDuVMwN5C4=;
 b=TB0dCJ/aQwUhWlIAKOQjMD7OXjKxlAh0rq4YNNz2yD/nGqWUV42KAA/ozIDvU77M+E
 aXPdLnLi4eR5wJPVh4mFoUi2upIG1ejmV8k7b+JnrsXwXs+azGxl3VyHdGkJvS82G8jy
 hIeoTUtyi8QOTUYmjzX02595Eb8uI5jtVEGYyxDJG9j9MBVqZBl1C+eEve3ZATnAjw4W
 KBYrTxGmez+G9FakMYMCMHwVX1OvzKNuQjQtvgm5fqBWxnXeuJlHa1ZrhYrYz40UA/X0
 0jjcsISME1jqgQrQYxpLALvZ4SfMjSAukhfviu3vFFXZGuKK2ZWpvsaboMnpTSlb+g0I
 RiFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e8xqzWknn8xYvk/+Uuko5kRvnUv2h3xmnJDuVMwN5C4=;
 b=J87XaX0o5tTeYZYKmROOgj6en29AMnoURB65Watq+5iFBIgZb7nIVngNlfhDU15oic
 Y2oHreAuLeO2oC4pupwtCURTOicwyntB6dz7fD+KYiObA9hIbIgVfIYrE/Vx4GxlTY/+
 G5cZzby7+D4bZylMDC7eDXyQ7J0RBZJ/2rYm5gCfLHImuEJTpws9aNGhQgcaFV63xwlb
 Hwai8ZOtJQfDJZ9Yvj1rjdretdf8R9CelUqFTS6vG/6iYN82shKavPVSW4yDgSZiHivy
 ynBRiHqNdOHsL7csX4q5IkU9kuLMpIt/2+LU067DzJLpD2dClyix01wy6TBki9/FSSwc
 zkXA==
X-Gm-Message-State: AOAM531Omsww/UlFQFZajeYv2BVIin1VkfUeWtRQecIUxnH0iBYKV7nN
 8kQZKZvqljcb6IfVpI7rEVhRAg==
X-Google-Smtp-Source: ABdhPJxKTNqzahjbBnHnEjva/9MpDw+HlmmwxWC9bQh1MdOVxyoADbTr9hwMWRwP1dFR24TGmJwBgw==
X-Received: by 2002:a63:e413:0:b0:3aa:2742:3624 with SMTP id
 a19-20020a63e413000000b003aa27423624mr3702858pgi.404.1650359332918; 
 Tue, 19 Apr 2022 02:08:52 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 fv7-20020a17090b0e8700b001ce18c551dcsm14963381pjb.19.2022.04.19.02.08.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 02:08:52 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v3 0/4] Support ACLINT 32/64-bit mtimecmp/mtime read/write
 accesses
Date: Tue, 19 Apr 2022 17:08:41 +0800
Message-Id: <20220419090848.9018-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 19 Apr 2022 09:09:11 -0000

From: Frank Chang <frank.chang@sifive.com>

This patchset makes ACLINT mtime to be writable as RISC-V privilege
spec defines that mtime is exposed as a memory-mapped machine-mode
read-write register. Also, mtimecmp and mtime should be 32/64-bit memory
accessible registers. ACLINT reset function is also added, which requires
mtime to be resetable if we need to support core power-gating feature in
the future.

This patchset is the updated verion of:
https://patchew.org/QEMU/20220126095448.2964-1-frank.chang@sifive.com/

Changelog:

v3:
  * Forbid 8-byte write access to timecmp_hi and time_hi.
  * Add ACLINT reset function.

v2:
  * Support 32/64-bit mtimecmp/mtime memory accesses.
  * Add .impl.[min|max]_access_size declaration.

Frank Chang (3):
  hw/intc: Add .impl.[min|max]_access_size declaration in RISC-V ACLINT
  hw/intc: Support 32/64-bit mtimecmp and mtime accesses in RISC-V
    ACLINT
  hw/intc: Make RISC-V ACLINT mtime MMIO register writable

Jim Shu (1):
  hw/intc: riscv_aclint: Add reset function of ACLINT devices

 hw/intc/riscv_aclint.c         | 144 ++++++++++++++++++++++++++-------
 include/hw/intc/riscv_aclint.h |   1 +
 target/riscv/cpu.h             |   8 +-
 target/riscv/cpu_helper.c      |   4 +-
 4 files changed, 121 insertions(+), 36 deletions(-)

--
2.35.1


