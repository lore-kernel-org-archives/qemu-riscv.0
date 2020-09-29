Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kNKw3-000242-Te
	for mharc-qemu-riscv@gnu.org; Tue, 29 Sep 2020 15:05:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kNKw2-00021N-0R
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2020 15:05:10 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:43765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kNKvz-0001fE-1w
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2020 15:05:09 -0400
Received: by mail-pg1-x532.google.com with SMTP id t14so4613781pgl.10
 for <qemu-riscv@nongnu.org>; Tue, 29 Sep 2020 12:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ehyRrMGdOjUIgMs9VpmBLNCLy7Zc+fW0jq8FzUHQAkk=;
 b=K8pFoIPSSO90EUskSuxGyDbtnirOlwmqgR0AJPFH7uApf3nj9Yb+acxruu9Y9PFbLg
 uAGl5Tq8i899TVNutC0GZqE0ZaVxFylIRDNd3AXWUAJ7Wi64NZzcRWSe3Oh6B9R9Hb1f
 ZhadmT6EldyAczLQiT5gBk8btvpSARULAC1Ja3tUorIt3dV2RcG8/j+C23pY9PE/LMsS
 yVzNwsCwG2p4t3aDGaYAAQLf67pBnYu9rdG36muWtV/SJK3O0pT5oIkPejV8VoafCtQo
 12C/AeasukLbsGTrVyOCUH919CP3XoncBVnxdP4o8SMzib8un9pghffxz37M4FxNPD6r
 2H1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ehyRrMGdOjUIgMs9VpmBLNCLy7Zc+fW0jq8FzUHQAkk=;
 b=W+GXd8cf184WmTfhcqh2YFkbvTF1Ll79W45Y7c6lRVVNvrJ+PQeWa4vjFniy0tI5mT
 b5oQr/eT2dcNUJJaYXe0jZ9hhExPlZXBQBgBwiqfAauCI0D3MQJT3o9e4iB6uJHfhBwm
 /OKgSgBEvbvS9T54o+gEtN0WuEpeDQ599v9B36+NLhKUWEvrpoAvydIQfeDpZ76srte/
 +lYGXZU5ny1JMRHMGgeMPfli0xmcVRsZRl135qtoei6en0/e27xg2t8heqLgFjLVS4qq
 VvDURxGyuH/+pCJYQmqW7ojwewxqRe9h3cyBYFTq6bd9kkh1QpLlIlODK04vr8VgdRJh
 ubkA==
X-Gm-Message-State: AOAM531dlg5bUrBpjtXOldLWa01QZV6XCfvCLMCY7qEUQ9gH6CwHfpW+
 RhgDIhdM4DbcnxrKGQs3eXGiEQ==
X-Google-Smtp-Source: ABdhPJzV3OiOSk93OJFeeP+i0L16g8a1Yye2k6tvFxYBTEA8g9oFtjT67Xc9cHNZVJuJnYr8/GMNZw==
X-Received: by 2002:a05:6a00:1356:b029:13e:5203:fba3 with SMTP id
 k22-20020a056a001356b029013e5203fba3mr5290454pfu.3.1601406305172; 
 Tue, 29 Sep 2020 12:05:05 -0700 (PDT)
Received: from localhost.localdomain (122-116-72-36.HINET-IP.hinet.net.
 [122.116.72.36])
 by smtp.gmail.com with ESMTPSA id v8sm6003950pgg.58.2020.09.29.12.05.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 12:05:04 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v5 01/68] target/riscv: drop vector 0.7.1 and add 1.0 support
Date: Wed, 30 Sep 2020 03:03:36 +0800
Message-Id: <20200929190448.31116-2-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200929190448.31116-1-frank.chang@sifive.com>
References: <20200929190448.31116-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x532.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Tue, 29 Sep 2020 19:05:10 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 10 +++++-----
 target/riscv/cpu.h |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 57c006df5d..17c138bb90 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -345,7 +345,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     CPURISCVState *env = &cpu->env;
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
     int priv_version = PRIV_VERSION_1_11_0;
-    int vext_version = VEXT_VERSION_0_07_1;
+    int vext_version = VEXT_VERSION_1_00_0;
     target_ulong target_misa = 0;
     Error *local_err = NULL;
 
@@ -463,8 +463,8 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
                 return;
             }
             if (cpu->cfg.vext_spec) {
-                if (!g_strcmp0(cpu->cfg.vext_spec, "v0.7.1")) {
-                    vext_version = VEXT_VERSION_0_07_1;
+                if (!g_strcmp0(cpu->cfg.vext_spec, "v1.0")) {
+                    vext_version = VEXT_VERSION_1_00_0;
                 } else {
                     error_setg(errp,
                            "Unsupported vector spec version '%s'",
@@ -472,8 +472,8 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
                     return;
                 }
             } else {
-                qemu_log("vector verison is not specified, "
-                        "use the default value v0.7.1\n");
+                qemu_log("vector version is not specified, "
+                        "use the default value v1.0\n");
             }
             set_vext_version(env, vext_version);
         }
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 65daa73675..bf10b64fcb 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -79,7 +79,7 @@ enum {
 #define PRIV_VERSION_1_10_0 0x00011000
 #define PRIV_VERSION_1_11_0 0x00011100
 
-#define VEXT_VERSION_0_07_1 0x00000701
+#define VEXT_VERSION_1_00_0 0x00010000
 
 #define TRANSLATE_PMP_FAIL 2
 #define TRANSLATE_FAIL 1
-- 
2.17.1


