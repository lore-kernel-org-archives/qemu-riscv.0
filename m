Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mIAoR-00076a-Lo
	for mharc-qemu-riscv@gnu.org; Mon, 23 Aug 2021 10:20:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changbin.du@gmail.com>)
 id 1mIAoP-0006zG-TC; Mon, 23 Aug 2021 10:20:29 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:34546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <changbin.du@gmail.com>)
 id 1mIAoN-00039f-Mo; Mon, 23 Aug 2021 10:20:29 -0400
Received: by mail-pf1-x433.google.com with SMTP id g14so15496761pfm.1;
 Mon, 23 Aug 2021 07:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eeo1h/TzT/1BYxMqMuNd/nSv5nQmfBvOeOH5vBp13gk=;
 b=E0F754i4xbW/lZ5jUL9EH22liDion28ZesCCLYRQTXAAJMMTMVKVKn++xS3I3wJenM
 DpD6DBf1fNUViaPTx2mHqTRyI/pP0JQCJRiAt2LsyapJAjKrtpkV3nPIlF3AZSD8qC2Z
 RM9tAAeAsS2pj9LSKjHP8HSCLkTYkEw97qs8aBv7tzRskuVrweAU35dn89SjLm7UPXAH
 TEWUi01tjWksFMeSgjeuB9Xi0lEVwj9blENibKJFvcC+u3X5dshClbEi5uSlOLR0oket
 PIH/HzyMBzjWYF3ikap+QPIFVdtqIAlFSaJeYe1/sNInDvynaXiOSprEqVdHJKaUHuiy
 b7Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eeo1h/TzT/1BYxMqMuNd/nSv5nQmfBvOeOH5vBp13gk=;
 b=Pnni023U7wJQ+R0F+ijVlS6Wvgsy3aS0LgYIGNVc6DACqxHXtJpmd6T5IH9+/zbu3e
 OnHaOwQ9uaF4JTJDAaTMAivKgspmHfnU/ETziNTJ2V7zJuq0pY6Ap6JX7wgwPW5NX8vT
 cY/8mSMGP1mOXkUFXgo1wVKonsEGluQj5T3kjwe1Bp/NoTT3ib+KaN3KgTO1zWwPeCKK
 fGuHERO13KRjplg6roItUlNVsmtmGEWNUVSaySfsxJph198UttcLIzpz2w14N25q5gdr
 JyLF+fMHa/NFhFl51mZq8cKkKPqa7MLx/Beaq5GnWjr6lzPQwdnXQDjOao9LgxGf3+Hi
 BgfA==
X-Gm-Message-State: AOAM532QlRKkx75+4GR/GjZeV8YiW22Yqv1QzR1mzc6WLKi+l67E5UHr
 fnijGkeUc4XztU3jszTMfBg=
X-Google-Smtp-Source: ABdhPJyT9uNaNdS3e262ZGJ1B0Htn7CWmp1LVCXRwXGupYuEuUM0JEEdFQ2Hs2327G6uPhXRWGXhxg==
X-Received: by 2002:a62:5543:0:b0:3eb:22a3:bb5c with SMTP id
 j64-20020a625543000000b003eb22a3bb5cmr8001725pfb.61.1629728425254; 
 Mon, 23 Aug 2021 07:20:25 -0700 (PDT)
Received: from WRT-WX9.. ([141.164.41.4])
 by smtp.gmail.com with ESMTPSA id ev12sm4700796pjb.57.2021.08.23.07.20.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 07:20:24 -0700 (PDT)
From: Changbin Du <changbin.du@gmail.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Changbin Du <changbin.du@gmail.com>
Subject: [PATCH 1/3] gdbstub: add basic infrastructure to support switchable
 endianness
Date: Mon, 23 Aug 2021 22:20:02 +0800
Message-Id: <20210823142004.17935-2-changbin.du@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210823142004.17935-1-changbin.du@gmail.com>
References: <20210823142004.17935-1-changbin.du@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=changbin.du@gmail.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 23 Aug 2021 14:20:30 -0000

Some architectures (e.g. ARM versions 3 and above, RISC-V, PowerPC, Alpha,
MIPS, IA-64...) allow switchable endianness. Now our emulation code can
handle both endianness well, but the gdbstub can only handle one of them.

For example, it is problematic to debug a ARM big endian guest on x86 host.
This because the GDB remote protocol transfers values in target byte order
but qemu always take it as little endian on x86 host.

To support switchable endianness targets, this patch introduces:
  - a new sub-option 'endianness' for '-gdb'.
  - common interfaces to swap byte order according to host and target
    byte order.
  - a new configuration option TARGET_SWICHABLE_ENDIANNESS.

For example, to debug a arm64 big endian target, you could start qemu as
below:

  $ qemu-system-aarch64 -gdb tcp::1234,endianness=big ...

Latter we will add switchable endianness support for ARM and RISC-V
targets. For other switchable targets them can be supported in future.

Signed-off-by: Changbin Du <changbin.du@gmail.com>
---
 gdbstub.c              | 11 +++++++
 include/exec/gdbstub.h | 72 +++++++++++++++++++++++++++++++-----------
 qemu-options.hx        |  7 ++--
 softmmu/vl.c           | 50 ++++++++++++++++++++++++++++-
 4 files changed, 119 insertions(+), 21 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 52bde5bdc9..ec67d6a299 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -62,6 +62,17 @@
 static int phy_memory_mode;
 #endif
 
+#ifdef HOST_WORDS_BIGENDIAN
+const bool gdb_host_bigendian = true;
+#else
+const bool gdb_host_bigendian = false;
+#endif
+#ifdef TARGET_WORDS_BIGENDIAN
+bool gdb_target_bigendian = true;
+#else
+bool gdb_target_bigendian = false;
+#endif
+
 static inline int target_memory_rw_debug(CPUState *cpu, target_ulong addr,
                                          uint8_t *buf, int len, bool is_write)
 {
diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index a024a0350d..2c6f90fc28 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -84,9 +84,17 @@ void gdb_register_coprocessor(CPUState *cpu,
                               gdb_get_reg_cb get_reg, gdb_set_reg_cb set_reg,
                               int num_regs, const char *xml, int g_pos);
 
+extern const bool gdb_host_bigendian;
+extern bool gdb_target_bigendian;
+
+/* The GDB remote protocol transfers values in target byte order. */
+static inline bool gdb_bswap_needed(void)
+{
+    return gdb_host_bigendian != gdb_target_bigendian;
+}
+
 /*
- * The GDB remote protocol transfers values in target byte order. As
- * the gdbstub may be batching up several register values we always
+ * As the gdbstub may be batching up several register values we always
  * append to the array.
  */
 
@@ -98,21 +106,21 @@ static inline int gdb_get_reg8(GByteArray *buf, uint8_t val)
 
 static inline int gdb_get_reg16(GByteArray *buf, uint16_t val)
 {
-    uint16_t to_word = tswap16(val);
+    uint16_t to_word = gdb_bswap_needed() ? bswap16(val) : val;
     g_byte_array_append(buf, (uint8_t *) &to_word, 2);
     return 2;
 }
 
 static inline int gdb_get_reg32(GByteArray *buf, uint32_t val)
 {
-    uint32_t to_long = tswap32(val);
+    uint32_t to_long = gdb_bswap_needed() ? bswap32(val) : val;
     g_byte_array_append(buf, (uint8_t *) &to_long, 4);
     return 4;
 }
 
 static inline int gdb_get_reg64(GByteArray *buf, uint64_t val)
 {
-    uint64_t to_quad = tswap64(val);
+    uint64_t to_quad = gdb_bswap_needed() ? bswap64(val) : val;
     g_byte_array_append(buf, (uint8_t *) &to_quad, 8);
     return 8;
 }
@@ -121,17 +129,20 @@ static inline int gdb_get_reg128(GByteArray *buf, uint64_t val_hi,
                                  uint64_t val_lo)
 {
     uint64_t to_quad;
-#ifdef TARGET_WORDS_BIGENDIAN
-    to_quad = tswap64(val_hi);
-    g_byte_array_append(buf, (uint8_t *) &to_quad, 8);
-    to_quad = tswap64(val_lo);
-    g_byte_array_append(buf, (uint8_t *) &to_quad, 8);
-#else
-    to_quad = tswap64(val_lo);
-    g_byte_array_append(buf, (uint8_t *) &to_quad, 8);
-    to_quad = tswap64(val_hi);
-    g_byte_array_append(buf, (uint8_t *) &to_quad, 8);
-#endif
+
+    if (gdb_bswap_needed()) {
+        if (gdb_target_bigendian) {
+            to_quad = bswap64(val_hi);
+            g_byte_array_append(buf, (uint8_t *) &to_quad, 8);
+            to_quad = bswap64(val_lo);
+            g_byte_array_append(buf, (uint8_t *) &to_quad, 8);
+        } else {
+            to_quad = bswap64(val_lo);
+            g_byte_array_append(buf, (uint8_t *) &to_quad, 8);
+            to_quad = bswap64(val_hi);
+            g_byte_array_append(buf, (uint8_t *) &to_quad, 8);
+        }
+    }
     return 16;
 }
 
@@ -157,13 +168,38 @@ static inline uint8_t * gdb_get_reg_ptr(GByteArray *buf, int len)
     return buf->data + buf->len - len;
 }
 
+static inline uint8_t gdb_read_reg8(uint8_t *mem_buf)
+{
+    return *mem_buf;
+}
+
+static inline uint16_t gdb_read_reg16(uint8_t *mem_buf)
+{
+    uint16_t val = lduw_p(mem_buf);
+    return gdb_bswap_needed() ? bswap16(val) : val;
+}
+
+static inline uint32_t gdb_read_reg32(uint8_t *mem_buf)
+{
+    uint32_t val = ldl_p(mem_buf);
+    return gdb_bswap_needed() ? bswap32(val) : val;
+}
+
+static inline uint64_t gdb_read_reg64(uint8_t *mem_buf)
+{
+    uint64_t val = ldq_p(mem_buf);
+    return gdb_bswap_needed() ? bswap64(val) : val;
+}
+
 #if TARGET_LONG_BITS == 64
 #define gdb_get_regl(buf, val) gdb_get_reg64(buf, val)
-#define ldtul_p(addr) ldq_p(addr)
+#define gdb_read_regl(mem_buf) gdb_read_reg64(mem_buf)
 #else
 #define gdb_get_regl(buf, val) gdb_get_reg32(buf, val)
-#define ldtul_p(addr) ldl_p(addr)
+#define gdb_read_regl(mem_buf) gdb_read_reg32(mem_buf)
 #endif
+/* ldtul_p is deprecated */
+#define ldtul_p(mem_buf)       gdb_read_regl(mem_buf)
 
 #endif
 
diff --git a/qemu-options.hx b/qemu-options.hx
index 83aa59a920..779b861331 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -3954,9 +3954,12 @@ SRST
 ERST
 
 DEF("gdb", HAS_ARG, QEMU_OPTION_gdb, \
-    "-gdb dev        accept gdb connection on 'dev'. (QEMU defaults to starting\n"
+    "-gdb [dev=]device[,endianness=default|little|big]\n"
+    "                accept gdb connection on 'dev'. (QEMU defaults to starting\n"
     "                the guest without waiting for gdb to connect; use -S too\n"
-    "                if you want it to not start execution.)\n",
+    "                if you want it to not start execution.) The 'endianness'\n"
+    "                specifies the endianness mode of the target which supports\n"
+    "                switchable endianness.\n",
     QEMU_ARCH_ALL)
 SRST
 ``-gdb dev``
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 5ca11e7469..dc57d518ab 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1405,6 +1405,48 @@ static void qemu_create_default_devices(void)
     }
 }
 
+static QemuOptsList qemu_gdb_opts = {
+    .name = "gdb",
+    .head = QTAILQ_HEAD_INITIALIZER(qemu_gdb_opts.head),
+    .implied_opt_name = "dev",
+    .desc = {
+        {
+            .name = "dev",
+            .type = QEMU_OPT_STRING,
+        },
+        {
+            .name = "endianness",
+            .type = QEMU_OPT_STRING,
+        },
+        { /* end of list */ }
+    },
+};
+
+static void configure_gdb(QemuOpts *opts)
+{
+    const char *dev = qemu_opt_get(opts, "dev");
+    const char *endianness = qemu_opt_get(opts, "endianness");
+
+    if (dev) {
+        add_device_config(DEV_GDB, dev);
+    }
+
+    if (endianness && strcmp(endianness, "default")) {
+#ifdef TARGET_SWICHABLE_ENDIANNESS
+        if (!strcmp(endianness, "little")) {
+            gdb_target_bigendian = false;
+        } else if (!strcmp(endianness, "big")) {
+            gdb_target_bigendian = true;
+        } else {
+            error_report("unknown endianness %s", endianness);
+        }
+#else
+        error_report("endianness is not switchable for current target");
+        exit(1);
+#endif
+    }
+}
+
 static int serial_parse(const char *devname)
 {
     int index = num_serial_hds;
@@ -2761,6 +2803,7 @@ void qemu_init(int argc, char **argv, char **envp)
     qemu_add_opts(&qemu_semihosting_config_opts);
     qemu_add_opts(&qemu_fw_cfg_opts);
     qemu_add_opts(&qemu_action_opts);
+    qemu_add_opts(&qemu_gdb_opts);
     module_call_init(MODULE_INIT_OPTS);
 
     error_init(argv[0]);
@@ -3014,7 +3057,12 @@ void qemu_init(int argc, char **argv, char **envp)
                 add_device_config(DEV_GDB, "tcp::" DEFAULT_GDBSTUB_PORT);
                 break;
             case QEMU_OPTION_gdb:
-                add_device_config(DEV_GDB, optarg);
+                opts = qemu_opts_parse_noisily(qemu_find_opts("gdb"),
+                                               optarg, true);
+                if (!opts) {
+                    exit(EXIT_FAILURE);
+                }
+                configure_gdb(opts);
                 break;
             case QEMU_OPTION_L:
                 if (is_help_option(optarg)) {
-- 
2.32.0


