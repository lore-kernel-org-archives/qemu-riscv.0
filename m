Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iIxSd-0000b8-4k
	for mharc-qemu-riscv@gnu.org; Fri, 11 Oct 2019 12:08:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38017)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iIxSW-0000Pi-7f
 for qemu-riscv@nongnu.org; Fri, 11 Oct 2019 12:08:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iIxSR-0005kt-Q8
 for qemu-riscv@nongnu.org; Fri, 11 Oct 2019 12:08:04 -0400
Received: from relay.sw.ru ([185.231.240.75]:48100)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iIxRj-0004GL-Mi; Fri, 11 Oct 2019 12:07:16 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iIxQb-0003XG-Ro; Fri, 11 Oct 2019 19:06:05 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com, vsementsov@virtuozzo.com,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Amit Shah <amit@kernel.org>,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Ari Sundholm <ari@tuxera.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Stefan Weil <sw@weilnetz.de>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, Peter Lieven <pl@kamp.de>,
 Eric Blake <eblake@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Alberto Garcia <berto@igalia.com>, Jason Dillaman <dillaman@redhat.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, Liu Yuan <namei.unix@gmail.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Greg Kurz <groug@kaod.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Paul Burton <pburton@wavecomp.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, Chris Wulff <crwulff@gmail.com>,
 Marek Vasut <marex@denx.de>, David Gibson <david@gibson.dropbear.id.au>,
 Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jason Wang <jasowang@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 Yuval Shaia <yuval.shaia@oracle.com>, Palmer Dabbelt <palmer@sifive.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eric Farman <farman@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Hannes Reinecke <hare@suse.com>,
 Michael Walle <michael@walle.cc>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Stefan Berger <stefanb@linux.ibm.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Pierre Morel <pmorel@linux.ibm.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Luigi Rizzo <rizzo@iet.unipi.it>,
 Giuseppe Lettieri <g.lettieri@iet.unipi.it>,
 Vincenzo Maffione <v.maffione@gmail.com>,
 Jan Kiszka <jan.kiszka@siemens.com>, Anthony Green <green@moxielogic.com>,
 Stafford Horne <shorne@gmail.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-block@nongnu.org,
 integration@gluster.org, sheepdog@lists.wpkg.org, qemu-arm@nongnu.org,
 xen-devel@lists.xenproject.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [RFC v5 026/126] python: add commit-per-subsystem.py
Date: Fri, 11 Oct 2019 19:04:12 +0300
Message-Id: <20191011160552.22907-27-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191011160552.22907-1-vsementsov@virtuozzo.com>
References: <20191011160552.22907-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 185.231.240.75
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
X-List-Received-Date: Fri, 11 Oct 2019 16:08:09 -0000

Add script to automatically commit tree-wide changes per-subsystem.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---

CC: Gerd Hoffmann <kraxel@redhat.com>
CC: "Gonglei (Arei)" <arei.gonglei@huawei.com>
CC: Eduardo Habkost <ehabkost@redhat.com>
CC: Igor Mammedov <imammedo@redhat.com>
CC: Laurent Vivier <lvivier@redhat.com>
CC: Amit Shah <amit@kernel.org>
CC: Kevin Wolf <kwolf@redhat.com>
CC: Max Reitz <mreitz@redhat.com>
CC: John Snow <jsnow@redhat.com>
CC: Ari Sundholm <ari@tuxera.com>
CC: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
CC: Paolo Bonzini <pbonzini@redhat.com>
CC: Stefan Hajnoczi <stefanha@redhat.com>
CC: Fam Zheng <fam@euphon.net>
CC: Stefan Weil <sw@weilnetz.de>
CC: Ronnie Sahlberg <ronniesahlberg@gmail.com>
CC: Peter Lieven <pl@kamp.de>
CC: Eric Blake <eblake@redhat.com>
CC: "Denis V. Lunev" <den@openvz.org>
CC: Markus Armbruster <armbru@redhat.com>
CC: Alberto Garcia <berto@igalia.com>
CC: Jason Dillaman <dillaman@redhat.com>
CC: Wen Congyang <wencongyang2@huawei.com>
CC: Xie Changlong <xiechanglong.d@gmail.com>
CC: Liu Yuan <namei.unix@gmail.com>
CC: "Richard W.M. Jones" <rjones@redhat.com>
CC: Jeff Cody <codyprime@gmail.com>
CC: "Marc-André Lureau" <marcandre.lureau@redhat.com>
CC: "Daniel P. Berrangé" <berrange@redhat.com>
CC: Richard Henderson <rth@twiddle.net>
CC: Greg Kurz <groug@kaod.org>
CC: "Michael S. Tsirkin" <mst@redhat.com>
CC: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
CC: Beniamino Galvani <b.galvani@gmail.com>
CC: Peter Maydell <peter.maydell@linaro.org>
CC: "Cédric Le Goater" <clg@kaod.org>
CC: Andrew Jeffery <andrew@aj.id.au>
CC: Joel Stanley <joel@jms.id.au>
CC: Andrew Baumann <Andrew.Baumann@microsoft.com>
CC: "Philippe Mathieu-Daudé" <philmd@redhat.com>
CC: Antony Pavlov <antonynpavlov@gmail.com>
CC: Jean-Christophe Dubois <jcd@tribudubois.net>
CC: Peter Chubb <peter.chubb@nicta.com.au>
CC: Subbaraya Sundeep <sundeep.lkml@gmail.com>
CC: Eric Auger <eric.auger@redhat.com>
CC: Alistair Francis <alistair@alistair23.me>
CC: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Anthony Perard <anthony.perard@citrix.com>
CC: Paul Durrant <paul@xen.org>
CC: Paul Burton <pburton@wavecomp.com>
CC: Aleksandar Rikalo <arikalo@wavecomp.com>
CC: Chris Wulff <crwulff@gmail.com>
CC: Marek Vasut <marex@denx.de>
CC: David Gibson <david@gibson.dropbear.id.au>
CC: Cornelia Huck <cohuck@redhat.com>
CC: Halil Pasic <pasic@linux.ibm.com>
CC: Christian Borntraeger <borntraeger@de.ibm.com>
CC: "Hervé Poussineau" <hpoussin@reactos.org>
CC: Xiao Guangrong <xiaoguangrong.eric@gmail.com>
CC: Aurelien Jarno <aurelien@aurel32.net>
CC: Aleksandar Markovic <amarkovic@wavecomp.com>
CC: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
CC: Jason Wang <jasowang@redhat.com>
CC: Laszlo Ersek <lersek@redhat.com>
CC: Yuval Shaia <yuval.shaia@oracle.com>
CC: Palmer Dabbelt <palmer@sifive.com>
CC: Sagar Karandikar <sagark@eecs.berkeley.edu>
CC: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
CC: David Hildenbrand <david@redhat.com>
CC: Thomas Huth <thuth@redhat.com>
CC: Eric Farman <farman@linux.ibm.com>
CC: Matthew Rosato <mjrosato@linux.ibm.com>
CC: Hannes Reinecke <hare@suse.com>
CC: Michael Walle <michael@walle.cc>
CC: Artyom Tarasenko <atar4qemu@gmail.com>
CC: Stefan Berger <stefanb@linux.ibm.com>
CC: Samuel Thibault <samuel.thibault@ens-lyon.org>
CC: Alex Williamson <alex.williamson@redhat.com>
CC: Tony Krowiak <akrowiak@linux.ibm.com>
CC: Pierre Morel <pmorel@linux.ibm.com>
CC: Michael Roth <mdroth@linux.vnet.ibm.com>
CC: Hailiang Zhang <zhang.zhanghailiang@huawei.com>
CC: Juan Quintela <quintela@redhat.com>
CC: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
CC: Luigi Rizzo <rizzo@iet.unipi.it>
CC: Giuseppe Lettieri <g.lettieri@iet.unipi.it>
CC: Vincenzo Maffione <v.maffione@gmail.com>
CC: Jan Kiszka <jan.kiszka@siemens.com>
CC: Anthony Green <green@moxielogic.com>
CC: Stafford Horne <shorne@gmail.com>
CC: Guan Xuetao <gxt@mprc.pku.edu.cn>
CC: Max Filippov <jcmvbkbc@gmail.com>
CC: qemu-block@nongnu.org
CC: integration@gluster.org
CC: sheepdog@lists.wpkg.org
CC: qemu-arm@nongnu.org
CC: xen-devel@lists.xenproject.org
CC: qemu-ppc@nongnu.org
CC: qemu-s390x@nongnu.org
CC: qemu-riscv@nongnu.org

 python/commit-per-subsystem.py | 204 +++++++++++++++++++++++++++++++++
 1 file changed, 204 insertions(+)
 create mode 100755 python/commit-per-subsystem.py

diff --git a/python/commit-per-subsystem.py b/python/commit-per-subsystem.py
new file mode 100755
index 0000000000..2ccf84cb15
--- /dev/null
+++ b/python/commit-per-subsystem.py
@@ -0,0 +1,204 @@
+#!/usr/bin/env python3
+#
+# Copyright (c) 2019 Virtuozzo International GmbH
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program.  If not, see <http://www.gnu.org/licenses/>.
+#
+
+import subprocess
+import sys
+import os
+import glob
+
+
+def git_add(pattern):
+    subprocess.run(['git', 'add', pattern])
+
+
+def git_commit(msg):
+    subprocess.run(['git', 'commit', '-m', msg], capture_output=True)
+
+
+def git_changed_files():
+    ret = subprocess.check_output(['git', 'diff', '--name-only'], encoding='utf-8').split('\n')
+    if ret[-1] == '':
+        del ret[-1]
+    return ret
+
+
+maintainers = sys.argv[1]
+message = sys.argv[2].strip()
+
+subsystem = None
+
+remap = {
+    'Block layer core': 'block',
+    'Block Jobs': 'block',
+    'Dirty Bitmaps': 'block',
+    'Block QAPI, monitor, command line': 'block',
+    'Block I/O path': 'block',
+    'Throttling infrastructure': 'block',
+    'Architecture support': 's390x',
+    'Guest CPU Cores (KVM)': 'kvm',
+    'Guest CPU Cores (Xen)': 'xen',
+    'Guest CPU cores (TCG)': 'tcg',
+    'Network Block Device (NBD)': 'nbd',
+    'Parallel NOR Flash devices': 'pflash',
+    'Firmware configuration (fw_cfg)': 'fw_cfg',
+    'Block SCSI subsystem': 'scsi',
+    'Network device backends': 'net',
+    'Netmap network backend': 'net',
+    'Host Memory Backends': 'hostmem',
+    'Cryptodev Backends': 'cryptodev',
+    'QEMU Guest Agent': 'qga',
+    'COLO Framework': 'colo',
+    'Command line option argument parsing': 'cmdline',
+    'Character device backends': 'chardev'
+}
+
+
+class Maintainers:
+    def add(self, subsystem, path, mapper, mapper_name, glob_count=1):
+        if subsystem in remap:
+            subsystem = remap[subsystem]
+        if subsystem not in self.subsystems:
+            self.subsystems.append(subsystem)
+
+        if path[-1] == '/':
+            path = path[:-1]
+
+        if path in mapper:
+            if mapper[path][1] == glob_count:
+                print('Warning: "{}" both in "{}" and "{}" in {} mapper with '
+                      'same glob-count={}. {} ignored for this path.'.format(
+                        path, mapper[path][0], subsystem, mapper_name, glob_count,
+                          subsystem))
+                return
+            if mapper[path][1] < glob_count:
+                # silently ignore worse match
+                return
+
+        mapper[path] = (subsystem, glob_count)
+
+    def __init__(self, file_name):
+        self.map_file = {}
+        self.map_glob_file = {}
+        self.map_dir = {}
+        self.map_glob_dir = {}
+        self.map_unmaintained_dir = {
+            'python': ('python', 1),
+            'hw/misc': ('misc', 1)
+        }
+        self.subsystems = ['python', 'misc']
+        subsystem = None
+
+        with open(file_name) as f:
+            mode2 = False
+            prevline = ''
+            for line in f:
+                line = line.rstrip()
+                if not line:
+                    continue
+                if len(line) >= 2 and line[1] == ':':
+                    if line[0] == 'F':
+                        fname = line[3:]
+                        if fname in ['*', '*/']:
+                            continue
+                        if os.path.isfile(fname):
+                            self.add(subsystem, fname, self.map_file, 'file')
+                        elif os.path.isdir(fname):
+                            self.add(subsystem, fname, self.map_dir, 'dir')
+                        else:
+                            paths = glob.glob(fname)
+                            if not paths:
+                                print('Warning: nothing corresponds to "{}"'.format(fname))
+                                continue
+
+                            n = len(paths)
+                            for f in paths:
+                                if os.path.isfile(f):
+                                    self.add(subsystem, f, self.map_glob_file, 'glob-file', n)
+                                else:
+                                    assert os.path.isdir(f)
+                                    self.add(subsystem, f, self.map_glob_dir, 'glob-dir', n)
+                elif line[:3] == '---':
+                    subsystem = prevline
+                    if subsystem == 'Devices':
+                        mode2 = True
+                elif mode2:
+                    subsystem = line
+                prevline = line
+
+    def find_in_map_dir(self, file_name, mapper):
+        while file_name != '' and file_name not in mapper:
+            file_name = os.path.dirname(file_name)
+
+        return None if file_name == '' else mapper[file_name][0]
+
+    def find_in_map_file(self, file_name, mapper):
+        if file_name in mapper:
+            return mapper[file_name][0]
+
+    def find_subsystem(self, file_name):
+        s = self.find_in_map_file(file_name, self.map_file)
+        if s is not None:
+            return s
+
+        s = self.find_in_map_file(file_name, self.map_glob_file)
+        if s is not None:
+            return s
+
+        s = self.find_in_map_dir(file_name, self.map_dir)
+        if s is not None:
+            return s
+
+        s = self.find_in_map_dir(file_name, self.map_glob_dir)
+        if s is not None:
+            return s
+
+        s = self.find_in_map_dir(file_name, self.map_unmaintained_dir)
+        if s is not None:
+            return s
+
+        self.subsystems.append(file_name)
+        return file_name
+
+
+def commit(subsystem):
+    msg = subsystem
+    if msg in remap:
+        msg = remap[msg]
+    msg += ': ' + message
+    git_commit(msg)
+
+mnt = Maintainers(maintainers)
+res = {}
+for f in git_changed_files():
+    s = mnt.find_subsystem(f)
+    if s in res:
+        res[s].append(f)
+    else:
+        res[s] = [f]
+
+for s in mnt.subsystems:
+    if s in res:
+        print(s)
+        for f in res[s]:
+            print('  ', f)
+
+for s in mnt.subsystems:
+    if s in res:
+        for f in res[s]:
+            git_add(f)
+        commit(s)
-- 
2.21.0


