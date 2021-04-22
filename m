Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lZfAY-0001vi-Rn
	for mharc-qemu-riscv@gnu.org; Thu, 22 Apr 2021 15:39:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZfAW-0001pd-H6; Thu, 22 Apr 2021 15:39:20 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:53839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZfAU-00057e-6m; Thu, 22 Apr 2021 15:39:20 -0400
Received: by mail-wm1-x331.google.com with SMTP id w186so20195605wmg.3;
 Thu, 22 Apr 2021 12:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ihV9O9yTVtGcI1ps/jSm4x/bK7fEiTqIiB+cKzqcXs4=;
 b=XLh+v1gbJMnAVrx29+u1RUDo5tUhYYxSBy6l1s0U6O7qZEM/KKdlbz4jV/1BGaTfRd
 uGiSDoMbe4iBKYblQlzWcDu0hAB2grjCjmy+jShXDLCC2holF2/R652hR209Wd1Maz85
 li38HjWCK1+2W353Y+pmOL5nrfZjFrQ0z/BNVofaJTCeT6/HjG9iMgora6sENHKCGveb
 kUXi/jIapfO/u2BrqgQgJpotXCSXmt20nhboa7rZ2FRmk9zMJ29h461E4rBBeyBXImzJ
 TqcbYVVzaTOWbwP+Pcndu1qBPXAusdkPGhsfTNz0XPCU2N25T5vE24gtV3cqaufRC7np
 lAgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ihV9O9yTVtGcI1ps/jSm4x/bK7fEiTqIiB+cKzqcXs4=;
 b=H43cnIx3vxMg6AWXHRpUq5d+/feU132nOrI7oi1j4ua0vLDUYxY+BdZ+PJ9x568XGh
 8uW+mrem8MbCwKqevtLr4RvdgBgSIOKbDr+OYo70YHAX4NC3FJO0LNLVgJDJSkYqQYbM
 QEiyvtgqreblr82CUzUQxw67ER8PWO5W40RFSWBKU7vJToB/sz7HCcddb729/k9Mz+f7
 ktynN6jH1XaJG3dyRulQKs9vmzQJAiYB1axWHOrgXHZ0XswONjX6QLg5Rj2qNg/txHoJ
 4+RHT9P7oWg7IUomDJt3bkIT+0RTiG1BEty18PM9aeqb4dYdERgwgnpBeTeT/P1+Ihb2
 m5Ew==
X-Gm-Message-State: AOAM5322LsTiVQv/yDZmViu6dk5CVShbcikig2RIIFMtixO5NM8EIDL9
 Y3nTWVUQGp8tGvxCX9gdLxvxjqw1ysn+rA==
X-Google-Smtp-Source: ABdhPJxTyi8KdiHJnCKLRppZZXL1lNeExXpqj57ApsimvtXIBuG7BXBzsLUg5KhQmlnrRgW8eyz5rA==
X-Received: by 2002:a1c:2342:: with SMTP id j63mr350940wmj.109.1619120354873; 
 Thu, 22 Apr 2021 12:39:14 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id o17sm5682842wrg.80.2021.04.22.12.39.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 12:39:14 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-riscv@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, qemu-arm@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH v6 02/18] cpu: Introduce cpu_virtio_is_big_endian()
Date: Thu, 22 Apr 2021 21:38:46 +0200
Message-Id: <20210422193902.2644064-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210422193902.2644064-1-f4bug@amsat.org>
References: <20210422193902.2644064-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 22 Apr 2021 19:39:21 -0000

Introduce the cpu_virtio_is_big_endian() generic helper to avoid
calling CPUClass internal virtio_is_big_endian() one.

Similarly to commit bf7663c4bd8 ("cpu: introduce
CPUClass::virtio_is_big_endian()"), we keep 'virtio' in the method
name to hint this handler shouldn't be called anywhere but from the
virtio code.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h | 9 +++++++++
 hw/core/cpu.c         | 8 ++++++--
 hw/virtio/virtio.c    | 4 +---
 3 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 9338e80aa4b..08af2c383a5 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -604,6 +604,15 @@ hwaddr cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
  */
 int cpu_asidx_from_attrs(CPUState *cpu, MemTxAttrs attrs);
 
+/**
+ * cpu_virtio_is_big_endian:
+ * @cpu: CPU
+
+ * Returns %true if a CPU which supports runtime configurable endianness
+ * is currently big-endian.
+ */
+bool cpu_virtio_is_big_endian(CPUState *cpu);
+
 #endif /* CONFIG_USER_ONLY */
 
 /**
diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index 4dce35f832f..daaff56a79e 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -218,8 +218,13 @@ static int cpu_common_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg)
     return 0;
 }
 
-static bool cpu_common_virtio_is_big_endian(CPUState *cpu)
+bool cpu_virtio_is_big_endian(CPUState *cpu)
 {
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    if (cc->virtio_is_big_endian) {
+        return cc->virtio_is_big_endian(cpu);
+    }
     return target_words_bigendian();
 }
 
@@ -438,7 +443,6 @@ static void cpu_class_init(ObjectClass *klass, void *data)
     k->write_elf64_note = cpu_common_write_elf64_note;
     k->gdb_read_register = cpu_common_gdb_read_register;
     k->gdb_write_register = cpu_common_gdb_write_register;
-    k->virtio_is_big_endian = cpu_common_virtio_is_big_endian;
     set_bit(DEVICE_CATEGORY_CPU, dc->categories);
     dc->realize = cpu_common_realizefn;
     dc->unrealize = cpu_common_unrealizefn;
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 07f4e60b309..8a364496fd5 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -1973,9 +1973,7 @@ static enum virtio_device_endian virtio_default_endian(void)
 
 static enum virtio_device_endian virtio_current_cpu_endian(void)
 {
-    CPUClass *cc = CPU_GET_CLASS(current_cpu);
-
-    if (cc->virtio_is_big_endian(current_cpu)) {
+    if (cpu_virtio_is_big_endian(current_cpu)) {
         return VIRTIO_DEVICE_ENDIAN_BIG;
     } else {
         return VIRTIO_DEVICE_ENDIAN_LITTLE;
-- 
2.26.3


