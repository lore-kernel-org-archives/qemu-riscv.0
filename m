Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQ9MG-0005r8-81
	for mharc-qemu-riscv@gnu.org; Tue, 14 Sep 2021 10:24:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9MD-0005jS-VU
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:24:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9MC-0005IO-7V
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 10:24:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631629459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m2c50X1HcjOI8LxDAAuTPtCdgQQQ4EI3QbjaNt6yV6Y=;
 b=J1FIAMq9P3vH6YogNozqUjKmnvpwBptIySdBJFRihBZH4YofpM42FPAT+AVBQDrqphG8Yq
 PA7Hp5MNNflO+zNPYqQ5zL63i979dFe9dt/3kWnrJSXIhTiUNB2T8h908gpKVP45Mj9842
 FnlFhOtjA1tSIlc4o/x7LBNBpwfzmrI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-T1Wd6paBM5W9Ez1ipBntEg-1; Tue, 14 Sep 2021 10:24:18 -0400
X-MC-Unique: T1Wd6paBM5W9Ez1ipBntEg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A67BB1006AA4;
 Tue, 14 Sep 2021 14:24:14 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 992D55D9DC;
 Tue, 14 Sep 2021 14:23:53 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, Bin Meng <bin.meng@windriver.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Stafford Horne <shorne@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Peter Xu <peterx@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-ppc@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Halil Pasic <pasic@linux.ibm.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-riscv@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Marek Vasut <marex@denx.de>,
 Markus Armbruster <armbru@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-s390x@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Chris Wulff <crwulff@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 11/53] target/hexagon: delete unused hexagon_debug() method
Date: Tue, 14 Sep 2021 15:20:00 +0100
Message-Id: <20210914142042.1655100-12-berrange@redhat.com>
In-Reply-To: <20210914142042.1655100-1-berrange@redhat.com>
References: <20210914142042.1655100-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 14 Sep 2021 14:24:22 -0000

This method isn't used in any code and its functionality is already
available via the 'info registers' HMP command.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 target/hexagon/cpu.c      | 5 -----
 target/hexagon/internal.h | 1 -
 2 files changed, 6 deletions(-)

diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index 3338365c16..14c628db7a 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -169,11 +169,6 @@ static void hexagon_dump_state(CPUState *cs, FILE *f, int flags)
     hexagon_dump(env, f);
 }
 
-void hexagon_debug(CPUHexagonState *env)
-{
-    hexagon_dump(env, stdout);
-}
-
 static void hexagon_cpu_set_pc(CPUState *cs, vaddr value)
 {
     HexagonCPU *cpu = HEXAGON_CPU(cs);
diff --git a/target/hexagon/internal.h b/target/hexagon/internal.h
index 6b20affdfa..167e91026a 100644
--- a/target/hexagon/internal.h
+++ b/target/hexagon/internal.h
@@ -31,7 +31,6 @@
 
 int hexagon_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int hexagon_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
-void hexagon_debug(CPUHexagonState *env);
 
 extern const char * const hexagon_regnames[TOTAL_PER_THREAD_REGS];
 
-- 
2.31.1


