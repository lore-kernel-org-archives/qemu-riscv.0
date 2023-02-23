Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pV6kO-0003Wn-KK
	for mharc-qemu-riscv@gnu.org; Thu, 23 Feb 2023 03:14:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pV6kN-0003WX-CK
 for qemu-riscv@nongnu.org; Thu, 23 Feb 2023 03:14:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pV6kL-0001E6-IY
 for qemu-riscv@nongnu.org; Thu, 23 Feb 2023 03:14:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677140073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N93heQF4SVVlaYuxobhHpAFpD9Mv4hw0bmrbFiLSBLo=;
 b=YFF31MwuBiXLf2hXpU7x5tzB3P11Vurbud2qAr8KEmUUH81pjZbSn3G32a+IBZe8KV0Gg9
 ++HXPywQ4KOXKaYB4aZqPQW/O8sufGFcNf3Qld4yvxlfy/f9JTH4nGv0Hr1zeZHU6jCir6
 G/OZdVvnSRINfU8KjHbvW6zKgHkIlNw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-570-Br5-GpZlNDG1AeyYhnmSMg-1; Thu, 23 Feb 2023 03:14:28 -0500
X-MC-Unique: Br5-GpZlNDG1AeyYhnmSMg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 08A23101A55E;
 Thu, 23 Feb 2023 08:14:28 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-168.bne.redhat.com [10.64.54.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 40CDC440DC;
 Thu, 23 Feb 2023 08:14:21 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, rad@semihalf.com,
 peter.maydell@linaro.org, quic_llindhol@quicinc.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 thuth@redhat.com, lvivier@redhat.com, pbonzini@redhat.com,
 imammedo@redhat.com, yihyu@redhat.com, shan.gavin@gmail.com
Subject: [PATCH v2 1/4] qtest/numa-test: Follow socket-NUMA-node boundary for
 aarch64
Date: Thu, 23 Feb 2023 16:13:58 +0800
Message-Id: <20230223081401.248835-2-gshan@redhat.com>
In-Reply-To: <20230223081401.248835-1-gshan@redhat.com>
References: <20230223081401.248835-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 23 Feb 2023 08:14:35 -0000

After socket-to-NUMA-node boundary is applied to aarch64 in the subsequent
patches, we need to explicitly specify 'smp.sockets=2' for 'test_mon_explicit'
and 'test_query_cpus' test cases. Besides, 'test_mon_partial' isn't applied
to aarch64 any more.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 tests/qtest/numa-test.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/numa-test.c b/tests/qtest/numa-test.c
index c5eb13f349..ebfd522af3 100644
--- a/tests/qtest/numa-test.c
+++ b/tests/qtest/numa-test.c
@@ -25,7 +25,8 @@ static void test_mon_explicit(const void *data)
     g_autofree char *s = NULL;
     g_autofree char *cli = NULL;
 
-    cli = make_cli(data, "-machine smp.cpus=8 -numa node,nodeid=0,memdev=ram,cpus=0-3 "
+    cli = make_cli(data, "-machine smp.cpus=8,smp.sockets=2 "
+                         "-numa node,nodeid=0,memdev=ram,cpus=0-3 "
                          "-numa node,nodeid=1,cpus=4-7");
     qts = qtest_init(cli);
 
@@ -87,7 +88,8 @@ static void test_query_cpus(const void *data)
     QTestState *qts;
     g_autofree char *cli = NULL;
 
-    cli = make_cli(data, "-machine smp.cpus=8 -numa node,memdev=ram,cpus=0-3 "
+    cli = make_cli(data, "-machine smp.cpus=8,smp.sockets=2 "
+                         "-numa node,memdev=ram,cpus=0-3 "
                          "-numa node,cpus=4-7");
     qts = qtest_init(cli);
     cpus = get_cpus(qts, &resp);
@@ -565,7 +567,12 @@ int main(int argc, char **argv)
 
     qtest_add_data_func("/numa/mon/cpus/default", args, test_def_cpu_split);
     qtest_add_data_func("/numa/mon/cpus/explicit", args, test_mon_explicit);
-    qtest_add_data_func("/numa/mon/cpus/partial", args, test_mon_partial);
+
+    if (!strcmp(arch, "i386") || !strcmp(arch, "x86_64") ||
+        !strcmp(arch, "ppc64")) {
+        qtest_add_data_func("/numa/mon/cpus/partial", args, test_mon_partial);
+    }
+
     qtest_add_data_func("/numa/qmp/cpus/query-cpus", args, test_query_cpus);
 
     if (!strcmp(arch, "i386") || !strcmp(arch, "x86_64")) {
-- 
2.23.0


