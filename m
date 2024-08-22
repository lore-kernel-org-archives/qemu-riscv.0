Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B0E6C5320E
	for <qemu-riscv@archiver.kernel.org>; Thu, 22 Aug 2024 08:25:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sh38B-000514-D8; Thu, 22 Aug 2024 04:25:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sh38A-00050b-42
 for qemu-riscv@nongnu.org; Thu, 22 Aug 2024 04:25:18 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sh381-0005vU-Px
 for qemu-riscv@nongnu.org; Thu, 22 Aug 2024 04:25:17 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-202376301e6so3957385ad.0
 for <qemu-riscv@nongnu.org>; Thu, 22 Aug 2024 01:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724315107; x=1724919907;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RUzJWHSZ6VZj5szyNKj7biChyxJm3oLfyQpa8ekQNUo=;
 b=nOgKBAbzIDOhuWeBgGMVkt7YiMUTTKhZwDY4hxeDaIrAjtGtXsRIkVcxa6WGpBIfek
 Q0TosX6xmDkvvPR77DNUDHIndjDmFmzd2/WgtvVvQmKvcvBPkakEPOFfrNsWAHj22E0Q
 dVSMBWT/cX9NohZwhmSRiIoSrrb2olKY3exhXYz3FsF7zJa10FG1a+4IuzlioXINKXB1
 PBBOOR2nmHX0N2oZiWjHuz89NHClO1ppg7KhUpZ9NodHa3ScGN5a3/Rdw8HlZOXXJ0/4
 agWZBh3lYh2OQXxed0nygMB/zonEgGj8e41M7btdSExtZ+GRMZ/OMd3Y+pa29bjEELxI
 1E4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724315107; x=1724919907;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RUzJWHSZ6VZj5szyNKj7biChyxJm3oLfyQpa8ekQNUo=;
 b=QADYNqCk7tNtweGERGq0+ZcO8lznoQhHyAtNxTzYXfJJy6UzIKwLWm0hidyd7QMifr
 U4lqh29WxflvS1UOzMrbcDIymo6DQkQJOmDcDNIzgv5wyAljcBPi8lIdu+BpbFlAFiTO
 TUMZWLRNtuOkoW4ohLZKkVlAGgH/8YEVsj4C4mV6Jac9rBquK8fuw3trKy3xMvQpcWq8
 Gg+z4tCuw+tt0ZCmVrYdkKOK/y4OR4vsAFN3H8aQwmk0AxymXmsSMKa847tpb/17LAyi
 G6a9zAMsGrrauJSOorskirIN7E5iTuFXQwVrkIJ1JVlA7dVbWObWGCPCBR0iyBN87kEK
 E1Cw==
X-Gm-Message-State: AOJu0YwVtkWJeXB1bpfHL7p6ixQHL9WycWec3xeBgGxzjaEXeHzrhA/O
 +alYMTtK941bTJwmJJtjxOEiE/+KJWBrYDZX1PgJJxfvm3KAtqry45ImxQR+GNAG79WAe6jh+zJ
 j
X-Google-Smtp-Source: AGHT+IEwYESzoehvnQFipW21qXnYAR2Vp8Uozg0Jimb3b4ojt6bCjj6TpoLY9gvg0KNnzVeJR00tpA==
X-Received: by 2002:a17:902:d502:b0:1fa:fc74:4c04 with SMTP id
 d9443c01a7336-20388250196mr14510455ad.35.1724315107138; 
 Thu, 22 Aug 2024 01:25:07 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20385589225sm7641295ad.115.2024.08.22.01.25.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2024 01:25:06 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, Alistair.Francis@wdc.com, bmeng.cn@gmail.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, jim.shu@sifive.com, andy.chiu@sifive.com,
 kito.cheng@sifive.com, Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v7 00/17] riscv support for control flow integrity extensions
Date: Thu, 22 Aug 2024 01:24:46 -0700
Message-ID: <20240822082504.3979610-1-debug@rivosinc.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=debug@rivosinc.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

v7 for riscv zicfilp and zicfiss extensions support in qemu.

Links for previous versions
[1] - v1 https://lists.nongnu.org/archive/html/qemu-devel/2024-07/msg06017.html
[2] - v2 https://lore.kernel.org/all/ed23bcbc-fdc4-4492-803c-daa95880375a@linaro.org/T/
[3] - v3 https://lists.nongnu.org/archive/html/qemu-devel/2024-08/msg01005.html
[4] - v4 https://lore.kernel.org/all/20240816010711.3055425-6-debug@rivosinc.com/T/
[5] - v5 https://lore.kernel.org/all/20240820000129.3522346-1-debug@rivosinc.com/T/#m7b9cc847e739ec86f9569a3ca9f3d9377b01e21
[6] - v6 https://mail.gnu.org/archive/html/qemu-riscv/2024-08/msg00418.html

---
v7:
   - Updated decode_save_opc to take extra argument of excp_uw2 and
     updated callsites
   - added a helper for promoting load faults to store faults
   - Removed stale comments and edited existed comments
v6:
   - Added support extra store word 2 for tcg compile and extraction during unwind
   - Using extra word, AMO instructions and shadow stack instructions can raise store fault
   - some alignment and cosmetic changes
   - added vmstate migration support for elp and ssp cpu state
v5:
   - Simplified elp tracking and lpad implementation as per suggestion by richard
   - Simplified shadow stack mmu checks as per suggestion by richard
   - Converged zicfiss compressed and non-comressed instructions to same translation
   - Removed trace hooks. Don't need for upstream.

v4:
   - elp state in cpu is true/false instead of enum and elp cleared
     unconditionally on trap entry. elp in *status cleared unconditionally on
     trap return.
   - Moved logic for branch tracking in instruction translation from tb_start.
   - fixed zicfiss dependency on 'A'
   - `cpu_get_fcfien/bcfien` helpers checks fixed to check for extension first.
   - removed trace hook enums. Instead added dedicated trace helpers wherever needed.
   - fixed/simplified instruction format in decoder for lpad, sspush, sspopchk
   - simplified tlb index logic for shadow stack instructions. Removed SUM TB_FLAG
   - access to ssp CSR is gated on `cpu_get_bcfien` instead of duplicated logic
   - removed vDSO related changes for now.
v3:
   - Removed prctl specific patches because they need to be upstream
     in kernel first.
   - As suggested by Richard, added TB flag if fcfi enabled
   - Re-worked translation for landing pad and shadow stack instructions
     to not require helper.
   - tcg helpers only for cfi violation cases so that trace hooks can be
     placed.
   - Style changes.
   - fixes assert condition in accel/tcg

v2:
   - added missed file (in v1) for shadow stack instructions implementation.

Deepak Gupta (17):
  target/riscv: Add zicfilp extension
  target/riscv: Introduce elp state and enabling controls for zicfilp
  target/riscv: save and restore elp state on priv transitions
  target/riscv: additional code information for sw check
  target/riscv: tracking indirect branches (fcfi) for zicfilp
  target/riscv: zicfilp `lpad` impl and branch tracking
  disas/riscv: enable `lpad` disassembly
  target/riscv: Add zicfiss extension
  target/riscv: introduce ssp and enabling controls for zicfiss
  target/riscv: tb flag for shadow stack  instructions
  target/riscv: mmu changes for zicfiss shadow stack protection
  target/riscv: AMO operations always raise store/AMO fault
  target/riscv: update `decode_save_opc` to store extra word2
  target/riscv: implement zicfiss instructions
  target/riscv: compressed encodings for sspush and sspopchk
  disas/riscv: enable disassembly for zicfiss instructions
  disas/riscv: enable disassembly for compressed sspush/sspopchk

 disas/riscv.c                                 |  77 ++++++++-
 disas/riscv.h                                 |   4 +
 target/riscv/cpu.c                            |  17 ++
 target/riscv/cpu.h                            |  24 ++-
 target/riscv/cpu_bits.h                       |  17 ++
 target/riscv/cpu_cfg.h                        |   2 +
 target/riscv/cpu_helper.c                     | 153 +++++++++++++++++-
 target/riscv/cpu_user.h                       |   1 +
 target/riscv/csr.c                            |  84 ++++++++++
 target/riscv/insn16.decode                    |   4 +
 target/riscv/insn32.decode                    |  26 ++-
 .../riscv/insn_trans/trans_privileged.c.inc   |   8 +-
 target/riscv/insn_trans/trans_rva.c.inc       |  43 ++++-
 target/riscv/insn_trans/trans_rvd.c.inc       |   4 +-
 target/riscv/insn_trans/trans_rvf.c.inc       |   4 +-
 target/riscv/insn_trans/trans_rvh.c.inc       |   8 +-
 target/riscv/insn_trans/trans_rvi.c.inc       |  61 ++++++-
 target/riscv/insn_trans/trans_rvvk.c.inc      |  10 +-
 target/riscv/insn_trans/trans_rvzacas.c.inc   |   4 +-
 target/riscv/insn_trans/trans_rvzfh.c.inc     |   4 +-
 target/riscv/insn_trans/trans_rvzicfiss.c.inc |  75 +++++++++
 target/riscv/insn_trans/trans_svinval.c.inc   |   6 +-
 target/riscv/internals.h                      |   3 +
 target/riscv/machine.c                        |  38 +++++
 target/riscv/op_helper.c                      |  18 +++
 target/riscv/pmp.c                            |   5 +
 target/riscv/pmp.h                            |   3 +-
 target/riscv/tcg/tcg-cpu.c                    |  25 +++
 target/riscv/translate.c                      |  45 +++++-
 29 files changed, 724 insertions(+), 49 deletions(-)
 create mode 100644 target/riscv/insn_trans/trans_rvzicfiss.c.inc

-- 
2.44.0


