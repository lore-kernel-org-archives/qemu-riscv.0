Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ntQtR-0004uC-Jr
	for mharc-qemu-riscv@gnu.org; Tue, 24 May 2022 05:32:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ntQtM-0004rq-5m
 for qemu-riscv@nongnu.org; Tue, 24 May 2022 05:31:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ntQtJ-0005Qb-IU
 for qemu-riscv@nongnu.org; Tue, 24 May 2022 05:31:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653384709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=91+1/G/0jIujtaA0K74LFBlXN9Q5WV1AKCVDf6cnkI8=;
 b=GKwEir9xbaFYAEnFz0cVmDfCRYNTyfl5gI1LKZy/LFsdK4VGJ9MKyC9lx6GKp5bW9Ql11O
 07SSLMC+E35Lr5XzRz8davLOxn/ri6jlZXpVs/7nikUdDiloeCdPWqboWuzu7nY9nz7Q1i
 k4ns+YM5e1R6C6yEoKJmTjyg/VD7JLk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-126-0TCneGAIOyq4FOimmyCQrw-1; Tue, 24 May 2022 05:31:43 -0400
X-MC-Unique: 0TCneGAIOyq4FOimmyCQrw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 41D42185A7A4;
 Tue, 24 May 2022 09:31:43 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 62E8D492C3B;
 Tue, 24 May 2022 09:31:42 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-riscv@nongnu.org
Subject: [PATCH] .gitlab-ci.d/container-cross: Fix RISC-V container
 dependencies / stages
Date: Tue, 24 May 2022 11:31:41 +0200
Message-Id: <20220524093141.91012-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Tue, 24 May 2022 09:31:52 -0000

The "riscv64-debian-cross-container" job does not depend on any other
container job from the first stage, so we can move it to the first
stage, too.

The "riscv64-debian-test-cross-container" job needs the debian11
container, so we should add a proper "needs:" statement here.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/container-cross.yml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
index 26281ce4f9..f21d7a2a14 100644
--- a/.gitlab-ci.d/container-cross.yml
+++ b/.gitlab-ci.d/container-cross.yml
@@ -123,7 +123,7 @@ ppc64el-debian-cross-container:
 
 riscv64-debian-cross-container:
   extends: .container_job_template
-  stage: containers-layer2
+  stage: containers
   # as we are currently based on 'sid/unstable' we may break so...
   allow_failure: true
   variables:
@@ -133,6 +133,7 @@ riscv64-debian-cross-container:
 riscv64-debian-test-cross-container:
   extends: .container_job_template
   stage: containers-layer2
+  needs: ['amd64-debian11-container']
   variables:
     NAME: debian-riscv64-test-cross
 
-- 
2.27.0


