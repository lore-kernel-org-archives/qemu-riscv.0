Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9dZ6-0008Ro-F7
	for mharc-qemu-riscv@gnu.org; Mon, 17 Jan 2022 20:45:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n9dYx-0008OD-AH
 for qemu-riscv@nongnu.org; Mon, 17 Jan 2022 20:45:32 -0500
Received: from [2607:f8b0:4864:20::633] (port=42950
 helo=mail-pl1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n9dYu-0007QW-7S
 for qemu-riscv@nongnu.org; Mon, 17 Jan 2022 20:45:30 -0500
Received: by mail-pl1-x633.google.com with SMTP id t18so22950583plg.9
 for <qemu-riscv@nongnu.org>; Mon, 17 Jan 2022 17:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MXWHyw1k8cc83/1WC6rn+xN6Jea9Fck/Wg/8Tc/cBJE=;
 b=jbLFzjXEJsR8TFETMc0QS6LtBtdEDZZ5QynliWX7bKqXAbPjmZ9ahHvwkrULs/CvgF
 cMcKLf3b89FJg69rkxBhU2zJPbinvCJ3AP1x9w5fsyxfGaHO3dZqWROUh6Yj4f2doHEI
 8Luon7Bv/OamI4TklnGxTdAMSYJ6Jv/YpAKqNs42agKdCIQMulX5oP9OR7KhwSp66oyI
 XG1lPcx0oosBCbaaITWpgYxIwoC6Aa+wbcWjgPro1jzx3tN7rt5qqXp9VJIQG548yZYt
 ha/28ZlEM/myNNIiaZZLjFOC5iVR6Ztscu9rG5kwWjY9Wvx696+7oWz1vmAeN1GOAnvV
 ecQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MXWHyw1k8cc83/1WC6rn+xN6Jea9Fck/Wg/8Tc/cBJE=;
 b=wLuUApHtjopkT5XV/kemerDOHgVNSOyemSbRD/0y1SGO4i+7TnjgcR86lWGJVKqGKs
 71O3KvUzWVrKC57aJgCCBYG5APVLgiBlOyRLerxtSh4+SycUJqb9NFHETVVjzniA8PBa
 yQsNCwgTrvk1f9x8cSXtKMip7ipFIjKrVINHCgRSMecqL664CG+1Ll43SYS/swcghDCS
 EqaMG49eI83/KPOTC9E90Sq3XpxxP7gTflS4+OXLwgrPtphOiCU7TSc1ePaW3IPqnMWU
 ac/7kaQMzg7FNnwPwXunUXyk8agNtobbfbYFMtDjGA7s5C2/Fz7xEc/XyCH7UXXkR26U
 d/HA==
X-Gm-Message-State: AOAM5315Xn0H9hdiqmQp6x7y6zcOPEdjia8Lb9iaIoPvZHHmSV1BYtUf
 X6GLVoWrJ+p+1Ie2FsNdQRxFtw==
X-Google-Smtp-Source: ABdhPJxG3m7aU9o9kmW8MjTp0JKnB16tUaDL99nN890+XpPusuj3XSWmYhuin7TMq11W/eraR4L1Ng==
X-Received: by 2002:a17:90b:3906:: with SMTP id
 ob6mr37751975pjb.170.1642470326781; 
 Mon, 17 Jan 2022 17:45:26 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id c12sm8286136pfm.113.2022.01.17.17.45.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 17:45:26 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v2 00/17] Add RISC-V RVV Zve32f and Zve64f extensions
Date: Tue, 18 Jan 2022 09:45:03 +0800
Message-Id: <20220118014522.13613-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::633
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 18 Jan 2022 01:45:33 -0000

From: Frank Chang <frank.chang@sifive.com>

In RVV v1.0 spec, several Zve* vector extensions for embedded processors
are defined in Chapter 18.2:
https://github.com/riscv/riscv-v-spec/blob/v1.0/v-spec.adoc#zve-vector-extensions-for-embedded-processors

This patchset implements Zve32f and Zve64f extensions.

The port is available at:
https://github.com/sifive/qemu/tree/rvv-zve32f-zve64f-upstream-v2

Zve32f can be enabled with -cpu option: Zve32f=true and
Zve64f can be enabled with -cpu option: Zve64f=true.
V is not required to be enabled explicitly.

Here's the inclusion diagram for the six standard vector extensions
quoted from Nick Knight <nick.knight@sifive.com>:

      V
      |
    Zve64d
      |
    Zve64f
   /      \
Zve64x   Zve32f
   \      /
    Zve32x

Changelog:

v2:
  * Replace hardcoded TARGET_RISCV32 macro with get_xl().

Frank Chang (17):
  target/riscv: rvv-1.0: Add Zve64f extension into RISC-V
  target/riscv: rvv-1.0: Add Zve64f support for configuration insns
  target/riscv: rvv-1.0: Add Zve64f support for load and store insns
  target/riscv: rvv-1.0: Add Zve64f support for vmulh variant insns
  target/riscv: rvv-1.0: Add Zve64f support for vsmul.vv and vsmul.vx
    insns
  target/riscv: rvv-1.0: Add Zve64f support for scalar fp insns
  target/riscv: rvv-1.0: Add Zve64f support for single-width fp
    reduction insns
  target/riscv: rvv-1.0: Add Zve64f support for widening type-convert
    insns
  target/riscv: rvv-1.0: Add Zve64f support for narrowing type-convert
    insns
  target/riscv: rvv-1.0: Allow Zve64f extension to be turned on
  target/riscv: rvv-1.0: Add Zve32f extension into RISC-V
  target/riscv: rvv-1.0: Add Zve32f support for configuration insns
  target/riscv: rvv-1.0: Add Zve32f support for scalar fp insns
  target/riscv: rvv-1.0: Add Zve32f support for single-width fp
    reduction insns
  target/riscv: rvv-1.0: Add Zve32f support for widening type-convert
    insns
  target/riscv: rvv-1.0: Add Zve32f support for narrowing type-convert
    insns
  target/riscv: rvv-1.0: Allow Zve32f extension to be turned on

 target/riscv/cpu.c                      |   6 +
 target/riscv/cpu.h                      |   2 +
 target/riscv/cpu_helper.c               |   5 +-
 target/riscv/csr.c                      |   6 +-
 target/riscv/insn_trans/trans_rvv.c.inc | 219 ++++++++++++++++++++----
 target/riscv/translate.c                |   4 +
 6 files changed, 205 insertions(+), 37 deletions(-)

--
2.31.1


