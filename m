Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i4Fzy-0007ru-SF
	for mharc-qemu-riscv@gnu.org; Sat, 31 Aug 2019 22:53:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47880)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1i4Fzq-0007i7-Ct
 for qemu-riscv@nongnu.org; Sat, 31 Aug 2019 22:53:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1i4Fzo-0006gE-CH
 for qemu-riscv@nongnu.org; Sat, 31 Aug 2019 22:53:42 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:35665)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1i4Fzk-0006XD-7l; Sat, 31 Aug 2019 22:53:36 -0400
Received: by mail-pg1-x541.google.com with SMTP id n4so5504361pgv.2;
 Sat, 31 Aug 2019 19:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=Q/abYtrK+JkHer8RFeR3LhMg9DVMnKBW29F73+2gOzk=;
 b=PgGzwvMGgFfzNTrdAs6YY82PNS3C5tBnyyf5KKztqaXiKymQqSZwNrQmwIA7JEP2ga
 Mdpd0YgiR0P1KCr6rfV3yxwE2Enx+IQ15Iy21R2G25NO85xgVp69Z8Id/Sm9tZ7AT6L3
 xnlEHZpqK2wLnRlWe5r2JiyotCaJ59psN+18wR3mk7MtTIUtZdAIRHHw+PyUH2taGCpS
 s4mdlKpaoNHjfk5w0ANWCz9i+ECeu8mcWF201Xgi8v5f3wiX1IkqprzQWWs0hDE37L9v
 eQuIqRnJmg1kEMBmOORVXgxHfcdz59UiEPm2YCPeQ0N7ExnYWskYLsAmAifmGGyo57kc
 I6Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=Q/abYtrK+JkHer8RFeR3LhMg9DVMnKBW29F73+2gOzk=;
 b=iVZNcZXud2dTeeHSpB0MsACHRdr6wg5eqTOMlSXZ5Vnl3Ca2BAdz0KSRwe96AmbVj9
 bw9Z+9XKG77Jb0fvQhIXVf+tZALfgck1HemAQ5Qlu+pPCdwG7XIr+AcUyy61YgV0i3W7
 EVgHBJzlgNkq9lL2p+F7yAb8ZOPEWMZJ/n9thSyqacGIeqy5ryR/vtUJdreC+SrYgvi6
 0c3DFA1d6URW9/vOrhSrho+XSFsW8Ve8IiPqlNQNzrxVZFFvuTtn7T7SYuVKeUo0EDD+
 3UKTUrjfaYJkHN5E3zpY4/fMi/I6c6wRt5JF0TNQWpwiFkdHOxY+4MrEUie5qStY5gh0
 FsGA==
X-Gm-Message-State: APjAAAVoNbKLcIKd0vW7pLJbolbCsRbgFFtCQtJMAAfWJDbCHPipIc/D
 FzhjUwe4ZWclVkiIy9BBCok=
X-Google-Smtp-Source: APXvYqywYVK5PQ9hcNI2R4F1gqSj8ZUW+XlhFpMCOdkNVHQ3jKNMe1oxXx+6lgcJ8p6bLs2Ru0hLsg==
X-Received: by 2002:a17:90a:ae15:: with SMTP id
 t21mr6501066pjq.50.1567306415206; 
 Sat, 31 Aug 2019 19:53:35 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id p10sm11453307pff.132.2019.08.31.19.53.34
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sat, 31 Aug 2019 19:53:34 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Date: Sat, 31 Aug 2019 19:52:56 -0700
Message-Id: <1567306391-2682-16-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1567306391-2682-1-git-send-email-bmeng.cn@gmail.com>
References: <1567306391-2682-1-git-send-email-bmeng.cn@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: [Qemu-riscv] [PATCH v7 15/30] riscv: hart: Add a "hartid-base"
 property to RISC-V hart array
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
X-List-Received-Date: Sun, 01 Sep 2019 02:53:46 -0000

At present each hart's hartid in a RISC-V hart array is assigned
the same value of its index in the hart array. But for a system
that has multiple hart arrays, this is not the case any more.

Add a new "hartid-base" property so that hartid number can be
assigned based on the property value.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

---

Changes in v7:
- use `s->hartid_base + idx` directly

Changes in v6:
- use s->hartid_base directly, instead of an extra variable

Changes in v5: None
Changes in v4:
- new patch to add a "hartid-base" property to RISC-V hart array

Changes in v3: None
Changes in v2: None

 hw/riscv/riscv_hart.c         | 3 ++-
 include/hw/riscv/riscv_hart.h | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/riscv_hart.c b/hw/riscv/riscv_hart.c
index 9deef869..e28db80 100644
--- a/hw/riscv/riscv_hart.c
+++ b/hw/riscv/riscv_hart.c
@@ -27,6 +27,7 @@
 
 static Property riscv_harts_props[] = {
     DEFINE_PROP_UINT32("num-harts", RISCVHartArrayState, num_harts, 1),
+    DEFINE_PROP_UINT32("hartid-base", RISCVHartArrayState, hartid_base, 0),
     DEFINE_PROP_STRING("cpu-type", RISCVHartArrayState, cpu_type),
     DEFINE_PROP_END_OF_LIST(),
 };
@@ -45,7 +46,7 @@ static void riscv_hart_realize(RISCVHartArrayState *s, int idx,
     object_initialize_child(OBJECT(s), "harts[*]", &s->harts[idx],
                             sizeof(RISCVCPU), cpu_type,
                             &error_abort, NULL);
-    s->harts[idx].env.mhartid = idx;
+    s->harts[idx].env.mhartid = s->hartid_base + idx;
     qemu_register_reset(riscv_harts_cpu_reset, &s->harts[idx]);
     object_property_set_bool(OBJECT(&s->harts[idx]), true,
                              "realized", &err);
diff --git a/include/hw/riscv/riscv_hart.h b/include/hw/riscv/riscv_hart.h
index 0671d88..1984e30 100644
--- a/include/hw/riscv/riscv_hart.h
+++ b/include/hw/riscv/riscv_hart.h
@@ -32,6 +32,7 @@ typedef struct RISCVHartArrayState {
 
     /*< public >*/
     uint32_t num_harts;
+    uint32_t hartid_base;
     char *cpu_type;
     RISCVCPU *harts;
 } RISCVHartArrayState;
-- 
2.7.4


