Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j8vkq-0002WN-B0
	for mharc-qemu-riscv@gnu.org; Mon, 02 Mar 2020 19:49:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44860)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1j8vkH-00015y-8g
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1j8vkG-0004BW-AX
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:13 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:34194)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1j8vkG-0004Ag-53
 for qemu-riscv@nongnu.org; Mon, 02 Mar 2020 19:49:12 -0500
Received: by mail-pf1-x432.google.com with SMTP id y21so570027pfp.1
 for <qemu-riscv@nongnu.org>; Mon, 02 Mar 2020 16:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=ki3pTa3uJKP5VQhwlko+f1zWD5CRp2+R1vu8jGx8azs=;
 b=QyTHNCCKT05mcm6TzRR9XWYESyOBXRd2L+rD5+vkZ4q7hxzo/k0UrUJgZSPwx72yI2
 RKshVwU5eFdpUyoKXt/4Jj6CHFPRJUr6NHpt/uwfoxLDXzvp8f6O7gim5+utb3LoZ8IM
 Hp0VWj+p/GzArT73sK7YeJViLQEB7PjWK5N+f09uym13IFHlTez66eZ7wo8I7/GeKlOh
 jvChWJDBMuAanHPi8xQ87hYW+xcE2/jQmgC6N7/VBCPT2Lbs/5qk5x1o8IVCJOKweeGH
 Awt9ykQ9vLr1RqOfzTg4tiqFZpFBFQu/xDAkoy/bemQXBQpbz7hb1aNyG/Fwc6AlrpiK
 7iuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=ki3pTa3uJKP5VQhwlko+f1zWD5CRp2+R1vu8jGx8azs=;
 b=bvoaHLV6X4Mns11kAmnKPdcexG1+T1ANgqKql9l6NKOrnQIsLq9HpbhJ1kmURpO8mz
 Bu4ZLS++rA5xi1ypW4SNhoaFcTAAsMOKu1sp5k+RBu4DC2wDcXV0Zp6tVBje05IB0mFU
 CIEFrp0XA3rYuxEQgJIuBOreU9da7CmhmqMAaJvb8Yxflmi2eLfuqJvHJM/sJJqA/12s
 Ub93TZIqBOxnYnsDCuPZPyeU8I4BeFUIM7qDx0HuWND+Mrp03NH1I4jgiYoT/aZuXaGo
 aQnkmVdBOnEN8hkFlkhN9F6sVWxf5DoNfwkxH1vJ3N6FGWdtPog8jsr+yxt1O1lch9ZR
 xJ0w==
X-Gm-Message-State: ANhLgQ1dIjzGx1JfW5ZG3yOK3qIDWKBLrMZN9aB39qAJsjQTzjNq3nrY
 ZfyrIgEVPff1EOIlclo4koJPDSI3namH7A==
X-Google-Smtp-Source: ADFU+vt9OamwOojLlilWmVCv1UfJZ0QjEEQR5Y18BXAFONXyRetjbKhjpBQv+K0AOpHVFwz1SmWz9w==
X-Received: by 2002:a62:8301:: with SMTP id h1mr1641003pfe.146.1583196550656; 
 Mon, 02 Mar 2020 16:49:10 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:23a5:d584:6a92:3e3c])
 by smtp.gmail.com with ESMTPSA id 128sm8677325pfe.163.2020.03.02.16.49.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 16:49:10 -0800 (PST)
Subject: [PULL 08/38] target/riscv: Fix CSR perm checking for HS mode
Date: Mon,  2 Mar 2020 16:48:18 -0800
Message-Id: <20200303004848.136788-9-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
In-Reply-To: <20200303004848.136788-1-palmerdabbelt@google.com>
References: <20200303004848.136788-1-palmerdabbelt@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::432
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
X-List-Received-Date: Tue, 03 Mar 2020 00:49:14 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Update the CSR permission checking to work correctly when we are in
HS-mode.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 target/riscv/csr.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index ca27359c7e..c63b2f980c 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -801,12 +801,22 @@ int riscv_csrrw(CPURISCVState *env, int csrno, target_ulong *ret_value,
 
     /* check privileges and return -1 if check fails */
 #if !defined(CONFIG_USER_ONLY)
-    int csr_priv = get_field(csrno, 0x300);
+    int effective_priv = env->priv;
     int read_only = get_field(csrno, 0xC00) == 3;
-    if ((!env->debugger) && (env->priv < csr_priv)) {
-        return -1;
+
+    if (riscv_has_ext(env, RVH) &&
+        env->priv == PRV_S &&
+        !riscv_cpu_virt_enabled(env)) {
+        /*
+         * We are in S mode without virtualisation, therefore we are in HS Mode.
+         * Add 1 to the effective privledge level to allow us to access the
+         * Hypervisor CSRs.
+         */
+        effective_priv++;
     }
-    if (write_mask && read_only) {
+
+    if ((write_mask && read_only) ||
+        (!env->debugger && (effective_priv < get_field(csrno, 0x300)))) {
         return -1;
     }
 #endif
-- 
2.25.0.265.gbab2e86ba0-goog


