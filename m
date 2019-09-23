Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iCRAW-0003Ng-95
	for mharc-qemu-riscv@gnu.org; Mon, 23 Sep 2019 12:26:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57675)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iCQxs-0002io-NU
 for qemu-riscv@nongnu.org; Mon, 23 Sep 2019 12:13:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iCQxq-00045R-95
 for qemu-riscv@nongnu.org; Mon, 23 Sep 2019 12:13:28 -0400
Received: from relay.sw.ru ([185.231.240.75]:39502)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iCQxN-0003a9-HI; Mon, 23 Sep 2019 12:12:57 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iCQx0-0001Fp-4Q; Mon, 23 Sep 2019 19:12:34 +0300
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
Subject: [RFC v2 5/9] net/net: fix local variable shadowing in net_client_init
Date: Mon, 23 Sep 2019 19:12:27 +0300
Message-Id: <20190923161231.22028-6-vsementsov@virtuozzo.com>
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

Don't shadow Error *err: it's a bad thing. This patch also simplifies
following Error propagation conversion.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 net/net.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/net/net.c b/net/net.c
index 84aa6d8d00..5fc72511c1 100644
--- a/net/net.c
+++ b/net/net.c
@@ -1128,10 +1128,10 @@ static int net_client_init(QemuOpts *opts, bool is_netdev, Error **errp)
 
             if (substrings[1]) {
                 /* User-specified prefix length.  */
-                int err;
+                int ret2;
 
-                err = qemu_strtoul(substrings[1], NULL, 10, &prefix_len);
-                if (err) {
+                ret2 = qemu_strtoul(substrings[1], NULL, 10, &prefix_len);
+                if (ret2) {
                     error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
                                "ipv6-prefixlen", "a number");
                     goto out;
-- 
2.21.0


