Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE992C4332F
	for <qemu-riscv@archiver.kernel.org>; Mon, 30 Oct 2023 05:49:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qxL9G-0002el-TS; Mon, 30 Oct 2023 01:49:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qxL93-0002cm-Jc
 for qemu-riscv@nongnu.org; Mon, 30 Oct 2023 01:49:05 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qxL90-0006wd-Qo
 for qemu-riscv@nongnu.org; Mon, 30 Oct 2023 01:49:00 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-6b77ab73c6fso2825209b3a.1
 for <qemu-riscv@nongnu.org>; Sun, 29 Oct 2023 22:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1698644937; x=1699249737;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WVW58tyZ2tLjevyOdJr7NfNjanDDydhO/lJcVmLZzKs=;
 b=3dSRi8bd2RYVNfrNC42Ck8nt/w4g0AkNEtV9GYbVH3JKdYXGjhzPIGKP5AyDW510+L
 OPbYDaLVjhuH+GDLtcAd+ZtEfFfacO4LWNsqvZxVWKXaC53gegtmfgo7FFanJf5GYfxQ
 NBk1bIsHPdJaK+97Oy+2e2SFqcJPSN1Gf0ugnYRVSMNCSLCLXUks+CLvQUITAEQVIx60
 Ct2maaas8p2Hhj958XrL1eDAR//kikIRSIHHHOh1QAmIEZpuRDUNy7a7P2pIAWkb0x4J
 mHQAtR7N2oME3FFcmdOaR1WZ9h3tuAOSRFEwqZCIi2rJujl6+3SPZGDl7nhJWwkl7zGd
 bzvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698644937; x=1699249737;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WVW58tyZ2tLjevyOdJr7NfNjanDDydhO/lJcVmLZzKs=;
 b=lV5OuXBAqPMvAG0nSSE2Jcwa/oP8F8IDstaJfBo2tU8BkfYqj/NCxgt3izL5oIz6Q0
 x4QqTdVFU0X08zjFRinvXtdKBSea3BfbZCiKGE3Td4Cyb6xqaJUNlXfZzX6AdJVBY4gX
 971rfqkv9BFb3LSG520nE1+q3QvYdsG7srPWtFJT1nnCcdDfy0Fn4MI9namE4m6itevT
 dGyHVkDmTGzhi6ZFo2Y0g2PZTlHy49kzHnLl4XcYCPm6l2g13xsGaF9zMTm+abibBgwS
 RMGMOQ5vaGuVX07nKIPWuMhz3NlkImN4yLj8OKomESvOXCAg+rn7a+m9m+3RD/ZpzRiL
 14Sw==
X-Gm-Message-State: AOJu0YxIEY/w/diCCmg+kwVo+85gHe6vP97FjIpHA2DX+ltUu4zoZm3Z
 DbeYwUJjixwsaaA6/Y0qoHFd9A==
X-Google-Smtp-Source: AGHT+IF36QFnG1ViRJhTkwpt7pjXxr5aHdeVd3h7FdPjGheua9KlOYC9h6PfPvd/vGeU13shWMl7mg==
X-Received: by 2002:a05:6a00:3244:b0:691:27b:15b4 with SMTP id
 bn4-20020a056a00324400b00691027b15b4mr13661138pfb.5.1698644937207; 
 Sun, 29 Oct 2023 22:48:57 -0700 (PDT)
Received: from localhost ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with UTF8SMTPSA id
 fh14-20020a056a00390e00b00689f5940061sm5260241pfb.17.2023.10.29.22.48.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 Oct 2023 22:48:56 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Mikhail Tyutin <m.tyutin@yadro.com>,
 Aleksandr Anenkov <a.anenkov@yadro.com>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, Akihiko Odaki <akihiko.odaki@daynix.com>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 qemu-riscv@nongnu.org
Subject: [PATCH v6 2/5] target/riscv: Remove misa_mxl validation
Date: Mon, 30 Oct 2023 14:46:36 +0900
Message-ID: <20231030054834.39145-3-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231030054834.39145-1-akihiko.odaki@daynix.com>
References: <20231030054834.39145-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::432;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x432.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

It is initialized with a simple assignment and there is little room for
error. In fact, the validation is even more complex.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Acked-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/tcg/tcg-cpu.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index a28918ab30..7f45e42000 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -148,7 +148,7 @@ static void riscv_cpu_validate_misa_priv(CPURISCVState *env, Error **errp)
     }
 }
 
-static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
+static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu)
 {
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cpu);
     CPUClass *cc = CPU_CLASS(mcc);
@@ -168,11 +168,6 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
     default:
         g_assert_not_reached();
     }
-
-    if (env->misa_mxl_max != env->misa_mxl) {
-        error_setg(errp, "misa_mxl_max must be equal to misa_mxl");
-        return;
-    }
 }
 
 static void riscv_cpu_validate_priv_spec(RISCVCPU *cpu, Error **errp)
@@ -573,11 +568,7 @@ static bool tcg_cpu_realize(CPUState *cs, Error **errp)
         return false;
     }
 
-    riscv_cpu_validate_misa_mxl(cpu, &local_err);
-    if (local_err != NULL) {
-        error_propagate(errp, local_err);
-        return false;
-    }
+    riscv_cpu_validate_misa_mxl(cpu);
 
     riscv_cpu_validate_priv_spec(cpu, &local_err);
     if (local_err != NULL) {
-- 
2.42.0


