Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1749C5321D
	for <qemu-riscv@archiver.kernel.org>; Fri, 23 Aug 2024 19:04:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1shZXm-000324-1a; Fri, 23 Aug 2024 15:01:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1shZXi-00030C-8n
 for qemu-riscv@nongnu.org; Fri, 23 Aug 2024 15:01:50 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1shZXe-0004HM-Tu
 for qemu-riscv@nongnu.org; Fri, 23 Aug 2024 15:01:48 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-20230059241so20462405ad.3
 for <qemu-riscv@nongnu.org>; Fri, 23 Aug 2024 12:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724439704; x=1725044504;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ME8H25kN5IBBjNE/ox4rld1h8HG8unpzHQGOIS2+uio=;
 b=fwM9+XFXRkDrLU1h/wotexyZ5kAbe98yebe5FsYpJ4fmC+s+/geJNbv6dX3CzVXpa1
 8+SAz/uwZU7j87flR955si3AALjK5T+uOB4mSZc4WNm5i2UnH2p4pm3jpwhcZ6NJ1Gvi
 Rz2k2EzknCk39izMBQiZ8aLsMSrDdlU972URKBRSC4GmsRYWANTvd28IK+/60f3fM1Pq
 iMnY2RO1a3XDzqqonfvvW29QUjZpt+eAl544XPaQPXqEEIIzTbQOLRwLOwH4/uTwqU5M
 9RShFXD8SoschN4QOKF8XStCbLIHIprI+Y3C61T54Z6eYG7XOhGH3I6hLzC/4Lz0QkMk
 bTrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724439704; x=1725044504;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ME8H25kN5IBBjNE/ox4rld1h8HG8unpzHQGOIS2+uio=;
 b=J7iNUCszLs7X1HTdWA7H6P1Ul/Ervgd0oo7n14apFe2Aw7+myV19VkfxA7Uo/BfZXi
 gpNN8wcuxsdfi6UAqi2pK1DDlOcrCfRIvY96Er7CdiUPUtlUDUaaGSwi0kppf1ngXc0G
 wS9Xie4PeDMe2eNyMU/woxbFAAGAPnWQWjx0LDOYKi6dOANKm0ptj4cbLD2mPIRVVtn3
 gwLb6DuoM1QzD6v1XILuDp/kGkk7Sw2kQMZojRzUWhV+Qzlh740VlLskF8OPHQs/w+q+
 FfByiCcPYiugNnkp2ApQoIWjPQ0NODV9Wr6L7n3Qp3TnNZVqzRq6jnYlDfB0qKGqXoxF
 Y9yg==
X-Gm-Message-State: AOJu0YxFr0Oc5GNj1PCKHhyzlgxgu/O7X6Mju/WixSKL/w1FDUlHxrBE
 zSvwouLlXXzEKPAa0CubKX7SNXIhNNY6BTMU8T6FDYznTgTlkQlRpEAgt2ta+yD3ysDIqyZaNij
 o
X-Google-Smtp-Source: AGHT+IHkahqYJhoRFao9M4/mvlA4YOM8fTzg5FHznNbcADY2ZpUA1Ww9LuElphxHfJpNSl6kSwC9yQ==
X-Received: by 2002:a17:903:2a85:b0:202:2dfb:9a61 with SMTP id
 d9443c01a7336-2039e4eefffmr36399315ad.48.1724439704144; 
 Fri, 23 Aug 2024 12:01:44 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-203b0c37768sm1749885ad.230.2024.08.23.12.01.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Aug 2024 12:01:43 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, Alistair.Francis@wdc.com, bmeng.cn@gmail.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, jim.shu@sifive.com, andy.chiu@sifive.com,
 richard.henderson@linaro.org, kito.cheng@sifive.com,
 Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v8 00/17] riscv support for control flow integrity extensions
Date: Fri, 23 Aug 2024 12:01:22 -0700
Message-ID: <20240823190140.4156920-1-debug@rivosinc.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=debug@rivosinc.com; helo=mail-pl1-x636.google.com
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

v8 for riscv zicfilp and zicfiss extensions support in qemu.

Links for previous versions
[1] - v1 https://lists.nongnu.org/archive/html/qemu-devel/2024-07/msg06017.html
[2] - v2 https://lore.kernel.org/all/ed23bcbc-fdc4-4492-803c-daa95880375a@linaro.org/T/
[3] - v3 https://lists.nongnu.org/archive/html/qemu-devel/2024-08/msg01005.html
[4] - v4 https://lore.kernel.org/all/20240816010711.3055425-6-debug@rivosinc.com/T/
[5] - v5 https://lore.kernel.org/all/20240820000129.3522346-1-debug@rivosinc.com/T/#m7b9cc847e739ec86f9569a3ca9f3d9377b01e21
[6] - v6 https://mail.gnu.org/archive/html/qemu-riscv/2024-08/msg00418.html

---
v8:
   - fixed up `gen_cmpxchg` to store extra word2 during compile to raise storeAMO always
v7:
   - Updated decode_save_opc to take extra argument of excp_uw2 and
     updated callsites
   - added a helper for promoting load faults to store faults
   - Removed stale comments and edited existed comments

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


