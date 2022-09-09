Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oWeHO-0007hw-Eo
	for mharc-qemu-riscv@gnu.org; Fri, 09 Sep 2022 09:42:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oWeHM-0007b8-EJ; Fri, 09 Sep 2022 09:42:44 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:44860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oWeHK-0003GY-Ps; Fri, 09 Sep 2022 09:42:44 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 i15-20020a17090a4b8f00b0020073b4ac27so1601230pjh.3; 
 Fri, 09 Sep 2022 06:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=CXtLs4cC0Sc4W+FLjd/8FI/L4QFPmsbnws1pGm7bptM=;
 b=Th+OFzyiQRSAQ2RlTowerCaLbqDxjfurNvqkyoO5YhvK7H6odaFNJH2pr2Yu4O5bAR
 OljrgYEN4jA7Va1AshIYS3ymM6TB8oG0IunbAQytnEfscvhBnEritristc4H62c0rLAk
 Y2mxt1DJVyxis8iwt+EUZL+uQISQwTkasBqQ0Y0fRnHKqzD7iVWNa5PpN8H0ZzzoiMd/
 o1IvSmdpeQdzINPCowRitDcxpWJO+u8ECyj6G71T4frG3EHMV8HBTvXEZjJea+N8vkYZ
 gUDVr9DYIywrqhU8Wmb1Lf3KetDkmyhvGgV6Ih92PUyZQGdRWgmpqS2sHFRXA9nV2RvE
 Is+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=CXtLs4cC0Sc4W+FLjd/8FI/L4QFPmsbnws1pGm7bptM=;
 b=wRwcUlS3br01QjaFvk7q6uyYG5CgR8NW8WeXjfnfL50lzxrtNTOIslAtQVathqm5tK
 SHnSwMwpGuM1F2PDBoIBJBzKmVaPX/OBubD83VUsNN3ocrujhW0rtVhyw+MVVf3RoF/u
 IDeJtvbir6V2M26uTXMqlQLzqMrXHil406GS4UY0hAW4nDtQCeBEjdSbSAEmlsQywqh6
 YGMiq5oKJu66IfCvg9lSAVXv3Ht0lA4zKOYYGauARDXtKC7qiT10csKt7Azd8GPU8oZc
 JPMNzJ4s43QOwehwmnIYCeRPdduWuKeC56KIgyHvD3j3T9QjS0tV4qY+HEzHOj/94Dva
 OgYA==
X-Gm-Message-State: ACgBeo0BKUKMaG0rrtpvdt6ULqnJ01HSDQFyjN5+wtpZg0/kW6rBI1r0
 o11b19fHqDvmwkZ0EjY/R+qP+Xjq0oI=
X-Google-Smtp-Source: AA6agR7qjrPmktjhIFiyBFw9iCQasiU9iH19+vnSmkoq+LEDTg1SdBx5HomwFU0izU1oQMBF7eJmHA==
X-Received: by 2002:a17:90a:c782:b0:1fb:307f:7cbd with SMTP id
 gn2-20020a17090ac78200b001fb307f7cbdmr9559034pjb.14.1662730961109; 
 Fri, 09 Sep 2022 06:42:41 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 196-20020a6306cd000000b0042a4612c07esm513172pgg.39.2022.09.09.06.42.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Sep 2022 06:42:40 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v2 7/8] target/riscv: debug: Check VU/VS modes for type 2
 trigger
Date: Fri,  9 Sep 2022 21:42:14 +0800
Message-Id: <20220909134215.1843865-8-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220909134215.1843865-1-bmeng.cn@gmail.com>
References: <20220909134215.1843865-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 09 Sep 2022 13:42:45 -0000

From: Frank Chang <frank.chang@sifive.com>

Type 2 trigger cannot be fired in VU/VS modes.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

(no changes since v1)

 target/riscv/debug.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index 7a8910f980..e16d5c070a 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -464,6 +464,11 @@ bool riscv_cpu_debug_check_breakpoint(CPUState *cs)
 
             switch (trigger_type) {
             case TRIGGER_TYPE_AD_MATCH:
+                /* type 2 trigger cannot be fired in VU/VS mode */
+                if (riscv_cpu_virt_enabled(env)) {
+                    return false;
+                }
+
                 ctrl = env->tdata1[i];
                 pc = env->tdata2[i];
 
@@ -499,6 +504,11 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
 
         switch (trigger_type) {
         case TRIGGER_TYPE_AD_MATCH:
+            /* type 2 trigger cannot be fired in VU/VS mode */
+            if (riscv_cpu_virt_enabled(env)) {
+                return false;
+            }
+
             ctrl = env->tdata1[i];
             addr = env->tdata2[i];
             flags = 0;
-- 
2.34.1


