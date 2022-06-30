Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o6nQ2-0002wx-V4
	for mharc-qemu-riscv@gnu.org; Thu, 30 Jun 2022 02:12:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1o6nPu-0002vM-Nj
 for qemu-riscv@nongnu.org; Thu, 30 Jun 2022 02:12:42 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:42872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1o6nPt-00009P-36
 for qemu-riscv@nongnu.org; Thu, 30 Jun 2022 02:12:42 -0400
Received: by mail-pf1-x42e.google.com with SMTP id d17so17150770pfq.9
 for <qemu-riscv@nongnu.org>; Wed, 29 Jun 2022 23:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0V8kDP+oNTzrb5XC+Br+wrvMv2zDwwg3nO5BEOrf9Ew=;
 b=Njg9/niivwJInXC8T33mx1fSJLTEQiDZhbqMeLrs7fyX+765mS9Ixk4RreY/kEVaM1
 khlwdcAoNkEj8qJT6yuajPyXFAHAO+ltLEfjL9ORbc8ftwuBx9tGcOkdCKv+YbGR/L5K
 mEZemQau+kiaXxv2SLQOHVxpANwdDmolcokvt666Ce+YWOcR2s+RuiNN4JBkBrxrlNKN
 qXENEiyjArSZa5HMipxdgOd2VmrgAPUBAeSApVcT6LmTVAqD+INWtRp6ZXa9Ovr4z6b2
 sRTJPsgGwAiABCx+RMuAba35/J9hiixhh393RNJdMgrcQGakpNSCFIY/yDD8cKTvhRcX
 xFeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0V8kDP+oNTzrb5XC+Br+wrvMv2zDwwg3nO5BEOrf9Ew=;
 b=iSlYr3MEfEMugZ2pwnIkf4kPddz6sujEx69YbjmitlCCot85KP8ez9CRX5ws/wrXDN
 vJcc4ULNeDYoJg9W6Lg1ngMTTWrZhudUnLbCKIn5d1UUikPcw3WxHifYDYDkJHDFWQiF
 j+OlXHsa3edu/xElG+PbC5X/v3PNnCzUAHj2SmCKTPMiphXtj7To8TM7pZrC3/FbaL92
 WhJ9RthL91213/n0hV8n1tye9FnJJrt5qy04eODoA0PIsEzO71zPz3r2JmGVNjoJW668
 LaE1FDnWTZft6d00HJQAHOvmhGPWTCsqYhUcH9SUHKnQ4JOvWpG4s5Fw0oyS836arbXs
 XsTg==
X-Gm-Message-State: AJIora9ro/HCyvsm7zTUXTBguPWcsNB3QfTZl0wmOCJOmTZImYXxJeI/
 G/GubvvSvsGafXut1AnSkuqllw==
X-Google-Smtp-Source: AGRyM1tLJvWezpO1w4M1uFeAW0G7ruLA/6qcdfzWVMfBC6qxaFy6Uc8xcO25U7L9QhYFRv0HnravbA==
X-Received: by 2002:a63:88c1:0:b0:40d:5305:b36b with SMTP id
 l184-20020a6388c1000000b0040d5305b36bmr6311213pgd.394.1656569559018; 
 Wed, 29 Jun 2022 23:12:39 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([223.226.107.19])
 by smtp.gmail.com with ESMTPSA id
 a25-20020aa79719000000b0052551c1a413sm12647618pfg.204.2022.06.29.23.12.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 23:12:38 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v9 0/2] QEMU RISC-V nested virtualization fixes
Date: Thu, 30 Jun 2022 11:41:48 +0530
Message-Id: <20220630061150.905174-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=apatel@ventanamicro.com; helo=mail-pf1-x42e.google.com
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
X-List-Received-Date: Thu, 30 Jun 2022 06:12:45 -0000

This series does fixes and improvements to have nested virtualization
on QEMU RISC-V.

These patches can also be found in riscv_nested_fixes_v9 branch at:
https://github.com/avpatel/qemu.git

The RISC-V nested virtualization was tested on QEMU RISC-V using
Xvisor RISC-V which has required hypervisor support to run another
hypervisor as Guest/VM.

Changes since v7:
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

Anup Patel (2):
  target/riscv: Update [m|h]tinst CSR in riscv_cpu_do_interrupt()
  target/riscv: Force disable extensions if priv spec version does not
    match

 target/riscv/cpu.c        | 150 ++++++++++++++---------
 target/riscv/cpu.h        |   5 +
 target/riscv/cpu_helper.c | 252 +++++++++++++++++++++++++++++++++++++-
 target/riscv/instmap.h    |  45 +++++++
 4 files changed, 390 insertions(+), 62 deletions(-)

-- 
2.34.1


