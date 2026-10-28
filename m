Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FDD606A31A
	for <qemu-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 04:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=ENaF0yAV
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xLvKw-0007mu-74; Wed, 28 Oct 2026 00:32:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <portias@tenstorrent.com>)
 id 1xLvKr-0007iV-Rk
 for qemu-riscv@nongnu.org; Wed, 28 Oct 2026 00:32:25 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <portias@tenstorrent.com>)
 id 1xLvKo-0001gV-A4
 for qemu-riscv@nongnu.org; Wed, 28 Oct 2026 00:32:25 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-3a6d800781cso35615a91.1
 for <qemu-riscv@nongnu.org>; Tue, 27 Oct 2026 21:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1793161940; x=1793766740; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=UjTYxjwBStG+zG+XaE/upOrdCBHCoeR1wLAXIfObVG8=;
 b=ENaF0yAVz1cQqZINqlAzP3a4UzbaX7sRQtsyLMGRARpIxn8J6Z7EzbDRtUr8mFxa/O
 /FDC1vXMiUCuw3trr9OBA/LDF8rpFF1sJSf8cbBRGIlgBMCCQuXSQ1IgCYTMR9pKbZhz
 0UCgN5zmLME1pTRAw4zbUGcQaExnAYJ0TcTCoTfoeQE+x/PusJQVukL7o7J9Z7HZOEMM
 zzA+QVMpvkABJnDXECAeoNihfA0A6QCL6Zvr12WPspvE5eyuQi+OZv3cNtEuQ2jDT+v2
 IqEpv/4LS74QZXms/xz+Kq3ec1PRjEkmR7TnByJJk+zhjWaFtEqPvaNYwS6VwI1/1o2s
 qJWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793161940; x=1793766740;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=UjTYxjwBStG+zG+XaE/upOrdCBHCoeR1wLAXIfObVG8=;
 b=jyLDo0QyCHdPI7mWikqo1k/L5FY68Zo77fw/oINH/PMsisJi41B0l6e24DYtrmxYP3
 9/espMBJnsQGZR9oKJypC3vLRdZU3z0gFldYMpnu/tNVecwTxhFK3I9Srl2/oH2PXzQU
 1dZL20IjdJTnD3tpQvoXZf4NV3+xBDRuh+kSFgmgX8xH+XKNE9qbZbjK34sSIlEOt/Qd
 rlN80gTKzDyzOYQb9N8mCMGvP0Ndu29yN3aRLBbHPNaTZi0BWx3Stuopjz2UQwZAwFw0
 qqDuayxpCIlqfk2GvnIDhzrnjpW3CcoOWtDnP6Ez8mIVCQrJuvkZzv+MJRF38NYT/OxU
 /ajg==
X-Forwarded-Encrypted: i=1;
 AKwUvByEcalswwH0cM8O1vCAy+sevdCulVzjEQeM3DhyCKYaHIPuZJqWZeLL6WqabkDVJzecAxu2mBzbBx8L@nongnu.org
X-Gm-Message-State: AFq9FYLL2hdH3V8S/MTH+SRQSFD64guFkxG6LmHT3iVAj0bwKhBvDDQK
 xFUKV5q1l7XTU9ZhhsoCQxHYSr6xNkXgI1JeFPljFLR5NJyQi8gKzrqltYc1qwHiMBE=
X-Gm-Gg: AYBFou2BSxJOjiXEpzI7TMtFL1MjT7wE10aP3rU/VbiPekn08WGaXYzDQ4Xf+pBmUxG
 ErGEsO6tp8KGl5WIb6dwP0jM5BR4MTfli3nX+Wp/5vli4dwr/weVMyoLRi4kze5Zos6erCbNX36
 Qwgc+L3d5iQ+U9H8Dg4k0N1IUqcYjYRgFbARaj6qvJUZMT0sQXLbndwUeCQgCo+xihQel/jGDTE
 WolFg7mwD86eFgxz8ngzAq4D3VVEEmzfkq0fNJkihr5r7ogFr+JNFt/9EwkVbpNN3cJcy03Vsls
 T+2u1ObXXxVfnCWE5gVAJLG2L9+jIAXO4vctw3d8p6XgHJwVtxNGylxjp8y+/02I8VQMpoovn2+
 NAHyh46fkSlF/B16LBwQ5NaYcGgcIa/31sgqWpanu3m+6zaeeBsoNnHIeqvL28kdhfNkk//rO+v
 oLfMxwsK4Vm3g6IoCWlKTmHgmKgQjvBrdZOys07r2dIOjBTweVbLscMpmT76EQdcdYr3Fjih4PH
 N/Ap1xnRfcttI2sYCUVr6poCv25GDsGoPcc8o2yaKTlLDInefoDsFmiR+eTn66/Sv9crvJyztFs
 KEsGI3qVhVq/NMqXiV0wSYR+a63k1g+L2d4g/6W9lAv9ctGVe4D4LkOc8E6o/+jeyRZTw5novZi
 mJOQ=
X-Received: by 2002:a17:90b:3c0c:b0:3a8:1759:2217 with SMTP id
 98e67ed59e1d1-3ae57e5769amr1399241a91.2.1793161940109; 
 Tue, 27 Oct 2026 21:32:20 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([159.196.41.205])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3ae5a5d45a8sm1024470a91.17.2026.10.27.21.32.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2026 21:32:19 -0700 (PDT)
From: Portia Stephens <portias@oss.tenstorrent.com>
To: qemu-devel@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>,
 Chao Liu <chao.liu@processmission.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Michael Ellerman <mpe@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 Portia Stephens <portias@oss.tenstorrent.com>,
 Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>, Weiwei Li <liwei1518@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v2 10/10] docs/atlantis: Update Atlantis documentation to
 include the RCPU
Date: Wed, 28 Oct 2026 14:30:59 +1000
Message-ID: <20261028043059.600498-11-portias@oss.tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028043059.600498-1-portias@oss.tenstorrent.com>
References: <20261028043059.600498-1-portias@oss.tenstorrent.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=portias@tenstorrent.com; helo=mail-pj1-x1029.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This updates the Atlantis documentation to include new machine
properties for running the RCPU.

Signed-off-by: Portia Stephens <portias@oss.tenstorrent.com>
---
 docs/system/gdb.rst               |  2 ++
 docs/system/riscv/tt_atlantis.rst | 40 +++++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+)

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
index d94d064f4f..77dfacff3c 100644
--- a/docs/system/riscv/tt_atlantis.rst
+++ b/docs/system/riscv/tt_atlantis.rst
@@ -12,10 +12,37 @@ tt-atlantis QEMU model features
 -------------------------------
 
 * 8-core Ascalon-X CPU Cluster
+* RV32 Real-time CPU (RCPU)
 * RISC-V compliant Advanced Interrupt Architecture
 * DW8250 compatible UART x5
 * 4 PRCMs (Clock and Reset Controllers)
 
+Boot options
+------------
+
+ * ``rcpu`` enables the RCPU model to run alongside the Ascalon cluster and is
+   enabled by default. When the RCPU is enabled, ``UART0``, the RCPU's console,
+   will be mapped to the second -serial on the command line.
+ * ``bootrom`` binary to be loaded into mask ROM and run by the RCPU (no effect if the
+   rcpu is not enabled)
+
+To enable the RCPU model with a custom binary and the RCPU console on stdio:
+
+.. code-block:: bash
+
+  -M tt-atlantis,rcpu=on,bootrom=../path/to/binary.bin -serial null -serial stdio
+
+ * ``smp -cpus`` The smp cpu field includes the RCPU count. When rcpu=on, the
+   number of Ascalon harts created is smp.cpus - 1.  When rcpu=off, the number
+   of Ascalon harts created is smp.cpus. To run with only one Ascalon hart and
+   no RCPU.
+
+.. code-block:: bash
+
+  -M tt-atlantis,rcpu=off -smp cpus=1
+
+
+
 Known limitations
 -----------------
 
@@ -39,3 +66,16 @@ and Linux with default configurations.
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


