Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ogSuk-00042d-Fb
	for mharc-qemu-riscv@gnu.org; Thu, 06 Oct 2022 11:35:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ogSuG-0003jR-1w
 for qemu-riscv@nongnu.org; Thu, 06 Oct 2022 11:35:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ogSuD-0000TZ-6j
 for qemu-riscv@nongnu.org; Thu, 06 Oct 2022 11:35:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665070522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QODbEEu/ErPvK0BeyIXd5lDo4uskdjchNK/jc3WZeCQ=;
 b=Z4gfKC7CKeBZy2Xjl0pg3uYXLdwFZ57391l9vqqME0h6TiLLep2pc/j7fKg2YBcEAVl1t0
 +L4kW/j/pQy0YEtADFZ6UbObJtdwcwxlmolS6WQewibofCaljPhKabLJmQnGhZi3dQ5aob
 XO7z8HVkIixrGAnHongctHmxt28HMHA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-SrWhGXO_PtyefPEzFciL9w-1; Thu, 06 Oct 2022 11:35:17 -0400
X-MC-Unique: SrWhGXO_PtyefPEzFciL9w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EE77E29324A0;
 Thu,  6 Oct 2022 15:35:16 +0000 (UTC)
Received: from localhost (unknown [10.39.208.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D9B534EA5D;
 Thu,  6 Oct 2022 15:35:07 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 qemu-riscv@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 viktor.prutyanov@redhat.com, Greg Kurz <groug@kaod.org>,
 frankja@linux.ibm.com, David Hildenbrand <david@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-arm@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PULL 08/10] dump: Rename write_elf*_phdr_note to
 prepare_elf*_phdr_note
Date: Thu,  6 Oct 2022 19:34:27 +0400
Message-Id: <20221006153430.2775580-9-marcandre.lureau@redhat.com>
In-Reply-To: <20221006153430.2775580-1-marcandre.lureau@redhat.com>
References: <20221006153430.2775580-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 06 Oct 2022 15:35:30 -0000

From: Janosch Frank <frankja@linux.ibm.com>

The functions in question do not actually write to the file descriptor
they set up a buffer which is later written to the fd.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
Reviewed-by: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220811121111.9878-9-frankja@linux.ibm.com>
---
 dump/dump.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index 8a2a97a85e..a905316fe5 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -260,7 +260,7 @@ static void write_elf32_load(DumpState *s, MemoryMapping *memory_mapping,
     }
 }
 
-static void write_elf64_phdr_note(DumpState *s, Elf64_Phdr *phdr)
+static void prepare_elf64_phdr_note(DumpState *s, Elf64_Phdr *phdr)
 {
     memset(phdr, 0, sizeof(*phdr));
     phdr->p_type = cpu_to_dump32(s, PT_NOTE);
@@ -316,7 +316,7 @@ static void write_elf64_notes(WriteCoreDumpFunction f, DumpState *s,
     write_guest_note(f, s, errp);
 }
 
-static void write_elf32_phdr_note(DumpState *s, Elf32_Phdr *phdr)
+static void prepare_elf32_phdr_note(DumpState *s, Elf32_Phdr *phdr)
 {
     memset(phdr, 0, sizeof(*phdr));
     phdr->p_type = cpu_to_dump32(s, PT_NOTE);
@@ -364,11 +364,11 @@ static void write_elf_phdr_note(DumpState *s, Error **errp)
     int ret;
 
     if (dump_is_64bit(s)) {
-        write_elf64_phdr_note(s, &phdr64);
+        prepare_elf64_phdr_note(s, &phdr64);
         size = sizeof(phdr64);
         phdr = &phdr64;
     } else {
-        write_elf32_phdr_note(s, &phdr32);
+        prepare_elf32_phdr_note(s, &phdr32);
         size = sizeof(phdr32);
         phdr = &phdr32;
     }
-- 
2.37.3


