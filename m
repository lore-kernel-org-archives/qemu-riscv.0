Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jCpBu-0000uw-DR
	for mharc-qemu-riscv@gnu.org; Fri, 13 Mar 2020 14:37:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54484)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jCpBr-0000me-76
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 14:37:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jCpBq-0004Kq-4E
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 14:37:47 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:54610
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jCpBp-0004JS-W1
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 14:37:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584124665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wGoD8B/E7ALRdyPVkuOPFi6qepohKGtXhwvJlBp3QNU=;
 b=I3/44eZM7F9dP2rtD1alcB3gGQX+6OJ8XG5ShCI4lcLC4AmTcWx7SZAbu5GI4pDJtq+9Li
 5WGEv1AqV4pkxzVuJfbdKpWYpYxN796sX8pbRi5omDQEw+euzPYN4b3Xoop5jsiykbJ0V+
 FCNlsoIoctJ/fmGtqjZqQQjC2ArLBbU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-EdWluhlqPXWvntfL-jngTQ-1; Fri, 13 Mar 2020 14:37:44 -0400
X-MC-Unique: EdWluhlqPXWvntfL-jngTQ-1
Received: by mail-wm1-f70.google.com with SMTP id e26so3289646wmk.8
 for <qemu-riscv@nongnu.org>; Fri, 13 Mar 2020 11:37:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T76tUQ+vOJYR7iIj3p+P6wqlEgQ0pagAj6PhTCTXdsc=;
 b=ayHMkhxWRo4eirTK0qhbxzi4MMqYfpJJfv5lInkC+6WF3iZcAgdggUkv6Punlg/2JJ
 aL74+N8HX+GrLo31Zp3jdVeRLR++69l4L1O170CgADCey5OflEmQecZFtM+VwST9xZgk
 XyFnqXJTqaZtu9lEC/Kkz3fw8EJ+CMMozNucQuIlBsrEhm/JK9MfcBd5ZHSLH1GQrf73
 2WwQFRzdISLAuamVZLiMrpRuesvfdzNbJKNZWt7VbXdj/6dhe7v5hZem1jUK0yKhscx8
 NUCOxQs+sm2v+JaUvMcWRnCHD9ib/sNXCQAnXBRBO90ZvQPetizg3CV9NUsAdNLqVhEH
 YnQg==
X-Gm-Message-State: ANhLgQ3xdfhybXVxYcc/ef0nBb3uuscz/fHbxCFTnyxyvvu6wtUPb3jL
 PdxPkKO12rl3fDJUOUpuaSLMROVe6eyel1fnqUGEShe/plqmKW4zJY2+TfGglRoAwpcHW0T8mkZ
 AYSjtIYlmt3ogNhM=
X-Received: by 2002:a7b:ce94:: with SMTP id q20mr11560601wmj.157.1584124661705; 
 Fri, 13 Mar 2020 11:37:41 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vt55lOk8cq/FfDyGsqCjNX/EF/f1KG2Wt2coox2gOYadwCTOT9928FGmsSSu/bYROjhTtyiSQ==
X-Received: by 2002:a7b:ce94:: with SMTP id q20mr11560582wmj.157.1584124661544; 
 Fri, 13 Mar 2020 11:37:41 -0700 (PDT)
Received: from x1w.redhat.com (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id w10sm4132784wrr.49.2020.03.13.11.37.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2020 11:37:40 -0700 (PDT)
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
Subject: [PATCH 09/14] exec: Drop redundant #ifdeffery
Date: Fri, 13 Mar 2020 19:36:47 +0100
Message-Id: <20200313183652.10258-10-philmd@redhat.com>
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
 [fuzzy]
X-Received-From: 207.211.31.81
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
X-List-Received-Date: Fri, 13 Mar 2020 18:37:48 -0000

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 exec.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/exec.c b/exec.c
index 7bc9828c5b..f258502966 100644
--- a/exec.c
+++ b/exec.c
@@ -185,10 +185,6 @@ struct DirtyBitmapSnapshot {
     unsigned long dirty[];
 };
=20
-#endif
-
-#if !defined(CONFIG_USER_ONLY)
-
 static void phys_map_node_reserve(PhysPageMap *map, unsigned nodes)
 {
     static unsigned alloc_hint =3D 16;
--=20
2.21.1


