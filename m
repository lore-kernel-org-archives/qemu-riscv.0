Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pcVPL-0005nH-Ai
	for mharc-qemu-riscv@gnu.org; Wed, 15 Mar 2023 13:59:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pcVPJ-0005mK-OM
 for qemu-riscv@nongnu.org; Wed, 15 Mar 2023 13:59:26 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pcVPG-0004B6-Ey
 for qemu-riscv@nongnu.org; Wed, 15 Mar 2023 13:59:25 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 fm20-20020a05600c0c1400b003ead37e6588so1591552wmb.5
 for <qemu-riscv@nongnu.org>; Wed, 15 Mar 2023 10:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678903160;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UdK4L7buRJRBhWENt6vEwjRP9U71/totQZg0N/PH0dY=;
 b=WfOmM7Pmqts8fO7pZEN4UjzlRO6WiUa6G4uOEWiBLr8cfUVMXdV80VYlYbohHUPOAB
 CdkeXPU0/cAeYi0S8fLOeCtDY68+LpcAYRA3Cggm6798NgIBjmxQQrPdf5wLV5v2oxZo
 S3TLlhCvGmC6K0kZM5X9DgypJ8EwgBciy69riFL4SZ2zHvY4guRshb0x5EAdHfonyUpp
 b/VrsSJ3ZPxtIlTvD1ejvzCjej/h0y6Xz/2TtkkrqHo5NcL62/P8nJBmhAb1LmCej27o
 Pzp9ePLOiRX+cTDne9OjTkN767wM3QBkQQvM+CJU7KUJ4mQVOycniOj36vtEB7bD+7CW
 ZQew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678903160;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UdK4L7buRJRBhWENt6vEwjRP9U71/totQZg0N/PH0dY=;
 b=LLp4TrggU/D3tqpAqpiiSIA5BmJSUG1aZI7NEyUYrhNBk9x6wLyeA33v95iE6BvsyT
 3ooSPhefN4qXDtTP8Uwk7s11EXtCqxbIJObDq/eErVrcMJaVErUDk23ixMirMr1EJWQQ
 LVYA0iTA7DCk9Oduuu+LWwQhVH/dRuTTt05sVLQckStgc1u5G21oRAllDvcwwjPFA4FV
 diVOdQADfqwANfgieghLcgir5/NaueX4UPoQRlCVVdJcdx8Cu7bZPvLPgS1Oc4pPni4j
 bUkncLRuTMsd9t39yJwJLcW3F9XTpmD25w07JRFKja8HMwL+ZE5NZlPJIL2U1f03yq7q
 0YSA==
X-Gm-Message-State: AO0yUKWGED+0lb8HMvaf8nsyH6V1A/J6oi2wN6P/nF3u3zhMTtSTkRGw
 zL1Gjq4Tima0BXTi505TNQIi2w==
X-Google-Smtp-Source: AK7set+9OzK5yNsExZae8z8rXhOX3AKBlkokIMl0uh6319WCOm8yvPXFNP/inALuD9U7quP1gYpp2g==
X-Received: by 2002:a05:600c:450d:b0:3ed:314a:326c with SMTP id
 t13-20020a05600c450d00b003ed314a326cmr3501284wmo.11.1678903160398; 
 Wed, 15 Mar 2023 10:59:20 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 l26-20020a05600c2cda00b003dd1bd0b915sm2704802wmc.22.2023.03.15.10.59.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 10:59:20 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7E9E11FFD0;
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
Subject: [PATCH v2 25/32] iotests: remove the check-block.sh script
Date: Wed, 15 Mar 2023 17:43:24 +0000
Message-Id: <20230315174331.2959-26-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315174331.2959-1-alex.bennee@linaro.org>
References: <20230315174331.2959-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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
X-List-Received-Date: Wed, 15 Mar 2023 17:59:26 -0000

From: Daniel P. Berrangé <berrange@redhat.com>

Now that meson directly invokes the individual I/O tests, the
check-block.sh wrapper script is no longer required.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Acked-by: Hanna Czenczek <hreitz@redhat.com>
Tested-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230303160727.3977246-9-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/check-block.sh | 43 -------------------------------------------
 1 file changed, 43 deletions(-)
 delete mode 100755 tests/check-block.sh

diff --git a/tests/check-block.sh b/tests/check-block.sh
deleted file mode 100755
index 5de2c1ba0b..0000000000
--- a/tests/check-block.sh
+++ /dev/null
@@ -1,43 +0,0 @@
-#!/bin/sh
-
-if [ "$#" -eq 0 ]; then
-    echo "Usage: $0 fmt..." >&2
-    exit 99
-fi
-
-# Honor the SPEED environment variable, just like we do it for "meson test"
-format_list="$@"
-if [ "$SPEED" = "slow" ] || [ "$SPEED" = "thorough" ]; then
-    group=
-else
-    group="-g auto"
-fi
-
-skip() {
-    echo "1..0 #SKIP $*"
-    exit 0
-}
-
-if [ -z "$(find . -name 'qemu-system-*' -print)" ]; then
-    skip "No qemu-system binary available ==> Not running the qemu-iotests."
-fi
-
-cd tests/qemu-iotests
-
-# QEMU_CHECK_BLOCK_AUTO is used to disable some unstable sub-tests
-export QEMU_CHECK_BLOCK_AUTO=1
-export PYTHONUTF8=1
-# If make was called with -jN we want to call ./check with -j N. Extract the
-# flag from MAKEFLAGS, so that if it absent (or MAKEFLAGS is not defined), JOBS
-# would be an empty line otherwise JOBS is prepared string of flag with value:
-# "-j N"
-# Note, that the following works even if make was called with "-j N" or even
-# "--jobs N", as all these variants becomes simply "-jN" in MAKEFLAGS variable.
-JOBS=$(echo "$MAKEFLAGS" | sed -n 's/\(^\|.* \)-j\([0-9]\+\)\( .*\|$\)/-j \2/p')
-
-ret=0
-for fmt in $format_list ; do
-    ${PYTHON} ./check $JOBS -tap -$fmt $group || ret=1
-done
-
-exit $ret
-- 
2.39.2


