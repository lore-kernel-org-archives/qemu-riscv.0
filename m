Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iCRAa-0003UG-Q7
	for mharc-qemu-riscv@gnu.org; Mon, 23 Sep 2019 12:26:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57596)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iCQxn-0002fy-Ri
 for qemu-riscv@nongnu.org; Mon, 23 Sep 2019 12:13:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iCQxl-00043Z-R2
 for qemu-riscv@nongnu.org; Mon, 23 Sep 2019 12:13:23 -0400
Received: from relay.sw.ru ([185.231.240.75]:39528)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iCQxM-0003aD-9p; Mon, 23 Sep 2019 12:12:56 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iCQx0-0001Fp-Dl; Mon, 23 Sep 2019 19:12:34 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com, berrange@redhat.com, arei.gonglei@huawei.com,
 ehabkost@redhat.com, imammedo@redhat.com, lvivier@redhat.com,
 amit@kernel.org, kwolf@redhat.com, mreitz@redhat.com, ari@tuxera.com,
 pavel.dovgaluk@ispras.ru, pbonzini@redhat.com, stefanha@redhat.com,
 jsnow@redhat.com, sw@weilnetz.de, fam@euphon.net, ronniesahlberg@gmail.com,
 pl@kamp.de, eblake@redhat.com, den@openvz.org, armbru@redhat.com,
 berto@igalia.com, dillaman@redhat.com, wencongyang2@huawei.com,
 xiechanglong.d@gmail.com, namei.unix@gmail.com, rjones@redhat.com,
 codyprime@gmail.com, marcandre.lureau@redhat.com, rth@twiddle.net,
 groug@kaod.org, mst@redhat.com, marcel.apfelbaum@gmail.com,
 b.galvani@gmail.com, peter.maydell@linaro.org,
 Andrew.Baumann@microsoft.com, philmd@redhat.com, antonynpavlov@gmail.com,
 jcd@tribudubois.net, peter.chubb@nicta.com.au, sundeep.lkml@gmail.com,
 joel@jms.id.au, eric.auger@redhat.com, alistair@alistair23.me,
 balrogg@gmail.com, edgar.iglesias@gmail.com, sstabellini@kernel.org,
 anthony.perard@citrix.com, paul.durrant@citrix.com, pburton@wavecomp.com,
 arikalo@wavecomp.com, clg@kaod.org, andrew@aj.id.au, crwulff@gmail.com,
 marex@denx.de, david@gibson.dropbear.id.au, pasic@linux.ibm.com,
 cohuck@redhat.com, borntraeger@de.ibm.com, hpoussin@reactos.org,
 xiaoguangrong.eric@gmail.com, aurelien@aurel32.net, amarkovic@wavecomp.com,
 mark.cave-ayland@ilande.co.uk, jasowang@redhat.com, lersek@redhat.com,
 palmer@sifive.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, david@redhat.com, thuth@redhat.com,
 farman@linux.ibm.com, walling@linux.ibm.com, hare@suse.com,
 michael@walle.cc, atar4qemu@gmail.com, stefanb@linux.ibm.com,
 samuel.thibault@ens-lyon.org, akrowiak@linux.ibm.com, pmorel@linux.ibm.com,
 alex.williamson@redhat.com, mdroth@linux.vnet.ibm.com,
 zhang.zhanghailiang@huawei.com, quintela@redhat.com, dgilbert@redhat.com,
 rizzo@iet.unipi.it, g.lettieri@iet.unipi.it, v.maffione@gmail.com,
 jan.kiszka@siemens.com, green@moxielogic.com, shorne@gmail.com,
 gxt@mprc.pku.edu.cn, jcmvbkbc@gmail.com, qemu-block@nongnu.org,
 integration@gluster.org, sheepdog@lists.wpkg.org, qemu-arm@nongnu.org,
 xen-devel@lists.xenproject.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, vsementsov@virtuozzo.com
Subject: [RFC v2 6/9] scripts: add coccinelle script to use auto propagated
 errp
Date: Mon, 23 Sep 2019 19:12:28 +0300
Message-Id: <20190923161231.22028-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190923161231.22028-1-vsementsov@virtuozzo.com>
References: <20190923161231.22028-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
X-Mailman-Approved-At: Mon, 23 Sep 2019 12:26:31 -0400
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
X-List-Received-Date: Mon, 23 Sep 2019 16:13:31 -0000

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 scripts/coccinelle/auto-propagated-errp.cocci | 82 +++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 scripts/coccinelle/auto-propagated-errp.cocci

diff --git a/scripts/coccinelle/auto-propagated-errp.cocci b/scripts/coccinelle/auto-propagated-errp.cocci
new file mode 100644
index 0000000000..1a3f006f0b
--- /dev/null
+++ b/scripts/coccinelle/auto-propagated-errp.cocci
@@ -0,0 +1,82 @@
+@@
+identifier fn;
+identifier local_err;
+@@
+
+ fn(..., Error **errp)
+ {
++    ERRP_FUNCTION_BEGIN();
+ }
+
+@rule1@
+identifier fn;
+identifier local_err;
+@@
+
+ fn(..., Error **errp)
+ {
+     <...
+-    Error *local_err = NULL;
+     ...>
+ }
+
+@@
+identifier rule1.fn;
+identifier rule1.local_err;
+identifier out;
+@@
+
+ fn(...)
+ {
+     <...
+-    goto out;
++    return;
+     ...>
+- out:
+-    error_propagate(errp, local_err);
+ }
+
+@@
+identifier rule1.fn;
+identifier rule1.local_err;
+@@
+
+ fn(...)
+ {
+     <...
+(
+-    error_free(local_err);
+-    local_err = NULL;
++    error_free_errp(errp);
+|
+-    error_free(local_err);
++    error_free_errp(errp);
+|
+-    error_report_err(local_err);
++    error_report_errp(errp);
+|
+-    warn_report_err(local_err);
++    warn_report_errp(errp);
+|
+-    error_propagate(errp, local_err);
+)
+     ...>
+ }
+
+@@
+identifier rule1.fn;
+identifier rule1.local_err;
+@@
+
+ fn(...)
+ {
+     <...
+(
+-    &local_err
++    errp
+|
+-    local_err
++    *errp
+)
+     ...>
+ }
-- 
2.21.0


