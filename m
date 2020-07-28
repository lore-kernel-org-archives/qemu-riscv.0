Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k0KwO-0003ic-6f
	for mharc-qemu-riscv@gnu.org; Tue, 28 Jul 2020 04:26:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zong.li@sifive.com>)
 id 1k0KwM-0003fh-1Y
 for qemu-riscv@nongnu.org; Tue, 28 Jul 2020 04:26:26 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:45922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zong.li@sifive.com>)
 id 1k0KwK-0000oV-Bf
 for qemu-riscv@nongnu.org; Tue, 28 Jul 2020 04:26:25 -0400
Received: by mail-pf1-x42b.google.com with SMTP id f193so112599pfa.12
 for <qemu-riscv@nongnu.org>; Tue, 28 Jul 2020 01:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P7CEjkScGiX3F/aHH/ElgOi/6qZ/atlZLd1boZ9oeYs=;
 b=ns2h7DvpJVu2lbvSd2+vRq5us9GZLWDF/B09iAuhT2pIctflpmBIBLp4ID+nybDRHo
 KKC8WVVPy8soaEOEDBISIxF2EXKP34PhWtluBXJ39MYgEWiurpl2ZEd3gI/o6ZBhDdHB
 LtPaABGR2iG+JfJoJl1VTLszSFSWMm+qPs7JUBZomUeNBD/2yBuCYkFkTj5gP9Y83qIg
 YfcJO/UKYugl7zT/4FleWvaySzCKuQCv2DJiht+mLqodZqLSksdQE2tHi5QfYZ0+k5Az
 UfzEUfSrzNcohGNg4467wCP3y2x64JkIfEn18wmH3ZIR+77taScychUUpZXCfHzdoVxt
 /vmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P7CEjkScGiX3F/aHH/ElgOi/6qZ/atlZLd1boZ9oeYs=;
 b=AiFsd+teh6/lRYOeCrifOeWY/xgYJ8uwX0LOY4JLir3X/X9UM9+d3Q5croGiyWyIG3
 K0JL+x2hym+NMl7jRRt1RZoszFKAH2+g6IYJF+o1+sbr2wpM7KEMdDtE+Fj5s5sH7zvW
 LCS52pn8SmR6xeqsZk1gtHY6FmlHWPQeRViyT3s0qn5VVwYpjMVKDlUTcaba8NgW89Cr
 XS5bkqfVuZc+XJri2k44rvinB/d1hBUmHhFeBxxE6r49jJjbRyArYWYCIi8XhruwtoiK
 /ImijlRrEStaiYDGjIqtuMET7svq7YvDDGKQlwesNq7DGPJ/pcUxvZN94RZYN46B8/8P
 l0Ww==
X-Gm-Message-State: AOAM530/HuBwRsDIYkVECkvHJl02fmuqokVnmuhqz/hBie0HoclpEDj5
 eZx3+q0KnRQPEwrpb6kxyXTT5A==
X-Google-Smtp-Source: ABdhPJx1phqc7k2CDwDk3l4K3ALQQ6uZKBZXxxXcTBFx+tD9rPTG3i8oTCesaUc4TzgR6FzMM+pzEw==
X-Received: by 2002:a62:6dc7:: with SMTP id i190mr23993096pfc.16.1595924782806; 
 Tue, 28 Jul 2020 01:26:22 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h2sm17599747pfk.93.2020.07.28.01.26.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2020 01:26:22 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: palmer@dabbelt.com, Alistair.Francis@wdc.com, bmeng.cn@gmail.com,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH v6 0/4] Fix some PMP implementations
Date: Tue, 28 Jul 2020 16:26:13 +0800
Message-Id: <cover.1595924470.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=zong.li@sifive.com; helo=mail-pf1-x42b.google.com
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
X-List-Received-Date: Tue, 28 Jul 2020 08:26:26 -0000

This patch set contains the fixes for wrong index of pmpcfg CSR on rv64,
and the pmp range in CSR function table. After 3rd version of this patch
series, we also fix the PMP issues such as wrong physical address
translation and wrong ignoring PMP checking.

Changed in v6:
 - Mask low 12 bits of return value of riscv_cpu_get_phys_page_debug.
   Suggested by Alistair Francis.

Changed in v5:
 - Pick the suggestion which was lost in last version.

Changed in v4:
 - Refine the implementation. Suggested by Bin Meng.
 - Add fix for PMP checking was ignored.

Changed in v3:
 - Refine the implementation. Suggested by Bin Meng.
 - Add fix for wrong physical address translation.

Changed in v2:
 - Move out the shifting operation from loop. Suggested by Bin Meng.

Zong Li (4):
  target/riscv: Fix the range of pmpcfg of CSR funcion table
  target/riscv/pmp.c: Fix the index offset on RV64
  target/riscv: Fix the translation of physical address
  target/riscv: Change the TLB page size depends on PMP entries.

 target/riscv/cpu_helper.c | 15 +++++++---
 target/riscv/csr.c        |  2 +-
 target/riscv/pmp.c        | 63 ++++++++++++++++++++++++++++++++++++++-
 target/riscv/pmp.h        |  2 ++
 4 files changed, 76 insertions(+), 6 deletions(-)

-- 
2.27.0


