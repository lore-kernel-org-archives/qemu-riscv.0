Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jcBR9-0006S7-Bq
	for mharc-qemu-riscv@gnu.org; Fri, 22 May 2020 13:26:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jcBR7-0006N2-Mo
 for qemu-riscv@nongnu.org; Fri, 22 May 2020 13:26:21 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:31732
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jcBR5-0002Fx-JL
 for qemu-riscv@nongnu.org; Fri, 22 May 2020 13:26:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590168378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xzyCO16+5RviPogg4wPbJiKI85apokjUkaWsspBCPSs=;
 b=SXKwCWlkUzxb9XFCLYqoVlp4SGexrngYVKQfISJ1xmT+tu3TaIQihNUY/kEFiBkOKJ07rA
 R4EdlJ7yh1nQEhYDeZYlyXY+GikdCwoVhNiJ91nVBxkmcyk2qIWBYKLZT7DKUtMUtkSjgo
 u2fDWkebuYfAulhHTD3Yo42GLAz3s14=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-WhnUcrdlMS6RmjN6dUH1ew-1; Fri, 22 May 2020 13:26:17 -0400
X-MC-Unique: WhnUcrdlMS6RmjN6dUH1ew-1
Received: by mail-wr1-f70.google.com with SMTP id f4so1951028wrp.21
 for <qemu-riscv@nongnu.org>; Fri, 22 May 2020 10:26:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xzyCO16+5RviPogg4wPbJiKI85apokjUkaWsspBCPSs=;
 b=q1+AANKE/zwLPQ6uJji/RTDUy3OeJyCTYvcev/pFLlROX84lE3qO9di+n4uYEFNnUT
 X3ijQZ53gj37+ExlSQEgNKZVPbR/LCcwyMEO/k5GEKPwkngpEOF0QugEy3B8ZvPyo26K
 VktgRm2phtkaqCNmlSX5d+HNexcz1HVAJaGt0gg8OKrlfRBG1E6ZcYyw3orMKRLqHmxY
 a+NDMj5v9MrKRnW2Tu+v5tUSUokcR+hRB9307qlsuBV9XDK1n+mu8/oYwNyjzzm8P7e3
 iTOhrvuSsr/5RJ0z8gn6BTQ2dnqx/Pll57AUCmKQjpuIpz0wpzgH7+k38Sfn6xH7wEFe
 E+Rg==
X-Gm-Message-State: AOAM532FVZHSvQ6GoiOeK7qQuF6Tic/85gLOTT6agntFUWAZ950CQUDH
 37IaKZxk/Tuax1Qee7k/gcqzbBaZkALUkuqcpa1dNBvTOVEtEUahflYHXxHgiR+Sc3yPeNR0XfT
 Bg7NhB9ZzlIiKehA=
X-Received: by 2002:a5d:5682:: with SMTP id f2mr4052280wrv.382.1590168376120; 
 Fri, 22 May 2020 10:26:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7XwVQFkjIva/AMLjP3gw8uCZWFWC/IKnTFQiIcY1lLZG4Q16GQSx0wMepR3SdEsRAPzQJDw==
X-Received: by 2002:a5d:5682:: with SMTP id f2mr4052267wrv.382.1590168375908; 
 Fri, 22 May 2020 10:26:15 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id c140sm10543216wmd.18.2020.05.22.10.26.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 10:26:15 -0700 (PDT)
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
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v4 13/13] stubs: Restrict ui/win32-kbd-hook to system-mode
Date: Fri, 22 May 2020 19:25:10 +0200
Message-Id: <20200522172510.25784-14-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200522172510.25784-1-philmd@redhat.com>
References: <20200522172510.25784-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/22 10:36:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Fri, 22 May 2020 17:26:22 -0000

In Makefile.objs, the ui/ directory is restricted to system-mode:

 43 ifeq ($(CONFIG_SOFTMMU),y)
 ...
 65 common-obj-y += ui/
 66 common-obj-m += ui/
 ...
 82 endif # CONFIG_SOFTMMU

Restrict the ui/ stub added in commit 2df9f5718df to only build
it for system-mode emulation.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Cc: Volker Rümelin <vr_qemu@t-online.de>
Cc: Gerd Hoffmann <kraxel@redhat.com>
---
 stubs/Makefile.objs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/stubs/Makefile.objs b/stubs/Makefile.objs
index f54125de31..c1e43ac68f 100644
--- a/stubs/Makefile.objs
+++ b/stubs/Makefile.objs
@@ -23,7 +23,7 @@ stub-obj-y += sysbus.o
 stub-obj-y += tpm.o
 stub-obj-y += trace-control.o
 stub-obj-y += vmstate.o
-stub-obj-y += win32-kbd-hook.o
+stub-obj-$(CONFIG_SOFTMMU) += win32-kbd-hook.o
 
 #######################################################################
 # code used by both qemu system emulation and qemu-img
-- 
2.21.3


