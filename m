Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzaNL-00082c-F8
	for mharc-qemu-riscv@gnu.org; Wed, 13 Jan 2021 02:15:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzaNK-00080O-GT
 for qemu-riscv@nongnu.org; Wed, 13 Jan 2021 02:15:26 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:35731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzaNI-0004Nt-RV
 for qemu-riscv@nongnu.org; Wed, 13 Jan 2021 02:15:26 -0500
Received: by mail-pj1-x102e.google.com with SMTP id b5so602956pjl.0
 for <qemu-riscv@nongnu.org>; Tue, 12 Jan 2021 23:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=p/qbE6jexeElRhM8mddkBf23LGth+Huw3fAq1j6ZypM=;
 b=C1UEprSbIFByRWLB2vJvWDauSH+BED0u7flhLvgD51HNjrinVKHr05zWLWRI3NIMue
 ZbuwLijWozBm/XFff41ODESV2MzawvxPv5h1jyxhKGbVX2/7oP2rh5YFEEkMw8za324N
 exDUQeJQ+mXZx2oHYMQRARdROXeCWqQRMp6ysEZpkwKC//e19O/imjnqXCpJCc+GFYka
 NNJAHKg5WGeselPIY30oTeUQRKQMZmYCyxGOfiblUw62J3LmQUo8E3wMy6/GEgOz20/8
 mYthoozrFZwiT0bUugpt44kZGxe2pFnMoK3nULBCbKNbkP2mKY30OXqfM9qQdz+EPnPw
 yMjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=p/qbE6jexeElRhM8mddkBf23LGth+Huw3fAq1j6ZypM=;
 b=ZptMM/MnrxeZ1BKSAJ93ZHobCXGAjDP8MfKHFux9MmYaagUNqWUS/mzEGjMrpvg5Nq
 8yZm9gQr7yXG36zouEB5IlMCuvVq1AtLX9r1xTRYSIGu5qcn6OR/4krt2B7YZvtt/CuA
 ngmdUVca9SnyuVbixPVE5leBEZDYAmBdnhMXSVTVtM/hIOOcrIZrBVkmNSZAvToWKdXF
 dCwgVRg7p89ThfMd6TFSZM9ioIfIAsituehe2x9QDDfyyXv0zyoGr7kLRoFZ2YWH6NRQ
 72cQxY4w7OfAy7JE/jgy12egrAgcXrYtvLsd0McV9kgxG1iry1tzWVN0v79qAQSyNGu0
 82jw==
X-Gm-Message-State: AOAM533caw6jUQlkghRF/rHQU9/yjr3WKKIX2n2w69z88cSHEs5At290
 aZ0zHHNGZP/X5UyLHZ3YZyKTfQ==
X-Google-Smtp-Source: ABdhPJyfycNMXUYUuIWR4AkPp6TwdcbTFiYpUqeGBxgT5v/xogQ/nldBw+fG8Qb3nW1eurBQcHR6/w==
X-Received: by 2002:a17:90a:eb13:: with SMTP id
 j19mr768898pjz.219.1610522123469; 
 Tue, 12 Jan 2021 23:15:23 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id l7sm1361888pjy.29.2021.01.12.23.15.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 23:15:22 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Kito Cheng <kito.cheng@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v4 16/16] target/riscv: rvb: support and turn on B-extension
 from command line
Date: Wed, 13 Jan 2021 15:13:48 +0800
Message-Id: <20210113071350.24852-17-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210113071350.24852-1-frank.chang@sifive.com>
References: <20210113071350.24852-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 13 Jan 2021 07:15:27 -0000

From: Kito Cheng <kito.cheng@sifive.com>

B-extension is default off, use cpu rv32 or rv64 with x-b=true to
enable B-extension.

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu.c | 4 ++++
 target/riscv/cpu.h | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 8227d7aea9d..7379a0abc6c 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -472,6 +472,9 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         if (cpu->cfg.ext_h) {
             target_misa |= RVH;
         }
+        if (cpu->cfg.ext_b) {
+            target_misa |= RVB;
+        }
         if (cpu->cfg.ext_v) {
             target_misa |= RVV;
             if (!is_power_of_2(cpu->cfg.vlen)) {
@@ -542,6 +545,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     /* This is experimental so mark with 'x-' */
+    DEFINE_PROP_BOOL("x-b", RISCVCPU, cfg.ext_b, false),
     DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
     DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
     DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 6339e848192..d5271906db4 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -72,6 +72,7 @@
 #define RVS RV('S')
 #define RVU RV('U')
 #define RVH RV('H')
+#define RVB RV('B')
 
 /* S extension denotes that Supervisor mode exists, however it is possible
    to have a core that support S mode but does not have an MMU and there
@@ -282,6 +283,7 @@ struct RISCVCPU {
         bool ext_f;
         bool ext_d;
         bool ext_c;
+        bool ext_b;
         bool ext_s;
         bool ext_u;
         bool ext_h;
-- 
2.17.1


