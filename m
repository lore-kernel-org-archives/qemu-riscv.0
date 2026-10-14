Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE9DBCC6B1D
	for <qemu-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 09:37:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xGvMx-00042Y-Aa; Wed, 14 Oct 2026 05:33:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xGvMs-0003tT-C1
 for qemu-riscv@nongnu.org; Wed, 14 Oct 2026 05:33:51 -0400
Received: from mail-dl1-x1234.google.com ([2607:f8b0:4864:20::1234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xGvMp-0000Wu-6I
 for qemu-riscv@nongnu.org; Wed, 14 Oct 2026 05:33:49 -0400
Received: by mail-dl1-x1234.google.com with SMTP id
 a92af1059eb24-15943c9c005so1160275c88.1
 for <qemu-riscv@nongnu.org>; Wed, 14 Oct 2026 02:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791970425; x=1792575225; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Nef3vG5EzYDKP8J72V8FVPzgjgMdn21rsBU8WQpi2Jk=;
 b=pKtiYRjHjGOq3ErIc5eUPU/BBaPglHU1R1cau/KxOUQ8Kg3x3Lm6HsFYv6Zfv0lsyU
 8CElb/koc9DN100ruRYh81TRsltKT6LYjkCcLUPsLNRACQ1YRfhMS0Gp7fYCRwMSJZ6A
 KunFceg/MF8LNhBWStey847Yaj5iBrlLPSH1AACJ2znKLHhdQO8c6DSvxDD4QFjWqQvO
 +4zdEhs7fKtgfZP72CFfvs7zR7KwUEPggdtH4Y/MEFREgjt+V19dIMpyb9H6JZsjs6LH
 w+GbTDUNCy9LWaIMNRyHdhhO7NJTXvMrKvs74InjCVfBOnd6y+pzg+iGa6UZPKlXvSkU
 Jfzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791970425; x=1792575225;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Nef3vG5EzYDKP8J72V8FVPzgjgMdn21rsBU8WQpi2Jk=;
 b=OPS+XDXbDxL89voMfQ6/8DURS21v5O5p51LmJvSTmDtklAD9VB0VYUSa6uYGN2LSiS
 25vD2kOymNzDCrygopGAfWHUPJJiSQf+ENap0hPSnQmAEilMzOvBiJDPRfFMwIQCbZ4P
 HEmMatNg2L3W8UIRcd2PgxeFhRNXfKRy2Q2v/uc9ESoPqXKaHIMGI0DnOgdzyVVMJKhY
 bWg6Xs3Xp5u4RNwNvHUU0d2MU9/1LkYQBe/o40jdDJlgwMwhAIv9CDyGNeUq7P8eG2JE
 FJZc5zIruiJvGCSM+KdhMx6zZhbT8CUBWyRWJkOARHZvOgmHZ0HoQZpIos+BtwS0MuCm
 TXMw==
X-Forwarded-Encrypted: i=1;
 AKwUvBysnx6ihNhxO+qR8cG37OKSFAbMz9hO8CbTY2KzyMMTDZUvU+3KJXxGa4QBDAe9zozGQvnH1+daXC/y@nongnu.org
X-Gm-Message-State: AFq9FYK9dSD17oC+H1FrtHVt5LXCAvGLcLsD+h4ut/D9iJhIhnS739oz
 nesj35hZ0YfTZYCa8SxYf5Nz2RhEI+uAZDbIJExPC6Q0l8dkUjcilpGY
X-Gm-Gg: AYBFou1uzOWsw4lJksLkgaedXuIOAFwgw6kJFLKDMyCUzf3gdfRtKvRSFzho2Wvc2Im
 g3mEf0gX/CB6vNTOMYL7XqKz4Xm51FKBRyk3PfCvob6bFyppFuyy0NSvt5CukCchGChb2oCfzsu
 f3/XLN9MWr99ObKBGZZ7OKPXgN3o4VWzaRPtXMPP6cc4oGkf4yH0/PFn7ZsH00HIclFK1GWJ+Qj
 z94MifM7ukEf4xCkTImdgOhdgnsqGCgsWOQdpUzGQlg3Uva05Qa4Sm+En80ltYr6Un/e1l++r6a
 cRgCdk74YW5b5Qt5ky2QtTnRooTwt8R3rIeQnZ1D/6n4SEvFVcelJD6GJrYrw+l89cj2fxuYZy6
 i+vE0tXCisN6u/RFUmDgcVwhsez7QH3Cvm3JmBWZIVhZIOkq3Ho9mTG4UuihVyO1qzQkRH3EoZQ
 Rt5fLxjQVxtqYS6jA58y8okGC2lAd3ZMGriaojsifvN9kB3lqOiqN/EcA7V2XSgsQesqyS4OVMS
 FrKPQRKy9RRPLYiYA==
X-Received: by 2002:a05:701b:2713:b0:168:6ad8:e8b0 with SMTP id
 a92af1059eb24-16a6187f095mr23321482c88.14.1791970425436; 
 Wed, 14 Oct 2026 02:33:45 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-1698de65af7sm48769303c88.0.2026.10.14.02.33.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2026 02:33:44 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-s390x@nongnu.org, Song Gao <17746591750@163.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Eric Farman <farman@linux.ibm.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Ani Sinha <anisinha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stafford Horne <shorne@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>, Weiwei Li <liwei1518@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 David Hildenbrand <david@kernel.org>, Laurent Vivier <laurent@vivier.eu>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Fam Zheng <fam@euphon.net>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-arm@nongnu.org,
 Chao Liu <chao.liu@processmission.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH 10/34] meson: collect Rust crates for combined system target
Date: Wed, 14 Oct 2026 17:31:20 +0800
Message-ID: <20261014093152.834-11-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261014093152.834-1-luoyonggang@gmail.com>
References: <20261014093152.834-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1234;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl1-x1234.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

multi_target_crates += main_rs is not fine, that may repeat crates.
So we need collect crates from different $arch directly, and unique
them to a new list. then reuse 'rust_multi_target.rs' to generate it
properly

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 meson.build | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 3460d031a95..f54687e19dc 100644
--- a/meson.build
+++ b/meson.build
@@ -4431,7 +4431,11 @@ foreach target : target_dirs
       multi_target_libs += lib
       multi_target_deps += arch_deps
       multi_target_deps += target_stubs
-      multi_target_crates += main_rs
+      foreach crate : crates
+        if crate not in multi_target_crates
+          multi_target_crates += crate
+        endif
+      endforeach
     endif
     execs = [{
       'name': 'qemu-system-' + target_name,
@@ -4516,6 +4520,18 @@ endforeach
 
 # Other build targets
 
+# Use collected crate names, not per-target main_rs sources, for the combined root.
+if multi_target_crates.length() > 0
+  multi_target_crates = custom_target(
+    'rust_multi_target.rs',
+    output: 'rust_multi_target.rs',
+    command: [rust_root_crate, multi_target_crates],
+    capture: true,
+    build_always_stale: true,
+  )
+  multi_target_crates = structured_sources(multi_target_crates)
+endif
+
 multi_target_objects = []
 foreach lib: multi_target_libs
   multi_target_objects += lib.extract_all_objects(recursive: true)
-- 
2.55.0.windows.3


