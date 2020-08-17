Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k7atS-0003O0-4B
	for mharc-qemu-riscv@gnu.org; Mon, 17 Aug 2020 04:53:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7atQ-0003Jd-G0
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2020 04:53:24 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:36062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7atO-0005OD-NH
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2020 04:53:24 -0400
Received: by mail-pf1-x432.google.com with SMTP id m8so7909456pfh.3
 for <qemu-riscv@nongnu.org>; Mon, 17 Aug 2020 01:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=6kkcYautSYvytvSbaEQJQyjXHNh36DVL7LgNPrrKZR0=;
 b=Yf+JB7JGL3mKa2gEm/WdhCluqAQc/JagAXXbxYOY9irtKedfYxMWX1TqomFyAUjr5E
 z7aMt7EvlZYqZG/2a14t7C5eQIL9Jls6PSJ8cj10aanTv/k3Q1rK61H8UaGGN7eTLDWn
 Oj3XYR0OMyh5/rmBy2QbgOJYAS7zw74RA8StaN5gHy1F25tUeX9CdDqw7nRJEjnB4Q1+
 noCQ17BoApwE4PNahIXEq+E8qvZ4ggZf5spZl5Ibovi9sRQwPS09zBINK5hCi7VPJjDL
 JLrGyppErDq5BoqxhqjQfJ2uJE2+uReMqw3RuqeiLlBPLW47X1QhHw6XinJDBYHwaHPX
 g3mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=6kkcYautSYvytvSbaEQJQyjXHNh36DVL7LgNPrrKZR0=;
 b=pDaMj8Y0yN60B7QSLkU0SidPN3UkZndQW2zj7sgxgl31R63ao/sDzQrPNr7A5F0Clm
 0A+/CdKZGbnndYYwO1VfU64cLf4nOhiYi1/7OhcKqYZ+5C82BuLcZ5QFUunTw4xwur6V
 QQWaP1GcMvsGVvPocxvJjpvZpHNxBKWXR4O9ZjwZgBa526SGSbuKnBeWyBnN6EvxLlPS
 bCAxQyCeLx6C6OjVuLF4FEvNNJwZqu6F9UnwKCnJQYVoLLo4eiDyUa5qOUXkYVry6e5f
 fV4fDatTkMzw+yHsKsj05AyVDN8U85sNvuHIu/mnvjoG6FHl6OPLHfM0Pkl2yqRJaYMB
 PYHg==
X-Gm-Message-State: AOAM532lNy2Syq6Ni716sCinwLd5BpRHCy9Y0aO9AyHVqyzp95cLYASE
 opul3Meh6ux41IomnlhBJs6Adw==
X-Google-Smtp-Source: ABdhPJwfZcwwag2FneObXlOF+JimkHxftHRKnrG1uYpfC7q3nuq3d8e73t0subr8MW9m2BV4wiL9ng==
X-Received: by 2002:aa7:84d4:: with SMTP id x20mr10272819pfn.96.1597654401489; 
 Mon, 17 Aug 2020 01:53:21 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id d9sm16478588pgv.45.2020.08.17.01.53.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:53:21 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Greentime Hu <greentime.hu@sifive.com>,
 Frank Chang <frank.chang@sifive.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [RFC v4 70/70] target/riscv: gdb: support vector registers for rv32
Date: Mon, 17 Aug 2020 16:49:55 +0800
Message-Id: <20200817084955.28793-71-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817084955.28793-1-frank.chang@sifive.com>
References: <20200817084955.28793-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x432.google.com
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
X-List-Received-Date: Mon, 17 Aug 2020 08:53:24 -0000

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


