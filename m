Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o8lF5-0005ge-U6
	for mharc-qemu-riscv@gnu.org; Tue, 05 Jul 2022 12:17:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8lEz-0005aQ-F4
 for qemu-riscv@nongnu.org; Tue, 05 Jul 2022 12:17:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8lEw-000697-LS
 for qemu-riscv@nongnu.org; Tue, 05 Jul 2022 12:17:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657037849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uQ31Mqr3+L44dXIdkYrYq7URkNnq98G9mcflC8QTMPo=;
 b=GFHWCC983AnhNXoYMjVkGAOptLYyP1gaC/1R3CqnNl03eyLemtUNUlV8trM1D5KoDDtMNb
 gG7KYMeYM74iPQJITMM4W7LfmanVOgf7P7rgov2yBPcqSuXzWVUeHCdI1h77AzMpc40fzQ
 i9HVqpm7lUDdVGJ0skuYNUlxm3CQxF0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-507-1rG0WjcnMM2ciP70WaLBjg-1; Tue, 05 Jul 2022 12:17:26 -0400
X-MC-Unique: 1rG0WjcnMM2ciP70WaLBjg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 47AAD8F61CD;
 Tue,  5 Jul 2022 16:17:06 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD656140EBE4;
 Tue,  5 Jul 2022 16:16:59 +0000 (UTC)
From: Alberto Faria <afaria@redhat.com>
To: qemu-devel@nongnu.org
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Juan Quintela <quintela@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Eric Blake <eblake@redhat.com>, Niek Linnenbank <nieklinnenbank@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Laurent Vivier <laurent@vivier.eu>,
 Stefan Weil <sw@weilnetz.de>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-ppc@nongnu.org,
 Fam Zheng <fam@euphon.net>, Jeff Cody <codyprime@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Joel Stanley <joel@jms.id.au>, Bin Meng <bin.meng@windriver.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 John Snow <jsnow@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-riscv@nongnu.org, Greg Kurz <groug@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, "Denis V. Lunev" <den@openvz.org>,
 qemu-arm@nongnu.org, Alberto Faria <afaria@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 14/18] block: Implement blk_flush() using
 generated_co_wrapper
Date: Tue,  5 Jul 2022 17:15:22 +0100
Message-Id: <20220705161527.1054072-15-afaria@redhat.com>
In-Reply-To: <20220705161527.1054072-1-afaria@redhat.com>
References: <20220705161527.1054072-1-afaria@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 05 Jul 2022 16:17:34 -0000

Signed-off-by: Alberto Faria <afaria@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 block/block-backend.c             | 11 -----------
 block/coroutines.h                |  2 --
 include/sysemu/block-backend-io.h |  2 +-
 3 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 823c98a031..0718441b37 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1756,17 +1756,6 @@ int coroutine_fn blk_co_flush(BlockBackend *blk)
     return ret;
 }
 
-int blk_flush(BlockBackend *blk)
-{
-    int ret;
-
-    blk_inc_in_flight(blk);
-    ret = blk_do_flush(blk);
-    blk_dec_in_flight(blk);
-
-    return ret;
-}
-
 void blk_drain(BlockBackend *blk)
 {
     BlockDriverState *bs = blk_bs(blk);
diff --git a/block/coroutines.h b/block/coroutines.h
index 2693ecabfb..7e94b9fa83 100644
--- a/block/coroutines.h
+++ b/block/coroutines.h
@@ -110,6 +110,4 @@ nbd_do_establish_connection(BlockDriverState *bs, bool blocking, Error **errp);
 int generated_co_wrapper
 blk_do_ioctl(BlockBackend *blk, unsigned long int req, void *buf);
 
-int generated_co_wrapper blk_do_flush(BlockBackend *blk);
-
 #endif /* BLOCK_COROUTINES_H */
diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index 5c56737453..e6af0d0ed0 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -165,8 +165,8 @@ int generated_co_wrapper blk_pdiscard(BlockBackend *blk, int64_t offset,
 int coroutine_fn blk_co_pdiscard(BlockBackend *blk, int64_t offset,
                                  int64_t bytes);
 
+int generated_co_wrapper blk_flush(BlockBackend *blk);
 int coroutine_fn blk_co_flush(BlockBackend *blk);
-int blk_flush(BlockBackend *blk);
 
 int blk_ioctl(BlockBackend *blk, unsigned long int req, void *buf);
 
-- 
2.36.1


