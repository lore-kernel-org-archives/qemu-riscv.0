Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nkSeM-0005Po-DZ
	for mharc-qemu-riscv@gnu.org; Fri, 29 Apr 2022 11:35:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nkSeI-0005Mq-U1
 for qemu-riscv@nongnu.org; Fri, 29 Apr 2022 11:35:14 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:40573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nkSeF-000841-Fe
 for qemu-riscv@nongnu.org; Fri, 29 Apr 2022 11:35:14 -0400
Received: by mail-pf1-x42c.google.com with SMTP id i24so7209704pfa.7
 for <qemu-riscv@nongnu.org>; Fri, 29 Apr 2022 08:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9Hx4b71G5E1NzAMSl39dnt/1YXU7Pnr/C1/Pv/rP0Xg=;
 b=cojMKx7lyDigbLsFvTrMJ4/Gs+1WihzitlmBHEKX2P1RjzwFio2kCJIG6PaHA4IMzO
 b1h51/4zAT5GbAU/H2J6AqKz7sbrK81uhTscPeNtmylxlKefdX8I5zxDJ7yadiuyx7rv
 MfJbrWI0G/nDpYrzGhbHQ8vk9Q8Qrz1K0mLou6AnLOm1ukIdfxLgP9kRwNW9ahGsBJus
 u9p8/hoOp+PsM0Ic5dX9Okh68mxbLRPYip8nfjhKPBFbJMvnDg6PVMhZqCtBmqsvGLWS
 5Js2ux07SCB1Gml9o6gFvhjJzUUhmsB1iSq+NeLeCjtXlu5T5rwTmYnJf9AxwmngTBQc
 4qmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9Hx4b71G5E1NzAMSl39dnt/1YXU7Pnr/C1/Pv/rP0Xg=;
 b=0sL0D5TkhHDPOmtIEkOYft1BwOejfhZleNY+qexP8KlQ404mm1lm/NZnJW6ii/f7Bl
 CVrQHFq7rzalHz4RVg3I2ccB8EDoQo62Hd3/HXNYx9vBujyn3jzGyFyLVwNAcpRxrxb8
 JZOz2QIAp0zMsYmQXNnR1MaB8SNS83HTuMqdfir2NAa7OLQxVnTFkoHbpWgMVRGcIdfM
 ceXoqfabIXOVPN/uTCxhwM8CmTQo6ZY6jYLYcA3exPzggpBbrlQF/YObk9EhdoxnhC1q
 DAR12wepQlSKMs+vh5EUu9E6DWXjUuJFi65RKyIRny9XhrEIhEC2dGIguYGhrweKPjXF
 3euA==
X-Gm-Message-State: AOAM533SPAvdKnndSusaQqTZAFh2Yf7iFqp0LmcO8gZSWIhm0VNBehQE
 uhULDTJhaWjWsruyYtP1G5vBeg==
X-Google-Smtp-Source: ABdhPJy5gHFDDVsbDg/fOnupLRzHLL+LLkNQKrXSdYqrhl3NIeTYSw10llqcrHr7HUf6+CTmoDZ/jQ==
X-Received: by 2002:a63:e802:0:b0:39e:5503:e800 with SMTP id
 s2-20020a63e802000000b0039e5503e800mr31726787pgh.45.1651246510227; 
 Fri, 29 Apr 2022 08:35:10 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([122.167.97.237])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a65608d000000b003c14af50606sm6439380pgu.30.2022.04.29.08.35.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 08:35:09 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 3/3] target/riscv: Consider priv spec version when generating
 ISA string
Date: Fri, 29 Apr 2022 21:04:31 +0530
Message-Id: <20220429153431.308829-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220429153431.308829-1-apatel@ventanamicro.com>
References: <20220429153431.308829-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=apatel@ventanamicro.com; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Fri, 29 Apr 2022 15:35:15 -0000

Most of the multi-letter extensions (such as Svpbmt, Svnapot, Svinval,
etc) are only available after Priv spec v1.12 so ISA string generation
should check the minimum required priv spec version for all extensions.

Fixes: a775398be2e ("target/riscv: Add isa extenstion strings to the
device tree")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 target/riscv/cpu.c | 36 +++++++++++++++++++-----------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 02ee7d45d8..d8c88b96bc 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -44,6 +44,7 @@ static const char riscv_single_letter_exts[] = "IEMAFDQCPVH";
 struct isa_ext_data {
     const char *name;
     bool enabled;
+    uint32_t min_priv_ver;
 };
 
 const char * const riscv_int_regnames[] = {
@@ -974,7 +975,7 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     device_class_set_props(dc, riscv_cpu_properties);
 }
 
-#define ISA_EDATA_ENTRY(name, prop) {#name, cpu->cfg.prop}
+#define ISA_EDATA_ENTRY(name, prop, priv) {#name, cpu->cfg.prop, priv}
 
 static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
 {
@@ -1000,25 +1001,26 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
      *    extensions by an underscore.
      */
     struct isa_ext_data isa_edata_arr[] = {
-        ISA_EDATA_ENTRY(zfh, ext_zfh),
-        ISA_EDATA_ENTRY(zfhmin, ext_zfhmin),
-        ISA_EDATA_ENTRY(zfinx, ext_zfinx),
-        ISA_EDATA_ENTRY(zhinx, ext_zhinx),
-        ISA_EDATA_ENTRY(zhinxmin, ext_zhinxmin),
-        ISA_EDATA_ENTRY(zdinx, ext_zdinx),
-        ISA_EDATA_ENTRY(zba, ext_zba),
-        ISA_EDATA_ENTRY(zbb, ext_zbb),
-        ISA_EDATA_ENTRY(zbc, ext_zbc),
-        ISA_EDATA_ENTRY(zbs, ext_zbs),
-        ISA_EDATA_ENTRY(zve32f, ext_zve32f),
-        ISA_EDATA_ENTRY(zve64f, ext_zve64f),
-        ISA_EDATA_ENTRY(svinval, ext_svinval),
-        ISA_EDATA_ENTRY(svnapot, ext_svnapot),
-        ISA_EDATA_ENTRY(svpbmt, ext_svpbmt),
+        ISA_EDATA_ENTRY(zfh, ext_zfh, PRIV_VERSION_1_12_0),
+        ISA_EDATA_ENTRY(zfhmin, ext_zfhmin, PRIV_VERSION_1_12_0),
+        ISA_EDATA_ENTRY(zfinx, ext_zfinx, PRIV_VERSION_1_12_0),
+        ISA_EDATA_ENTRY(zhinx, ext_zhinx, PRIV_VERSION_1_12_0),
+        ISA_EDATA_ENTRY(zhinxmin, ext_zhinxmin, PRIV_VERSION_1_12_0),
+        ISA_EDATA_ENTRY(zdinx, ext_zdinx, PRIV_VERSION_1_12_0),
+        ISA_EDATA_ENTRY(zba, ext_zba, PRIV_VERSION_1_12_0),
+        ISA_EDATA_ENTRY(zbb, ext_zbb, PRIV_VERSION_1_12_0),
+        ISA_EDATA_ENTRY(zbc, ext_zbc, PRIV_VERSION_1_12_0),
+        ISA_EDATA_ENTRY(zbs, ext_zbs, PRIV_VERSION_1_12_0),
+        ISA_EDATA_ENTRY(zve32f, ext_zve32f, PRIV_VERSION_1_12_0),
+        ISA_EDATA_ENTRY(zve64f, ext_zve64f, PRIV_VERSION_1_12_0),
+        ISA_EDATA_ENTRY(svinval, ext_svinval, PRIV_VERSION_1_12_0),
+        ISA_EDATA_ENTRY(svnapot, ext_svnapot, PRIV_VERSION_1_12_0),
+        ISA_EDATA_ENTRY(svpbmt, ext_svpbmt, PRIV_VERSION_1_12_0),
     };
 
     for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
-        if (isa_edata_arr[i].enabled) {
+        if (isa_edata_arr[i].enabled &&
+            cpu->env.priv_ver >= isa_edata_arr[i].min_priv_ver) {
             new = g_strconcat(old, "_", isa_edata_arr[i].name, NULL);
             g_free(old);
             old = new;
-- 
2.34.1


