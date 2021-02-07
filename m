Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l8t0K-0002Ue-Vd
	for mharc-qemu-riscv@gnu.org; Sun, 07 Feb 2021 17:58:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l8t0I-0002O8-Bt; Sun, 07 Feb 2021 17:58:06 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:42997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l8t0G-00018H-Rx; Sun, 07 Feb 2021 17:58:06 -0500
Received: by mail-wr1-x42d.google.com with SMTP id r7so5463379wrq.9;
 Sun, 07 Feb 2021 14:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9gknr3qlLHrPVofS5zv6p1SYehluW78knvLtOubYhBs=;
 b=QPiUsnBXh6zQA8cvIUf9ti97QrSwqi3bDBEnuY07Vz4fILCRyGjOwtnK45kK464dio
 5WPadZImBIr6aw0k5vyV2uxqYyLHPOjixZqCz0vPdEbSAlDrWHBk2FbdYxS7MSjbbTtY
 LbN4tD7GhzEeQKmyOx3+luv7KS33p5yTjoXR2f5V7BC/WPbyi2AlqOJj0mDZVbZxIMYo
 GzFaodM5Tae7XL4Q2MlxhUh6WLujp9P5Py0gpaRn2H/R+GJQYrRkc6iNooaSges3oLKW
 jpVdP4BbjkgLrJmJoB1qHno80cPvPoOSb3thRC3FrbOnwGT6+wNG4fll+jgztTGlEdTs
 16Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9gknr3qlLHrPVofS5zv6p1SYehluW78knvLtOubYhBs=;
 b=hvCFh+FPT2nRAqQHLDSbMEWu/wq+oJQsQK9QWoYaKqZgDMFYs4Rl3vb4Z25BsQcqTg
 HMfWlQSzq58+CX+QLFMCSBD8pa2C2XRYiCR7lnmwZKGCaRbFYAZcTL8kGAEmS6mqrNiX
 W48CBxSIMNHFukatNyNVMiW/oUzIp5RX4PMM2EYG8EpvXfUISWowk6w/wNsqD2HRtUBp
 gdJYcJuw7ju+bILQODpvNgsZOI7hmO8lENBC9fGfJrZT0bQbTX4X1Gc86UfANNWupJg3
 ZZYfkbs4Ep89+zF8eYbgGuh2QGdliPuCVz1eI6mRQVmIjeZjOAxHff4CdCfysLoj4GwG
 ++xA==
X-Gm-Message-State: AOAM533OdlqbkvQFRxuKyB+vS8pzaK9xTvnbESoCVSiSZ+i3S8lFz1wZ
 S13Rs9K8wp2pfOR8K8f8QB73WTERCcc=
X-Google-Smtp-Source: ABdhPJwmtUdPun0LfupoJgX97gEgxC4Lsu0OtQsJR7cY6J+fqgd3HrNrCOxT9sTkn64oSwfDnHymeg==
X-Received: by 2002:a5d:6a02:: with SMTP id m2mr17045630wru.364.1612738682431; 
 Sun, 07 Feb 2021 14:58:02 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id z4sm24488281wrw.38.2021.02.07.14.58.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 14:58:01 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-arm@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-riscv@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 4/6] accel/tcg: Include missing "tcg/tcg.h" header
Date: Sun,  7 Feb 2021 23:57:36 +0100
Message-Id: <20210207225738.2482987-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210207225738.2482987-1-f4bug@amsat.org>
References: <20210207225738.2482987-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Sun, 07 Feb 2021 22:58:07 -0000

Commit 3468b59e18b ("tcg: enable multiple TCG contexts in softmmu")
introduced use of typedef/prototypes declared in "tcg/tcg.h" without
including it. This was not a problem because "tcg/tcg.h" is pulled
in by "exec/cpu_ldst.h". To be able to remove this header there, we
first need to include it here in op_helper.c, else we get:

  accel/tcg/tcg-accel-ops-mttcg.c: In function ‘mttcg_cpu_thread_fn’:
  accel/tcg/tcg-accel-ops-mttcg.c:52:5: error: implicit declaration of function ‘tcg_register_thread’; did you mean ‘rcu_register_thread’? [-Werror=implicit-function-declaration]
     52 |     tcg_register_thread();
        |     ^~~~~~~~~~~~~~~~~~~
        |     rcu_register_thread
  accel/tcg/tcg-accel-ops-mttcg.c:52:5: error: nested extern declaration of ‘tcg_register_thread’ [-Werror=nested-externs]
  cc1: all warnings being treated as errors

  accel/tcg/tcg-accel-ops-rr.c: In function ‘rr_cpu_thread_fn’:
  accel/tcg/tcg-accel-ops-rr.c:153:5: error: implicit declaration of function ‘tcg_register_thread’; did you mean ‘rcu_register_thread’? [-Werror=implicit-function-declaration]
    153 |     tcg_register_thread();
        |     ^~~~~~~~~~~~~~~~~~~
        |     rcu_register_thread
  accel/tcg/tcg-accel-ops-rr.c:153:5: error: nested extern declaration of ‘tcg_register_thread’ [-Werror=nested-externs]
  cc1: all warnings being treated as errors

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 accel/tcg/tcg-accel-ops-mttcg.c | 1 +
 accel/tcg/tcg-accel-ops-rr.c    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/accel/tcg/tcg-accel-ops-mttcg.c b/accel/tcg/tcg-accel-ops-mttcg.c
index 42973fb062b..ddbca6c5b8c 100644
--- a/accel/tcg/tcg-accel-ops-mttcg.c
+++ b/accel/tcg/tcg-accel-ops-mttcg.c
@@ -32,6 +32,7 @@
 #include "exec/exec-all.h"
 #include "hw/boards.h"
 
+#include "tcg/tcg.h"
 #include "tcg-accel-ops.h"
 #include "tcg-accel-ops-mttcg.h"
 
diff --git a/accel/tcg/tcg-accel-ops-rr.c b/accel/tcg/tcg-accel-ops-rr.c
index 4a66055e0d7..1bb1d0f8f1c 100644
--- a/accel/tcg/tcg-accel-ops-rr.c
+++ b/accel/tcg/tcg-accel-ops-rr.c
@@ -32,6 +32,7 @@
 #include "exec/exec-all.h"
 #include "hw/boards.h"
 
+#include "tcg/tcg.h"
 #include "tcg-accel-ops.h"
 #include "tcg-accel-ops-rr.h"
 #include "tcg-accel-ops-icount.h"
-- 
2.26.2


