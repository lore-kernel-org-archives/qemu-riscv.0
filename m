Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mezKU-0001YQ-1H
	for mharc-qemu-riscv@gnu.org; Mon, 25 Oct 2021 08:43:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rpathak@ventanamicro.com>)
 id 1mezKS-0001VR-Vb
 for qemu-riscv@nongnu.org; Mon, 25 Oct 2021 08:43:53 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:46599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rpathak@ventanamicro.com>)
 id 1mezKP-0004vu-KA
 for qemu-riscv@nongnu.org; Mon, 25 Oct 2021 08:43:52 -0400
Received: by mail-pg1-x530.google.com with SMTP id m21so10787431pgu.13
 for <qemu-riscv@nongnu.org>; Mon, 25 Oct 2021 05:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tfUV7oJ2mhm7zUUG5xjBd2nK9YReoYg0TzctZ+b4gW4=;
 b=NrzwzkrBqRxyzOe6Dlee2N2OPO10hCRMR+LJb5Fbxq4bYJfl94/W1S9Q8UxSaOIlyV
 lWMs6hzXsfiVp5r1Q+Gw+P1xfaeMJizeyjonX+R8oW8bp370rsd2sGcenOuxfYhAchQ2
 rBLNE7fwTM7/4/RKy9WQ2hTFNFfsNdrIjcdMldphh/RB/q5IOr8anSL1O2Vw+W5owTJU
 3U0ywrUSea9z+JH17lVdl/9H1rIt45qyiGFEHQPB9Zo+m2CSTeX+BfeZ7MVDcJX0suvH
 J+lSxzEnLuI7x4MJaSdKqrwSXB7nED6QmoZfUUeLrGDlrMBjCU7VZKT2j89zE/cRtncK
 97dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tfUV7oJ2mhm7zUUG5xjBd2nK9YReoYg0TzctZ+b4gW4=;
 b=NqJxZTHHGWS40CN4Bk5Ri3ZzlpGHMHzQrfdAiG3OxElU4i+eiEbBeH9/yPkQC/jb81
 3U20UyfVwo3cvJQeTblDae/htFbieDFkQdjUckVRtxHx4s2C1YvgTg5R+nTOMVritgBO
 bqCMGo4/zJhc3Qc+PnHxivXONtBX4bfXbHeHQ0UVma09HXygo1+AY/zDrzAuVKw/dRfu
 lYSPmatmqFmSc6miR9N3YuSYPZwovKM6ncjN4i/cefm54ScCztqI8ZMv+l8b815B2WIT
 n8eMVsbmJ0s/kIEMXP85bbYq/5AoJG64G25jIOZnrlc7tO24WUZP0MFKGCbEOU56vi4f
 HwmQ==
X-Gm-Message-State: AOAM531UxbfP5kAzd98eOYCF1JGl8v0USk5Li5GgJlQsApPaUxLQD53W
 NXWbKWWP/VT9od+MjvbTlZSgWKgtRACXfg==
X-Google-Smtp-Source: ABdhPJyEuV0DZwYTJMlS983+Rb7FMh++tcMrKRy1Ih5y3kolJGU68FNp4hpSG30YVbCxJezzlRir4Q==
X-Received: by 2002:a05:6a00:a8e:b0:47b:a658:7f4d with SMTP id
 b14-20020a056a000a8e00b0047ba6587f4dmr17914144pfl.82.1635165827940; 
 Mon, 25 Oct 2021 05:43:47 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:6817:c049:7263:28b8:7cdf:c7e4])
 by smtp.googlemail.com with ESMTPSA id nn2sm3293461pjb.34.2021.10.25.05.43.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 05:43:47 -0700 (PDT)
From: Rahul Pathak <rpathak@ventanamicro.com>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, bmeng.cn@gmail.com,
 Alistair.Francis@wdc.com
Cc: rpathak@ventanamicro.com
Subject: [PATCH v2 1/2] target/riscv: Add priv spec 1.12.0 version check
Date: Mon, 25 Oct 2021 18:13:18 +0530
Message-Id: <20211025124319.195290-2-rpathak@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211025124319.195290-1-rpathak@ventanamicro.com>
References: <20211025124319.195290-1-rpathak@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=rpathak@ventanamicro.com; helo=mail-pg1-x530.google.com
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
X-List-Received-Date: Mon, 25 Oct 2021 12:43:53 -0000

Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
---
 target/riscv/cpu.c | 4 +++-
 target/riscv/cpu.h | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 788fa0b11c..83c3814a5a 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -405,7 +405,9 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     }
 
     if (cpu->cfg.priv_spec) {
-        if (!g_strcmp0(cpu->cfg.priv_spec, "v1.11.0")) {
+        if (!g_strcmp0(cpu->cfg.priv_spec, "v1.12.0")) {
+            priv_version = PRIV_VERSION_1_12_0;
+        } else if (!g_strcmp0(cpu->cfg.priv_spec, "v1.11.0")) {
             priv_version = PRIV_VERSION_1_11_0;
         } else if (!g_strcmp0(cpu->cfg.priv_spec, "v1.10.0")) {
             priv_version = PRIV_VERSION_1_10_0;
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index a33dc30be8..67c52e6f9e 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -79,6 +79,7 @@ enum {
 
 #define PRIV_VERSION_1_10_0 0x00011000
 #define PRIV_VERSION_1_11_0 0x00011100
+#define PRIV_VERSION_1_12_0 0x00011200
 
 #define VEXT_VERSION_0_07_1 0x00000701
 
-- 
2.25.1


