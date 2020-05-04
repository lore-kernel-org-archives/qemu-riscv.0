Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jVd2F-0003uj-JV
	for mharc-qemu-riscv@gnu.org; Mon, 04 May 2020 11:29:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jVd2D-0003qz-VN
 for qemu-riscv@nongnu.org; Mon, 04 May 2020 11:29:33 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:36450
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jVd2C-0003s1-LM
 for qemu-riscv@nongnu.org; Mon, 04 May 2020 11:29:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588606171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v9XYIGI7HOjYX2BqAYx0wu+sDnz+yL5U2cNQmNKxyCM=;
 b=fm7vGPVAWBt27pmSetiJznkpIJl9dYvR+xvrh8aSggxvCkFpcABxM3jhtenIcWpizJtg/r
 p8hblBJ0Y4287OD8owFZSWfonICpDj0ATzlYxpx9aXadSSJ5XABbjb/kdzuEdCvrWDwV/t
 3PYGjkXJw3T2nBQSbNtx7HiWGk+H62Q=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-ErLnXXMkOOWQz4Ifi19QuQ-1; Mon, 04 May 2020 11:29:30 -0400
X-MC-Unique: ErLnXXMkOOWQz4Ifi19QuQ-1
Received: by mail-wr1-f69.google.com with SMTP id q13so2090414wrn.14
 for <qemu-riscv@nongnu.org>; Mon, 04 May 2020 08:29:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tI1yUxIlcdhOIzObTuos8yemfQFI0fwt06hTRp539vo=;
 b=P+SIMZdEzC7zmP4z6mij27kulhdLNc+7zSi3J8+TpSccWd0FIBfta+AOC8RjlaSqeI
 XGlX7ukQ6wKuqJwplwxYG4+a2EfmPynsaWRQTfCnqH24MowFGCw8EpS/yuJQ38z96rcD
 anTCOhp8xUMLU+PdkbH3NmX6pO9TwAXXGGALDXoixjkY35txUEl7tjAp95tUHC5qHeMj
 +m6j/GiQyU4enEKfLN7C7/37Ni8gm/sw+I/KyWuyAGjgqUkvecjSdzHJqXbJpyiBDO3h
 DSovYgA5a//ICVWMdD08x8OrKkoc3RS4B7T0FY2PbF/rD4jS4/l4LknSND36FGlendSb
 UxRQ==
X-Gm-Message-State: AGi0PubnGfIzgUKh24/AgtHnULpF0igPwT7pjRYFnpwdzJWk0MCZEDtu
 kmkP0z2NHfahAvLoTs03AfWM6WUhohoAgYNG0jodz1SyQkLTS6aqV/jJH5xOYBTtsyKfZDKV2v8
 LdKVvr9CK26WEtNs=
X-Received: by 2002:adf:cd88:: with SMTP id q8mr17234767wrj.67.1588606168886; 
 Mon, 04 May 2020 08:29:28 -0700 (PDT)
X-Google-Smtp-Source: APiQypJXB5v9cBYgwUOfBejThxl9wqhuCaWRUOFfQePgNSjFUhC9lxyJkxBUbyEzJ4q/VjnjYu4Vhw==
X-Received: by 2002:adf:cd88:: with SMTP id q8mr17234750wrj.67.1588606168714; 
 Mon, 04 May 2020 08:29:28 -0700 (PDT)
Received: from x1w.redhat.com (26.red-88-21-207.staticip.rima-tde.net.
 [88.21.207.26])
 by smtp.gmail.com with ESMTPSA id i129sm14838974wmi.20.2020.05.04.08.29.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 08:29:28 -0700 (PDT)
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
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 01/12] Makefile: Only build virtiofsd if system-mode is
 enabled
Date: Mon,  4 May 2020 17:29:11 +0200
Message-Id: <20200504152922.21365-2-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200504152922.21365-1-philmd@redhat.com>
References: <20200504152922.21365-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/04 05:09:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
X-List-Received-Date: Mon, 04 May 2020 15:29:34 -0000

Do not build the virtiofsd helper when configured with
--disable-system.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 34275f57c9..e46b6ef5d4 100644
--- a/Makefile
+++ b/Makefile
@@ -345,7 +345,7 @@ HELPERS-y +=3D vhost-user-gpu$(EXESUF)
 vhost-user-json-y +=3D contrib/vhost-user-gpu/50-qemu-gpu.json
 endif
=20
-ifeq ($(CONFIG_LINUX)$(CONFIG_SECCOMP)$(CONFIG_LIBCAP_NG),yyy)
+ifeq ($(CONFIG_SOFTMMU)$(CONFIG_LINUX)$(CONFIG_SECCOMP)$(CONFIG_LIBCAP_NG)=
,yyyy)
 HELPERS-y +=3D virtiofsd$(EXESUF)
 vhost-user-json-y +=3D tools/virtiofsd/50-qemu-virtiofsd.json
 endif
--=20
2.21.3


