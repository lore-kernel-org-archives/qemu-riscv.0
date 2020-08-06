Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k3dTW-0005Hs-HS
	for mharc-qemu-riscv@gnu.org; Thu, 06 Aug 2020 06:50:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dTU-0005Bw-HM
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:50:16 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:35945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dTS-00089X-AO
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:50:16 -0400
Received: by mail-pl1-x62f.google.com with SMTP id y6so133303plt.3
 for <qemu-riscv@nongnu.org>; Thu, 06 Aug 2020 03:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=6kkcYautSYvytvSbaEQJQyjXHNh36DVL7LgNPrrKZR0=;
 b=eCoTS1Kq8IRCCVg6erfCtL23hQzWqdQvZL0iteV1s8A4mAqF/Zk7A+1bb2K8TtBulp
 4F2KhN9uvcT/7LvMr2AuATZojggLa+MH4K9PRoPpFa/2fDli3rSBsY68tDRJi+pReRTg
 sP+DpM0lMKVr6+5frx98nZw3lLSvj/761C9rmPUEGQXejTbKfkZn/fyLTkrM2Zg0gdaG
 ndzbEmOFfz+mlW+7kZVT+4vQO6/mVyghZIVULeaGAC345zTFEHJ4DMH0Rga1KjbLOhZA
 ozivOAA2Zqv2DtK/GXRrXWx8KEnP4c3AdiYfkfGj3HVtY7XlX3hDjCdoeXTzRjD7oO2E
 Autw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=6kkcYautSYvytvSbaEQJQyjXHNh36DVL7LgNPrrKZR0=;
 b=Tzzaw8GK0rs4KFEpeAW6zjF6niO/r9/LBTusZqZvFFYMtmkmZjftn8ZNspP4Iy0VLU
 pfWLCGfm8IHbdauCg8d8w8ERmpCLIfW+okyshU5EZKz2VjHOfr0TqHb9hrAMH9NtRgPh
 C1IWiaEAXICfee7gPTswwMi+brvvOUP+KI7S/XcWZHY1hJ0n26u790DlZMwuIVdRcALO
 zssZT47+H/PPITrMo8T6bBfl7zR9g6dNipO2QkLes6IBmNYu1qJZvyjBPOcQ6T2Jtku0
 nDZiRFhrM0Y4oHXtAQS3XUs8mjMETnAi9rdhAd56n0uuX1eLAk/P6gjV0exWvGFNSsRi
 s8Yw==
X-Gm-Message-State: AOAM533oOOr0gck9xD218xxZ+HUIkCEBbqZ8gAHkqiF2SLy3tfaIO6ms
 z1SHwVQAhZ0qdiY4Ow5Ki81dYzAa/uI=
X-Google-Smtp-Source: ABdhPJzeqN9C5B5Zapl4bF8WpqKGNPOeFTpNGCKDHqrPp7NiJED4dPgNW5cORvu1ldO/Bd7yQ9Q42w==
X-Received: by 2002:a17:90b:4d0f:: with SMTP id
 mw15mr7596121pjb.174.1596711012884; 
 Thu, 06 Aug 2020 03:50:12 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id f18sm6567309pgv.84.2020.08.06.03.50.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2020 03:50:12 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Greentime Hu <greentime.hu@sifive.com>,
 Frank Chang <frank.chang@sifive.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [RFC v3 71/71] target/riscv: gdb: support vector registers for rv32
Date: Thu,  6 Aug 2020 18:47:08 +0800
Message-Id: <20200806104709.13235-72-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806104709.13235-1-frank.chang@sifive.com>
References: <20200806104709.13235-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62f.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 06 Aug 2020 10:50:17 -0000

From: Greentime Hu <greentime.hu@sifive.com>

This patch adds vector support for rv32 gdb. It allows gdb client to access
vector registers correctly.

Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 gdb-xml/riscv-32bit-csr.xml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/gdb-xml/riscv-32bit-csr.xml b/gdb-xml/riscv-32bit-csr.xml
index 3d2031da7dc..bb98b927995 100644
--- a/gdb-xml/riscv-32bit-csr.xml
+++ b/gdb-xml/riscv-32bit-csr.xml
@@ -248,4 +248,11 @@
   <reg name="mucounteren" bitsize="32"/>
   <reg name="mscounteren" bitsize="32"/>
   <reg name="mhcounteren" bitsize="32"/>
+  <reg name="vstart" bitsize="32" group="vector"/>
+  <reg name="vxsat" bitsize="32" group="vector"/>
+  <reg name="vxrm" bitsize="32" group="vector"/>
+  <reg name="vcsr" bitsize="32" group="vector"/>
+  <reg name="vl" bitsize="32" group="vector"/>
+  <reg name="vtype" bitsize="32" group="vector"/>
+  <reg name="vlenb" bitsize="32" group="vector"/>
 </feature>
-- 
2.17.1


