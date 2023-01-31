Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pMu99-0000nq-SE
	for mharc-qemu-riscv@gnu.org; Tue, 31 Jan 2023 12:10:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <geomatsi@gmail.com>)
 id 1pMu95-0000mu-5i; Tue, 31 Jan 2023 12:10:12 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <geomatsi@gmail.com>)
 id 1pMu92-0006By-Oo; Tue, 31 Jan 2023 12:10:10 -0500
Received: by mail-ej1-x62f.google.com with SMTP id me3so43626842ejb.7;
 Tue, 31 Jan 2023 09:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3QpPB5j2/Lw1un26Dww9vvsqU+Ums661g1jLauN9JaQ=;
 b=iPIh/TcPu+Z2eyAo/pn3MR9axm015bx5K4AoxGwMwPfK2WzgSNWc+0vqw0/TsUbM7f
 diqMx0jB1CudBGYr+2DsaHHdaWm50SxcykEm+UzhHsFMEhR5K3Kq1D62V1B7/WTENyYb
 oVKAfIEblt4LS2AM7A2mXpAM74WvmzqcGcGV5tL4w9AGItWNip13+VuVbSaBzDmMNFUq
 rZrXPoBZ4soqwOaLq2mZ9GkO40mW4dy9SBSCyMTMFuVbe9O63NST3rHYQn/shwZFwNGk
 395ZBi9X9JweHopIG0n9JKOpsNxqxvjaDlu+ADNFKeKUG8cHp0F6nu59QGBw3mPROMhT
 ebug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3QpPB5j2/Lw1un26Dww9vvsqU+Ums661g1jLauN9JaQ=;
 b=SsfxGd7g14JA+vAGWhqxX1nXqXLzlxEx1rxYBJ6bTCdixdY7peP81rYSbPhMKCbaaA
 ZhtQp9NSh5+lmRBqYyQAryO/KsUlFUsMQeDpfGhTei7xqecIHEfUjpWHSO43mMgfxEkx
 074dhllfS8HFWBWWKjbs3XaPC5nZtYFlU6J2HP7EUZA6WYrO28NAEvzI2mOEUvY4NtSD
 TB6cIgx45m1Rl2LtcIXkLiQOOlvozMr9JfYMq/kIwIIgCWV8wV7UDx5PRJ94GeXNdXNz
 be8u3vwB1jfBFDhuHHZ0XR+UPKdFdLclIKITiHKT5K2K7PodPXca8anTPVEuhUrLJiN4
 hzuQ==
X-Gm-Message-State: AO0yUKWEIUpD1+EEbj0uu13vjsC7Ao3nfHAchAkYwCDOdQA6GAu+xZ5W
 ZIbzmJh0dP01020gPse5O5Ui40yYB1DVgmv7
X-Google-Smtp-Source: AK7set/hKr869VhUSa13uybFj0Jqv9orBJoTclA78GjpjuFHoG6CPQbVjU9TBYfkFyAuSM9OoOgbWw==
X-Received: by 2002:a17:906:ad87:b0:885:5231:359c with SMTP id
 la7-20020a170906ad8700b008855231359cmr11735951ejb.5.1675185003641; 
 Tue, 31 Jan 2023 09:10:03 -0800 (PST)
Received: from localhost.localdomain ([80.211.22.60])
 by smtp.googlemail.com with ESMTPSA id
 d13-20020a170906344d00b0088385cd6166sm5495806ejb.195.2023.01.31.09.10.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 09:10:02 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Sergey Matyukevich <sergey.matyukevich@syntacore.com>
Subject: [PATCH v2] target/riscv: set tval for triggered watchpoints
Date: Tue, 31 Jan 2023 20:09:55 +0300
Message-Id: <20230131170955.752743-1-geomatsi@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=geomatsi@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 31 Jan 2023 17:10:13 -0000

From: Sergey Matyukevich <sergey.matyukevich@syntacore.com>

According to priviledged spec, if [sm]tval is written with a nonzero
value when a breakpoint exception occurs, then [sm]tval will contain
the faulting virtual address. Set tval to hit address when breakpoint
exception is triggered by hardware watchpoint.

Signed-off-by: Sergey Matyukevich <sergey.matyukevich@syntacore.com>

---

v1 -> v2
- do not set tval blindly for every breakpoint exception,
  handle current specific case under consideration

 target/riscv/cpu_helper.c | 6 ++++++
 target/riscv/debug.c      | 1 -
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 9a28816521..f1a0c65ad3 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -1641,6 +1641,12 @@ void riscv_cpu_do_interrupt(CPUState *cs)
         case RISCV_EXCP_VIRT_INSTRUCTION_FAULT:
             tval = env->bins;
             break;
+        case RISCV_EXCP_BREAKPOINT:
+            if (cs->watchpoint_hit) {
+                tval = cs->watchpoint_hit->hitaddr;
+                cs->watchpoint_hit = NULL;
+            }
+            break;
         default:
             break;
         }
diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index bf4840a6a3..b091293069 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -761,7 +761,6 @@ void riscv_cpu_debug_excp_handler(CPUState *cs)
 
     if (cs->watchpoint_hit) {
         if (cs->watchpoint_hit->flags & BP_CPU) {
-            cs->watchpoint_hit = NULL;
             do_trigger_action(env, DBG_ACTION_BP);
         }
     } else {
-- 
2.39.0


