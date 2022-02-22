Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nMdJb-0005mb-Kk
	for mharc-qemu-riscv@gnu.org; Tue, 22 Feb 2022 17:07:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nMdJY-0005lG-JC
 for qemu-riscv@nongnu.org; Tue, 22 Feb 2022 17:07:20 -0500
Received: from [2607:f8b0:4864:20::231] (port=33633
 helo=mail-oi1-x231.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nMdJV-0005LQ-2j
 for qemu-riscv@nongnu.org; Tue, 22 Feb 2022 17:07:19 -0500
Received: by mail-oi1-x231.google.com with SMTP id x193so16220934oix.0
 for <qemu-riscv@nongnu.org>; Tue, 22 Feb 2022 14:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8e87MQxDP9WKfM/Uq6rVPbcX7ntV66CZys3ScGDzKSY=;
 b=hekAWtb02YnJhNzU3v6cJrMxx6LaEW/CwSccmW/lnOD+Cmwh++CoxVJdq9xRFKK3aD
 iGWj+BqbOnc4YjtAuxAaliwpDULxxmA2lr4Em+LUCDljr7cVeWULfrf/Fwgt9laaSUUk
 Cck7Hn/WCwnqa4NzSglGel7TwqeOX05R//yxbYGqkpSe2CcO0/QUf4SFbima82+y6f+I
 ybFoKns3bASQQXZZuUtF1vFnhWWyCr4HR4k+VV60E927qkK2q9P79U+lT0Y06zd+XIjV
 UleDEsJJFEOz+ZRU6LjcYArrSI57cgyf1rRSNxoa38AnxjJ25H1ZLAgIwwUiO/OFtOAU
 SlDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8e87MQxDP9WKfM/Uq6rVPbcX7ntV66CZys3ScGDzKSY=;
 b=mjDZ9Df+wOfAJ0nmbVTIRrxbT9G/z1jW9MYlisFpd8zTzgg8lx1TP8shjsMPdZN59G
 sY3YcRmE0D3AePCo//9KN7X8L49g8hEOheLm5JBAc60gowLWF8tmzc604VWPOeEh6AaH
 JY5YOIfNYUaD6nem9Zn/2R46EjWwSaZzRhhm3aV1VK5d3BUVhnfwEXBtNMAoB4/CCvjN
 5Cy0qAbvktEMXSeb36S44CUNr7HlR73EHVl7w3nJ7UP02iYznO5DE46m6GFagjeI8GrT
 pH8DF8qMXRM6Zds2weBbO/m+TkpdCrfsoknsavXSFcj1cQaOHiQrCaYcLBT5N5O1ljFa
 xYVg==
X-Gm-Message-State: AOAM532073PbHFKt0Jj6FOWzlh92mubSLwAi7ypzA2s4q60DWx2olB2F
 4uQt183R5gJ8OcsYuuZhFSJEww==
X-Google-Smtp-Source: ABdhPJyITVm9vGD/pLSGY8B1jLk7+s6RqNFeRKdu9m8dH9Od3xJeIMHHhMVXJwz14r+gLaWt+RcuTw==
X-Received: by 2002:a05:6808:1205:b0:2d4:6eed:edd1 with SMTP id
 a5-20020a056808120500b002d46eededd1mr2963764oil.154.1645567628190; 
 Tue, 22 Feb 2022 14:07:08 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id n25sm4901913otq.78.2022.02.22.14.07.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 14:07:07 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v4 0/6] Privilege version update
Date: Tue, 22 Feb 2022 14:06:58 -0800
Message-Id: <20220222220704.2294924-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::231
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=atishp@rivosinc.com; helo=mail-oi1-x231.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Tue, 22 Feb 2022 22:07:21 -0000

RISC-V International (RVI) has ratified many RISC-V ISA extensions recently[1].
The privileged specification version is also upgraded to v1.12. It means
certain CSRs introduced in v1.12 should only be accessible only if the
priv specification version supported is equal or greater than v1.12.
Doing this check in predicate function is not scalable as there will be
new CSRs introduced in the future versions of the privileged specification.

This series tries to address this problem by adding a field in the csr_ops
which can be checked in csrrw function before invoking the predicate function.
To keep the code churn to minimum, it is assumed that the minimum version of
the privilege version supported for any CSR is v1.10 unless specified
explicitly in the csr_ops table. Any new CSRs introduced in v1.12 have been
updated accordingly.

This will work fine for any ratified extensions. However, it is bit unclear
what should be done for the stable draft extensions. My suggestion is not
to update the priv field in the CSR ops table until the extension is
marked experimental (i.e. not frozen/ratified). Once the extension is
ratified and graduated from experimental to available stage, the privileged
spec version should be updated in the csr table if required. I am open to
other suggestions as well.

[1] https://wiki.riscv.org/display/TECH/Recently+Ratified+Extensions

This series is rebased on top of the AIA v8 to avoid conflicts.

Changes from v3->v4:
1. Added reviewed-by tags.
2. Improved the commit text in PATCH 3 & 6.

Changes from v2->v3:
1. Only update the bits defined in *envcfg CSR

Changes from v1->v2:
1. Unified both [m/h]envcfg & [m/h]envcfgh into one.
2. Changed the priv spec version enumeration
3. Improved csr_ops table to provide better redability.
4. Fixed the compilation error for CONFIG_USER_ONLY
5. Rebased on top of the AIA series.

Atish Patra (6):
target/riscv: Define simpler privileged spec version numbering
target/riscv: Add the privileged spec version 1.12.0
target/riscv: Introduce privilege version field in the CSR ops.
target/riscv: Add support for mconfigptr
target/riscv: Add *envcfg* CSRs support
target/riscv: Enable privileged spec version 1.12

target/riscv/cpu.c      |   8 +-
target/riscv/cpu.h      |  15 ++-
target/riscv/cpu_bits.h |  40 ++++++++
target/riscv/csr.c      | 217 +++++++++++++++++++++++++++++++++-------
target/riscv/machine.c  |  24 +++++
5 files changed, 264 insertions(+), 40 deletions(-)

--
2.30.2


