Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 422C8C43458
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 06:11:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wi4R2-0001E8-Nh; Fri, 10 Jul 2026 02:10:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1wi4Qm-00019C-AZ
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 02:09:50 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1wi4Qk-0001ue-Py
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 02:09:48 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-2cc7e86e7aeso4384365ad.2
 for <qemu-riscv@nongnu.org>; Thu, 09 Jul 2026 23:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1783663785; x=1784268585; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=O/7FEaWq6GSW5DMyLSgoZ6CKEjGk7z8oVAnel2Qt41s=;
 b=Cym43GzWRc4C+ZRQhUf7PObP+vYyVDJt50UjO5xjKw69g9wB/7FzBpIhA41jjFGY+s
 pD85GgnLLryqTJyokJtCre/X/7uGmKhkePl9fm62uUTO/F/hQ8vwP4pGbQpnrnsEQd3F
 mO/BmndDVsMRvp5rbEswg1xk9iSDkXpquEpfmuUkcoeN9l8d1ZAXMS9FK+2foQDcitub
 rE9YjdhtTLtC7i7qWQ6RvY6I9gidalB+T/r/0r1CwQklLWtPSUlcSMxa/inQ0bSboTIr
 n1tJROL3tDAwerMJCtuiRhBQ9XoS0x1SuvjRFuybGfYsR3aUcCcUFnKuEjrtOQ0wa01L
 tzdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783663785; x=1784268585;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=O/7FEaWq6GSW5DMyLSgoZ6CKEjGk7z8oVAnel2Qt41s=;
 b=gxPg4QQ2Fd149zpP8msFdgwDIpuhym7Es+IUd2oYqH/tjCDX3iZ5RKVsmomhHtaFkZ
 QXwtl3rDhvn0pqUB6RgBsp0ZzhJ6ToyxUld4sPLSN+x9Fchky3s1Q5RNisaynJnxSzQo
 h/Tlwpb8rn62/jNX+ZL0ZeHcmT/IaSioVFr4sQmu9VFUP3yOo0Z7BAeZWy2eNTlJ9/+W
 9nXgVmEhAUIijlH3bC5V49IBNyhdlnrIYJkCwPazybRE06QWo1LCwJikAVOu3n8uGFfD
 ebovJu6hW10uaf00J5NgjaN5uip6mY/OJ4mdbpa2bunNreuzQqpSe07F5KFh83ZN0hkO
 VixQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqAABQu87CF7/UF8j5+Br0o9F8xm7hnR6cZmjntBGgDf008viA50IpVFAyTM+4jNM7Zcp4JGywQ2PGZ@nongnu.org
X-Gm-Message-State: AOJu0YyjLKWBWBOhvkGPjZ+/Daz/fTJ33X/mjtsR6aIEjysAcD4Tw7Sj
 y81iY84Ctb/F6poOdgoh4c1qW30d7Zk81UGL2EAQCBcjF5Sudtlzp/AQUoEBMOdI9DFnl8XmAdl
 wdbgGmXPCOw==
X-Gm-Gg: AfdE7cnzRPC9ThrrbKUMRpNbg9U+pD3Y49R+jsVeUqtFEIxI3GvF3TQMemBkmLEL9BD
 5UhMpuvCOhvWpqiRLqb8YPvSSOmeDjCt589sqz6TeiA2Cqfn+vlZ6hu1zCxi6XGoBxAwGTduen6
 nnkMc4yxdW7vsfv7ka3Ti6Dan85CO/xAWDhCkdJxNHGR8GkKEK3ZljwTmJz8xH1PiSvByKx7nx1
 FJ4xf4Wptj/sF84x63dtyfJVSKewPkmL7FXFZTVYfIMhQeTR/Yg+05/7GtD8nxdaa+ncxa83uNl
 3PbqqJQG4HgkRx3nTbaB4UAAKB78qjCEyJgd+DRHJ+pVgBLjCIHmM5pFU6obqNcnJah3sKN3cx0
 mKTEJu4uJdQ3Htg9/zDtK2bparWvSWey6hueoRDylILYxgYvQfGG/PqQEl239u3K/0EzsGrP7VG
 K90yiVZBk3Y9HkKk5rectj7NGdmWhu6Y+NkTA4NLM=
X-Received: by 2002:a17:903:110f:b0:2c9:bd64:8c8b with SMTP id
 d9443c01a7336-2ccea40dd61mr111099385ad.31.1783663785285; 
 Thu, 09 Jul 2026 23:09:45 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ccc9d59e33sm53344255ad.74.2026.07.09.23.09.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2026 23:09:44 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 qemu-riscv@nongnu.org (open list:SiFive Machines),
 Frank Chang <frank.chang@sifive.com>, Max Chou <max.chou@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v5 6/7] target/riscv: Update Zicclsm ISA string and expose it
 as a CPU property
Date: Fri, 10 Jul 2026 14:09:13 +0800
Message-ID: <20260710060914.1227027-7-frank.chang@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710060914.1227027-1-frank.chang@sifive.com>
References: <20260710060914.1227027-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x635.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

From: Frank Chang <frank.chang@sifive.com>

Update Zicclsm ISA string and expose it as a CPU property to allow user
to turn on/off Zicclsm extension.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Max Chou <max.chou@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 7ee89f6fc4b..04b1ac22f11 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -164,7 +164,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zicboz, PRIV_VERSION_1_12_0, ext_zicboz),
     ISA_INTERNAL_EXT_DATA_ENTRY(ziccamoa, PRIV_VERSION_1_11_0, has_priv_1_11),
     ISA_INTERNAL_EXT_DATA_ENTRY(ziccif, PRIV_VERSION_1_11_0, has_priv_1_11),
-    ISA_INTERNAL_EXT_DATA_ENTRY(zicclsm, PRIV_VERSION_1_11_0, has_priv_1_11),
+    ISA_EXT_DATA_ENTRY(zicclsm, PRIV_VERSION_1_11_0, ext_zicclsm),
     ISA_EXT_DATA_ENTRY(ziccrse, PRIV_VERSION_1_11_0, ext_ziccrse),
     ISA_EXT_DATA_ENTRY(zicfilp, PRIV_VERSION_1_12_0, ext_zicfilp),
     ISA_EXT_DATA_ENTRY(zicfiss, PRIV_VERSION_1_13_0, ext_zicfiss),
-- 
2.43.0


