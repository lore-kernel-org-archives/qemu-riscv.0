Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jVd2Q-0004KR-RQ
	for mharc-qemu-riscv@gnu.org; Mon, 04 May 2020 11:29:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jVd2O-0004FL-GX
 for qemu-riscv@nongnu.org; Mon, 04 May 2020 11:29:44 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:28785
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jVd2N-0003ue-OG
 for qemu-riscv@nongnu.org; Mon, 04 May 2020 11:29:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588606183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pUXDmy3WOcwXjDaWqS3e5JUM21KIVuuEif55NSKeGcA=;
 b=Yy1xaHpg1fKLvGCrNBJ4Au29+dwly1k4/Z981cQ7b/RbwlMqhXnmUcOZO78VL9ytbpgjiW
 C3aemV3w5JwuD+tOLYfGW9wOcj7H31+5Hs1egVxnSlsQ8P1aAES3PZqD9t7Fa/Rt7tt7Tw
 2tMEgtBx31dtN5K9YLjFHY6QmVPc+M0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-Qo7Z6WsjNGiP1sYjZK3kjw-1; Mon, 04 May 2020 11:29:40 -0400
X-MC-Unique: Qo7Z6WsjNGiP1sYjZK3kjw-1
Received: by mail-wm1-f72.google.com with SMTP id q5so5095972wmc.9
 for <qemu-riscv@nongnu.org>; Mon, 04 May 2020 08:29:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=onx2YOkWfTdSzAWYbgwOOryDziIctG2Yv+O4LWjV+pg=;
 b=cNV40sFw7ZvnQqWG6T0p/BlLGgBqKlUNh/ayhYbQzc77EZNA6dSe2W+ikVo3SHxBmg
 2KClWvqx8ZJAb101oA8xWJgWSQSR+Rf3ZlMdgTHnabmJ5/m/5EULhP6d7GUmAOIF2rwL
 rtEg/tv05J3Ro3fXEGp4Jq32Fx1rhLdXpXE1munNFDWos1qKNT93KvVDMG91J2Q4NUM1
 Dl8vntKilRAtPgUJfGRPRVoFlWwMzO460d6nQGL35eGp5h4Ni6ouqGGP8gFFasgbe1a4
 yc3qV3jD5cxsIcq3Iwh9Fk29f+8kiYAhSgi9RZMLyjx6vnYzPVzmLR4cWH+riqkFGwDv
 0/pw==
X-Gm-Message-State: AGi0PubMAtxzJzsiFElIciiD7mFluSFu7fPmR02+wozq1wdciAktDBxx
 z1rIyfE8Q9Zvu4uQNkfXQmubrFfpQ1ivEdQIM7V8t1DptN4cfSaJPv8bvqeGoaRZuW6SA9NwZs2
 7NiodaDatFHDhNHQ=
X-Received: by 2002:a1c:f211:: with SMTP id s17mr9758515wmc.168.1588606178909; 
 Mon, 04 May 2020 08:29:38 -0700 (PDT)
X-Google-Smtp-Source: APiQypKiswUwQV6B4+74gAR9WPeC2k5Wg363PSUWRXIigZfvOEP6BnDuYZzURmulxZ+75CGXlIyQkQ==
X-Received: by 2002:a1c:f211:: with SMTP id s17mr9758498wmc.168.1588606178777; 
 Mon, 04 May 2020 08:29:38 -0700 (PDT)
Received: from x1w.redhat.com (26.red-88-21-207.staticip.rima-tde.net.
 [88.21.207.26])
 by smtp.gmail.com with ESMTPSA id q17sm13685124wmj.45.2020.05.04.08.29.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 08:29:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Cornelia Huck <cohuck@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, Richard Henderson <rth@twiddle.net>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 03/12] tests/Makefile: Only display TCG-related tests when
 TCG is available
Date: Mon,  4 May 2020 17:29:13 +0200
Message-Id: <20200504152922.21365-4-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200504152922.21365-1-philmd@redhat.com>
References: <20200504152922.21365-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/04 04:24:57
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Mon, 04 May 2020 15:29:44 -0000

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 tests/Makefile.include | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 03a74b60f6..6bc3d1096b 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -12,8 +12,10 @@ check-help:
 =09@echo " $(MAKE) check-speed          Run qobject speed tests"
 =09@echo " $(MAKE) check-qapi-schema    Run QAPI schema tests"
 =09@echo " $(MAKE) check-block          Run block tests"
+ifeq ($(CONFIG_TCG),y)
 =09@echo " $(MAKE) check-tcg            Run TCG tests"
 =09@echo " $(MAKE) check-softfloat      Run FPU emulation tests"
+endif
 =09@echo " $(MAKE) check-acceptance     Run all acceptance (functional) te=
sts"
 =09@echo
 =09@echo " $(MAKE) check-report.tap     Generates an aggregated TAP test r=
eport"
--=20
2.21.3


