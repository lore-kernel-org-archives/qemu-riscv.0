Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mL2hW-00058l-Bl
	for mharc-qemu-riscv@gnu.org; Tue, 31 Aug 2021 08:17:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mL2hL-0004yP-ID
 for qemu-riscv@nongnu.org; Tue, 31 Aug 2021 08:17:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mL2hJ-0005ee-DD
 for qemu-riscv@nongnu.org; Tue, 31 Aug 2021 08:17:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630412220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4cHILTFEO+nUdl3l0iUFX7QIAFD2fALvSFNx8yIq3Sk=;
 b=TCWLITZol86Az9f4COXrFhDbz/AdHYaVnwJeZFaFWZK9VJdML+zrOD3R9l47o6n4r9qV7m
 cPUS+gUW8rdKpcWXrBOHhve+gC+AE4tjdm+3KRuV2E8mjmU9Lhu2Lxt8J0/KRAnYB16lQr
 1yGyfSQpBUq5KAwXP7NWZKe5iUsa7j8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-B6x6kO9zP5CsLTS4yCDhZA-1; Tue, 31 Aug 2021 08:16:59 -0400
X-MC-Unique: B6x6kO9zP5CsLTS4yCDhZA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7E9A869EC9;
 Tue, 31 Aug 2021 12:16:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B39F85DF2F;
 Tue, 31 Aug 2021 12:16:40 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 73CE21800991; Tue, 31 Aug 2021 14:15:45 +0200 (CEST)
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
Subject: [PATCH 08/29] move cpu-exec-common.c from tcg module to core qemu
 [accel/tcg]
Date: Tue, 31 Aug 2021 14:15:24 +0200
Message-Id: <20210831121545.2874233-9-kraxel@redhat.com>
In-Reply-To: <20210831121545.2874233-1-kraxel@redhat.com>
References: <20210831121545.2874233-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Tue, 31 Aug 2021 12:17:05 -0000

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 accel/tcg/meson.build | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/accel/tcg/meson.build b/accel/tcg/meson.build
index 6471fe7832d7..ec74e17a8285 100644
--- a/accel/tcg/meson.build
+++ b/accel/tcg/meson.build
@@ -1,7 +1,10 @@
+specific_ss.add(when: 'CONFIG_TCG', if_true: files(
+  'cpu-exec-common.c',
+))
+
 tcg_ss = ss.source_set()
 tcg_ss.add(files(
   'tcg-all.c',
-  'cpu-exec-common.c',
   'cpu-exec.c',
   'tcg-runtime-gvec.c',
   'tcg-runtime.c',
-- 
2.31.1


