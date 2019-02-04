Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gqlXp-0004ns-8J
	for mharc-qemu-riscv@gnu.org; Mon, 04 Feb 2019 16:12:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45847)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gqlXn-0004lf-1c
	for qemu-riscv@nongnu.org; Mon, 04 Feb 2019 16:12:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gqlXf-000290-Bi
	for qemu-riscv@nongnu.org; Mon, 04 Feb 2019 16:12:37 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51904)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gqlXL-0001vc-DK; Mon, 04 Feb 2019 16:12:15 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A2A83356E5;
	Mon,  4 Feb 2019 21:12:14 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-98.brq.redhat.com [10.40.204.98])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F0FE7608C4;
	Mon,  4 Feb 2019 21:12:11 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Eric Blake <eblake@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>
Date: Mon,  4 Feb 2019 22:12:02 +0100
Message-Id: <20190204211204.27321-2-philmd@redhat.com>
In-Reply-To: <20190204211204.27321-1-philmd@redhat.com>
References: <20190204211204.27321-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Mon, 04 Feb 2019 21:12:14 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-riscv] [PATCH v3 1/3] util/cutils: Move size_to_str() from
 "qemu-common.h" to "cutils.h"
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Feb 2019 21:12:44 -0000

The size_to_str() function doesn't need to be in a generic header.

It makes also sense to find this function in the same header as
the opposite string to size functions: qemu_strtosz*().
Note that this function is already implemented in util/cutils.c.

Since we introduce a new function in a header, we document it,
using the previous comment from the source file.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
---
 include/qemu-common.h        |  1 -
 include/qemu/cutils.h        | 13 +++++++++++++
 qapi/string-output-visitor.c |  2 +-
 util/cutils.c                |  6 ------
 4 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/include/qemu-common.h b/include/qemu-common.h
index ed60ba251d..760527294f 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -153,7 +153,6 @@ void qemu_hexdump(const char *buf, FILE *fp, const ch=
ar *prefix, size_t size);
 int parse_debug_env(const char *name, int max, int initial);
=20
 const char *qemu_ether_ntoa(const MACAddr *mac);
-char *size_to_str(uint64_t val);
 void page_size_init(void);
=20
 /* returns non-zero if dump is in progress, otherwise zero is
diff --git a/include/qemu/cutils.h b/include/qemu/cutils.h
index d2dad3057c..9ee40470e3 100644
--- a/include/qemu/cutils.h
+++ b/include/qemu/cutils.h
@@ -157,6 +157,19 @@ int qemu_strtosz(const char *nptr, const char **end,=
 uint64_t *result);
 int qemu_strtosz_MiB(const char *nptr, const char **end, uint64_t *resul=
t);
 int qemu_strtosz_metric(const char *nptr, const char **end, uint64_t *re=
sult);
=20
+/**
+ * size_to_str:
+ *
+ * Return human readable string for size @val.
+ * Use IEC binary units like KiB, MiB, and so forth.
+ *
+ * @val: The value to format.
+ *       Can be anything that uint64_t allows (no more than "16 EiB").
+ *
+ * Caller is responsible for passing it to g_free().
+ */
+char *size_to_str(uint64_t val);
+
 /* used to print char* safely */
 #define STR_OR_NULL(str) ((str) ? (str) : "null")
=20
diff --git a/qapi/string-output-visitor.c b/qapi/string-output-visitor.c
index 7ab64468d9..edf268b373 100644
--- a/qapi/string-output-visitor.c
+++ b/qapi/string-output-visitor.c
@@ -11,9 +11,9 @@
  */
=20
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qapi/string-output-visitor.h"
 #include "qapi/visitor-impl.h"
+#include "qemu/cutils.h"
 #include "qemu/host-utils.h"
 #include <math.h>
 #include "qemu/range.h"
diff --git a/util/cutils.c b/util/cutils.c
index e098debdc0..a8a3a3ba3b 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -816,12 +816,6 @@ const char *qemu_ether_ntoa(const MACAddr *mac)
     return ret;
 }
=20
-/*
- * Return human readable string for size @val.
- * @val can be anything that uint64_t allows (no more than "16 EiB").
- * Use IEC binary units like KiB, MiB, and so forth.
- * Caller is responsible for passing it to g_free().
- */
 char *size_to_str(uint64_t val)
 {
     static const char *suffixes[] =3D { "", "Ki", "Mi", "Gi", "Ti", "Pi"=
, "Ei" };
--=20
2.20.1


