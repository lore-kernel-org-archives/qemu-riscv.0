Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nd7gB-0008EH-Rf
	for mharc-qemu-riscv@gnu.org; Sat, 09 Apr 2022 05:46:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1nd7g4-0008Ae-7B; Sat, 09 Apr 2022 05:46:45 -0400
Received: from fossa.birch.relay.mailchannels.net ([23.83.209.62]:62662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1nd7g0-0008P5-Ot; Sat, 09 Apr 2022 05:46:43 -0400
X-Sender-Id: hostpapa|x-authuser|frederic@petrot.fr
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id CFB1A5A0CF5;
 Sat,  9 Apr 2022 09:46:32 +0000 (UTC)
Received: from hp220.hostpapa.com (unknown [127.0.0.6])
 (Authenticated sender: hostpapa)
 by relay.mailchannels.net (Postfix) with ESMTPA id 77CE95A0C02;
 Sat,  9 Apr 2022 09:46:31 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1649497592; a=rsa-sha256;
 cv=none;
 b=jSd5JihafycdjM2qybh4wz+7H/0VS0lkpBmIjF9an7kSCtSj7FUyy0ssp3PdVLyIGpisG0
 w0sAm+6XMuazggCW8b1XtQHDWORfGC5kYDcVhgK07+dVXP4Z64SdaRnpod08KHQaTsZkd6
 f1DKJVhW9jrJSfJzdZoN0RH+85g3jwvVgrAAMlnRMRjLVhbPyblCTHGsyFiyaWb6gPIFBJ
 09vc2USKddxXBHfY0ntZNyxyCsSMrw5ghCJ8np+2JR87gcYvNRlNcPgOKBP71aYhBdWWgs
 4bl73QXJ2wUEHNoOsCwDMVjEWgNdMUG36ujcunFrivYtf4nrq8tW1vvBRMXq3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net; s=arc-2022; t=1649497592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:dkim-signature;
 bh=HWmcwwdH1xKc8gNXux8j1R+iwn7trM5HwjZnc2GT3QE=;
 b=vaebOl2Lf+A1q/4UvcJiZtIENirsV6fHTUtR2awp/TYsAXfxZv1HSOATlLo6aSER00C4/H
 KpVPfuKFXDvxZgkAVey5ZdDsWaDUBEIKdZbhjoxYl1tJp63qL6xYTQd5SNpe55vUtU2WFh
 Ey/f7wDFTfsR6jUFGLbc7jbiP5R0X0yf+ln9KypyfslyPv0jgukdmPj6WJf1tM/GU9ljIU
 j4NnrcEBRtMUWshVaSh8BwIA8IvUkAcjbNO5YAo8HDOzP/+2BKum6rUWBo+LdmsQamNylo
 pzup/IHVURx0T/Dl4kOr5Nsp2ZylVekiZowWb5FwZtlayJt0hzhKoK2EF4ukcQ==
ARC-Authentication-Results: i=1; rspamd-54997cf457-w6zzv;
 auth=pass smtp.auth=hostpapa
 smtp.mailfrom=frederic.petrot@univ-grenoble-alpes.fr
X-Sender-Id: hostpapa|x-authuser|frederic@petrot.fr
Received: from hp220.hostpapa.com (hp220.hostpapa.com [69.90.161.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384)
 by 100.101.255.152 (trex/6.7.1); Sat, 09 Apr 2022 09:46:32 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostpapa|x-authuser|frederic@petrot.fr
X-MailChannels-Auth-Id: hostpapa
X-Fumbling-Duck: 6fde09e747fcd9b5_1649497592369_174969923
X-MC-Loop-Signature: 1649497592369:3355481604
X-MC-Ingress-Time: 1649497592368
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=petrot.fr; 
 s=default;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HWmcwwdH1xKc8gNXux8j1R+iwn7trM5HwjZnc2GT3QE=; b=VrcgfR68QNXwq4gVHjzgZtLxve
 NRftXhom9J2rSdEsw2U/NaDnMvgsscCIfa8UhalRY3UmkOuo/3op8Yt0VFemvX5F3V4ta2aTsEFV1
 AKyKBClMtN8vefEJCL1tYb182+gYxGEJwAK4fp7jFkSqIzMSE3d3MBQF7A+/Bw3F1jQfDPMLEJq3d
 jdqvpNgWQZGntahHGiInSWfLneqVJ8YiqrmABNFs2ZuAOhXsljsU8belEBrjL2zi+QO6l9ysbUK9h
 Dlc3h0T9I/p6xqZppHqDYZhczMKxvGDtIkNkqoNc0KT4BXichqE7vCF5D6uWJkRkEh5fxahy+aCs6
 17cjpClQ==;
Received: from 35.201.90.79.rev.sfr.net ([79.90.201.35]:39314
 helo=palmier.u-ga.fr) by hp220.hostpapa.com with esmtpa (Exim 4.94.2)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1nd7ft-000ltT-Eg; Sat, 09 Apr 2022 11:46:30 +0200
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: [PATCH] target/riscv: use xlen in forging isa string
Date: Sat,  9 Apr 2022 11:46:10 +0200
Message-Id: <20220409094612.1908512-1-frederic.petrot@univ-grenoble-alpes.fr>
X-Mailer: git-send-email 2.35.1
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
X-List-Received-Date: Sat, 09 Apr 2022 09:46:48 -0000

Since we now have xlen in misa, let's not use TARGET_LONG_BITS while
forging the isa string, and use instead riscv_cpu_mxl_bits.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
---
 target/riscv/cpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 0c774056c5..0644b3843e 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -984,7 +984,8 @@ char *riscv_isa_string(RISCVCPU *cpu)
     int i;
     const size_t maxlen = sizeof("rv128") + sizeof(riscv_single_letter_exts);
     char *isa_str = g_new(char, maxlen);
-    char *p = isa_str + snprintf(isa_str, maxlen, "rv%d", TARGET_LONG_BITS);
+    char *p = isa_str + snprintf(isa_str, maxlen, "rv%lu",
+                                 riscv_cpu_mxl_bits(&cpu->env));
     for (i = 0; i < sizeof(riscv_single_letter_exts) - 1; i++) {
         if (cpu->env.misa_ext & RV(riscv_single_letter_exts[i])) {
             *p++ = qemu_tolower(riscv_single_letter_exts[i]);
-- 
2.35.1


