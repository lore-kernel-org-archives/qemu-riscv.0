Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1liarH-0005V1-TJ
	for mharc-qemu-riscv@gnu.org; Mon, 17 May 2021 06:52:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liarF-0005LH-3J; Mon, 17 May 2021 06:52:21 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:36552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liarD-0006af-A4; Mon, 17 May 2021 06:52:20 -0400
Received: by mail-wr1-x42d.google.com with SMTP id c14so4080858wrx.3;
 Mon, 17 May 2021 03:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l59dJwJTD3X/0a1ZARal5paaLkpJSadoVLKuikWa47k=;
 b=BmVPx1KPaifiuvOXGa4COEASn+9rXlOdAopBowSdJtwknRgiQcWsRx6iGLN9mYPPQT
 uHS7d7vc9mruNJLK5ObIkZXcvrZXhueYfOSAe4f4BiiQtsCBMXGpsK015mPzxhcGyTsB
 mEUr9BgajFYNSrUkSX0MfZYl1lwq/EMBZ1Ahp8J4Cgo+U4lLJ32s4doQPK0NEBOMk6zo
 wujAu1VdHqoYqnCNkbvLKLolfr1A74LBq7rrn2xQFq9yKFC64ioKlVwB95qMEPnFMzTO
 m4O9Io5oYp1MpkdVLZFfuMy5GlyxNilF2d6uWcJHRuDoOjpCoOWqMBYggSz4R02rOoAY
 UcqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=l59dJwJTD3X/0a1ZARal5paaLkpJSadoVLKuikWa47k=;
 b=WGQp0RIsARcxCxBcT1elJQBU1JeFAtqqm33LWVQofnaQy7NzYAlR/EOXq99vwOWKHC
 6GU6foNTFIRbiAXigjAh/qzol0rcAxqnFwkmf+m5AUD/8WU4IrcxRlnandiIyjwbz/T7
 MOzIkgryLpT6symfNmru81B8jdZwSnVaLmTc12lYVfjU8GZ+KBKEfuE/PgtC5zVN4Rbq
 OuuCH9MLj7VjSyaFOHkqGUR98CLH/OJaOUgk92tT3T6rVzSJ/qdiKvdKXZtyVltctvoT
 qtkHHZAh3+OZD9Cs9wqAyTP2I6GfgaYou2P+ps4BEIJfW2N+ht38NDhGR3DBgx5dTd0G
 ZZYg==
X-Gm-Message-State: AOAM531ceMj96ATbcvt76iFfxpKkx8+rtsF0En3dSCVo+GLXGMDflaVE
 mftoIWtUk6Z9KzvgD1CxrfiNqryCKp7RsQ==
X-Google-Smtp-Source: ABdhPJxARe1TggM0cO94HPndcxDkxQrW2nLYeEPPxM1+Jit3Tveb4lDVmNgSWlGwaVS9wOSzAhOy2g==
X-Received: by 2002:adf:e944:: with SMTP id m4mr31326484wrn.10.1621248736089; 
 Mon, 17 May 2021 03:52:16 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id r11sm10990805wrp.46.2021.05.17.03.52.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 03:52:15 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v7 07/23] cpu: Introduce cpu_virtio_is_big_endian()
Date: Mon, 17 May 2021 12:51:24 +0200
Message-Id: <20210517105140.1062037-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210517105140.1062037-1-f4bug@amsat.org>
References: <20210517105140.1062037-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
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
X-List-Received-Date: Mon, 17 May 2021 10:52:22 -0000

Introduce the cpu_virtio_is_big_endian() generic helper to avoid
calling CPUClass internal virtio_is_big_endian() one.

Similarly to commit bf7663c4bd8 ("cpu: introduce
CPUClass::virtio_is_big_endian()"), we keep 'virtio' in the method
name to hint this handler shouldn't be called anywhere but from the
virtio code.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h |  9 +++++++++
 hw/core/cpu-common.c  |  6 ------
 hw/core/cpu-sysemu.c  | 10 ++++++++++
 hw/virtio/virtio.c    |  4 +---
 4 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index df495287850..d96ff4dace0 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -610,6 +610,15 @@ hwaddr cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
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
diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index ddddf4b10eb..9d73c9a28ca 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -185,11 +185,6 @@ static int cpu_common_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg)
     return 0;
 }
 
-static bool cpu_common_virtio_is_big_endian(CPUState *cpu)
-{
-    return target_words_bigendian();
-}
-
 void cpu_dump_state(CPUState *cpu, FILE *f, int flags)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
@@ -388,7 +383,6 @@ static void cpu_class_init(ObjectClass *klass, void *data)
     k->write_elf64_note = cpu_common_write_elf64_note;
     k->gdb_read_register = cpu_common_gdb_read_register;
     k->gdb_write_register = cpu_common_gdb_write_register;
-    k->virtio_is_big_endian = cpu_common_virtio_is_big_endian;
     set_bit(DEVICE_CATEGORY_CPU, dc->categories);
     dc->realize = cpu_common_realizefn;
     dc->unrealize = cpu_common_unrealizefn;
diff --git a/hw/core/cpu-sysemu.c b/hw/core/cpu-sysemu.c
index fe90dde8681..078e1a84a58 100644
--- a/hw/core/cpu-sysemu.c
+++ b/hw/core/cpu-sysemu.c
@@ -54,6 +54,16 @@ int cpu_asidx_from_attrs(CPUState *cpu, MemTxAttrs attrs)
     return ret;
 }
 
+bool cpu_virtio_is_big_endian(CPUState *cpu)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    if (cc->virtio_is_big_endian) {
+        return cc->virtio_is_big_endian(cpu);
+    }
+    return target_words_bigendian();
+}
+
 GuestPanicInformation *cpu_get_crash_info(CPUState *cpu)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index e02544b2df7..ab516ac6144 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -1972,9 +1972,7 @@ static enum virtio_device_endian virtio_default_endian(void)
 
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


