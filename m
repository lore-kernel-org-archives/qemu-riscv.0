Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kDW61-0006cU-Q0
	for mharc-qemu-riscv@gnu.org; Wed, 02 Sep 2020 12:58:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kDW60-0006c5-29
 for qemu-riscv@nongnu.org; Wed, 02 Sep 2020 12:58:52 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:35788
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kDW5y-0008B9-3g
 for qemu-riscv@nongnu.org; Wed, 02 Sep 2020 12:58:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599065929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GuwnEfz3+aHD+oGsjoQKFlJwr0H33ODfNHTd1UmoxIQ=;
 b=eH4FyIKVg/mSPK8C7nY0CTGiH4t1aM3O85e4iInzH5VdjkM7aByQPkWst3zxWXypl1Jt20
 TOMMDTQRI88mA7CAM91WvNmImBLVzH47v13vXka7MTa+XMWoDnojniw9YxYehvcFyas/Rg
 6UIf9qERx1OwoZtUfSjZ8BwpuoIab9o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101--CInyBDfNde0D3vu_crBNQ-1; Wed, 02 Sep 2020 12:58:29 -0400
X-MC-Unique: -CInyBDfNde0D3vu_crBNQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D1EA18BFEC2;
 Wed,  2 Sep 2020 16:58:22 +0000 (UTC)
Received: from localhost (ovpn-66-226.rdu2.redhat.com [10.10.66.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C37307E315;
 Wed,  2 Sep 2020 16:57:49 +0000 (UTC)
Date: Wed, 2 Sep 2020 12:57:49 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Juan Quintela <quintela@redhat.com>, Richard Henderson <rth@twiddle.net>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Amit Shah <amit@kernel.org>,
 Stefan Berger <stefanb@linux.ibm.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Greg Kurz <groug@kaod.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Rob Herring <robh@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Jan Kiszka <jan.kiszka@web.de>, Andrzej Zaborowski <balrogg@gmail.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Radoslaw Biernacki <rad@semihalf.com>, Leif Lindholm <leif@nuviainc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Gerd Hoffmann <kraxel@redhat.com>, Michael Walle <michael@walle.cc>,
 Sarah Harris <S.E.Harris@kent.ac.uk>,
 Michael Rolnik <mrolnik@gmail.com>, John Snow <jsnow@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Fabien Chouteau <chouteau@adacore.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Alberto Garcia <berto@igalia.com>, Thomas Huth <huth@tuxfamily.org>,
 Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Helge Deller <deller@gmx.de>,
 Corey Minyard <cminyard@mvista.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paul Durrant <paul@xen.org>, Huacai Chen <chenhc@lemote.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Paul Burton <pburton@wavecomp.com>, Jiri Slaby <jslaby@suse.cz>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Andrew Jeffery <andrew@aj.id.au>, Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Jiri Pirko <jiri@resnulli.us>,
 Sven Schnelle <svens@stackframe.org>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Fam Zheng <fam@euphon.net>,
 Hannes Reinecke <hare@suse.com>, Beniamino Galvani <b.galvani@gmail.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Pierre Morel <pmorel@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Ben Warren <ben@skyportsystems.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Magnus Damm <magnus.damm@gmail.com>, Peter Xu <peterx@redhat.com>,
 Sergio Lopez <slp@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Laszlo Ersek <lersek@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Anup Patel <anup.patel@wdc.com>, Eric Farman <farman@linux.ibm.com>,
 Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Zhang Chen <chen.zhang@intel.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Anthony Green <green@moxielogic.com>,
 Stafford Horne <shorne@gmail.com>, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 kvm@vger.kernel.org, xen-devel@lists.xenproject.org,
 qemu-riscv@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Alistair Francis <Alistair.Francis@wdc.com>, Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v4 00/18] qom: Automated conversion of type checking
 boilerplate
Message-ID: <20200902165749.GF4940@habkost.net>
References: <20200831210740.126168-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200831210740.126168-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Received-SPF: pass client-ip=207.211.31.120; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 02:07:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 02 Sep 2020 16:58:52 -0000

On Mon, Aug 31, 2020 at 05:07:22PM -0400, Eduardo Habkost wrote:
> Latest version of this series can be found at the branch:
> https://github.com/ehabkost/qemu-hacks/tree/work/qom-macros-autoconvert
> 
> This is an extension of the series previously submitted by
> Daniel[1], including a script that will convert existing type
> checker macros automatically.
> 
> [1] https://lore.kernel.org/qemu-devel/20200723181410.3145233-1-berrange@redh=
> at.com/
> 
> Link to series v4:
> https://github.com/ehabkost/qemu-hacks/tree/work/qom-macros-autoconvert-v4

I'm queueing this on machine-next.

-- 
Eduardo


