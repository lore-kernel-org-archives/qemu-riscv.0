Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lKHZI-0006wH-Qx
	for mharc-qemu-riscv@gnu.org; Thu, 11 Mar 2021 04:25:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.wagner@ulal.de>)
 id 1lK74p-0007Vo-Ue; Wed, 10 Mar 2021 17:13:11 -0500
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.221]:12326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.wagner@ulal.de>)
 id 1lK74c-0008J1-Kp; Wed, 10 Mar 2021 17:13:11 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1615414366; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=p7BCeXU4MFCAaq2DVxFMebTq8AEFDdntwjhMvEOCOO0J9bvJLJKlbbsa/68tKhWJfy
 UkKxGn1yEGprxkPSjAv795fnZ9Qm5Z9D1EyAnHmSV2UcfvPaV4f9nysljrdEiOvuXt4U
 /XpHWl2+4XKOQsmBYJdBzNTzfrhC2MAhFkxmFRyyr+cmBXpNo6k5RsTR7rPBl3Shyyvb
 IdScDkcDKwdFnCtmutYzoE+EwJTh/uisAEDA0pA9stGMU3uItnKd38N9nRfvtULlkjj6
 jlR+BVHWKqD2LX+uCZ82T9xKfakvI0rKaj7gWWXZVe4XWEd3NuX69UlbqcM6yl51O3t6
 Pqyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1615414366;
 s=strato-dkim-0002; d=strato.com;
 h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
 bh=CVPEcgbsyUYGRsFw6HrjdR70qzqtM6xpWIU1hL9sKJo=;
 b=V/fCfsxU+QKvdpM8sjVsHFnXLa4mvWcXKRBJApUQrYW6yO+QkOfUzyDiB/bkNXIM5A
 xGKdwHsT130xHWl4rgQqYFbForFhuUPkdaYff5rPThyvgir1ZDnDnKnqHPDQFYBMGaiy
 ReNk36CK8HtohL2KHlkcxsezZ/65u2p5vA9dUiXLKOqAvpVogNZsFZmMlmKi98JTzBHE
 XOCAn7bZZ3nllo0AE1MrBY5AtPEYVTdjWNgia1RKlxRQ8+n5V089K9t0ZZ2VeAdzaFYQ
 47kCQJlduZCRNuRgzQK7ARgGi3TuvudAqp1ueNdYF1Qkx/Be5KWtfqjlFSgeKyvkMIlo
 6Rmw==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1615414366;
 s=strato-dkim-0002; d=ulal.de;
 h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
 bh=CVPEcgbsyUYGRsFw6HrjdR70qzqtM6xpWIU1hL9sKJo=;
 b=imj8TTsffFhmh+xVdpV1JQwS6NrAbTTs7wovwRyMHe2Ca2BLeXaEOlXQWF5DZSyff5
 qdpAEMlDyFMLOczw4K319F6rtXhV8H+mGLaE/TurX3wwYB+0gyajol83hYy5fN5ZaMS8
 6CQKPbZ+RCbCfZ/GYS6gJBmbLgQB4L3IfWXlr1d9CiXA9Mc4xCcSDMydassDNRSk7Ffn
 HigjRjbUSz/lZ6xE/qPUSvNLOfIiJpSTYynjTESKxnvpM6ueWnRWZOsFzEoEFTHjRC3o
 0rSzUW4jcxcfNAi1XaI+G13psZ5HxOU7Mih4RBdJNOE0JR5CfO0XaqGSZo6ss2z0pP6m
 M5Fg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":LWABbUGmf/p3d3fx281mbpk9zOkHG9L8L9MnY9md4b2JTjr0xj1uUQtYCbJnQW9aY+KkeQGMenXp0qUAdrQH120clOmDF/WGxJ0nW9BfcQmjrQti"
X-RZG-CLASS-ID: mo00
Received: from alwagner-T470s.fritz.box by smtp.strato.de (RZmta 47.20.3 AUTH)
 with ESMTPSA id c075a1x2AMCjNQk
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 10 Mar 2021 23:12:45 +0100 (CET)
From: Alexander Wagner <alexander.wagner@ulal.de>
To: qemu-devel@nongnu.org
Cc: Alexander Wagner <alexander.wagner@ulal.de>, Alistair.Francis@wdc.com,
 qemu-riscv@nongnu.org, palmer@dabbelt.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de
Subject: [PATCH] hw/riscv: Fix OT IBEX reset vector
Date: Wed, 10 Mar 2021 23:12:08 +0100
Message-Id: <20210310221208.167990-1-alexander.wagner@ulal.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=81.169.146.221;
 envelope-from=alexander.wagner@ulal.de; helo=mo4-p00-ob.smtp.rzone.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 11 Mar 2021 04:25:19 -0500
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
X-List-Received-Date: Wed, 10 Mar 2021 22:13:12 -0000

The IBEX documentation [1] specifies the reset vector to be "the most
significant 3 bytes of the boot address and the reset value (0x80) as
the least significant byte".

[1] https://github.com/lowRISC/ibex/blob/master/doc/03_reference/exception_interrupts.rst

Signed-off-by: Alexander Wagner <alexander.wagner@ulal.de>
---
 hw/riscv/opentitan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index e168bffe69..ca4c1be6f6 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -120,7 +120,7 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
                             &error_abort);
     object_property_set_int(OBJECT(&s->cpus), "num-harts", ms->smp.cpus,
                             &error_abort);
-    object_property_set_int(OBJECT(&s->cpus), "resetvec", 0x8090, &error_abort);
+    object_property_set_int(OBJECT(&s->cpus), "resetvec", 0x8080, &error_abort);
     sysbus_realize(SYS_BUS_DEVICE(&s->cpus), &error_abort);
 
     /* Boot ROM */
-- 
2.25.1


