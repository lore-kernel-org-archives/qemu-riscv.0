Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mL2go-0004PE-2B
	for mharc-qemu-riscv@gnu.org; Tue, 31 Aug 2021 08:16:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mL2gl-0004HR-Bj
 for qemu-riscv@nongnu.org; Tue, 31 Aug 2021 08:16:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mL2gj-0005FZ-EC
 for qemu-riscv@nongnu.org; Tue, 31 Aug 2021 08:16:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630412184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zlsq4UMzdEMYv0Xvm4eAWbgRSDl8tyA0ndz30DB3qMY=;
 b=JUZTnnclJOok56a1bKgrySzDwCVlpCE6NN6I5Dnsx9uPedHqDTaEKd0cYHJ3JAZIFp5+AG
 SIRxktNdio/tvmSg58WRfBBiMwkJEOotknV0B9aVnE9r8QPQQmLylCcHFmNn/pa8E9Cl36
 6sjFOeaXNjqLV4GHqgAWaKXleeWEP2I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-uUgAP4dpMYGGp8VVJqFsvA-1; Tue, 31 Aug 2021 08:16:23 -0400
X-MC-Unique: uUgAP4dpMYGGp8VVJqFsvA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E8D580198A;
 Tue, 31 Aug 2021 12:16:20 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C86818A49;
 Tue, 31 Aug 2021 12:16:05 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2EF88180093A; Tue, 31 Aug 2021 14:15:45 +0200 (CEST)
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
Subject: [PATCH 02/29] plugins: register qemu_plugin_opts using opts_init()
Date: Tue, 31 Aug 2021 14:15:18 +0200
Message-Id: <20210831121545.2874233-3-kraxel@redhat.com>
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
X-List-Received-Date: Tue, 31 Aug 2021 12:16:27 -0000

Removes the need for an explicit qemu_plugin_add_opts() call.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/qemu/plugin.h | 7 -------
 linux-user/main.c     | 2 +-
 plugins/loader.c      | 9 ++++++++-
 softmmu/vl.c          | 1 -
 4 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/include/qemu/plugin.h b/include/qemu/plugin.h
index 9a8438f6836c..57bdcdecdb42 100644
--- a/include/qemu/plugin.h
+++ b/include/qemu/plugin.h
@@ -37,13 +37,6 @@ struct qemu_plugin_desc;
 typedef QTAILQ_HEAD(, qemu_plugin_desc) QemuPluginList;
 
 #ifdef CONFIG_PLUGIN
-extern QemuOptsList qemu_plugin_opts;
-
-static inline void qemu_plugin_add_opts(void)
-{
-    qemu_add_opts(&qemu_plugin_opts);
-}
-
 void qemu_plugin_opt_parse(const char *optarg, QemuPluginList *head);
 int qemu_plugin_load_list(QemuPluginList *head, Error **errp);
 
diff --git a/linux-user/main.c b/linux-user/main.c
index 37ed50d98e2e..f9d2c6e2de31 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -661,7 +661,7 @@ int main(int argc, char **argv, char **envp)
     cpu_model = NULL;
 
     qemu_add_opts(&qemu_trace_opts);
-    qemu_plugin_add_opts();
+    module_call_init(MODULE_INIT_OPTS);
 
     optind = parse_args(argc, argv);
 
diff --git a/plugins/loader.c b/plugins/loader.c
index 05df40398d62..71b03721dffc 100644
--- a/plugins/loader.c
+++ b/plugins/loader.c
@@ -53,7 +53,7 @@ struct qemu_plugin_parse_arg {
     struct qemu_plugin_desc *curr;
 };
 
-QemuOptsList qemu_plugin_opts = {
+static QemuOptsList qemu_plugin_opts = {
     .name = "plugin",
     .implied_opt_name = "file",
     .head = QTAILQ_HEAD_INITIALIZER(qemu_plugin_opts.head),
@@ -403,3 +403,10 @@ void plugin_reset_uninstall(qemu_plugin_id_t id,
         plugin_reset_destroy(data);
     }
 }
+
+static void plugin_register_config(void)
+{
+    qemu_add_opts(&qemu_plugin_opts);
+}
+opts_init(plugin_register_config);
+module_opts("plugin");
diff --git a/softmmu/vl.c b/softmmu/vl.c
index ea05bb39c501..c29a58dee8a0 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2736,7 +2736,6 @@ void qemu_init(int argc, char **argv, char **envp)
     qemu_add_opts(&qemu_global_opts);
     qemu_add_opts(&qemu_mon_opts);
     qemu_add_opts(&qemu_trace_opts);
-    qemu_plugin_add_opts();
     qemu_add_opts(&qemu_option_rom_opts);
     qemu_add_opts(&qemu_accel_opts);
     qemu_add_opts(&qemu_mem_opts);
-- 
2.31.1


