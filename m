Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pcVAj-0002mU-Cr
	for mharc-qemu-riscv@gnu.org; Wed, 15 Mar 2023 13:44:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pcVAT-0002Rv-0x
 for qemu-riscv@nongnu.org; Wed, 15 Mar 2023 13:44:05 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pcVAC-0000jf-6I
 for qemu-riscv@nongnu.org; Wed, 15 Mar 2023 13:44:04 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 r19-20020a05600c459300b003eb3e2a5e7bso1832806wmo.0
 for <qemu-riscv@nongnu.org>; Wed, 15 Mar 2023 10:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678902226;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ugIkozbEBGsoB+Byq329AMY9/YRtl8pDzh0Lm83ecO8=;
 b=tIL+RIXFEqvWvEoWx4NCa5UNyBZ5FgdDamUhA7TfuhyAyUWKPI7fQ+jTGj857GkDDt
 08o7Qt8ZCXFHs02L94g/4uYZtzgnSb/3kOagKIdp4HsCoOVszm8hb92m/WAS3Ae7Li7W
 THFfpbFcY/pBknstK7P+sA8AiV15PIe2xWHB1rKercXae8TgYEyF3SY8ZceZl5Eb8w+t
 5tYX8wnTFx9j1dF4uSkw9yxW170JPTe4pYGp3HL3JkreMfUrM76Jw2/SrRX6rmkP0s0c
 LrRDA7/jQw1+IDpSHLyuK16mHqnpRlZybQF37SbosnmzGm7EP306QhrgN6KP0vu5bBSB
 JeUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678902226;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ugIkozbEBGsoB+Byq329AMY9/YRtl8pDzh0Lm83ecO8=;
 b=u4mY+QRTz046TlqHfFa2UH/n1jToljyHUsblsiTy9gf6aGlh6E9io326CI/1k4eMIO
 Kph9F6GRohuOVVFI388uZDdJM7sHlrA3Yyvf6PMZ+TdHX9BWy5t3dbx8z8PBBzD44aIT
 r5oI5mC9AS9S8P6nqBP1EjPmOf9qblg+s05ajXuGiaTM7fiPGskrHRUfl8IeTXhc93DJ
 hQIz6gsX23YhRf3K+rEWVvja5A1urRCq9UqRxliF3hL+BYmbml/ibErjAgm2y6z4RaCu
 6TtVTik+eZ5ynQun+DitX/3o3tQsUv3OIQ3QYUhlGan3EbU336/Uf8Ctubf3G1krpQzc
 ekoQ==
X-Gm-Message-State: AO0yUKVjPgw6udyW2fkC5DrTEEUDEknurk4vD6jnbKXb0+KZQezGayVW
 7EJZAifa/OQgE0pUx7cKQdrgPQ==
X-Google-Smtp-Source: AK7set934fSOJYHu8semehokaML/wM+FYEjTaDVaztGT0aSCEP05FZuObq4Zjbt6dBx7saD9BHHiYw==
X-Received: by 2002:a05:600c:4712:b0:3df:e41f:8396 with SMTP id
 v18-20020a05600c471200b003dfe41f8396mr18760009wmo.37.1678902226589; 
 Wed, 15 Mar 2023 10:43:46 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a05600c21c200b003e1f2e43a1csm2478386wmj.48.2023.03.15.10.43.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 10:43:45 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AC4E31FFCA;
 Wed, 15 Mar 2023 17:43:43 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-riscv@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
 Igor Mammedov <imammedo@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Hao Wu <wuhaotsh@google.com>,
 Cleber Rosa <crosa@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-arm@nongnu.org, Marcelo Tosatti <mtosatti@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Alexandre Iooss <erdnaxe@crans.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, qemu-ppc@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Darren Kenny <darren.kenny@oracle.com>, kvm@vger.kernel.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stafford Horne <shorne@gmail.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
 Vijai Kumar K <vijai@behindbytes.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 David Gibson <david@gibson.dropbear.id.au>, Song Gao <gaosong@loongson.cn>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Greg Kurz <groug@kaod.org>,
 Laurent Vivier <laurent@vivier.eu>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Alexander Bulekov <alxndr@bu.edu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-block@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, David Woodhouse <dwmw2@infradead.org>,
 qemu-s390x@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Bandan Das <bsd@redhat.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Tyrone Ting <kfting@nuvoton.com>, Kevin Wolf <kwolf@redhat.com>,
 David Hildenbrand <david@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>, Paul Durrant <paul@xen.org>,
 Bin Meng <bin.meng@windriver.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Hanna Reitz <hreitz@redhat.com>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 18/32] iotests: explicitly pass source/build dir to 'check'
 command
Date: Wed, 15 Mar 2023 17:43:17 +0000
Message-Id: <20230315174331.2959-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315174331.2959-1-alex.bennee@linaro.org>
References: <20230315174331.2959-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 15 Mar 2023 17:44:05 -0000

From: Daniel P. Berrangé <berrange@redhat.com>

The 'check' script has some rather dubious logic whereby it assumes
that if invoked as a symlink, then it is running from a separate
source tree and build tree, otherwise it assumes the current working
directory is a combined source and build tree.

This doesn't work if you want to invoke the 'check' script using
its full source tree path while still using a split source and build
tree layout. This would be a typical situation with meson if you ask
it to find the 'check' script path using files('check').

Rather than trying to make the logic more magical, add support for
explicitly passing the dirs using --source-dir and --build-dir. If
either is omitted the current logic is maintained.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Acked-by: Hanna Czenczek <hreitz@redhat.com>
Tested-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230303160727.3977246-2-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/qemu-iotests/check      | 25 +++++++++++++++++++++++--
 tests/qemu-iotests/testenv.py | 13 ++++---------
 2 files changed, 27 insertions(+), 11 deletions(-)

diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
index 9bdda1394e..da7e8a87fe 100755
--- a/tests/qemu-iotests/check
+++ b/tests/qemu-iotests/check
@@ -26,9 +26,23 @@ from findtests import TestFinder
 from testenv import TestEnv
 from testrunner import TestRunner
 
+def get_default_path(follow_link=False):
+    """
+    Try to automagically figure out the path we are running from.
+    """
+    # called from the build tree?
+    if os.path.islink(sys.argv[0]):
+        if follow_link:
+            return os.path.dirname(os.readlink(sys.argv[0]))
+        else:
+            return os.path.dirname(os.path.abspath(sys.argv[0]))
+    else:  # or source tree?
+        return os.getcwd()
 
 def make_argparser() -> argparse.ArgumentParser:
-    p = argparse.ArgumentParser(description="Test run options")
+    p = argparse.ArgumentParser(
+        description="Test run options",
+        formatter_class=argparse.ArgumentDefaultsHelpFormatter)
 
     p.add_argument('-n', '--dry-run', action='store_true',
                    help='show me, do not run tests')
@@ -113,6 +127,11 @@ def make_argparser() -> argparse.ArgumentParser:
                        'middle of the process.')
     g_sel.add_argument('tests', metavar='TEST_FILES', nargs='*',
                        help='tests to run, or "--" followed by a command')
+    g_sel.add_argument('--build-dir', default=get_default_path(),
+                       help='Path to iotests build directory')
+    g_sel.add_argument('--source-dir',
+                       default=get_default_path(follow_link=True),
+                       help='Path to iotests build directory')
 
     return p
 
@@ -120,7 +139,9 @@ def make_argparser() -> argparse.ArgumentParser:
 if __name__ == '__main__':
     args = make_argparser().parse_args()
 
-    env = TestEnv(imgfmt=args.imgfmt, imgproto=args.imgproto,
+    env = TestEnv(source_dir=args.source_dir,
+                  build_dir=args.build_dir,
+                  imgfmt=args.imgfmt, imgproto=args.imgproto,
                   aiomode=args.aiomode, cachemode=args.cachemode,
                   imgopts=args.imgopts, misalign=args.misalign,
                   debug=args.debug, valgrind=args.valgrind,
diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
index a864c74b12..aa9d735414 100644
--- a/tests/qemu-iotests/testenv.py
+++ b/tests/qemu-iotests/testenv.py
@@ -170,7 +170,8 @@ def root(*names: str) -> str:
             if not isxfile(b):
                 sys.exit('Not executable: ' + b)
 
-    def __init__(self, imgfmt: str, imgproto: str, aiomode: str,
+    def __init__(self, source_dir: str, build_dir: str,
+                 imgfmt: str, imgproto: str, aiomode: str,
                  cachemode: Optional[str] = None,
                  imgopts: Optional[str] = None,
                  misalign: bool = False,
@@ -211,14 +212,8 @@ def __init__(self, imgfmt: str, imgproto: str, aiomode: str,
         # which are needed to initialize some environment variables. They are
         # used by init_*() functions as well.
 
-        if os.path.islink(sys.argv[0]):
-            # called from the build tree
-            self.source_iotests = os.path.dirname(os.readlink(sys.argv[0]))
-            self.build_iotests = os.path.dirname(os.path.abspath(sys.argv[0]))
-        else:
-            # called from the source tree
-            self.source_iotests = os.getcwd()
-            self.build_iotests = self.source_iotests
+        self.source_iotests = source_dir
+        self.build_iotests = build_dir
 
         self.build_root = os.path.join(self.build_iotests, '..', '..')
 
-- 
2.39.2


