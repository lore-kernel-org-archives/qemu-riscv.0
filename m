Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIOuZ-0006Y7-JY
	for mharc-qemu-riscv@gnu.org; Thu, 19 Jan 2023 02:00:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pIOuG-0006LT-NL
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 02:00:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pIOuC-00088R-1O
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 02:00:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674111606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DT1YR/I9uiXnMAX5jmyboBoPorBbJELfsh+yymZHrww=;
 b=impiwq3WbNpRQqmfNbWnwcr/HZTIy533dw0jSPhoGG271ByZfUzeaVNuscPxVxXdH9AjRL
 MCyeT/gHa/Dqrlm0uMqREzQEX264eHfg//FtTNiuFRMEjYZqET2UeoMzrgTMWqY6C3MDLd
 6o+qx6m952qtzGh8M4xVZmy4kldZMZU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-486-Cg00en9dPXqDrSzG9Rq4PQ-1; Thu, 19 Jan 2023 02:00:03 -0500
X-MC-Unique: Cg00en9dPXqDrSzG9Rq4PQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3D36D857A85;
 Thu, 19 Jan 2023 07:00:02 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 013C8C15BAD;
 Thu, 19 Jan 2023 07:00:00 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 46D5621E66F2; Thu, 19 Jan 2023 07:59:59 +0100 (CET)
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
 qemu-riscv@nongnu.org
Subject: [PATCH v4 03/19] scripts/clean-includes: Skip symbolic links
Date: Thu, 19 Jan 2023 07:59:43 +0100
Message-Id: <20230119065959.3104012-4-armbru@redhat.com>
In-Reply-To: <20230119065959.3104012-1-armbru@redhat.com>
References: <20230119065959.3104012-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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
X-List-Received-Date: Thu, 19 Jan 2023 07:00:20 -0000

When a symbolic link points to a file that needs cleaning, the script
replaces the link with a cleaned regular file.  Not wanted; skip them.

We have a few symbolic links under subprojects/libvduse/ and
subprojects/libvhost-user/.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/clean-includes | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/clean-includes b/scripts/clean-includes
index 8e8420d785..f0466a6262 100755
--- a/scripts/clean-includes
+++ b/scripts/clean-includes
@@ -113,6 +113,10 @@ EOT
 
 files=
 for f in "$@"; do
+  if [ -L "$f" ]; then
+      echo "SKIPPING $f (symbolic link)"
+      continue
+  fi
   case "$f" in
     *.c.inc)
       # These aren't standalone C source files
-- 
2.39.0


