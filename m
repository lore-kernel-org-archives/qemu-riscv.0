Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n4wYl-0007k1-CD
	for mharc-qemu-riscv@gnu.org; Tue, 04 Jan 2022 22:01:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1n4wYg-0007dw-Ct; Tue, 04 Jan 2022 22:01:50 -0500
Received: from [2607:f8b0:4864:20::52f] (port=45758
 helo=mail-pg1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1n4wYe-0007Pu-Sa; Tue, 04 Jan 2022 22:01:50 -0500
Received: by mail-pg1-x52f.google.com with SMTP id f5so4955457pgk.12;
 Tue, 04 Jan 2022 19:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b5NAdpMm2U58lIzwIEChXRECAvMzIUZbnYwnZLt4VXI=;
 b=BRQvLtIk6W6NWIWXISMotoQaD4dxwkUY1kTLuyaExOUq/JL/+oOhR8dGvr1KacEylK
 cNRhieAKsr+/L+YxFwZy11/xDQQ/s6QEA76g300YvPsDhUnR7xhB5eELE6nCvTu8tIUJ
 TWopmQlsZZVF1di0i9Zf3Yz6/FbHzYG7m3dAWnCvrKqSLDlzHofRZ4Zbb2eWM6n8kOrA
 uZ3znjenbyKtXiwTpWcJSKNHxRw/qE6VUIg2iVOm97XZP03ME8P1q2QVT86YxwHkhSxD
 akYOSItrlyL8dtYO0EAv2KoG9uVBRDxG5guvjlFSHnMnJtCGBmP/s92ItKSyYKSnI1i3
 bQLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b5NAdpMm2U58lIzwIEChXRECAvMzIUZbnYwnZLt4VXI=;
 b=xI5oEvU3EFRv1gb5T7DY9PBgUM/PhtpsllqdxBXayofKk9UR2wUPKKqAARTveiOw+K
 Px87oqSnWwnT/m4ANX4to6fEpajlcgBPkOnsalEm4gfzDebSPOZfAWygV7w6XOeRIFs3
 Fj6tRbYtSyy1Q0UpLnaLf/ZGzXK0D9psnmkHyLGgnCAgs+Ej+Wa8XUIXN7KGlgeFLYHi
 mRs3I+4fq61VMpTSqpTHBPdI+zNCUrF/l7jesiL70ibV7FRE1Usoq9JyhiXS92BvU+5A
 mqEyFJXOKUKaoDZNGJ0XJSYwq98pbrpqm8OyumiC325gsaTwk7QqNMofuDgGenSo4BCA
 fKgA==
X-Gm-Message-State: AOAM530SOsY0l1p5DGZXRHqEhRu1X+Hgr33r1XcXVtyNsKXq3nYEYz2/
 fjV6nt0YtVh9GKPomGUk0ruCDz6eg18b3A==
X-Google-Smtp-Source: ABdhPJx4RXcJqeoa3dPkZy7KiLbrCZMNJKiWXV6mUjfv232FtyY0ASb5NMUGEl+liBkvO/9Viq3elA==
X-Received: by 2002:a63:b954:: with SMTP id v20mr27457581pgo.302.1641351706550; 
 Tue, 04 Jan 2022 19:01:46 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com (unknown-176-192.windriver.com.
 [147.11.176.192])
 by smtp.gmail.com with ESMTPSA id nu14sm23011pjb.17.2022.01.04.19.01.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 19:01:46 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
X-Google-Original-From: Bin Meng <bin.meng@windriver.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v3 4/7] target/riscv: cpu: Add a config option for native debug
Date: Wed,  5 Jan 2022 11:01:23 +0800
Message-Id: <20220105030126.778503-5-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220105030126.778503-1-bin.meng@windriver.com>
References: <20220105030126.778503-1-bin.meng@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 05 Jan 2022 03:01:50 -0000

Add a config option to enable support for native M-mode debug.
This is disabled by default and can be enabled with 'debug=true'.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

---

(no changes since v2)

Changes in v2:
- change the config option to 'disabled' by default

 target/riscv/cpu.h | 2 ++
 target/riscv/cpu.c | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 0f3b3a4219..35445bbc86 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -75,6 +75,7 @@ enum {
     RISCV_FEATURE_MMU,
     RISCV_FEATURE_PMP,
     RISCV_FEATURE_EPMP,
+    RISCV_FEATURE_DEBUG,
     RISCV_FEATURE_MISA
 };
 
@@ -332,6 +333,7 @@ struct RISCVCPU {
         bool mmu;
         bool pmp;
         bool epmp;
+        bool debug;
         uint64_t resetvec;
     } cfg;
 };
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 3aa07bc019..d36c31ce9a 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -448,6 +448,10 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         }
     }
 
+    if (cpu->cfg.debug) {
+        set_feature(env, RISCV_FEATURE_DEBUG);
+    }
+
     set_resetvec(env, cpu->cfg.resetvec);
 
     /* Validate that MISA_MXL is set properly. */
@@ -634,6 +638,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
+    DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, false),
 
     DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
     DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
-- 
2.25.1


