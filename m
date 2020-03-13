Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jCpBK-0007wz-5T
	for mharc-qemu-riscv@gnu.org; Fri, 13 Mar 2020 14:37:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53286)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jCpBH-0007qf-Q4
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 14:37:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jCpBG-0002T2-RP
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 14:37:11 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:51695
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jCpBG-0002Rr-NG
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 14:37:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584124629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QzUdM1ZagK75BIGV+iiLIHXu9NBWzrOD4R++sxCHDoI=;
 b=a1ctCp124O9hJqJJ8pgJgQiCBuXhNXYkVltnflY4kyudFl5yOgQ7sk711H2R0IpKWzkza/
 MsZhzz/Vt1T7yrl1/ikKJ9jHW46Uv1ituvYlTgpNcLYOWaoMOEXHld1a9RasmUegaD76is
 F55uCaUKvqO7ryW4JLskDQ9KWLzFLzk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-Sy2jTw6eMeWQyeGDoUuhhQ-1; Fri, 13 Mar 2020 14:37:08 -0400
X-MC-Unique: Sy2jTw6eMeWQyeGDoUuhhQ-1
Received: by mail-wm1-f71.google.com with SMTP id a13so3791364wme.7
 for <qemu-riscv@nongnu.org>; Fri, 13 Mar 2020 11:37:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=intvWc0QjhhlSzR1IDRa0EVk0LsfQ2/cVL2atlURA2k=;
 b=XCzunY82njJ/Cl7cGtUDQIXiGaPrCw6++HOgbhha4AOeygIZSYD0Et9l49EeHQ8ZoY
 jmTwyHZou6OKZeBM7u1SnJ68Yhu3ioJaGIuAI5ipqr0aDNLOiowDnDdcTUfysBDO7ZQl
 +et4tgoOmHB672wIs/T2+GkLxkJZ67nIFwKboe4O8s4Sqm6y8Bn9VTxX7O5ajTGEdm/C
 JXSIEiaQiybwkYt6RTZ7F5dL/vB6HfNs1S0HUdh4A0erebGipaS/CiyB8TnCd3NsM6rm
 SM4dXls6/6pgZND5v3Ddja3J0tqgp1/4WI4t/62XjV9cW0nLKZFe9Ya9DJgiRSLS4Vlr
 FpJA==
X-Gm-Message-State: ANhLgQ3eSxazJcEdSBSD7AbNDsmGFW9VDiXlls2Zk+9sfGlscHGzdnCP
 nmGecFYtJQRbbV7nq/aK/NG9AqB0CqS3sS8ckJ6OjXck8aBEkmbjYkc4gND0YNzTki0+nwq1ZJk
 6RDqaFNHoNz7PN4c=
X-Received: by 2002:a7b:cc06:: with SMTP id f6mr7730337wmh.65.1584124626709;
 Fri, 13 Mar 2020 11:37:06 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vs6LWJfbWP4kFQvfej2dGXUhXsnUPkGfYqWd+58D4W2bm/r9A5Xs2YTAiB5KtkiaaAcwYQ9sw==
X-Received: by 2002:a7b:cc06:: with SMTP id f6mr7730297wmh.65.1584124626502;
 Fri, 13 Mar 2020 11:37:06 -0700 (PDT)
Received: from x1w.redhat.com (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id 62sm27365177wri.30.2020.03.13.11.37.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2020 11:37:05 -0700 (PDT)
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
Subject: [PATCH 02/14] configure: Avoid building TCG when not needed
Date: Fri, 13 Mar 2020 19:36:40 +0100
Message-Id: <20200313183652.10258-3-philmd@redhat.com>
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
X-Received-From: 205.139.110.61
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
X-List-Received-Date: Fri, 13 Mar 2020 18:37:12 -0000

Avoid building TCG when building only tools:

  ./configure --enable-tools --disable-system --disable-user

This saves us from running the soft-float tests enabled since
commit 76170102508.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 configure | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/configure b/configure
index eb49bb6680..c2ffcb0431 100755
--- a/configure
+++ b/configure
@@ -1650,6 +1650,10 @@ if [ "$ARCH" =3D "unknown" ]; then
   linux_user=3D"no"
 fi
=20
+if [ "$bsd_user" =3D "no" -a "$linux_user" =3D "no" -a "$softmmu" =3D "no"=
 ] ; then
+  tcg=3D"no"
+fi
+
 default_target_list=3D""
=20
 mak_wilds=3D""
--=20
2.21.1


