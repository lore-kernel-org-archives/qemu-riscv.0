Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o9iah-0006fi-9m
	for mharc-qemu-riscv@gnu.org; Fri, 08 Jul 2022 03:39:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kito.cheng@sifive.com>)
 id 1o9iaf-0006eW-47
 for qemu-riscv@nongnu.org; Fri, 08 Jul 2022 03:39:53 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:43906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kito.cheng@sifive.com>)
 id 1o9iac-0007p1-7P
 for qemu-riscv@nongnu.org; Fri, 08 Jul 2022 03:39:52 -0400
Received: by mail-pl1-x62a.google.com with SMTP id r1so15679648plo.10
 for <qemu-riscv@nongnu.org>; Fri, 08 Jul 2022 00:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W43+Wt4Y6WBfMt3QVm7reNKwOS0giC47Sbj29SuDsC0=;
 b=RErXKggVmpxgQzovZNHs5Mb9i/aQYYW60up7L1v5rvjewShH9ZUPlS35PGz0PPeeUL
 CEwDvRUg23mfMefJsrvqz6HYmQ1reHqz7uQr0JzmNIsJquA/3tRVl7YuRtvD6tgGEjAO
 joCuSUYq4w0taoLdUMTc+Ra/HY9b5m8aE7uTkDomitP6Ekn9AZ3ztlxJ//8qtu/B3vH+
 PWPr2XAPwD5n9XU5XGEDBw3yU57xbhXw5wdIevY+UWl6ob7SI8VCsvBaZ/7yOZ4dmWGK
 qkxs8Jjzj74GtqvpnCQDL/nrEcwcUgQi7Z0hUkgjoD050LFz+C8YsIzco5rhPzWeGORB
 6EPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W43+Wt4Y6WBfMt3QVm7reNKwOS0giC47Sbj29SuDsC0=;
 b=w7EMtQz0LPbW2ezszB2qu9pvuchO11v3WVth7bgwQvQlBUclV3GmtGWPTknADDcesl
 p8g+Idn3FW+QOZsZ1uBiCXxRxXyaXWKoz13Bz5rzj+KnKNPSi9SpJO8ThmrN7w0u7lxo
 F0qw6z9z6z4bQ1WUnVV8qSJiZmSmiXBR/YM7nXzUiyf+RvwEtFOlrn27YzfoKPOyb2Pn
 wtXCziJhXaOdQw/uN3L9tvuWhU6SJDBu6/ds9eBION3cE6FXRf1QFpTNu/EWJLcuzdwY
 /BHA70369UTaW4goCAlwI6CmIIzBgTRzbPXi0MxDBUwRbg1Gsr+t4XkqmSGryiVqkXnG
 KI9A==
X-Gm-Message-State: AJIora/8N/gkzP16XUwVpk6lf0Hyku90D3cxkkN9V80HnVZYDts3+n5O
 hYj2XDtiBNWU15CIjnhuaSjsGw==
X-Google-Smtp-Source: AGRyM1tw0HQfeZEUxOKsrHNe6Y5s0jJn2yH/BbqTk4uZabixqgQOo5VE+MLcNm8UF8BdvC/UUEQyKw==
X-Received: by 2002:a17:90a:a404:b0:1ee:e545:288b with SMTP id
 y4-20020a17090aa40400b001eee545288bmr2506685pjp.142.1657265987989; 
 Fri, 08 Jul 2022 00:39:47 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 l17-20020a170903121100b0016bef50c1ebsm8122412plh.128.2022.07.08.00.39.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 00:39:47 -0700 (PDT)
From: Kito Cheng <kito.cheng@sifive.com>
To: alistair.francis@wdc.com, palmer@dabbelt.com, frank.chang@sifive.com,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org, liweiwei@iscas.ac.cn
Cc: Kito Cheng <kito.cheng@sifive.com>
Subject: [PATCH 1/2] target/riscv: Lower bound of VLEN is 32,
 and check VLEN >= ELEN
Date: Fri,  8 Jul 2022 15:39:42 +0800
Message-Id: <20220708073943.54781-1-kito.cheng@sifive.com>
X-Mailer: git-send-email 2.34.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=kito.cheng@sifive.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 08 Jul 2022 07:39:53 -0000

According RVV spec 1.0, the minmal requirement of VLEN is great than or
equal to ELEN, and minmal possible ELEN is 32, and also spec has mention
`Minimum VLEN` for zve32* is 32, so the lower bound of VLEN is 32 I
think.

[1] https://github.com/riscv/riscv-v-spec/blob/master/v-spec.adoc#2-implementation-defined-constant-parameters
[2] https://github.com/riscv/riscv-v-spec/blob/master/v-spec.adoc#182-zve-vector-extensions-for-embedded-processors

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
---
 target/riscv/cpu.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1bb3973806..487d0faa63 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -740,10 +740,10 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
                         "Vector extension VLEN must be power of 2");
                 return;
             }
-            if (cpu->cfg.vlen > RV_VLEN_MAX || cpu->cfg.vlen < 128) {
+            if (cpu->cfg.vlen > RV_VLEN_MAX || cpu->cfg.vlen < 32) {
                 error_setg(errp,
                         "Vector extension implementation only supports VLEN "
-                        "in the range [128, %d]", RV_VLEN_MAX);
+                        "in the range [32, %d]", RV_VLEN_MAX);
                 return;
             }
             if (!is_power_of_2(cpu->cfg.elen)) {
@@ -757,6 +757,12 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
                         "in the range [8, 64]");
                 return;
             }
+            if (cpu->cfg.vlen < cpu->cfg.elen) {
+                error_setg(errp,
+                        "Vector extension VLEN must be greater than or equal "
+                        "to ELEN");
+                return;
+            }
             if (cpu->cfg.vext_spec) {
                 if (!g_strcmp0(cpu->cfg.vext_spec, "v1.0")) {
                     vext_version = VEXT_VERSION_1_00_0;
-- 
2.34.0


