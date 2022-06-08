Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nyyL2-0006yi-19
	for mharc-qemu-riscv@gnu.org; Wed, 08 Jun 2022 12:15:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nyyKz-0006xy-98
 for qemu-riscv@nongnu.org; Wed, 08 Jun 2022 12:15:17 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:41708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nyyKw-0002WH-Mw
 for qemu-riscv@nongnu.org; Wed, 08 Jun 2022 12:15:17 -0400
Received: by mail-pf1-x435.google.com with SMTP id p8so18738913pfh.8
 for <qemu-riscv@nongnu.org>; Wed, 08 Jun 2022 09:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ye7qowjymE6a2untk/Inc0svuhz6XenkMYp9dz7V4es=;
 b=B70Cwen1OWiHvSG3PCPTCekJGeFT3G5vURODOrj5q37TJf1HmqtNQd9s/MmBHrUESL
 pRXwMBLCZoFL/G6hexp5SW0xbJ45SLOWzO96QvMGSEnjb1n3qPWcwsmR/TH6y/vf0nfX
 GGWfn2xUxKyoNShwlLSzsWbhvb7pJGtwj15Iw+6DLA9JaLC+zCLnZXbAqgcmqovN3M4H
 Zj6a7XspI4P6qwZwtSYC46vq5xG5J4MHtwYX9qztkLXLzRvNkvtq7exIvuG+yFN/S3hd
 dInqbUUTfkykI0X0Rmcyi+MigzkPZbOMi0jVVwE44v4mCm6hRsuD4V0zqAPm6tOBw35I
 hf9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ye7qowjymE6a2untk/Inc0svuhz6XenkMYp9dz7V4es=;
 b=N42xYOPTZzCxi0iJZ9+Cx8Fne2op3cxqOqNCM7iH57gXm+I33XBOTDcW3BqIaMX/E9
 wDWjN0b7oDCv4DKm3DIXM3zBQA6HfBEZ3l2Qxvyew2k55EzHO0yWuhS3j55JPfu3JKqR
 3/XN/czrk2sqH0XLwfmx1QBkae1+NKJSJBIRqZNL9pP5lvbZHg2uP9HBYkzHD9HSHjpO
 I12QI0LOSPo6Z0OiAC+e88A+zcgqhAF4FlfSknhhz5RRyBxrfabopA4tGgGjQZ8w36ez
 33g3BUhXD27JrDUUmNLIrS4o3n8Q8gJW/Sn/9V9v1D8iMGxh6VpFYRIV4mlQHkqYY6oE
 DlKA==
X-Gm-Message-State: AOAM533LHWCVsuoV8HOGlfpbLmQs8vuijn1NayQArwKIp6T22eIK93jp
 qtKwcul014tFBTC/mS12WGBxdw==
X-Google-Smtp-Source: ABdhPJzRCeSzEL6FdOVPRH4eAvhQXiHk0KTDo/yx5fcSJJW7tM9B0Yrrh8e3MAzQPQTHy9of0VTNKg==
X-Received: by 2002:a65:6e9b:0:b0:3c5:f761:2d94 with SMTP id
 bm27-20020a656e9b000000b003c5f7612d94mr30324465pgb.79.1654704911762; 
 Wed, 08 Jun 2022 09:15:11 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([122.162.103.97])
 by smtp.gmail.com with ESMTPSA id
 k189-20020a6384c6000000b003fcde69fea5sm13374843pgd.81.2022.06.08.09.15.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 09:15:11 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v4 0/4] QEMU RISC-V nested virtualization fixes
Date: Wed,  8 Jun 2022 21:44:01 +0530
Message-Id: <20220608161405.729964-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=apatel@ventanamicro.com; helo=mail-pf1-x435.google.com
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
X-List-Received-Date: Wed, 08 Jun 2022 16:15:18 -0000

This series does fixes and improvements to have nested virtualization
on QEMU RISC-V.

These patches can also be found in riscv_nested_fixes_v4 branch at:
https://github.com/avpatel/qemu.git

The RISC-V nested virtualization was tested on QEMU RISC-V using
Xvisor RISC-V which has required hypervisor support to run another
hypervisor as Guest/VM.

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
  target/riscv: Don't force update priv spec version to latest
  target/riscv: Add dummy mcountinhibit CSR for priv spec v1.11 or
    higher
  target/riscv: Update [m|h]tinst CSR in riscv_cpu_do_interrupt()
  target/riscv: Force disable extensions if priv spec version does not
    match

 target/riscv/cpu.c        |  65 +++++++++--
 target/riscv/cpu.h        |   3 +
 target/riscv/cpu_bits.h   |   3 +
 target/riscv/cpu_helper.c | 231 +++++++++++++++++++++++++++++++++++++-
 target/riscv/csr.c        |   2 +
 target/riscv/instmap.h    |  43 +++++++
 6 files changed, 333 insertions(+), 14 deletions(-)

-- 
2.34.1


