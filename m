Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j8vmO-0005VE-Ko
	for mharc-qemu-riscv@gnu.org; Mon, 02 Mar 2020 19:51:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45320)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1j8vko-0002Ui-TX
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1j8vkn-0004SE-NV
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:46 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:34195)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1j8vkn-0004S0-IX
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:45 -0500
Received: by mail-pf1-x432.google.com with SMTP id y21so570576pfp.1
 for <qemu-riscv@nongnu.org>; Mon, 02 Mar 2020 16:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=foL1rvg06jdseiz3kkx95J3iuXxsSW7EjXYznpdqJsc=;
 b=LwqXWUsFHtaBgSBxNNecbMQNvMLS4eLgoy4sQtaLaTq0bBELtJc/MtV3wnT7PYoKe1
 pLWVp3BphCpELzM48Ti1O6WO/IQJM+h45+L7OYfGXc+t9DBdhI6p+qLixywCUuRfhjdK
 nBHde3Zz/p6XMcFfELUTvBxwOHKPNi8mvfO5oV9XhtD7P9ihFXJC2m42sdo+ZQjR+H76
 nFsWO1JOKSmT0tuKGllS6DoOrjtzSJFG3vKbYaihk1O72QL7UD+80cnW5cRKo24v3oM/
 XvANi7xM5qmv7BlS+OF1zBVgWtResAhlNWZEK7+HhaOe3I6ryNfnRf1rwvGW60wwop3W
 9pLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=foL1rvg06jdseiz3kkx95J3iuXxsSW7EjXYznpdqJsc=;
 b=CbXaJ3AnYtvdkVieo22E4hNYVsRzD/9uqExjGdsIJR6eQIF0HJ/8MZ5WdlyyWdcEv6
 o59ZQwRyCKm7b20i2oabqW7q1w0MFbfnJZe73insB6zJxIXlLKefLLpjOJm3WLvN5gPI
 KiRzZd0jRIHNkYqkM69BGdmi4QtrGMwFgJgON2b4HK5w3x98pHY9Kjnt31+Dxc5IH/fx
 RSW2zD3eDpODMsMhuSRUZ5VIfV2ueXRGWixK+tbp9DwZnIdjB7V5ltaMzA8OSUxRBlS8
 nN1O2LcBHDMbpUWRCqs6yRXmAKZMZ7qxOGrcOaEjp0NJ7DG96pUXfEfwVoJfgH10m19g
 qy9Q==
X-Gm-Message-State: ANhLgQ3ZXclO7nv0nQC6C/WrnD0hEPE3Pi7/mKeXjbB5GsFeVzv6ncBD
 +rXAsMznqU/6hm09gTlKShHqq+F23c7YkA==
X-Google-Smtp-Source: ADFU+vuXitAuijf8CFzKlkrlhhkS+oWk5gRwG/zgIBm8kCE2tVCnCmA8pXPYS5dLdAteD4Z42sA+0w==
X-Received: by 2002:a62:1b13:: with SMTP id b19mr1570914pfb.200.1583196584310; 
 Mon, 02 Mar 2020 16:49:44 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:23a5:d584:6a92:3e3c])
 by smtp.gmail.com with ESMTPSA id 7sm97169pjm.35.2020.03.02.16.49.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 16:49:43 -0800 (PST)
Subject: [PULL 26/38] target/riscv: Disable guest FP support based on virtual
 status
Date: Mon,  2 Mar 2020 16:48:36 -0800
Message-Id: <20200303004848.136788-27-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
In-Reply-To: <20200303004848.136788-1-palmerdabbelt@google.com>
References: <20200303004848.136788-1-palmerdabbelt@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::432
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Mar 2020 00:49:48 -0000

From: Alistair Francis <alistair.francis@wdc.com>

When the Hypervisor extension is in use we only enable floating point
support when both status and vsstatus have enabled floating point
support.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 target/riscv/cpu_helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 895b6ca25d..d9a29d702a 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -99,6 +99,9 @@ bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 bool riscv_cpu_fp_enabled(CPURISCVState *env)
 {
     if (env->mstatus & MSTATUS_FS) {
+        if (riscv_cpu_virt_enabled(env) && !(env->mstatus_hs & MSTATUS_FS)) {
+            return false;
+        }
         return true;
     }
 
-- 
2.25.0.265.gbab2e86ba0-goog


