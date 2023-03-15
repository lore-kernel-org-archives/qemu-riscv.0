Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pcVAi-0002jq-ED
	for mharc-qemu-riscv@gnu.org; Wed, 15 Mar 2023 13:44:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pcVAW-0002V0-CW
 for qemu-riscv@nongnu.org; Wed, 15 Mar 2023 13:44:09 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pcVAD-0000kf-OH
 for qemu-riscv@nongnu.org; Wed, 15 Mar 2023 13:44:08 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 r19-20020a05600c459300b003eb3e2a5e7bso1832850wmo.0
 for <qemu-riscv@nongnu.org>; Wed, 15 Mar 2023 10:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678902228;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T6RLGTHhC06sRuIM9yfET4lS4kZArz0/fxEXCzYoxfU=;
 b=fAC659xuS6VIrapKxVxZijPxvTJ+M200zdixFycQ4ZQyCE4xdogcjlbnx5ylO7raI3
 Mioeq5gUp2xatTrlLObKIjRJiIZMkGK40hLku5wD95hLvWh8+yaj28gM9ventjH2lb0Y
 QboltHkPqa+zUNYNrbYNNeuyKZkfJmNq7i2BJSQIXHFqleW/XJULqIehs8MS8aQwPOxO
 zq5eWntd2e7g0ldMaXZWNx2PSK2pEMTq+XjR/9yli77fxfdhlFci6n5E/cy7yIVxUJcH
 DJQvGxC+QJtA3fqGC/CJa+HTivt+S5cx7DlcqQp7mewTUvXI3sNk/LYFVG3A3DRdobXp
 LhTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678902228;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T6RLGTHhC06sRuIM9yfET4lS4kZArz0/fxEXCzYoxfU=;
 b=Ttc78jkQZVH2ZmtISbWX3UMGJOcJ5OQ+H4+db3J5YW4/25TiQMPZ5HK+mQd2/CCSVF
 gF4TrEeaDjwl/Hy3+9nonXFOoTDgg8CRm7SorWID1g5aL+2IG+SFa/rQdofBB/txO7YI
 anLeg9msg4wBUGkZHXvV10V3LqY7jOCbGLiGq5FYhTJsjwsAarGzEeXzOxIZGEptk517
 q+6KfP1maoubFhrSBE0brolP+r3zJeC2WM+mk8QfPAGWY+TvBytOLYTt6rKcEOsfS9Bd
 RxLy64XCtvXZ8X3z8qQO7BHzxmIU1NfsV5r1+jO7N2aM46swtBStQ8MbitZs2MbIfyZ6
 y3kA==
X-Gm-Message-State: AO0yUKVoxke1wqE1LszWPxDowy/IzsnD6H7f66dJisELpSqkyDB3MHF9
 Brf+c7DaXDzAQ02Ju8ClkSw+pw==
X-Google-Smtp-Source: AK7set/hZ3pcHXsSSZgkXMxQ+czCLZcSYWiliPBIXbmMdxuSq5bYCGhTLHML615ocqdeqoOWxStnmQ==
X-Received: by 2002:a05:600c:5386:b0:3ed:301c:375c with SMTP id
 hg6-20020a05600c538600b003ed301c375cmr4569103wmb.21.1678902227806; 
 Wed, 15 Mar 2023 10:43:47 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 w17-20020adfd4d1000000b002c70ce264bfsm5141188wrk.76.2023.03.15.10.43.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 10:43:45 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E53981FFCC;
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
Subject: [PATCH v2 20/32] iotests: strip subdir path when listing tests
Date: Wed, 15 Mar 2023 17:43:19 +0000
Message-Id: <20230315174331.2959-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315174331.2959-1-alex.bennee@linaro.org>
References: <20230315174331.2959-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
X-List-Received-Date: Wed, 15 Mar 2023 17:44:12 -0000

From: Daniel P. Berrangé <berrange@redhat.com>

When asking 'check' to list individual tests by invoking it in dry run
mode, it prints the paths to the tests relative to the base of the
I/O test directory.

When asking 'check' to run an individual test, however, it mandates that
only the unqualified test name is given, without any path prefix. This
inconsistency makes it harder to ask for a list of tests and then invoke
each one.

Thus the test listing code is change to flatten the test names, by
printing only the base name, which can be directly invoked.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Acked-by: Hanna Czenczek <hreitz@redhat.com>
Tested-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230303160727.3977246-4-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/qemu-iotests/check | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
index bb294ef556..f2e9d27dcf 100755
--- a/tests/qemu-iotests/check
+++ b/tests/qemu-iotests/check
@@ -184,7 +184,7 @@ if __name__ == '__main__':
         sys.exit(str(e))
 
     if args.dry_run:
-        print('\n'.join(tests))
+        print('\n'.join([os.path.basename(t) for t in tests]))
     else:
         with TestRunner(env, tap=args.tap,
                         color=args.color) as tr:
-- 
2.39.2


