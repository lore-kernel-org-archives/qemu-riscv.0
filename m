Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903B2606A320
	for <qemu-riscv@archiver.kernel.org>; Tue, 27 Oct 2026 21:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QNhMcPry
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xLoVT-0006JQ-Jc; Tue, 27 Oct 2026 17:14:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1xLoVI-0006If-Lk
 for qemu-riscv@nongnu.org; Tue, 27 Oct 2026 17:14:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1xLoVE-0004ul-Q2
 for qemu-riscv@nongnu.org; Tue, 27 Oct 2026 17:14:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1793135676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=A6CTgTOgYlFCYkkhKt3b0AM3/EI4NmjmVT/AVxhYtRA=;
 b=QNhMcPrylGE6NF7GFkuMWQM+UgUMUMv4xhaYvHYLM3TPkU50bbB7ndKaybsJnqYEawRBg6
 hbP2MnSa9PjLctFmT4i1IyZxto7/zS/3xX2JSJFxOPNpHaag+ecvLX79ur1nwHyfrYLRZ9
 +bquMcBpFftJH3U/1c1JnDd3ujkQrhI=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-678-2CjxF7pjPHCKbEy8vrbJRA-1; Tue,
 27 Oct 2026 17:13:20 -0400
X-MC-Unique: 2CjxF7pjPHCKbEy8vrbJRA-1
X-Mimecast-MFC-AGG-ID: 2CjxF7pjPHCKbEy8vrbJRA_1793135599
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 4E4BF195422F; Tue, 27 Oct 2026 21:13:18 +0000 (UTC)
Received: from kchamart.csb (headnet04.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.116])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 1ED0F1955F08; Tue, 27 Oct 2026 21:13:15 +0000 (UTC)
Date: Tue, 27 Oct 2026 22:13:13 +0100
From: Kashyap Chamarthy <kchamart@redhat.com>
To: linux-riscv@lists.infradead.org, qemu-riscv@nongnu.org,
 kvm-riscv@lists.infradead.org
Subject: [CFP] RISC-V Devroom at FOSDEM 2027
Message-ID: <auET6VbZLtXTUDsQ@kchamart.csb>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZVfRcNYbm6bxPMe9xkKAM3qmt3O1Qua9sJMb4ckIeKg_1793135599
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 5
X-Spam_score: 0.5
X-Spam_bar: /
X-Spam_report: (0.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello!

We are pleased to announce[1] the Call for Participation (CFP) for the
RISC-V devroom at FOSDEM 2027.  

FOSDEM 2027 (https://fosdem.org/2027/) will take place on the 30th and
31st January, 2027 in Brussels, Belgium.

The RISC-V devroom is on January 31st (Sunday afternoon).

Important dates
---------------

- 01 December   2026: Talk submission deadline
- 15 December   2026: Final schedule announcement
- 31 January    2027: RISC-V devroom

About the RISC-V devroom
------------------------

The RISC-V devroom aims to bring software & firmware developers,
toolchain maintainers, and hardware designers to discuss upstreaming
efforts and hard technical problems that can't be solved over email.
This devroom is a collaborative effort, and is organized by folks
actively working in the RISC-V ecosystem.

Suggested topics
----------------

Any RISC-V-related topics that fit the spirit of free and open source
software (FOSS) are welcome.  Some topics to consider:

  - RISC-V hardware (e.g. cores, SoCs, accelerators)
  - Operating system porting, kernels, and hypervisors
  - Toolchains: compilers, linkers, and debuggers
  - Firmware and boot (e.g. OpenSBI, EDK2, U-Boot)
  - Emulation (e.g. QEMU, Spike)
  - ISA-level updates relevant to the Linux ecosystem and RVA23
    readiness
  - Performance and correctness tools (e.g. perf, Valgrind)
  - Language runtimes and their RISC-V enablement, maintenance, and
    performance (e.g. Go, OpenJDK, Node.js, Rust, Python)
  - Package ecosystems and build systems (e.g. riscv64 prebuilt packages
    and build support across npm, pip, Cargo, Maven, Go modules)
  - Applications and middleware (e.g. riscv64 porting, RVV-optimized
    code paths)

We are also interested in experience reports and technical work that
help make complete, production-relevant FOSS workloads available,
usable, and well-supported on RISC-V. 

Submit a talk
-------------

Please visit the FOSDEM 2027 Pretalx website:
https://pretalx.fosdem.org/fosdem-2027/cfp.  Your submission should
include:

- The title and subtitle of your talk (please be clear and descriptive)
- Select "RISC-V devroom" as the track
- A good abstract of a couple of paragraphs (be thoughtful with AI use)
- A short bio and contact information
- Relevant URLs

We suggest a talk length of 15-20 minutes plus 5 minutes of Q&A, since
the devroom runs for half a day this year.  With good planning, one can
pack quite a punch in 15 minutes.

Presentations will be recorded and streamed.  Sending your proposal
implies giving permission to have your presentation recorded and
distributed together with your slides under a Creative Commons CC-BY
license.


Regards,
Kashyap Chamarthy
Ludovic Henry
(On behalf of the devroom committee)

		* * *

[1] Also on the FOSDEM list:
    https://lists.fosdem.org/hyperkitty/list/fosdem@lists.fosdem.org/thread/K63XKEFUWSSZF6UTWFXFOPO5F2GNM3XX/


