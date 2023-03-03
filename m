Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pY0zw-0001YO-2g
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 03:42:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zm-0000Va-Pw
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:42:30 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zl-0007o9-2p
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:42:30 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 m8-20020a17090a4d8800b002377bced051so5490543pjh.0
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 00:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832948;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UjoHNib20pIew68vmS2SQnjR8Wl4697BfKVl8VxrneI=;
 b=b3j5GJOL5QdaxDL/LTpOcHtWvm3s79jA+JOHqOpb7XZqllJdW6fTFoZoC+79ylznlF
 Ik3gwSdv2SnHsIZm/yPxeVLZHJ50wyK3ROUXIU11xAeQT+Tf4SNsrJLHUzKZ99kUfDuX
 aXq2t63K5qsAa6CB4fABwFUifwJuxkuxCF/RjEo6esE8tiO1qNdFjieb7KVudhLfifAe
 2TqWZm98Xa4VwQJ6wUEYbnF4JnOL+DgOugiT+0zC8mzsuP9JIGmbXJCek+92qVctvgE/
 5fpz74Kfk0qcdx1R3474s0dE+0i46W8pyKDExPCe+g2Lv6rrD2yDN6zZ53FTvqnKgbzD
 J/Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832948;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UjoHNib20pIew68vmS2SQnjR8Wl4697BfKVl8VxrneI=;
 b=yySPnfJR0rff+mBFxBhjH3s8v+vQ+BSJ3JvXw50afi1H3DeofIta2byvASNLRyCFFr
 vuX7ZCyMS31oU1GFRBc8OcEfvDZGF6yXzwSPWqJ8l15F5f+61CHx6B0r1AL+UwyAmF+4
 lhyjKNFAvtNwXMfGmKlJIiGNQDHw841FTEl/kZ10NXk0oJozCEQudvlLBaXSvdz3s4uW
 bYMpkoZS3IzltckniT5BriRumRLG8nK8X4uB1zzf/CHqiUwNYDY0EC48Da1gm376pivI
 8kAY7U+kyNqdFVrGSRrU5gUpjKnnHWUklQegKu/IdGYbkWLUU54bKMcbuugU7Iu1kuAw
 7R0A==
X-Gm-Message-State: AO0yUKVPQ/xyNFQ5OPKYnkJKvRDy0iS7tFtxiTIzq5rXGQdsZ04WKS8r
 T7BgKSU1vatdqpDXh/kORMShIs6xLqSiPbJE
X-Google-Smtp-Source: AK7set+m8h+lB3RMD8f5BO1sG16b5O4P9UN0Lqpv/dArizhBfuNz2Emd7CTpR7aMRGT/FLcHUnbirQ==
X-Received: by 2002:a05:6a20:3d92:b0:bf:58d1:ce86 with SMTP id
 s18-20020a056a203d9200b000bf58d1ce86mr4746868pzi.5.1677832947977; 
 Fri, 03 Mar 2023 00:42:27 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 f34-20020a635562000000b00502fd141ffbsm974595pgm.49.2023.03.03.00.42.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:42:27 -0800 (PST)
Subject: [PULL 53/59] target/riscv: Export Svadu property
Date: Fri,  3 Mar 2023 00:37:34 -0800
Message-Id: <20230303083740.12817-54-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303083740.12817-1-palmer@rivosinc.com>
References: <20230303083740.12817-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Weiwei Li <liweiwei@iscas.ac.cn>, Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=palmer@rivosinc.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 03 Mar 2023 08:42:31 -0000

From: Weiwei Li <liweiwei@iscas.ac.cn>

Set it default true for backward compatibility

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-ID: <20230224040852.37109-7-liweiwei@iscas.ac.cn>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/cpu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 32cb297cfe..1be9f3f836 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -107,6 +107,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(ssaia, true, PRIV_VERSION_1_12_0, ext_ssaia),
     ISA_EXT_DATA_ENTRY(sscofpmf, true, PRIV_VERSION_1_12_0, ext_sscofpmf),
     ISA_EXT_DATA_ENTRY(sstc, true, PRIV_VERSION_1_12_0, ext_sstc),
+    ISA_EXT_DATA_ENTRY(svadu, true, PRIV_VERSION_1_12_0, ext_svadu),
     ISA_EXT_DATA_ENTRY(svinval, true, PRIV_VERSION_1_12_0, ext_svinval),
     ISA_EXT_DATA_ENTRY(svnapot, true, PRIV_VERSION_1_12_0, ext_svnapot),
     ISA_EXT_DATA_ENTRY(svpbmt, true, PRIV_VERSION_1_12_0, ext_svpbmt),
@@ -1104,6 +1105,8 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
     DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
 
+    DEFINE_PROP_BOOL("svadu", RISCVCPU, cfg.ext_svadu, true),
+
     DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
     DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
     DEFINE_PROP_BOOL("svpbmt", RISCVCPU, cfg.ext_svpbmt, false),
-- 
2.39.2


