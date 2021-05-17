Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1liXN5-0004kL-By
	for mharc-qemu-riscv@gnu.org; Mon, 17 May 2021 03:08:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liXN4-0004hK-0o; Mon, 17 May 2021 03:08:58 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:51988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liXN2-00076D-GX; Mon, 17 May 2021 03:08:57 -0400
Received: by mail-wm1-x334.google.com with SMTP id u133so2937605wmg.1;
 Mon, 17 May 2021 00:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QpA+CuwG8DCNtlhazAhB5cYz5NbzRFS82o4f2r4JdEs=;
 b=BC06Cd0FWxbdlGVHQhOV7dGFLYY2ZRNeKSujwZFvYPR/CFa4HWfDrNrrY+UhH8TfOA
 fQwaA9zwXdENeWD/EMBltvJ/mOFYebYONIM0RmMigbwLq3esOOOpT0CPqle56syDMHMH
 iHRVyAoMQw9FnUIxW/wAMtjLKx5a/gyiSCQ8oBxgZiY8DVKaO8wQXJkR5hb7GtU+ciz4
 iHXcgtUAXDDyEbG8W/0Sk5wNvePjNps609u3z+mGFLJZriExW0fy/7J1ampjKsOvpnqO
 9smGrxOnCaOnaxW7/d+giwkRSPWYtF82ZeZ6W+aV8sMjiOKpJnJGHUkxw1HOEsa+9sk/
 Hbzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=QpA+CuwG8DCNtlhazAhB5cYz5NbzRFS82o4f2r4JdEs=;
 b=m01gIRGJ+8UIWQxxLBXT5i+TCPUBwhdgernombJ1IHDnWYTM2mE1JbISHJJST1TocS
 sVVYQMVxNyQsV14Se6kU7+di8FZgMs4IAeL/OSlDEwPR1W+H5PmAF/PozP9tX/y0IynI
 0379AHRlUIOfc6J/4rF8S6q4JLa+sKOwu1sXYZMUNkPaxzhLjV929bUSQGxC04AINc3v
 zp5z/Ch9b2Ag+bN5IyPM8sh/LcFtv6v2f7AwE3bEvXajmpE2mFtHga7E24FDk2meCiY1
 u+xBclvqKwoHUNBT34482SrHE0Z3rYmYD1P6AKu2Ed+VhsKPpep0lz06FDaRexsCD/Hz
 XGdQ==
X-Gm-Message-State: AOAM530R8KyAET34yqjhR0aiiyPF8hj5ZGp1CrURkCe4xGoCmfy6iz7Q
 Lcxhiu7p+jiqCrxYlS3Fe0+zj2sGOdpDNg==
X-Google-Smtp-Source: ABdhPJyYD9xZW0wANpzCjFEYz3PpQNrdAkk0bevYdoInsHmYIY4snZhzb+M6i5juKoFZlxNQ6YZBcg==
X-Received: by 2002:a1c:4d17:: with SMTP id o23mr21754289wmh.102.1621235333931; 
 Mon, 17 May 2021 00:08:53 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id t2sm2651779wrx.54.2021.05.17.00.08.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 00:08:53 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-trivial@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH] target/riscv: Remove obsolete 'CPU unmigratable' comment
Date: Mon, 17 May 2021 09:08:51 +0200
Message-Id: <20210517070851.857841-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
X-List-Received-Date: Mon, 17 May 2021 07:08:58 -0000

The RISCV CPU is migratable since commit f7697f0e629
("target/riscv: Add basic vmstate description of CPU"),
so remove an obsolete comment which is now incorrect.

Reported-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/riscv/cpu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 3191fd00822..d459e8427e2 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -638,7 +638,6 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     cc->disas_set_info = riscv_cpu_disas_set_info;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = riscv_cpu_get_phys_page_debug;
-    /* For now, mark unmigratable: */
     cc->vmsd = &vmstate_riscv_cpu;
     cc->write_elf64_note = riscv_cpu_write_elf64_note;
     cc->write_elf32_note = riscv_cpu_write_elf32_note;
-- 
2.26.3


