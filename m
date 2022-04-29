Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nkSeA-00054H-6U
	for mharc-qemu-riscv@gnu.org; Fri, 29 Apr 2022 11:35:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nkSe5-0004wP-VV
 for qemu-riscv@nongnu.org; Fri, 29 Apr 2022 11:35:03 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:54886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nkSe4-0007rS-5O
 for qemu-riscv@nongnu.org; Fri, 29 Apr 2022 11:35:01 -0400
Received: by mail-pj1-x1034.google.com with SMTP id fv2so7420071pjb.4
 for <qemu-riscv@nongnu.org>; Fri, 29 Apr 2022 08:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bXKWBVY3NxhjMBRD0PC/DdAoXy9LX4hKbVNoVoEffA0=;
 b=W5KuxKSDyhDRnNq/qINQYZpdmdV5Kx1HeEi5I1sopMj2kE4QHctH1bjsqy5pKN9IqX
 aBfbFbWaqA5/N3UAFfGyzck5X9FIja2hGSu6GlM9d/ZtMugABcmDwkRt45EgdIyfKXTH
 COFMEIlcj2JXshLdSPmvc4q9Bxp45EpxVi0Sxl4xoYerwlfOygWgoaITt5Wb3pLiJFOl
 Zq4i6VHzfcV+i9bKFeW+3AMlKWZ/RT5dHH/28onHanNIW/Yzygu+y/ADYPSqe1KP5IFI
 LRQLMW3L9pL99/mg9nsC+tY5w5czqKmY2SIwor2dlyO5A8Az2mmw1Ixk9b+mwcNU5R7T
 AXSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bXKWBVY3NxhjMBRD0PC/DdAoXy9LX4hKbVNoVoEffA0=;
 b=K4ILnDxNpDL7MjG/NKZzBWmOM9eTEJMpKAxzX4JvvZVfNJd0qxwhl3de6PVAuCxpLp
 cM/TgiPrUl/RMJlQrAaVKPafj9EZCmBUUNUHSQCSnKRSYdrQ1JrLrn9YaOIQmwyMC/b2
 uq35qPvxFeW6p15vsr3tlLmty1VRrQUlOXL0Z7pki959IHcuI2obRRqohjc1Cfe+VX1K
 d+jbxb3t9POUJyFmtGrt72owrt2TaM+FzyR8BYdQYAKT+wdMOiPyXNQFhex3hT1sXSuP
 AMnDI68Z+cGW+Rmkob2Qqc2NFfujWdKR5So4snctD6z4Oxi2R3txeF59xeC3GtNZ5IQY
 OFkg==
X-Gm-Message-State: AOAM5313jIZMXfk31O0kGpBAy+CaEu28EKrer9jS02av1HYuThjd95Dq
 LPu3Eik6HbVEiV8LP6WEgdv2tQ==
X-Google-Smtp-Source: ABdhPJzJCwkqTaEk6L1bMMxAcp6g/OgJpmJJKo/gOtlQZeLBJhJUkyQo9GvPWXUj/cGYbnGD4vLGXw==
X-Received: by 2002:a17:903:185:b0:15e:8bfa:ed63 with SMTP id
 z5-20020a170903018500b0015e8bfaed63mr85458plg.153.1651246498719; 
 Fri, 29 Apr 2022 08:34:58 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([122.167.97.237])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a65608d000000b003c14af50606sm6439380pgu.30.2022.04.29.08.34.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 08:34:58 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 0/3] QEMU RISC-V priv spec version fixes
Date: Fri, 29 Apr 2022 21:04:28 +0530
Message-Id: <20220429153431.308829-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=apatel@ventanamicro.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 29 Apr 2022 15:35:03 -0000

This series covers few fixes discovered while trying to detect priv spec
version on QEMU virt machine and QEMU sifive_u machine.

These patches can also be found in riscv_priv_version_fixes_v1 branch at:
https://github.com/avpatel/qemu.git

Anup Patel (3):
  target/riscv: Don't force update priv spec version to latest
  target/riscv: Add dummy mcountinhibit CSR for priv spec v1.11 or
    higher
  target/riscv: Consider priv spec version when generating ISA string

 target/riscv/cpu.c      | 46 ++++++++++++++++++++++-------------------
 target/riscv/cpu_bits.h |  3 +++
 target/riscv/csr.c      |  2 ++
 3 files changed, 30 insertions(+), 21 deletions(-)

-- 
2.34.1


