Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o68IG-0001sM-RW
	for mharc-qemu-riscv@gnu.org; Tue, 28 Jun 2022 06:18:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1o68IE-0001ou-Vb
 for qemu-riscv@nongnu.org; Tue, 28 Jun 2022 06:18:02 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:45627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1o68I6-0007zt-8o
 for qemu-riscv@nongnu.org; Tue, 28 Jun 2022 06:18:02 -0400
Received: by mail-pg1-x536.google.com with SMTP id 184so11726710pga.12
 for <qemu-riscv@nongnu.org>; Tue, 28 Jun 2022 03:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7tmIRvDoMHTBPZz03G3kX0MOFphU1dZwXLz0YnWto/U=;
 b=ihAOlNcrIznuVqXBV8rGUE/CfK0jQq6Ux84Mqi/xajlksfUjOyaNMWT+mbavwKdZkl
 xP9pvirKU3exCvyQOgRE0D8tigdW/vzc5SvE71uPkW/dKBudxkwZFGOT1CF2NBE3HHTo
 yZ0/IN/FYuY5k8ulYydePehGiI9848x/0Q8qRccZsLQDmKqAaYVLyRbFP/g6DPaciT8Z
 xun4xqrqWsI0V/JugRuPlZo2Z2Fu7yVM2M+pza4j8cxzqcDAuygg1SDvNIxB6qz+UO2l
 95TZWbvHYSm2HfJR8ckJxTVpPauxzkMsPW0dH/JjmU40eZdckr8gN2lM678jcPJ2Cj18
 67Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7tmIRvDoMHTBPZz03G3kX0MOFphU1dZwXLz0YnWto/U=;
 b=pC8f5NKIwfikRtyewJxjxVFc4eMBbsRxQ3ox+0nCEzF9B+8g20G8rkUJwHFzjjmnJZ
 6czhGvCFCA6Ql3S2j1jiw+gFs2tFe2YOCBBTBq0af3L+cp3oDcTnE198ULSF1et6bArb
 o8cL0tiCQyZHbIeLL/ZeBDjnm31ymW4tRtod8F/fO6vqi2IzGbUGpVSEAfxW3SJaCIKi
 W0da7mgFzxSAhhgXSKynIKdkqPZ4ohC19QCAvnGfcpIx0tMaCUNSEVniWxgMFFHjQT5d
 FjWnsPVyuNbOBqlnoE+9fhvfPNjxxyUE2v5kr86O9tyPPQSV4ejz30/xPWFfJ9FIZy6o
 jHnA==
X-Gm-Message-State: AJIora+wQoQZRZ6qmmeQJUoIH2jG+ogqjmmsnF7S2b/PeGVpq+2lbePT
 gLriC1awKKyLDfXCIK6OnLcTjA==
X-Google-Smtp-Source: AGRyM1vcnUGnVZZ34bBD0ILm2e2k5pHSa6xGhjvfzmYFC7FJimMXQCl2xe4DuDb7PSyJNOn5/dpuKw==
X-Received: by 2002:aa7:8e9e:0:b0:525:1d15:8fb8 with SMTP id
 a30-20020aa78e9e000000b005251d158fb8mr2771124pfr.35.1656411472699; 
 Tue, 28 Jun 2022 03:17:52 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([117.96.230.192])
 by smtp.gmail.com with ESMTPSA id
 bj28-20020a056a00319c00b0051bc36b7995sm8909621pfb.62.2022.06.28.03.17.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 03:17:52 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v8 0/4] QEMU RISC-V nested virtualization fixes
Date: Tue, 28 Jun 2022 15:47:33 +0530
Message-Id: <20220628101737.786681-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=apatel@ventanamicro.com; helo=mail-pg1-x536.google.com
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
X-List-Received-Date: Tue, 28 Jun 2022 10:18:03 -0000

This series does fixes and improvements to have nested virtualization
on QEMU RISC-V.

These patches can also be found in riscv_nested_fixes_v8 branch at:
https://github.com/avpatel/qemu.git

The RISC-V nested virtualization was tested on QEMU RISC-V using
Xvisor RISC-V which has required hypervisor support to run another
hypervisor as Guest/VM.

Changes since 7:
 - Improve tinst "Addr. Offset" in PATCH3

Changes since v6:
 - Droppred original PATCH1 and PATCH2 since these are already merged
 - Added PATCH1 to revert dummy mcountinhibit CSR
 - Added PATCH2 to fix minimum priv spec version for mcountinhibit CSR
 - Fixed checkpatch error in PATCH3
 - Fixed compile error in PATCH4

Changes since v5:
 - Correctly set "Addr. Offset" for misaligned load/store traps in PATCH3
 - Use offsetof() instead of pointer in PATCH4

Changes since v4:
 - Updated commit description in PATCH1, PATCH2, and PATCH4
 - Use "const" for local array in PATCH5

Changes since v3:
 - Updated PATCH3 to set special pseudoinstructions in htinst for
   guest page faults which result due to VS-stage page table walks
 - Updated warning message in PATCH4

Changes since v2:
 - Dropped the patch which are already in Alistair's next branch
 - Set "Addr. Offset" in the transformed instruction for PATCH3
 - Print warning in riscv_cpu_realize() if we are disabling an
   extension due to privilege spec verions mismatch for PATCH4

Changes since v1:
 - Set write_gva to env->two_stage_lookup which ensures that for
   HS-mode to HS-mode trap write_gva is true only for HLV/HSV
   instructions
 - Included "[PATCH 0/3] QEMU RISC-V priv spec version fixes"
   patches in this series for easy review
 - Re-worked PATCH7 to force disable extensions if required
   priv spec version is not staisfied
 - Added new PATCH8 to fix "aia=aplic-imsic" mode of virt machine

Anup Patel (4):
  Revert "target/riscv: Add dummy mcountinhibit CSR for priv spec v1.11
    or higher"
  target/riscv: Set minumum priv spec version for mcountinhibit
  target/riscv: Update [m|h]tinst CSR in riscv_cpu_do_interrupt()
  target/riscv: Force disable extensions if priv spec version does not
    match

 target/riscv/cpu.c        | 150 +++++++++++++++---------
 target/riscv/cpu.h        |   5 +
 target/riscv/cpu_bits.h   |   3 -
 target/riscv/cpu_helper.c | 235 +++++++++++++++++++++++++++++++++++++-
 target/riscv/csr.c        |   4 +-
 target/riscv/instmap.h    |  45 ++++++++
 6 files changed, 374 insertions(+), 68 deletions(-)

-- 
2.34.1


