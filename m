Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jcBR5-0006I3-UN
	for mharc-qemu-riscv@gnu.org; Fri, 22 May 2020 13:26:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jcBR3-0006BI-C4
 for qemu-riscv@nongnu.org; Fri, 22 May 2020 13:26:17 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:25011
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jcBR1-0002EI-0N
 for qemu-riscv@nongnu.org; Fri, 22 May 2020 13:26:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590168373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PSd40Ze4XM2b/X382gY1wRiBudpttPKJ8TAR2241lwg=;
 b=L3i95zLNIZ9XIDlmGdU9lbVHNS1Egg7Yj2kGGlxhyCgl51KjAkDnSOJUhc7Dv0Q19skwJl
 zvhc9jSaod5totm+nTsanOkX3UMZV02J+K1amgq3FOG6BQPDjyVcxctvH4si79Ty+0KRQC
 Hhcf5iB2DQ+t5zTLHMLzEi5ed6tGXgA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61--YvFc2orMs2wEU-qydsBLw-1; Fri, 22 May 2020 13:26:12 -0400
X-MC-Unique: -YvFc2orMs2wEU-qydsBLw-1
Received: by mail-wr1-f69.google.com with SMTP id z5so4619130wrt.17
 for <qemu-riscv@nongnu.org>; Fri, 22 May 2020 10:26:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PSd40Ze4XM2b/X382gY1wRiBudpttPKJ8TAR2241lwg=;
 b=FcaNTH4tSlaQSHpJ8tQvFEdvI6FIrvFYM6AJvSOAEMsQbABJVtFA0l7I3ORNwRuuaF
 nTolBOjzNsNlybSlpNeXamSOKXz8F4Vxn4XpcmMbV1N5jP1+kyMmTru0ovh/f+PdXxAP
 PlV2vyVwRA8tiX+ZUYotd3UfsLXDGi2Auisd8JhrVyH4PsQKEMadiZHcZmpZ1kkpuo43
 YpzfmpC4ppQ8x6IKDkqliZOQ7nx5j0QlTExhOu00An4WtK6Qii8TkrKqHwopreD2vRM/
 LkqzjeMRkBblFs7Hw0tSpdKda+Cipo+wkCCU85EPpLxooJw3vinJ+CdJTtJ7xcYrC/tY
 wpRg==
X-Gm-Message-State: AOAM531HC8UXx9U7RwBUCaXqwtsvHxUoVEpLTQcpz2C2pfSdw88OsSQD
 HxOM6bNaCgFkxdfWQvywdcfZ7QqGL8RzvDmIc3kMS0bdxc2ovQUJMNXC31EDN61kyORyvUCDUhg
 hWNXvm/VM7lRbicU=
X-Received: by 2002:a5d:4dc9:: with SMTP id f9mr4128503wru.407.1590168371239; 
 Fri, 22 May 2020 10:26:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSSDT7mWCRgue/lCKohrU0T76EdQPrGYzEKzkRdy9U4PMJfPXzqLgEz/ZvOl8yqx15fixuLA==
X-Received: by 2002:a5d:4dc9:: with SMTP id f9mr4128478wru.407.1590168371036; 
 Fri, 22 May 2020 10:26:11 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id v126sm11365914wma.9.2020.05.22.10.26.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 10:26:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, David Hildenbrand <david@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH v4 12/13] hw/core: Restrict CpuClass::get_crash_info() to
 system-mode
Date: Fri, 22 May 2020 19:25:09 +0200
Message-Id: <20200522172510.25784-13-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200522172510.25784-1-philmd@redhat.com>
References: <20200522172510.25784-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/22 08:01:12
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Fri, 22 May 2020 17:26:17 -0000

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Tested-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/core/cpu.h | 7 ++++++-
 hw/core/cpu.c         | 2 ++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 07f7698155..497600c49e 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -490,6 +490,8 @@ bool cpu_paging_enabled(const CPUState *cpu);
 void cpu_get_memory_mapping(CPUState *cpu, MemoryMappingList *list,
                             Error **errp);
 
+#if !defined(CONFIG_USER_ONLY)
+
 /**
  * cpu_write_elf64_note:
  * @f: pointer to a function that writes memory to a file
@@ -539,6 +541,8 @@ int cpu_write_elf32_qemunote(WriteCoreDumpFunction f, CPUState *cpu,
  */
 GuestPanicInformation *cpu_get_crash_info(CPUState *cpu);
 
+#endif /* !CONFIG_USER_ONLY */
+
 /**
  * CPUDumpFlags:
  * @CPU_DUMP_CODE:
@@ -632,7 +636,8 @@ static inline int cpu_asidx_from_attrs(CPUState *cpu, MemTxAttrs attrs)
     }
     return ret;
 }
-#endif
+
+#endif /* CONFIG_USER_ONLY */
 
 /**
  * cpu_list_add:
diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index 5284d384fb..f31ec48ee6 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -209,6 +209,7 @@ static bool cpu_common_exec_interrupt(CPUState *cpu, int int_req)
     return false;
 }
 
+#if !defined(CONFIG_USER_ONLY)
 GuestPanicInformation *cpu_get_crash_info(CPUState *cpu)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
@@ -219,6 +220,7 @@ GuestPanicInformation *cpu_get_crash_info(CPUState *cpu)
     }
     return res;
 }
+#endif
 
 void cpu_dump_state(CPUState *cpu, FILE *f, int flags)
 {
-- 
2.21.3


