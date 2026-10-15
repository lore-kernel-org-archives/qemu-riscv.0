Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E059CC6B30
	for <qemu-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 03:20:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xHC0v-0008SK-7J; Wed, 14 Oct 2026 23:20:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <portias@tenstorrent.com>)
 id 1xHC0K-0007Sf-Is
 for qemu-riscv@nongnu.org; Wed, 14 Oct 2026 23:19:42 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <portias@tenstorrent.com>)
 id 1xHC0I-0006rB-SU
 for qemu-riscv@nongnu.org; Wed, 14 Oct 2026 23:19:40 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2e74a32a07fso5213285ad.1
 for <qemu-riscv@nongnu.org>; Wed, 14 Oct 2026 20:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1792034377; x=1792639177; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=xGayRwOwvphvAxw942c2AcE8znviMgTw5tQV3iQ4IQQ=;
 b=Vtoq/IZzLi0dvL82G4QpKnXsHtIn4f7NqIY7MzXMxgPBOgnAEuDiaYnFJSpz8Gh4vv
 DwlQ9R20liXwfwW1D2bog1w7UTbm1EaAifOi1f5FXQRgEsdQBNdINun9eH96NwA7uvc7
 FNvdMEspxny0uZVjnCSw56RPg34jZBoYOoHloJne12H0E/dd5jZ3VJ8pOzno2FFe2kfK
 KsPpwnFESNkaEKYtr2oR9w9aZlijC/lTXt/1x7tWiEs4BvoQDk86l3yIQ6Qn/dYUMLyi
 VC40Swu5JxU3F0rEg6P9RLh0RKIdxlOKE2C7QV8Ut5Exb5Tah8mNBoESLekvxGBglmS0
 mOMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792034377; x=1792639177;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=xGayRwOwvphvAxw942c2AcE8znviMgTw5tQV3iQ4IQQ=;
 b=DHicw1JU+YDbUjYJYN7nG/Tx/zt6lgxSgaoehEIi7qrxaUumHxEjv+ZD29mjLKJZEy
 7T6LCuFXzfjg73hHiDNt4NcNqMe+S7saNGdVl9tqn85EotcfTYi+nQsuJ4pXgE9XgY0y
 PBDZ5oxPIQH/1Pa3nawaPt01Jqn7ZdJua6zAF331WBm+Zz8+j6UEuYsXBce6YlHKlFRL
 q80NxRTfdqxnyggQKflQsRVJfBtG/GhSOCoLFumig/kGU05LPng+Q1zDKgUdWhuaxhSH
 nnfPvylwhqapR+je4pJnkrh6kI+R+ZoUJihdR8ocywHM6Xx8DJszCF68YjlWyHQTae4L
 ZwXA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzdaf1tRXIp6kMb94Ba4cVB4ws4nJWprDGwhOwrkmNMhiuT7F3MYrXFPGMRGM/1LP1/p7bzEDCbuBdJ@nongnu.org
X-Gm-Message-State: AFq9FYIJyWc88ofsDm/wiXGrjQYNainnuvdTdOY4cdXtP4GthIWYv/Cd
 XZTOuGP+ET1vjJuusqFGty6/OJFtH4cI3DSpLdLYDr5ARirOuCc0jG0LkeAmeyo8UdY=
X-Gm-Gg: AYBFou1WG0bfUywAm8Ei1Oq8Dl5FxUEFl/DyPR2VHGgaoCVfpzJ3KXy/E+tczQ7Pa86
 /fhOZIJEbW72jA9rmijwY/rOoAJ8ZKtsc2f4GscAciDofsNhzlaRFYqBa6u2Zm97YKiwnJ4giDU
 N/go6e0UYrfuCdGTDqgXVlBRcoXGU22lWg5oJUrE94e6J86/teb/IuzX8VUwMzsWZM4REg5voxX
 R8mXhS44Ed9Z0OSbtXd8gERsRlO4Mm9/4E/214WgOPifZyCn0jYCMVIz+liAWNtjmvdlqeu8Trn
 MISUx7lF3tB0OgGgoCdYUEWgSNnSloEZ1aEmujHUwQpqb6/gBrHh9Il/r1qLqLr/cFUAmsnko2G
 Q/tkGNHct4VJgSCtFPUsFVWxsXdT/KgvRbKz0SmFf7HmdXuOe0tYHHdY1mOVPhzILfRc4l8vmhS
 RW0Ai59hXJyYaeOY+6zov/Oj9c96Z02N1g5TazcKhIxrD5tJ5n4x4v4Ne1g3PvjcLk90wj2Axip
 iGBxaTQwwGd1ZYi/OvyrXU7OdZu/GKRVOdwwPjlbDiOUP4=
X-Received: by 2002:a17:90b:3a48:b0:3a6:e61f:749d with SMTP id
 98e67ed59e1d1-3ab3a33ce37mr25574879a91.1.1792034377331; 
 Wed, 14 Oct 2026 20:19:37 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([159.196.41.205])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3ac93049ec2sm1321725a91.1.2026.10.14.20.19.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2026 20:19:36 -0700 (PDT)
From: Portia Stephens <portias@oss.tenstorrent.com>
To: qemu-devel@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Chao Liu <chao.liu@processmission.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Portia Stephens <portias@oss.tenstorrent.com>,
 Michael Ellerman <mpe@kernel.org>
Subject: [PATCH 12/12] docs/atlantis: Update Atlantis documentation to include
 the RCPU
Date: Thu, 15 Oct 2026 13:18:04 +1000
Message-ID: <20261015031804.2406055-13-portias@oss.tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015031804.2406055-1-portias@oss.tenstorrent.com>
References: <20261015031804.2406055-1-portias@oss.tenstorrent.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=portias@tenstorrent.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This updates the Atlantis documentation to include new machine
properties for running the RCPU.

Signed-off-by: Portia Stephens <portias@oss.tenstorrent.com>
---
 docs/system/gdb.rst               |  2 ++
 docs/system/riscv/tt_atlantis.rst | 30 ++++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/docs/system/gdb.rst b/docs/system/gdb.rst
index b6d8f8e77d..3777630337 100644
--- a/docs/system/gdb.rst
+++ b/docs/system/gdb.rst
@@ -79,6 +79,8 @@ debug some interaction between kernel and user-space you are better
 off running your guest program with gdb either in the guest or using
 a gdbserver exposed via a port to the outside world.
 
+.. _GDB multicore:
+
 Debugging multicore machines
 ============================
 
diff --git a/docs/system/riscv/tt_atlantis.rst b/docs/system/riscv/tt_atlantis.rst
index d94d064f4f..f7265813d1 100644
--- a/docs/system/riscv/tt_atlantis.rst
+++ b/docs/system/riscv/tt_atlantis.rst
@@ -12,10 +12,27 @@ tt-atlantis QEMU model features
 -------------------------------
 
 * 8-core Ascalon-X CPU Cluster
+* RV32 Real-time CPU (RCPU)
 * RISC-V compliant Advanced Interrupt Architecture
 * DW8250 compatible UART x5
 * 4 PRCMs (Clock and Reset Controllers)
 
+Boot options
+------------
+
+ * ``rcpu`` enables the RCPU model to run alongside the Ascalon cluster. When
+   the RCPU is enabled, ``UART0``, the RCPU's console, will be mapped to the second
+   -serial on the command line.
+ * ``bootrom`` binary to be loaded into mask ROM and run by the RCPU (no effect if the
+   rcpu is not enabled)
+
+To enable the RCPU model with a custom binary and the RCPU console on stdio:
+
+.. code-block:: bash
+
+  -M tt-atlantis,rcpu=on,bootrom=../path/to/binary.bin -serial null -serial stdio
+
+
 Known limitations
 -----------------
 
@@ -39,3 +56,16 @@ and Linux with default configurations.
 The development board hardware will require some implementation
 specific setup in firmware which is being developed and may
 become a requirement or option for the tt-atlantis machine.
+
+Debugging
+----------
+
+Ascalon and RCPU are on separate CPUClusters which allows gdb to put Ascalon
+and RCPU on separate inferiors. This prevents issues with switching between
+RV32 (RCPU) and RV64 (Ascalon) targets.
+
+By default, gdb will connect to inferior 1, the Ascalon cluster and the RCPU
+will be on inferior 2.
+
+gbd does not handle multiple inferiors by default, see :ref:`gdb multicore`
+for how to connect to inferior 2.
-- 
2.43.0


