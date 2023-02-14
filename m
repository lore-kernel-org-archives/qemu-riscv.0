Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pS0uO-0005Po-6V
	for mharc-qemu-riscv@gnu.org; Tue, 14 Feb 2023 14:24:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pS0uM-0005Pa-Pf
 for qemu-riscv@nongnu.org; Tue, 14 Feb 2023 14:24:06 -0500
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pS0uL-000564-4Y
 for qemu-riscv@nongnu.org; Tue, 14 Feb 2023 14:24:06 -0500
Received: by mail-ot1-x330.google.com with SMTP id
 38-20020a9d04a9000000b0068f24f576c5so4693925otm.11
 for <qemu-riscv@nongnu.org>; Tue, 14 Feb 2023 11:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sDOKBvIjt3P4hPy8PpHlQ8mWu4cX+s8P0mKPtJhhN7M=;
 b=QwX8gRSV6uQG4ZjFQx9+q7p0Cotb1aU8e/Z2qBDvcyBOSRGmo3UDahahfEST0WM7ud
 mlZ3UsYesxguW2Yym7sU2BW2nX9Kc0IlS90Dcv92hW1EVjNXBy4jR14CttAgTIUDH+Is
 nOos08548cKiGf/aGR3YMsBKV6kvTq1nYRrIwVh+3hHd2gNM74mhmUNkuyTK/67/ISik
 77os2NGayNlfSvS8gTtFP4Q9RDuELe2hUTlgYyUUQZdXBpnYi+1l7N/i2n+tsuyA11+R
 lMzfPRR3763Dkw6QQuM7OSALHsYfMwWsVNx1igf/XVynhRMkry0ZWx3gza4kfwVrypWR
 EGig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sDOKBvIjt3P4hPy8PpHlQ8mWu4cX+s8P0mKPtJhhN7M=;
 b=ezmU4OxFIq3xgmeVd/bbuMWkTMCjh+WL2Icy7PPHy2RVEHPiqZPiCPPXwObtXk4Ylf
 Me8/Nc40sim+mKg+y41j29Pw1jwOc5KV0TuflUWrHJrOoLgniyqFVGQLlxd6QO+ngYbU
 iDGp/xb547g0mALVPXBzHPmomHWFF1Lz2CQsfj38Apuv9fcQ/WTCPlgRVqrFK359YX13
 dMLPgdE0enqidtqOuZf2D5W45x8oNclWRS48IZfoXzQeF+wDfpS1GzIXoLDHwl1nIMOd
 SZmfDCJFiYV1aQ9f3mOjv2W/p2j6/DsmpuNzJYgUE6kiowF9Z18QI0IDesD/ka39FbZL
 hf2Q==
X-Gm-Message-State: AO0yUKVmjrssA3rRDS7Eqvz7eDol4k1BXBv7jWY6fClvvhMS32tfwbxB
 3bTIowuSlKl3EZyjIbhDFs9gIw==
X-Google-Smtp-Source: AK7set/YBNJDBshcsWfSuvoHfKnWPmNhM+4WfyyR8DrtoPcS7iqcgrbNgHYng207G8yeuqDhSmrlnw==
X-Received: by 2002:a05:6830:1d9c:b0:68d:3ea5:1734 with SMTP id
 y28-20020a0568301d9c00b0068d3ea51734mr1568103oti.16.1676402643441; 
 Tue, 14 Feb 2023 11:24:03 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 g5-20020a9d6185000000b006865223e532sm6653752otk.51.2023.02.14.11.24.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 11:24:02 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 00/11] enable write_misa() and RISCV_FEATURE_* cleanups
Date: Tue, 14 Feb 2023 16:23:45 -0300
Message-Id: <20230214192356.319991-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 14 Feb 2023 19:24:07 -0000

Hi,

This new version contains suggestions made by Weiwei Li in v1. Most
notable change is patch 4 from v1, moving up to patch 2 now,  to allow
the riscv_cpu_cfg() helper to be used in the MISA CSR patch.


Changes in v2:
- former patch 4 moved to patch 2
- patch 3 (former 2):
  - use riscv_cpu_cfg()
- patch 9:
  - remove the uneeded RISCVCPUConfig and access mmu via
    cpu_cfg->cfg.mmu
- v1 link: https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg02780.html

Daniel Henrique Barboza (11):
  target/riscv: do not mask unsupported QEMU extensions in write_misa()
  target/riscv: introduce riscv_cpu_cfg()
  target/riscv: allow users to actually write the MISA CSR
  target/riscv: remove RISCV_FEATURE_MISA
  target/riscv: remove RISCV_FEATURE_DEBUG
  target/riscv/cpu.c: error out if EPMP is enabled without PMP
  target/riscv: remove RISCV_FEATURE_EPMP
  target/riscv: remove RISCV_FEATURE_PMP
  hw/riscv/virt.c: do not use RISCV_FEATURE_MMU in
    create_fdt_socket_cpus()
  target/riscv: remove RISCV_FEATURE_MMU
  target/riscv/cpu: remove CPUArchState::features and friends

 hw/riscv/virt.c           |  7 ++++---
 target/riscv/cpu.c        | 20 +++++---------------
 target/riscv/cpu.h        | 29 ++++++-----------------------
 target/riscv/cpu_helper.c |  6 +++---
 target/riscv/csr.c        | 15 ++++++---------
 target/riscv/machine.c    | 11 ++++-------
 target/riscv/monitor.c    |  2 +-
 target/riscv/op_helper.c  |  2 +-
 target/riscv/pmp.c        |  8 ++++----
 9 files changed, 34 insertions(+), 66 deletions(-)

-- 
2.39.1


