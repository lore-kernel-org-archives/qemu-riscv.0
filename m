Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nd7g8-0008Bi-Ji
	for mharc-qemu-riscv@gnu.org; Sat, 09 Apr 2022 05:46:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1nd7g4-0008Ad-Cx; Sat, 09 Apr 2022 05:46:45 -0400
Received: from fossa.birch.relay.mailchannels.net ([23.83.209.62]:58326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1nd7g0-0008PA-PM; Sat, 09 Apr 2022 05:46:43 -0400
X-Sender-Id: hostpapa|x-authuser|frederic@petrot.fr
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id 34CCC820E43;
 Sat,  9 Apr 2022 09:46:34 +0000 (UTC)
Received: from hp220.hostpapa.com (unknown [127.0.0.6])
 (Authenticated sender: hostpapa)
 by relay.mailchannels.net (Postfix) with ESMTPA id 2D5CF820DA9;
 Sat,  9 Apr 2022 09:46:33 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1649497593; a=rsa-sha256;
 cv=none;
 b=wZwndjE+Y0R2nakNdQW478usGToTffRpUDxhABrSmU9MnS1YX2CpJNbBZpjXU061aGHNpX
 sXXXgP0RT/a1NFSbRjM3RzPx0f1Fam/y/WggdYdgk1fHciJDnCmVnNQcF2ObB6XEUyq+W3
 LTTaNsoIrGLcel830Bn6IX6wYmKWu6uz7qec683txO7XfyxRvueISyzUbCMCgybQLodtJm
 OuZ7nj7Efaql/EGIcUzU9q8GvzbPQpO4EPfzcS0s38pZv//cV15738QE86O2nQ8J636CbY
 td09dpyxS8tTXNUGOTyav1qXXw5bHG+Kecw6r9PscIMcw+z35aq6KwdamukX+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net; s=arc-2022; t=1649497593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:dkim-signature;
 bh=QPSQ97GUjeQ6/DRfDdaCPE8sawxD8D0lroFvaqGgerY=;
 b=ICLr3DANs9hNSTpYvvTrflPmrRBvWsSSZGP7B7ANCAAtOX4oevHH6/B4C92yVDe8uD1QqK
 qKlEXDjbAHg/Bun6Y5WJctfTA9kVhZIWRrrsHZfl3S/uF6iYFHj3l9gbZ08XwhID7eozG9
 o4764+JnMrR5mi1uWiMilvClcm/PWNSF+rnz+C2iVF9aFC8XnLjQZ2K/6/8nWcQnFto9rH
 r+3bH8iGEzv2BdKtwv/gsAZD9E7u5OeSrxVHuGBWECjsv00LdRky1vL7RPnL9/0GXqhYeb
 3fNSKuTRZC3LKNajqeHUsVk2z8Ab9y3+3gtNHoNLtSZenX7So1gJxsRSSddj0w==
ARC-Authentication-Results: i=1; rspamd-54997cf457-mhv9v;
 auth=pass smtp.auth=hostpapa
 smtp.mailfrom=frederic.petrot@univ-grenoble-alpes.fr
X-Sender-Id: hostpapa|x-authuser|frederic@petrot.fr
Received: from hp220.hostpapa.com (hp220.hostpapa.com [69.90.161.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384)
 by 100.101.255.152 (trex/6.7.1); Sat, 09 Apr 2022 09:46:34 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostpapa|x-authuser|frederic@petrot.fr
X-MailChannels-Auth-Id: hostpapa
X-Lyrical-Tank: 0bf458a700f91b08_1649497593934_66776267
X-MC-Loop-Signature: 1649497593934:3736765251
X-MC-Ingress-Time: 1649497593934
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=petrot.fr; 
 s=default;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QPSQ97GUjeQ6/DRfDdaCPE8sawxD8D0lroFvaqGgerY=; b=lZcSxAKHwgcnYFcrN81k/XySmh
 izPmNXBfWSPYmV6N0DPbSJNl7onFR7axVli3j2WB9LiMVIbJwLVf760uokfYaNZCMcUurBpvlKYSQ
 vNd5owmrqBGR9xQzrksy6k8TDj6zXbT3Klys4ay7N8t63t6d8lreXkiXRn29JWdw5CBM1Q2IetYtd
 7V3VLGlveyXVKqm8jV+377DXqPbCLW/MpixzG3vW+lFNVM8KzVPqb62D2QGjVE+sJlNEqZAqpD+IX
 ZDYR6jpqcuXjRdPYmQj1HxhDC8mjp8ibK70mZiFd7Pz8rz33Q/z1maC7SLZWeyWg4SO6/7ejvcNsl
 o1v3xw+g==;
Received: from 35.201.90.79.rev.sfr.net ([79.90.201.35]:39314
 helo=palmier.u-ga.fr) by hp220.hostpapa.com with esmtpa (Exim 4.94.2)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1nd7fv-000ltT-3q; Sat, 09 Apr 2022 11:46:32 +0200
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: [PATCH] target/riscv: replace TARGET_LONG_BITS in gdbstub
Date: Sat,  9 Apr 2022 11:46:11 +0200
Message-Id: <20220409094612.1908512-2-frederic.petrot@univ-grenoble-alpes.fr>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220409094612.1908512-1-frederic.petrot@univ-grenoble-alpes.fr>
References: <20220409094612.1908512-1-frederic.petrot@univ-grenoble-alpes.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-AuthUser: frederic@petrot.fr
Received-SPF: neutral client-ip=23.83.209.62;
 envelope-from=frederic.petrot@univ-grenoble-alpes.fr;
 helo=fossa.birch.relay.mailchannels.net
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NEUTRAL=0.779,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sat, 09 Apr 2022 09:46:46 -0000

Now that we have misa xlen, use that in riscv gdbstub.c instead of the
TARGET_LONG_BITS define, and use riscv_cpu_mxl_bits to provide the number of
bits in a consistent way.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
---
 target/riscv/gdbstub.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index 9ed049c29e..1602f76d2b 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -305,7 +305,7 @@ static int riscv_gen_dynamic_csr_xml(CPUState *cs, int base_reg)
     CPURISCVState *env = &cpu->env;
     GString *s = g_string_new(NULL);
     riscv_csr_predicate_fn predicate;
-    int bitsize = 16 << env->misa_mxl_max;
+    int bitsize = riscv_cpu_mxl_bits(env);
     int i;
 
     /* Until gdb knows about 128-bit registers */
@@ -385,10 +385,11 @@ static int ricsv_gen_dynamic_vector_xml(CPUState *cs, int base_reg)
 
     for (i = 0; i < 7; i++) {
         g_string_append_printf(s,
-                               "<reg name=\"%s\" bitsize=\"%d\""
+                               "<reg name=\"%s\" bitsize=\"%lu\""
                                " regnum=\"%d\" group=\"vector\""
                                " type=\"int\"/>",
-                               vector_csrs[i], TARGET_LONG_BITS, base_reg++);
+                               vector_csrs[i], riscv_cpu_mxl_bits(&cpu->env),
+                               base_reg++);
         num_regs++;
     }
 
-- 
2.35.1


