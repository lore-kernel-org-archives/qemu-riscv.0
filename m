Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nwn9F-0003qR-6i
	for mharc-qemu-riscv@gnu.org; Thu, 02 Jun 2022 11:54:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1nwn97-0003mj-V9; Thu, 02 Jun 2022 11:54:01 -0400
Received: from poodle.tulip.relay.mailchannels.net ([23.83.218.249]:11919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1nwn93-0006fa-PS; Thu, 02 Jun 2022 11:54:01 -0400
X-Sender-Id: hostpapa|x-authuser|frederic@petrot.fr
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id D8600761892;
 Thu,  2 Jun 2022 15:53:44 +0000 (UTC)
Received: from hp220.hostpapa.com (unknown [127.0.0.6])
 (Authenticated sender: hostpapa)
 by relay.mailchannels.net (Postfix) with ESMTPA id B510D761A99;
 Thu,  2 Jun 2022 15:53:43 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1654185224; a=rsa-sha256;
 cv=none;
 b=5HevpaRBRMnIoH3VyTaeQZ5spUHJBpVm2+5klJM6AM+4yN9IjD6UCQeFNmU7/CBVisZhef
 o3frba6LyiMohdA9c6l9HqYtvLxqmplc2UdkznKXsx8ze6fy4pj2P8XrbkKg5euQv5gWC1
 ZZ6ZEx+KCafcrAZ5x4B4pXOEX2zdUIbv5KPvqm/zVZT8roCdipV/TRj1+dZORbY6rJYpND
 KTJeWAenKxNoL1p7rMN03ek1Nn5PMcy7nNtoxX1h+vuWJYsDw5WGe4QVI57mt+4N3KIPdK
 B7jCRFTiV5//76iCglTytbFy9HctWWYqnOAKTZOcdwTN+qNRS9U0acYP2M0KHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net; s=arc-2022; t=1654185224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:dkim-signature;
 bh=Of/o9ErMP7foJ4M0xOd47fw9zg7DcvHZlrTEGrJjK8Y=;
 b=w3fTOps136JSX/kqvnMIFDii+NUhv4rlhUn00rNIeYhFGjIrrbfGCAsXwvoRvehtddE99O
 fncD0EpldQZ4Uccd8uWr+Szuyx2Yf/UzZ1u4E0LwlSPlCSN4dAACDtTZyvOjVsmIVj1UHb
 Sm5IlqPGGPdFfdGgrP5Hp+4br0q8Caqglilhvpmu2Xjma2W0TBr71Ni0niypotIrwpGz9v
 VzjQuaE6WpouNKD214zfFsMVkxJp7Wd2rha7FxEgy3HbEhiK5frxsijwnqc0V3oFka3VS1
 BNOccEAoJlMmFre3t+euyfdHU+omsguQq/g9m3pQFb0OHK6rWtZFDhguVpmgow==
ARC-Authentication-Results: i=1; rspamd-54ff499d4f-llkp9;
 auth=pass smtp.auth=hostpapa
 smtp.mailfrom=frederic.petrot@univ-grenoble-alpes.fr
X-Sender-Id: hostpapa|x-authuser|frederic@petrot.fr
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostpapa|x-authuser|frederic@petrot.fr
X-MailChannels-Auth-Id: hostpapa
X-Chief-Relation: 57bb078f486c88c7_1654185224479_3311900376
X-MC-Loop-Signature: 1654185224479:519241853
X-MC-Ingress-Time: 1654185224479
Received: from hp220.hostpapa.com (hp220.hostpapa.com [69.90.161.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384)
 by 100.98.242.203 (trex/6.7.1); Thu, 02 Jun 2022 15:53:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=petrot.fr; 
 s=default;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Of/o9ErMP7foJ4M0xOd47fw9zg7DcvHZlrTEGrJjK8Y=; b=O+xGXlXzbG361fPP8ei2p8O1i0
 rHWVfDOY2rw6bZ9XMDGFPHhFBF0bYjaWSUT6OLjnBaiiNBY8w24PbwLQ7duB1G0vunWHwh0ZEYK3C
 TTTP+yA6XOedWespgnliYzPWXKxO1bRmlzkBWQVS1JRGP5lTPtE0QPdjrDyQdP0UUZRqeir8CqFr/
 n4J/NZg5qKLUYz3IUbs4MGScIdyCk+vtP1wvM57bQiSGoIzkDrwoE1dr/9Sns8zdiC9zAoC8jV/o7
 bx/sw+rMSDkhtFOglTxyZOUUieGniGwCh1fIE+J+gGVyGqU2df8WTYukyaklbae89jufcObl7rv7m
 4yx7/ijw==;
Received: from palmier.tima.u-ga.fr ([147.171.132.208]:44726
 helo=palmier.u-ga.fr) by hp220.hostpapa.com with esmtpa (Exim 4.94.2)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1nwn8n-008hKU-JG; Thu, 02 Jun 2022 17:53:42 +0200
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: [PATCH] target/riscv/debug.c: keep experimental rv128 support working
Date: Thu,  2 Jun 2022 17:52:46 +0200
Message-Id: <20220602155246.38837-1-frederic.petrot@univ-grenoble-alpes.fr>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-AuthUser: frederic@petrot.fr
Received-SPF: neutral client-ip=23.83.218.249;
 envelope-from=frederic.petrot@univ-grenoble-alpes.fr;
 helo=poodle.tulip.relay.mailchannels.net
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 02 Jun 2022 15:54:02 -0000

Add an MXL_RV128 case in two switches so that no error is triggered when
using the -cpu x-rv128 option.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
---
 target/riscv/debug.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index 2f2a51c732..fc6e13222f 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -77,6 +77,7 @@ static inline target_ulong trigger_type(CPURISCVState *env,
         tdata1 = RV32_TYPE(type);
         break;
     case MXL_RV64:
+    case MXL_RV128:
         tdata1 = RV64_TYPE(type);
         break;
     default:
@@ -123,6 +124,7 @@ static target_ulong tdata1_validate(CPURISCVState *env, target_ulong val,
         tdata1 = RV32_TYPE(t);
         break;
     case MXL_RV64:
+    case MXL_RV128:
         type = extract64(val, 60, 4);
         dmode = extract64(val, 59, 1);
         tdata1 = RV64_TYPE(t);
--
2.36.1


