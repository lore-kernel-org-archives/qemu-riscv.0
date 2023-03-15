Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pcVPO-0005r2-KY
	for mharc-qemu-riscv@gnu.org; Wed, 15 Mar 2023 13:59:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pcVPM-0005nq-8l
 for qemu-riscv@nongnu.org; Wed, 15 Mar 2023 13:59:28 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pcVPG-0004BT-Ll
 for qemu-riscv@nongnu.org; Wed, 15 Mar 2023 13:59:27 -0400
Received: by mail-wr1-x436.google.com with SMTP id h17so4083224wrt.8
 for <qemu-riscv@nongnu.org>; Wed, 15 Mar 2023 10:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678903161;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sjLPfMQH5X3r4H7gOQMwsuYoqZ/Fp9APWUTkT22J5Kc=;
 b=dVinq+voLjrtHUA3P8k2xpNisamNSKAls/++1xEuwYv3hEbYbc07C28s+sHxXJmHhp
 itli+/YI/vLPImSWf/RCJuJzA395V8De3CfugVNhn0sK7s8fDZnnnSYbE8SssRHEAzNL
 RdGpdqYbBlqPtrfYyQsJKYuhtwlneVAoxHhsGySUlCo6foDord/wVmmbfXHzVxnoF2Gv
 KXQq4mbur/KAJbFpH1VMuYer1QSqVdPP94dR54tBFOo+jG0jonVO0e2iuaApf3ytEPWi
 as2KLfQcpXrDt0Sedn4kLK56Oog315V/z72BXQVG/7W7b+ZpmO8qsR6X5JovNnepDgGp
 bU6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678903161;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sjLPfMQH5X3r4H7gOQMwsuYoqZ/Fp9APWUTkT22J5Kc=;
 b=oAT7vgUciknc7OFLUc+o7K83x9RR5igBme2cP/LGgr9qwJWHLXRyEIyTM1IfMINYmF
 lwebAIshnxurBVXNfE/Uws8liHgACHlFCpu7QppHPEUg+vfs5LHAvdIZMs6H6WjXyh6B
 9SIDz6C3UG6y5lQDCPFpm+Zx+vFpjnZr13+of0UupgnFqiuNzHpdMAI61EBpe2YPuL6/
 YCSgbxJFAKYHyUKYJSyyh9dJ/8PlXvGOnlJmKn/5ANs1pU/zt2OYRot4LIeOgqHZMyvN
 YtmXwgDnjV0XjhTCsjJL8+8RRFoCTISyNbTWnUhn3jxiPHzDbdhHQC+J183+cJRBntKs
 KqMw==
X-Gm-Message-State: AO0yUKVLuP5cCHOOQiEdypwcFPf0PeV/nHYeQf/fdD0dPOTHbhFFuwZp
 iMOjDcfFVK6xOdqp/rL0EKQBng==
X-Google-Smtp-Source: AK7set802G/CXLCS9yi2aAzotf3LTQqa9PQAR6GfQ5rYk/aiy7ZlgT5v1c0TFRsKs4/yEFhxIoHeew==
X-Received: by 2002:adf:d849:0:b0:2cf:ecbf:402f with SMTP id
 k9-20020adfd849000000b002cfecbf402fmr2395365wrl.15.1678903160831; 
 Wed, 15 Mar 2023 10:59:20 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 i9-20020a5d5589000000b002c553e061fdsm5150678wrv.112.2023.03.15.10.59.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 10:59:20 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2A1221FFBD;
 Wed, 15 Mar 2023 17:43:44 +0000 (GMT)
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
Subject: [PATCH v2 22/32] iotests: connect stdin to /dev/null when running
 tests
Date: Wed, 15 Mar 2023 17:43:21 +0000
Message-Id: <20230315174331.2959-23-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315174331.2959-1-alex.bennee@linaro.org>
References: <20230315174331.2959-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
X-List-Received-Date: Wed, 15 Mar 2023 17:59:29 -0000

From: Daniel P. Berrangé <berrange@redhat.com>

Currently the tests have their stdin inherited from the test harness,
meaning they are connected to a TTY. The QEMU processes spawned by
certain tests, however, modify TTY settings and if the test exits
abnormally the settings might not be restored.

The python test harness thus has some logic which will capture the
initial TTY settings and restore them once all tests are finished.

This does not, however, take into account the possibility of many
copies of the 'check' program running in parallel. With parallel
execution, a later invokation may save the TTY state that QEMU has
already modified, and thus restore bad state leaving the TTY
non-functional.

None of the I/O tests shnould actually be interactive requiring
user input and so they should not require a TTY at all. To avoid
this while TTY save/restore complexity we can connect the test
stdin to /dev/null instead.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Acked-by: Hanna Czenczek <hreitz@redhat.com>
Tested-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230303160727.3977246-6-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/qemu-iotests/testrunner.py | 22 ++--------------------
 1 file changed, 2 insertions(+), 20 deletions(-)

diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
index e734800b3d..81519ed6e2 100644
--- a/tests/qemu-iotests/testrunner.py
+++ b/tests/qemu-iotests/testrunner.py
@@ -24,12 +24,10 @@
 import subprocess
 import contextlib
 import json
-import termios
 import shutil
 import sys
 from multiprocessing import Pool
-from contextlib import contextmanager
-from typing import List, Optional, Iterator, Any, Sequence, Dict, \
+from typing import List, Optional, Any, Sequence, Dict, \
         ContextManager
 
 from testenv import TestEnv
@@ -56,22 +54,6 @@ def file_diff(file1: str, file2: str) -> List[str]:
         return res
 
 
-# We want to save current tty settings during test run,
-# since an aborting qemu call may leave things screwed up.
-@contextmanager
-def savetty() -> Iterator[None]:
-    isterm = sys.stdin.isatty()
-    if isterm:
-        fd = sys.stdin.fileno()
-        attr = termios.tcgetattr(fd)
-
-    try:
-        yield
-    finally:
-        if isterm:
-            termios.tcsetattr(fd, termios.TCSADRAIN, attr)
-
-
 class LastElapsedTime(ContextManager['LastElapsedTime']):
     """ Cache for elapsed time for tests, to show it during new test run
 
@@ -169,7 +151,6 @@ def __enter__(self) -> 'TestRunner':
         self._stack = contextlib.ExitStack()
         self._stack.enter_context(self.env)
         self._stack.enter_context(self.last_elapsed)
-        self._stack.enter_context(savetty())
         return self
 
     def __exit__(self, exc_type: Any, exc_value: Any, traceback: Any) -> None:
@@ -294,6 +275,7 @@ def do_run_test(self, test: str, mp: bool) -> TestResult:
         t0 = time.time()
         with f_bad.open('w', encoding="utf-8") as f:
             with subprocess.Popen(args, cwd=str(f_test.parent), env=env,
+                                  stdin=subprocess.DEVNULL,
                                   stdout=f, stderr=subprocess.STDOUT) as proc:
                 try:
                     proc.wait()
-- 
2.39.2


