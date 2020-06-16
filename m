Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jkzoX-00076k-Cc
	for mharc-qemu-riscv@gnu.org; Mon, 15 Jun 2020 20:50:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jkzoV-00073U-Mt; Mon, 15 Jun 2020 20:50:55 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:39326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jkzoT-0006JS-Nw; Mon, 15 Jun 2020 20:50:55 -0400
Received: by mail-pj1-x1029.google.com with SMTP id h95so725683pje.4;
 Mon, 15 Jun 2020 17:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=uw1r8epZoEetYZu7MSacVagmc0CVPicKiM+zkpvkEbQ=;
 b=blHCDv4WlH9qOfnHL3zeToaevnFVWeu//PM+Ebp/hUkefY9H41k2AKeLpvAwVv6x2x
 FW6o01rd2HCrtuEnLjCnSn19crNHPX/4ZMd8qIqXg7cWiF9YIMR4yHj8T7FsjE63ISi+
 PcCj18aixvcTsD8w0agG+fGSlaSSqFrcmUZzKQXzA1jkiMTFvxys8PlzSHt9vqa6eJWS
 DonT0UCRQmpOThIASCc3NQdoAyhBZB2Wo7HkOMR984v70T/X6h7fs2pAaYZQg4MZ2tRP
 xkiyaFYpPTAnL2UdA3+4Y9WGSrXNcyB0uaDrs1rVyFiIbQAmslfynU1rHg+vPtFRO76d
 WgGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=uw1r8epZoEetYZu7MSacVagmc0CVPicKiM+zkpvkEbQ=;
 b=rZo8sAxh9/FFNDpMPptZLadeey49nuqGBfUQJz9F5VwYUWVr5sXwJ+XtaHru2uIEOq
 yJ/qoSmBjRSKuN7QWHhqxg+bVvl/QzN3k9gwMcdnZos9b7dXNG8u2OraOHy6wohotQF4
 eheUn5ITCASloZg1uWMY9+HyYw1OFNi0DcDF7MFDAXU+a4JCV+W2t9lDpGDgilLbwkfK
 bfM2oJ5ckI2gf/lD5KDrju5TN1Tn1sM9hDk+9sb1lH/rCK6yB7TG1HDb3eIPhItN6Xof
 GoEkzQhyheCEYEb2WEr46i3gPz6cNtWT0x4QQCfBZaMeoaVUn+Nh029/lypvMKcwLoWG
 5AIQ==
X-Gm-Message-State: AOAM5330RU5jgniHy7rLsMgVIGmXNtTbKwicyhTVzHF1so/AJUx9vneu
 5UoLvaKyWjfIoxqlwjGzHM8=
X-Google-Smtp-Source: ABdhPJy0xij/8bkE+QyhiE0zYs0lKbmfdiyGYyVjpGJi/1JZlRgRjwFzKNJ2D1R8m5Twg95cbyLwqw==
X-Received: by 2002:a17:90b:3685:: with SMTP id
 mj5mr320716pjb.162.1592268652181; 
 Mon, 15 Jun 2020 17:50:52 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id i20sm15210539pfd.81.2020.06.15.17.50.51
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Mon, 15 Jun 2020 17:50:51 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v2 2/5] hw/riscv: sifive: Change SiFive E/U CPU reset vector
 to 0x1004
Date: Mon, 15 Jun 2020 17:50:38 -0700
Message-Id: <1592268641-7478-3-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1592268641-7478-1-git-send-email-bmeng.cn@gmail.com>
References: <1592268641-7478-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1029.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Tue, 16 Jun 2020 00:50:56 -0000

From: Bin Meng <bin.meng@windriver.com>

Per the SiFive manual, all E/U series CPU cores' reset vector is
at 0x1004. Update our codes to match the hardware.

Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v2:
- rebase on https://github.com/alistair23/qemu riscv-to-apply.next branch
- rename SiFive E/U CPU init routine names

 hw/riscv/sifive_e.c | 10 ++++++----
 hw/riscv/sifive_u.c |  6 +++---
 target/riscv/cpu.c  | 16 ++++++++--------
 3 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index d9a5c7b..d1d3bf1 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -98,14 +98,16 @@ static void sifive_e_machine_init(MachineState *machine)
         memmap[SIFIVE_E_DTIM].base, main_mem);
 
     /* Mask ROM reset vector */
-    uint32_t reset_vec[2];
+    uint32_t reset_vec[4];
 
     if (s->revb) {
-        reset_vec[0] = 0x200102b7;        /* 0x1000: lui     t0,0x20010 */
+        reset_vec[1] = 0x200102b7;  /* 0x1004: lui     t0,0x20010 */
     } else {
-        reset_vec[0] = 0x204002b7;        /* 0x1000: lui     t0,0x20400 */
+        reset_vec[1] = 0x204002b7;  /* 0x1004: lui     t0,0x20400 */
     }
-    reset_vec[1] = 0x00028067;        /* 0x1004: jr      t0 */
+    reset_vec[2] = 0x00028067;      /* 0x1008: jr      t0 */
+
+    reset_vec[0] = reset_vec[3] = 0;
 
     /* copy in the reset vector in little_endian byte order */
     for (i = 0; i < sizeof(reset_vec) >> 2; i++) {
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index aaa5adb..0a86ffc 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -433,18 +433,18 @@ static void sifive_u_machine_init(MachineState *machine)
 
     /* reset vector */
     uint32_t reset_vec[8] = {
+        0x00000000,
         0x00000297,                    /* 1:  auipc  t0, %pcrel_hi(dtb) */
-        0x02028593,                    /*     addi   a1, t0, %pcrel_lo(1b) */
+        0x01c28593,                    /*     addi   a1, t0, %pcrel_lo(1b) */
         0xf1402573,                    /*     csrr   a0, mhartid  */
 #if defined(TARGET_RISCV32)
         0x0182a283,                    /*     lw     t0, 24(t0) */
 #elif defined(TARGET_RISCV64)
-        0x0182b283,                    /*     ld     t0, 24(t0) */
+        0x0182e283,                    /*     lwu    t0, 24(t0) */
 #endif
         0x00028067,                    /*     jr     t0 */
         0x00000000,
         start_addr,                    /* start: .dword */
-        0x00000000,
                                        /* dtb: */
     };
 
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 5f03458..391a0b9 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -134,20 +134,20 @@ static void riscv_base_cpu_init(Object *obj)
     set_resetvec(env, DEFAULT_RSTVEC);
 }
 
-static void rvxx_gcsu_priv1_10_0_cpu_init(Object *obj)
+static void rvxx_sifive_u_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     set_misa(env, RVXLEN | RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
     set_priv_version(env, PRIV_VERSION_1_10_0);
-    set_resetvec(env, DEFAULT_RSTVEC);
+    set_resetvec(env, 0x1004);
 }
 
-static void rvxx_imacu_nommu_cpu_init(Object *obj)
+static void rvxx_sifive_e_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     set_misa(env, RVXLEN | RVI | RVM | RVA | RVC | RVU);
     set_priv_version(env, PRIV_VERSION_1_10_0);
-    set_resetvec(env, DEFAULT_RSTVEC);
+    set_resetvec(env, 0x1004);
     qdev_prop_set_bit(DEVICE(obj), "mmu", false);
 }
 
@@ -578,13 +578,13 @@ static const TypeInfo riscv_cpu_type_infos[] = {
 #if defined(TARGET_RISCV32)
     DEFINE_CPU(TYPE_RISCV_CPU_BASE32,           riscv_base_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_IBEX,             rv32_ibex_cpu_init),
-    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E31,       rvxx_imacu_nommu_cpu_init),
+    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E31,       rvxx_sifive_e_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E34,       rv32_imafcu_nommu_cpu_init),
-    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U34,       rvxx_gcsu_priv1_10_0_cpu_init),
+    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U34,       rvxx_sifive_u_cpu_init),
 #elif defined(TARGET_RISCV64)
     DEFINE_CPU(TYPE_RISCV_CPU_BASE64,           riscv_base_cpu_init),
-    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E51,       rvxx_imacu_nommu_cpu_init),
-    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U54,       rvxx_gcsu_priv1_10_0_cpu_init),
+    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E51,       rvxx_sifive_e_cpu_init),
+    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U54,       rvxx_sifive_u_cpu_init),
 #endif
 };
 
-- 
2.7.4


