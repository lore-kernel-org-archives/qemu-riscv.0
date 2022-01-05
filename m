Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n4wfj-0007MG-96
	for mharc-qemu-riscv@gnu.org; Tue, 04 Jan 2022 22:09:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1n4wff-0007Dl-Mo; Tue, 04 Jan 2022 22:09:03 -0500
Received: from [2607:f8b0:4864:20::1034] (port=56196
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1n4wfe-0001y0-21; Tue, 04 Jan 2022 22:09:03 -0500
Received: by mail-pj1-x1034.google.com with SMTP id iy13so32844403pjb.5;
 Tue, 04 Jan 2022 19:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=geRTMoTOmniVdLxzEbf3bfCiKz4/5LuNyClrvi5S6Yo=;
 b=ecx5mDHQ//UaisXXoQKz5yR0PM+AOXilMdxplXKJ1x+I304FoKG1cGwDaXXOVBrZRg
 UC7erxFcA0r6t8WSlvVWinilIshQGZC+FpUhHW8IPBLaC/p0OpjF6+ZRrxX3NeRncIXp
 4fx1gDEKyJ9xbzaTYqk7gDEX4Hf/p86KNWGuQ4AbWOFOmADj0z9D4AHMDnLA8DMI/v/8
 +5Mgmbf9PUEzQrQFOB87iiGFOpecTKrYAmyhrArgarK7+yCLtkvt/qkbGj4EvK9Ypm8n
 nfgnzEOYkY6I7vWTI7mHNpLlzSiY8NJqPsww/ToKRMtp/+fjOIHHCAWwp7kT+H7ZVqBH
 U9Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=geRTMoTOmniVdLxzEbf3bfCiKz4/5LuNyClrvi5S6Yo=;
 b=5OIOTKh5QvvnGS2aVH1LcEHTW8EeApM52mDu9y2Q8RZRvkS1x6oJO9exM3ZtifTl0+
 nX8PphTbGvkgKprrxdYTFbIzXYSAvl9GCdPFbRa9VhcpNJDKLvnJuey5HYKLmYkSygiP
 d0mtoDzPXwSyKpEh82GXRy86qqEvI4qd5tK+rhgg9KKpLujMFnlCexBuvuFL7y4ikExj
 SXpLeugD/6W3GJGw1PFVJkT8eqC7xKkIZ4Qd+aN5TKGWvlK55w5Ld0gabL/CuPxTs9D0
 iXT+pmBdba3dso/BokFqPKiRh/7ZI3XNs56sOZmxbUKWA0VBymTw2VC/j1hdSSTjnjP8
 G++A==
X-Gm-Message-State: AOAM533kj9pZRlJ3zG9OaSZvf7gliZooEwRNloB6boNLwK6QoRP+NOvW
 SgVdKI4X07SepHu8pxqVopk=
X-Google-Smtp-Source: ABdhPJx4H9Ep5W11GxtPNscT7hMrPWNbrDzWfuGLSjkyTwgE6n0x1uPd2A6fFJyBE9ISi/Nt53QdiA==
X-Received: by 2002:a17:90a:520e:: with SMTP id
 v14mr1681886pjh.221.1641352140476; 
 Tue, 04 Jan 2022 19:09:00 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com (unknown-176-192.windriver.com.
 [147.11.176.192])
 by smtp.gmail.com with ESMTPSA id t191sm36206889pgd.3.2022.01.04.19.08.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 19:09:00 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [RESEND PATCH v3 4/7] target/riscv: cpu: Add a config option for
 native debug
Date: Wed,  5 Jan 2022 11:08:41 +0800
Message-Id: <20220105030844.780642-5-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220105030844.780642-1-bmeng.cn@gmail.com>
References: <20220105030844.780642-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1034.google.com
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
X-List-Received-Date: Wed, 05 Jan 2022 03:09:04 -0000

From: Bin Meng <bin.meng@windriver.com>

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


