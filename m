Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQ9V3-0001yO-G2
	for mharc-qemu-riscv@gnu.org; Tue, 14 Sep 2021 10:33:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9Uz-0001ti-NM
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:33:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9Uu-0003RH-HJ
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:33:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631629999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iWqi5YvXZxhgluXSBWOP1B0vyK3sX9iLf6wGJw7ZgFs=;
 b=R+4f5hykpfHKzhUUaiqG+Mc6/Ob5d3knQ3PbN8L7g1zWm7KVYGfOx9drXKk9mIrkrElzIz
 gqDJzOlq8oIbqIKBlkflgCA1L6BdW2jh8mRap5bt9geKdbg5nwzPAD49VMpeNS5WRF1HhV
 xdfr21IU8+vcG4ewKWO2nVv/qpekP7E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-EFErQYmbNxqE2_ohQcmwiw-1; Tue, 14 Sep 2021 10:33:18 -0400
X-MC-Unique: EFErQYmbNxqE2_ohQcmwiw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 975991808306;
 Tue, 14 Sep 2021 14:33:14 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EDE2F5D9CA;
 Tue, 14 Sep 2021 14:32:58 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, Bin Meng <bin.meng@windriver.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Stafford Horne <shorne@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Peter Xu <peterx@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-ppc@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Halil Pasic <pasic@linux.ibm.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-riscv@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Marek Vasut <marex@denx.de>,
 Markus Armbruster <armbru@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-s390x@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Chris Wulff <crwulff@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 41/53] hw/core: drop support for NULL pointer for FILE * in
 cpu_dump_state
Date: Tue, 14 Sep 2021 15:20:30 +0100
Message-Id: <20210914142042.1655100-42-berrange@redhat.com>
In-Reply-To: <20210914142042.1655100-1-berrange@redhat.com>
References: <20210914142042.1655100-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.398, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 14 Sep 2021 14:33:26 -0000

The monitor is converted to use cpu_format_state, so the only remaining
users of cpu_dump_state all pass a non-NULL pointer for the FILE *
parameter.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/core/cpu-common.c  | 2 +-
 include/hw/core/cpu.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index 494f4f41eb..ffd9b9e07e 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -110,7 +110,7 @@ void cpu_dump_state(CPUState *cpu, FILE *f, int flags)
 {
     g_autoptr(GString) buf = g_string_new("");
     cpu_format_state(cpu, buf, flags);
-    qemu_fprintf(f, "%s", buf->str);
+    fprintf(f, "%s", buf->str);
 }
 
 void cpu_format_state(CPUState *cpu, GString *buf, int flags)
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 9cfc7d7479..4c47e1df18 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -531,7 +531,7 @@ enum CPUDumpFlags {
 /**
  * cpu_dump_state:
  * @cpu: The CPU whose state is to be dumped.
- * @f: If non-null, dump to this stream, else to current print sink.
+ * @f: dump to this stream
  *
  * Dumps CPU state.
  */
-- 
2.31.1


