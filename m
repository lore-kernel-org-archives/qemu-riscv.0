Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mT4v6-0003OM-4d
	for mharc-qemu-riscv@gnu.org; Wed, 22 Sep 2021 12:16:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mT4uz-0003Ey-C1; Wed, 22 Sep 2021 12:16:21 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:39170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mT4ux-0005Ow-JW; Wed, 22 Sep 2021 12:16:21 -0400
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id 3C58E21ECD;
 Wed, 22 Sep 2021 16:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1632327356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=83vzCH47KASlUcuFQINQpuff64c+MWa6MS19Qg8Yxnk=;
 b=P7hcyu+pxVIWKnhY3fU1nC0/ApGUVDeZbSeiHxcpgkCZWg35zWms2xJ3anjKnSVUoSAD8c
 H+qh2umF75EUBiBBC7qMvIrQtuaCSddKC0OjRXsV4MQS+CTdyIeI2BmpDSKe3DXTKRIt0Q
 VCthFEhyqAq/QRJQzHUCvH2QWSOp70s=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Gerd Hoffmann <kraxel@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-riscv@nongnu.org, xen-devel@lists.xenproject.org,
 mark.burton@greensocs.com, mirela.grujic@greensocs.com, edgari@xilinx.com,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [RFC PATCH v2 11/16] softmmu/memory: add
 memory_region_try_add_subregion function
Date: Wed, 22 Sep 2021 18:14:00 +0200
Message-Id: <20210922161405.140018-12-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922161405.140018-1-damien.hedde@greensocs.com>
References: <20210922161405.140018-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 22 Sep 2021 16:16:22 -0000

It allows to try to add a subregion to a memory region with error
handling. Like memory_region_add_subregion_overlap, it handles
priority as well.
Apart the error handling, the behavior is the same. It can be used
to do the simple memory_region_add_subregion() (with no overlap) by
setting the priority parameter to 0.

This commit is a preparation to further use this function in the
context of qmp command which needs error handling support.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---

Adding a new function is obviously not ideal. But there is ~900
occurrences of memory_region_add_subregion[_overlap] calls in the code
base. We do not really see an alternative here.
---
 include/exec/memory.h | 22 ++++++++++++++++++++++
 softmmu/memory.c      | 22 ++++++++++++++--------
 2 files changed, 36 insertions(+), 8 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index c3d417d317..422e1eda67 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -2162,6 +2162,28 @@ void memory_region_add_subregion_overlap(MemoryRegion *mr,
                                          MemoryRegion *subregion,
                                          int priority);
 
+/**
+ * memory_region_try_add_subregion: Add a subregion to a container
+ *                                  with error handling.
+ *
+ * Behaves like memory_region_add_subregion_overlap(), but errors are
+ * reported if the subregion cannot be added.
+ *
+ * @mr: the region to contain the new subregion; must be a container
+ *      initialized with memory_region_init().
+ * @offset: the offset relative to @mr where @subregion is added.
+ * @subregion: the subregion to be added.
+ * @priority: used for resolving overlaps; highest priority wins.
+ * @errp: pointer to Error*, to store an error if it happens.
+ *
+ * Returns: True in case of success, false otherwise.
+ */
+bool memory_region_try_add_subregion(MemoryRegion *mr,
+                                     hwaddr offset,
+                                     MemoryRegion *subregion,
+                                     int priority,
+                                     Error **errp);
+
 /**
  * memory_region_get_ram_addr: Get the ram address associated with a memory
  *                             region
diff --git a/softmmu/memory.c b/softmmu/memory.c
index bfedaf9c4d..eac61f8236 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -2513,22 +2513,28 @@ done:
     memory_region_transaction_commit();
 }
 
-static void memory_region_add_subregion_common(MemoryRegion *mr,
-                                               hwaddr offset,
-                                               MemoryRegion *subregion)
+bool memory_region_try_add_subregion(MemoryRegion *mr,
+                                     hwaddr offset,
+                                     MemoryRegion *subregion,
+                                     int priority,
+                                     Error **errp)
 {
-    assert(!subregion->container);
+    if (subregion->container) {
+        error_setg(errp, "The memory region is already in another region");
+        return false;
+    }
+    subregion->priority = priority;
     subregion->container = mr;
     subregion->addr = offset;
     memory_region_update_container_subregions(subregion);
+    return true;
 }
 
 void memory_region_add_subregion(MemoryRegion *mr,
                                  hwaddr offset,
                                  MemoryRegion *subregion)
 {
-    subregion->priority = 0;
-    memory_region_add_subregion_common(mr, offset, subregion);
+    memory_region_try_add_subregion(mr, offset, subregion, 0, &error_abort);
 }
 
 void memory_region_add_subregion_overlap(MemoryRegion *mr,
@@ -2536,8 +2542,8 @@ void memory_region_add_subregion_overlap(MemoryRegion *mr,
                                          MemoryRegion *subregion,
                                          int priority)
 {
-    subregion->priority = priority;
-    memory_region_add_subregion_common(mr, offset, subregion);
+    memory_region_try_add_subregion(mr, offset, subregion, priority,
+                                    &error_abort);
 }
 
 void memory_region_del_subregion(MemoryRegion *mr,
-- 
2.33.0


