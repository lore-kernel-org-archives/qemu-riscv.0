Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F8FBCF884D
	for <qemu-riscv@archiver.kernel.org>; Fri,  4 Oct 2024 16:43:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1swlKC-0008Kr-Td; Fri, 04 Oct 2024 12:38:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1swlIE-0001p0-FI
 for qemu-riscv@nongnu.org; Fri, 04 Oct 2024 12:36:40 -0400
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1swlI8-0006fn-IM
 for qemu-riscv@nongnu.org; Fri, 04 Oct 2024 12:36:36 -0400
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2fabb837ddbso34687571fa.1
 for <qemu-riscv@nongnu.org>; Fri, 04 Oct 2024 09:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728059789; x=1728664589; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NkIrQblPdREZDLEsszsFCn2NBix9iyMsfxXdICSQWJM=;
 b=nbNX94rRI3Z0RjMOcW70h/h8z55DBq3Vi3S4WaykfW5OwMXpqmUW+dkkl0LcF8YGi3
 n/PkHMsu+uWWk9oaAcjCxOb9pSk84Jzb2WANuV99vk8CjJNDje7QT/4bImmyT1TQNTTL
 0wPoFe4UzmRzuPzIVNxk0Fn2NaB7oERzJUDMqZ1f15DHlOOE+SSuoxOYNPXS2eyU2dmH
 prUZcctilHRBjQKkIfMguUfLWF646lyUJN7OgSrmRhZa0YvobPkGvhZSWHtb2UwVSFKs
 Tsc3+uLu54kNw2ELBrrg1MOihiiAQbOHFz5gi8Hme4Aszf2kC6NS03CHQq+XBWJPAozE
 Fp4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728059789; x=1728664589;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NkIrQblPdREZDLEsszsFCn2NBix9iyMsfxXdICSQWJM=;
 b=Wyw0hwA+LAer2cNFUCj/XGfU08wQZw7OB7Yhp7SH+E1b/YiOhSbl5ls6mLYTAbxrNW
 ExQ6c5Hj30lrvtm1k9egg6Z1C4g75eshYqjnf6mZbEm6Ssf9JX/ZRAQDKJs53ZdlOhNf
 sRDHNk444TUbNT0LR5DIjIhBVGiMtbrTLyPi+vqD0BDaP0BIo0Zi6nZt7uxq3MfmAu3e
 aXx//pY+9oAEBvQbrW6bFagqrBZPZAnflcoK+Aay3P+XK/kIJIZ0PICB/+9OdlYmcpGC
 ++xpn42+/yYlFNn4R2BnIypWlwSVa6U8V4osGsKiOe4Xpl8ubZM82Sgvx32It//TGnHO
 Ms5Q==
X-Gm-Message-State: AOJu0YwcURP7vRlsF7VdQZn+B1RjhrOqx0Zf+Z6J9SSEQcOwtHLUSSPx
 A1vTDuagic4ewA59zRSGG0sPDTXs7/6iik+qlG/T58rhKeef8Jh6VA0LXUyZHMQ=
X-Google-Smtp-Source: AGHT+IFXe3VmMv5EzunM2JXMxyDiLVkssr/VTcquycpTrBjrxYevQ0JVM6YBDEfYkhyEpIO0rZPlKw==
X-Received: by 2002:a05:651c:b0b:b0:2fa:f5f9:4194 with SMTP id
 38308e7fff4ca-2faf5f94416mr23634551fa.27.1728059788500; 
 Fri, 04 Oct 2024 09:36:28 -0700 (PDT)
Received: from localhost.localdomain ([91.223.100.150])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2faf9ac4415sm210841fa.34.2024.10.04.09.36.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 04 Oct 2024 09:36:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 23/25] target/s390x: Use explicit big-endian LD/ST API
Date: Fri,  4 Oct 2024 13:30:39 -0300
Message-ID: <20241004163042.85922-24-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241004163042.85922-1-philmd@linaro.org>
References: <20241004163042.85922-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x22d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

The S390X architecture uses big endianness. Directly use
the big-endian LD/ST API.

Mechanical change using:

  $ end=be; \
    for acc in uw w l q tul; do \
      sed -i -e "s/ld${acc}_p(/ld${acc}_${end}_p(/" \
             -e "s/st${acc}_p(/st${acc}_${end}_p(/" \
        $(git grep -wlE '(ld|st)t?u?[wlq]_p' target/s390x/); \
    done

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/s390x/gdbstub.c | 34 +++++++++++++++++-----------------
 target/s390x/ioinst.c  |  2 +-
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/target/s390x/gdbstub.c b/target/s390x/gdbstub.c
index 9ffec0bccbc..63373f02cef 100644
--- a/target/s390x/gdbstub.c
+++ b/target/s390x/gdbstub.c
@@ -46,7 +46,7 @@ int s390_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
 int s390_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
 {
     CPUS390XState *env = cpu_env(cs);
-    target_ulong tmpl = ldq_p(mem_buf);
+    target_ulong tmpl = ldq_be_p(mem_buf);
 
     switch (n) {
     case S390_PSWM_REGNUM:
@@ -88,7 +88,7 @@ static int cpu_write_ac_reg(CPUState *cs, uint8_t *mem_buf, int n)
 
     switch (n) {
     case S390_A0_REGNUM ... S390_A15_REGNUM:
-        env->aregs[n] = ldl_p(mem_buf);
+        env->aregs[n] = ldl_be_p(mem_buf);
         cpu_synchronize_post_init(env_cpu(env));
         return 4;
     default:
@@ -123,10 +123,10 @@ static int cpu_write_fp_reg(CPUState *cs, uint8_t *mem_buf, int n)
 
     switch (n) {
     case S390_FPC_REGNUM:
-        env->fpc = ldl_p(mem_buf);
+        env->fpc = ldl_be_p(mem_buf);
         return 4;
     case S390_F0_REGNUM ... S390_F15_REGNUM:
-        *get_freg(env, n - S390_F0_REGNUM) = ldq_p(mem_buf);
+        *get_freg(env, n - S390_F0_REGNUM) = ldq_be_p(mem_buf);
         return 8;
     default:
         return 0;
@@ -167,11 +167,11 @@ static int cpu_write_vreg(CPUState *cs, uint8_t *mem_buf, int n)
 
     switch (n) {
     case S390_V0L_REGNUM ... S390_V15L_REGNUM:
-        env->vregs[n][1] = ldq_p(mem_buf + 8);
+        env->vregs[n][1] = ldq_be_p(mem_buf + 8);
         return 8;
     case S390_V16_REGNUM ... S390_V31_REGNUM:
-        env->vregs[n][0] = ldq_p(mem_buf);
-        env->vregs[n][1] = ldq_p(mem_buf + 8);
+        env->vregs[n][0] = ldq_be_p(mem_buf);
+        env->vregs[n][1] = ldq_be_p(mem_buf + 8);
         return 16;
     default:
         return 0;
@@ -203,7 +203,7 @@ static int cpu_write_c_reg(CPUState *cs, uint8_t *mem_buf, int n)
 
     switch (n) {
     case S390_C0_REGNUM ... S390_C15_REGNUM:
-        env->cregs[n] = ldq_p(mem_buf);
+        env->cregs[n] = ldq_be_p(mem_buf);
         if (tcg_enabled()) {
             tlb_flush(env_cpu(env));
         }
@@ -246,19 +246,19 @@ static int cpu_write_virt_reg(CPUState *cs, uint8_t *mem_buf, int n)
 
     switch (n) {
     case S390_VIRT_CKC_REGNUM:
-        env->ckc = ldq_p(mem_buf);
+        env->ckc = ldq_be_p(mem_buf);
         cpu_synchronize_post_init(cs);
         return 8;
     case S390_VIRT_CPUTM_REGNUM:
-        env->cputm = ldq_p(mem_buf);
+        env->cputm = ldq_be_p(mem_buf);
         cpu_synchronize_post_init(cs);
         return 8;
     case S390_VIRT_BEA_REGNUM:
-        env->gbea = ldq_p(mem_buf);
+        env->gbea = ldq_be_p(mem_buf);
         cpu_synchronize_post_init(cs);
         return 8;
     case S390_VIRT_PREFIX_REGNUM:
-        env->psa = ldq_p(mem_buf);
+        env->psa = ldq_be_p(mem_buf);
         cpu_synchronize_post_init(cs);
         return 8;
     default:
@@ -298,19 +298,19 @@ static int cpu_write_virt_kvm_reg(CPUState *cs, uint8_t *mem_buf, int n)
 
     switch (n) {
     case S390_VIRT_KVM_PP_REGNUM:
-        env->pp = ldq_p(mem_buf);
+        env->pp = ldq_be_p(mem_buf);
         cpu_synchronize_post_init(env_cpu(env));
         return 8;
     case S390_VIRT_KVM_PFT_REGNUM:
-        env->pfault_token = ldq_p(mem_buf);
+        env->pfault_token = ldq_be_p(mem_buf);
         cpu_synchronize_post_init(env_cpu(env));
         return 8;
     case S390_VIRT_KVM_PFS_REGNUM:
-        env->pfault_select = ldq_p(mem_buf);
+        env->pfault_select = ldq_be_p(mem_buf);
         cpu_synchronize_post_init(env_cpu(env));
         return 8;
     case S390_VIRT_KVM_PFC_REGNUM:
-        env->pfault_compare = ldq_p(mem_buf);
+        env->pfault_compare = ldq_be_p(mem_buf);
         cpu_synchronize_post_init(env_cpu(env));
         return 8;
     default:
@@ -338,7 +338,7 @@ static int cpu_write_gs_reg(CPUState *cs, uint8_t *mem_buf, int n)
     S390CPU *cpu = S390_CPU(cs);
     CPUS390XState *env = &cpu->env;
 
-    env->gscb[n] = ldq_p(mem_buf);
+    env->gscb[n] = ldq_be_p(mem_buf);
     cpu_synchronize_post_init(env_cpu(env));
     return 8;
 }
diff --git a/target/s390x/ioinst.c b/target/s390x/ioinst.c
index bbe45a497a8..a944f16c254 100644
--- a/target/s390x/ioinst.c
+++ b/target/s390x/ioinst.c
@@ -603,7 +603,7 @@ static int chsc_sei_nt2_have_event(void)
 #define CHSC_SEI_NT2    (1ULL << 61)
 static void ioinst_handle_chsc_sei(ChscReq *req, ChscResp *res)
 {
-    uint64_t selection_mask = ldq_p(&req->param1);
+    uint64_t selection_mask = ldq_be_p(&req->param1);
     uint8_t *res_flags = (uint8_t *)res->data;
     int have_event = 0;
     int have_more = 0;
-- 
2.45.2


