Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nonbm-00021P-Uf
	for mharc-qemu-riscv@gnu.org; Wed, 11 May 2022 10:46:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nonbg-0001yq-06
 for qemu-riscv@nongnu.org; Wed, 11 May 2022 10:46:29 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:38617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nonbe-0001AT-Al
 for qemu-riscv@nongnu.org; Wed, 11 May 2022 10:46:27 -0400
Received: by mail-pg1-x529.google.com with SMTP id 137so1995021pgb.5
 for <qemu-riscv@nongnu.org>; Wed, 11 May 2022 07:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Enoc3V9LSI02yYB4by7fwgJWxViZ8eSA+90wDYTpsOo=;
 b=nOTKSPA+earambedkjAryV1n7GQWT8hOT7jXQz+VwfTaNjmXQ6wziQEd7wvvxKbHR0
 US0110FtusXnnIKdknVglnxjtqbzxa9GDB55qqviN16iIrdlJI90K/2/bZZHPSj0u/QX
 IPFVDLAUxRqTi/yPif7K/5h2xuVbt5u2gWn/XrIRgUV+XwmnvBuKeIsciir8HpRC81wT
 dKjF2vq3YtwbxQ2pDpvVjXRroLsSFVy6OUxpk4F2AlzjTtjrrlj52gtaZV6uUju8gT0i
 uIt+7xFKcYNw/1Y848EYf/ufZVRVtiXDom6PSc5VG5Z6COEOFaUFNpPbao0ZdGOwj9Bf
 IQVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Enoc3V9LSI02yYB4by7fwgJWxViZ8eSA+90wDYTpsOo=;
 b=H8G8hnfA6lhhqVRX+lMpgsw8s9E4Q/1vYarFWsubY9jumv34/xZHE/CTsIXUg0FIyA
 fEuYnMa/zclFIZOOXJrnnlMj1Y8q+ZwDFb0ujylEybcGrPgppO6c4xkWtqm6AfZrGQ3d
 KaqMBPXenIf3KCybAaOC1+ackuH69yO2H1BqakXBoZAmzaRRudj5CJvVp5/7bXswST6G
 C7BKSjsZGHh6tEacTrSGIQ4YlCHZhmu6lJiepVErIlMnZ0fz9s2GdazWkX1Dad/maXoe
 IvSGHW9I35Ia0Ik1l3ILEqpVbbV5d/fY0OtnZyDe0wBszbDGtbE9kQsm7SeBSHGJCkCg
 K4lg==
X-Gm-Message-State: AOAM5337EN3THXMzNUpPTD24m4G0/UB7/jWyaC10VGHHE0CR6A5PHQhN
 +giGr4+uwT4WPvbJjId8sCPHQQ==
X-Google-Smtp-Source: ABdhPJwGh9j5H+AeEh2jpry8m5+ZglmDmijD8MHGF1sTyNlf0ly719dw1lmOJdvGsuIGQYI78bBy0Q==
X-Received: by 2002:a65:6a4c:0:b0:39c:f169:b54a with SMTP id
 o12-20020a656a4c000000b0039cf169b54amr21372913pgu.384.1652280383384; 
 Wed, 11 May 2022 07:46:23 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.113.90])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a170902820200b0015eafc485c8sm1958726pln.289.2022.05.11.07.46.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 07:46:22 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 0/8] QEMU RISC-V nested virtualization fixes
Date: Wed, 11 May 2022 20:15:20 +0530
Message-Id: <20220511144528.393530-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=apatel@ventanamicro.com; helo=mail-pg1-x529.google.com
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
X-List-Received-Date: Wed, 11 May 2022 14:46:30 -0000

This series does fixes and improvements to have nested virtualization
on QEMU RISC-V.

These patches can also be found in riscv_nested_fixes_v2 branch at:
https://github.com/avpatel/qemu.git

The RISC-V nested virtualization was tested on QEMU RISC-V using
Xvisor RISC-V which has required hypervisor support to run another
hypervisor as Guest/VM.

Changes since v1:
 - Set write_gva to env->two_stage_lookup which ensures that for
   HS-mode to HS-mode trap write_gva is true only for HLV/HSV
   instructions
 - Included "[PATCH 0/3] QEMU RISC-V priv spec version fixes"
   patches in this series for easy review
 - Re-worked PATCH7 to force disable extensions if required
   priv spec version is not staisfied
 - Added new PATCH8 to fix "aia=aplic-imsic" mode of virt machine

Anup Patel (8):
  target/riscv: Fix csr number based privilege checking
  target/riscv: Fix hstatus.GVA bit setting for traps taken from HS-mode
  target/riscv: Set [m|s]tval for both illegal and virtual instruction
    traps
  target/riscv: Update [m|h]tinst CSR in riscv_cpu_do_interrupt()
  target/riscv: Don't force update priv spec version to latest
  target/riscv: Add dummy mcountinhibit CSR for priv spec v1.11 or
    higher
  target/riscv: Force disable extensions if priv spec version does not
    match
  hw/riscv: virt: Fix interrupt parent for dynamic platform devices

 hw/riscv/virt.c           |  25 +++---
 target/riscv/cpu.c        |  46 +++++++++-
 target/riscv/cpu.h        |   8 +-
 target/riscv/cpu_bits.h   |   3 +
 target/riscv/cpu_helper.c | 172 ++++++++++++++++++++++++++++++++++++--
 target/riscv/csr.c        |  10 ++-
 target/riscv/instmap.h    |  41 +++++++++
 target/riscv/translate.c  |  17 +++-
 8 files changed, 292 insertions(+), 30 deletions(-)

-- 
2.34.1


