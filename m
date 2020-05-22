Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jcBQD-0003s0-OL
	for mharc-qemu-riscv@gnu.org; Fri, 22 May 2020 13:25:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jcBQB-0003oJ-N6
 for qemu-riscv@nongnu.org; Fri, 22 May 2020 13:25:23 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:35261
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jcBQ9-0001qf-EK
 for qemu-riscv@nongnu.org; Fri, 22 May 2020 13:25:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590168320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CL2hEmRqA1LEXMFCszT8EAy5Qc2losjLa/A+thU98aw=;
 b=cdZi+SW7Q0HtRqXAu/rOYRAIqG7yBuubRuXuajj0maXpsNrmPg1UuY+whfg+awTJcAwyUs
 QNRPjY0Oi2/BQReRNXSK7ZWrO2xwW1odQp+DGxgGVtE3BsHbWtEo1wL/egqjZ5CuutYxS5
 gOv0F/x3aFd1kg1/rfKI10mEQPAVolQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-68-SuuO_mg-Me2IPp8Ax0Z2lw-1; Fri, 22 May 2020 13:25:19 -0400
X-MC-Unique: SuuO_mg-Me2IPp8Ax0Z2lw-1
Received: by mail-wr1-f70.google.com with SMTP id p2so4662932wrm.6
 for <qemu-riscv@nongnu.org>; Fri, 22 May 2020 10:25:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CL2hEmRqA1LEXMFCszT8EAy5Qc2losjLa/A+thU98aw=;
 b=TA/IEad5KP3d2mXLgOTB5F4wsv1CqM30EJgaIg56isestOSFryEjlkkLwb7c4Fiejc
 CKmWtN2N3ooDXXXcyf/VpxcLzHQs3AURbhCDxsSM4tBcErafbATXqYbz8UF1gSx8vAzT
 TQIh4hhu3cx9p7HhgZ5Ozz+el5DFgEdxUrI5kLmOknQYXvarvoHk/bzQsqsKgqSUCBBa
 9cVIezuSK1SqCwn7A6f5aHAOfAml1i+ppBu2R34SPzTfJWykbPRFYN2YM2BsPbsaPH0P
 qYX26G1gLoVg5TcoixLSwj1Bb1l/SJ49JoXQgWzy9Ep0x28Ghq0Z3g7wckOllDwMLQm8
 6+kA==
X-Gm-Message-State: AOAM5336aoU8j91XrBXiTacIMU1VZB5Es/5NaAX90qGSO9uPHi6pd7Hp
 yrDkU7SKoLATe7QJ7AKnIlY4hCjFb5Tp6cdPODEFCMM1KHMInt+3v5ELlBjrM4Uj6Ns6ZIbJDIZ
 UnbVWOIXNlGAKLzE=
X-Received: by 2002:a7b:c76e:: with SMTP id x14mr14836568wmk.66.1590168317946; 
 Fri, 22 May 2020 10:25:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/BUFYlRbNPUDqgC+Yy5PUJkeU3Fa9faWNYMcRwVTmifznNcN7+AUHGEY657btc7LHWYPvdg==
X-Received: by 2002:a7b:c76e:: with SMTP id x14mr14836558wmk.66.1590168317806; 
 Fri, 22 May 2020 10:25:17 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id r14sm15207666wmb.2.2020.05.22.10.25.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 10:25:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, David Hildenbrand <david@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH v4 01/13] Makefile: Only build virtiofsd if system-mode is
 enabled
Date: Fri, 22 May 2020 19:24:58 +0200
Message-Id: <20200522172510.25784-2-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200522172510.25784-1-philmd@redhat.com>
References: <20200522172510.25784-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/22 11:11:51
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
X-List-Received-Date: Fri, 22 May 2020 17:25:23 -0000

Do not build the virtiofsd helper when configured with
--disable-system.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Tested-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 40e4f7677b..d1af126ea1 100644
--- a/Makefile
+++ b/Makefile
@@ -345,7 +345,7 @@ HELPERS-y += vhost-user-gpu$(EXESUF)
 vhost-user-json-y += contrib/vhost-user-gpu/50-qemu-gpu.json
 endif
 
-ifeq ($(CONFIG_LINUX)$(CONFIG_SECCOMP)$(CONFIG_LIBCAP_NG),yyy)
+ifeq ($(CONFIG_SOFTMMU)$(CONFIG_LINUX)$(CONFIG_SECCOMP)$(CONFIG_LIBCAP_NG),yyyy)
 HELPERS-y += virtiofsd$(EXESUF)
 vhost-user-json-y += tools/virtiofsd/50-qemu-virtiofsd.json
 endif
-- 
2.21.3


