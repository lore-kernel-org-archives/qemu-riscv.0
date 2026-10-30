Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6FC606A31A
	for <qemu-riscv@archiver.kernel.org>; Fri, 30 Oct 2026 04:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=cOe7V7AO
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xMdsq-0002VK-HW; Fri, 30 Oct 2026 00:06:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <portias@tenstorrent.com>)
 id 1xMdse-0002Nb-DP
 for qemu-riscv@nongnu.org; Fri, 30 Oct 2026 00:06:18 -0400
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <portias@tenstorrent.com>)
 id 1xMdsb-0004qh-Cj
 for qemu-riscv@nongnu.org; Fri, 30 Oct 2026 00:06:15 -0400
Received: by mail-dy1-x1334.google.com with SMTP id
 5a478bee46e88-36a0eecf73fso63923eec.3
 for <qemu-riscv@nongnu.org>; Thu, 29 Oct 2026 21:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1793333172; x=1793937972; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=AELHiQVuS8sMWiSCO4SoXVSgjVkl2maGXmVrCr1lfb0=;
 b=cOe7V7AOvoF9pbejfB+NiAPEuiwvJ61VVJbOe+SeyUi6efTpcUWjx5QpJIsAVNVih0
 oaLljw+DmY2Sx5y//sYUVAlNLSyS08GxjxOa1ix8IQ+vXZQQz4iPFQDUoz6lA2xLh6Z1
 zSVEVa2DC+i/nCHmFf4HH1XFk0WCKeLYTB15dfrvIdS0wh8XN5y2KIpbbBHBg9uo2r78
 VI9Y5255rJtkpzN9qu8pmAqB1WUPTD3diVbS0DggJhRu4PJLq18sJrbum26WaPNyyrxE
 1qzBLmBCoS4bW5/nNGh1opgoMz5M1kKo9ZS6vB2Z1nSClu8YrHs1IsdQZvH036TUW2i/
 6ciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793333172; x=1793937972;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=AELHiQVuS8sMWiSCO4SoXVSgjVkl2maGXmVrCr1lfb0=;
 b=1Rag2nGQXiwePqThfHWUT923oo9YY3L/r5ywrChLC5LOEHndeDDCxSVT8OA+eQ8Cix
 JfHQchy2BDdG9UHaGPBsbc1FQt71TQY4ZcWApwa/EkQiXZ+M6ZvMMqIiVJXzIaX6b7hK
 KIrVBZu0BkObHMxXfWWa8CR/j7qQa+c+d0g4d+Cark/eCsS3dk56YZNL9uj5rJsCe+Qf
 LSpY7GnPcGsKPdHJ0P5/AoG+GHMJ59Q7dvmbdzvdCQx1ZpTRB6y2Vs1DD11uIsF2zk0T
 4XeoeO5+qgQ4QYql7bX13WVZshmHWg6hkQLZopayzKIvBJSBV/lFEDfR7G2+Vv63g1El
 tHpA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzXzLZnLdalw7s4C0iB5P8CYmartdRrxumKFT0r8ZWQ5g3GpaS3krI+XNI1/uONYeS4WekqOzY8o7ZV@nongnu.org
X-Gm-Message-State: AFq9FYLid6ner6LI8MggcMU15R4fi/t2LsswVqpABVmXCQNRIkgLEX+o
 cyDafBItZX2vOpfSN1MsRoLRZ4YwvwqbU1wyBD/yQqMpC1cDKV2oDgeVoTs6UL8mlGM=
X-Gm-Gg: AYBFou3w0TYMs6aM2hfy9w2DZV5SNIIZLwCErBYQ9/PdouE5CkhwVLD6+YiE6N30VlV
 4Nw0ow52p7iiTFkg0wi85DfKJdsLFBJRrtYD0fwM7L/SM6CLqQFw3Eqvj6RyO0K0iQTrds6XetT
 ZEjQUPMsl8wLSzKmn5FhSsoUmNL8/8iqq7oNfu5ZaK9Ew1gYN/nJO0jVQGgB/KGEpjjpCnfCKpv
 B/X5LWyfe9Utp/PGcR0+5awdrw0KY627kiXPVD6Pf2+ABYU6LWtRT/EewbJV9FLNetmMl2W815r
 DJZVwXuzhZfsjzomD2kE3DQEkmKZ8Wq/IK3/GvFb/rcQKTM7TES8VRiLrkfPaKL0X42ueuTNUrI
 r407VksN00d85J10kVjm1lUMlBcaJ27xx9PNJn/j1dUS++0dtVmyiIOtXlbWIRhRLHU4bjndp6V
 F7Chgh7yyw4FS/BcDY+btepUbYnidpRqLbmUlIp6xsvZLnRE+9zvuBk88U1MDliGnAlpGil1DhY
 pjJED0rYvYx4REJ2inmGaBKwVckYh0BCULe5Ecf7X+SQuWZefXCmQ1BG2VYveogWOvnix6gjXb8
 lGZDbJboYpiTvSN/f77VnEBGQMPVS2a6W85LFBRHoQ/z2TW3ue2O5xPQMlm6VTUCTA2NZm6DnLr
 kNw==
X-Received: by 2002:a05:7301:fa6:b0:369:f195:a5ff with SMTP id
 5a478bee46e88-36a4231f8e3mr3016075eec.1.1793333171843; 
 Thu, 29 Oct 2026 21:06:11 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([159.196.41.205])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36a428af1easm2957687eec.5.2026.10.29.21.06.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2026 21:06:11 -0700 (PDT)
From: Portia Stephens <portias@oss.tenstorrent.com>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org,
 Michael Ellerman <mpe@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Zhao Liu <zhao1.liu@intel.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Joel Stanley <joel@jms.id.au>,
 Portia Stephens <portias@oss.tenstorrent.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH v3 8/9] tests/functional/riscv64: Add rcpu to tt-atlantis tests
Date: Fri, 30 Oct 2026 14:05:14 +1000
Message-ID: <20261030040516.853444-9-portias@oss.tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030040516.853444-1-portias@oss.tenstorrent.com>
References: <20261030040516.853444-1-portias@oss.tenstorrent.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1334;
 envelope-from=portias@tenstorrent.com; helo=mail-dy1-x1334.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This updates the tt_atlantis test to test Ascalon boot with the rcpu
enabled and disabled. There is currently no code executing on the rcpu
but this tests that the rcpu model does not break Ascalon boot.

Signed-off-by: Portia Stephens <portias@oss.tenstorrent.com>
---
 tests/functional/riscv64/test_tt_atlantis.py | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tests/functional/riscv64/test_tt_atlantis.py b/tests/functional/riscv64/test_tt_atlantis.py
index 48abd5cd27..940ddfd895 100755
--- a/tests/functional/riscv64/test_tt_atlantis.py
+++ b/tests/functional/riscv64/test_tt_atlantis.py
@@ -22,8 +22,10 @@ class TTAtlantis(LinuxKernelTest):
          'rootfs.ext2.gz'),
         'b6ed95610310b7956f9bf20c4c9c0c05fea647900df441da9dfe767d24e8b28b')
 
-    def do_test_riscv64_tt_atlantis(self, connect_disk):
+    def do_test_riscv64_tt_atlantis(self, connect_disk, rcpu):
         self.set_machine('tt-atlantis')
+        if not rcpu:
+            self.machine += ',rcpu=off'
         kernel_path = self.ASSET_KERNEL.fetch()
         rootfs_path = self.uncompress(self.ASSET_ROOTFS)
 
@@ -48,9 +50,13 @@ def do_test_riscv64_tt_atlantis(self, connect_disk):
         self.vm.launch()
         self.wait_for_console_pattern(pattern)
 
+    def test_riscv64_tt_atlantis_rcpu(self):
+        # test with the rcpu enabled
+        self.do_test_riscv64_tt_atlantis(False, True)
+
     def test_riscv64_tt_atlantis(self):
         # tt-atlantis machine has no PCI host yet, so no disk
-        self.do_test_riscv64_tt_atlantis(False)
+        self.do_test_riscv64_tt_atlantis(False, False)
 
 
 if __name__ == '__main__':
-- 
2.43.0


