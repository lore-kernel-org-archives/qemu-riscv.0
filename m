Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pZIx4-0007dc-HR
	for mharc-qemu-riscv@gnu.org; Mon, 06 Mar 2023 17:05:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pZIx2-0007QG-Ia
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 17:05:00 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pZIws-0006wz-AO
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 17:04:52 -0500
Received: by mail-pl1-x629.google.com with SMTP id n6so12092026plf.5
 for <qemu-riscv@nongnu.org>; Mon, 06 Mar 2023 14:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678140288;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T4Ht91dtise3VXyeM0B1MvojQi2kjoyoe8PlK/ZAG1w=;
 b=eCRqu08W02petCUTE1XyrLSFg+jLgbgpZzqWKS47OcrOlHhaXvjxUI368gFXmE7pmu
 Smd6Fk4FYlsPniZz3I6LpS0JTcnFAZ5HgK8jXMdkCfE8a1yZ+TTjAtBtdX/ZZ6sXNMm0
 U0e3iO+sfmsIaN3UDHucOARWbysy9BgCmoGURVZ+LVved5/dBKfYBAN4JI9kvmQBJLXa
 9IodZTV/zwLJzr73UAYvLJ/gdcW7H7Pu3gmo4ahMIWzy3WUjlviGLnv6bCvOhKnhZN0S
 m+SED30EuNV7t9AECuNSqueC81xW2Ff5Cw1jomkksnYex2wc1pe0yk2VACbLdgAZ1SqW
 cDYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678140288;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T4Ht91dtise3VXyeM0B1MvojQi2kjoyoe8PlK/ZAG1w=;
 b=l4pjFEDdzjPKG2I+NLWImKiHnq727X9kuukYpNcfIv3KCTJ/NhMNZglnDbWDYQ2rXr
 guX8iNdgccvOcnfxw2XKu0R8M47qDnM2ScjG54lAct21AFhgQJylfKpbZklgU3ShLNC5
 t/iZW+KGY753y8CHwVsNauaxjMXxRSwS3TEPBhRsNQvKpJ0qaHtlYLC2/AnTHFi3i9xj
 8got9eKR1Dh3tqWhDaxMRy35XrLKE3HXV4GCrYJIpExDPpNMReA+FlpJOjdqlXj1uVCq
 5fjhThlt7i/lHPLEr1SPuKbXmonwppAbr+eSKOuanQ8Qs29Q0rX+fMNMubuFmigMLRyl
 hzug==
X-Gm-Message-State: AO0yUKWd52bo4pRzRnIC/w7wdHIfInaIIOy2VlL0bTlX00/22zkSU+9f
 9U28fvbWyuTBvIbWFri2ZLWIndnAo4rfqbRDIxA=
X-Google-Smtp-Source: AK7set9kzOG86b6FYsRqzBdH5UrEEgwIH1y4ave7mMhDTqCErWlb3sEuucmKFsnAVYtNFfTxz7jvFA==
X-Received: by 2002:a17:90b:3e8d:b0:233:ca14:6afb with SMTP id
 rj13-20020a17090b3e8d00b00233ca146afbmr13246385pjb.37.1678140288507; 
 Mon, 06 Mar 2023 14:04:48 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 ga7-20020a17090b038700b00233db0db3dfsm8291035pjb.7.2023.03.06.14.04.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 14:04:48 -0800 (PST)
Subject: [PULL 21/22] hw/riscv/virt.c: Initialize the ACPI tables
Date: Mon,  6 Mar 2023 14:02:58 -0800
Message-Id: <20230306220259.7748-22-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306220259.7748-1-palmer@rivosinc.com>
References: <20230306220259.7748-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Sunil V L <sunilvl@ventanamicro.com>, Bin Meng <bmeng@tinylab.org>,
 Andrew Jones <ajones@ventanamicro.com>, 
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=palmer@rivosinc.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 06 Mar 2023 22:05:00 -0000

From: Sunil V L <sunilvl@ventanamicro.com>

Initialize the ACPI tables if the acpi option is not
disabled.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Message-ID: <20230302091212.999767-8-sunilvl@ventanamicro.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 hw/riscv/virt.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index aed303e1e6..4e3efbee16 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1323,6 +1323,10 @@ static void virt_machine_done(Notifier *notifier, void *data)
     if (kvm_enabled()) {
         riscv_setup_direct_kernel(kernel_entry, fdt_load_addr);
     }
+
+    if (virt_is_acpi_enabled(s)) {
+        virt_acpi_setup(s);
+    }
 }
 
 static void virt_machine_init(MachineState *machine)
-- 
2.39.2


