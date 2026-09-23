Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11503C9830C
	for <qemu-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 13:28:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x9N17-0006ko-96; Wed, 23 Sep 2026 09:28:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x9MwZ-000646-Ok
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 09:23:28 -0400
Received: from mail-dy2-x0f.google.com ([2607:f8b0:4864:36::f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x9MwX-0007wR-2E
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 09:23:26 -0400
Received: by mail-dy2-x0f.google.com with SMTP id
 5a478bee46e88-33c11ef641aso1115607eec.1
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 06:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790169804; x=1790774604; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=F+o5KblLu0GyQgfzLlM1cTvsfq0uChm3NLiJCLhEk08=;
 b=sLJCLmahJaiRDILd0JyyLIr8pr6eAyiytHvSqwzAID+JYDo/UL3NoQ8Y2MxIYxN8v3
 gbeWkPjXD+BlcRqyc61CvsdRePRQmjb66P1CARJF54urPEFjhSSbxX14agJ8sIsDQUQ/
 3uUcJLUM7EZGW5G17BeRXH5c1lHSy5pjwsygoc1NcMONph1jxmWbpSGouwmRcG/PTusW
 tsakrcQOiZnKYYGuFL2+3zv7MQZ5DXZQfINlueLkGim5Tn1F5V5iU5k4SjEbbd7QzfVj
 TPJw+3ySh9tNQk2k0CcMZB1ActwzMq+qfnHMLSNlg1IVfuZ7sdbpzvtca9TaNLkQc2zB
 tXCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790169804; x=1790774604;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=F+o5KblLu0GyQgfzLlM1cTvsfq0uChm3NLiJCLhEk08=;
 b=naluo7ukcWpQoFZBJSAANi8uWZ/jZ1rRoH9o2udc7kracLS2N+ERKF7oPB+gQ7vLoc
 HbT32iHyZYHARQH7shQpssFsTrB05TyLyGqcIscG8JYDB6VmEaqAFM4hztHI4Q8x+Emt
 uDFMQnIrNwXRrd+J0sTuTPn4RMHgCxsSFLaDp60BYp/Ttn8btoZ4Ibav8eK8duHU8Wyc
 1oCx84xn5D78Ud3hxcoKDSZPT2IzXITyHoLZYlWm3eHLCmbYSL5bMC8aCLn6A2AxX8hA
 PyEdBOLi3KtWXh79XRsHnB9CA9AFChtxrcJqnUgdXVuipvWR4kYcrFeKFny6xUf40bIw
 Wt6g==
X-Forwarded-Encrypted: i=1;
 AKwUvByrP/6iZRTjzlG2/kF1KPqHGpdldGLFrDQod2c/sdrUDp84HBrZ1Q1PP6yeK3znOB7nhKpGoTrV9LxZ@nongnu.org
X-Gm-Message-State: AFuF++nlqjEC5gUnosq/epiFu3knyQxvmEmuKPkqpExLhG7Z+ASG8a0X
 QirfmLbNLWXwV6p2LbkIrOzZqgLL28tKrO5Nb/dOh6ndHBaIW6FNIiL+
X-Gm-Gg: AYBFou2ibAc5YufD6YmPmW58fJ+ZeMiQx3ps2ShTkFNhTj4Lu7joCKi7EXk82ud4n8X
 omV7WI3d9q1CyXqWPMkEdzTlKnfD5iwfnYLci024lIkJB+J5nJ66NyHgnAzTxgxvsgHHvEqSUW4
 yYQzgMn4PytvNzzceIVZAJCwyY7XswywQqb+bGYgPFHh3MvxwXOs37d/iTtga60AhylZj02RXqP
 eCiFU3rUgT8s+QmGI19Q5WW2TeGLSh8Io9Kqq8DLCdK3FvH4sMikCCrLTS9xKIzooRBMM8gHFiM
 l47i4OMbmA9vokbMBZWa7MItbxPxyb6rRa2QY4BUNQhPdJSSHEjlUTYi2Xw6gDCTB3eMNk4CRRk
 D7AbN0pYyUzfKceyyqL9vTIpPhWgG3OnVmR1FxucRgXrnrmv2dtRwwuCqPBj72XvIw0VbEYwQjQ
 qIMTjzlcvjdCQxjtdCqAehsD4prTcEbfeE+jGSDVlVrm3ZMuMli8gFas2Lfweo05aaRXoe8HIrw
 OKbs9cZZ4X0qyeI4HECYcCWjdsr1/rGOzpRcItbJg==
X-Received: by 2002:a05:7300:7b27:b0:33b:eec0:eefc with SMTP id
 5a478bee46e88-33e8e88ea29mr2331973eec.40.1790169802984; 
 Wed, 23 Sep 2026 06:23:22 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-33e97236754sm5553695eec.29.2026.09.23.06.23.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 06:23:22 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>, xen-devel@lists.xenproject.org,
 Chao Liu <chao.liu@processmission.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Peter Xu <peterx@redhat.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Fabiano Rosas <farosas@suse.de>, Xianglai Li <lixianglai@loongson.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-ppc@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bibo Mao <maobibo@loongson.cn>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 David Hildenbrand <david@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-riscv@nongnu.org,
 kvm@vger.kernel.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stafford Horne <shorne@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Song Gao <17746591750@163.com>, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Brian Cain <brian.cain@oss.qualcomm.com>
Subject: [PATCH v3 040/114] target/riscv: replace leftover TARGET_LONG_BITS
Date: Wed, 23 Sep 2026 21:15:14 +0800
Message-ID: <20260923131635.1894-41-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260923131635.1894-1-luoyonggang@gmail.com>
References: <20260923131635.1894-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:36::f;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy2-x0f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

- Use target_long_bits() in bitmanip clmul/clmulr/xperm loops and in
  the m128 signed-div overflow check.
- Compare xperm element positions to target_long_bits() instead of
  sizeof(target_ulong), which is always 8 in common-system.
- Leave translate.c and insn_trans TARGET_LONG_BITS for riscv-tcg-tl.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/riscv/tcg/bitmanip_helper.c | 10 +++++-----
 target/riscv/tcg/m128_helper.c     |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/riscv/tcg/bitmanip_helper.c b/target/riscv/tcg/bitmanip_helper.c
index 5af3efe194d..db226146054 100644
--- a/target/riscv/tcg/bitmanip_helper.c
+++ b/target/riscv/tcg/bitmanip_helper.c
@@ -30,7 +30,7 @@ target_ulong HELPER(clmul)(target_ulong rs1, target_ulong rs2)
 {
     target_ulong result = 0;
 
-    for (int i = 0; i < TARGET_LONG_BITS; i++) {
+    for (int i = 0; i < target_long_bits(); i++) {
         if ((rs2 >> i) & 1) {
             result ^= (rs1 << i);
         }
@@ -43,9 +43,9 @@ target_ulong HELPER(clmulr)(target_ulong rs1, target_ulong rs2)
 {
     target_ulong result = 0;
 
-    for (int i = 0; i < TARGET_LONG_BITS; i++) {
+    for (int i = 0; i < target_long_bits(); i++) {
         if ((rs2 >> i) & 1) {
-            result ^= (rs1 >> (TARGET_LONG_BITS - i - 1));
+            result ^= (rs1 >> (target_long_bits() - i - 1));
         }
     }
 
@@ -98,9 +98,9 @@ static inline target_ulong do_xperm(target_ulong rs1, target_ulong rs2,
     target_ulong mask = (1LL << sz) - 1;
     target_ulong pos;
 
-    for (int i = 0; i < TARGET_LONG_BITS; i += sz) {
+    for (int i = 0; i < target_long_bits(); i += sz) {
         pos = ((rs2 >> i) & mask) << sz_log2;
-        if (pos < sizeof(target_ulong) * 8) {
+        if (pos < target_long_bits()) {
             r |= ((rs1 >> pos) & mask) << i;
         }
     }
diff --git a/target/riscv/tcg/m128_helper.c b/target/riscv/tcg/m128_helper.c
index 7d9b83b1b2c..e59a1ffd7a7 100644
--- a/target/riscv/tcg/m128_helper.c
+++ b/target/riscv/tcg/m128_helper.c
@@ -71,7 +71,7 @@ target_ulong HELPER(divs_i128)(CPURISCVState *env,
     if (vl == 0 && vh == 0) { /* Div by zero check */
         ql = ~0x0;
         qh = ~0x0;
-    } else if (uh == (1ULL << (TARGET_LONG_BITS - 1)) && ul == 0 &&
+    } else if (uh == (1ULL << (target_long_bits() - 1)) && ul == 0 &&
                vh == ~0x0 && vl == ~0x0) {
         /* Signed div overflow check (-2**127 / -1) */
         ql = ul;
-- 
2.52.0.windows.1


