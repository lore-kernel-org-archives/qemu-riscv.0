Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jZdp5-0007iW-2j
	for mharc-qemu-riscv@gnu.org; Fri, 15 May 2020 13:08:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jZdp4-0007gh-2n
 for qemu-riscv@nongnu.org; Fri, 15 May 2020 13:08:34 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:49152
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jZdp3-0002yK-3R
 for qemu-riscv@nongnu.org; Fri, 15 May 2020 13:08:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589562512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AfdJ0fb3pUn/q8r2VJ/7T43bIwJswLi3uwi/HIViWEU=;
 b=MY3C7FUbGfqVsl/pd4R3KXkXOzkJyvO+TAn+NJSux5G2OyTq/B3V90LfBNL5AC3iDcpbp9
 oKQrXDzpk6z1SL9+Ym2cH9oYzhkpu7lcM+tF/xz79fj72XAFGAzjMp58yPSN2XBHFeh+LR
 cU8gs5vp3vqngDe54nIjamQoEDqdOzA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-aHMmWTPJMYu14IQMeKct2A-1; Fri, 15 May 2020 13:08:30 -0400
X-MC-Unique: aHMmWTPJMYu14IQMeKct2A-1
Received: by mail-wr1-f70.google.com with SMTP id y4so1464114wrw.20
 for <qemu-riscv@nongnu.org>; Fri, 15 May 2020 10:08:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AfdJ0fb3pUn/q8r2VJ/7T43bIwJswLi3uwi/HIViWEU=;
 b=JKNxRXma8OhxZYxKO/XQQMtqWi9aDFhURjSeyI0zWViEZF9i+Czv9xzpZ0XAliiNGb
 tvAlkE6rRLLmcmIwC6qhCF0K+KvalwjPuqgULmfnte/VEk5/nS2fA12oiqA+W8lRXed4
 c7gKZbDbqGmzm5/XUYHALoYHcZJl0FaGC/SS7inC5hjACkwT8d5e1UdlfxgpmriiFepM
 fTE3Rp5nUGfx8LDVGE1Ne+LVcIee814erJftGAv+Mqrdwqg9N0MQT/3IQdo1MzpgmfNJ
 ztIkinf3isn9mAtsXBMPjhdLU0UqaiuvY/mQjwfqFPaA7znjV5aOP5/oh8pFYA9DIVkA
 SUtg==
X-Gm-Message-State: AOAM532oaocKGY0lRNQrWOZ8cIyTldbYHu2phhFaPRB+bCRvZqarHb+n
 l3RdTCuXjICOQDICD8etLtBVLKFyiDeNh+RIL8FWf/8LV+UR2iASnu+PUMNkPbnVk+TutYuYwVP
 J9jQQGz22+PRKMuI=
X-Received: by 2002:adf:ca0e:: with SMTP id o14mr5606792wrh.254.1589562509777; 
 Fri, 15 May 2020 10:08:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxAbObSmIItKQqzcQRay2wcjdeHRGWr/x8AnwNFoDgTaqxsJ7xG7Wx6UcpQIJzPgmGLRh9y9Q==
X-Received: by 2002:adf:ca0e:: with SMTP id o14mr5606762wrh.254.1589562509614; 
 Fri, 15 May 2020 10:08:29 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id s67sm4362738wmf.3.2020.05.15.10.08.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 10:08:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Max Filippov <jcmvbkbc@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Richard Henderson <rth@twiddle.net>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Chris Wulff <crwulff@gmail.com>, qemu-riscv@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Marek Vasut <marex@denx.de>, Michael Walle <michael@walle.cc>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Emilio G . Cota" <cota@braap.org>, David Hildenbrand <david@redhat.com>
Subject: [PATCH v2 04/10] accel/tcg: Add stub for probe_access()
Date: Fri, 15 May 2020 19:07:58 +0200
Message-Id: <20200515170804.5707-5-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200515170804.5707-1-philmd@redhat.com>
References: <20200515170804.5707-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/15 00:39:12
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Fri, 15 May 2020 17:08:34 -0000

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The TCG helpers where added in b92e5a22ec3 in softmmu_template.h.
probe_write() was added in there in 3b4afc9e75a to be moved out
to accel/tcg/cputlb.c in 3b08f0a9254, and was later refactored
as probe_access() in c25c283df0f.
Since it is a TCG specific helper, add a stub to avoid failures
when building without TCG, such:

  target/arm/helper.o: In function `probe_read':
  include/exec/exec-all.h:362: undefined reference to `probe_access'

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Cc: Richard Henderson <rth@twiddle.net>
Cc: Emilio G. Cota <cota@braap.org>
Cc: Alex Bennée <alex.bennee@linaro.org>
Cc: David Hildenbrand <david@redhat.com>
---
 accel/stubs/tcg-stub.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/accel/stubs/tcg-stub.c b/accel/stubs/tcg-stub.c
index 677191a69c..e4bbf997aa 100644
--- a/accel/stubs/tcg-stub.c
+++ b/accel/stubs/tcg-stub.c
@@ -22,3 +22,10 @@ void tb_flush(CPUState *cpu)
 void tlb_set_dirty(CPUState *cpu, target_ulong vaddr)
 {
 }
+
+void *probe_access(CPUArchState *env, target_ulong addr, int size,
+                   MMUAccessType access_type, int mmu_idx, uintptr_t retaddr)
+{
+     /* Handled by hardware accelerator. */
+     g_assert_not_reached();
+}
-- 
2.21.3


