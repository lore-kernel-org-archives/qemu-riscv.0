Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1poPPk-0005Kn-AG
	for mharc-qemu-riscv@gnu.org; Mon, 17 Apr 2023 10:01:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1poPPO-0004TM-Fn
 for qemu-riscv@nongnu.org; Mon, 17 Apr 2023 10:00:44 -0400
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1poPPM-0003Bp-JZ
 for qemu-riscv@nongnu.org; Mon, 17 Apr 2023 10:00:42 -0400
Received: by mail-oo1-xc30.google.com with SMTP id
 k13-20020a4ad98d000000b00542416816b1so1425064oou.7
 for <qemu-riscv@nongnu.org>; Mon, 17 Apr 2023 07:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681740039; x=1684332039;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Sgaf/JnDDYPpAXnnL9XBJVICYBNvpJ0R6zun3ny+PWo=;
 b=fSAN5XjuaCbd3dP/QGvh+rDQNMK5KR/7jhRlaQvDBMEjnQ/XPYs/JXGJPe/PyBP+Ao
 7A3oSdSPVbHD8witOkr15JFPvDKSpe59Ky3UNbZQgewXAVo2xp5HwvZkTf/mCulVbFCZ
 NugIlaAWuVx4V6qF+58N9b6Bsrz+chWv1/un65kzpuEz74hKg1T/6JAQa8m+imrErvBT
 xEUj55N48ovp6QnCELuiRwh8opEqP/Z90TEM7kZxRzkQYlblN+83Pm4fpyRwKThMEKkU
 pbO4z8cxalxWyOb/lUWnKQTDmpVfEFRnIBdw/cVho6Dvq+2xQJuFTyrLL4dludvzRLO9
 1Kgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681740039; x=1684332039;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Sgaf/JnDDYPpAXnnL9XBJVICYBNvpJ0R6zun3ny+PWo=;
 b=gxdKhlCpMXzqCbxuE/qfwfh21w57iEEcyPDi6EX3BDvcNOj/ZMkdNupPBuXjHzTC0B
 esPLgQzi8HKPQc9AZthf750PXeQRyGemWfrkWQae9j9RhsjqrXM31g+tvAaegKirVkzN
 T1sD1HnLHe+CVYHLxyY9VVFERTFcsLGJIOq8BQtkeSm8AkUjJ1F47dRob5UTumk5/PnC
 Ly9XiW6M2t6OPJpIFq4RzOR1Roh5OVBNgKVAfDEyiD2iEsyvKYAjXbC4nLPGFGli/MUO
 ladTn72Gkt/7Rki57EgqN0XvVDP3XG1QeBhQDW0ZH2/LKmRWxuqyl2H9PubFUZalZa8G
 fpZw==
X-Gm-Message-State: AAQBX9dXKieUGG8AL9vMoTcXEZZKlV6bHefUcF9CRIjeSLlSnx/CI/9w
 Du8p+s7lStPeFfIzX5CPpvH+ji6XxcmN/esyLI8=
X-Google-Smtp-Source: AKy350Zn+pWXSx99j5wpZbW4W07nhwwzoNCdAY8tz3a3S+8iJYU/JzIvfsnTrkUpzlGQ47NQ3z84bw==
X-Received: by 2002:a4a:41cd:0:b0:542:5d35:12a0 with SMTP id
 x196-20020a4a41cd000000b005425d3512a0mr4260497ooa.3.1681740039110; 
 Mon, 17 Apr 2023 07:00:39 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([191.255.108.232])
 by smtp.gmail.com with ESMTPSA id
 x16-20020a05687031d000b001726cfeea97sm4531868oac.29.2023.04.17.07.00.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 07:00:38 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v7 05/12] target/riscv: Mask the implicitly enabled extensions
 in isa_string based on priv version
Date: Mon, 17 Apr 2023 11:00:06 -0300
Message-Id: <20230417140013.58893-6-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417140013.58893-1-dbarboza@ventanamicro.com>
References: <20230417140013.58893-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c30;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 17 Apr 2023 14:00:49 -0000

From: Weiwei Li <liweiwei@iscas.ac.cn>

Using implicitly enabled extensions such as Zca/Zcf/Zcd instead of their
super extensions can simplify the extension related check. However, they
may have higher priv version than their super extensions. So we should mask
them in the isa_string based on priv version to make them invisible to user
if the specified priv version is lower than their minimal priv version.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index dd35cf378f..9bb0e6b180 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1721,7 +1721,8 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str,
     int i;
 
     for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
-        if (isa_ext_is_enabled(cpu, &isa_edata_arr[i])) {
+        if (cpu->env.priv_ver >= isa_edata_arr[i].min_version &&
+            isa_ext_is_enabled(cpu, &isa_edata_arr[i])) {
             new = g_strconcat(old, "_", isa_edata_arr[i].name, NULL);
             g_free(old);
             old = new;
-- 
2.39.2


