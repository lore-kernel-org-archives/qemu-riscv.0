Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mL2hN-0004z8-I5
	for mharc-qemu-riscv@gnu.org; Tue, 31 Aug 2021 08:17:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mL2hH-0004sU-Q2
 for qemu-riscv@nongnu.org; Tue, 31 Aug 2021 08:16:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mL2hD-0005bK-Tg
 for qemu-riscv@nongnu.org; Tue, 31 Aug 2021 08:16:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630412215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=st8LyVaIC9LZtCDOeqjCn0qsWGxdj7MtONbXC66eiAE=;
 b=IL6AH1z8tqgie03VLkPm2xomunb4v8fnAG0UF34mfh9ChvAousWayBU9wit+L4nkD/w0D8
 Gjj/Kw6NdkXZ8IaEfRjXaXGzO0saIrEDrU/9XPhy3GhJjygg/VVRgux7yEsFDrHGsZtBDZ
 yQKVAmoiL2NbA4IJ1wdGKvJYOuYGmPY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-L97Ruv1RMa-DvmyGBTuIMw-1; Tue, 31 Aug 2021 08:16:54 -0400
X-MC-Unique: L97Ruv1RMa-DvmyGBTuIMw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF2D3800482;
 Tue, 31 Aug 2021 12:16:50 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D9410197FC;
 Tue, 31 Aug 2021 12:16:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 68AFB1800980; Tue, 31 Aug 2021 14:15:45 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>, Laurent Vivier <laurent@vivier.eu>,
 Peter Xu <peterx@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-ppc@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-riscv@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Stafford Horne <shorne@gmail.com>, Huacai Chen <chenhuacai@kernel.org>,
 Halil Pasic <pasic@linux.ibm.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Bin Meng <bin.meng@windriver.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Greg Kurz <groug@kaod.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 07/29] tcg/module: move files to module [target/i386/tcg]
Date: Tue, 31 Aug 2021 14:15:23 +0200
Message-Id: <20210831121545.2874233-8-kraxel@redhat.com>
In-Reply-To: <20210831121545.2874233-1-kraxel@redhat.com>
References: <20210831121545.2874233-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.391, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 31 Aug 2021 12:17:00 -0000

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 target/i386/tcg/meson.build        | 9 +++++++--
 target/i386/tcg/sysemu/meson.build | 5 ++++-
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/target/i386/tcg/meson.build b/target/i386/tcg/meson.build
index f9110e890c8a..7bbe3d926975 100644
--- a/target/i386/tcg/meson.build
+++ b/target/i386/tcg/meson.build
@@ -1,4 +1,7 @@
-i386_ss.add(when: 'CONFIG_TCG', if_true: files(
+i386_softmmu_ss.add(when: 'CONFIG_TCG', if_false: files('tcg-stub.c'))
+
+files_ss = ss.source_set()
+files_ss.add(when: 'CONFIG_TCG', if_true: files(
   'bpt_helper.c',
   'cc_helper.c',
   'excp_helper.c',
@@ -9,7 +12,9 @@ i386_ss.add(when: 'CONFIG_TCG', if_true: files(
   'mpx_helper.c',
   'seg_helper.c',
   'tcg-cpu.c',
-  'translate.c'), if_false: files('tcg-stub.c'))
+  'translate.c'))
+tcg_module_ss.add_all(when: 'TARGET_I386', if_true: files_ss)
+tcg_module_ss.add_all(when: 'TARGET_X86_64', if_true: files_ss)
 
 subdir('sysemu')
 subdir('user')
diff --git a/target/i386/tcg/sysemu/meson.build b/target/i386/tcg/sysemu/meson.build
index 2e444e766a5b..50bfd5094787 100644
--- a/target/i386/tcg/sysemu/meson.build
+++ b/target/i386/tcg/sysemu/meson.build
@@ -1,4 +1,5 @@
-i386_softmmu_ss.add(when: ['CONFIG_TCG', 'CONFIG_SOFTMMU'], if_true: files(
+files_ss = ss.source_set()
+files_ss.add(when: ['CONFIG_TCG', 'CONFIG_SOFTMMU'], if_true: files(
   'tcg-cpu.c',
   'smm_helper.c',
   'excp_helper.c',
@@ -8,3 +9,5 @@ i386_softmmu_ss.add(when: ['CONFIG_TCG', 'CONFIG_SOFTMMU'], if_true: files(
   'svm_helper.c',
   'seg_helper.c',
 ))
+tcg_module_ss.add_all(when: 'TARGET_I386', if_true: files_ss)
+tcg_module_ss.add_all(when: 'TARGET_X86_64', if_true: files_ss)
-- 
2.31.1


