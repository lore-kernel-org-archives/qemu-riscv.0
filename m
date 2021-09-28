Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mVBxn-0008SN-D3
	for mharc-qemu-riscv@gnu.org; Tue, 28 Sep 2021 08:11:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mVBxj-0008MD-BU
 for qemu-riscv@nongnu.org; Tue, 28 Sep 2021 08:11:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mVBxg-0000ku-60
 for qemu-riscv@nongnu.org; Tue, 28 Sep 2021 08:11:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632831110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZZrk8Sa31YIbiWVmHJ66JNKhskis3QqPpmnw51WX2/o=;
 b=RCW5fUc0po0jFcItvakEF/UY+m3kG7/gFnsQKFQXtoK+RVapSsSm7nn+W7vzmZOz2BFkwp
 KHixm1ru3mn0bhOPUAmf+3Q+ENa655HSdebRp535hEO9o+Wa6RvIONc1yJkiy65SfH5aDz
 2jiWHkUFjwwZjHZjo2hhxTE5i0JT5dQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-o7oXnew_MLSAw8AUsBogmg-1; Tue, 28 Sep 2021 08:11:49 -0400
X-MC-Unique: o7oXnew_MLSAw8AUsBogmg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C923F19253C0;
 Tue, 28 Sep 2021 12:11:45 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 59FE7100164A;
 Tue, 28 Sep 2021 12:11:28 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9934C18003B6; Tue, 28 Sep 2021 14:11:26 +0200 (CEST)
Date: Tue, 28 Sep 2021 14:11:26 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Laurent Vivier <laurent@vivier.eu>, Peter Xu <peterx@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-ppc@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-riscv@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Stafford Horne <shorne@gmail.com>, Huacai Chen <chenhuacai@kernel.org>,
 Halil Pasic <pasic@linux.ibm.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Bin Meng <bin.meng@windriver.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Greg Kurz <groug@kaod.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH 09/29] tcg/module: add tcg-module.[ch] infrastructure
Message-ID: <20210928121126.6t6zyrlp5dmxqdtv@sirius.home.kraxel.org>
References: <20210831121545.2874233-1-kraxel@redhat.com>
 <20210831121545.2874233-10-kraxel@redhat.com>
 <5e36f960-7b40-a55b-ddba-1f635a39941a@redhat.com>
MIME-Version: 1.0
In-Reply-To: <5e36f960-7b40-a55b-ddba-1f635a39941a@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 28 Sep 2021 12:11:55 -0000

  Hi,

> > +struct TCGModuleOps {
> > +};
> > +extern struct TCGModuleOps tcg;
> 
> TCG functions taking a CPUState argument should reside in
> CPUClass's AccelCPUClass/TCGCPUOps, not a global struct.

It's not that easy.  Tried that first, but using TCGCPUOps outside cpu
code doesn't work.

take care,
  Gerd


