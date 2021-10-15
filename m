Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbHzl-000553-D3
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 03:51:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHzj-0004zy-Rr
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:51:11 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:37405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHzh-0005bC-L6
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:51:11 -0400
Received: by mail-pl1-x62e.google.com with SMTP id n11so5894985plf.4
 for <qemu-riscv@nongnu.org>; Fri, 15 Oct 2021 00:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DgYyTGMImbIPh0kOKBRjaORiNPVnIuiCGa5Q7hnXtPA=;
 b=jbsIsRa5KoYsHvLdVehcAfTpK/r+RopbodQ+Ck2cvboprg/orvVG7+eEgash9vuB7+
 A1Zxula9/kExybtjfLsEzIRhiR6NCJuumbUMnam3/eqNo5bpq8C5FkpfZT2ZjdwDBWrb
 eIlLOKW5wR+eaaMo+Wsw1bgpjxedBDYqpQ8Clifuz9D/FqqrIFP7Vu5mUBhJ2GWmwbIU
 p2yjZIfxrmHNCpoMTj4rGLM4Tu+7b5L8by4z/9dm6AcaZ8PR8Vl9tFiHqZvxqP+Ne5aL
 kpZX10qH7rKMmC9xq/PbEVfLAysP+VpoyHvEC4D/gaDJqsgRx6qufSZV9UD2nQPMjPrf
 m22g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DgYyTGMImbIPh0kOKBRjaORiNPVnIuiCGa5Q7hnXtPA=;
 b=u0msccZl8HEG6TRaXW8otZ1ttazAJokMK+bblUI/cyx6+e+0NHpkUseZayXRiTxhuv
 6x4IMMNmk5Rt74WGX9jqe97VgJD9b5IVHM8BrM9hBG1rBXi9YngCpBkj6K+XxhgKMN46
 lODo3h1640PwptJEyaLfzVdXp8XwZxQpOWwXlRfEPg7xsTdo0u1+buDg9ywLC3PK/MVj
 mRDQe7fOwWcvG/rw6hWm11PcJSVmOLbbZWO/RzQKy3h31mOriotLmfQnBERssw/6Rj1b
 kf+S3TvN9fN2EDzh4bqTzDXqr3UD6w5Qdta6XdgkhW0gy6ukpUYb0jcFqz3x54WaMDeo
 ZMvg==
X-Gm-Message-State: AOAM532pSPcRNUySvFuXCjKRQDg53rehB3TAuKdPuclCUW5u2JWaG2J/
 xEw2rlbnJykPghQjjcJMqo5cHA==
X-Google-Smtp-Source: ABdhPJwlX2hkAqQr41bqnw/BamB4WMKW99SHHTLLuNPlDUibkkxz9j4rUsWztHGcVDNiLuCdinHthw==
X-Received: by 2002:a17:90b:4b07:: with SMTP id
 lx7mr11751779pjb.195.1634284268009; 
 Fri, 15 Oct 2021 00:51:08 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.51.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:51:07 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v8 72/78] target/riscv: set mstatus.SD bit when writing fp CSRs
Date: Fri, 15 Oct 2021 15:46:20 +0800
Message-Id: <20211015074627.3957162-80-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Fri, 15 Oct 2021 07:51:12 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/csr.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 9f51626a3d8..3929abb112a 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -224,7 +224,8 @@ static RISCVException write_fflags(CPURISCVState *env, int csrno,
                                    target_ulong val)
 {
 #if !defined(CONFIG_USER_ONLY)
-    env->mstatus |= MSTATUS_FS;
+    target_ulong sd = riscv_cpu_is_32bit(env) ? MSTATUS32_SD : MSTATUS64_SD;
+    env->mstatus |= MSTATUS_FS | sd;
 #endif
     riscv_cpu_set_fflags(env, val & (FSR_AEXC >> FSR_AEXC_SHIFT));
     return RISCV_EXCP_NONE;
@@ -241,7 +242,8 @@ static RISCVException write_frm(CPURISCVState *env, int csrno,
                                 target_ulong val)
 {
 #if !defined(CONFIG_USER_ONLY)
-    env->mstatus |= MSTATUS_FS;
+    target_ulong sd = riscv_cpu_is_32bit(env) ? MSTATUS32_SD : MSTATUS64_SD;
+    env->mstatus |= MSTATUS_FS | sd;
 #endif
     env->frm = val & (FSR_RD >> FSR_RD_SHIFT);
     return RISCV_EXCP_NONE;
@@ -259,7 +261,8 @@ static RISCVException write_fcsr(CPURISCVState *env, int csrno,
                                  target_ulong val)
 {
 #if !defined(CONFIG_USER_ONLY)
-    env->mstatus |= MSTATUS_FS;
+    target_ulong sd = riscv_cpu_is_32bit(env) ? MSTATUS32_SD : MSTATUS64_SD;
+    env->mstatus |= MSTATUS_FS | sd;
 #endif
     env->frm = (val & FSR_RD) >> FSR_RD_SHIFT;
     riscv_cpu_set_fflags(env, (val & FSR_AEXC) >> FSR_AEXC_SHIFT);
-- 
2.25.1


