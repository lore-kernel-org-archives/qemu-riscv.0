Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pMU7v-0006qI-VX
	for mharc-qemu-riscv@gnu.org; Mon, 30 Jan 2023 08:23:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pMU75-00053P-RE
 for qemu-riscv@nongnu.org; Mon, 30 Jan 2023 08:22:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pMU6p-0005kW-37
 for qemu-riscv@nongnu.org; Mon, 30 Jan 2023 08:22:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675084924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xFHFrla/CoDpGKYnUvkSvuBtJSpBKqfFTk/sxIyjCL8=;
 b=KaMXNhpUWPFzUV/f2NcTK+DEFyZK7DmAqKcK4O+5VUXkAgQdrGYDpiL73XadoqJfW4FvUs
 2vt9Ut1XmmN7qvF76dhx5S3wNlK53wD8adwkbmXuB38at+eM1uaP80aWn0GUU6aO3N9kWh
 P7rvrqYZhW1lvmUNA8FeuFiJ90kxoRk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-288-ID4_w7c9MFunCxEIfhh2Aw-1; Mon, 30 Jan 2023 08:21:58 -0500
X-MC-Unique: ID4_w7c9MFunCxEIfhh2Aw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7462A183B3C0;
 Mon, 30 Jan 2023 13:21:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A9BE2166B26;
 Mon, 30 Jan 2023 13:21:57 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 439F621E6A21; Mon, 30 Jan 2023 14:21:56 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, pbonzini@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, imp@bsdimp.com, kevans@freebsd.org, berrange@redhat.com,
 groug@kaod.org, qemu_oss@crudebyte.com, mst@redhat.com, philmd@linaro.org,
 peter.maydell@linaro.org, alistair@alistair23.me, jasowang@redhat.com,
 jonathan.cameron@huawei.com, kbastian@mail.uni-paderborn.de,
 quintela@redhat.com, dgilbert@redhat.com, michael.roth@amd.com,
 kkostiuk@redhat.com, tsimpson@quicinc.com, palmer@dabbelt.com,
 bin.meng@windriver.com, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, Eric Blake <eblake@redhat.com>
Subject: [PATCH v5 02/20] scripts/clean-includes: Don't claim duplicate
 headers found when not
Date: Mon, 30 Jan 2023 14:21:38 +0100
Message-Id: <20230130132156.1868019-3-armbru@redhat.com>
In-Reply-To: <20230130132156.1868019-1-armbru@redhat.com>
References: <20230130132156.1868019-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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
X-List-Received-Date: Mon, 30 Jan 2023 13:22:26 -0000

When running with --check-dup-head, the script always claims it "Found
duplicate header file includes."  Fix to do it only when it actually
found some.

Fixes: d66253e46ae2 ("scripts/clean-includes: added duplicate #include check")
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 scripts/clean-includes | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/scripts/clean-includes b/scripts/clean-includes
index 86944f27fc..8e8420d785 100755
--- a/scripts/clean-includes
+++ b/scripts/clean-includes
@@ -177,9 +177,8 @@ for f in "$@"; do
 done
 
 if [ "$DUPHEAD" = "yes" ] && [ -n "$files" ]; then
-    egrep "^[[:space:]]*#[[:space:]]*include" $files | tr -d '[:blank:]' \
-        | sort | uniq -c | awk '{if ($1 > 1) print $0}'
-    if [ $? -eq 0 ]; then
+    if egrep "^[[:space:]]*#[[:space:]]*include" $files | tr -d '[:blank:]' \
+        | sort | uniq -c | grep -v '^ *1 '; then
         echo "Found duplicate header file includes. Please check the above files manually."
         exit 1
     fi
-- 
2.39.0


