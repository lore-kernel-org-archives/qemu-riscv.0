Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jbrLy-0004rM-L3
	for mharc-qemu-riscv@gnu.org; Thu, 21 May 2020 15:59:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jbrLx-0004lp-4e
 for qemu-riscv@nongnu.org; Thu, 21 May 2020 15:59:41 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:39354
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jbrLv-0008Kp-QC
 for qemu-riscv@nongnu.org; Thu, 21 May 2020 15:59:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590091179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gy7eiStux+gIOMgnul3BY8RTTpwPoXMNvRdb9ailA+g=;
 b=UvRkVDA8pH+0oA6/vcFLA4ZfxqDx2xXqoqlwXHxRUy+ljNiCaQ/SFnbf/hj1HfGvgymYbe
 6mBj89LjZjo/srNOoeHhh0H9Svk3cw9ufWZDomxW992vYShlvvVlSarMfS065ZVmi7Bglp
 D8aUFUjyY1Yt1gTON+EtVnyQ4ysvk5E=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-jlNTwGp_Nq6dwbQJliLQpw-1; Thu, 21 May 2020 15:59:37 -0400
X-MC-Unique: jlNTwGp_Nq6dwbQJliLQpw-1
Received: by mail-wm1-f70.google.com with SMTP id l2so3087560wmi.2
 for <qemu-riscv@nongnu.org>; Thu, 21 May 2020 12:59:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gy7eiStux+gIOMgnul3BY8RTTpwPoXMNvRdb9ailA+g=;
 b=AZ9//J3smLElOqzrKG1BUdMfu1/txSn6RQIfVXRNSv1CwrJepJEe149Vrj6rOHpTnl
 89Mo2tvcuN35jh1vQSlC1oKR9tLcoTfpJ0aN6dRVjkxCh22A7SWzcMqdQzPMJvwfYl2b
 rp/nCnXTodnGe51pXO5nXMzv1vE2tkx2MQ54oGOOEHcyVkQ3qRo+z3Zizf8uOsuOnnrB
 ig2VV+T4ofYfRpqCODcB1ZXhFgMZh12723jdoMreFLI5c5BNkYnc7T1ti/A8XaBRz4Ac
 OWYX5A1s6diP3+2jAWirxUyx6m/axugGqMafC/H8akLOOiz1aty/i3R7JU8Nl7o/gOYf
 A9zA==
X-Gm-Message-State: AOAM530WZ8NgVpYA/wXX2caHptMrEbLWMT6Kw9RL2gASghQP2KP+Jw3I
 2Twwhhoj0blFiMN1SXiKctcgvxA8IC4GhjZrRD5a/q3CMkkVaSpXX9JQ6CvS1tO2fFS4haElh6/
 ZxZ9puM/7aIk/7ts=
X-Received: by 2002:a1c:6182:: with SMTP id v124mr10231006wmb.30.1590091176369; 
 Thu, 21 May 2020 12:59:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyG4o6HxlnyWsS2WQHrvVxmbsl63V323RdIWVRrEFq3WAjUEtcGOOtLAhMk/HrM6bu0cSj60w==
X-Received: by 2002:a1c:6182:: with SMTP id v124mr10230993wmb.30.1590091176198; 
 Thu, 21 May 2020 12:59:36 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id p8sm7269705wre.11.2020.05.21.12.59.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2020 12:59:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Chris Wulff <crwulff@gmail.com>,
 qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Michael Walle <michael@walle.cc>, Marek Vasut <marex@denx.de>,
 qemu-riscv@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Emilio G . Cota" <cota@braap.org>, David Hildenbrand <david@redhat.com>
Subject: [PATCH v3 04/11] accel/tcg: Add stub for probe_access()
Date: Thu, 21 May 2020 21:59:04 +0200
Message-Id: <20200521195911.19685-5-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200521195911.19685-1-philmd@redhat.com>
References: <20200521195911.19685-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/21 04:44:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Thu, 21 May 2020 19:59:41 -0000

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The TCG helpers where added in b92e5a22ec3 in softmmu_template.h.
probe_write() was added in there in 3b4afc9e75a to be moved out
to accel/tcg/cputlb.c in 3b08f0a9254, and was later refactored
as probe_access() in c25c283df0f.
Since it is a TCG specific helper, add a stub to avoid failures
when building without TCG, such:

  target/arm/helper.o: In function `probe_read':
  include/exec/exec-all.h:362: undefined reference to `probe_access'

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


