Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkTy4-0000yn-Tu
	for mharc-qemu-riscv@gnu.org; Thu, 06 Apr 2023 14:04:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pkTy2-0000yB-MH
 for qemu-riscv@nongnu.org; Thu, 06 Apr 2023 14:04:14 -0400
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pkTxz-0000bX-AV
 for qemu-riscv@nongnu.org; Thu, 06 Apr 2023 14:04:13 -0400
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-17aeb49429eso43236466fac.6
 for <qemu-riscv@nongnu.org>; Thu, 06 Apr 2023 11:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680804249;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Icj8LJrcjPq3IF6xteJO3s06K22LZ2lAQ/eG3IMJq7M=;
 b=Lcr9cnXN5CaX7rTPcS2q68stKp58dDvKzIYEayC3nDziSKZ7DB425p3DjSDjFDadD2
 CSDclfdwoq3Nqy5IL1ZrgLo8rkBQoNR+C6Zsfw1ab8fF7Bqrd0E9xxEOocycA5saYg69
 TJmt+pPUnvH0WFiCmNH+OQ+1VRoBqRIP0Q0B6vUPlPMMSOnkGvRySNPkOKE+xG88bP9L
 ZZ4MdtXu48CW8//GjJyNgKn0WKbU4wLB4hfVI48NYBMlIPWZ/+688KALrp/Aw0KCCrV5
 8v55w7qF+EUcN/0cs66ZcKxI35K5mHy16cIqwDcAaHH75lg4MCFZlzEQ9fWfnslPhI8+
 59LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680804249;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Icj8LJrcjPq3IF6xteJO3s06K22LZ2lAQ/eG3IMJq7M=;
 b=4OldMil8Fo3Vw/7n13955PCQivCaL89rrqTkJRhslOCD67s8iqn0X8YHrO3Se9vveo
 v8IWwUPDThSB2nMcwx1CZl73COdmx59MxIxpJ6Gnhgdz4EZxRfQjeNrgEcK7WeZqaixz
 QNUuJ2lM5FxGTDq8dCdv705lN5sc21+9hbFNe/KeJ1rSiIFZeLEScSzHP/tTzMFV1vuu
 D7RTdn2K2FcuBmRxhYQ2/BJzLLZIXylyx3ZZ6HDE5nOEuJViF2Xl2/t9b1+TQ9S40qQr
 J162Sv/wzDm8Kk1ubSPmfY05IXUREhlGRU2VFt0mwOnmtFpxUuwzt7xH5ddXYmErrgSw
 O5oA==
X-Gm-Message-State: AAQBX9coz3D/XrjczXAvM9G72frMtWhBNrDY4YHZ5/cZTmsqywQNJHVM
 gF5IuEZK7bY8Se0VaGs+BeZsmQ==
X-Google-Smtp-Source: AKy350ZZeMogHyo9jc5OMBPdcNnmksJBx8mBfNGD3YWd7EM62yocaHXGThs5faYTr9BaIsTj3wIIHA==
X-Received: by 2002:a05:6870:148c:b0:183:fc80:7362 with SMTP id
 k12-20020a056870148c00b00183fc807362mr159165oab.2.1680804248816; 
 Thu, 06 Apr 2023 11:04:08 -0700 (PDT)
Received: from grind.. ([191.255.108.232]) by smtp.gmail.com with ESMTPSA id
 g4-20020a056870d20400b0018045663fc5sm906309oac.48.2023.04.06.11.04.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 11:04:08 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 03/20] target/riscv/cpu.c: remove 'multi_letter' from
 isa_ext_data
Date: Thu,  6 Apr 2023 15:03:34 -0300
Message-Id: <20230406180351.570807-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230406180351.570807-1-dbarboza@ventanamicro.com>
References: <20230406180351.570807-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2a.google.com
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
X-List-Received-Date: Thu, 06 Apr 2023 18:04:15 -0000

We don't have MISA extensions in isa_edata_arr[] anymore. Remove the
redundant 'multi_letter' field from isa_ext_data.

Suggested-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 132 ++++++++++++++++++++++-----------------------
 1 file changed, 65 insertions(+), 67 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ed8f36c649..fbf612292a 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -48,13 +48,12 @@ static const char riscv_single_letter_exts[] = "IEMAFDQCPVH";
 
 struct isa_ext_data {
     const char *name;
-    bool multi_letter;
     int min_version;
     int ext_enable_offset;
 };
 
-#define ISA_EXT_DATA_ENTRY(_name, _m_letter, _min_ver, _prop) \
-    {#_name, _m_letter, _min_ver, offsetof(struct RISCVCPUConfig, _prop)}
+#define ISA_EXT_DATA_ENTRY(_name, _min_ver, _prop) \
+    {#_name, _min_ver, offsetof(struct RISCVCPUConfig, _prop)}
 
 /*
  * Here are the ordering rules of extension naming defined by RISC-V
@@ -77,68 +76,68 @@ struct isa_ext_data {
  * instead.
  */
 static const struct isa_ext_data isa_edata_arr[] = {
-    ISA_EXT_DATA_ENTRY(zicbom, true, PRIV_VERSION_1_12_0, ext_icbom),
-    ISA_EXT_DATA_ENTRY(zicboz, true, PRIV_VERSION_1_12_0, ext_icboz),
-    ISA_EXT_DATA_ENTRY(zicond, true, PRIV_VERSION_1_12_0, ext_zicond),
-    ISA_EXT_DATA_ENTRY(zicsr, true, PRIV_VERSION_1_10_0, ext_icsr),
-    ISA_EXT_DATA_ENTRY(zifencei, true, PRIV_VERSION_1_10_0, ext_ifencei),
-    ISA_EXT_DATA_ENTRY(zihintpause, true, PRIV_VERSION_1_10_0, ext_zihintpause),
-    ISA_EXT_DATA_ENTRY(zawrs, true, PRIV_VERSION_1_12_0, ext_zawrs),
-    ISA_EXT_DATA_ENTRY(zfh, true, PRIV_VERSION_1_11_0, ext_zfh),
-    ISA_EXT_DATA_ENTRY(zfhmin, true, PRIV_VERSION_1_11_0, ext_zfhmin),
-    ISA_EXT_DATA_ENTRY(zfinx, true, PRIV_VERSION_1_12_0, ext_zfinx),
-    ISA_EXT_DATA_ENTRY(zdinx, true, PRIV_VERSION_1_12_0, ext_zdinx),
-    ISA_EXT_DATA_ENTRY(zca, true, PRIV_VERSION_1_12_0, ext_zca),
-    ISA_EXT_DATA_ENTRY(zcb, true, PRIV_VERSION_1_12_0, ext_zcb),
-    ISA_EXT_DATA_ENTRY(zcf, true, PRIV_VERSION_1_12_0, ext_zcf),
-    ISA_EXT_DATA_ENTRY(zcd, true, PRIV_VERSION_1_12_0, ext_zcd),
-    ISA_EXT_DATA_ENTRY(zce, true, PRIV_VERSION_1_12_0, ext_zce),
-    ISA_EXT_DATA_ENTRY(zcmp, true, PRIV_VERSION_1_12_0, ext_zcmp),
-    ISA_EXT_DATA_ENTRY(zcmt, true, PRIV_VERSION_1_12_0, ext_zcmt),
-    ISA_EXT_DATA_ENTRY(zba, true, PRIV_VERSION_1_12_0, ext_zba),
-    ISA_EXT_DATA_ENTRY(zbb, true, PRIV_VERSION_1_12_0, ext_zbb),
-    ISA_EXT_DATA_ENTRY(zbc, true, PRIV_VERSION_1_12_0, ext_zbc),
-    ISA_EXT_DATA_ENTRY(zbkb, true, PRIV_VERSION_1_12_0, ext_zbkb),
-    ISA_EXT_DATA_ENTRY(zbkc, true, PRIV_VERSION_1_12_0, ext_zbkc),
-    ISA_EXT_DATA_ENTRY(zbkx, true, PRIV_VERSION_1_12_0, ext_zbkx),
-    ISA_EXT_DATA_ENTRY(zbs, true, PRIV_VERSION_1_12_0, ext_zbs),
-    ISA_EXT_DATA_ENTRY(zk, true, PRIV_VERSION_1_12_0, ext_zk),
-    ISA_EXT_DATA_ENTRY(zkn, true, PRIV_VERSION_1_12_0, ext_zkn),
-    ISA_EXT_DATA_ENTRY(zknd, true, PRIV_VERSION_1_12_0, ext_zknd),
-    ISA_EXT_DATA_ENTRY(zkne, true, PRIV_VERSION_1_12_0, ext_zkne),
-    ISA_EXT_DATA_ENTRY(zknh, true, PRIV_VERSION_1_12_0, ext_zknh),
-    ISA_EXT_DATA_ENTRY(zkr, true, PRIV_VERSION_1_12_0, ext_zkr),
-    ISA_EXT_DATA_ENTRY(zks, true, PRIV_VERSION_1_12_0, ext_zks),
-    ISA_EXT_DATA_ENTRY(zksed, true, PRIV_VERSION_1_12_0, ext_zksed),
-    ISA_EXT_DATA_ENTRY(zksh, true, PRIV_VERSION_1_12_0, ext_zksh),
-    ISA_EXT_DATA_ENTRY(zkt, true, PRIV_VERSION_1_12_0, ext_zkt),
-    ISA_EXT_DATA_ENTRY(zve32f, true, PRIV_VERSION_1_10_0, ext_zve32f),
-    ISA_EXT_DATA_ENTRY(zve64f, true, PRIV_VERSION_1_10_0, ext_zve64f),
-    ISA_EXT_DATA_ENTRY(zve64d, true, PRIV_VERSION_1_10_0, ext_zve64d),
-    ISA_EXT_DATA_ENTRY(zvfh, true, PRIV_VERSION_1_12_0, ext_zvfh),
-    ISA_EXT_DATA_ENTRY(zvfhmin, true, PRIV_VERSION_1_12_0, ext_zvfhmin),
-    ISA_EXT_DATA_ENTRY(zhinx, true, PRIV_VERSION_1_12_0, ext_zhinx),
-    ISA_EXT_DATA_ENTRY(zhinxmin, true, PRIV_VERSION_1_12_0, ext_zhinxmin),
-    ISA_EXT_DATA_ENTRY(smaia, true, PRIV_VERSION_1_12_0, ext_smaia),
-    ISA_EXT_DATA_ENTRY(ssaia, true, PRIV_VERSION_1_12_0, ext_ssaia),
-    ISA_EXT_DATA_ENTRY(sscofpmf, true, PRIV_VERSION_1_12_0, ext_sscofpmf),
-    ISA_EXT_DATA_ENTRY(sstc, true, PRIV_VERSION_1_12_0, ext_sstc),
-    ISA_EXT_DATA_ENTRY(svadu, true, PRIV_VERSION_1_12_0, ext_svadu),
-    ISA_EXT_DATA_ENTRY(svinval, true, PRIV_VERSION_1_12_0, ext_svinval),
-    ISA_EXT_DATA_ENTRY(svnapot, true, PRIV_VERSION_1_12_0, ext_svnapot),
-    ISA_EXT_DATA_ENTRY(svpbmt, true, PRIV_VERSION_1_12_0, ext_svpbmt),
-    ISA_EXT_DATA_ENTRY(xtheadba, true, PRIV_VERSION_1_11_0, ext_xtheadba),
-    ISA_EXT_DATA_ENTRY(xtheadbb, true, PRIV_VERSION_1_11_0, ext_xtheadbb),
-    ISA_EXT_DATA_ENTRY(xtheadbs, true, PRIV_VERSION_1_11_0, ext_xtheadbs),
-    ISA_EXT_DATA_ENTRY(xtheadcmo, true, PRIV_VERSION_1_11_0, ext_xtheadcmo),
-    ISA_EXT_DATA_ENTRY(xtheadcondmov, true, PRIV_VERSION_1_11_0, ext_xtheadcondmov),
-    ISA_EXT_DATA_ENTRY(xtheadfmemidx, true, PRIV_VERSION_1_11_0, ext_xtheadfmemidx),
-    ISA_EXT_DATA_ENTRY(xtheadfmv, true, PRIV_VERSION_1_11_0, ext_xtheadfmv),
-    ISA_EXT_DATA_ENTRY(xtheadmac, true, PRIV_VERSION_1_11_0, ext_xtheadmac),
-    ISA_EXT_DATA_ENTRY(xtheadmemidx, true, PRIV_VERSION_1_11_0, ext_xtheadmemidx),
-    ISA_EXT_DATA_ENTRY(xtheadmempair, true, PRIV_VERSION_1_11_0, ext_xtheadmempair),
-    ISA_EXT_DATA_ENTRY(xtheadsync, true, PRIV_VERSION_1_11_0, ext_xtheadsync),
-    ISA_EXT_DATA_ENTRY(xventanacondops, true, PRIV_VERSION_1_12_0, ext_XVentanaCondOps),
+    ISA_EXT_DATA_ENTRY(zicbom, PRIV_VERSION_1_12_0, ext_icbom),
+    ISA_EXT_DATA_ENTRY(zicboz, PRIV_VERSION_1_12_0, ext_icboz),
+    ISA_EXT_DATA_ENTRY(zicond, PRIV_VERSION_1_12_0, ext_zicond),
+    ISA_EXT_DATA_ENTRY(zicsr, PRIV_VERSION_1_10_0, ext_icsr),
+    ISA_EXT_DATA_ENTRY(zifencei, PRIV_VERSION_1_10_0, ext_ifencei),
+    ISA_EXT_DATA_ENTRY(zihintpause, PRIV_VERSION_1_10_0, ext_zihintpause),
+    ISA_EXT_DATA_ENTRY(zawrs, PRIV_VERSION_1_12_0, ext_zawrs),
+    ISA_EXT_DATA_ENTRY(zfh, PRIV_VERSION_1_11_0, ext_zfh),
+    ISA_EXT_DATA_ENTRY(zfhmin, PRIV_VERSION_1_11_0, ext_zfhmin),
+    ISA_EXT_DATA_ENTRY(zfinx, PRIV_VERSION_1_12_0, ext_zfinx),
+    ISA_EXT_DATA_ENTRY(zdinx, PRIV_VERSION_1_12_0, ext_zdinx),
+    ISA_EXT_DATA_ENTRY(zca, PRIV_VERSION_1_12_0, ext_zca),
+    ISA_EXT_DATA_ENTRY(zcb, PRIV_VERSION_1_12_0, ext_zcb),
+    ISA_EXT_DATA_ENTRY(zcf, PRIV_VERSION_1_12_0, ext_zcf),
+    ISA_EXT_DATA_ENTRY(zcd, PRIV_VERSION_1_12_0, ext_zcd),
+    ISA_EXT_DATA_ENTRY(zce, PRIV_VERSION_1_12_0, ext_zce),
+    ISA_EXT_DATA_ENTRY(zcmp, PRIV_VERSION_1_12_0, ext_zcmp),
+    ISA_EXT_DATA_ENTRY(zcmt, PRIV_VERSION_1_12_0, ext_zcmt),
+    ISA_EXT_DATA_ENTRY(zba, PRIV_VERSION_1_12_0, ext_zba),
+    ISA_EXT_DATA_ENTRY(zbb, PRIV_VERSION_1_12_0, ext_zbb),
+    ISA_EXT_DATA_ENTRY(zbc, PRIV_VERSION_1_12_0, ext_zbc),
+    ISA_EXT_DATA_ENTRY(zbkb, PRIV_VERSION_1_12_0, ext_zbkb),
+    ISA_EXT_DATA_ENTRY(zbkc, PRIV_VERSION_1_12_0, ext_zbkc),
+    ISA_EXT_DATA_ENTRY(zbkx, PRIV_VERSION_1_12_0, ext_zbkx),
+    ISA_EXT_DATA_ENTRY(zbs, PRIV_VERSION_1_12_0, ext_zbs),
+    ISA_EXT_DATA_ENTRY(zk, PRIV_VERSION_1_12_0, ext_zk),
+    ISA_EXT_DATA_ENTRY(zkn, PRIV_VERSION_1_12_0, ext_zkn),
+    ISA_EXT_DATA_ENTRY(zknd, PRIV_VERSION_1_12_0, ext_zknd),
+    ISA_EXT_DATA_ENTRY(zkne, PRIV_VERSION_1_12_0, ext_zkne),
+    ISA_EXT_DATA_ENTRY(zknh, PRIV_VERSION_1_12_0, ext_zknh),
+    ISA_EXT_DATA_ENTRY(zkr, PRIV_VERSION_1_12_0, ext_zkr),
+    ISA_EXT_DATA_ENTRY(zks, PRIV_VERSION_1_12_0, ext_zks),
+    ISA_EXT_DATA_ENTRY(zksed, PRIV_VERSION_1_12_0, ext_zksed),
+    ISA_EXT_DATA_ENTRY(zksh, PRIV_VERSION_1_12_0, ext_zksh),
+    ISA_EXT_DATA_ENTRY(zkt, PRIV_VERSION_1_12_0, ext_zkt),
+    ISA_EXT_DATA_ENTRY(zve32f, PRIV_VERSION_1_10_0, ext_zve32f),
+    ISA_EXT_DATA_ENTRY(zve64f, PRIV_VERSION_1_10_0, ext_zve64f),
+    ISA_EXT_DATA_ENTRY(zve64d, PRIV_VERSION_1_10_0, ext_zve64d),
+    ISA_EXT_DATA_ENTRY(zvfh, PRIV_VERSION_1_12_0, ext_zvfh),
+    ISA_EXT_DATA_ENTRY(zvfhmin, PRIV_VERSION_1_12_0, ext_zvfhmin),
+    ISA_EXT_DATA_ENTRY(zhinx, PRIV_VERSION_1_12_0, ext_zhinx),
+    ISA_EXT_DATA_ENTRY(zhinxmin, PRIV_VERSION_1_12_0, ext_zhinxmin),
+    ISA_EXT_DATA_ENTRY(smaia, PRIV_VERSION_1_12_0, ext_smaia),
+    ISA_EXT_DATA_ENTRY(ssaia, PRIV_VERSION_1_12_0, ext_ssaia),
+    ISA_EXT_DATA_ENTRY(sscofpmf, PRIV_VERSION_1_12_0, ext_sscofpmf),
+    ISA_EXT_DATA_ENTRY(sstc, PRIV_VERSION_1_12_0, ext_sstc),
+    ISA_EXT_DATA_ENTRY(svadu, PRIV_VERSION_1_12_0, ext_svadu),
+    ISA_EXT_DATA_ENTRY(svinval, PRIV_VERSION_1_12_0, ext_svinval),
+    ISA_EXT_DATA_ENTRY(svnapot, PRIV_VERSION_1_12_0, ext_svnapot),
+    ISA_EXT_DATA_ENTRY(svpbmt, PRIV_VERSION_1_12_0, ext_svpbmt),
+    ISA_EXT_DATA_ENTRY(xtheadba, PRIV_VERSION_1_11_0, ext_xtheadba),
+    ISA_EXT_DATA_ENTRY(xtheadbb, PRIV_VERSION_1_11_0, ext_xtheadbb),
+    ISA_EXT_DATA_ENTRY(xtheadbs, PRIV_VERSION_1_11_0, ext_xtheadbs),
+    ISA_EXT_DATA_ENTRY(xtheadcmo, PRIV_VERSION_1_11_0, ext_xtheadcmo),
+    ISA_EXT_DATA_ENTRY(xtheadcondmov, PRIV_VERSION_1_11_0, ext_xtheadcondmov),
+    ISA_EXT_DATA_ENTRY(xtheadfmemidx, PRIV_VERSION_1_11_0, ext_xtheadfmemidx),
+    ISA_EXT_DATA_ENTRY(xtheadfmv, PRIV_VERSION_1_11_0, ext_xtheadfmv),
+    ISA_EXT_DATA_ENTRY(xtheadmac, PRIV_VERSION_1_11_0, ext_xtheadmac),
+    ISA_EXT_DATA_ENTRY(xtheadmemidx, PRIV_VERSION_1_11_0, ext_xtheadmemidx),
+    ISA_EXT_DATA_ENTRY(xtheadmempair, PRIV_VERSION_1_11_0, ext_xtheadmempair),
+    ISA_EXT_DATA_ENTRY(xtheadsync, PRIV_VERSION_1_11_0, ext_xtheadsync),
+    ISA_EXT_DATA_ENTRY(xventanacondops, PRIV_VERSION_1_12_0, ext_XVentanaCondOps),
 };
 
 static bool isa_ext_is_enabled(RISCVCPU *cpu,
@@ -1741,8 +1740,7 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str,
     int i;
 
     for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
-        if (isa_edata_arr[i].multi_letter &&
-            isa_ext_is_enabled(cpu, &isa_edata_arr[i])) {
+        if (isa_ext_is_enabled(cpu, &isa_edata_arr[i])) {
             new = g_strconcat(old, "_", isa_edata_arr[i].name, NULL);
             g_free(old);
             old = new;
-- 
2.39.2


