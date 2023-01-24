Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pKPTC-0007GL-Fl
	for mharc-qemu-riscv@gnu.org; Tue, 24 Jan 2023 15:00:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pKPSk-00076Q-Kq
 for qemu-riscv@nongnu.org; Tue, 24 Jan 2023 15:00:10 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pKPSi-0002e3-F2
 for qemu-riscv@nongnu.org; Tue, 24 Jan 2023 15:00:09 -0500
Received: by mail-wr1-x42e.google.com with SMTP id z5so14995451wrt.6
 for <qemu-riscv@nongnu.org>; Tue, 24 Jan 2023 12:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N7n8pswPkAZaRTA9ogyPX3kWNifKRUmtja86fT61IcQ=;
 b=D+Lo6aG4jgg3R6afbjWPzxI17s/RFg1Ue+lf0JhAU0GEjRKisXT4eU5iKlHYOj6mNT
 jdOvf94O48XKgILk9GZPqNXt4BNm6RQqWyPida75QGbHBYWKrpx0MSmP+bjTd8nvRqS1
 2MaOklJh/kqmm3aKyf6qByEEtImf9qxIQZmL5ODP9Wv8rx5kcPuhiSTpbqyaEk45czt1
 3uGxoq+evYGgB3PXjdVSMc++xhpO8qh7ai5qctjOlU+seyQpoRLoLopTOcxA1epNfxIu
 MZiYvs7PEzbgCmVgb/AKPFfzJ/g6fqJzcAgpJzzIivahP7njcTg1XWsLzIl9wJZnaQ+j
 fWKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N7n8pswPkAZaRTA9ogyPX3kWNifKRUmtja86fT61IcQ=;
 b=csRZU41r/BuPY/aEGfdYmbLXKjNy9KupgUdLrsExUlPs+goViuMDPZandM6vFIXTgP
 EN+YpKs9o8Zj/2YA/AHKdsNcGRqKER5LS/Ho6orlgKbqY6PYhl8OaqcKrlRi6BfODLxx
 qGJaAgYba8nBm2U9Zt7Wmy+HzTOEHfU4YBgvaRBYWY1zMBaIAU8xGTL1l6HgTIgDeFj+
 9pi3jZ0SLzKyUjEmzghnJHcAz4r5cS7PBrb/PpCwvozGsLGj2k73+W7Gy3GnaFdeqiHN
 t5et5f7pQnxm/xsySUocP3a3YsWrNSdJZlDAt/OcPGKff4+KsrXG8Gv1tF+IjRA+5QWq
 j8KQ==
X-Gm-Message-State: AFqh2koQUJyGe4qAexCOU8h/KHgC3oXhB4eoCGn8TeY2FzjpHN+WdKMo
 FM0+XKX0CC7LbQdCwwRy9vxg4de7KXZG69SU
X-Google-Smtp-Source: AMrXdXsWedHheNHinE6JcZDevf7GxWkDYwoNc++EnZ/9Dq2eLON0DlciLsmnX4F3hJTlHPk30q//kQ==
X-Received: by 2002:adf:c688:0:b0:2bf:94ea:67ca with SMTP id
 j8-20020adfc688000000b002bf94ea67camr14663246wrg.25.1674590406654; 
 Tue, 24 Jan 2023 12:00:06 -0800 (PST)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 j26-20020a5d453a000000b002bdf3809f59sm2607005wra.38.2023.01.24.12.00.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 12:00:06 -0800 (PST)
From: Christoph Muellner <christoph.muellner@vrull.eu>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko.stuebner@vrull.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Nelson Chu <nelson@rivosinc.com>, Kito Cheng <kito.cheng@sifive.com>,
 Cooper Qu <cooper.qu@linux.alibaba.com>,
 Lifang Xia <lifang_xia@linux.alibaba.com>,
 Yunhai Shang <yunhai@linux.alibaba.com>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
Subject: [PATCH v3 11/14] RISC-V: Set minimum priv version for Zfh to 1.11
Date: Tue, 24 Jan 2023 20:59:42 +0100
Message-Id: <20230124195945.181842-12-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230124195945.181842-1-christoph.muellner@vrull.eu>
References: <20230124195945.181842-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 24 Jan 2023 20:00:12 -0000

From: Christoph Müllner <christoph.muellner@vrull.eu>

There are no differences for floating point instructions in priv version 1.11
and 1.12. There is also no dependency for Zfh to priv version 1.12.
Therefore allow Zfh to be enabled for priv version 1.11.

Acked-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
---
 target/riscv/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6121a5e4ba..b18df9fa2a 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -77,7 +77,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zifencei, true, PRIV_VERSION_1_10_0, ext_ifencei),
     ISA_EXT_DATA_ENTRY(zihintpause, true, PRIV_VERSION_1_10_0, ext_zihintpause),
     ISA_EXT_DATA_ENTRY(zawrs, true, PRIV_VERSION_1_12_0, ext_zawrs),
-    ISA_EXT_DATA_ENTRY(zfh, true, PRIV_VERSION_1_12_0, ext_zfh),
+    ISA_EXT_DATA_ENTRY(zfh, true, PRIV_VERSION_1_11_0, ext_zfh),
     ISA_EXT_DATA_ENTRY(zfhmin, true, PRIV_VERSION_1_12_0, ext_zfhmin),
     ISA_EXT_DATA_ENTRY(zfinx, true, PRIV_VERSION_1_12_0, ext_zfinx),
     ISA_EXT_DATA_ENTRY(zdinx, true, PRIV_VERSION_1_12_0, ext_zdinx),
-- 
2.39.0


