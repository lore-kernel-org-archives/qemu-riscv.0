Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pNZob-0006ut-GB
	for mharc-qemu-riscv@gnu.org; Thu, 02 Feb 2023 08:39:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNZns-0005hu-OE
 for qemu-riscv@nongnu.org; Thu, 02 Feb 2023 08:39:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNZnc-00088y-05
 for qemu-riscv@nongnu.org; Thu, 02 Feb 2023 08:39:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675345122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xFHFrla/CoDpGKYnUvkSvuBtJSpBKqfFTk/sxIyjCL8=;
 b=HQvGDnI0wOn/9bxkw6LTHBMkC43wXauJjV9DbmhO3s4PrZoUQyo+S3fEzBglUdsZ9wQPM4
 w4AH8tdp9VPknACvoM1XYy3pLZkjqE7Z8rFqs1Z7fJaYwHquVB6BQJ9sZnz0M7wmSuiKHX
 N3p6z3a58ObsAixj0vlv1+lmQZUSp0k=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-98-aByc0waXPQSjy9VAxvjw5g-1; Thu, 02 Feb 2023 08:38:38 -0500
X-MC-Unique: aByc0waXPQSjy9VAxvjw5g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 318E8281722D;
 Thu,  2 Feb 2023 13:38:34 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CEB012026E04;
 Thu,  2 Feb 2023 13:38:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AFE8321E6A21; Thu,  2 Feb 2023 14:38:30 +0100 (CET)
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
Subject: [PATCH v6 02/20] scripts/clean-includes: Don't claim duplicate
 headers found when not
Date: Thu,  2 Feb 2023 14:38:12 +0100
Message-Id: <20230202133830.2152150-3-armbru@redhat.com>
In-Reply-To: <20230202133830.2152150-1-armbru@redhat.com>
References: <20230202133830.2152150-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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
X-List-Received-Date: Thu, 02 Feb 2023 13:39:07 -0000

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


