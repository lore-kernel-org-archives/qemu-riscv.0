Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i6Gyq-0004mk-36
	for mharc-qemu-riscv@gnu.org; Fri, 06 Sep 2019 12:21:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56581)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1i6Gyg-0004cv-JV
 for qemu-riscv@nongnu.org; Fri, 06 Sep 2019 12:20:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1i6Gye-0004Ui-L2
 for qemu-riscv@nongnu.org; Fri, 06 Sep 2019 12:20:50 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:46532)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1i6GyZ-0004Pz-Qh; Fri, 06 Sep 2019 12:20:44 -0400
Received: by mail-pl1-x643.google.com with SMTP id t1so3365434plq.13;
 Fri, 06 Sep 2019 09:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=GSClHn7NGURNHlvMYIJ+ky4Zf1JrCSxGlVt7bVbRrXw=;
 b=XuqR2JIUOzDgoI8o53N6XItTN22nVllb0ddArJzZrvZ9gZmhCgLqNtECKD/9m5pGad
 OHXLVjUKCYURY19SeTonWyRz1/MbyhuEUORWlnKDekTJ0PmGHxOR0rGDhBQTs35s60kP
 s/Xlwbz1S2xuypGjLOwfI4PtqBqhMpKbKz8aV9Fm9GVYK82lIwnuaHzUTnoT4yyO45Jc
 6cLnMnKmD6JA+h56DzW+Dfb9VuwB5Dqdw8aSULSmiCvl5YaUPleITYLGsrkP007Q2sBe
 V8u99eekm9UWNPEOu3mT0DTXDnn6isaKg367eIwiN7C8xZN5bStLLrUohsvybY0K6ay/
 Fu0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=GSClHn7NGURNHlvMYIJ+ky4Zf1JrCSxGlVt7bVbRrXw=;
 b=SgUz/q4wVJlPutys4IM1Afmyu+pBRpaHoFiyWVK4rWimcPCiDja9c4U4kH1N2zg05h
 Ss5O2ZS/yN9cVy0KnEMLBdB04m8a1dzY7DKZIkI4E7r5OWS62zbXe276OAfv3Hhh5EUk
 Kg6x0FWvdU9P8a0+TPXhg4s+KMpn7tX7io7Xz29K3h1XTPpMovuON1vIRx7cux2lCKFf
 D98xuNuUUswP8UWyrVcZhNtVP9Tot1SbDmJWyG9I/IuU2QlRDl509L3GVm9grHZx2BEr
 BQO9wo1o8O39I786T+H+bB4+BR6bciwElBgrR1+rEtUXaMsfQS1tv8rBKZXjzISxwsol
 07QQ==
X-Gm-Message-State: APjAAAWCHkU8B7LVrOO1xNOgE8KZ3L1E6pOSqN02KQTDFcxODUVRgLfv
 s9nt6s7flRu84I6nOU2Y0qARW3aZ
X-Google-Smtp-Source: APXvYqzisJWyxbenDkNLof/aV8cIBvT+fUR+8DXUDsIv3cO5UAJuFtam6HPs6eEOgE7ycSB9TS9HOA==
X-Received: by 2002:a17:902:6b81:: with SMTP id
 p1mr9984319plk.91.1567786842928; 
 Fri, 06 Sep 2019 09:20:42 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id f89sm11146228pje.20.2019.09.06.09.20.42
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Fri, 06 Sep 2019 09:20:42 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Date: Fri,  6 Sep 2019 09:20:04 -0700
Message-Id: <1567786819-22142-18-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1567786819-22142-1-git-send-email-bmeng.cn@gmail.com>
References: <1567786819-22142-1-git-send-email-bmeng.cn@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: [Qemu-riscv] [PATCH v8 17/32] riscv: hart: Add a "hartid-base"
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
X-List-Received-Date: Fri, 06 Sep 2019 16:20:54 -0000

At present each hart's hartid in a RISC-V hart array is assigned
the same value of its index in the hart array. But for a system
that has multiple hart arrays, this is not the case any more.

Add a new "hartid-base" property so that hartid number can be
assigned based on the property value.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

---

Changes in v8: None
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
index 6620e41..5b98227 100644
--- a/hw/riscv/riscv_hart.c
+++ b/hw/riscv/riscv_hart.c
@@ -29,6 +29,7 @@
 
 static Property riscv_harts_props[] = {
     DEFINE_PROP_UINT32("num-harts", RISCVHartArrayState, num_harts, 1),
+    DEFINE_PROP_UINT32("hartid-base", RISCVHartArrayState, hartid_base, 0),
     DEFINE_PROP_STRING("cpu-type", RISCVHartArrayState, cpu_type),
     DEFINE_PROP_END_OF_LIST(),
 };
@@ -47,7 +48,7 @@ static void riscv_hart_realize(RISCVHartArrayState *s, int idx,
     object_initialize_child(OBJECT(s), "harts[*]", &s->harts[idx],
                             sizeof(RISCVCPU), cpu_type,
                             &error_abort, NULL);
-    s->harts[idx].env.mhartid = idx;
+    s->harts[idx].env.mhartid = s->hartid_base + idx;
     qemu_register_reset(riscv_harts_cpu_reset, &s->harts[idx]);
     object_property_set_bool(OBJECT(&s->harts[idx]), true,
                              "realized", &err);
diff --git a/include/hw/riscv/riscv_hart.h b/include/hw/riscv/riscv_hart.h
index 3b52b50..c75856f 100644
--- a/include/hw/riscv/riscv_hart.h
+++ b/include/hw/riscv/riscv_hart.h
@@ -35,6 +35,7 @@ typedef struct RISCVHartArrayState {
 
     /*< public >*/
     uint32_t num_harts;
+    uint32_t hartid_base;
     char *cpu_type;
     RISCVCPU *harts;
 } RISCVHartArrayState;
-- 
2.7.4


