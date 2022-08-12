Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oMdzl-000344-Sy
	for mharc-qemu-riscv@gnu.org; Fri, 12 Aug 2022 19:23:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <furquan@rivosinc.com>)
 id 1oMdzk-00033n-Kb
 for qemu-riscv@nongnu.org; Fri, 12 Aug 2022 19:23:12 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:51194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <furquan@rivosinc.com>)
 id 1oMdzi-0005KU-IM
 for qemu-riscv@nongnu.org; Fri, 12 Aug 2022 19:23:12 -0400
Received: by mail-pj1-x1031.google.com with SMTP id gj1so2288197pjb.0
 for <qemu-riscv@nongnu.org>; Fri, 12 Aug 2022 16:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc;
 bh=mExfCeXFWg1DYgAI/TOayelkbRsjZoPOIUPwb/vaPVk=;
 b=vJL2YO6ylvCe5ZfS54dx0xyyWze0zg8tr3znw0hqTrG2aAOaTPEASWSsZSUpWBfVsk
 dbmPAggxyeP3YW0Q/Op+9IzNmaXNwowTH6PTeIyuwQGdXO2VHcEcowYl7eihU9ORQ/eJ
 5q8POA4JZnUNpk78NFTMUxZup4r5bl66gV21GMVSI6jwj9eSU5an7nOUO3196lyLy7aO
 mykjbTBKh5Zi/+DzyS3wqKw0JUYjJXuFLTgl5Ja9o0mSvWzj8yJi35v0d84ldraYHQqK
 OGuoTKq9ETeVNvVaXhYJPm6UiLoGf/Rly/JVqtaaDO8MV2bpqE15M1q+hVGHavogBCVd
 k4fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc;
 bh=mExfCeXFWg1DYgAI/TOayelkbRsjZoPOIUPwb/vaPVk=;
 b=ukP7Fx4Ph+mPVoSz8cwVL7n8eaKINZXVuFRqHNzRnJSd7RWEq0VUWA8Uw9Fhrt2bTu
 OPHjpvxs6q6Kpc2/7tB1VXbeXkMiW8iw2SKh04UzQlekHxywYZDF5A6rrXcxblo3bhqf
 YYxUlTlDZf0274efK4HA19pv6jsYzdxBrGKaqwNzggUIHqumzfZ4233GRMmtqVvHnnyA
 xDPry2XfHNuU0zGS7WpMzMLtR/5zTjBs8qEALWN4tzanYtNoO8eJz/mCbSkPBJ8+Eiw5
 DoGAe6kiwTT1TPhDreFTClgVGA4XoJKVbw+MVXP07Qv4AFc2W9RGtwhieJBU73EAPJVV
 yBzg==
X-Gm-Message-State: ACgBeo10tUjJlNkzu8LJeN/YnYYIc3DXehC/Rpw1hMzXOIxUdBVymd1j
 gUMA/JnSzVcOL9+Vm42V0wRY0JhZBFPXQpFLFR95UA==
X-Google-Smtp-Source: AA6agR4zOebfyLVCBBWlcfCIoiWITqj+voJhD+0MUzpES9a3xW/oN7ez7yR/gEjwOVP44KxNHxJ+Vm8SdIi4En4U1iw=
X-Received: by 2002:a17:902:7293:b0:16f:17c3:e809 with SMTP id
 d19-20020a170902729300b0016f17c3e809mr6284771pll.158.1660346588824; Fri, 12
 Aug 2022 16:23:08 -0700 (PDT)
MIME-Version: 1.0
From: Furquan Shaikh <furquan@rivosinc.com>
Date: Fri, 12 Aug 2022 16:22:58 -0700
Message-ID: <CA+tJHD4Fdv54_u9vffu9tNuor4Tu_Ld-eYZkLRmTxi=X2wknnw@mail.gmail.com>
Subject: [PATCH v2] riscv: Make semihosting configurable for all privilege
 modes
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
 Andrew Jones <ajones@ventanamicro.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=furquan@rivosinc.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 12 Aug 2022 23:23:12 -0000

Unlike ARM, RISC-V does not define a separate breakpoint type for
semihosting. Instead, it is entirely ABI. Thus, we need an option
to allow users to configure what the ebreak behavior should be for
different privilege levels - M, S, U, VS, VU. As per the RISC-V
privilege specification[1], ebreak traps into the execution
environment. However, RISC-V debug specification[2] provides
ebreak{m,s,u,vs,vu} configuration bits to allow ebreak behavior to
be configured to trap into debug mode instead. This change adds
settable properties for RISC-V CPUs - `ebreakm`, `ebreaks`, `ebreaku`,
`ebreakvs` and `ebreakvu` to allow user to configure whether qemu
should treat ebreak as semihosting traps or trap according to the
privilege specification.

[1] https://github.com/riscv/riscv-isa-manual/releases/download/draft-20220=
723-10eea63/riscv-privileged.pdf
[2] https://github.com/riscv/riscv-debug-spec/blob/release/riscv-debug-rele=
ase.pdf

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Furquan Shaikh <furquan@rivosinc.com>
---
 v2: Updated qemu-options.hx to document the ebreak options.
     Retained Reviewed-by from Philippe and Andrew since no
     functional change in this version.

 qemu-options.hx           |  4 +++-
 target/riscv/cpu.c        |  8 ++++++++
 target/riscv/cpu.h        |  7 +++++++
 target/riscv/cpu_helper.c | 26 +++++++++++++++++++++++++-
 4 files changed, 43 insertions(+), 2 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 3f23a42fa8..1e2e153946 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4635,7 +4635,9 @@ SRST
     open/read/write/seek/select. Tensilica baremetal libc for ISS and
     linux platform "sim" use this interface.

-    On RISC-V this implements the standard semihosting API, version 0.2.
+    On RISC-V this implements the standard semihosting API, version 0.2. S=
ee
+    the ebreak{m,s,u,vs,vu} CPU properties to control which modes treat
+    breakpoints as semihosting calls.

     ``target=3Dnative|gdb|auto``
         Defines where the semihosting calls will be addressed, to QEMU
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ac6f82ebd0..082194652b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -953,6 +953,14 @@ static Property riscv_cpu_properties[] =3D {
     DEFINE_PROP_BOOL("short-isa-string", RISCVCPU,
cfg.short_isa_string, false),

     DEFINE_PROP_BOOL("rvv_ta_all_1s", RISCVCPU, cfg.rvv_ta_all_1s, false),
+
+    /* Debug spec */
+    DEFINE_PROP_BOOL("ebreakm", RISCVCPU, cfg.ebreakm, true),
+    DEFINE_PROP_BOOL("ebreaks", RISCVCPU, cfg.ebreaks, false),
+    DEFINE_PROP_BOOL("ebreaku", RISCVCPU, cfg.ebreaku, false),
+    DEFINE_PROP_BOOL("ebreakvs", RISCVCPU, cfg.ebreakvs, false),
+    DEFINE_PROP_BOOL("ebreakvu", RISCVCPU, cfg.ebreakvu, false),
+
     DEFINE_PROP_END_OF_LIST(),
 };

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 5c7acc055a..eee8e487a6 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -454,6 +454,13 @@ struct RISCVCPUConfig {
     bool epmp;
     bool aia;
     bool debug;
+
+    /* Debug spec */
+    bool ebreakm;
+    bool ebreaks;
+    bool ebreaku;
+    bool ebreakvs;
+    bool ebreakvu;
     uint64_t resetvec;

     bool short_isa_string;
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 59b3680b1b..be09abbe27 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -1314,6 +1314,30 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr
address, int size,

     return true;
 }
+
+static bool semihosting_enabled(RISCVCPU *cpu)
+{
+    CPURISCVState *env =3D &cpu->env;
+
+    switch (env->priv) {
+    case PRV_M:
+        return cpu->cfg.ebreakm;
+    case PRV_S:
+        if (riscv_cpu_virt_enabled(env)) {
+            return cpu->cfg.ebreakvs;
+        } else {
+            return cpu->cfg.ebreaks;
+        }
+    case PRV_U:
+        if (riscv_cpu_virt_enabled(env)) {
+            return cpu->cfg.ebreakvu;
+        } else {
+            return cpu->cfg.ebreaku;
+        }
+    }
+
+    return false;
+}
 #endif /* !CONFIG_USER_ONLY */

 /*
@@ -1342,7 +1366,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
     target_ulong mtval2 =3D 0;

     if  (cause =3D=3D RISCV_EXCP_SEMIHOST) {
-        if (env->priv >=3D PRV_S) {
+        if (semihosting_enabled(cpu)) {
             do_common_semihosting(cs);
             env->pc +=3D 4;
             return;
--
2.34.1

