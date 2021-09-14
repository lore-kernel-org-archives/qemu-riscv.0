Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQ9S5-0006ce-GM
	for mharc-qemu-riscv@gnu.org; Tue, 14 Sep 2021 10:30:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9Ry-0006Ug-Mv
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:30:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9Rw-0001Dd-2g
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:30:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631629815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=be82tQBLLAMQdwGA50YKu57XeGmPPD0+NHLXGjTgS5Q=;
 b=UqqmLbtPmig4vqO+SU6KjnKMm8ZnxDXKqY4yDxNJPro55oeBpKhcbSwzPjzkfg5Ta9/aZL
 g+8rAQRxe3JaDoo+CItHhqJOtDZ4UeqEcZZEAfSyUpc/72GHN39RiJJFt3p2Wne297i1XK
 7oV6DRa665hRUNLMNgiCLzNOim8mlEQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-FJ_PELA1Nk-yPfAkS6bYFA-1; Tue, 14 Sep 2021 10:30:14 -0400
X-MC-Unique: FJ_PELA1Nk-yPfAkS6bYFA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B256835DEE;
 Tue, 14 Sep 2021 14:30:09 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB02B5D9DC;
 Tue, 14 Sep 2021 14:29:59 +0000 (UTC)
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
Subject: [PATCH v2 28/53] monitor: remove 'info ioapic' HMP command
Date: Tue, 14 Sep 2021 15:20:17 +0100
Message-Id: <20210914142042.1655100-29-berrange@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
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
X-List-Received-Date: Tue, 14 Sep 2021 14:30:19 -0000

This command was turned into a no-op four years ago in

  commit 0c8465440d50c18a7bb13d0a866748f0593e193a
  Author: Peter Xu <peterx@redhat.com>
  Date:   Fri Dec 29 15:31:04 2017 +0800

    hmp: obsolete "info ioapic"

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hmp-commands-info.hx         | 15 ---------------
 include/monitor/hmp-target.h |  1 -
 target/i386/monitor.c        |  6 ------
 3 files changed, 22 deletions(-)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index 27206ac049..f8312342cd 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -127,21 +127,6 @@ SRST
     Show local APIC state
 ERST
 
-#if defined(TARGET_I386)
-    {
-        .name       = "ioapic",
-        .args_type  = "",
-        .params     = "",
-        .help       = "show io apic state",
-        .cmd        = hmp_info_io_apic,
-    },
-#endif
-
-SRST
-  ``info ioapic``
-    Show io APIC state
-ERST
-
     {
         .name       = "cpus",
         .args_type  = "",
diff --git a/include/monitor/hmp-target.h b/include/monitor/hmp-target.h
index 60fc92722a..df79ad3355 100644
--- a/include/monitor/hmp-target.h
+++ b/include/monitor/hmp-target.h
@@ -48,6 +48,5 @@ void hmp_info_mem(Monitor *mon, const QDict *qdict);
 void hmp_info_tlb(Monitor *mon, const QDict *qdict);
 void hmp_mce(Monitor *mon, const QDict *qdict);
 void hmp_info_local_apic(Monitor *mon, const QDict *qdict);
-void hmp_info_io_apic(Monitor *mon, const QDict *qdict);
 
 #endif /* MONITOR_HMP_TARGET_H */
diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index 119211f0b0..19468c4e85 100644
--- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -669,12 +669,6 @@ void hmp_info_local_apic(Monitor *mon, const QDict *qdict)
     x86_cpu_dump_local_apic_state(cs, CPU_DUMP_FPU);
 }
 
-void hmp_info_io_apic(Monitor *mon, const QDict *qdict)
-{
-    monitor_printf(mon, "This command is obsolete and will be "
-                   "removed soon. Please use 'info pic' instead.\n");
-}
-
 SevInfo *qmp_query_sev(Error **errp)
 {
     SevInfo *info;
-- 
2.31.1


