Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jxra7-000239-IB
	for mharc-qemu-riscv@gnu.org; Tue, 21 Jul 2020 08:41:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zong.li@sifive.com>)
 id 1jxra6-0001zn-Aw
 for qemu-riscv@nongnu.org; Tue, 21 Jul 2020 08:41:14 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:52837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zong.li@sifive.com>)
 id 1jxra4-0004vi-2J
 for qemu-riscv@nongnu.org; Tue, 21 Jul 2020 08:41:13 -0400
Received: by mail-pj1-x1034.google.com with SMTP id gc9so1519486pjb.2
 for <qemu-riscv@nongnu.org>; Tue, 21 Jul 2020 05:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OEVnCZhkWrQj+RRpuKVqY29A7QsD2Bci3YBFcgJ2+JI=;
 b=GXw2ZRF8PUQZ3ySczILQ9GifcbneUCW62LCyCZmx98TNN+VzJhBVJDFNQkDlJv+LJH
 sRK0CiCOZWP12zypNge4sX7+fQw+wq2YkzU59DQBNg3UlBzI+AqAMPoc1vkxERnXAH36
 0SZBG1OEhp9cWnYLgeCVEaj9/xfMVW7Re8japbmm7NU87nGdT9EED590VQA+EDf/w/b5
 0znSL/Wf8yla8iWfqzvAl8VNtMPI4Lh996wNuW1oJly4SAxADCbm+bIQEfa3UROVMcDH
 wUVMSN9FwZMaFCPLNbBS3O3H3NUJjShL2tJfCWUoPHvKYQoqPHJrdCs0ui3CYQ+fyb5E
 LfzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OEVnCZhkWrQj+RRpuKVqY29A7QsD2Bci3YBFcgJ2+JI=;
 b=qsct+NSdVsO9xm6XjTtdEpxs7BT1MO7hZcU1r/GhRscwvjVKd9iIEphOWmXU7SL0oz
 wB7x1yfFvitFPJqtEkM9sVrmzULArvo4YWR7s+1mBOqrW2kPLyaeerC4EDXXVog4bygY
 9vlG/OSR2uuuHRVyglVtYz+AVGQ9mBp3l9J9KKl+5hCUabATcGd3cjt9tLuBr067sOOT
 xqIeA1obHQHW3A8ieZwByRSV7LHWaNETVyxxov3CosbWyrBKCcVt6BYjVM+s3qROHZpV
 DNfeap9m4z6iW8JoaFyo/Nd9QX1bgLDBb8TMq7FeCaXaRREr1rEWpVk9vp65mhJ6xnwn
 NmQA==
X-Gm-Message-State: AOAM531G7XeMTBLp/YLMtaEjqvtYt6QoTYHv+fE6qiWDdPi4CZDeVjcG
 1MZC1jNogDIBNT9HpbKeEZ6mnQ==
X-Google-Smtp-Source: ABdhPJy93bn39WhyMsgK4b+WiCLpmn63PvJeggfFhbqfMyQWflDJUKtM/7VabufybRDajHPXr8QD1g==
X-Received: by 2002:a17:90a:304d:: with SMTP id
 q13mr4555794pjl.73.1595335270206; 
 Tue, 21 Jul 2020 05:41:10 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id y20sm19819991pfo.170.2020.07.21.05.41.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 05:41:09 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: palmer@dabbelt.com, Alistair.Francis@wdc.com, bmeng.cn@gmail.com,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH v3 0/3] Fix some PMP implementation
Date: Tue, 21 Jul 2020 20:40:49 +0800
Message-Id: <cover.1595335112.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=zong.li@sifive.com; helo=mail-pj1-x1034.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Tue, 21 Jul 2020 12:41:14 -0000

This patch set contains the fixes for wrong index of pmpcfg CSR on rv64,
and the pmp range in CSR function table. After 3rd version of this patch
series, we also fix the PMP wrong checking problem.

Changed in v3:
 - Refine the implementation. Suggested by Bin Meng.
 - Add fix for PMP wrong checking

Changed in v2:
 - Move out the shifting operation from loop. Suggested by Bin Meng.

Zong Li (3):
  target/riscv: Fix the range of pmpcfg of CSR funcion table
  target/riscv/pmp.c: Fix the index offset on RV64
  target/riscv: Fix the translation of physical address

 target/riscv/cpu_helper.c | 3 ++-
 target/riscv/csr.c        | 2 +-
 target/riscv/pmp.c        | 8 ++++++++
 3 files changed, 11 insertions(+), 2 deletions(-)

-- 
2.27.0


