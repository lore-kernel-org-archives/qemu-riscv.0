Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 603CDC43458
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 11:44:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wi9dY-0004lU-Th; Fri, 10 Jul 2026 07:43:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1wi9dX-0004kT-B2
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 07:43:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1wi9dS-00088h-16
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 07:43:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1783683792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NVa9Jhpk/DOy6Dye0WvlpH7ON0y8rJ710rrHDJdtfx0=;
 b=ZtbDaVQJeet6ZXXQCJxEDRr1xoB+wiQ8ONEZRm8NqAMIkNNqwjjfcIboESJWM1F7VhcGrx
 1NswYD5fXD6K5H8EpZOrXo4K6hdXC/1pAv1Zxtj7yCPueKNVB8A3dAmQ+DAQlgK5KWH8yi
 YLjckyMlF7M5Xu/lp6Aw4uFLXq5oS2M=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-344-KBJwp3iMNFmi2KAkpwhzIg-1; Fri,
 10 Jul 2026 07:43:09 -0400
X-MC-Unique: KBJwp3iMNFmi2KAkpwhzIg-1
X-Mimecast-MFC-AGG-ID: KBJwp3iMNFmi2KAkpwhzIg_1783683788
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 3C98E19560B6; Fri, 10 Jul 2026 11:43:08 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.44.22.4])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id CC72A1800347; Fri, 10 Jul 2026 11:43:07 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 52A6821E6920; Fri, 10 Jul 2026 13:43:05 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, qemu-riscv@nongnu.org, bin.meng@processmission.com,
 mzamazal@redhat.com, mst@redhat.com, sgarzare@redhat.com
Subject: [PATCH 0/2] MAINTAINERS: Mark sections orphaned
Date: Fri, 10 Jul 2026 13:43:03 +0200
Message-ID: <20260710114305.2961898-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: oYOqbYV_qisjLUMHC2_eeFjG9AzKpGPWkrMc6ZPNsfs_1783683788
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

"S: Supported" without an M: makes no sense.  Change to S: Orphan.

If you want them to remain supported, please find a maintainer.

We could do "S: Odd fixes" for "vhost-user-scmi", since it has an R:.
Milan, you decide.

Markus Armbruster (2):
  MAINTAINERS: Mark "Microchip PolarFire SoC Icicle Kit" orphaned
  MAINTAINERS: Mark "vhost-user-scmi" orphaned

 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.54.0


