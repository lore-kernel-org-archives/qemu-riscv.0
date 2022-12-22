Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p8KOz-00089E-DU
	for mharc-qemu-riscv@gnu.org; Thu, 22 Dec 2022 07:10:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p8KOw-00088G-IS
 for qemu-riscv@nongnu.org; Thu, 22 Dec 2022 07:10:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p8KOu-0004wi-1x
 for qemu-riscv@nongnu.org; Thu, 22 Dec 2022 07:10:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671711015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SmuOKcmhc5P8kB9mxDdXSAF3BAiFiDucFWG7ceOtKqM=;
 b=MOmpzW/sPNe7f6Pp05q/XUHsL7A8jdxWe0dr5ro+KrSX/ixZaLZ3BVELXmQO8kb77FHD1F
 pV16x0aLOROTQKPVJi2/JDWWfzEIrllCqejRimZCT89YVYNSj/h98iabQHCTYSsalZbBgQ
 ehWsjzTNtGtWTSfnj232mzQuyXouy5o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-KAq2bMT9MyuSYtgLgzcndg-1; Thu, 22 Dec 2022 07:10:10 -0500
X-MC-Unique: KAq2bMT9MyuSYtgLgzcndg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4651B85C1A4;
 Thu, 22 Dec 2022 12:10:09 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C35534014EB9;
 Thu, 22 Dec 2022 12:10:08 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9FEA821E691D; Thu, 22 Dec 2022 13:10:07 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org,  imammedo@redhat.com,  ani@anisinha.ca,
 peter.maydell@linaro.org,  laurent@vivier.eu,  edgar.iglesias@gmail.com,
 Alistair.Francis@wdc.com,  bin.meng@windriver.com,  palmer@dabbelt.com,
 marcel.apfelbaum@gmail.com,  yangxiaojuan@loongson.cn,
 gaosong@loongson.cn,  richard.henderson@linaro.org,  deller@gmx.de,
 jasowang@redhat.com,  vikram.garhwal@amd.com,
 francisco.iglesias@amd.com,  clg@kaod.org,  kraxel@redhat.com,
 marcandre.lureau@redhat.com,  riku.voipio@iki.fi,  qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org,  qemu-ppc@nongnu.org,  crwulff@gmail.com,
 marex@denx.de
Subject: Re: [PATCH v2 0/4] Clean up includes
References: <20221222120813.727830-1-armbru@redhat.com>
Date: Thu, 22 Dec 2022 13:10:07 +0100
In-Reply-To: <20221222120813.727830-1-armbru@redhat.com> (Markus Armbruster's
 message of "Thu, 22 Dec 2022 13:08:09 +0100")
Message-ID: <871qorej1c.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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
X-List-Received-Date: Thu, 22 Dec 2022 12:10:18 -0000

Michael, I forgot to add your R-bys.  I'll fix that in the next
revision if I need one, else in the pull request.


