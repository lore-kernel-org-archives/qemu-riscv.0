Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0569C3600C
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Apr 2025 10:43:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u26Nn-0005O1-Gi; Tue, 08 Apr 2025 06:40:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1u26NG-00057P-O7
 for qemu-riscv@nongnu.org; Tue, 08 Apr 2025 06:40:14 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1u26NF-0008M4-3x
 for qemu-riscv@nongnu.org; Tue, 08 Apr 2025 06:40:10 -0400
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-af6a315b491so4759522a12.1
 for <qemu-riscv@nongnu.org>; Tue, 08 Apr 2025 03:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1744108807; x=1744713607; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kVOueAS8b1eNLy2hm19ycvkuwS2jRMzUIYMrO4q2Iu0=;
 b=jcXJ3wom7uPfC86x4QKCKbh7b5GseQ8Tf0+YwgcT1h0rDncg0EneDVCKq1nZdptg7/
 oH7PNdar2U3dUCoCZGHhCCYkCSW4QoY4CxAqOxAbcyfvQBvUdnIZcUYWb7XHpya4Qrum
 GVCrbQEKMWSuuuD0irgC6WahB4ySwDQPppCvQN3/fGsPKPUVcoHGRwbPL7fYk2X3pBQO
 KZXsDl12eBtZr8sYbQZlCpVU/t25mhU/P+0HXtqz97G8ZObyLkGlasMPqeNhFRK2txPe
 sYAO9EkhcyILYDhMB0ukj9UcmrGX/IDi/c/kBixMm6uyWxuNiwGsqDTS2mRR24IFXcyP
 Sh1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744108807; x=1744713607;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kVOueAS8b1eNLy2hm19ycvkuwS2jRMzUIYMrO4q2Iu0=;
 b=uJ+3LxWaRlAkLcRv3emin87yIvEV0p7sjHJbiVyc7y3x1tpm7Ovi2D23hFyCSqjNup
 Jh+CLO7RUNzhBLiO7V/dn37eh7V4EvuYJ3XdRr5HeNeXHvO9RxVdMJYi/nEeDYwFQDvU
 mCaIiO/fZMvDbhvOVD7PIOkXZefGxZRQhutXxZrVfWjRyfsMX2jg5QU3muEtV+xXjc1i
 oFmpMMx/tctq2hRdWrN8qu3JlWT3uYiagRTo11qVKtWIfzGHkONXvpiUNZvQkzZvyAOr
 S7rEhablymazveH8ClNMAKooK/Zac6Z89gK5klrgUu1+8ILi4rku3h+DylkDNEY4FNZV
 263w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7L5E/ZRT88NU/nauqA6S+U214vcm+hq/LTehpD0Eu/802C5g+rR+D0To1sECcXXeF04rFJRmmIK2P@nongnu.org
X-Gm-Message-State: AOJu0YyY8WMeEh1ImxnIJRUFhAh23Xj2fvBPvnIWaLBD4SuqMGWJ+Oz8
 f6QToxMJPVTDnoGNEaoUdm45zZJVxX54jGRL5GIm9Lv9FgLLnUF1c34nawX7+YI=
X-Gm-Gg: ASbGncvqgIkr8piKQCOcySGonD7ppYs1BrUwRkjQU2+VqQopcLak06ZMae5XET3vORt
 8UmWt+1QNTr1HkI6T8iD7codf4b3B0ZzKbikzG+28gA66koKki+rAIkPS57paJn4S+gUjYf9t4z
 L/WqDYrRJMe9Z0nsdQs/BnXfzB1YtlkID3xaQ3gT8HQluLIho9HSBC8EcYz7SOL97wacbCTxbUH
 horYvve87+2oW/yOlYLa1tlxTOOkHXKpH1Y2hOPFNh5cAeA05zUDeS19wysXcvHw3JKCc5yf4Re
 i9gLFr6UgWKwwo5vhiCjS0sz9v+uI8p/s0l2CCogd+rKRsreAvat3RbOk4Z9NCWACl2Q3AHBuDt
 7Nk4Tb+yuvaMcMA==
X-Google-Smtp-Source: AGHT+IG2QDoMYHkX1leJxK3Gb/VRvwe2ipbiiBHnWPbdT7TZnQ13gKi2Q+4I5WZeeF+q6ot2ZJbqVw==
X-Received: by 2002:a05:6a20:2042:b0:1f5:9330:29fe with SMTP id
 adf61e73a8af0-20104601e7fmr18359072637.17.1744108807309; 
 Tue, 08 Apr 2025 03:40:07 -0700 (PDT)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-739da0e3734sm10532380b3a.179.2025.04.08.03.40.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 03:40:07 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, antonb@tenstorrent.com,
 Max Chou <max.chou@sifive.com>
Subject: [PATCH v3 06/10] target/riscv: rvv: Apply vext_check_input_eew to
 vector slide instructions(OPIVI/OPIVX)
Date: Tue,  8 Apr 2025 18:39:34 +0800
Message-ID: <20250408103938.3623486-7-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408103938.3623486-1-max.chou@sifive.com>
References: <20250408103938.3623486-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=max.chou@sifive.com; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Handle the overlap of source registers with different EEWs.

Co-authored-by: Anton Blanchard <antonb@tenstorrent.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 2a4bededd1e..d72792e46a7 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -638,7 +638,9 @@ static bool vext_check_slide(DisasContext *s, int vd, int vs2,
 {
     bool ret = require_align(vs2, s->lmul) &&
                require_align(vd, s->lmul) &&
-               require_vm(vm, vd);
+               require_vm(vm, vd) &&
+               vext_check_input_eew(s, -1, 0, vs2, s->sew, vm);
+
     if (is_over) {
         ret &= (vd != vs2);
     }
-- 
2.43.0


