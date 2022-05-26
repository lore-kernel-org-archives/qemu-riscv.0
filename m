Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nuANf-0007XF-RL
	for mharc-qemu-riscv@gnu.org; Thu, 26 May 2022 06:06:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nuANJ-0007Sp-TB
 for qemu-riscv@nongnu.org; Thu, 26 May 2022 06:05:51 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:35395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nuANI-0000rp-6a
 for qemu-riscv@nongnu.org; Thu, 26 May 2022 06:05:49 -0400
Received: by mail-pl1-x634.google.com with SMTP id c2so1064586plh.2
 for <qemu-riscv@nongnu.org>; Thu, 26 May 2022 03:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VE2v668IqUByf7s17sWOAVZmiRN8Aq5idPNCbLYWq8Y=;
 b=TqBpvkT7PdOXKY3j8rpKPHUmZGAEzDOJ1a2kRI/nv/WWtEMymLjXlr2ublYZ12HWXA
 qe1GgoBfWekwjvY/LVJmGONnwGDkkn3TWo+gjrW6lX7TUJOLiF9rkuvS5M6RuODsULeJ
 /DyYQDFdknz2pAAtrJ8ji33q1wXVE/OU8vdPR5ksunCqqjL2Ymr9hPm5q/KmVY2+uoEn
 Cdk/7nhLJselx3HzzaG2GNzc7YPBJWwEYzqP9Zb+RXnoGYt1K1YIC/bneulAC0n+hNot
 xReIEUdr8XdGVtq+WaJoCyamSzjJ8PBokTDTm1IRPqEYs4QXwYAthWXAXp1kUjbmFqsw
 RqYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VE2v668IqUByf7s17sWOAVZmiRN8Aq5idPNCbLYWq8Y=;
 b=UThX/+dkHyN3miiPG73eMVDjc5mUQaDeKlAD2FkZRuuXiq2+RVi/H9jWv/r7ZzCNnq
 VCO1dZPrlEinY767LyAc89JPX57+Pk43vJUJF25+3fsNXJyHocpvpFx31gwWFCkgPpGR
 M78uQG8tzKsVDOssnymlbsi9XIKZoz6GMf4iN2cSA9MlmvoBm09lFwE9oMKwPT7m8mF/
 TSofGgVcDY1T2v4rFlwFS0TZRswEeXXzcnzaBuzuNGD/brCUS0cq4tDZZ4H9tTQ9BYHM
 L9H8OZ2dj1Lcc5cgYfO/8VqX/ESUWm2e09p8Vy4WJ++2YhSJ38KO2qxDMcCahBKw5mdr
 r6mA==
X-Gm-Message-State: AOAM53141wE2xxaQQkt35iTD34IyKGUtibOhZ2Jb0vrZfeirQ9LFlfzV
 ce0d+CT6ef1/7ZrCOUyRTBlHGg==
X-Google-Smtp-Source: ABdhPJwOUAzGVtwzc4aj3iehDRt43vFqR6kJQcdKTXQ7Ycd1+03F/m/aAAgwyXAl0GVnOk4qWzbRdw==
X-Received: by 2002:a17:90b:4a4a:b0:1df:a250:e583 with SMTP id
 lb10-20020a17090b4a4a00b001dfa250e583mr1797253pjb.172.1653559545967; 
 Thu, 26 May 2022 03:05:45 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.94.60])
 by smtp.gmail.com with ESMTPSA id
 x26-20020aa793ba000000b0050dc76281e5sm1020126pff.191.2022.05.26.03.05.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 03:05:45 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v3 0/4] QEMU RISC-V nested virtualization fixes
Date: Thu, 26 May 2022 15:35:32 +0530
Message-Id: <20220526100536.49672-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=apatel@ventanamicro.com; helo=mail-pl1-x634.google.com
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
X-List-Received-Date: Thu, 26 May 2022 10:05:58 -0000

This series does fixes and improvements to have nested virtualization
on QEMU RISC-V.

These patches can also be found in riscv_nested_fixes_v3 branch at:
https://github.com/avpatel/qemu.git

The RISC-V nested virtualization was tested on QEMU RISC-V using
Xvisor RISC-V which has required hypervisor support to run another
hypervisor as Guest/VM.

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

 target/riscv/cpu.c        |  64 ++++++++++--
 target/riscv/cpu_bits.h   |   3 +
 target/riscv/cpu_helper.c | 210 +++++++++++++++++++++++++++++++++++++-
 target/riscv/csr.c        |   2 +
 target/riscv/instmap.h    |  43 ++++++++
 5 files changed, 310 insertions(+), 12 deletions(-)

-- 
2.34.1


