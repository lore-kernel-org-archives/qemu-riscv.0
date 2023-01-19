Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIaSw-0002TU-Eu
	for mharc-qemu-riscv@gnu.org; Thu, 19 Jan 2023 14:20:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pIaSk-0002LL-Ur
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 14:20:38 -0500
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pIaSg-0007Tt-9m
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 14:20:35 -0500
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-142b72a728fso3687632fac.9
 for <qemu-riscv@nongnu.org>; Thu, 19 Jan 2023 11:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EQGXY6w8Rw0GKyTizGqOOZVAMpeeXS3Pu4ivzrXBO4I=;
 b=iKv64T2NAMTma8T4hux+fZaYWwwvcqrWegdlX5MnWHzy3k3U6P3o2RMe84viP8UDj3
 4EJu+aO5XEzWIq4tyiGCRtQPjTtYz9xon9axb+dYabynLnb7WA+55M/ta/G52YwZYAS6
 enzVQvmcwABCasZJt9Frqgvar3Mpv8YewDl9goNAO+E6c1D+EmnYx3HJudYPL+T6qbiR
 BaziQ9sTA/EqnfHRp2Bg1/Qwy9YMxjmpGF3Umle6GI+mqCZagLzvQuIyNpU5nOSWWmjK
 oGwuxV8RqSp1kxZV4sgR3pqJGioChU+VQtes9jihteLRithssoOT4fnFFoVkDCedTTci
 3ddw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EQGXY6w8Rw0GKyTizGqOOZVAMpeeXS3Pu4ivzrXBO4I=;
 b=AX5ITFcBIcqnSJlzAWtJRKqYi3lKiuAefskqRCxPftCxhYVQsuxC0w6EodnryTF2kG
 u3CPGFiyoxJfm+bE1fbFev3sNLxfTwEffhPKnS4cuRAH2gNEpIijwEBdq8+orVJ2ZVev
 AEN8GFxALLmtZMP21kiZMxNOslnAuxBYuSqofnOSPK3Ok3A+9I/1LeS64+vjSdk6+SPp
 mFh8dUOuw6WBAILgMFkZzeiJYoxKq+Rr3vNNavMS381aQZVBbp/LWI+0yGpHEXF98C8u
 KcSoS5wIZZ+n5H4RU17WBwaI44vMJ/P+blKksPytHEUajObvEVKFKcqG37C9NC9NYHos
 G25w==
X-Gm-Message-State: AFqh2kohL4Y0HXKHxw1g9Y8WSdPk1R/fFz7gsKy6ntLtBGiYALNHqBGV
 1HfG67u/5aehzIo9e5YqqnirxA==
X-Google-Smtp-Source: AMrXdXvlSeXBTa6APwo5JYNnlxdzr/KDh5TMq0B03SzkI0K5yrHzDod4Gns2/D2Nynm/N6V+HYp6DA==
X-Received: by 2002:a05:6870:a8ad:b0:15f:157f:1af4 with SMTP id
 eb45-20020a056870a8ad00b0015f157f1af4mr5147205oab.34.1674156030452; 
 Thu, 19 Jan 2023 11:20:30 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.17.222.2])
 by smtp.gmail.com with ESMTPSA id
 t9-20020a056870f20900b0015f193c86d2sm9001128oao.6.2023.01.19.11.20.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 11:20:30 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 1/7] hw/riscv/boot.c: calculate fdt size after fdt_pack()
Date: Thu, 19 Jan 2023 16:17:22 -0300
Message-Id: <20230119191728.622081-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230119191728.622081-1-dbarboza@ventanamicro.com>
References: <20230119191728.622081-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 19 Jan 2023 19:20:39 -0000

fdt_pack() can change the fdt size, meaning that fdt_totalsize() can
contain a now deprecated (bigger) value.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/boot.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 2594276223..dc14d8cd14 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -253,8 +253,13 @@ uint64_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
 {
     uint64_t temp, fdt_addr;
     hwaddr dram_end = dram_base + mem_size;
-    int ret, fdtsize = fdt_totalsize(fdt);
+    int ret = fdt_pack(fdt);
+    int fdtsize;
 
+    /* Should only fail if we've built a corrupted tree */
+    g_assert(ret == 0);
+
+    fdtsize = fdt_totalsize(fdt);
     if (fdtsize <= 0) {
         error_report("invalid device-tree");
         exit(1);
-- 
2.39.0


