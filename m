Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jVd3B-0005Gm-Sl
	for mharc-qemu-riscv@gnu.org; Mon, 04 May 2020 11:30:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jVd38-00059r-Gq
 for qemu-riscv@nongnu.org; Mon, 04 May 2020 11:30:30 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:56059
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jVd36-0004H7-2p
 for qemu-riscv@nongnu.org; Mon, 04 May 2020 11:30:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588606227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=roSqpWZiqVEnV8LkdMDYBqTbKDtiMZNpOAVtdss6dcA=;
 b=SBS+X8z6wUzrTcIwsBwbjupl68Sa5b5Kc4Lzrup5rEBIaL/ZzYMKALHvot+y25XFTT9f7i
 SPgLlXK/865ga8TGKABqqXwqu4xtlZKSE3Euj2mWQBPUeOzUxpxclYgfOOu8TD8BJdSsbH
 rG8zNPEnTKoZlX0+5gmLSCrMDeScMmM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-LamjDXzcNhez597NNsw_nw-1; Mon, 04 May 2020 11:30:26 -0400
X-MC-Unique: LamjDXzcNhez597NNsw_nw-1
Received: by mail-wm1-f69.google.com with SMTP id l21so5119010wmh.2
 for <qemu-riscv@nongnu.org>; Mon, 04 May 2020 08:30:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Yw0XCRWQ5TOmgPjX3CHbIeQtGrafhhkkx8MZiR9pd/4=;
 b=S7dFogIUUOeEbzzzFDzpoxIAnkCqhZDntDelI/X4ktG9nvMmmgLEbrF9HS05UJhOJ4
 t15v91ybd73a9jCl1HtVPku7YP2HNYPTEkPH5XdZcb+gZ9xVSuLVu3+qd+8kem3fYcUs
 S8kKJ8pcBQ9zeYfAXCFHpA+LWvp0tt6X/YCM0x0JRjLvxVpJfXK7qo/5HlygiT/zWJ4T
 p7nQ0FT4r2S4zs8rzEJkbBUAq32UOzoidG7XHnOSPMhkUQ5LkBvaEO4x8jcVsCGxA5rt
 1o9AVpsFfdvY/2RyKeieWwH5jCDikm5Obz4on1R4cumXW14DJXOWiVmaHseECcMYkcey
 Of6w==
X-Gm-Message-State: AGi0PuakGSecDbPDhOCuxDr3NVlJpkDO/o6C/MgPm8wnvz80OdWdRnz6
 6BMv/iED1reuZo2CA7PYk8u8GihPKBMKOTCbiuq2MyIZNr3/VygC96Zc1pjXFY3neAUs3WGZbta
 af/DyAE1EktIWNWo=
X-Received: by 2002:a7b:c959:: with SMTP id i25mr15022176wml.20.1588606223849; 
 Mon, 04 May 2020 08:30:23 -0700 (PDT)
X-Google-Smtp-Source: APiQypKj4Ork54uQyKon7JuuI5hLn/qSvQkcntw69/VS1GCVsLTqkzf4xWLOeWqEwGpwl6KqwP2Uow==
X-Received: by 2002:a7b:c959:: with SMTP id i25mr15022125wml.20.1588606223163; 
 Mon, 04 May 2020 08:30:23 -0700 (PDT)
Received: from x1w.redhat.com (26.red-88-21-207.staticip.rima-tde.net.
 [88.21.207.26])
 by smtp.gmail.com with ESMTPSA id l19sm14665035wmj.14.2020.05.04.08.30.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 08:30:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Cornelia Huck <cohuck@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, Richard Henderson <rth@twiddle.net>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 12/12] hw/core: Restrict CpuClass::get_crash_info() to
 system-mode
Date: Mon,  4 May 2020 17:29:22 +0200
Message-Id: <20200504152922.21365-13-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200504152922.21365-1-philmd@redhat.com>
References: <20200504152922.21365-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/04 05:09:11
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
X-List-Received-Date: Mon, 04 May 2020 15:30:30 -0000

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 include/hw/core/cpu.h | 7 ++++++-
 hw/core/cpu.c         | 2 ++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 5bf94d28cf..0d1f9e084f 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -490,6 +490,8 @@ bool cpu_paging_enabled(const CPUState *cpu);
 void cpu_get_memory_mapping(CPUState *cpu, MemoryMappingList *list,
                             Error **errp);
=20
+#if !defined(CONFIG_USER_ONLY)
+
 /**
  * cpu_write_elf64_note:
  * @f: pointer to a function that writes memory to a file
@@ -539,6 +541,8 @@ int cpu_write_elf32_qemunote(WriteCoreDumpFunction f, C=
PUState *cpu,
  */
 GuestPanicInformation *cpu_get_crash_info(CPUState *cpu);
=20
+#endif /* !CONFIG_USER_ONLY */
+
 /**
  * CPUDumpFlags:
  * @CPU_DUMP_CODE:
@@ -632,7 +636,8 @@ static inline int cpu_asidx_from_attrs(CPUState *cpu, M=
emTxAttrs attrs)
     }
     return ret;
 }
-#endif
+
+#endif /* CONFIG_USER_ONLY */
=20
 /**
  * cpu_list_add:
diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index 786a1bec8a..85b9723fee 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -209,6 +209,7 @@ static bool cpu_common_exec_interrupt(CPUState *cpu, in=
t int_req)
     return false;
 }
=20
+#if !defined(CONFIG_USER_ONLY)
 GuestPanicInformation *cpu_get_crash_info(CPUState *cpu)
 {
     CPUClass *cc =3D CPU_GET_CLASS(cpu);
@@ -219,6 +220,7 @@ GuestPanicInformation *cpu_get_crash_info(CPUState *cpu=
)
     }
     return res;
 }
+#endif
=20
 void cpu_dump_state(CPUState *cpu, FILE *f, int flags)
 {
--=20
2.21.3


