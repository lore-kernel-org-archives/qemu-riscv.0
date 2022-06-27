Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o5lEg-0005vs-6C
	for mharc-qemu-riscv@gnu.org; Mon, 27 Jun 2022 05:40:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rpathak@ventanamicro.com>)
 id 1o5lEd-0005vU-MY
 for qemu-riscv@nongnu.org; Mon, 27 Jun 2022 05:40:47 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:37657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rpathak@ventanamicro.com>)
 id 1o5lEa-0005ha-HV
 for qemu-riscv@nongnu.org; Mon, 27 Jun 2022 05:40:45 -0400
Received: by mail-pl1-x635.google.com with SMTP id k14so7691999plh.4
 for <qemu-riscv@nongnu.org>; Mon, 27 Jun 2022 02:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Eoem14HyIKeEgta9L2NWsRLO0Mx5dugcrbGLdCtuEbo=;
 b=BGGVYXxKCoKy1ZUWE44q/laozZapDu+pfGsrUqJH7AuxV0g0FsE2z5xk4C7RUElIo1
 sZqTXRl9Aca/VzvgR4JlTsDq7n+5l0TGxKAQHe8gfeh4dGM3vc2TSCsDS2xgzoD0SrBO
 A31960IPoXv26beQTI1n40gj3AksKpwu5DMS9Y5twV+qcrFH/NJZseWR+Z6fBEq+lDKK
 PRweKaugMTsKExOYcFYi33NHGcIMY35PEjE3fHAis387Imxl7qWke3BeUR0X5C+nwLxj
 IS5XJxdMD/Tcp9QeAYH3Eix6UkCDt0gutUNPmWq59PjfOpDjEtYNVGOYjF9oH5GvMAi6
 5mAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Eoem14HyIKeEgta9L2NWsRLO0Mx5dugcrbGLdCtuEbo=;
 b=s4gYtuo4JmxhpCNuUmJg/D71e7LusE3Z8oT0mjrvmSqlai9rkCPNszo6FFol4YgjZS
 SW819VkgqJwKqtZw/dTJHuLvynFqCiHIHufBwp7A0QnKTO7nLJBVoeiNGO4MbVnxh14T
 VCTndpmxnJIppKXvZ1xzi9sGid/2PMPUH3LPqje1p7C5eu/F+BsRzkm77tHbO7xklLGT
 eDNwXY05LUVXRPNcboJ+scYmGKtJbQdMckce+m2rosrPa2avaxwp5I5qEY6E1bPvpfB2
 XmA7u0NjDoTMxNF4BYxqgKQN6WxzPVGUDxuz2XamAp8yxzlz05FspOmGxx2spqi6MnZQ
 XmRw==
X-Gm-Message-State: AJIora9oXjbIFQi/z33mKi7k4vix9vtOR8Ib+IsGcBB/fcDH9PRPejJ+
 xs9HdPbIyArQlMyANsxx78vjb6jdEnCaWg==
X-Google-Smtp-Source: AGRyM1tTVFpxUss4T8NZ/gdUTyFCz3etYEM853Jx1xpgrPSJMHqvZBAk1eamcc0cEpjX3uGkGHw8XQ==
X-Received: by 2002:a17:90a:4944:b0:1ec:7585:3167 with SMTP id
 c62-20020a17090a494400b001ec75853167mr14448909pjh.35.1656322842437; 
 Mon, 27 Jun 2022 02:40:42 -0700 (PDT)
Received: from rpathak-ThinkPad-T490.dc1.ventanamicro.com
 ([2405:201:1010:106f:39d1:78b4:ede5:f50c])
 by smtp.googlemail.com with ESMTPSA id
 c12-20020a624e0c000000b005258df61ceesm4183667pfb.90.2022.06.27.02.40.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 02:40:41 -0700 (PDT)
From: Rahul Pathak <rpathak@ventanamicro.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com, bmeng.cn@gmail.com, palmer@dabbelt.com,
 apatel@ventanamicro.com, rpathak@ventanamicro.com, rpathakmailbox@gmail.com
Subject: [PATCH] target/riscv: fix user-mode build issue because mhartid
Date: Mon, 27 Jun 2022 15:10:29 +0530
Message-Id: <20220627094029.1379700-1-rpathak@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=rpathak@ventanamicro.com; helo=mail-pl1-x635.google.com
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
X-List-Received-Date: Mon, 27 Jun 2022 09:40:48 -0000

mhartid csr is not available in user-mode code path and
user-mode build fails because of its reference in
riscv_cpu_realize function

Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
---
 target/riscv/cpu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 0a794ef622..03f23d4b6d 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -643,9 +643,15 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         if (isa_ext_is_enabled(cpu, &isa_edata_arr[i]) &&
             (env->priv_ver < isa_edata_arr[i].min_version)) {
             isa_ext_update_enabled(cpu, &isa_edata_arr[i], false);
+#ifndef CONFIG_USER_ONLY
             warn_report("disabling %s extension for hart 0x%lx because "
                         "privilege spec version does not match",
                         isa_edata_arr[i].name, (unsigned long)env->mhartid);
+#else
+            warn_report("disabling %s extension for hart 0x%lx because "
+                        "privilege spec version does not match",
+                        isa_edata_arr[i].name);
+#endif
         }
     }
 
-- 
2.34.1


