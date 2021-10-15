Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbNaO-0001h8-U7
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 09:49:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1mbKmH-0007eB-5C
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 06:49:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1mbKmC-0000ig-MK
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 06:49:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634294961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=maTTtXdlSTQj8q1wAof5H5YOOBc3riqhlbyW4EBa6xM=;
 b=LG0BKFiItT58GUuZyv/K+BEnmpDclCT19QDU8JhJFBGCL9mcVPb6fqqvLit/CVoiMYIJF5
 CIOzvgyL216gOVVALNGUo3yNgWcH7KXMjGFBV9aSsTnPNPWXXR+0oMNmCqVJ/y/TQhGmR+
 PTllILHam7qETD5sVjIqbrITnZD5KwQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-aTJgCOKfPe6_JFON83Nllg-1; Fri, 15 Oct 2021 06:49:18 -0400
X-MC-Unique: aTJgCOKfPe6_JFON83Nllg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4547218D6A32;
 Fri, 15 Oct 2021 10:49:17 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-38.bne.redhat.com [10.64.54.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD00410013D7;
 Fri, 15 Oct 2021 10:49:13 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, imammedo@redhat.com,
 drjones@redhat.com, ehabkost@redhat.com, robh@kernel.org,
 peter.maydell@linaro.org, shan.gavin@gmail.com
Subject: [PATCH v4] hw/arm/virt: Don't create device-tree node for empty NUMA
 node
Date: Fri, 15 Oct 2021 18:49:09 +0800
Message-Id: <20211015104909.16722-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 15 Oct 2021 09:49:10 -0400
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
X-List-Received-Date: Fri, 15 Oct 2021 10:49:29 -0000

The empty NUMA node, where no memory resides, are allowed. For
example, the following command line specifies two empty NUMA nodes.
With this, QEMU fails to boot because of the conflicting device-tree
node names, as the following error message indicates.

  /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64 \
  -accel kvm -machine virt,gic-version=host               \
  -cpu host -smp 4,sockets=2,cores=2,threads=1            \
  -m 1024M,slots=16,maxmem=64G                            \
  -object memory-backend-ram,id=mem0,size=512M            \
  -object memory-backend-ram,id=mem1,size=512M            \
  -numa node,nodeid=0,cpus=0-1,memdev=mem0                \
  -numa node,nodeid=1,cpus=2-3,memdev=mem1                \
  -numa node,nodeid=2                                     \
  -numa node,nodeid=3
    :
  qemu-system-aarch64: FDT: Failed to create subnode /memory@80000000: FDT_ERR_EXISTS

As specified by linux device-tree binding document, the device-tree
nodes for these empty NUMA nodes shouldn't be generated. However,
the corresponding NUMA node IDs should be included in the distance
map. As the memory hotplug through device-tree on ARM64 isn't existing
so far, it's pointless to expose the empty NUMA nodes through device-tree.
So this simply skips populating the device-tree nodes for these empty
NUMA nodes to avoid the error, so that QEMU can be started successfully.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
v4: Drop patch to enforce distance-map as memory hotplug through
    device-tree is never supported on ARM64. It's pointless to
    expose these empty NUMA nodes. Besides, comments added to
    explain the code changes included in this patch as Drew
    suggested.
---
 hw/arm/boot.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 57efb61ee4..e05c1c149c 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -599,10 +599,24 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
     }
     g_strfreev(node_path);
 
+    /*
+     * According to Linux NUMA binding document, the device tree nodes
+     * for the empty NUMA nodes shouldn't be generated, but their NUMA
+     * node IDs should be included in the distance map instead. However,
+     * it's pointless to expose the empty NUMA nodes as memory hotplug
+     * through device tree is never supported. We simply skip generating
+     * their device tree nodes to avoid the unexpected device tree
+     * generating failure due to the duplicated names of these empty
+     * NUMA nodes.
+     */
     if (ms->numa_state != NULL && ms->numa_state->num_nodes > 0) {
         mem_base = binfo->loader_start;
         for (i = 0; i < ms->numa_state->num_nodes; i++) {
             mem_len = ms->numa_state->nodes[i].node_mem;
+            if (!mem_len) {
+                continue;
+            }
+
             rc = fdt_add_memory_node(fdt, acells, mem_base,
                                      scells, mem_len, i);
             if (rc < 0) {
-- 
2.23.0


