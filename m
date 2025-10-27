Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CDA7CCF9E0
	for <qemu-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 11:07:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vDL21-00014W-0j; Mon, 27 Oct 2025 07:04:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vDL1Z-0000gy-3j
 for qemu-riscv@nongnu.org; Mon, 27 Oct 2025 07:04:30 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vDL1I-0005b5-Nh
 for qemu-riscv@nongnu.org; Mon, 27 Oct 2025 07:04:22 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-63c0eb94ac3so7997589a12.2
 for <qemu-riscv@nongnu.org>; Mon, 27 Oct 2025 04:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761563028; x=1762167828; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XBaCUU+RDMe8Fm+rMDPlvgrTnuTfYc8fUoPcpfBGUms=;
 b=ZDl8/9Qt7Y+doaQTj+12ng6xydqfPt/krMdiLGH2c8sRHW2/MR1d6UTHR+Cw1U3zgs
 ytFzHernRvt56Q1+3L4GfLVrV+biOnyJc+IDJ0e+Vus4wl5nKcCmgkph6qq5cZk8Za0x
 QJ7rIe9MUw9sR3hKbh+Recs+jIu3lkRmixHU6n/XGgg0kMMAIIrc+khWrC+Je3dKfVVy
 Xm/0NKmCoQB4WRDxMtPJtRfAoyJCXE7o0c32zfGTXJVUKnBuDOvwyebuAwPubIwOHWoa
 hcsAaA3Ca4oYkmqryKkUVk1LMnw7+5xnyJscPWQRUHplnSTox51jdVGmyILpRUUzFY6D
 vw5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761563028; x=1762167828;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XBaCUU+RDMe8Fm+rMDPlvgrTnuTfYc8fUoPcpfBGUms=;
 b=kFjM04XOhwSFR8bUST9xSAAFyCrNQAZtm2H++N6d2lhzoFINhxOYMZP0ZncBQp9p+j
 mnxrtk5SQ4gsVFpI7q6xXaQn0Cf0XTDXVg9GPJ6C859/+Vmu+S8Kgo+DHaydhyFZ0xJx
 wfua9kteYEEjVOVbh9JMfBDggpiVJF2GacRZQolBPqXzNY6Ohqabnj+R15FGV24d0Zkw
 0T46M5tRPu3OegBuDj4fKHJUgfcRht1UAI+/f/Qs68wZHZxiKUpo/eWWwMzPwbEGNbO8
 9aUf7oHiAlqgnvtJwJlIIH3J7Soe9V5Nn7QS/1AAmVjLEJ1tG+1JCcg5t9SEIC4mjWrk
 vLMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkrqNShJBb3WNqaGy9EelxZD5GUk2zJgfCdOACm+wnaBplUzVwS/G1dHYelXsAx602Z2Vc0VxkxKe5@nongnu.org
X-Gm-Message-State: AOJu0YywY0pPg/1mQ0aHJCe6aLcS2wtgkGrhybvDIDz0ikVajAMcwgMg
 qCw/40545uW4NNv50atW7z36LC/XCBR2eO23Jcq9RRcYwtOyodWC33X6YkGQxdpDbos=
X-Gm-Gg: ASbGncsbxBn+b8mOwQ3flArMEiDpoDZHSucK4D+Hgp5O3itA9nC1NaWIR2BOOduHqwN
 7CIE0+Me6mDdqagmg4sn/+jhB9aQwUP6i/evvLf3Xy+YnVzZ3oI+FKvaeiQeZp50qqVDNN7obC8
 KGQQMeExKFmSJ8sUACfsFfyGp3XGQW/DFNy0bl6ISLk7kgohnNrdLPFrNmVhCY5kZQtPnubYhUc
 c9lKxUIJldzmjSgTTnr8tA6VBQ9l9MxlORMZR3nAuPy+oRSzRlZsqoCHvsDXNzz3D6L2ejgwgP4
 pSByrOqkuVmrRUOGgwaHaJWaHucODZyMjXbd2EQvUSBvBN2p8VXDyYmUmvCI8EszEiXx+w7pi/u
 7skjtDl1s3mRJJTwxI7w42FyJNi10m/zRZlgWrk51G9oxjK7y48IJ6YLlScvrPkrJ8Ti/7Fhfsq
 Ph4I6ffB43rnY=
X-Google-Smtp-Source: AGHT+IFkfptHR6PlFDi2agbOhG8NdwOZDW+TmaYBSdpTlkdykfX5dwUJ7HJhZgUkUyvlt6G3flbptw==
X-Received: by 2002:a50:c88b:0:b0:63c:ea6:5608 with SMTP id
 4fb4d7f45d1cf-63c1f6dfc77mr24049039a12.36.1761563027728; 
 Mon, 27 Oct 2025 04:03:47 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63e7efb97cbsm6176732a12.26.2025.10.27.04.03.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 04:03:45 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 62C4F5F92F;
 Mon, 27 Oct 2025 11:03:44 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Chinmay Rath <rathc@linux.ibm.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stafford Horne <shorne@gmail.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Laurent Vivier <laurent@vivier.eu>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Michael Rolnik <mrolnik@gmail.com>,
 Song Gao <gaosong@loongson.cn>, qemu-riscv@nongnu.org,
 Aleksandar Rikalo <arikalo@gmail.com>
Subject: [PATCH 03/35] scripts/ci: move build-environment.yaml up a level
Date: Mon, 27 Oct 2025 11:03:10 +0000
Message-ID: <20251027110344.2289945-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251027110344.2289945-1-alex.bennee@linaro.org>
References: <20251027110344.2289945-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52e.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

We can share the setup of the build environment with multiple
operating systems as we just need to check the YAML for each env is
present in the directory structure.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .../ci/setup/{ubuntu => }/build-environment.yml  | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)
 rename scripts/ci/setup/{ubuntu => }/build-environment.yml (81%)

diff --git a/scripts/ci/setup/ubuntu/build-environment.yml b/scripts/ci/setup/build-environment.yml
similarity index 81%
rename from scripts/ci/setup/ubuntu/build-environment.yml
rename to scripts/ci/setup/build-environment.yml
index 1c517c74f74..66bde188755 100644
--- a/scripts/ci/setup/ubuntu/build-environment.yml
+++ b/scripts/ci/setup/build-environment.yml
@@ -27,18 +27,24 @@
         - ansible_facts['distribution'] == 'Ubuntu'
 
     # the package lists are updated by "make lcitool-refresh"
-    - name: Include package lists based on OS and architecture
-      include_vars:
-        file: "ubuntu-2404-{{ ansible_facts['architecture'] }}.yaml"
+    - name: Define package list file path
+      set_fact:
+        package_file: "ubuntu/ubuntu-2404-{{ ansible_facts['architecture'] }}.yaml"
       when:
         - ansible_facts['distribution'] == 'Ubuntu'
         - ansible_facts['distribution_version'] == '24.04'
 
+    - name: Include package lists based on OS and architecture
+      include_vars:
+        file: "{{ package_file }}"
+      when:
+        - package_file is exists
+
     - name: Install packages for QEMU on Ubuntu 24.04
       package:
         name: "{{ packages }}"
       when:
-        - ansible_facts['distribution'] == 'Ubuntu'
-        - ansible_facts['distribution_version'] == '24.04'
+        - package_file is exists
+        - packages is defined
 
 
-- 
2.47.3


