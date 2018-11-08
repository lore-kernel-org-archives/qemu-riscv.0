Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gKp7q-0006KY-0q
	for mharc-qemu-riscv@gnu.org; Thu, 08 Nov 2018 13:33:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53721)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gKp7o-0006KF-Hm
	for qemu-riscv@nongnu.org; Thu, 08 Nov 2018 13:33:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gKp7l-0002jF-P1
	for qemu-riscv@nongnu.org; Thu, 08 Nov 2018 13:33:52 -0500
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:34354)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gKp7l-0002Jf-Bq
	for qemu-riscv@nongnu.org; Thu, 08 Nov 2018 13:33:49 -0500
Received: by mail-pf1-x442.google.com with SMTP id y18-v6so7288078pfn.1
	for <qemu-riscv@nongnu.org>; Thu, 08 Nov 2018 10:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=iBjHEPXpN01EyxwdYIxLAOVHM7JWcXN+GB8zUqvN+t4=;
	b=cPk6cw8dYR90sr5yGkJ3KzlLM0JWlyzJUsfOpRoWlMrYEHXN/ZkC9ERwhYf4Cuh3m6
	+3SzAxynrS1HWXxwGvYkqr016cygNEAQJ2eH3ZVQol0HgA49vBAuRbPogxcgbGDanNaB
	qquMFiP3zz/58vXJDoyRA9emhxv+mr6ja3GteKiUoGRUgOSBBwBp46+pxbzuDUe7WSfd
	/w6Id+1LDgzqnzCUK8jT0LmlFNBlB+Rrf7ycT10Anrx2eXlv/+51HEFZ0Xp2OBR8Jwu2
	X1wkDhsIRsG/c+w7UMbqQUKDf7s5YbUQWGEJ9HXtLyaGiTD7EMA/ARyOXnp0lsPL9/kO
	UGfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=iBjHEPXpN01EyxwdYIxLAOVHM7JWcXN+GB8zUqvN+t4=;
	b=IsOdVMZ0kwzVwt/J7VuWGOGKkzthvpG7JhbER9/1gjsRFgrQ0ZBxsYMXCH/7HIQqDW
	pdRxzDNXAgWbZy2G+WSEISVIeg78/BnhQ2sHyq22yEuvkjUk+5StZqXjTZMh/F40IDdH
	/mtqN8r0TR1QlPGSrEBY1sX0SYbLDSsTz59CU4cAnhAZuK66T0sz/n0jEsRatZN12RnC
	YQsHMe5nRBj6/NbGwij31qryjABB3cPt/wRkflBljE5rG0S2D6tS9vxO9atZ5ut+dak0
	MO0yDaRU6GzRJPnsaH0v03FjKTd+3Fu7nLTqfIXHMvSFYmi6fvcRVcjloScla4WcsN2O
	9Shw==
X-Gm-Message-State: AGRZ1gIPPLKlVyBzIA6UBWo2dFrnuDXmBsJQ8dJchZBQwBX8tyybZLlA
	93G1ZmwgZ78hSHPaQJ+L/tdOug==
X-Google-Smtp-Source: AJdET5f7dV+9a9Y6X3ZNcIOggZAFdgLQ4F+bDH/9Sfgs8eFtAPO2gYBdIZbPObybfAzUO4kAaqsF5g==
X-Received: by 2002:a63:ee0e:: with SMTP id e14mr4563339pgi.8.1541702001138;
	Thu, 08 Nov 2018 10:33:21 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	h2-v6sm4816559pfc.6.2018.11.08.10.33.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Nov 2018 10:33:20 -0800 (PST)
Date: Thu,  8 Nov 2018 10:33:06 -0800
Message-Id: <20181108183306.4361-2-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20181108183306.4361-1-palmer@sifive.com>
References: <20181108183306.4361-1-palmer@sifive.com>
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Alistair Francis <alistair.francis@wdc.com>, 
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: [Qemu-riscv] [PULL] riscv: spike: Fix memory leak in the board init
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Nov 2018 18:33:53 -0000

From: Alistair Francis <Alistair.Francis@wdc.com>

Coverity caught a malloc() call that was never freed. This patch ensures
that we free the memory but also updates the allocation to use
g_strdup_printf() instead of malloc().

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/spike.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 8a712ed49026..268df04c3c7d 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -316,9 +316,7 @@ static void spike_v1_09_1_board_init(MachineState *machine)
 
     /* build config string with supplied memory size */
     char *isa = riscv_isa_string(&s->soc.harts[0]);
-    size_t config_string_size = strlen(config_string_tmpl) + 48;
-    char *config_string = malloc(config_string_size);
-    snprintf(config_string, config_string_size, config_string_tmpl,
+    char *config_string = g_strdup_printf(config_string_tmpl,
         (uint64_t)memmap[SPIKE_CLINT].base + SIFIVE_TIME_BASE,
         (uint64_t)memmap[SPIKE_DRAM].base,
         (uint64_t)ram_size, isa,
@@ -345,6 +343,8 @@ static void spike_v1_09_1_board_init(MachineState *machine)
     /* Core Local Interruptor (timer and IPI) */
     sifive_clint_create(memmap[SPIKE_CLINT].base, memmap[SPIKE_CLINT].size,
         smp_cpus, SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE);
+
+    g_free(config_string);
 }
 
 static void spike_v1_09_1_machine_init(MachineClass *mc)
-- 
2.18.1


