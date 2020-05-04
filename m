Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jVd2J-00043b-Ca
	for mharc-qemu-riscv@gnu.org; Mon, 04 May 2020 11:29:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jVd2I-000411-5d
 for qemu-riscv@nongnu.org; Mon, 04 May 2020 11:29:38 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:53830
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jVd2H-0003tM-9a
 for qemu-riscv@nongnu.org; Mon, 04 May 2020 11:29:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588606176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ei7SOVVuE+0viBbYO1EoWop8dzPwWo/vHebFwwQKvZQ=;
 b=fDjTqtwpHbsj19WtH7qzEvqwMekeGWR2u8EBtSpGMirKkd1yqXQwKCbyPitTQFYHXFV9KP
 Mx3e9A7fRurzuvCtVTm0dqD4BCtS6JbfyRThlYmb1pHwl+rKeqf2mrXGPK+BjROWagOmf/
 7SrFcupYmFMvJH0mHhV8olhFyvVdSdE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-8j0_4AqJMAKlrYwoqgJ2ew-1; Mon, 04 May 2020 11:29:35 -0400
X-MC-Unique: 8j0_4AqJMAKlrYwoqgJ2ew-1
Received: by mail-wm1-f71.google.com with SMTP id 71so3695210wmb.8
 for <qemu-riscv@nongnu.org>; Mon, 04 May 2020 08:29:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vZCuoZiD4IRNnZTiI2MM/hCx+AjU6u4qhG4CWjbwLPo=;
 b=BysNqANwC/knLdwgPFg6dkOPKWthP5F3ZMMlFHFrdM5QHNBLJg5bsoB4GTVTnlcLr3
 c9wCeGpR4SRSqvb6sUWYTtDxN8gtLKemNViu5NTwKpjg3EOPxyG602q/Xe6eV9KcQrSJ
 6t1W3njCf1yhj3ubk+lMJqCfg7NKjU6obI8HjCRhknqL47kAxSZ4G3IPRXKATZV1MCRh
 ZhcwVzVlBbIzs5MDieRJ00ucEdfT5KwToJa6IPvzeLw4/TTzf7+mmtaAzvZscvn/XrHd
 LScIokRUUztZ173U/EbCoOlT2gVBRn9gcAzytpxKX+gf/Ih33XGpA0giyvaXuf+c+vez
 R+lA==
X-Gm-Message-State: AGi0PuZUf+y0ztwMAXeVsy3Ke5KOZeU5RuUYTLpeM3w9GFKE3ol7sGkn
 V//G3TLDoJ7VrOAiTnK26IjJsEThmLJ4EwasEIZoC0FrORdNj45aJqvlCK3WzNo5zXOJUZyjk1B
 sZzxcpcBmxjPbuGo=
X-Received: by 2002:adf:c508:: with SMTP id q8mr2250073wrf.4.1588606173995;
 Mon, 04 May 2020 08:29:33 -0700 (PDT)
X-Google-Smtp-Source: APiQypLaNr/8MxdS7YNFnI5jOm0Afaw6PoxYBhkkpOR8c3/79C9lMVjKU9C7uf6saK9m0gIDn8/psQ==
X-Received: by 2002:adf:c508:: with SMTP id q8mr2250050wrf.4.1588606173846;
 Mon, 04 May 2020 08:29:33 -0700 (PDT)
Received: from x1w.redhat.com (26.red-88-21-207.staticip.rima-tde.net.
 [88.21.207.26])
 by smtp.gmail.com with ESMTPSA id a187sm14023946wmh.40.2020.05.04.08.29.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 08:29:33 -0700 (PDT)
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
Subject: [PATCH v3 02/12] configure: Avoid building TCG when not needed
Date: Mon,  4 May 2020 17:29:12 +0200
Message-Id: <20200504152922.21365-3-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200504152922.21365-1-philmd@redhat.com>
References: <20200504152922.21365-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/04 01:21:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
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
X-List-Received-Date: Mon, 04 May 2020 15:29:38 -0000

Avoid building TCG when building only tools:

  ./configure --enable-tools --disable-system --disable-user

This saves us from running the soft-float tests enabled since
commit 76170102508.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 configure | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/configure b/configure
index 23b5e93752..e3b4afbb60 100755
--- a/configure
+++ b/configure
@@ -1663,6 +1663,10 @@ if [ "$ARCH" =3D "unknown" ]; then
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
2.21.3


