Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o631r-0005cg-Au
	for mharc-qemu-riscv@gnu.org; Tue, 28 Jun 2022 00:40:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1o631o-0005XN-MF
 for qemu-riscv@nongnu.org; Tue, 28 Jun 2022 00:40:45 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:41628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1o631m-0006Uf-14
 for qemu-riscv@nongnu.org; Tue, 28 Jun 2022 00:40:44 -0400
Received: by mail-pg1-x52b.google.com with SMTP id 23so11035090pgc.8
 for <qemu-riscv@nongnu.org>; Mon, 27 Jun 2022 21:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f9hgwU+rGkNoTu1v/vMzAIrmKXBdQdS/j+S6mjlnDsM=;
 b=hEEUv6v4WiebZHpAMlG7BC/Vaxkm5NmSPJ75wpSjm3qj/TToQB92D0xtQaSSJ2n4Zp
 rHJ1lF7nukpGdSwYNk3iN+NeWF9nOLhHvAt57/u24sZoiy/lBXs7wkhyaTAI3vTYNWWI
 h03hMDCJIXCPErq8BiYp10DjlyHzu2J3c1TI30BtouPzDLnFU9U/Vjj3Zy/ryNYhBN/6
 vlWnTLeC6FBV6d7avP8zl6axnS3yZBVlat4hNhtxqxeJON+TZkCQsLIkSInEW4lVYvOn
 idsKdjDWzIgO8lMPRGVRLTLEK2xLUG1aMgT7ufmWG6MxYYqSPemq0fgR+l0HWp4qIhUB
 zOuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f9hgwU+rGkNoTu1v/vMzAIrmKXBdQdS/j+S6mjlnDsM=;
 b=VMOSdOxEho/x4hbxH02bIEIBYFT9Z17OVVJlmXa+1g0U/UOjfDicox6hzyEnoeudTH
 BcIIIXavQJmEePZCUU+UaeYyasH5j7cyuWoXyofbKx3Q0+fwEscKQEWtif3Fdf+B7pI7
 mv1EoxWg22BbKmFO1oKe2KQwrjKZ+tfEVkRYM+g2oxlDTz8SNkM1gCkl85BS2fS2vWOq
 8wO5Lqj0B6g7KoBa/BHPk7u9txUF+bAca3Lc2fIDdJ31x9F04PlUtKVGtAIp+Pm5ii8g
 by7SlpM0vjsccEh4yXUXwspIcjD/NsJtBuEpoL51Y60oqyISPJSuRiWNfbFtf/4qzAaI
 /IFw==
X-Gm-Message-State: AJIora99jxCv6rnGR7XpuAt64Gi7J0GivFxf0czezccofJ+cYDrLDx6Q
 egwFTflu9j73c3GILUe3sfpxHg==
X-Google-Smtp-Source: AGRyM1vFdce5DQrMECE/92Gcva5dkQDa/67sSwRwnrb5DRuLkdvPo1A4T0PuTABYyLOrUbWOTHty3Q==
X-Received: by 2002:a05:6a00:18a4:b0:525:532e:76de with SMTP id
 x36-20020a056a0018a400b00525532e76demr2755284pfh.18.1656391240016; 
 Mon, 27 Jun 2022 21:40:40 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([117.96.230.192])
 by smtp.gmail.com with ESMTPSA id
 q62-20020a17090a17c400b001ece6f492easm10284001pja.44.2022.06.27.21.40.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:40:39 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v7 0/4] QEMU RISC-V nested virtualization fixes
Date: Tue, 28 Jun 2022 10:10:24 +0530
Message-Id: <20220628044028.659704-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=apatel@ventanamicro.com; helo=mail-pg1-x52b.google.com
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
X-List-Received-Date: Tue, 28 Jun 2022 04:40:45 -0000

This series does fixes and improvements to have nested virtualization
on QEMU RISC-V.

These patches can also be found in riscv_nested_fixes_v7 branch at:
https://github.com/avpatel/qemu.git

The RISC-V nested virtualization was tested on QEMU RISC-V using
Xvisor RISC-V which has required hypervisor support to run another
hypervisor as Guest/VM.

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

 target/riscv/cpu.c        | 150 ++++++++++++++++----------
 target/riscv/cpu.h        |   5 +
 target/riscv/cpu_bits.h   |   3 -
 target/riscv/cpu_helper.c | 214 ++++++++++++++++++++++++++++++++++++--
 target/riscv/csr.c        |   4 +-
 target/riscv/instmap.h    |  45 ++++++++
 6 files changed, 353 insertions(+), 68 deletions(-)

-- 
2.34.1


