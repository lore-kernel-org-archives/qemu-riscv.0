Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mBhc4-0007eE-Ck
	for mharc-qemu-riscv@gnu.org; Thu, 05 Aug 2021 13:57:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruinland@andestech.com>)
 id 1mBhc3-0007de-8L; Thu, 05 Aug 2021 13:56:59 -0400
Received: from exmail.andestech.com ([60.248.187.195]:49199
 helo=ATCSQR.andestech.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruinland@andestech.com>)
 id 1mBhbz-0007nC-VA; Thu, 05 Aug 2021 13:56:58 -0400
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 175HuUWc055927;
 Fri, 6 Aug 2021 01:56:30 +0800 (GMT-8)
 (envelope-from ruinland@andestech.com)
Received: from atcfdc88.andestech.com (10.0.15.120) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0;
 Fri, 6 Aug 2021 01:56:31 +0800
From: Ruinland Chuan-Tzu Tsai <ruinland@andestech.com>
To: <qemu-devel@nongnu.org>, <qemu-riscv@nongnu.org>
CC: <ruinland@andestech.com>, <wangjunqiang@iscas.ac.cn>,
 <bin.meng@windriver.com>, Dylan Jhong <dylan@andestech.com>
Subject: [RFC PATCH v4 1/4] Add options to config/meson files for custom CSR
Date: Fri, 6 Aug 2021 01:56:23 +0800
Message-ID: <20210805175626.11573-2-ruinland@andestech.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20210805175626.11573-1-ruinland@andestech.com>
References: <20210805175626.11573-1-ruinland@andestech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.0.15.120]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 175HuUWc055927
Received-SPF: pass client-ip=60.248.187.195;
 envelope-from=ruinland@andestech.com; helo=ATCSQR.andestech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 05 Aug 2021 17:56:59 -0000

From: Ruinland ChuanTzu Tsai <ruinland@andestech.com>

Adding option `riscv_custom` to configure script, meson.build and
meson_options.txt so as to toggle custom CSR and will-be-upstreamed custom
instructions handling logic.

Signed-off-by: Dylan Jhong <dylan@andestech.com>
---
 configure         | 6 ++++++
 meson.build       | 2 ++
 meson_options.txt | 2 ++
 3 files changed, 10 insertions(+)

diff --git a/configure b/configure
index 34fccaa..88f6584 100755
--- a/configure
+++ b/configure
@@ -324,6 +324,7 @@ virtiofsd="auto"
 virtfs="auto"
 libudev="auto"
 mpath="auto"
+riscv_custom="auto"
 vnc="enabled"
 sparse="auto"
 vde="$default_feature"
@@ -1016,6 +1017,10 @@ for opt do
   ;;
   --enable-vnc) vnc="enabled"
   ;;
+  --enable-riscv-custom) riscv_custom="enabled"
+  ;;
+  --disable-riscv-custom) riscv_custom="disabled"
+  ;;
   --disable-gettext) gettext="disabled"
   ;;
   --enable-gettext) gettext="enabled"
@@ -6416,6 +6421,7 @@ NINJA=$ninja $meson setup \
         -Dcocoa=$cocoa -Dgtk=$gtk -Dmpath=$mpath -Dsdl=$sdl -Dsdl_image=$sdl_image \
         -Dvnc=$vnc -Dvnc_sasl=$vnc_sasl -Dvnc_jpeg=$vnc_jpeg -Dvnc_png=$vnc_png \
         -Dgettext=$gettext -Dxkbcommon=$xkbcommon -Du2f=$u2f -Dvirtiofsd=$virtiofsd \
+        -Driscv_custom=$riscv_custom \
         -Dcapstone=$capstone -Dslirp=$slirp -Dfdt=$fdt -Dbrlapi=$brlapi \
         -Dcurl=$curl -Dglusterfs=$glusterfs -Dbzip2=$bzip2 -Dlibiscsi=$libiscsi \
         -Dlibnfs=$libnfs -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
diff --git a/meson.build b/meson.build
index adeec15..736810e 100644
--- a/meson.build
+++ b/meson.build
@@ -1151,6 +1151,7 @@ config_host_data.set('HAVE_SYS_KCOV_H', cc.has_header('sys/kcov.h'))
 config_host_data.set('HAVE_SYSTEM_FUNCTION', cc.has_function('system', prefix: '#include <stdlib.h>'))
 
 config_host_data.set('CONFIG_PREADV', cc.has_function('preadv', prefix: '#include <sys/uio.h>'))
+config_host_data.set('CONFIG_RISCV_CUSTOM', get_option('riscv_custom').enabled())
 
 ignored = ['CONFIG_QEMU_INTERP_PREFIX'] # actually per-target
 arrays = ['CONFIG_AUDIO_DRIVERS', 'CONFIG_BDRV_RW_WHITELIST', 'CONFIG_BDRV_RO_WHITELIST']
@@ -2694,6 +2695,7 @@ summary_info += {'libpmem support':   config_host.has_key('CONFIG_LIBPMEM')}
 summary_info += {'libdaxctl support': config_host.has_key('CONFIG_LIBDAXCTL')}
 summary_info += {'libudev':           libudev.found()}
 summary_info += {'FUSE lseek':        fuse_lseek.found()}
+summary_info += {'RISC-V custom CSRs/instructions': get_option('riscv_custom').enabled()}
 summary(summary_info, bool_yn: true, section: 'Dependencies')
 
 if not supported_cpus.contains(cpu)
diff --git a/meson_options.txt b/meson_options.txt
index 9734019..470ef23 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -125,3 +125,5 @@ option('slirp', type: 'combo', value: 'auto',
 option('fdt', type: 'combo', value: 'auto',
        choices: ['disabled', 'enabled', 'auto', 'system', 'internal'],
        description: 'Whether and how to find the libfdt library')
+option('riscv_custom', type: 'feature', value: 'auto',
+       description: 'RISC-V custom')
-- 
2.32.0


