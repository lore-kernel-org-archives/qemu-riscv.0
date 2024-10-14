Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 153D7D16246
	for <qemu-riscv@archiver.kernel.org>; Mon, 14 Oct 2024 11:25:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1t0JA5-0006cm-G0; Mon, 14 Oct 2024 07:22:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cleger@rivosinc.com>)
 id 1t0JA0-0006bZ-Mg
 for qemu-riscv@nongnu.org; Mon, 14 Oct 2024 07:22:48 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cleger@rivosinc.com>)
 id 1t0J9v-0002e5-PT
 for qemu-riscv@nongnu.org; Mon, 14 Oct 2024 07:22:48 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-37d4a5ecc44so2953405f8f.2
 for <qemu-riscv@nongnu.org>; Mon, 14 Oct 2024 04:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1728904959; x=1729509759;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iLp4r6f6llKlFkIQR3exhrK8GnjMUvUuiR9NnPTHniw=;
 b=WLVCQyOzLmCtAkGRxPuHpOhZujOWR4PvHm0zK3Gd0etwBtnxllwLWn61IRpl1//GVj
 TIQyMGUXOINzHJJ6SFvB9RzO4eP44qmJYiQjIAuSGb+Lx5w7IC0Evcv3hnqiKdVPoDRg
 N7gPM69hLl/SNzz+tiNYozFUBhmqROGglhPIe6Sagp4FaJOdR0n3QuDDe5U4/ATo8ejM
 XKXv0zDNH0T2zufpxzYztia0CugOySGJPoMJ5NGn3fvOuycCQlkFAU5+TBnlB0duS2tD
 aFyl5Z9RKzakDeD4Pv7vNwz5JsecQrQE79jGqU8OBlWWXjTpAtSUj6/K6qfK2P+W+IJ6
 HekA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728904959; x=1729509759;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iLp4r6f6llKlFkIQR3exhrK8GnjMUvUuiR9NnPTHniw=;
 b=RFhGfluNMlQmdhWx5XSNqi6bna6+LaSroG5IQa+ztsiLGEtA2PpTcal4MennlvJ/yY
 j4ceUGNQP0puJG9LKj0oRRltJTXGEYd/jg4Egc1yd93ryANSn13CH4VOecquEfL2nBuf
 xj/aEyT+1LM62vzhTHOqkTTVNjd02MUgHQ4PqGHoPYRX4NFsiBol8zDBcTD0PfXc6Hmh
 Lj1n6tJED8nHb5/9/URRXiwsfcC5GwbZAmTZjzIC2+aGfp52mtDF8k+qC+/TWgAlTml7
 ed4r1m5aNnTA45kybtYxCRnLunbJR017kYle+v8eHNX/RO7urGBS/Hm2vQxY9WTdvryu
 +Zew==
X-Gm-Message-State: AOJu0YxA2Rc74OzrlwogH1oVxlO8b1hUrTvR/cJBNcW0G+QP7kS1dkEN
 3LCMEAR489yOi2qs8hKyxZYXU7az2pBa6vAw3dWxyLmG3bricGcTFqZtDy26PCPlF1ADDoa98LQ
 gWKU=
X-Google-Smtp-Source: AGHT+IGcm4wAoeiVRTAh/v/bSmxcwTVDPXMFZEHIdbI9BOBLCSP4QpJehj9WHmu22Ars0836ai+vkw==
X-Received: by 2002:a5d:4f91:0:b0:37d:45f0:dd08 with SMTP id
 ffacd0b85a97d-37d551aac31mr7285938f8f.11.1728904959344; 
 Mon, 14 Oct 2024 04:22:39 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d4b6bd382sm11117303f8f.43.2024.10.14.04.22.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2024 04:22:38 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Ved Shanbhogue <ved@rivosinc.com>, Atish Patra <atishp@rivosinc.com>,
 qemu-devel@nongnu.org
Subject: [PATCH v3 6/8] target/riscv: Implement Smdbltrp sret,
 mret and mnret behavior
Date: Mon, 14 Oct 2024 13:22:16 +0200
Message-ID: <20241014112225.90297-7-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241014112225.90297-1-cleger@rivosinc.com>
References: <20241014112225.90297-1-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=cleger@rivosinc.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

When the Ssdbltrp extension is enabled, SSTATUS.MDT field is cleared
when executing sret if executed in M-mode. When executing mret/mnret,
SSTATUS.MDT is cleared.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 target/riscv/op_helper.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 00b6f75102..9d0911f697 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -299,6 +299,9 @@ target_ulong helper_sret(CPURISCVState *env)
         }
         mstatus = set_field(mstatus, MSTATUS_SDT, 0);
     }
+    if (riscv_cpu_cfg(env)->ext_smdbltrp && env->priv >= PRV_M) {
+        mstatus = set_field(mstatus, MSTATUS_MDT, 0);
+    }
     if (env->priv_ver >= PRIV_VERSION_1_12_0) {
         mstatus = set_field(mstatus, MSTATUS_MPRV, 0);
     }
@@ -375,6 +378,9 @@ target_ulong helper_mret(CPURISCVState *env)
     if (riscv_cpu_cfg(env)->ext_ssdbltrp) {
         mstatus = ssdbltrp_mxret(env, mstatus, prev_priv, prev_virt);
     }
+    if (riscv_cpu_cfg(env)->ext_smdbltrp) {
+        mstatus = set_field(mstatus, MSTATUS_MDT, 0);
+    }
     if ((env->priv_ver >= PRIV_VERSION_1_12_0) && (prev_priv != PRV_M)) {
         mstatus = set_field(mstatus, MSTATUS_MPRV, 0);
     }
@@ -416,6 +422,12 @@ target_ulong helper_mnret(CPURISCVState *env)
         env->mstatus = ssdbltrp_mxret(env, env->mstatus, prev_priv, prev_virt);
     }
 
+    if (riscv_cpu_cfg(env)->ext_smdbltrp) {
+        if (prev_priv < PRV_M) {
+            env->mstatus = set_field(env->mstatus, MSTATUS_MDT, false);
+        }
+    }
+
     if (riscv_has_ext(env, RVH) && prev_virt) {
         riscv_cpu_swap_hypervisor_regs(env);
     }
-- 
2.45.2


