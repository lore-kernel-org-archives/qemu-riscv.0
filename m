Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jzLi8-0002gz-8C
	for mharc-qemu-riscv@gnu.org; Sat, 25 Jul 2020 11:03:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zong.li@sifive.com>)
 id 1jzLi6-0002fH-QB
 for qemu-riscv@nongnu.org; Sat, 25 Jul 2020 11:03:38 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:42334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zong.li@sifive.com>)
 id 1jzLi3-000869-M8
 for qemu-riscv@nongnu.org; Sat, 25 Jul 2020 11:03:38 -0400
Received: by mail-pf1-x442.google.com with SMTP id 1so6803996pfn.9
 for <qemu-riscv@nongnu.org>; Sat, 25 Jul 2020 08:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HaSMpiNAE5XGFluxVENpTh1dzhrXk37EmhnlnzeEltM=;
 b=PMWOhQF+8VXZuvp+Yg95EkKAtodgXc5fCgJ2VecMzep+mT76n0iyQLlSqVwCtKMjZb
 wCUXiqVn8NSOBuOEJePmvbqG1I/lrgVAv/MyDLqDGH7yKR28/pCz/J/ZZVx67g9Tutv0
 RQHRpFapOsg8yEEpDJr20nLq7hPYbGrgkbbXmfcUEzBOrj05SloFh/e4aNTTb2KXSnYW
 /QbVl2mNRFODbfSFBlT/HLTsj3MWtP0+BzwDs/L9bdujFeeF7eU+yxWYwalhsFN0zMJO
 fBI/soN1VKjvvXjZFkaorGKISMejubo0AlciRZJbjQTPDw6BnFp+fAOcrxuBR2lM/0l9
 v5WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HaSMpiNAE5XGFluxVENpTh1dzhrXk37EmhnlnzeEltM=;
 b=afhkIizMLfNRc4/VPMWxPjDaiMjCJSg92diMVSfAcUx2/u5V2idZzyRDvsIaRlRok1
 smJocyoL03Pya3o+XwiZcFyMlq/MZ9Ed1o1Q9BJ79pfALXX2IzH5Fo2SydaTyjHfNACI
 0FwVrk5f1nrHusJRGeXUpVocR92lpWUb0suZlV1D34R4i1cjUTQVDgu8UWfMpl9D52/+
 0kk+vaZng3RaxUhO4NmuwCN/szMVT712Lg64vz/42n2ounQExiJfukHu/GHruCvrM5a5
 mUw9HqmjcImUD3Y5yap8SnIL1CUOdXC3ems8mtlWXVsJ2OXHFSZVkZdaiGeO5X7ixqpd
 i9bw==
X-Gm-Message-State: AOAM532Dxl9/CVIn1ZhKjAjoWajTt4nsHs7NIquWDQazd8LB4M4PP1uq
 DGkpCva3kZbXE+L2uGbC46OlKQ==
X-Google-Smtp-Source: ABdhPJxjJY7UVDpZ54xjReV6d6fHhTI3iYfdzY48yX+gAQrx7Z5OCHRlg6id4nfTZjtAeJkC4GdpBw==
X-Received: by 2002:a62:7653:: with SMTP id r80mr13367336pfc.236.1595689413689; 
 Sat, 25 Jul 2020 08:03:33 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id g22sm9059783pgb.82.2020.07.25.08.03.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jul 2020 08:03:33 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: palmer@dabbelt.com, Alistair.Francis@wdc.com, bmeng.cn@gmail.com,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH v5 0/4] Fix some PMP implementations
Date: Sat, 25 Jul 2020 23:03:23 +0800
Message-Id: <cover.1595689201.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=zong.li@sifive.com; helo=mail-pf1-x442.google.com
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
X-List-Received-Date: Sat, 25 Jul 2020 15:03:39 -0000

This patch set contains the fixes for wrong index of pmpcfg CSR on rv64,
and the pmp range in CSR function table. After 3rd version of this patch
series, we also fix the PMP issues such as wrong physical address
translation and ignoring PMP checking.

Changed in v5:
 - Pick the suggestion which was lost in last version.

Changed in v4:
 - Refine the implementation. Suggested by Bin Meng.
 - Add fix for PMP checking was ignored.

Changed in v3:
 - Refine the implementation. Suggested by Bin Meng.
 - Add fix for wrong pphysical address translation.

Changed in v2:
 - Move out the shifting operation from loop. Suggested by Bin Meng.

Zong Li (4):
  target/riscv: Fix the range of pmpcfg of CSR funcion table
  target/riscv/pmp.c: Fix the index offset on RV64
  target/riscv: Fix the translation of physical address
  target/riscv: Change the TLB page size depends on PMP entries.

 target/riscv/cpu_helper.c | 13 ++++++--
 target/riscv/csr.c        |  2 +-
 target/riscv/pmp.c        | 63 ++++++++++++++++++++++++++++++++++++++-
 target/riscv/pmp.h        |  2 ++
 4 files changed, 75 insertions(+), 5 deletions(-)

-- 
2.27.0


