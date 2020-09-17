Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kIods-0007Rx-3P
	for mharc-qemu-riscv@gnu.org; Thu, 17 Sep 2020 03:47:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kIodn-0007Oj-Ri
 for qemu-riscv@nongnu.org; Thu, 17 Sep 2020 03:47:40 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:47712
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kIodk-0004kg-BS
 for qemu-riscv@nongnu.org; Thu, 17 Sep 2020 03:47:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600328855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/1lurTq5n5TI0TwpvZGZbnQLRV2vILXZ/Cw0++RY9UM=;
 b=VXzL1pERhFFoayQYzJ2F8OivYo40cH4tvYGVqlc7PwBcr6uzSvnz8gv4nyd292sfrvXfx+
 9GAzuFxKnpWjkWAYVKLNNIO0LIgmvnIPsEWw2VqLs2FJQVwtlE+B69ke81Yv3QM5GPBUa7
 LYKElH2gC0qQbKz9Jjd7EsrSOvptQTE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-723UZI3VOhWnD206aaQuRA-1; Thu, 17 Sep 2020 03:47:33 -0400
X-MC-Unique: 723UZI3VOhWnD206aaQuRA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C9371084C96;
 Thu, 17 Sep 2020 07:47:28 +0000 (UTC)
Received: from gondolin (ovpn-113-19.ams2.redhat.com [10.36.113.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C694C5DEBF;
 Thu, 17 Sep 2020 07:46:59 +0000 (UTC)
Date: Thu, 17 Sep 2020 09:46:57 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, "Daniel P.
 Berrange" <berrange@redhat.com>, =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau
 <marcandre.lureau@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, "Michael
 S. Tsirkin" <mst@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Corey Minyard <cminyard@mvista.com>, =?UTF-8?B?Q8OpZHJpYw==?= Le Goater
 <clg@kaod.org>, David Gibson <david@gibson.dropbear.id.au>, Thomas Huth
 <thuth@redhat.com>, Halil Pasic <pasic@linux.ibm.com>, Christian
 Borntraeger <borntraeger@de.ibm.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVk?=
 =?UTF-8?B?w6k=?= <f4bug@amsat.org>, Alistair Francis
 <alistair@alistair23.me>, David Hildenbrand <david@redhat.com>, Laurent
 Vivier <lvivier@redhat.com>, Amit Shah <amit@kernel.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Anthony Perard
 <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, Fam Zheng
 <fam@euphon.net>, "Gonglei (Arei)" <arei.gonglei@huawei.com>, Igor Mammedov
 <imammedo@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>, Richard
 Henderson <rth@twiddle.net>, Michael Rolnik <mrolnik@gmail.com>, Sarah
 Harris <S.E.Harris@kent.ac.uk>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, Michael Walle <michael@walle.cc>, Aleksandar
 Markovic <aleksandar.qemu.devel@gmail.com>, Aurelien Jarno
 <aurelien@aurel32.net>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Aleksandar
 Rikalo <aleksandar.rikalo@syrmia.com>, Anthony Green
 <green@moxielogic.com>, Chris Wulff <crwulff@gmail.com>, Marek Vasut
 <marex@denx.de>, Stafford Horne <shorne@gmail.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Sagar Karandikar <sagark@eecs.berkeley.edu>, Bastian
 Koppelmann <kbastian@mail.uni-paderborn.de>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-block@nongnu.org, xen-devel@lists.xenproject.org,
 qemu-riscv@nongnu.org
Subject: Re: [PATCH 3/5] qom: Remove module_obj_name parameter from
 OBJECT_DECLARE* macros
Message-ID: <20200917094657.392c341d.cohuck@redhat.com>
In-Reply-To: <20200916182519.415636-4-ehabkost@redhat.com>
References: <20200916182519.415636-1-ehabkost@redhat.com>
 <20200916182519.415636-4-ehabkost@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/17 03:47:35
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 17 Sep 2020 07:47:40 -0000

On Wed, 16 Sep 2020 14:25:17 -0400
Eduardo Habkost <ehabkost@redhat.com> wrote:

> One of the goals of having less boilerplate on QOM declarations
> is to avoid human error.  Requiring an extra argument that is
> never used is an opportunity for mistakes.
> 
> Remove the unused argument from OBJECT_DECLARE_TYPE and
> OBJECT_DECLARE_SIMPLE_TYPE.
> 
> Coccinelle patch used to convert all users of the macros:
> 
>   @@
>   declarer name OBJECT_DECLARE_TYPE;
>   identifier InstanceType, ClassType, lowercase, UPPERCASE;
>   @@
>    OBJECT_DECLARE_TYPE(InstanceType, ClassType,
>   -                    lowercase,
>                        UPPERCASE);
> 
>   @@
>   declarer name OBJECT_DECLARE_SIMPLE_TYPE;
>   identifier InstanceType, lowercase, UPPERCASE;
>   @@
>    OBJECT_DECLARE_SIMPLE_TYPE(InstanceType,
>   -                    lowercase,
>                        UPPERCASE);
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Acked-by: Cornelia Huck <cohuck@redhat.com>


