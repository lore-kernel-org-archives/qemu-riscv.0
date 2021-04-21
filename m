Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lZ4GY-0007aw-87
	for mharc-qemu-riscv@gnu.org; Wed, 21 Apr 2021 00:15:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lZ4GW-0007WS-0s
 for qemu-riscv@nongnu.org; Wed, 21 Apr 2021 00:15:04 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:45049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lZ4GS-0003Nk-E6
 for qemu-riscv@nongnu.org; Wed, 21 Apr 2021 00:15:03 -0400
Received: by mail-pg1-x52b.google.com with SMTP id y32so28515508pga.11
 for <qemu-riscv@nongnu.org>; Tue, 20 Apr 2021 21:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=BwZRS5GJWG/wYNy5H36IQKvFFYR9qB+pAAXqNNytdRg=;
 b=lQ2nJGS+aeExzgGvCfFOs9bwLmT+xqwY6IjoWZJXLZR97YCUAevXG9DwpgUXidltvo
 zlDCVcHIyqgvC1ADHQWfCSk9Mtph/3dZmFbvr8StJLTV8biqymf4SsBh1UBCnJofRU7c
 VU2RhiLUaBaUl3zE0t5djWsVRhwfZ00OKO6nULqm7Fyh/HESO36/A6TJ3f7h5TvDrnai
 ko4f+tqQIV/zEoF9oisHNcxnZOWVX4buNRIvNFhs2b/I1THiBNFtsqK8gr39RggYrqA8
 a88316INulvQZg+MBaJjE7DwAktyuSnZwR8DzKo8rG9YkeperIjp9AW/1Fh9PDjsgzH1
 bNXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=BwZRS5GJWG/wYNy5H36IQKvFFYR9qB+pAAXqNNytdRg=;
 b=A4XQRTFHddHihPrlvSJ+QDgoKZvptLpwpQDg00Kq7yb9XnAUXkEokP5tu3o3Zpyk6A
 I7TF2YrqYkBWf2rDoTA02TPi+v8QA7KfSgJvvhlqmuPzYfQ3f6WEf5XK8vaJq19bn1JT
 okhOzUOhYhVPewlPC+1qK+4qUlqBCAIRjGcBWydy/IXeL/gL2+vkrJPbWNaC5W1ouwGI
 l2KKRnUTzZf7oi9vPQlju2LgL+br91tDJ+NSiEMf+2XQyqkEKJxBO7KjEV3grGWBlJ0N
 8NjIwFNVdvKLTigoz7PrKNL+cj/mIY8137zmm6rycvwVP1B2lvFg29wSWK1VrzYt/PVN
 FowQ==
X-Gm-Message-State: AOAM530kxyRLa6nElR6xLGiXtydQSXUkGKXE+ugMQWOIu6L6kshcBqOs
 efQs6+HL+8LZUGwYYeOhAM66Hg==
X-Google-Smtp-Source: ABdhPJw+9gkKS8ZYJMZsOK4WKn86W161R3Stm7JR9lngbLxrQdpT9IwB9GKgnUXlTpB3phlFZ9EJ1Q==
X-Received: by 2002:a17:90a:7893:: with SMTP id
 x19mr8989185pjk.3.1618978499176; 
 Tue, 20 Apr 2021 21:14:59 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id jx20sm551465pjb.41.2021.04.20.21.14.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 21:14:58 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Kito Cheng <kito.cheng@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [PATCH v5 16/17] target/riscv: rvb: support and turn on B-extension
 from command line
Date: Wed, 21 Apr 2021 12:13:58 +0800
Message-Id: <20210421041400.22243-17-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210421041400.22243-1-frank.chang@sifive.com>
References: <20210421041400.22243-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 21 Apr 2021 04:15:04 -0000

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
index 7d6ed80f6b6..8464a152d14 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -473,6 +473,9 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         if (cpu->cfg.ext_h) {
             target_misa |= RVH;
         }
+        if (cpu->cfg.ext_b) {
+            target_misa |= RVB;
+        }
         if (cpu->cfg.ext_v) {
             target_misa |= RVV;
             if (!is_power_of_2(cpu->cfg.vlen)) {
@@ -543,6 +546,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     /* This is experimental so mark with 'x-' */
+    DEFINE_PROP_BOOL("x-b", RISCVCPU, cfg.ext_b, false),
     DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
     DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
     DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 0a33d387ba8..97073bb8e27 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -72,6 +72,7 @@
 #define RVS RV('S')
 #define RVU RV('U')
 #define RVH RV('H')
+#define RVB RV('B')
 
 /* S extension denotes that Supervisor mode exists, however it is possible
    to have a core that support S mode but does not have an MMU and there
@@ -288,6 +289,7 @@ struct RISCVCPU {
         bool ext_f;
         bool ext_d;
         bool ext_c;
+        bool ext_b;
         bool ext_s;
         bool ext_u;
         bool ext_h;
-- 
2.17.1


