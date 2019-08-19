Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1hzZyC-0005P9-4a
	for mharc-qemu-riscv@gnu.org; Mon, 19 Aug 2019 01:12:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43668)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1hzZxz-0005EE-Ue
 for qemu-riscv@nongnu.org; Mon, 19 Aug 2019 01:12:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1hzZxx-0007w3-RY
 for qemu-riscv@nongnu.org; Mon, 19 Aug 2019 01:12:27 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:37285)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1hzZxt-0007fe-Vt; Mon, 19 Aug 2019 01:12:22 -0400
Received: by mail-pf1-x444.google.com with SMTP id 129so456468pfa.4;
 Sun, 18 Aug 2019 22:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=GiQllcar9GWdqn3xlcOyEZI4UT/k9/yNdl3brUTisP4=;
 b=QORLyABnpLXP+1qTvC1b3m8ovNmsC2fZkLzWtKEbEekjxMIbzmwUwsfMAjFBC1r8LQ
 sYuFAen3SY9R1ZXp6FKwbCaGEBD+J2bPRVq5pz6Od/LLzRSzxhjDhCPZfidgz8YkwVmV
 z1u0+2X05yRl4Lc0E8w9emNcl6hWV66S+eaftQdX1bHA3wNF0wqP+pMQArVk5E9CtanG
 mPmVP6K7TWuwBQVTCuiLWGvwLgiqqDszNDZ/+jtTM3OuPx6h7WW4WEH26KctStuZE5Cw
 p+X0HJ1Xh5CDFyfl2mbJftMt5J8rBXc7zEzfHuIP0LQLeMRbMbqInUvsnkvZK4SdwrIb
 no3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=GiQllcar9GWdqn3xlcOyEZI4UT/k9/yNdl3brUTisP4=;
 b=JSOm6S7o+cGTTGRtYfi/ynrHVOWfkbwKc5XCou1tXXeIQkk09FS9AGp6t3IGsj8S1V
 wDuG5r8iX0yBfoRcsFez3hPqpRfwoF9QYg1DIPA+8juBMrL3/Ut7PLxVgaDigBRBQAbf
 VDfZuilIAuZfB8Fs9yPsuMdKVMj+P2U4fMF0nY9BDwwQq6IkYf7zLiPaJyAKEN27PorG
 QimFW/HKkV/dybPTzGzTi7WjrFxSqX5WGoHIMCkovGa4k9Y6onPg8TCApfDI16ulyNcK
 Tnz/Kli3xTqg1je0SlUAcmniwLAVs4XGZyn6JhgS73h9FBKdxayBciMvwr0ss1THo8P/
 prnw==
X-Gm-Message-State: APjAAAXeuXlZBExxjEvtIeamfiwiNNSwgKM40IUhYXAZQNCsIPhoH5yR
 Ok2Th0SdEYnVrHhexk1AfIzqCeCy
X-Google-Smtp-Source: APXvYqxIvDQXVIK4sM7Yif0deP0Wu7/g4Bg8lOLYRixPMyypB+PogSU2emxXeKJn7M4wBsCn/8cSYA==
X-Received: by 2002:a17:90a:f0c9:: with SMTP id
 fa9mr18064082pjb.137.1566191541240; 
 Sun, 18 Aug 2019 22:12:21 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id q13sm15464986pfl.124.2019.08.18.22.12.20
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sun, 18 Aug 2019 22:12:20 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Date: Sun, 18 Aug 2019 22:11:46 -0700
Message-Id: <1566191521-7820-14-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1566191521-7820-1-git-send-email-bmeng.cn@gmail.com>
References: <1566191521-7820-1-git-send-email-bmeng.cn@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: [Qemu-riscv] [PATCH v4 13/28] riscv: hart: Add a "hartid-base"
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
X-List-Received-Date: Mon, 19 Aug 2019 05:12:34 -0000

At present each hart's hartid in a RISC-V hart array is assigned
the same value of its index in the hart array. But for a system
that has multiple hart arrays, this is not the case any more.

Add a new "hartid-base" property so that hartid number can be
assigned based on the property value.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

---

Changes in v4:
- new patch to add a "hartid-base" property to RISC-V hart array

Changes in v3: None
Changes in v2: None

 hw/riscv/riscv_hart.c         | 8 +++++---
 include/hw/riscv/riscv_hart.h | 1 +
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/hw/riscv/riscv_hart.c b/hw/riscv/riscv_hart.c
index 9deef869..52ab86a 100644
--- a/hw/riscv/riscv_hart.c
+++ b/hw/riscv/riscv_hart.c
@@ -27,6 +27,7 @@
 
 static Property riscv_harts_props[] = {
     DEFINE_PROP_UINT32("num-harts", RISCVHartArrayState, num_harts, 1),
+    DEFINE_PROP_UINT32("hartid-base", RISCVHartArrayState, hartid_base, 0),
     DEFINE_PROP_STRING("cpu-type", RISCVHartArrayState, cpu_type),
     DEFINE_PROP_END_OF_LIST(),
 };
@@ -37,7 +38,7 @@ static void riscv_harts_cpu_reset(void *opaque)
     cpu_reset(CPU(cpu));
 }
 
-static void riscv_hart_realize(RISCVHartArrayState *s, int idx,
+static void riscv_hart_realize(RISCVHartArrayState *s, int idx, uint32_t hartid,
                                char *cpu_type, Error **errp)
 {
     Error *err = NULL;
@@ -45,7 +46,7 @@ static void riscv_hart_realize(RISCVHartArrayState *s, int idx,
     object_initialize_child(OBJECT(s), "harts[*]", &s->harts[idx],
                             sizeof(RISCVCPU), cpu_type,
                             &error_abort, NULL);
-    s->harts[idx].env.mhartid = idx;
+    s->harts[idx].env.mhartid = hartid;
     qemu_register_reset(riscv_harts_cpu_reset, &s->harts[idx]);
     object_property_set_bool(OBJECT(&s->harts[idx]), true,
                              "realized", &err);
@@ -58,12 +59,13 @@ static void riscv_hart_realize(RISCVHartArrayState *s, int idx,
 static void riscv_harts_realize(DeviceState *dev, Error **errp)
 {
     RISCVHartArrayState *s = RISCV_HART_ARRAY(dev);
+    uint32_t hartid = s->hartid_base;
     int n;
 
     s->harts = g_new0(RISCVCPU, s->num_harts);
 
     for (n = 0; n < s->num_harts; n++) {
-        riscv_hart_realize(s, n, s->cpu_type, errp);
+        riscv_hart_realize(s, n, hartid + n, s->cpu_type, errp);
     }
 }
 
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


