Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nonbw-000279-1m
	for mharc-qemu-riscv@gnu.org; Wed, 11 May 2022 10:46:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nonbo-00022P-4f
 for qemu-riscv@nongnu.org; Wed, 11 May 2022 10:46:36 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:37785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nonbm-0001BI-IU
 for qemu-riscv@nongnu.org; Wed, 11 May 2022 10:46:35 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 t11-20020a17090ad50b00b001d95bf21996so5158905pju.2
 for <qemu-riscv@nongnu.org>; Wed, 11 May 2022 07:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cQC++Y+pGUPUs/8x3sQ/i/xqv7tFU+CkLDMWJDdpamI=;
 b=hwzEePzDD8eho2m/nLCG0OVoBNWJvhCW9mEOImuXTlg2+gf0ia7oAbKSM4BYyKtoTV
 46H3mBulnlmepSbVJNRiKoTFIX0uYsgm2fQ3knSAaq0+0N4HPoFt2+21wMt52LvcCh2M
 Dj4D/tKbTxSZ24BepOtnGC7T1UqgFMRudYSJPcr4yDObe9+nIJ01oxCv2grAq8ZFKWtN
 yZaj9U033v+iImbt66uADoS2/Sk+mFl6P07mWLpSJY8hm3lGBYT7xHmNFa92zcmocyVA
 Eu/uxcDYg3YNaFLDQ1pmjIBVvAj1YK5HWwQv0lc+zV8kl3XTC441z6ZHzAxg4FWO+21r
 F6vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cQC++Y+pGUPUs/8x3sQ/i/xqv7tFU+CkLDMWJDdpamI=;
 b=Kt8B1mbc/OrebMFQaPv3QLDyiIBS6rneZrLmMTO9OTlTkCl7bAbsia6bv1CdAqq5E4
 lQWuacIxBa6ScHTAwIbg83amaSXUr8BSVK/zvQc36AF9c5MMPiVGUHtMDL+fzWBHxrMF
 iUOmoJkO3u42HC7LJCaiHsVXmlXP7r19ypAnFbUay8kclLg2SJaAlLnsC0SziVMg7Cwe
 5ItQDrp7Y79xkT6Sjtr25IQnSQyGBoVMZ6j0zmLeYI4aFhaxpRcIxfC/XGI8DtLHiD95
 Y8QD4IW13y+gV01Zp9ika5WnnobTIYtYsjWaBSsccVQQRWrgAGoQ3dMLqX4P8j3lyiGT
 bi6w==
X-Gm-Message-State: AOAM531EjxLTZs8e/OfubBPNfdsPSB8qG3Y30LSJYLw0+VcGPSz6YuH/
 ZOmVys5UH+VKfXcZKe80+N7mAQ==
X-Google-Smtp-Source: ABdhPJxrT/pDMXP3nE59GCBHnmvltIpmsxr/S2apkhSJ7ckpd3BwnxwXKpyopDWdlCxaXbLMY65+FA==
X-Received: by 2002:a17:902:dac1:b0:15e:9faa:e926 with SMTP id
 q1-20020a170902dac100b0015e9faae926mr25449593plx.61.1652280392835; 
 Wed, 11 May 2022 07:46:32 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.113.90])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a170902820200b0015eafc485c8sm1958726pln.289.2022.05.11.07.46.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 07:46:31 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 2/8] target/riscv: Fix hstatus.GVA bit setting for traps
 taken from HS-mode
Date: Wed, 11 May 2022 20:15:22 +0530
Message-Id: <20220511144528.393530-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220511144528.393530-1-apatel@ventanamicro.com>
References: <20220511144528.393530-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=apatel@ventanamicro.com; helo=mail-pj1-x102e.google.com
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
X-List-Received-Date: Wed, 11 May 2022 14:46:37 -0000

Currently, QEMU does not set hstatus.GVA bit for traps taken from
HS-mode into HS-mode which breaks the Xvisor nested MMU test suite
on QEMU. This was working previously.

This patch updates riscv_cpu_do_interrupt() to fix the above issue.

Fixes: 86d0c457396b ("target/riscv: Fixup setting GVA")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 target/riscv/cpu_helper.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index e1aa4f2097..b16bfe0182 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -1367,7 +1367,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
         case RISCV_EXCP_INST_PAGE_FAULT:
         case RISCV_EXCP_LOAD_PAGE_FAULT:
         case RISCV_EXCP_STORE_PAGE_FAULT:
-            write_gva = true;
+            write_gva = env->two_stage_lookup;
             tval = env->badaddr;
             break;
         case RISCV_EXCP_ILLEGAL_INST:
@@ -1434,7 +1434,6 @@ void riscv_cpu_do_interrupt(CPUState *cs)
                 /* Trap into HS mode */
                 env->hstatus = set_field(env->hstatus, HSTATUS_SPV, false);
                 htval = env->guest_phys_fault_addr;
-                write_gva = false;
             }
             env->hstatus = set_field(env->hstatus, HSTATUS_GVA, write_gva);
         }
-- 
2.34.1


