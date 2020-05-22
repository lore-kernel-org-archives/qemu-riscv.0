Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jcBQI-00042p-49
	for mharc-qemu-riscv@gnu.org; Fri, 22 May 2020 13:25:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jcBQG-00040C-Qw
 for qemu-riscv@nongnu.org; Fri, 22 May 2020 13:25:28 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:35914
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jcBQF-0001rz-OV
 for qemu-riscv@nongnu.org; Fri, 22 May 2020 13:25:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590168326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jgZlGUY22rV8RWoGEVzXdsh/Q/2FAX4GHFlUmso+7+4=;
 b=OyiXWS/+uzmwzjx4Jrs4SLbKqF+gz3iXLneOggbPof46YeVbFjbYJNZsK6T66uSif7/KWe
 5z8V0hmfxb0xoNH+Pr8UtagHlIS/kkbZoySppKar1+mhRDxoRYNgfQS7pFnUAhjQ1TGIHE
 ZBKXMUFyO4XKh18iHHBENxDn7D/wMoc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-72SaLwygONmz_VzOQlUB8w-1; Fri, 22 May 2020 13:25:23 -0400
X-MC-Unique: 72SaLwygONmz_VzOQlUB8w-1
Received: by mail-wr1-f70.google.com with SMTP id y7so4636891wrd.12
 for <qemu-riscv@nongnu.org>; Fri, 22 May 2020 10:25:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jgZlGUY22rV8RWoGEVzXdsh/Q/2FAX4GHFlUmso+7+4=;
 b=tTmB0RC0KAU9CfNvEG5VyRpqkQYJ19HKbj1smz+FAs0HFqfxNp0cgit5dfsHldVvS7
 /my4fQYvFJMgBmtoUluAgW7Tzs+KpBQi5dVic1meeqAJkt0NaIClBJvAw+JfNVPDG9LA
 eTc8l+CoSkv7ujbQa/llqBcMPvh6ilQvpe7q3yIE/QyQv10NnmXSJoxOLkkrbzqe2HRi
 s7Q+fDp3MSixoKSicMPCnrYV0nxDtsceVOuWl0LrCng7m92GvkDEVCbANxcVjbeCLPDO
 qJUl4siYryPvfKO/bPVkKBJWqEc62LnOkeMzdZwPgY5nHXW8asLIgM9DuiC48CIqpZPI
 OAdg==
X-Gm-Message-State: AOAM532hhJaKfCOvceGfS4468m1qyXRGvm9z9dzhe0jz0DvplrLPN9b7
 228XUcw0us/ZQrHwNLOf6tYSe3pmq3JF+E9cz9ZINuMy4NBppNsNlthYHNTb8XNhEoKzEomYzz6
 xw19Qq0ZFdeemYxk=
X-Received: by 2002:adf:f6c4:: with SMTP id y4mr4563988wrp.81.1590168322923;
 Fri, 22 May 2020 10:25:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+6a07xH61ez0EqUOI1p9j5aofX1C1m/qY1s4oS5CeugnNzbl2ty/XQ88gT5/sRF2lb+/2Zg==
X-Received: by 2002:adf:f6c4:: with SMTP id y4mr4563964wrp.81.1590168322779;
 Fri, 22 May 2020 10:25:22 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id b12sm10559661wmj.0.2020.05.22.10.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 10:25:22 -0700 (PDT)
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
 Alistair Francis <alistair.francis@wdc.com>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH v4 02/13] configure: Avoid building TCG when not needed
Date: Fri, 22 May 2020 19:24:59 +0200
Message-Id: <20200522172510.25784-3-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200522172510.25784-1-philmd@redhat.com>
References: <20200522172510.25784-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/22 11:12:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Fri, 22 May 2020 17:25:29 -0000

Avoid building TCG when building only tools:

  ./configure --enable-tools --disable-system --disable-user

This saves us from running the soft-float tests enabled since
commit 76170102508.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Tested-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 configure | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/configure b/configure
index 2fc05c4465..35e7951b95 100755
--- a/configure
+++ b/configure
@@ -1663,6 +1663,10 @@ if [ "$ARCH" = "unknown" ]; then
   linux_user="no"
 fi
 
+if [ "$bsd_user" = "no" -a "$linux_user" = "no" -a "$softmmu" = "no" ] ; then
+  tcg="no"
+fi
+
 default_target_list=""
 
 mak_wilds=""
-- 
2.21.3


