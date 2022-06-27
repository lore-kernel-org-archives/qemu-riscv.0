Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o5rwb-0005qV-NW
	for mharc-qemu-riscv@gnu.org; Mon, 27 Jun 2022 12:50:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rpathak@ventanamicro.com>)
 id 1o5rwa-0005nh-2U
 for qemu-riscv@nongnu.org; Mon, 27 Jun 2022 12:50:36 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:37489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rpathak@ventanamicro.com>)
 id 1o5rwX-0007vf-T5
 for qemu-riscv@nongnu.org; Mon, 27 Jun 2022 12:50:35 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 w19-20020a17090a8a1300b001ec79064d8dso13063349pjn.2
 for <qemu-riscv@nongnu.org>; Mon, 27 Jun 2022 09:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oOi+DoXNamcchYtk/5LRIx8vypDln25eD4Ti0nz/Yl8=;
 b=NLOy55VT3zBxfqfaKMbsprD2wQ+jVy3ozHsbJ9Os5FgI822hvKNL2sB1NXi9JJy1Fo
 ka5CSs79VWBxDTIqR4dIlhjFMpdlK1jZ3Q3ep5zdaX3Grgw71jT+byEmmr9pktuft/QK
 g8zrG6+G4iWD+YbZrzUjJL0zMqiVMvEtLgtFAG9QmLkIWO9WnZLmdQ+ZU8nk+5FTG06b
 xyvFidTwOFxKb3W8pzSoHtiKFvOpVHS8OIWr7kDKRw5e84sGoGNILgLRHAOMLWLOktIU
 C//XSdjHuK+PVv1MN7U6qijbSpV7PvF6IY2Qj1E4+iCKcFLl+DKfA63i3LW87KFPsBpl
 x25w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oOi+DoXNamcchYtk/5LRIx8vypDln25eD4Ti0nz/Yl8=;
 b=ObwVp35BX4Si6CjHaOTmz3fmcT+1JPpvrLs5XWnsHCzcbc8tugeMIILQ16pHVDJvxt
 euk+dVXEcbFBirB7T2qfgWwpnZHgru/JgVB1ijN13L3Rzligha7++E0bcSfY6SSwpQTQ
 ltQEqQeAhmvM3EKNcoTZv07AvPRAtIzUkymYesKB3Yv6x+jtJ0tSZVTqMG04wu0sMuVA
 2+tvEdJUiHWA7DGMasDqFV/1HYXq2ZvGVnT7PMg4uh/f7EXlcQl9eLwZ+x/SCvXmwKsE
 fxiKaF/vDaQzUDiptCyvdKzNGelv4vNgcsJ7Qo72wYJu31WhhS3fJJd8UPHRPcAHDimU
 av6Q==
X-Gm-Message-State: AJIora88onSKkdWW9vAqxRwF8UytKBRVNTWZwA1e2hhmmgNTTO+IAXef
 lguQrlF8IM/RQiu+pxfHpHInDv9ZDHsV+Q==
X-Google-Smtp-Source: AGRyM1vZu0EueHQYzZnkl1zB3Xxaw/mlI5VHUesyaS6SgNwGV4wvwUMQ7pOc8H4HQs5ulRBFIZpQkA==
X-Received: by 2002:a17:90a:f8d6:b0:1ee:e6b1:d52 with SMTP id
 l22-20020a17090af8d600b001eee6b10d52mr4668278pjd.158.1656348629141; 
 Mon, 27 Jun 2022 09:50:29 -0700 (PDT)
Received: from rpathak-ThinkPad-T490.dc1.ventanamicro.com
 ([2405:201:1010:106f:39d1:78b4:ede5:f50c])
 by smtp.googlemail.com with ESMTPSA id
 21-20020aa79115000000b0050dc7628171sm7508510pfh.75.2022.06.27.09.50.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 09:50:28 -0700 (PDT)
From: Rahul Pathak <rpathak@ventanamicro.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com, bmeng.cn@gmail.com, palmer@dabbelt.com,
 apatel@ventanamicro.com, rpathak@ventanamicro.com,
 rpathakmailbox@gmail.com, victor.colombo@eldorado.org.br
Subject: [PATCH v2] target/riscv: fix user-mode build issue because mhartid
Date: Mon, 27 Jun 2022 22:19:56 +0530
Message-Id: <20220627164956.1516487-1-rpathak@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=rpathak@ventanamicro.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 27 Jun 2022 16:50:36 -0000

mhartid csr is not available in user-mode code path and
user-mode build fails because of its reference in
riscv_cpu_realize function

Commit causing the issue is currently in Alistair's
riscv-to-apply.next branch and need to be squashed there.

Fixes: 7ecee770d40 ("target/riscv: Force disable extensions if priv spec version does not match")

Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
---

Changes in V2:
- remove the stray format specifier
- add the Fixes tag and reference to external tree
---
 target/riscv/cpu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index e4ec05abf4..509923f15e 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -636,9 +636,15 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         if (isa_ext_is_enabled(cpu, &isa_edata_arr[i]) &&
             (env->priv_ver < isa_edata_arr[i].min_version)) {
             isa_ext_update_enabled(cpu, &isa_edata_arr[i], false);
+#ifndef CONFIG_USER_ONLY
             warn_report("disabling %s extension for hart 0x%lx because "
                         "privilege spec version does not match",
                         isa_edata_arr[i].name, (unsigned long)env->mhartid);
+#else
+            warn_report("disabling %s extension for hart because "
+                        "privilege spec version does not match",
+                        isa_edata_arr[i].name);
+#endif
         }
     }
 
-- 
2.34.1


