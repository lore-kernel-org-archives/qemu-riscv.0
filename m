Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2DA0CC6B2D
	for <qemu-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 03:20:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xHC0t-0008JJ-Md; Wed, 14 Oct 2026 23:20:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <portias@tenstorrent.com>)
 id 1xHC0D-0007Fk-Nl
 for qemu-riscv@nongnu.org; Wed, 14 Oct 2026 23:19:33 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <portias@tenstorrent.com>)
 id 1xHC0B-0006qd-TZ
 for qemu-riscv@nongnu.org; Wed, 14 Oct 2026 23:19:33 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2e74a32a07fso5213195ad.1
 for <qemu-riscv@nongnu.org>; Wed, 14 Oct 2026 20:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1792034371; x=1792639171; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=04jqFmSmXZGpxWe2Ay1u5AkgLCvCI4RMq9GKToAG5EI=;
 b=ebuQ1APotJQZL7dOoU/zDPoJi5MY0tvHzcxrlkRqD1jLffQ1EmFNmP4Wgd2RS87R4e
 KPTdIWNSUuaxikHfcSuAFYBvSk2xB/kWEa6HYvRbYCMoY+5Rf3xyKNHXo5Hy0yb+kAI/
 5thiXKWJCgPwxcjDXeZyIX5uAwJ6Qmarqp8Wa8+fNRW+fJ0NktfvmJOktz2B+SeBm/+x
 EiibWMMdBRyPKpw8sB8bXUVBiqqnPkiT+Ge98cM9deP5RUdEETcC9kDf5F2M9IdbV5EA
 RaJKDJCM508BxztgPErpqBF2E39eEnOhbZmw/yKHaJ1qk8Hyf6tNWgdJJnas/c7mD8pN
 Z3JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792034371; x=1792639171;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=04jqFmSmXZGpxWe2Ay1u5AkgLCvCI4RMq9GKToAG5EI=;
 b=I2s2bnDKC7uDQmdq/D5sXgVIXbeC+p3Oa2M93GLs8VqhvzhRUEvn/Ygvzmr+ioTVIh
 fJjbajN1aQGmcIlqlxqtVfYmL1r/xKmQ3BaGOYuUgqe0U1ZgzuOMCxBHPXVuWasWpez6
 wlpsDimVHmKSQUXM+gSmZLj2jeB1aW80GrzzJRqpbAy1k2VoINyOz6Xq9A8Y3eM543xP
 5hOiS35TN/S1NVSNwTaqgolDFMjVhni5f7j/1EsJU5w3ycdqB8BFDQ9GOZLxn6ebIaIy
 1aRWfqI4s7nWqkY955qciG4o6QJYQT5R30IIG6Cs7Dvm+nFZ1Xjp2Ij62R5N/9NW00bJ
 jLkA==
X-Forwarded-Encrypted: i=1;
 AKwUvByu1lp1HeV2Bfk734kZ2FAa6bg50yDudY/sKn1tzBoCOrGS77c1sYETL908HDFg44S6zv9Jc44T9mWx@nongnu.org
X-Gm-Message-State: AFq9FYK7CvB1dRRA9GzkNGUVflaeCWR4VZKb6IhA0HHmnYKXZJ1kiUxP
 wK8GfpEuE5QDYTMK7IFWIPIO29MhxKz1DQC1YM5txy4llVB9Z1R9FVf4XmaKu8jfKYQ=
X-Gm-Gg: AYBFou2CXHO0LlUHZn8dA7bGMgvcXjD3MvVV6HWc6Y077ozh2A/RgpwruAwlbsPCRFV
 JOCKotwPP5cGsRwDYK3cckizdgHXGaudKKGC+IT8Ews4fNCcMMk0A2jUvIzfOR3yZhpxz19VyEy
 31jpHajtI/0LLBLKDOML7iCy+BWzM3JqaNXa/rekHDUf/UWal6I1G8a5hgmSvAy7Mny1zH3/6gq
 bKW5jqsHoiakhkr8uf3SECEU9YZWlrarRuXMKjc72M8zoC0jvB3nQAcvB2zvW2AGLc9gIWekmUV
 x4f4siLzHHsWWcIBkWaCdA11bc3XBhsBGc6pxaAy26hXjmsN4Rru8s4vldvR62SFIRgUIee+/AE
 vVvURYGfa/ev/wn/YH7qywgzl2FOw0Hmy5SQX/mwgmxU0KWSats3tPypLDz8kRcQ2lKEBKYdmsE
 Qat9R8F+Tijt7728fGJfZkVU0VDQHW+BJ1Sg3djP97KDkRMbVnKrtdze/GA1rvYOHNdXtSQ8hUI
 7WYwCzZw4eNjbTrpQxzUo/AWxscgBT8kIvhD8ku2V8Zato=
X-Received: by 2002:a17:90a:cf:b0:3ac:77a2:18b1 with SMTP id
 98e67ed59e1d1-3ac77a21d44mr3221716a91.5.1792034370666; 
 Wed, 14 Oct 2026 20:19:30 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([159.196.41.205])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3ac93049ec2sm1321725a91.1.2026.10.14.20.19.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2026 20:19:30 -0700 (PDT)
From: Portia Stephens <portias@oss.tenstorrent.com>
To: qemu-devel@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Chao Liu <chao.liu@processmission.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Portia Stephens <portias@oss.tenstorrent.com>,
 Michael Ellerman <mpe@kernel.org>
Subject: [PATCH 11/12] tests/functional/riscv64: Add rcpu to tt-atlantis tests
Date: Thu, 15 Oct 2026 13:18:03 +1000
Message-ID: <20261015031804.2406055-12-portias@oss.tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015031804.2406055-1-portias@oss.tenstorrent.com>
References: <20261015031804.2406055-1-portias@oss.tenstorrent.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=portias@tenstorrent.com; helo=mail-pl1-x630.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

This updates the tt_atlantis test to test Ascalon boot with the rcpu
enabled and disabled. There is currently no code executing on the rcpu
but this tests that the rcpu model does not break Ascalon boot.

Signed-off-by: Portia Stephens <portias@oss.tenstorrent.com>
---
 tests/functional/riscv64/test_tt_atlantis.py | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tests/functional/riscv64/test_tt_atlantis.py b/tests/functional/riscv64/test_tt_atlantis.py
index 48abd5cd27..ec5d560811 100755
--- a/tests/functional/riscv64/test_tt_atlantis.py
+++ b/tests/functional/riscv64/test_tt_atlantis.py
@@ -22,8 +22,10 @@ class TTAtlantis(LinuxKernelTest):
          'rootfs.ext2.gz'),
         'b6ed95610310b7956f9bf20c4c9c0c05fea647900df441da9dfe767d24e8b28b')
 
-    def do_test_riscv64_tt_atlantis(self, connect_disk):
+    def do_test_riscv64_tt_atlantis(self, connect_disk, rcpu):
         self.set_machine('tt-atlantis')
+        if rcpu:
+            self.machine += ',rcpu=on'
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


