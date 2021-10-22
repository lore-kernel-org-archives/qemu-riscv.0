Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdncu-0005NC-7K
	for mharc-qemu-riscv@gnu.org; Fri, 22 Oct 2021 02:02:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdncs-0005KE-Jm
 for qemu-riscv@nongnu.org; Fri, 22 Oct 2021 02:01:58 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:19533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdncq-0000b7-S8
 for qemu-riscv@nongnu.org; Fri, 22 Oct 2021 02:01:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634882515; x=1666418515;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dpntyRnHTikKRtxN6DseX429CSmC9NPZZZaSvHpfntY=;
 b=Jtx6jMbVJYSulGYXEgd3fuS5oSVS2PKy0LPlkABMT+ULCpkXqF759I6W
 bqpJKXwtAbEhJ7ZhrIYCPxGXQUBBA5N/vj+R29tbg8S7n3Mei8ky1htWO
 QPbAGptte4yQm7U0Nb0gK0iVOLCtG4P8h8UiAq+WiLOPa6ODFfOK+EJmD
 wA2p4KlpW96v7GpQ/nu7UlXzUL34GsiykjE8KLsf+tDlmrZafLonxcSeq
 vGLdhLVgyTHhdwWBA7KJ+IAk4VIsd8iCBYblZa9GdtUyRZgORA6PhOZl8
 kKAZaFnuGKde7soS+eixRKQl/Rk0osuP3EPVKEYLI52b/kGDx0I/VjLR/ g==;
X-IronPort-AV: E=Sophos;i="5.87,171,1631548800"; d="scan'208";a="188365213"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 22 Oct 2021 14:01:53 +0800
IronPort-SDR: ajLVph+rlWpOwzpixd5lSNK/HagwiPNYX/X0ZStUP7A9aFsaOfVtw3PWHZFplJm7nWleQ1PsC/
 eVbRIe4/ZAD4aSQ4uK1X+X4Kh9YlHKt5mx1SnPx4g4xylfOdR/DSH8Gw2ueyqFDn9bFPhTgWci
 7o6KNoxReKE3XfDpgp1vh3Ql4AakSya7SflTLGUoBTYCfTzg/vqEoVKrLTTn0V59iOb3itO2Bu
 /OSGKK2c3uywgSAQ8ka8waw75VbX8MAydwkLq9EkScJBz8b+3Nay316ANxO/LLZBvMTYSciIUb
 oiGqOTVy1eeTgsroTd8TcR5H
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 22:37:30 -0700
IronPort-SDR: vFyJsZfzLtUZRtqVsWs5b9Uc3yumc2v4A8NHYcFca6BvQ3XL7PPvAm8AsSEBSU5DtLU6YfHkim
 nqLTfJ21a0xkGCsQ6LwcSt+0FChVQfvDpWyNkIj0ao0fRUoERuBZ2XCIwjEWAbCKHh7lU8hrXi
 IVN9PdRRxljtqqZLMgj8YlKhC0feZHpLMbbLNY6K/mLApVaDtTnDBVKtTh5amq0hsmQePPX0VI
 3owdeHQG+UMvhCbHnK1I9SK8tqmLd8HbiaE0OtEHrJDLh3xn03AurLjJj6NBLzvuysAH/Mp+DU
 its=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 23:01:55 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HbDJL3FWrz1RtVn
 for <qemu-riscv@nongnu.org>; Thu, 21 Oct 2021 23:01:54 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1634882513; x=1637474514; bh=dpntyRnHTikKRtxN6D
 seX429CSmC9NPZZZaSvHpfntY=; b=AHEZD8j39zfaZ5LSe50ScYJ3OCJReepZ4L
 FxXSKdt2YTBULpNe2Lg2rJhegZbfoHs8tF5LKBrrN2Sauh5JYzrqg7H2sIrtPVg9
 2ZNDCB6OTY7gT2NUfCzogOO4SUJuMWWkl+R8Y6/iOH007roY37bf2I6CCI0+slzJ
 WqA1pOfgFrCPXb3x1KmgGGnEF6T2yofMQ/Bmgj3TAPv44xGuy5qqwhlHI8t1vX7x
 NGzBDieU88mzep7ySQAvhA4bziMQYmzuMTrmiQYzR/PHlc0frVnFPdE4L/Kqsm56
 AnJ7JTgddr0Zra2LecNPJOjdMU+Bp/BZ01To8c788d76ZS0A9IxA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id WbU7sl-3kX36 for <qemu-riscv@nongnu.org>;
 Thu, 21 Oct 2021 23:01:53 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.39])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HbDJC6NHYz1RtVl;
 Thu, 21 Oct 2021 23:01:47 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, alistair23@gmail.com,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, bmeng.cn@gmail.com,
 Alistair Francis <Alistair.Francis@wdc.com>
Subject: [PATCH v2 2/5] hw/riscv: boot: Add a PLIC config string function
Date: Fri, 22 Oct 2021 16:01:30 +1000
Message-Id: <20211022060133.3045020-2-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211022060133.3045020-1-alistair.francis@opensource.wdc.com>
References: <20211022060133.3045020-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=9222bbd82=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Fri, 22 Oct 2021 06:01:58 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Add a generic function that can create the PLIC strings.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/boot.h |  2 ++
 hw/riscv/boot.c         | 25 +++++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index 0e89400b09..baff11dd8a 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -31,6 +31,8 @@
=20
 bool riscv_is_32bit(RISCVHartArrayState *harts);
=20
+char *riscv_plic_hart_config_string(int hart_count);
+
 target_ulong riscv_calc_kernel_start_addr(RISCVHartArrayState *harts,
                                           target_ulong firmware_end_addr=
);
 target_ulong riscv_find_and_load_firmware(MachineState *machine,
diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 993bf89064..5629f990aa 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -38,6 +38,31 @@ bool riscv_is_32bit(RISCVHartArrayState *harts)
     return riscv_cpu_is_32bit(&harts->harts[0].env);
 }
=20
+/*
+ * Return the per-socket PLIC hart topology configuration string
+ * (caller must free with g_free())
+ */
+char *riscv_plic_hart_config_string(int hart_count)
+{
+    g_autofree const char **vals =3D g_new(const char *, hart_count + 1)=
;
+    int i;
+
+    for (i =3D 0; i < hart_count; i++) {
+        CPUState *cs =3D qemu_get_cpu(i);
+        CPURISCVState *env =3D &RISCV_CPU(cs)->env;
+
+        if (riscv_has_ext(env, RVS)) {
+            vals[i] =3D "MS";
+        } else {
+            vals[i] =3D "M";
+        }
+    }
+    vals[i] =3D NULL;
+
+    /* g_strjoinv() obliges us to cast away const here */
+    return g_strjoinv(",", (char **)vals);
+}
+
 target_ulong riscv_calc_kernel_start_addr(RISCVHartArrayState *harts,
                                           target_ulong firmware_end_addr=
) {
     if (riscv_is_32bit(harts)) {
--=20
2.31.1


