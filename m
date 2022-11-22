Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oxTeX-0000VO-7g
	for mharc-qemu-riscv@gnu.org; Tue, 22 Nov 2022 08:49:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oxTeU-0000RW-Vm
 for qemu-riscv@nongnu.org; Tue, 22 Nov 2022 08:49:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oxTeS-0005yp-11
 for qemu-riscv@nongnu.org; Tue, 22 Nov 2022 08:49:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669124966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3EPaBogxtsu0JYZNrbrW2dfaU2v6R9TzLSpa2L5xjyA=;
 b=VXwxcMISPgAkf0sSb3QRRnQutITpP57T0Jlj1oA9vTEbddpKpFlkhQZPGnhpg1O3Z1tK0M
 aesELec9SKKLP/vUu/dgYttOSWd/C5ARoI7vttyt4AvMGQywBOA9DtqFDj8z6A6RUHrT29
 E/eocuxrLjYUrL0lxS9iyOPhBLrIu+Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-161-Zpnd4_-OOmKaAwe1e_F-sw-1; Tue, 22 Nov 2022 08:49:24 -0500
X-MC-Unique: Zpnd4_-OOmKaAwe1e_F-sw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A563101A52A;
 Tue, 22 Nov 2022 13:49:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6FCF2112132D;
 Tue, 22 Nov 2022 13:49:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EF75721E6936; Tue, 22 Nov 2022 14:49:17 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: groug@kaod.org, qemu_oss@crudebyte.com, Alistair.Francis@wdc.com,
 bin.meng@windriver.com, palmer@dabbelt.com, marcandre.lureau@redhat.com,
 pbonzini@redhat.com, yuval.shaia.ml@gmail.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, quintela@redhat.com, dgilbert@redhat.com,
 pavel.dovgaluk@ispras.ru, alex.bennee@linaro.org, peterx@redhat.com,
 david@redhat.com, philmd@linaro.org, mrolnik@gmail.com,
 gaosong@loongson.cn, yangxiaojuan@loongson.cn, aurelien@aurel32.net,
 jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com, berrange@redhat.com,
 thuth@redhat.com, lvivier@redhat.com, suhang16@mails.ucas.ac.cn,
 chen.zhang@intel.com, lizhijian@fujitsu.com, stefanha@redhat.com,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, virtio-fs@redhat.com,
 Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Subject: [PATCH v2 2/2] block/vmdk: Simplify vmdk_co_create() to return
 directly
Date: Tue, 22 Nov 2022 14:49:17 +0100
Message-Id: <20221122134917.1217307-3-armbru@redhat.com>
In-Reply-To: <20221122134917.1217307-1-armbru@redhat.com>
References: <20221122134917.1217307-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 22 Nov 2022 13:49:32 -0000

Cc: Fam Zheng <fam@euphon.net>
Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Hanna Reitz <hreitz@redhat.com>
Cc: qemu-block@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 block/vmdk.c | 28 +++++++++++-----------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/block/vmdk.c b/block/vmdk.c
index 26376352b9..bac3d8db50 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -2821,7 +2821,6 @@ static BlockBackend *vmdk_co_create_cb(int64_t size, int idx,
 static int coroutine_fn vmdk_co_create(BlockdevCreateOptions *create_options,
                                        Error **errp)
 {
-    int ret;
     BlockdevCreateOptionsVmdk *opts;
 
     opts = &create_options->u.vmdk;
@@ -2829,24 +2828,19 @@ static int coroutine_fn vmdk_co_create(BlockdevCreateOptions *create_options,
     /* Validate options */
     if (!QEMU_IS_ALIGNED(opts->size, BDRV_SECTOR_SIZE)) {
         error_setg(errp, "Image size must be a multiple of 512 bytes");
-        ret = -EINVAL;
-        goto out;
+        return -EINVAL;
     }
 
-    ret = vmdk_co_do_create(opts->size,
-                            opts->subformat,
-                            opts->adapter_type,
-                            opts->backing_file,
-                            opts->hwversion,
-                            opts->toolsversion,
-                            false,
-                            opts->zeroed_grain,
-                            vmdk_co_create_cb,
-                            opts, errp);
-    return ret;
-
-out:
-    return ret;
+    return vmdk_co_do_create(opts->size,
+                             opts->subformat,
+                             opts->adapter_type,
+                             opts->backing_file,
+                             opts->hwversion,
+                             opts->toolsversion,
+                             false,
+                             opts->zeroed_grain,
+                             vmdk_co_create_cb,
+                             opts, errp);
 }
 
 static void vmdk_close(BlockDriverState *bs)
-- 
2.37.3


