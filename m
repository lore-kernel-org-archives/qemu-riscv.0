Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jCpBR-0008EX-IS
	for mharc-qemu-riscv@gnu.org; Fri, 13 Mar 2020 14:37:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53544)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jCpBO-00086q-Hk
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 14:37:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jCpBN-0002mI-AB
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 14:37:18 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:52663
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jCpBN-0002kn-6R
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 14:37:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584124636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S10AEwUkiwmQGgsU4J5LemLC20/NIYdtHAyFHsvDHiI=;
 b=H9qpdrhy1fQh2I4owuls9PluUTblWdaR+Q0grcCEagHBbSiDmhUQmQ0omrJoMWB4dHyGSA
 9i7PCQXB99DXD0nDNyBDLH12cHqKwaxgXhwFYjqvpiQER3XftW+d0noq0DWqZ73p1nqhE5
 00xig2yFZFM11LAo/uUw7mxKabE0Ifk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-lCmyIepyPT69dcSUAcrBiA-1; Fri, 13 Mar 2020 14:37:14 -0400
X-MC-Unique: lCmyIepyPT69dcSUAcrBiA-1
Received: by mail-wr1-f69.google.com with SMTP id j17so4722955wru.19
 for <qemu-riscv@nongnu.org>; Fri, 13 Mar 2020 11:37:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i8/Rx/aNeBnn+CcI3JJAXpd+80BCLbOpEr5mf5Uimz0=;
 b=RnKI/ZTAFvcWKDfHwx1wPsEijp4cQwWgaClCuX3j/JlCk8JPasUbcz++ilLdL6QZp8
 r3vjpSoMign+A9AGr9t1CwSEV01IQhVjmUvoS+kpuvCcmo/FSMqouWEofQOZFFshMIjb
 AXVIGb3+lNtv/3MlF6N6GI5UiW2Sxj2m2/e4jDrco6dbe7CJNnO9f9ARGMdKx5v++MAi
 h9McQbObWuCkFYQoXBHJ+elfGJ4bCJbNeXU/+jtHo4MlyXcCNaVjWJoAc+bidMsZdCh0
 RgsAyJNW5batcogSNnSf1E19fkx6W/32bz7paGgpOaFSlnvoWsb4wjdbSb+5WjCUfnxl
 nZgw==
X-Gm-Message-State: ANhLgQ20pyCoxSXizAJsONT6AqCbiJAqGhBhd56KaziTHDxEi0L9BSw+
 PNKzAnMnPgNpkEGoaAb+V1uyvNqqT4RSoWIXlqGDq8AMk9UxWRNTYgvh8v0PdldbVKHKceBWFB5
 Ovl2PayEEI/NE6QE=
X-Received: by 2002:a05:600c:410b:: with SMTP id
 j11mr12489589wmi.86.1584124631686; 
 Fri, 13 Mar 2020 11:37:11 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vu/qxzsZj4OctuTP1fk9ERHzqfCWjsfuuUpA+8Y3q0rSgZ7lUB+w0i6WGOhrqKLGDzRhHNS3g==
X-Received: by 2002:a05:600c:410b:: with SMTP id
 j11mr12489569wmi.86.1584124631400; 
 Fri, 13 Mar 2020 11:37:11 -0700 (PDT)
Received: from x1w.redhat.com (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id q13sm29664354wrs.91.2020.03.13.11.37.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2020 11:37:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-ppc@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-s390x@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <rth@twiddle.net>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-arm@nongnu.org,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 03/14] tests/Makefile: Only display TCG-related tests when TCG
 is available
Date: Fri, 13 Mar 2020 19:36:41 +0100
Message-Id: <20200313183652.10258-4-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200313183652.10258-1-philmd@redhat.com>
References: <20200313183652.10258-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
X-List-Received-Date: Fri, 13 Mar 2020 18:37:19 -0000

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 tests/Makefile.include | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 67e8fcddda..99db5eb3e0 100644
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
2.21.1


