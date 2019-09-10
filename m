Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i7xwI-0008Eo-9l
	for mharc-qemu-riscv@gnu.org; Wed, 11 Sep 2019 04:25:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57565)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1i7xwE-00088f-9j
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:25:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1i7xwC-0006lN-NS
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:25:17 -0400
Received: from mail-wm1-f45.google.com ([209.85.128.45]:35878)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1i7xwC-0006kr-FL
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:25:16 -0400
Received: by mail-wm1-f45.google.com with SMTP id p13so2382198wmh.1
 for <qemu-riscv@nongnu.org>; Wed, 11 Sep 2019 01:25:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=jdvh8xkCNZRDIokZ6zUfPGYGT6cGVGf9KSyR16yXLxg=;
 b=OS/tIMhXGA4UT3WWGzTXiL5g/Jlb0Xri1dBkyDtmJth8q1VZXqxsaRfQBGWoo2kaZd
 tL/Dj1f0eIIUVrnxVTMMRLrvRnRyFFzsPW8Y60kzB1PgJY2R5RgazsU7YIehxyS13wRv
 3ZNUTkvtm04uPh6FATsH7TkvIfvulny1Ay2lqXxP75e20sAkrQGxlFY8rKzKF6+0dpmn
 ybaVgHvv2TeRJWzpsIaXfh2nr6Y3aDAe3X8pPK1f7uFxVHGxECXlHuzvmTCYbUaUMEA8
 WOnu6AkyGjerqa3RoQdjlT3qUwri2VvKkTwU0cDXeEZOSQgC289g6N+Lo3cZ/VOZSGB2
 FXZw==
X-Gm-Message-State: APjAAAU7jhe2PBMQKrzetQGE8hBiKKX9UgCfGErmEt29nhzbyieE4Pkv
 cVf7jldPnwNeTDBi9xcpQJGv5gKBF4lKDA==
X-Google-Smtp-Source: APXvYqyvI/hFeUULiisVcfr0Fe30VwCopLWKMe0X3k3w2AkbCESPz7S7w4gYXd+5TtcpouJRLGtC0g==
X-Received: by 2002:a1c:7f4f:: with SMTP id a76mr2849590wmd.117.1568190314812; 
 Wed, 11 Sep 2019 01:25:14 -0700 (PDT)
Received: from localhost ([148.69.85.38])
 by smtp.gmail.com with ESMTPSA id f186sm4653054wmg.21.2019.09.11.01.25.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2019 01:25:14 -0700 (PDT)
Date: Tue, 10 Sep 2019 12:04:55 -0700
Message-Id: <20190910190513.21160-30-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190910190513.21160-1-palmer@sifive.com>
References: <20190910190513.21160-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.45
Subject: [Qemu-riscv] [PULL 29/47] riscv: hart: Add a "hartid-base" property
 to RISC-V hart array
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
X-List-Received-Date: Wed, 11 Sep 2019 08:25:21 -0000

From: Bin Meng <bmeng.cn@gmail.com>

At present each hart's hartid in a RISC-V hart array is assigned
the same value of its index in the hart array. But for a system
that has multiple hart arrays, this is not the case any more.

Add a new "hartid-base" property so that hartid number can be
assigned based on the property value.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/riscv_hart.c         | 3 ++-
 include/hw/riscv/riscv_hart.h | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/riscv_hart.c b/hw/riscv/riscv_hart.c
index 6620e41cb7..5b98227db6 100644
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
index 3b52b50571..c75856fa73 100644
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
2.21.0


