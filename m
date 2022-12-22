Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p8KNB-0007Ua-RE
	for mharc-qemu-riscv@gnu.org; Thu, 22 Dec 2022 07:08:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p8KN9-0007Ro-8d
 for qemu-riscv@nongnu.org; Thu, 22 Dec 2022 07:08:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p8KN2-0004Yg-Nv
 for qemu-riscv@nongnu.org; Thu, 22 Dec 2022 07:08:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671710899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j3uM8RpKhBaSx4HGrEkRlS0tuMuWREecwrjQoZcx4/Y=;
 b=i2/MN3wycOxuqMnfHaqQdBuprT3Zqs5JQSSM+GLu+YiYJHDvtY2vPjStAy6rqW1myCDAmU
 HyInu36uu+q+EyUwAGuvpsnCrax1/SzMG0TzqSx1eZSsHRGu/PcJ3oOHl1cJELWWneKUZc
 0ssC1j1TE1zBH239UGFZwxdjWQyPi/8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-418-hzmqdjV5OFa1ocu-HF7Fyw-1; Thu, 22 Dec 2022 07:08:16 -0500
X-MC-Unique: hzmqdjV5OFa1ocu-HF7Fyw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7D53485C064;
 Thu, 22 Dec 2022 12:08:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 67CA3C16029;
 Thu, 22 Dec 2022 12:08:14 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4E5B821E6935; Thu, 22 Dec 2022 13:08:13 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca,
 peter.maydell@linaro.org, laurent@vivier.eu, edgar.iglesias@gmail.com,
 Alistair.Francis@wdc.com, bin.meng@windriver.com, palmer@dabbelt.com,
 marcel.apfelbaum@gmail.com, yangxiaojuan@loongson.cn, gaosong@loongson.cn,
 richard.henderson@linaro.org, deller@gmx.de, jasowang@redhat.com,
 vikram.garhwal@amd.com, francisco.iglesias@amd.com, clg@kaod.org,
 kraxel@redhat.com, marcandre.lureau@redhat.com, riku.voipio@iki.fi,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 crwulff@gmail.com, marex@denx.de, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 4/4] docs/devel: Rules on #include in headers
Date: Thu, 22 Dec 2022 13:08:13 +0100
Message-Id: <20221222120813.727830-5-armbru@redhat.com>
In-Reply-To: <20221222120813.727830-1-armbru@redhat.com>
References: <20221222120813.727830-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Dec 2022 12:08:27 -0000

Rules for headers were proposed a long time ago, and generally liked:

    Message-ID: <87h9g8j57d.fsf@blackfin.pond.sub.org>
    https://lists.nongnu.org/archive/html/qemu-devel/2016-03/msg03345.html

Wortk them into docs/devel/style.rst.

Suggested-by: Bernhard Beschow <shentey@gmail.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 docs/devel/style.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/docs/devel/style.rst b/docs/devel/style.rst
index 7ddd42b6c2..68aa776930 100644
--- a/docs/devel/style.rst
+++ b/docs/devel/style.rst
@@ -293,6 +293,13 @@ that QEMU depends on.
 Do not include "qemu/osdep.h" from header files since the .c file will have
 already included it.
 
+Headers should normally include everything they need beyond osdep.h.
+If exceptions are needed for some reason, they must be documented in
+the header.  If all that's needed from a header is typedefs, consider
+putting those into qemu/typedefs.h instead of including the header.
+
+Cyclic inclusion is forbidden.
+
 C types
 =======
 
-- 
2.38.1


