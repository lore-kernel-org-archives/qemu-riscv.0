Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6DB6076086
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 19:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=bjhizAdH
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xOgtC-0002rJ-Nk; Wed, 04 Nov 2026 14:43:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1xOgt2-0002hS-Qr
 for qemu-riscv@nongnu.org; Wed, 04 Nov 2026 14:43:09 -0500
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1xOgt1-0002TX-76
 for qemu-riscv@nongnu.org; Wed, 04 Nov 2026 14:43:08 -0500
Received: by mail-dl1-x122d.google.com with SMTP id
 a92af1059eb24-15dd124bbe7so2220263c88.1
 for <qemu-riscv@nongnu.org>; Wed, 04 Nov 2026 11:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1793821384; x=1794426184; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=g5iHJKabwd8CSEpwPPxasBgAO9oJcHNxbYgWfk//OP8=;
 b=bjhizAdHnpSMi6zGYlif4gksld/F8BDwD2l2n3kmXp9AEsjt9VpboM8wOgqZnmKKvY
 n3ASjoCgfOaL+4BLGOE3ZE9wZK+JwADEu9oWj0IrGZwuRmRn/QFAOtBfMLbit0RTh4Pb
 YY44z0nJRamzUI03tms1xnxrcaEzfFpCcnCjGLWHMsaGejdt9ZBWuQOnKMqYxe5xeVQ4
 stygyncMCtpXt6ZoBCSxAeNsLGXoIxzXY84tUfmM6r5bMBPiHenNA0h7xtY7zQRs9PVc
 oSVrJ3aXb+5aQ6fEyYB1/o9EWUOsMU8mXbaujRScSqVIKJW0IWmt238Nt52fK9U2+I7/
 dSyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793821384; x=1794426184;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=g5iHJKabwd8CSEpwPPxasBgAO9oJcHNxbYgWfk//OP8=;
 b=pd9+cKUCVnhvtFMXaM4J8dxo2ARc1GC9+xxVCKr/QTrr+O6qKP1Br/oUiR/f7GtYw0
 9UVT7GtgZ4iXXYVXRo2BKoSKpNjyB/ddyOIWaQKn2TKc/zXdUG+fj0rFSi+1Sxgkc6Zs
 3lEWK8n6KbTGM+U21hs3zPL+m+/VNcoggOQuE1yAUn3T0baa91kMQgOOHI1fVmAtykYS
 P8D5vTWeegdl0dXR78+wvAtrtlWT9t3yfloeE+AEOWV6QkPkxnU+XWb9quYtA8Cj7EYa
 90XWkEHdFLU03K0qIv4V64vz6rWBa+pJ5Evr/nq+QdWhPmddTCqGeGolF47xna69XAOm
 iYYg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzHRyopbATgpsYjJH4B6iTqW/J2+clHF8LUV9sm0TTTpMukFHT9NCdgbyOh3aMvq+Q2hBnf3grgWqx8@nongnu.org
X-Gm-Message-State: APuU4Z9u1c6SJp4NSOgY/3Gfr03ns2OsAW/AkLeltqpjLn9io981cgMB
 lG5x7zGL/xYdKkECfyN5+VSrQ8op0YAVgzsFFFlMUMoAZiGqFuwv7KdmYtjHPMQcv3g=
X-Gm-Gg: AYBFou09JRknE0ezrR7K2cEZ0wrpVp82LYAHXxk+4fiHFrAbs7xFzDY22nkWkvf2IUh
 BT/JP21in7Xar8cA9qO00S8heYPfbPVMPe+FLAcydKhDRWo0HMO76RiPQs93spWiD6Nu5HD9mds
 JAd/B3BahliHFfI/g6DoK14QIcBRNU+IoOICJ1Rn8aRj7grtbnCzXYJWhnk1QUj+I3zNjdaXtiR
 Xg2YEFR+R0t0+Ij0MkvZfPlQZmUG0zJVPdxaY85moS7vCD+7ruQRHfJet1iQlYQvHPTVRdIgrLD
 yp42jEeSdmb/OAzIfn5wn7L8iAnEP4DqYF0IluKpjcZdN3a5Ai395quvjQSJCbGXX8vehzlfKsb
 jCGrvk0BdKoK3/RAqZmPl+yIOGvL1nLtuG3P0awF0Ed83lsKVbHVrTR6cE9nIDyqDjLAYa4dmIJ
 ZhsmAKFZ3eflrha+ptR2ofMzZJPcB0XjGweVIS77IfU8MnFCNPOfK57a9KjMDQVSwzVtLk66Wb9
 2MogPX1ar8LQumT/ry8ub5qbPRLnPDDGxFXl1VUZHkRAo4JcEOyMnuPxiJoVYNtzVWeyXS4q/yE
 a6m2HbtEHVEKku89eig+z3mrH2lKQs7v7K8+RCimm/BYnqOLSXb9gvEZHM8g8CkBVi594syfZ4t
 AHCSkFv/11/GyQXM4QiPFbntmPJrUiHVR1GiyoWyx2sgEQQawQw==
X-Received: by 2002:a05:7022:3f04:b0:16b:fdbf:4a9c with SMTP id
 a92af1059eb24-1ac5ac4cd7emr26749601c88.23.1793821384079; 
 Wed, 04 Nov 2026 11:43:04 -0800 (PST)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36ca38d36a1sm11299527eec.12.2026.11.04.11.43.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 11:43:03 -0800 (PST)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, Max Chou <max.chou@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [RFC PATCH 16/38] target/riscv: Add implied rules for Zvfqwdota8f
 extension
Date: Thu,  5 Nov 2026 03:41:31 +0800
Message-ID: <20261104194155.679241-17-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104194155.679241-1-max.chou@sifive.com>
References: <20261104194155.679241-1-max.chou@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::122d;
 envelope-from=max.chou@sifive.com; helo=mail-dl1-x122d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add implied rules to enable the implied extensions of Zvfqwdota8f
extension recursively.

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/cpu.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 4f2e7a8faa9..6c09685bd4b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -2875,6 +2875,15 @@ static RISCVCPUImpliedExtsRule ZVQWDOTA8I_IMPLIED = {
     },
 };
 
+static RISCVCPUImpliedExtsRule ZVFQWDOTA8F_IMPLIED = {
+    .ext = CPU_CFG_OFFSET(ext_zvfqwdota8f),
+    .implied_multi_exts = {
+        CPU_CFG_OFFSET(ext_zve32f),
+
+        RISCV_IMPLIED_EXTS_RULE_END
+    },
+};
+
 static RISCVCPUImpliedExtsRule ZVFWDOTA16BF_IMPLIED = {
     .ext = CPU_CFG_OFFSET(ext_zvfwdota16bf),
     .implied_multi_exts = {
@@ -3081,6 +3090,7 @@ RISCVCPUImpliedExtsRule *riscv_multi_ext_implied_rules[] = {
     &ZVFBFWMA_IMPLIED,
     &ZVFH_IMPLIED,
     &ZVFHMIN_IMPLIED,
+    &ZVFQWDOTA8F_IMPLIED,
     &ZVFWDOTA16BF_IMPLIED,
     &ZVKN_IMPLIED,
     &ZVKNC_IMPLIED,
-- 
2.56.0


